-- intro query, select all columns from the actor table
SELECT *
FROM actor;

SELECT first_name, last_name
FROM actor;

-- WHERE clause -- setting a condition for a query -- 

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id = 2;

-- Query for actor names that are like nick

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- % wild card

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'L%';

-- underscores are place holders for a potential match

SELECT first_name, last_name 
FROM actor
WHERE first_name LIKE 'L___';

SELECT first_name, last_name -- grabbing the columns
FROM actor -- grabbing the tables
WHERE first_name LIKE 'T_m'; -- clause for data retreval

-- Comparison operators
-- Greater Than, Less than, equal to, less than or equal to, greater thab or equal to
-- not equal <>

-- Query to explore data from the payment table
SELECT *
FROM payment;

-- Query for customers who paid an amout greater than $3

SELECT DISTINCT(customer_id), amount
FROM payment
WHERE amount > 3.00;

--Query for customers who paid under 7.99

SELECT DISTINCT(customer_id), amount
FROM payment
WHERE amount < 7.99;

-- query for customers who paid atleast 5.99

SELECT customer_id, rental_id, amount
FROM payment
WHERE amount >= 5.99;

-- Customers whp paid at most 2.99

SELECT customer_id, rental_id, amount
FROM payment
WHERE amount <= 2.99;

--

SELECT customer_id, amount
FROM payment
WHERE amount <> 2.99; -- !=

SELECT * 
FROM payment
ORDER BY amount ASC; -- defaults to ascending order

SELECT * 
FROM payment
ORDER BY amount DESC; -- descending order

-- Customers who spent the most

SELECT *
FROM payment
ORDER BY amount DESC
LIMIT 25; -- only the 25 highest amounts

SELECT *
FROM payment
ORDER BY amount DESC
LIMIT 25 OFFSET 100; -- top 25 AFTER the first 100 rows


-- Between
-- Query for customers that paid an amount between 2.99 and 7.99
-- using WHERE BETWEEN and AND

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.99 AND 7.99;

-- SQL Aggregations --> SUM(), AVG(), COUNT(), MIN(), MAX()
-- SUM of amounts paid over 5.99

SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

SELECT SUM(amount)
FROM payment;

SELECT AVG(amount)
FROM payment;

SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query for mumber of amounts paid

SELECT COUNT(amount)
FROM payment;

SELECT COUNT(DISTINCT amount)
FROM payment;

SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query for the smallest amount paid over 7.99

SELECT MIN(amount) AS min_payments -- AS alows us to change the way the info in a column shows up
FROM payment
WHERE amount > 7.99;

SELECT amount FROM payment WHERE amount > 7.99 ORDER BY amount LIMIT 1;

SELECT MAX(amount) AS largest_payment FROM payment;

SELECT amount FROM payment ORDER BY amount DESC LIMIT 1;

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- Query to show which customers paid the most for rentals

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1; -- shows the customer who paid the most


-- Homework

-- 1

SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

--2

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3 

SELECT COUNT(film_id), film_id
FROM inventory
GROUP BY film_id 
ORDER BY COUNT(film_id) DESC;

-- 4

SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William'

-- 5 

SELECT COUNT(staff_id) staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT (staff_id) DESC;


-- 6
SELECT COUNT (DISTINCT district)
FROM address;

-- 7 -- > HELP

SELECT COUNT(actor_id) actor_id, film_id
FROM film_actor
GROUP BY actor_id, film_id
ORDER BY COUNT (actor_id) ASC;

-- 8 (From store_id 1?)

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

-- 9

SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;

-- 10 

SELECT COUNT(rating), rating
FROM film
GROUP BY rating
ORDER BY COUNT DESC;




















