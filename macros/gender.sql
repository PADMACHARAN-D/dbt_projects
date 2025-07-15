{% macro gender(column_name) %}
    case
    when {{column_name}} ='female' then 'f'
    when {{column_name}} = 'male' then 'm'
    when {{column_name}} = 'm' then 'male'
    else 'female'
    end
{% endmacro %}