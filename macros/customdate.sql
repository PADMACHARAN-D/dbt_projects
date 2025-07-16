{% macro customdate(column_name) %}
    case
        when regexp_like({{ column_name }}, '^\d{4}/\d{2}/\d{2}$') then
            to_char({{ column_name }}, 'DD/MM/YYYY')
        else to_char({{ column_name }}, 'YYYY/MM/DD')
    end
{% endmacro %}