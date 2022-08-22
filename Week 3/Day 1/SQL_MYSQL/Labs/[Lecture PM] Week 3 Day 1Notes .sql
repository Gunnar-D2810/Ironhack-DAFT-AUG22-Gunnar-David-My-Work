#EXAMPLE sum and avg of grouped receords in bank loan table

SELECT account_id,sum(payments) AS average_payments FROM bank.loan
GROUP BY account_id;

SELECT account_id,avg(payments) AS average_payments FROM bank.loan
GROUP BY account_id;

#This does not work; aggregation needs to be applied when records are grouped in table
SELECT account_id, loan_id, sum(payments) AS average_payments FROM bank.loan
GROUP BY account_id;

select *,amount + payments AS calculated_col FROM loan;

select *,concat(amount," test") AS calculated_col2 FROM loan;

#query for records with payments between 1100 and 1200
SELECT * FROM loan
where payments between 1100 and 1200;

SELECT sum(payments) FROM loan
WHERE account_id<100;

select * from loan
order by account_id,payments;

#keeps two chars in string 
select * from district;
select left(A2,2) from district;

#removes spaces from left for string
select ltrim("      Marlena");

SELECT * FROM bank.district
WHERE A3 LIKE "north%";
