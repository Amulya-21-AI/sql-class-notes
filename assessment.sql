-- using cte fetch top 5 categories by rental count
with CTE as ( 
select c.category_id,count(rental_id)
from category c
right join film_category fc on c.category_id = fc.category_id
inner join film f on fc.film_id = f.film_id
inner join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by c.category_id
order by count(rental_id) desc
limit 5
)
select*
from CTE
;
---------------------------
select first_name, last_name
from customer c
join c.customer_id on film_id = c.film_id
where c.film_id in (
select rating = 'PG-13'
);
---------------------
-- films longer than avg film length
select film_id, title
from film
where length > (
select avg(film.length) from film
);
------------------
select*
from film;
-- pick one title for that title length and avg to confrim > than avg length
select title,length,avg(length)
from film
where length> (
	select avg(length) from film
    )
    group by title,length
    Limit 1
    ;
    -------------
    select avg(length) from film;
    
    ----------------------------
    SELECT film_id,title,length,
    (SELECT AVG(length) FROM film),
    length - (SELECT AVG(length) FROM film)
FROM film
WHERE length > (SELECT AVG(length) FROM film)
LIMIT 5;
