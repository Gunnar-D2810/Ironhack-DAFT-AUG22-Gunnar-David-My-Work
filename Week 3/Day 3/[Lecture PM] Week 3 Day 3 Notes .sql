# Manual hard-coded way to get all amounts bigger than the avg
select * from loan;
select avg(amount) from loan;
select account_id from loan where amount > 151410.1760;

#Subquery version
select account_id from loan where amount > (select avg(amount) from loan);

#Subquery with table - child statement
select account_id,account_to, sum(amount) from bank.order
group by account_id, bank_to, account_to;

select account_id,account_to, sum(amount) from bank.order
group by account_id, bank_to, account_to
having sum(amount) > 10000;

#Subquery with table - child & parent statement
select * 
from(
select account_id, account_to, round(sum(amount),2) as Total
from bank.order
group by account_id, bank_to, account_to
) as t
Where Total > 100000;


#Retrieve the orders records from the order table where the k_symbol is exsisting in the trans
select * from bank.order
where k_symbol in
(select distinct(k_symbol) from bank.trans
where k_symbol not in (""," "));
