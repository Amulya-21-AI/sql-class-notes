-- Identify duplicates in customer table
SELECT first_name,
       last_name,
       email,
       COUNT(*) AS duplicate_count
FROM sakila.customer
GROUP BY first_name, last_name, email
HAVING COUNT(*) > 1;
-----------------------
SELECT*
FROM customer;
-----------------------------
-- Number of times letter 'a' is repeated in film descriptions
SELECT 
SUM(
  LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'a', ''))
) AS total_a_count
FROM sakila.film;
-------------------------------------
-- Number of times each vowel is repeated in film descriptions
SELECT
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'a', ''))) AS a_count,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'e', ''))) AS e_count,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'i', ''))) AS i_count,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'o', ''))) AS o_count,
SUM(LENGTH(description) - LENGTH(REPLACE(LOWER(description), 'u', ''))) AS u_count
FROM sakila.film;
------------------------------------
-- 1 month Wise
SELECT customer_id,
       MONTH(payment_date) AS month,
       SUM(amount) AS total_amount
FROM sakila.payment
GROUP BY customer_id, MONTH(payment_date);
-----------------------------------------------
-- 2 year wise
SELECT customer_id,
       YEAR(payment_date) AS year,
       SUM(amount) AS total_amount
FROM sakila.payment
GROUP BY customer_id, YEAR(payment_date);
---------------------------------
-- 3 week wise
SELECT customer_id,
       WEEK(payment_date) AS week,
       SUM(amount) AS total_amount
FROM sakila.payment
GROUP BY customer_id, WEEK(payment_date);
-----------------------------------
-- Checking if a given year is 'LEAP year' or 'NOT a LEAP year'
SELECT
CASE
  WHEN (2024 % 400 = 0)
    OR (2024 % 4 = 0 AND 2024 % 100 != 0)
  THEN 'Leap Year'
  ELSE 'Not a Leap Year'
END AS leap_year_status;
-----------------------------------------
-- no.of days Remaining in CURRENT Year
SELECT 
DATEDIFF(
  MAKEDATE(YEAR(CURDATE()), 365 + IF(YEAR(CURDATE()) % 4 = 0 AND (YEAR(CURDATE()) % 100 != 0 OR YEAR(CURDATE()) % 400 = 0), 1, 0)),
  CURDATE()
) AS days_remaining;
-----------------------
-- Display Quarter (Q1-Q4) for payment dates
SELECT payment_id,
       payment_date,
       CONCAT('Q', QUARTER(payment_date)) AS quarter
FROM sakila.payment;
------------------------------
-- Display age (years, months, days)
SELECT
TIMESTAMPDIFF(YEAR, '2002-08-21', CURDATE()) AS years,
MOD(TIMESTAMPDIFF(MONTH, '2025-08-21', CURDATE()), 12) AS months,
DATEDIFF(
  CURDATE(),
  DATE_ADD(
    '2003-08-15',
    INTERVAL TIMESTAMPDIFF(MONTH, '2002-08-21', CURDATE()) MONTH
  )
) AS days;
-------------------





