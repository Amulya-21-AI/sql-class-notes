-- customer details how have made more than 5 payments
select * 
from customer 
where customer_id in ( 
select customer_id from payment 
group by customer_id 
having count(payment_id)>5);
--------------------
SELECT*
FROM payment;
-----------------------
SELECT*
FROM film_actor;
----------------------
-- name of actors who have acted in more than 10 films
SELECT*
FROM actor
WHERE actor_id in(
SELECT actor_id from film_actor
group by actor_id
having count(film_id>10));
---------------------
-- finding customers who never made a payment
SELECT*
FROM customer
where customer_id not in (
select customer_id from payment)
group by customer_id;
--------------------------------
select*
from film;
----------------------
-- list all films whose rental rate is higher than the avg rental rate of all films
select film_id, title, rental_rate
from film
where rental_rate> (select avg(rental_rate));
----------------------
-- List the titles of films that were never rented.
SELECT title 
FROM film 
WHERE film_id NOT IN (
SELECT film_id FROM inventory 
WHERE inventory_id IN (SELECT inventory_id FROM rental)
);
--------------------------
select*
from film;
------------------------
-- Displaying customers who rented films in same month as customer with ID 5.
SELECT DISTINCT first_name, last_name 
FROM customer 
WHERE customer_id IN (
SELECT customer_id FROM rental 
WHERE MONTH(rental_date) IN (
SELECT DISTINCT MONTH(rental_date) 
FROM rental 
WHERE customer_id = 5
    )
);
-----------------------
select*
from staff;
-----------------------------
-- Finding all staff members who handled payment greater than average payment amount.
select first_name,last_name
from staff
where staff_id in (
select staff_id
from payment
where staff_id > (select avg(amount) from payment)
);
---------------------------
-- Show title and rental duration of films whose rental duration is greater than the average.
select title, rental_duration
from film
where rental_duration> (select avg(rental_duration)
from film
);
---------------------------
select*
from customer;
-----------------------------------
-- Find all customers who have the same address as customer with ID 1.
select customer_id, first_name, last_name
from customer
where address_id = (
select address_id
from customer
where customer_id = 1
);
----------------------------
select*
from payment;
----------------------------------------
-- List all payments that are greater than the average of all payments.
select payment_id, amount
from payment
where amount> (
select avg(amount) from payment
);

