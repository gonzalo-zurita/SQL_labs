USE sakila;

-- 1. Write a query to display for each store its store ID, city, and country
SELECT store_id, city, country
FROM sakila.store s
JOIN sakila.city c
ON store_id = city_id
JOIN sakila.country co
ON c.country_id = co.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in
SELECT SUM(amount) AS 'total_amount', st.store_id
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
JOIN store st
ON st.store_id = s.store_id
GROUP BY st.store_id;

-- 3. Which film categories are longest?
SELECT name, AVG(length) AS avg_length
FROM category c
JOIN film_category fm
ON c.category_id = fm.category_id
JOIN film f
ON f.film_id = fm.film_id
GROUP BY name
ORDER BY avg_length DESC;

-- 4.Display the most frequently rented movies in descending order.
SELECT title, COUNT(rental_id)
FROM rental r
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film m
ON m.film_id = i.film_id
GROUP BY title
ORDER BY COUNT(rental_id) DESC;

-- 5. List the top five genres in gross revenue in descending order.
SELECT c.name, SUM(amount)
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN rental r
ON customer_; -- not finished

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT title, s.store_id
FROM inventory i
JOIN store s
ON i.store_id = s.store_id
JOIN film f
ON f.film_id = i.film_id
WHERE title LIKE '%Academy Dinosaur%' AND s.store_id = '1';

-- 7. Get all pairs of actors that worked together


SELECT j1.film_id,
avg
FROM (
select f1.film_id, f1.actor_id AS first_actor, a.first_name AS firstactor_firstnam, a.last_name AS firstactor_last_name
from film_actor f1
JOIN film_actor f2
ON (f1.actor_id <> f2.actor_id) AND (f1.film_id =f2.film_id)
JOIN actor a 
ON f1.actor_id = a.actor_id) j1
JOIN actor a2
ON j1.seconf ;


-- 8. Get all pairs of customers that have rented the same film more than 3 times.

select first_customer, second_customer, first_film, count(*) from
(select r1.customer_id AS first_customer, i1.film_id AS first_film
from rental r1
join inventory i1 using(inventory_id)) j1
join
(select r2.customer_id AS second_customer, i2.film_id AS second_film
from rental r2
join inventory i2 using(inventory_id)) j2
on (first_customer <> second_customer) and (first_film = second_film)
GROUP BY first_customer, second_customer, first_film
HAVING count(*) >3; 


