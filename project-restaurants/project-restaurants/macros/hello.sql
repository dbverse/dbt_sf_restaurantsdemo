{% macro print_hello(name) %}
    SELECT 
        'Hello ' || '{{ name }}' AS greeting
{% endmacro %}