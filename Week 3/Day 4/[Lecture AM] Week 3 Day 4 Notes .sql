#Total amount borrowed from the bank
select account_id, sum(amount) as total_borrowed from bank.loan
group by account_id;

#Now total amount borrowed and payments back to the bank
select account_id, sum(amount) as total_borrowed, sum(payments) as total_payments from bank.loan
group by account_id;

#Now total amount borrowed and payments back to the bank with payments > 1000
select account_id, sum(amount) as total_borrowed, sum(payments) as total_payments from bank.loan
group by account_id
having total_payments > 1000;
#having is applied on group by table. Instead where defines range on table before

select duration, sum(amount) as total_borrowed from bank.loan
group by duration;

#Where or having can be used here for duration. Despite that amount has to be ranged with having after group by
select duration, sum(amount) as total_borrowed from bank.loan
group by duration
having duration <= 24;

select duration, sum(amount) as total_borrowed from bank.loan
where duration <=24
group by duration;

#Create a temporary table
create temporary table temp (select DISTINCT k_symbol from bank.trans where k_symbol <>" ");
select * from temp;

#creating temporary tables take out complexity out of a long complex query (joins or subquery)
#and temp tables save cost (processing, storage, etc.)
select * from bank.order where k_symbol in (select * from temp)