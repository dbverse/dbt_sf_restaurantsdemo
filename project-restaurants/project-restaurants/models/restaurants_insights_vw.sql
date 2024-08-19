{{ config(
    materialized="view",
    schema="core"
) }}
WITH SalesData AS (
    SELECT
        RESTAURANT_ID,
        EXTRACT(MONTH FROM ORDER_DATE) AS ORDER_MONTH,
        EXTRACT(YEAR FROM ORDER_DATE) AS ORDER_YEAR,
        SUM(TOTAL_ITEM_COST) AS TOTAL_SALES
    FROM {{ ref('fact_orders') }}
    GROUP BY RESTAURANT_ID, EXTRACT(MONTH FROM ORDER_DATE), EXTRACT(YEAR FROM ORDER_DATE)
),
RestaurantDetails AS
(
    SELECT
    RESTAURANT_ID,
    CITY,
    STATE,
    RESTAURANT_NAME
FROM {{ ref('dim_restaurants') }}
)
SELECT
    R.RESTAURANT_NAME,
    S.TOTAL_SALES,
    S.ORDER_MONTH,
    S.ORDER_YEAR,
    R.CITY,
    R.STATE,
    ({{ convert_to_timezone('Asia/Kolkata') }}) as INSERT_TIMESTAMP
FROM SalesData S JOIN RestaurantDetails R on R.RESTAURANT_ID=S.RESTAURANT_ID
ORDER BY S.RESTAURANT_ID, S.ORDER_YEAR, S.ORDER_MONTH
