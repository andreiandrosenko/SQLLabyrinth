-- JOIN operator

-- #1
SELECT
  O.*,
  W.warehouse_alias,
  W.state
FROM
  `inlaid-stratum-383516.warehouse_orders.orders` O
  JOIN
    `inlaid-stratum-383516.warehouse_orders.warehouse` W
  ON O.warehouse_id = W.warehouse_id;


-- #2
SELECT
  COUNt (DISTINCT W.state)
FROM
  `inlaid-stratum-383516.warehouse_orders.orders` O
  JOIN
    `inlaid-stratum-383516.warehouse_orders.warehouse` W
  ON O.warehouse_id = W.warehouse_id;

-- #3
SELECT
 station_id,
 num_bikes_available,
 (SELECT
  AVG(num_bikes_available)
 FROM `bigquery-public-data.new_york_citibike.citibike_stations`
 ) AS avg_num_bike_avalable
FROM
  `bigquery-public-data.new_york_citibike.citibike_stations`
ORDER BY
  2 DESC;


-- #4
SELECT
  station_id,
  name,
  number_of_rides AS number_of_rides_starting_at_station
FROM 
  (
  SELECT
    CAST(start_station_id AS STRING) AS start_station_id_str,
    COUNT(*) AS number_of_rides
  FROM `bigquery-public-data.new_york.citibike_trips`
  GROUP BY CAST(start_station_id AS STRING)
  ) AS station_num_trips
  INNER JOIN
    `bigquery-public-data.new_york.citibike_stations`
  ON station_id = start_station_id_str
ORDER BY number_of_rides DESC;
