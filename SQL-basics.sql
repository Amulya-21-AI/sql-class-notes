SELECT first_name,last_name
FROM customer
WHERE first_name like 'j%' AND active=1;
--------------------------------
SELECT title
FROM film_text
WHERE title like '%action%' or description like '%war%';
--------------------------
SELECT*
FROM customer;
---------------------------------
SELECT*
FROM customer
WHERE last_name<>'smith' AND first_name like '%a';
------------------------------------------
SELECT*
FROM film;
------------------------------
SELECT title
FROM film
WHERE rental_rate>3.0 AND replacement_cost<>0;
------------------------------
SELECT*
FROM customer;
----------------------------------------
SELECT store_id,
count(*) AS active_status
FROM customer
WHERE active=1
GROUP BY store_id;
--------------------
select*
FROM film;
---------------------
SELECT distinct rating
FROM film;
--------------------------
SELECT rental_duration,
AVG = SUM/COUNT;
FROM film
WHERE rental_duration;
--------------------
select*
FROM payment;
--------------------------------
SELECT 
    DATE(payment_date) AS payment_day,
    COUNT(*) AS total_payments,
    SUM(amount) AS total_amount_paid
FROM payment
GROUP BY DATE(payment_date)
HAVING COUNT(*) > 100
ORDER BY payment_day;
----------------------------
SELECT customer_id, first_name, last_name, email
FROM customer
WHERE email IS NULL OR email LIKE '%.org';
----------------------------
SELECT*
FROM film;
-------------------------------------
SELECT title, rating, rental_rate
FROM film
WHERE rating IN ('PG', 'G')
ORDER BY rental_rate DESC;
---------------------------------
SELECT length, COUNT(*) AS film_count
FROM film
WHERE title LIKE 'T%'
GROUP BY length
HAVING COUNT(*) > 5
ORDER BY film_count DESC;
------------------------------
SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS film_count
FROM actor a
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(fa.film_id) > 10
ORDER BY film_count DESC;
--------------------------------------------
SELECT title, rental_rate, length
FROM film
ORDER BY rental_rate DESC, length DESC
LIMIT 5;
-----------------------------------
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_rentals DESC;
----------------------------------------
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;




