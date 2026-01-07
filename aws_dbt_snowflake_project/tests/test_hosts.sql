{{ config(severity = 'warn' ) }}

select 1
from {{ref('bronze_hosts')}}
where len(HOST_NAME) is null