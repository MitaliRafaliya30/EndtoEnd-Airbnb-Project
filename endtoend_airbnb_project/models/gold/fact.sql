{{ config(materialized='table') }}

SELECT

-- Surrogate Keys (IMPORTANT)
b.BOOKING_SK,
l.LISTING_SK,
h.HOST_SK,

-- Natural Keys (optional)
o.BOOKING_ID,
o.LISTING_ID,
o.HOST_ID,

-- Measures
o.TOTAL_AMOUNT,
o.SERVICE_FEE,
o.CLEANING_FEE

FROM {{ ref('obt') }} o

-- Booking dimension
LEFT JOIN {{ ref('dim_bookings') }} b
    ON o.BOOKING_ID = b.BOOKING_ID
    AND b.dbt_valid_to = '9999-12-31'

-- Listing dimension
LEFT JOIN {{ ref('dim_listings') }} l
    ON o.LISTING_ID = l.LISTING_ID
    AND l.dbt_valid_to = '9999-12-31'

-- Host dimension
LEFT JOIN {{ ref('dim_hosts') }} h
    ON o.HOST_ID = h.HOST_ID
    AND h.dbt_valid_to = '9999-12-31'