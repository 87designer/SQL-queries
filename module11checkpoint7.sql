-- Using sfo_calendar, sfo_listings, and sfo_reviews answer the following questions.

-- Q1
-- What's the most expensive listing?
-- (Answer: Listing 24650875)
SELECT
	*
FROM
	sfo_listings
ORDER BY
	price DESC
LIMIT 1;


-- What else can you tell me about the listing?
-- (Answer: It has glowing reviews, however the number of reviews is listed as 3 but there are in fact 4 reviews.)
SELECT
	*
FROM
	sfo_listings
JOIN
	sfo_reviews
ON
	sfo_listings.id = sfo_reviews.listing_id
ORDER BY
	price DESC
LIMIT 4;


-- Q2
-- What neighborhoods seem to be the most popular?
-- (Answer: the neighbourhoods seeming to be most popular are those that are either super cheap or have the most avaiability)
SELECT
	neighbourhood,
	availability_365,
	price,
	number_of_reviews
FROM
	sfo_listings
GROUP BY 1,2,3,4
ORDER BY 4 DESC;


-- Q3
-- What time of year is the cheapest time to go to San Francisco?
-- (Answer: There is an average price of $211.77 per night for every single day of the year.
-- So the cheapest time to go would depend on budget and more analysis would be required after that.)
SELECT
	sfo_calendar.calender_date,
	AVG(sfo_listings.price)
FROM
	sfo_calendar
JOIN
	sfo_listings
ON
	sfo_calendar.listing_id = sfo_listings.id
WHERE 2 IS NOT NULL
GROUP BY 1
ORDER BY 2 ASC;

-- What about the busiest?
-- (Answer: The end of July into the beginning of August is the busiest time.)
SELECT
	last_review,
	COUNT(last_review)
FROM
	sfo_listings
GROUP BY 1
ORDER BY count DESC;
