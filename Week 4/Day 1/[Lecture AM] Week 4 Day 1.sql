#insert data into database
INSERT INTO `sakila`.`actor`
(`actor_id`,
`first_name`,
`last_name`)
VALUES
(12345,
'Moritz',
'Jost');

#update data on database
UPDATE `sakila`.`actor`
SET
`first_name` = 'Rodrigo'
WHERE `actor_id` = 12345;

#delete data from database
DELETE FROM `sakila`.`actor`
WHERE `actor_id` = 12345;

#insert data into database from newly created table called "test"
INSERT INTO `sakila`.`test`
(`test_id`,
`f_name`,
`description`)
VALUES
(1234,
'Gunnar');

####DDL STATEMENTS (database defining langauge)
####Create table
CREATE TABLE `sakila`.`test` (
  `test_id` INT NOT NULL,
  `f_name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`test_id`));


#Altering table
ALTER Table `test`
ADD l_name VARCHAR(45) NOT NULL;

select * from test;

#Drop table
DROP Table test;

#CREATING VIEWS - views are not tables; the view code will run faster than faster
SELECT film_id from film;
#Views in SQL - used a lot query
CREATE VIEW test_view AS
SELECT first_name from actor join film_Actor USING(actor_id)
where film_id in (1,2,3,4,5,6,7,8,9,10);


SELECT * FROM test_view




