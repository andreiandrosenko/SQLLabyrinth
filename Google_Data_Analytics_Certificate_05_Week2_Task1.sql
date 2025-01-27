-- #1
-- Transform fiction NULL temp (9999.9, 999.9, 99.99) into real NULL

SELECT
  stn,
  date,
  IF(
     temp=9999.9,
     NULL,
     temp) AS temperature,
  IF(
     wdsp="999.9",
     NULL,
     CAST(wdsp AS Float64)) AS wind_speed,
  IF(
     prcp=99.99,
     0,
     prcp) AS precipitation
FROM
  `bigquery-public-data.noaa_gsod.gsod2020`
WHERE
  stn="725030" -- La Guardia
  OR stn="744860" -- JFK
ORDER BY
  date DESC,
  stn ASC;


-- #2
-- Grouping bike trips according their routs

SELECT 
  usertype,
  CONCAT(start_station_name, ' to ', end_station_name) AS route,
  COUNT(*) AS num_trips,
  ROUND(AVG(CAST(tripduration AS INT64)/60),2) AS duration
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips`
GROUP BY
  2,1
ORDER BY 3 DESC
LIMIT 10