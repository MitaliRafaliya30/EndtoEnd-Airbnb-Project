{{ config(
    materialized = 'incremental',
    unique_key = 'HOST_ID',
    incremental_strategy = 'merge'
  ) }}

select 
    HOST_ID,
    HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CREATED_AT
from {{ source("staging", "hosts") }}
{% if is_incremental() %}
  where CREATED_AT >= (select COALESCE(MAX(CREATED_AT), '1900-01-01') 
  FROM {{ this }})
{% endif %}  