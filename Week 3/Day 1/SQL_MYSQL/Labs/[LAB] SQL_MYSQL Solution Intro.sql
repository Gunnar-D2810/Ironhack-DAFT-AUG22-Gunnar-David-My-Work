#Lab | SQL Intro

#In this lab, you will be using the Sakila database of movie rentals. You can follow the steps listed here to get the data locally: 
#Sakila sample database - installation. You can work with two sql query files - sakila-schema.sql (creates the schema) + sakila-data.sql 
#which inserts the data.
#The ERD is pictured below - not all tables are shown, but many of the key fields you will be using are visible:
#[look at tab EER Diagram 2

#Instructions
#Review the tables in the database.
##Query selects first 10 rows for sakila film table as an example
select * from sakila.film limit 10; 

##Explore tables by selecting all columns from each table or using the in built review features for your client.
select * from sakila.actor;

##use tab to autofill table
select * from sakila.address;
select * from sakila.customer;

#Select one column from a table. Get film titles.
##Query for film_id and title in film table
select title from sakila.film;
select film_id from sakila.film;

##This is a version to create a view on a table
##select * from sakila.film;
##create view v(film_id,title)
##as
##select film_id, title
##from sakila.film

##drop view v(film_id,title);??


#!!!!Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
select title as filmtitle, original_language_id as film_languages
from sakila.film;


#5.1 Find out how many stores does the company have?
SELECT count(*) FROM sakila.store;
# the company has 2 stores

#########################################################################################

#5.2 Find out how many employees staff does the company have?
SELECT * FROM sakila.staff limit 50;
SELECT count(*) FROM sakila.staff;
#Only 2 employees can be found running the query against staff table

#########################################################################################

#5.3 Return a list of employee first names only?
SELECT first_name from sakila.staff;
#The names are Mike and Jon

