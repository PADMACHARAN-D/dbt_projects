{% macro is_valid_email(column_name) %}
    regexp_like({{ column_name }}, '^[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]{2,}$')
{% endmacro %}