WITH tmp AS (
    SELECT
    40.6281871096                                   AS minLat,
    40.6654832604                                   AS maxLat,
    -73.8212879826                                  AS minLon,
    -73.7465043413                                  AS maxLon,
    extract(dayofweek from lpep_pickup_datetime)    AS lpep_pickup_dow,
    extract(dayofweek from lpep_dropoff_datetime)   AS lpep_dropoff_dow,
    extract(hour from lpep_pickup_datetime)         AS lpep_pickup_hour, -- https://docs.aws.amazon.com/redshift/latest/dg/r_EXTRACT_function.html
    extract(hour from lpep_dropoff_datetime)        AS lpep_dropoff_hour,
    *
FROM
    tripdata
ORDER BY
    pickup_latitude DESC
)

SELECT
    -- existing attribute
    -- *,
    -- pickup at JFK
    CASE
        WHEN pickup_latitude BETWEEN minLat AND maxLat AND pickup_longitude BETWEEN minLon AND maxLon THEN 1
        ELSE 0
    END AS pickup_at_jfk,
    CASE
        WHEN dropoff_latitude BETWEEN minLat AND maxLat AND dropoff_longitude BETWEEN minLon AND maxLon THEN 1
        ELSE 0
    END AS dropoff_at_jfk,
    -- duration in seconds of the trip
    unix_timestamp(lpep_dropoff_datetime) - unix_timestamp(lpep_pickup_datetime) AS trip_duration_seconds,
    -- lpep_pickup_dow
    CASE WHEN lpep_pickup_dow = 1 THEN 1 ELSE 0 END AS lpep_pickup_dow_1, -- SUNDAY
    CASE WHEN lpep_pickup_dow = 2 THEN 1 ELSE 0 END AS lpep_pickup_dow_2,
    CASE WHEN lpep_pickup_dow = 3 THEN 1 ELSE 0 END AS lpep_pickup_dow_3,
    CASE WHEN lpep_pickup_dow = 4 THEN 1 ELSE 0 END AS lpep_pickup_dow_4,
    CASE WHEN lpep_pickup_dow = 5 THEN 1 ELSE 0 END AS lpep_pickup_dow_5,
    CASE WHEN lpep_pickup_dow = 6 THEN 1 ELSE 0 END AS lpep_pickup_dow_6,
    CASE WHEN lpep_pickup_dow = 7 THEN 1 ELSE 0 END AS lpep_pickup_dow_7,
    -- lpep_dropoff_dow
    CASE WHEN lpep_dropoff_dow = 1 THEN 1 ELSE 0 END AS lpep_dropoff_dow_1, -- SUNDAY
    CASE WHEN lpep_dropoff_dow = 2 THEN 1 ELSE 0 END AS lpep_dropoff_dow_2,
    CASE WHEN lpep_dropoff_dow = 3 THEN 1 ELSE 0 END AS lpep_dropoff_dow_3,
    CASE WHEN lpep_dropoff_dow = 4 THEN 1 ELSE 0 END AS lpep_dropoff_dow_4,
    CASE WHEN lpep_dropoff_dow = 5 THEN 1 ELSE 0 END AS lpep_dropoff_dow_5,
    CASE WHEN lpep_dropoff_dow = 6 THEN 1 ELSE 0 END AS lpep_dropoff_dow_6,
    CASE WHEN lpep_dropoff_dow = 7 THEN 1 ELSE 0 END AS lpep_dropoff_dow_7,
    -- lpep_pickup_hour
    CASE WHEN lpep_pickup_hour = 0 THEN 1 ELSE 0 END AS lpep_pickup_hour_0,
    CASE WHEN lpep_pickup_hour = 1 THEN 1 ELSE 0 END AS lpep_pickup_hour_1,
    CASE WHEN lpep_pickup_hour = 2 THEN 1 ELSE 0 END AS lpep_pickup_hour_2,
    CASE WHEN lpep_pickup_hour = 3 THEN 1 ELSE 0 END AS lpep_pickup_hour_3,
    CASE WHEN lpep_pickup_hour = 4 THEN 1 ELSE 0 END AS lpep_pickup_hour_4,
    CASE WHEN lpep_pickup_hour = 5 THEN 1 ELSE 0 END AS lpep_pickup_hour_5,
    CASE WHEN lpep_pickup_hour = 6 THEN 1 ELSE 0 END AS lpep_pickup_hour_6,
    CASE WHEN lpep_pickup_hour = 7 THEN 1 ELSE 0 END AS lpep_pickup_hour_7,
    CASE WHEN lpep_pickup_hour = 8 THEN 1 ELSE 0 END AS lpep_pickup_hour_8,
    CASE WHEN lpep_pickup_hour = 9 THEN 1 ELSE 0 END AS lpep_pickup_hour_9,
    CASE WHEN lpep_pickup_hour = 10 THEN 1 ELSE 0 END AS lpep_pickup_hour_10,
    CASE WHEN lpep_pickup_hour = 11 THEN 1 ELSE 0 END AS lpep_pickup_hour_11,
    CASE WHEN lpep_pickup_hour = 12 THEN 1 ELSE 0 END AS lpep_pickup_hour_12,
    CASE WHEN lpep_pickup_hour = 13 THEN 1 ELSE 0 END AS lpep_pickup_hour_13,
    CASE WHEN lpep_pickup_hour = 14 THEN 1 ELSE 0 END AS lpep_pickup_hour_14,
    CASE WHEN lpep_pickup_hour = 15 THEN 1 ELSE 0 END AS lpep_pickup_hour_15,
    CASE WHEN lpep_pickup_hour = 16 THEN 1 ELSE 0 END AS lpep_pickup_hour_16,
    CASE WHEN lpep_pickup_hour = 17 THEN 1 ELSE 0 END AS lpep_pickup_hour_17,
    CASE WHEN lpep_pickup_hour = 18 THEN 1 ELSE 0 END AS lpep_pickup_hour_18,
    CASE WHEN lpep_pickup_hour = 19 THEN 1 ELSE 0 END AS lpep_pickup_hour_19,
    CASE WHEN lpep_pickup_hour = 20 THEN 1 ELSE 0 END AS lpep_pickup_hour_20,
    CASE WHEN lpep_pickup_hour = 21 THEN 1 ELSE 0 END AS lpep_pickup_hour_21,
    CASE WHEN lpep_pickup_hour = 22 THEN 1 ELSE 0 END AS lpep_pickup_hour_22,
    CASE WHEN lpep_pickup_hour = 23 THEN 1 ELSE 0 END AS lpep_pickup_hour_23,
    -- lpep_dropoff_hour
    CASE WHEN lpep_dropoff_hour = 0 THEN 1 ELSE 0 END AS lpep_dropoff_hour_0,
    CASE WHEN lpep_dropoff_hour = 1 THEN 1 ELSE 0 END AS lpep_dropoff_hour_1,
    CASE WHEN lpep_dropoff_hour = 2 THEN 1 ELSE 0 END AS lpep_dropoff_hour_2,
    CASE WHEN lpep_dropoff_hour = 3 THEN 1 ELSE 0 END AS lpep_dropoff_hour_3,
    CASE WHEN lpep_dropoff_hour = 4 THEN 1 ELSE 0 END AS lpep_dropoff_hour_4,
    CASE WHEN lpep_dropoff_hour = 5 THEN 1 ELSE 0 END AS lpep_dropoff_hour_5,
    CASE WHEN lpep_dropoff_hour = 6 THEN 1 ELSE 0 END AS lpep_dropoff_hour_6,
    CASE WHEN lpep_dropoff_hour = 7 THEN 1 ELSE 0 END AS lpep_dropoff_hour_7,
    CASE WHEN lpep_dropoff_hour = 8 THEN 1 ELSE 0 END AS lpep_dropoff_hour_8,
    CASE WHEN lpep_dropoff_hour = 9 THEN 1 ELSE 0 END AS lpep_dropoff_hour_9,
    CASE WHEN lpep_dropoff_hour = 10 THEN 1 ELSE 0 END AS lpep_dropoff_hour_10,
    CASE WHEN lpep_dropoff_hour = 11 THEN 1 ELSE 0 END AS lpep_dropoff_hour_11,
    CASE WHEN lpep_dropoff_hour = 12 THEN 1 ELSE 0 END AS lpep_dropoff_hour_12,
    CASE WHEN lpep_dropoff_hour = 13 THEN 1 ELSE 0 END AS lpep_dropoff_hour_13,
    CASE WHEN lpep_dropoff_hour = 14 THEN 1 ELSE 0 END AS lpep_dropoff_hour_14,
    CASE WHEN lpep_dropoff_hour = 15 THEN 1 ELSE 0 END AS lpep_dropoff_hour_15,
    CASE WHEN lpep_dropoff_hour = 16 THEN 1 ELSE 0 END AS lpep_dropoff_hour_16,
    CASE WHEN lpep_dropoff_hour = 17 THEN 1 ELSE 0 END AS lpep_dropoff_hour_17,
    CASE WHEN lpep_dropoff_hour = 18 THEN 1 ELSE 0 END AS lpep_dropoff_hour_18,
    CASE WHEN lpep_dropoff_hour = 19 THEN 1 ELSE 0 END AS lpep_dropoff_hour_19,
    CASE WHEN lpep_dropoff_hour = 20 THEN 1 ELSE 0 END AS lpep_dropoff_hour_20,
    CASE WHEN lpep_dropoff_hour = 21 THEN 1 ELSE 0 END AS lpep_dropoff_hour_21,
    CASE WHEN lpep_dropoff_hour = 22 THEN 1 ELSE 0 END AS lpep_dropoff_hour_22,
    CASE WHEN lpep_dropoff_hour = 23 THEN 1 ELSE 0 END AS lpep_dropoff_hour_23
FROM tmp
