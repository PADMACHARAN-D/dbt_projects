{% macro customdate(input_date) %}
    CASE
    WHEN regexp_like({{input_date}}, '^\d{4}/\d{2}/\d{2}$') THEN 
      TO_CHAR(TO_DATE({{input_date}}, 'YYYY/DD/MM'), 'DD/MM/YYYY')

    WHEN regexp_like({{input_date}}, '^\d{2}/\d{2}/\d{4}$') THEN 
      TO_CHAR(TO_DATE({{input_date}}, 'DD/MM/YYYY'), 'YYYY/DD/MM')

    ELSE {{input_date}}
  END 
{% endmacro %}