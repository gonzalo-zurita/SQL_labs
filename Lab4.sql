USE sakila;

-- 1. How many films are there for each of the categories in the category table
SELECT COUNT(c.film_id), category_id
FROM sakila.film_category c
JOIN sakila.film f
ON c.film_id = f.film_id
GROUP BY c.category_id;

SELECT name as 'category', COUNT(film_id) as 'number_of_films'
FROM sakila.film_category as fc
JOIN category as c
ON fc.category_id = c.category_id
GROUP BY name;

-- 2. Display the total amount rung up by each staff member in August of 2005.

SELECT first_name, r.staff_id as 'staff_memeber', SUM(amount) as 'total_amount'
FROM sakila.payment p
JOIN sakila.rental r
ON p.rental_id = r.rental_id
JOIN staff s
ON s.staff_id = r.staff_id
WHERE rental_date LIKE ('%2005-08%')
GROUP BY r.staff_id;

-- 3. Which actor has appeared in the most films?
SELECT * FROM film_actor;
SELECT * FROM actor;
SELECT COUNT(fa.actor_id) AS 'number_of_movies', first_name
FROM film_actor as fa
JOIN actor as a
ON fa.actor_id = a.actor_id
GROUP BY first_name
ORDER BY COUNT(fa.actor_id) DESC;

-- 4. Most active customer 
SELECT COUNT(r.customer_id) AS 'number of rentals', last_name
FROM rental as r
JOIN customer as c
ON r.customer_id = c.customer_id
GROUP BY last_name
ORDER BY COUNT(r.customer_id) DESC;

-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address 
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

-- 6. List each film and the number of actors who are listed for that film
SELECT title, COUNT(a.actor_id) AS 'number of actors'
FROM film f
JOIN film_actor fa
ON f.film_id = fa.film_id
JOIN actor a 
ON a.actor_id = fa.actor_id
GROUP BY title;

-- 7. list the total paid by each customer. List the customers alphabetically by last name.
SELECT SUM(amount) AS 'total_amount', last_name
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY last_name
ORDER BY last_name ASC;

-- 8. List number of films per category
SELECT COUNT(f.film_id) AS 'number of films' ,c.name AS 'category name'
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
JOIN film f
ON f.film_id = fc.film_id
GROUP BY c.name;