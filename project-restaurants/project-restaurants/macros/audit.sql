{% macro audit() %}
CREATE OR REPLACE TABLE demo.stg.audit AS
SELECT 'customers' AS table_name, COUNT(*) AS record_count FROM demo.raw.customers
UNION ALL
SELECT 'orders' AS table_name, COUNT(*) AS record_count FROM demo.raw.orders
UNION ALL
SELECT 'order_details' AS table_name, COUNT(*) AS record_count FROM demo.raw.order_details
UNION ALL
SELECT 'item_costs' AS table_name, COUNT(*) AS record_count FROM demo.raw.item_costs
UNION ALL
SELECT 'restaurants' AS table_name, COUNT(*) AS record_count FROM demo.raw.restaurants
UNION ALL
SELECT 'cuisine' AS table_name, COUNT(*) AS record_count FROM demo.raw.cuisine;
{% endmacro %}