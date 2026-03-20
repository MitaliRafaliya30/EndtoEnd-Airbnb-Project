{{ config(
    materialized = 'incremental',
    unique_key = 'LISTING_ID',
    incremental_strategy = 'merge'
 ) }}

SELECT  
  LISTING_ID, 
  HOST_ID, 
  PROPERTY_TYPE,
  ROOM_TYPE, 
  CITY,
  COUNTRY,
  ACCOMMODATES,
  BEDROOMS, 
  BATHROOMS, 
  PRICE_PER_NIGHT,
  CREATED_AT
FROM {{ source('staging', 'listings') }}
{% if is_incremental() %}
  where CREATED_AT >= (SELECT COALESCE(MAX(CREATED_AT), '1900-01-01') 
  FROM {{ this }})
{% endif %}