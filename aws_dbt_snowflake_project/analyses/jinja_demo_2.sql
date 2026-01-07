{% set family = ["Gundopant","Jayashri","Pravin","Poonam","Tanishka","Anish"] %}

{%- for fam in family -%}
    {% if fam == "Poonam" %}
        Love you Wifey !! 
    {%- else -%}
        {{ fam }}
    {%- endif -%}
    {% if not loop.last %} , {% endif %}
{%- endfor -%}