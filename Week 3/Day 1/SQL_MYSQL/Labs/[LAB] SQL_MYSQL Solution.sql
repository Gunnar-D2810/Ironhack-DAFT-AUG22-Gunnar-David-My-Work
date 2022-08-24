#Lab | SQL basics (selection and aggregation)
#Introduction
#In this lab, you will be using the Bank database.

#Here, we will practice selecting and projecting data. You can finish all questions with only those clauses:

#- SELECT
#- SELECT DISTINCT
#- FROM
#- WHERE
#- ORDER BY
#- LIMIT
#You can save your solutions into a sql file that you can submit via Github Url.

#Instructions
#Assume that any _id columns are incremental, meaning that higher ids always occur after lower ids. For example, a client with a higher client_id joined the bank after a client with a lower client_id.

#Query 1
#Get the id values of the first 5 clients from district_id with a value equals to 1.

#Expected result:
#2
#3
#22
#23
#28

#Solution Query 1

SELECT CLIENT_ID FROM bank.client
WHERE district_id=1 AND client_id limit 5;

#########################################################################################

#Query 2
#In the client table, get an id value of the last client where the district_id equals to 72.

#Expected result:
#13576

#Solution Query 2

SELECT client_id FROM client
WHERE district_id = 1
ORDER BY client_id DESC
LIMIT 1;

#########################################################################################

#Query 3
#Get the 3 lowest amounts in the loan table.

#Expected result:
#4980
#5148
#7656

#Solution Query 3

SELECT amount FROM loan ORDER BY amount ASC 
LIMIT 3;

#########################################################################################

#Query 4
#What are the possible values for status, ordered alphabetically in ascending order in the loan table?

#Expected result:
#A
#B
#C
#D

#Solution Query 4

SELECT DISTINCT status FROM bank.loan ORDER BY status ASC;

#########################################################################################

#Query 5
#What is the loan_id of the highest payment received in the loan table?

#Expected result:
#6415

#Solution Query 5

SELECT loan_id FROM bank.loan ORDER BY payments DESC
LIMIT 1;

#########################################################################################

#Query 6
#What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount

#Expected result:
##id     amount
#2	    80952
#19	    30276
#25	    30276
#37	    318480
#38	    110736
#Solution Query 6

SELECT account_id, amount FROM bank.loan ORDER BY account_id ASC
LIMIT 5;

#########################################################################################

#Query 7
#What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?

#Expected result:
#10954
#938
#10711
#1766
#10799

#Solution Query 7

SELECT account_id FROM bank.loan 
WHERE duration = 60 
ORDER BY amount ASC
LIMIT 5;

#########################################################################################

#Query 8
#What are the unique values of k_symbol in the order table?

#Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name.

#Expected result:
#LEASING
#POJISTNE
#SIPO
#UVER

#Solution Query 8
SELECT DISTINCT k_symbol from bank.order ORDER BY k_symbol;

#########################################################################################

#Query 9
#In the order table, what are the order_ids of the client with the account_id 34?

#Expected result:
#29445
#29446
#29447

#Solution Query 9

SELECT order_id FROM bank.order 
WHERE account_id = 34;

#########################################################################################

#Query 10
#In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?

#Expected result:
#88
#90
#96
#97

#Solution Query 10

SELECT DISTINCT account_id FROM bank.order
WHERE order_id BETWEEN 29540 AND 29560;

#########################################################################################

#Query 11
#In the order table, what are the individual amounts that were sent to (account_to) id 30067122?

#Expected result:
#5123

#Solution Query 11

SELECT amount FROM bank.order 
WHERE account_to = 30067122;

#########################################################################################

#Query 12
#In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.

#Expected result:
#3556468	981231	PRIJEM	78.6
#233254	981216	VYDAJ	600
#233104	981212	VYDAJ	1212
#233248	981211	VYDAJ	851
#233176	981207	VYDAJ	204
#3556467	981130	PRIJEM	75.1
#233395	981130	VYDAJ	14.6
#233103	981112	VYDAJ	1212
#233247	981111	VYDAJ	851
#233175	981107	VYDAJ	204

#Solution Query 12

SELECT trans_id, 
		date, 
        type, 
        amount 
FROM bank.trans
WHERE account_id = 793
ORDER BY date DESC
LIMIT 10;

#########################################################################################
#########################################################################################

#Optional
#Query 13
#In the client table, of all districts with a district_id lower than 10, 
#how many clients are from each district_id? Show the results sorted by the 
#district_id in ascending order.

#Expected result:

#1	663
#2	46
#3	63
#4	50
#5	71
#6	53
#7	45
#8	69
#9	60

#Solution Query 13
SELECT district_id, count(client_id) FROM bank.client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id;

#########################################################################################

#Query 14
#In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.

#Expected result:
#classic	659
#junior	145
#gold	88

#Solution Query 14

SELECT type, count(card_id) FROM bank.card
GROUP BY type;

#########################################################################################

#Query 15
#Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.

#Expected result:
#7542	590820
#8926	566640
#2335	541200
#817	    538500
#2936	504000
#7049	495180
#10451	482940
#6950	475680
#7966	473280
#339	    468060

#Solution Query 15

SELECT account_id, sum(amount) as amount_sum FROM bank.loan
GROUP BY account_id
ORDER BY amount_sum DESC 
LIMIT 10;

#########################################################################################

#Query 16
#In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.

#Expected result:
#930906	1
#930803	1
#930728	1
#930711	1
#930705	1

#Solution Query 16
SELECT date, count(loan_id) as loan_count FROM bank.loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;

#########################################################################################

#Query 17
#In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.

#Expected result:

#971206	24	1
#971206	36	1
#971208	12	3
#971209	12	1
#971209	24	1
#971210	12	1
#971211	24	1
#971211	48	1
#971213	24	1
#971220	36	1
#971221	36	1
#971224	60	1
#971225	24	1
#971225	60	1

#Solution Query 17
#SELECT date, duration, count(loan_id) as loan_count  FROM bank.loan
#WHERE date < 930907
#GROUP BY duration
#ORDER BY date DESC;


SELECT date, duration, count(loan_id) as loan_count FROM bank.loan
WHERE date BETWEEN 971201 AND 971231
GROUP BY date, duration
ORDER BY date, duration ASC;

#########################################################################################

#Query 18
#In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.

#Expected result:
396	PRIJEM	1028138.6999740601
396	VYDAJ	1485814.400024414

#Solution Query 18

SELECT account_id, type, sum(amount) as total_amount FROM bank.trans
WHERE account_id = 396
GROUP BY type
ORDER BY type ASC;

#########################################################################################

#Query 19
#From the previous output, translate the values for type to English, rename the column to transaction_type, round total_amount down to an integer

#Expected result:
#396	INCOMING	1028138
#396	OUTGOING	1485814

#Solution Query 19
SELECT 
		account_id, 
		REPLACE(REPLACE(type,'PRIJEM','INCOMING'),'VYDAJ','OUTGOING') as transaction_type,
		ceiling(sum(amount)) as total_amount
FROM
		bank.trans
WHERE 
		account_id = 396
GROUP BY type
ORDER BY type ASC;

#########################################################################################

#Query 20
#From the previous result, modify your query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference.

#Expected result:

#396	1028138	1485814	-457676

#Solution Query 19

SELECT 
		account_id, 
		REPLACE(REPLACE(type,'PRIJEM','INCOMING'),'VYDAJ','OUTGOING') as transaction_type,
	    ceiling(sum(amount)) as 'incoming amount'
FROM
		bank.trans
WHERE 
		account_id = 396;
GROUP BY type

SELECT 
		account_id, 
		REPLACE(REPLACE(type,'PRIJEM','INCOMING'),'VYDAJ','OUTGOING') as transaction_type,
	    ceiling(sum(amount)) as 'outgoing amount'
FROM
		bank.trans
WHERE 
		account_id = 396
        transaction_type = 'OUTGOING'
GROUP BY type
ORDER BY type DESC;

#SELECT *FROM(
#		account_id,
#		ceiling(sum(amount)) as 'incoming amount',
#		ceiling(sum(amount)) as 'outgoing_amount'
#		REPLACE(REPLACE(type,'PRIJEM','INCOMING'),'VYDAJ','OUTGOING') as transaction_type,
#		WHERE 
#		account_id = 396
#)
#PIVOT (
 # CAST(avg(ceiling(sum(amount)) as 'incoming amount')AS DECIMAL (4,1))
  #FOR transaction_type in (
   # 1 PRIJEM, 2 VYDAJ
  #)
#ORDER BY year DESC



