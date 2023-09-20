--1
SELECT CONCAT(first_name, ' ', last_name) as full_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--2
SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

--3
SELECT *
FROM payment;

SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM customer
WHERE customer_id IN
(
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175 
);
--4
SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'
;
--5
SELECT CONCAT(first_name, ' ', last_name) as full_name, COUNT(amount)
FROM staff
JOIN payment
ON  payment.staff_id = staff.staff_id
GROUP BY full_name;
--on table.fk = table.pk
--fk same name as pk

--6
SELECT COUNT(title), rating
FROM film
GROUP BY rating;

--7
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM customer
WHERE customer_id IN 
(
SELECT customer_id
FROM payment
WHERE amount > 6.99
GROUP BY customer_id
HAVING COUNT(amount) = 1 
);

--8
SELECT COUNT(rental.rental_id)--, amount
FROM rental
JOIN payment
ON payment.rental_id = rental.rental_id
WHERE amount = 0
GROUP BY amount




--on table.fk = table.pk
--fk same name as pk