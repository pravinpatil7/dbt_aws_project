{% macro multiply(x,y,prec) %}
    round({{x}} * {{y}}, {{prec}})
{% endmacro %}