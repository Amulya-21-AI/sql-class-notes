-- create a table employee
-- columns consists of emp_id, first_name,last_name,date_of_join
create table employees
(
emp_id int primary key,
first_name char(15),
last_name char(15),
date_of_join int
)
;
-----------------
-- join rental with film title
select f.title,r.rental_id
from film
join rental r on i.rental_id = r.rental_id
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id


with CTE as select f.title,r.rental_id
from film
-------------------------------------
-- customers who have rented more than 5 films
select customer_id,first_name,last_name
from customers
where customer_id in(
select customer_id from rental

group by customer_id
having count(rental_id)>5 from rental
);
-------------------------
-- count of customer rows
select count(*)
from customer;
--------------------
-- inserting new row into existing one
insert into language(name)
value('spanish');
------------------------
-- knowing the count by keeping new name for the column
select count(customer_id) as customer_count
from customer;
--------------------
-- customer first_name have x, y
select count(first_name) as xyname
from customer
where first_name like '%x%' or '%y%';
----------------------------------------
-- top 5 rental films based on rental_id count with limit 5
select f.film_id,f.title,count(r.rental_id) 
from film f
left join inventory i on f.film_id = f.film_id
left join rental r on r.inventory_id = i.inventory_id
group by f.film_id,f.title
order by film_id desc
limit 5;
--------------------
select count(rental_id) as total_rental_count
from rental;
--------------------------------
-- renaming the table name
rename table customer to customers;
-----------------------
-- show customers from ten top with total paid round to 1 decimal
select customer_id,count(amount) as totalamount
from payment
group by customer_id
having round(totalamount)
order by totalamount desc
limit 10;
------------------------------------
-- list all films and no.of actors in the each film
select f.film_id,f.title,count(a.actor_id) as actorscount
from film f
left join film_actor fa on f.film_id=fa.film_id
left join actor a on fa.actor_id=a.actor_id
group by f.film_id,f.title;


-- customer_id 10-15 by using between
select customer_id
from customers
where customer_id between 10 and 15;
-----------------------------
-- top 3 customers who made the highest total payment
select customer_id,sum(amount)
from payment
group by customer_id
order by sum(amount) desc
limit 3;
-------------------------------------
# filter all the distinct customers from the payment table
select distinct customer_id
from payment;
-----------------
-- Rename customers table to back original name
rename table customers to customer;
----------------
-- we got table name back to Customer
select*
from customer;

