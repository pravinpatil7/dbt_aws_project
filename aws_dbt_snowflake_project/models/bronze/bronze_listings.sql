{# {% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %}

select * from {{source('staging','listings')}}
{% if incremental_flag == 1 %}
    where {{ incremental_col }} > (select COALESCE(max({{ incremental_col }}),'1900-01-01') from {{ ref('bronze_listings')}})
{% endif %} #}


{{ config(materialized='incremental')}}

select * from {{source('staging','listings')}}
{% if is_incremental() %}
    where CREATED_AT > (select COALESCE(max(CREATED_AT),'1900-01-01') from {{ this }})
{% endif %}


{# Comment in bronze_listing.sql #}