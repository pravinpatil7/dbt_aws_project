{{ config(materialized = 'ephemeral') }}

with hosts as 
(
    select distinct 
        LISTING_HOST_ID as HOST_ID,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT AS CREATED_AT
        from {{ ref('obt') }}
)
select * from hosts