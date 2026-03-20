-- depends_on: {{ ref('bronze_listings') }}
{{ config(materialized='incremental', unique_key='LISTING_ID') }}

SELECT 
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    UPPER(TRIM(CITY)) AS CITY,
    UPPER(TRIM(COUNTRY)) AS COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    {{ tag("PRICE_PER_NIGHT") }} AS PRICE_PER_NIGHT_TAG,
    CREATED_AT
FROM {{ ref('bronze_listings') }}

WHERE PRICE_PER_NIGHT > 0