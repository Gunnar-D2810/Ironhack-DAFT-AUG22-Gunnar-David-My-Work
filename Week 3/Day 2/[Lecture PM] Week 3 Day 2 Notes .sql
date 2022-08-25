#inner join (natural join)
select * from account join loan on account.account_id = loan.account_id;

#inner join and filtering on status only "A"
select * from account join loan using (account_id)
where status = "A";

select * from account left join loan using (account_id);