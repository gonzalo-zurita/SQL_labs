USE sakila;

-- 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)), last_name
FROM sakila.actor
GROUP BY last_name;

-- 2. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT * FROM rental;
SELECT rental_date, DATE_FORMAT((rental_date), '%M') AS 'month', WEEKDAY(rental_date) AS 'weekday',
CASE
WHEN WEEKDAY(rental_date) <='5' then 'workday'
WHEN WEEKDAY(rental_date) >'5' then 'weekend'
ELSE 'incorrect'
END AS 'day_type'
FROM sakila.rental;

-- 3.Get all films with ARMAGEDDON in the title.
SELECT title FROM sakila.film 
WHERE title LIKE('%ARMAGEDDON%');

-- 4. Get 10 the longest films
SELECT title,length FROM sakila.film
ORDER BY length DESC 
limit 10;

-- 5.How many films include Behind the Scenes content?
SELECT * FROM sakila.film
WHERE special_features LIKE('%Behind the Scenes%');

-- 6. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, COUNT(*) FROM film
WHERE length > '120'
GROUP BY rating;

-- 7. Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank
SELECT * FROM film 
WHERE length IN ('null','0');


SELECT title, length, 
RANK() OVER(ORDER BY length DESC) AS ranking
FROM sakila.film
ORDER BY ranking;