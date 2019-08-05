-- What are the three longest trips on rainy days?
SELECT
	t.trip_id,
	MAX(t.duration) trip_length
FROM
	trips t
JOIN
	weather w
ON
	t.zip_code = w.zip
WHERE
	w.precipitationin > 0
GROUP BY 1
ORDER BY
	trip_length DESC
LIMIT 3;


-- Which station is full most often?
SELECT
	stations.name,
	COUNT(status.docks_available) available_docks_count
FROM
	stations
JOIN
	status
ON
	stations.station_id = status.station_id
WHERE
	status.docks_available = 0
GROUP BY 1
ORDER BY available_docks_count DESC
LIMIT 1;


-- Return a list of stations with a count of number of trips starting at that station but ordered by dock count.
WITH
	trip_count
AS(
	SELECT
		start_station station,
		COUNT(trip_id) number_of_trips
	FROM
		trips
	GROUP BY 1
)

SELECT
	t.station,
	t.number_of_trips
FROM
	trip_count t
JOIN
	stations s
ON
	t.station = s.name
GROUP BY 1,2,s.dockcount
ORDER BY
	s.dockcount ASC;


-- (Challenge) What's the length of the longest trip for each day it rains anywhere?
SELECT
	w.date,
	MAX(t.duration) longest_trip
FROM
	trips t
JOIN
	weather w
ON
	t.zip_code = w.zip
WHERE
	w.precipitationin > 0
GROUP BY 1
ORDER BY
	w.date DESC;
