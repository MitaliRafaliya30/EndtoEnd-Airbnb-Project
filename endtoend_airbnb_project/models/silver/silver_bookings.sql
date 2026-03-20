-- depends_on : {{ ref('bronze_bookings')}}

{{ config(materialized = 'incremental', unique_key = 'BOOKING_ID') }}


SELECT 
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    DATE_TRUNC('month', BOOKING_DATE) AS BOOKING_MONTH,
    YEAR(BOOKING_DATE) AS BOOKING_YEAR,
    NIGHTS_BOOKED,
    BOOKING_AMOUNT,
    {{ multiply('NIGHTS_BOOKED', 'BOOKING_AMOUNT', 2) }} AS TOTAL_AMOUNT,
    SERVICE_FEE, 
    CLEANING_FEE, 
    BOOKING_STATUS,
    CREATED_AT
from {{ ref('bronze_bookings') }} 

WHERE NIGHTS_BOOKED > 0  