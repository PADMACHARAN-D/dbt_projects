{% macro isnull(column_name) %}
    case
    when {{column_name}} is null then 'na'
    else {{column_name}}
    end
{% endmacro %}