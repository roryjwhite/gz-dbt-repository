{% macro margin_percent(revenue,purchase_cost) %}
   ROUND(((revenue - purchase_cost)/revenue)*100,2)
{% endmacro %}