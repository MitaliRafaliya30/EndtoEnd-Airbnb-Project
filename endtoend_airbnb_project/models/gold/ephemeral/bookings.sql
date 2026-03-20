-- depends_on : {{ ref('obt') }}

{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH bookings AS
(
    SELECT DISTINCT
        BOOKING_ID,
        {{ dbt_utils.generate_surrogate_key(['BOOKING_ID']) }} AS BOOKING_SK,
        BOOKING_DATE,
        BOOKING_STATUS,
        BOOKING_CREATED_AT
    FROM {{ ref('obt') }}
)
SELECT * FROM bookings

