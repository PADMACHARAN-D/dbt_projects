{% macro isactive(column_name) %}
    case
    when {{column_name}} is null then 'Y'
    else 'N'
    end
{% endmacro %}