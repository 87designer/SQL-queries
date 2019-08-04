-- What was the hottest day in our data set? Where was that?
SELECT
	zip,
	MAX(maxtemperaturef) AS hottest_day
FROM
	weather
GROUP BY 1
ORDER BY
	hottest_day DESC
LIMIT 1;


-- How many trips started at each station?
SELECT
	start_station,
	COUNT(*) as originating_trips
FROM
	trips
GROUP BY 1;


-- What's the shortest trip that happened?
SELECT
	MIN(duration) as shortest_trip
FROM
	trips
GROUP BY duration
ORDER BY
	shortest_trip ASC
LIMIT 1;


-- What is the average trip duration, by end station?
SELECT
	end_station,
	AVG(duration) as average_trip_duration
FROM
	trips
GROUP BY 1;
