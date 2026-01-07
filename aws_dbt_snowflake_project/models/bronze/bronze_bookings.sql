{# {% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %}

select * from {{source('staging','bookings')}}
{% if incremental_flag == 1 %}
    where {{ incremental_col }} > (select COALESCE(max({{ incremental_col }}),'1900-01-01') from {{ ref('bronze_bookings')}})
{% endif %} #}


{{ config(materialized='incremental',unique_key = 'BOOKING_ID')}}

select *,
row_number() over(partition by BOOKING_ID order by CREATED_AT desc) as ROW_NUM
from {{source('staging','bookings')}}
{% if is_incremental() %}
    where CREATED_AT > (select COALESCE(max(CREATED_AT),'1900-01-01') from {{ this }})
{% endif %}