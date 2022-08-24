# the star * is selecting all rows from the table for the query
# SELECT DATA FROM DB AND RUN QUERY AGAINST TABLES
select * from bank.account WHERE account_id<100;
select * from card;

# COUNT() in QUERY AGAINST A TABLES
# similar to Python count() fct
select count(*) from account;

# distinct is similar to Python unique()fct
# select distinct (district_id)from account

#select * from account limit 5
#select * from bank limit 5

#RUNNING QUERY AGAINST LOAN TABLE AND ORDER BY PAYMENTS IN DESCENDING ORDER (OTHER EXAMPLE ASCENDING)
#select * from loan order by payments desc
select * from loan order by payments asc


