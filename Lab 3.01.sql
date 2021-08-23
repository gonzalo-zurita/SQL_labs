USE sakila;

-- 1
ALTER TABLE staff
DROP picture;

SELECT * FROM staff;

-- 2
SELECT * FROM customer
WHERE last_name = 'SANDERS' And first_name = 'TAMMY';

INSERT INTO sakila.staff(first_name, last_name, address_id, email, store_id,active,username)
VALUES
('TAMMY','SANDERS','79','TAMMY.SANDERS@sakilacustomer.org',2,1,'TAMMY');

-- 3 
select * from sakila.inventory
where film_id = 1;

select film_id from film
where title = 'Academy Dinosaur';

select * from rental;

INSERT INTO rental (rental_id,rental_date, inventory_id,customer_id,return_date,staff_id,last_update)
VALUES 
(16050, 20210825, 9,130, 20210825,1,20210825);

select * from rental
WHERE rental_id =16050;
