#Lab | SQL Subqueries
#In this lab, you will be using the Sakila database of movie rentals. Create appropriate joins wherever necessary.

#Instructions
#1. How many copies of the film Hunchback Impossible exist in the inventory system?

#Expected output:
#6 

#1. Solution
#Call ID for target movie: ID:'439'
#SELECT film_id FROM film
#WHERE title IN ("Hunchback Impossible");

SELECT count(film_id) AS 439_inventory_count FROM sakila.inventory
	WHERE film_id IN
	(SELECT film_id FROM sakila.film
    WHERE title IN ("Hunchback Impossible")
);


#########################################################################################

#2. List all films whose length is longer than the average of all the films.
#Expected output:

#489 rows including

#AFFAIR PREJUDICE
#AFRICAN EGG
#AGENT TRUMAN
#…
#WRATH MILE
#WRONG BEHAVIOR
#YOUNG LANGUAGE
#YOUTH KICK

#2. Solution
#SELECT avg(length) FROM sakila.film
#GROUP BY title
#LIMIT 10;


SELECT title FROM sakila.film
WHERE length >
    (SELECT avg(length) FROM sakila.film
    ORDER BY title ASC
);

#########################################################################################

#3. Use subqueries to display all actors who appear in the film Alone Trip.

#Expected output:
#ED CHASE
#KARL BERRY
#UMA WOOD
#WOODY JOLIE
#SPENCER DEPP
#CHRIS DEPP
#LAURENCE BULLOCK
#RENEE BALL

#3. Solution
SELECT first_name, last_name FROM sakila.actor
	WHERE actor_id IN
    (SELECT actor_id FROM sakila.film_actor
		WHERE film_id IN
		(SELECT film_id FROM sakila.film
		WHERE title = "Alone Trip"
		ORDER BY title ASC
	)
);

#########################################################################################

#4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

#Expected output:
#69 rows including 
#AFRICAN EGG
#APACHE DIVINE
#ATLANTIS CAUSE
#BAKED CLEOPATRA
#BANG KWAI
#BEDAZZLED MARRIED
#BILKO ANONYMOUS
#BLANKET BEVERLY

#4. Solution
#Query to check str of family, it is "Family"
#SELECT name FROM sakila.category
#LIMIT 10;

SELECT title FROM sakila.film
	WHERE film_id IN
    (SELECT film_id FROM sakila.film_category
		WHERE category_id IN
        (SELECT category_id FROM sakila.category 
        WHERE name = "Family"
        ORDER BY title ASC
	)
);

#########################################################################################

#5. Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
#Expected output:

#DERRICK BOURQUE	DERRICK.BOURQUE@sakilacustomer.org
#DARRELL POWER	DARRELL.POWER@sakilacustomer.org
#LORETTA CARPENTER	LORETTA.CARPENTER@sakilacustomer.org
#CURTIS IRBY	CURTIS.IRBY@sakilacustomer.org
#TROY QUIGLEY	TROY.QUIGLEY@sakilacustomer.org

#5. Solution
select first_name, last_name, email from customer
where address_id in(select address_id from address
where city_id in (select city_id from city
where country_id = (select country_id from country
where country = "Canada")));

#########################################################################################
#########################################################################################

#Optional
#Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
#Expected output:

#42 rows including: 
#BED HIGHBALL
#CALENDAR GUNFIGHT
#CHAMBER ITALIAN
#CHAPLIN LICENSE
#CHARIOTS CONSPIRACY
#CLUELESS BUCKET
#COLDBLOODED DARLING
#CONEHEADS SMOOCHY
#DARKNESS WAR
#DEER VIRGINIAN

#6. Solution
select title
from film
where film_id in
	(select film_id
    from film_actor
    where actor_id =
    (select actor_id
    from film_actor
    group by actor_id
    order by count(film_id) desc limit 1
    )
) limit 10;

#########################################################################################

#7. Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
#Expected output:

#44 rows including 
#DESTINY SATURDAY
#CYCLONE FAMILY
#SLUMS DUCK
#FIDELITY DEVIL
#SPLASH GUMP
#MISSION ZOOLANDER
#MULHOLLAND BEAST
#PRINCESS GIANT
#PARIS WEEKEND
#RACER EGG

#7. Solution
#select title from film
