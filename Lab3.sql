USE sakila;
-- 1
SELECT last_name, COUNT(*) FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) =1;

-- 2 
SELECT last_name, COUNT(*) FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) >1;

-- 3
SELECT * FROM rental;

SELECT staff_id, COUNT(*) FROM rental
GROUP BY staff_id;

-- 4
SELECT MIN(release_year), MAX(release_year) FROM film; #every movie was released in the same year

SELECT release_year, COUNT(*) FROM film
GROUP BY release_year;

-- 5 
SELECT * FROM film;

SELECT rating, COUNT(*) FROM film
GROUP BY rating;

-- 6
SELECT round(AVG(length),2), rating, COUNT(*) FROM film
GROUP BY rating;

-- 7
SELECT rating, COUNT(*) FROM film
WHERE length > '120'
GROUP BY rating;

-- 8
SELECT * FROM film 
WHERE length IS null;


SELECT title, length, 
RANK() OVER(ORDER BY length DESC) AS ranking
FROM sakila.film
ORDER BY ranking;


