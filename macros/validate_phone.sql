{% macro validate_phone_max_10_digits(column_name) %}
    LENGTH(REGEXP_REPLACE({{ column_name }}, '[^0-9]', '')) <= 10
{% endmacro %}