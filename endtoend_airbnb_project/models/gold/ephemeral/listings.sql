-- depends_on: {{ ref('obt') }}

{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH listings AS
(
    SELECT DISTINCT
        LISTING_ID,
        {{ dbt_utils.generate_surrogate_key(['LISTING_ID']) }} AS LISTING_SK,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        PRICE_PER_NIGHT_TAG,
        LISTING_CREATED_AT
    FROM {{ ref('obt') }}
)
SELECT * FROM listings