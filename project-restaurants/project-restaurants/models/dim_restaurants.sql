{{
  config(
    materialized='table',
    schema='stg'   
  )
}}

WITH current_snapshot AS (
    SELECT
        restaurant_id,
        restaurant_name,
        cuisines,
        city,
        state_code,
        zip_code,
        updated_at
    FROM {{ ref('restaurants_snapshot') }}
    WHERE dbt_valid_to IS NULL  
)

SELECT
    cs.restaurant_id,
    cs.restaurant_name,
    cs.cuisines,
    cs.city,
    cs.state_code,
    ds.state,
    cs.zip_code,
    cs.updated_at
FROM current_snapshot cs
JOIN {{ ref('dim_states') }} ds ON cs.state_code = ds.state_code
