-- models/my_model.sql
{{ config(
    materialized='table',
    schema='stg',
    post_hook= "{{ audit() }}"
    )
}}
{% set payment_methods = ["Mobile Payment", "Credit Card", "Debit Card"] %}
WITH itemized_orders AS (
    SELECT
        ro.order_id,
        ro.date AS order_date,
        ro.customer_id,
        ro.restaurant_id,
        ro.amount_paid,
        ro.payment_method,
        ro.status,
        od.item_name,
        od.quantity,
        ic.cost AS unit_cost,
        (od.quantity * ic.cost) AS total_item_cost
    FROM {{ source('raw', 'orders') }} ro
    JOIN {{ source('raw', 'order_details') }} od ON ro.order_id = od.order_id
    LEFT JOIN {{ source('raw', 'item_costs') }} ic ON ro.restaurant_id = ic.restaurant_id AND od.item_name = ic.item_name
),

order_aggregates AS (
    SELECT
        order_id,
        SUM(distinct total_item_cost) AS total_order_cost
    FROM itemized_orders
    GROUP BY order_id
),

final AS (
    SELECT
        io.order_id,
        io.order_date,
        io.customer_id,
        concat(rc.first_name, ' ', rc.last_name) as customer_name,
        io.restaurant_id,
        io.item_name,
        io.quantity,
        io.unit_cost,
        io.total_item_cost,
        oa.total_order_cost,
        io.amount_paid,
        io.payment_method,
        io.status
    FROM itemized_orders io
    JOIN order_aggregates oa ON io.order_id = oa.order_id
    JOIN {{ source('raw', 'customers') }} rc ON rc.customer_id = io.customer_id
)
SELECT 
    *,
    {{ cashbackoffer('payment_method', 'amount_paid', payment_methods) }}
FROM final
