USE sakila;

-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT COUNT(inventory_id) FROM sakila.inventory
WHERE film_id IN (
SELECT film_id as film FROM(
SELECT film_id, title
FROM film
WHERE title = 'Hunchback Impossible') sub1
);

-- 2. List all films whose length is longer than the average of all the films.

SELECT title FROM film
WHERE length > (SELECT avg(length)
                FROM film)
ORDER BY length desc;

-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT * FROM film_actor;
SELECT * FROM actor;
SELECT * FROM film
WHERE title ='Alone Trip';

SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
Select actor_id
FROM film_actor
WHERE film_id IN 
(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'
));


-- 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films
SELECT * FROM category;

SELECT title FROM sakila.film
WHERE film_id IN(
SELECT film_id FROM(
SELECT film_id
FROM sakila.category
JOIN sakila.film_category USING(category_id)
WHERE name = 'Family') sub1
);

-- 5. Get name and email from customers from Canada using subqueries
select * from customer;
select * from address;
select * from city;
SELECT * from country;

-- JOIN  WAY
SELECT last_name,email
FROM sakila.customer c
JOIN sakila.address a
ON c.address_id =  a.address_id
JOIN sakila.city ci
ON ci.city_id = a.city_id
JOIN sakila.country co
ON co.country_id = ci.country_id
WHERE co.country = "Canada";

-- SUBQUERY WAY
SELECT first_name, last_name, email
FROM customer
WHERE address_id IN
(
Select address_id
FROM address
WHERE city_id IN 
(
SELECT city_id
FROM city
WHERE country_id IN
(
SELECT country_id
FROM country
WHERE country = "Canada"
)));

-- 6. Which are films starred by the most prolific actor? 
SELECT actor_id, COUNT(film_id) FROM sakila.film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;

SELECT title 
FROM film
WHERE film_id IN(
SELECT film_id FROM film_actor
WHERE actor_id = 107
);

-- another way to do it with subqueries

SELECT f.title 
FROM sakila.film f
WHERE film_id IN(
SELECT film_id FROM film_actor
WHERE actor_id = (SELECT actor_id FROM ( 
SELECT actor_id, COUNT(film_id) FROM sakila.film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1)sub1) 
);

-- 7. Films rented by most profitable customer 
SELECT SUM(amount), customer_id FROM sakila.payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;

SELECT title
FROM sakila.film
WHERE film_id IN(
SELECT film_id FROM( 
SELECT film_id FROM sakila.inventory i
JOIN sakila.rental r USING(inventory_id)
WHERE customer_id = (SELECT customer_id FROM (
SELECT customer_id, SUM(amount) FROM sakila.payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1)sub1))sub2
);

-- 8. Customers who spent more than the average payments.

SELECT first_name, last_name
FROM customer
WHERE customer_id IN
(
Select customer_id
FROM payment
WHERE amount > (SELECT avg(amount)
                FROM payment)
ORDER BY amount desc
);





