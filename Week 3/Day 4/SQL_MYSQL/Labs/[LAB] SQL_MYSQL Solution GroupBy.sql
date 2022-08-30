#Lab | SQL Queries - Group By
#In this lab, you will be using the Sakila database of movie rentals. If you need to get the data again, refer to the official installation link.

#The database is structured as follows:

#########################################################################################
#########################################################################################
#see fig in  GITHUB Gunnar-D2810/IH_RH_DA_FT_AUG_2022/Class_Materials/SQL_MYSQL/Labs/Lab_SQL_GroupBy.md
#########################################################################################
#########################################################################################

#Instructions
#1. In the table actor, what last names are not repeated? 
#For example if you would sort the data in the table actor by last_name, 
#you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
#These three actors have the same last name. 
#So we do not want to include this last name in our output. 
#Last name "Astaire" is present only one time with actor "Angelina Astaire", 
#hence we would want this in our output list.

#Expected output:
#66 rows including
#ASTAIRE
#BACALL
#BALE
#WILSON
#WITHERSPOON
#WRAY

#1. Solution
SELECT last_name FROM actor
GROUP BY last_name
HAVING count(last_name) = 1;


#########################################################################################

#2. Which last names appear more than once? 
#We would use the same logic as in the previous question but this 
#time we want to include the last names of the actors where the last name 
#was present more than once

#Expected output:
#55 rows including
#AKROYD
#ALLEN
#BAILEY
#WINSLET
#WOOD
#ZELLWEGER

#2. Solution
SELECT last_name FROM actor
GROUP BY last_name
HAVING not count(last_name) = 1;

#########################################################################################

#3. Using the rental table, find out how many rentals were processed by each employee.

#Expected output:
#1	8040
#2	8004

#3. Solution
SELECT count(rental_id) as rentals FROM rental
GROUP BY staff_id;

#########################################################################################

#4. Using the film table, find out how many films there are of each rating.

#Expected output:
#PG    194
#G     178
#NC-17     210
#PG-13     223
#R     195

#4. Solution
SELECT rating, count(film_id) FROM film
GROUP BY rating;

#5. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

#Expected output:
#PG	  112.01
#G	    111.05
#NC-17	113.23
#PG-13	120.44
#R	    118.66

#5. Solution
SELECT rating, round(avg(length),2) as average_length FROM film
GROUP BY rating;

#6. Which kind of movies (rating) have a mean duration of more than two hours?

#Expected output:
#PG-13

#6. Solution
SELECT rating FROM film
GROUP BY rating
HAVING avg(length) > 120

