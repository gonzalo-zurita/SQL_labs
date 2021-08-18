-- 1
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';
-- 2
SELECT * FROM sakila.rental;
SELECT COUNT(*) FROM sakila.rental; 

-- 3
SELECT MIN(length) AS min_duration
FROM sakila.film;

SELECT MAX(length) AS max_duration
FROM sakila.film;

-- 4
SELECT SEC_TO_TIME(AVG(length * 60))  FROM sakila.film;

-- 5
SELECT * FROM sakila.actor;
SELECT COUNT(last_name) FROM sakila.actor; 

-- 6
SELECT * FROM sakila.rental;
SELECT MIN(rental_date) FROM sakila.rental;
SELECT MAX(rental_date) FROM sakila.rental;
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date)) FROM sakila.rental;

-- 7
SELECT rental_date, DATE_FORMAT((rental_date), '%M'), WEEKDAY(rental_date)
FROM sakila.rental
LIMIT 20;

-- 8
SELECT rental_date, DATE_FORMAT((rental_date), '%M') AS 'month', WEEKDAY(rental_date) AS 'weekday',
CASE
WHEN WEEKDAY(rental_date) <='5' then 'workday'
WHEN WEEKDAY(rental_date) >'5' then 'weekend'
ELSE 'incorrect'
END AS 'day_type'
FROM sakila.rental;

-- 9
SELECT title, release_year FROM sakila.film;

-- 10
SELECT title FROM sakila.film 
WHERE title LIKE('%ARMAGEDDON%');

-- 11
SELECT title FROM sakila.film 
WHERE title LIKE('%APOLLO');

-- 12
SELECT title,length FROM sakila.film
ORDER BY length DESC 
limit 10;

-- 13
SELECT * FROM sakila.film
WHERE special_features LIKE('%Behind the Scenes%');