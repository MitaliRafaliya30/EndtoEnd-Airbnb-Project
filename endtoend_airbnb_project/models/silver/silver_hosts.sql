-- depends_on: {{ ref('bronze_hosts') }}
{{ config(materialized = "incremental", unique_key ='HOST_ID' )}}


SELECT 
    HOST_ID,
    UPPER(TRIM(HOST_NAME)) AS HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE 
        WHEN RESPONSE_RATE >= 95 THEN 'EXCELLENT'
        WHEN RESPONSE_RATE >= 80 THEN 'GOOD'
        WHEN RESPONSE_RATE >= 60 THEN 'AVERAGE'
        ELSE 'LOW'
    END AS RESPONSE_RATE_QUALITY,
    CREATED_AT
FROM {{ ref('bronze_hosts') }}

WHERE RESPONSE_RATE <= 100