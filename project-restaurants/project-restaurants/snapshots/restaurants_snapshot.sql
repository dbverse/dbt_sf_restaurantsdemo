{% snapshot restaurants_snapshot %}

{{
  config(
    target_database='demo',
    target_schema='raw',
    strategy='timestamp',
    unique_key='restaurant_id',
    updated_at='updated_at',
    valid_from='valid_from',
    valid_to='valid_to'
  )
}}

SELECT
    r.restaurant_id,
    r.restaurant_name,
    LISTAGG(c.cuisine, ', ') WITHIN GROUP (ORDER BY c.cuisine) AS cuisines,
    r.city,
    r.state AS state_code,
    r.zip_code,
    r.updated_at
FROM {{ source('raw', 'restaurants') }} r
LEFT JOIN {{ source('raw', 'cuisine') }} c ON c.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name, r.city, r.state, r.zip_code, r.updated_at

{% endsnapshot %}
