{% macro convert_to_timezone(target_timezone) %}
    SELECT
        CONVERT_TIMEZONE('America/Los_Angeles', '{{ target_timezone}}', CURRENT_TIMESTAMP) 
{% endmacro %}
