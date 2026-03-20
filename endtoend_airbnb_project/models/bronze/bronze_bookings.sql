{{ 
  config(
    materialized = 'incremental',
    unique_key = 'BOOKING_ID',
    incremental_strategy = 'merge'
)
}}

SELECT 
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    NIGHTS_BOOKED,
    BOOKING_AMOUNT,
    CLEANING_FEE,
    SERVICE_FEE,
    BOOKING_STATUS,
    CREATED_AT
FROM {{ source('staging', 'bookings') }}
{% if is_incremental() %}
    WHERE CREATED_AT >= (SELECT COALESCE(MAX(CREATED_AT), '1900-01-01')
    FROM {{ this }})
{% endif %}


