{% macro validate_phone_max_10_digits(column_name) %}
    case
    when LENGTH(REGEXP_REPLACE({{ column_name }}, '[^0-9]', '')) <= 10 then {{column_name}}
    else 'invalid number'
    end
{% endmacro %}