-- Grain: one row per booking
-- Combines booking, listing and host attributes

{% set configs = [
     {
        "table" :  ref('silver_bookings') ,
        "columns" : "
                    SILVER_bookings.BOOKING_ID,
                    SILVER_bookings.LISTING_ID,
                    SILVER_bookings.BOOKING_DATE,
                    SILVER_bookings.BOOKING_MONTH,
                    SILVER_bookings.BOOKING_YEAR,
                    SILVER_bookings.NIGHTS_BOOKED,
                    SILVER_bookings.BOOKING_AMOUNT,
                    SILVER_bookings.TOTAL_AMOUNT,
                    SILVER_bookings.SERVICE_FEE,
                    SILVER_bookings.CLEANING_FEE,
                    SILVER_bookings.BOOKING_STATUS,
                    SILVER_bookings.CREATED_AT AS BOOKING_CREATED_AT
                    ",
        "alias" : "SILVER_bookings"

    },
    { 
        "table" :  ref('silver_listings') ,
        "columns" : "
                    SILVER_listings.HOST_ID, 
                    SILVER_listings.PROPERTY_TYPE,
                    SILVER_listings.ROOM_TYPE, 
                    SILVER_listings.CITY,
                    SILVER_listings.COUNTRY,
                    SILVER_listings.ACCOMMODATES, 
                    SILVER_listings.BEDROOMS,
                    SILVER_listings.BATHROOMS,
                    SILVER_listings.price_per_night, 
                    silver_listings.price_per_night_tag,
                    silver_listings.CREATED_AT AS LISTING_CREATED_AT
                    ",
        "alias" : "SILVER_listings",
        "join_condition" : "SILVER_listings.LISTING_ID = SILVER_bookings.LISTING_ID"
    },
    {
        "table" :  ref('silver_hosts') ,
        "columns" : "
                SILVER_hosts.HOST_NAME,
                SILVER_hosts.HOST_SINCE,
                SILVER_hosts.IS_SUPERHOST,
                SILVER_hosts.RESPONSE_RATE,
                SILVER_hosts.RESPONSE_RATE_QUALITY,
                SILVER_hosts.CREATED_AT AS HOST_CREATED_AT
                ",
        "alias" : "SILVER_hosts",
         "join_condition" : "SILVER_hosts.HOST_ID = SILVER_listings.HOST_ID"
    }
] %}

SELECT 
{% for i in configs %}
    {{ i['columns']}} {% if not loop.last %},{% endif %}
{% endfor %}

FROM 
{% for i in configs %}
    {% if loop.first %}
        {{ i['table'] }} AS {{i['alias']}}
    {% else %}
        LEFT JOIN {{ i['table'] }} AS {{i['alias']}}
        ON {{ i['join_condition']}}
    {% endif %}
    {% endfor %}
