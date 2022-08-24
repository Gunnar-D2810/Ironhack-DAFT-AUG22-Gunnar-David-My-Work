#Lab | SQL Queries - Join Two Tables
#In this lab, you will be using the Sakila database of movie rentals. If you need to get the data again, refer to the official installation link.

#The database is structured as follows:
#########################################################################################
#########################################################################################
#see fig in  GITHUB Gunnar-D2810/IH_RH_DA_FT_AUG_2022/Class_Materials/SQL_MYSQL/Labs/Lab_SQL_GroupBy.md
#########################################################################################
#########################################################################################

#Instructions
#1. Which actor has appeared in the most films?
#Hint: group by actor_id

#Expected output:
#GINA DEGENERES	42

#1. Solution
SELECT		
			last_name,
			count(film_actor.film_id) AS film_id_count
			FROM
			actor
JOIN		
			film_actor USING(actor_id)
GROUP BY	
			actor_id
ORDER BY	
			film_id_count DESC
LIMIT 1;

#########################################################################################

#2. Most active customer (the customer that has rented the most number of films)

#Expected output:
#ELEANOR HUNT	46

#2. Solution
SELECT
		first_name,
        last_name,
        count(rental.customer_id) AS customer_id_count
		FROM customer
JOIN 	rental USING(customer_id)
GROUP BY
		customer_id
ORDER BY customer_id_count DESC
LIMIT 1;

#########################################################################################

#3. List number of films per category.

#Expected output:
#Action	64
#Animation	66
#Children	60
#Classics	57
#Comedy	58
#Documentary	68
#Drama	62
#Family	69
#Foreign	73
#Games	61
#Horror	56
#Music	51
#New	63
#Sci-Fi	61
#Sports	74
#Travel	57

#3. Solution
SELECT
		name,
        count(film_category.category_id) AS film_count
FROM	category
JOIN	film_category
		USING(category_id)
GROUP BY film_category.category_id
ORDER BY name ASC;

#########################################################################################

#4. Display the first and last names, as well as the address, of each staff member.

#Expected output:

#4. Solution
#Mike	Hillyer		23 Workhaven Lane
#Jon	Stephens	1411 Lillydale Drive

SELECT
		first_name,
        last_name,
        address
FROM	staff
JOIN	address
		USING(address_id)
ORDER BY last_name ASC;

#########################################################################################

#5. Display the total amount rung up by each staff member in August of 2005.

#Expected output:
#Jon Stephens	12218.48
#Mike Hillyer	11853.65

#5. Solution
#SELECT	amount, payment_date
#FROM	payment limit 10;

SELECT
		first_name,
        last_name,
        sum(payment.amount) AS amount_total
FROM	staff
JOIN	payment
		USING(staff_id)
WHERE 	payment_date	BETWEEN 050801 AND 050830
GROUP BY staff_id
ORDER BY first_name ASC;


#########################################################################################

#6. List each film and the number of actors who are listed for that film.

#Expected output: Top 10 out of 997 rows
#LAMBS CINCINATTI		15
#CHITTY LOCK			13
#CRAZY HOME			13
#RANDOM GO			13
#DRACULA CRYSTAL		13
#BOONDOCK BALLROOM	13
#MUMMY CREATURES		13
#HELLFIGHTERS SIERRA	12
#LONELY ELEPHANT		12
#ARABIA DOGMA		12

#6. Solution
