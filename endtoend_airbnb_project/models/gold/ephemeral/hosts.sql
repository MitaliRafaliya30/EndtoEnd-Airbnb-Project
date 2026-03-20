-- depends_on: {{ ref('obt') }}

{{
  config(
    materialized = 'ephemeral',
    )
}}

WITH hosts AS
(
    SELECT DISTINCT
        HOST_ID,
        {{ dbt_utils.generate_surrogate_key(['HOST_ID']) }} AS HOST_SK ,
        HOST_NAME,
        HOST_SINCE,
        IS_SUPERHOST,
        RESPONSE_RATE_QUALITY,
        HOST_CREATED_AT
    FROM {{ ref('obt') }}
)
SELECT * FROM hosts