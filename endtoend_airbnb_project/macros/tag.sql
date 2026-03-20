{% macro tag(col_name) %}
  CASE
    WHEN {{col_name}} > 200 THEN 'PREMIUM'
    WHEN {{col_name}} > 120 THEN 'MID_RANGE'
    ELSE 'BUDGET'
  END
{% endmacro %}

