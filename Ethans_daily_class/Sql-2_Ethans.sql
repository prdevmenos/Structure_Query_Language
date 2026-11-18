use sakila;
-- to fetch all column data
select * from customer;
-- to fetch the data of which column you want i.e, particular column to fetch.
select customer_id, first_name, active from customer;
-- Note : Select very important command that is used in sql prominently to fetch data from database.

-- SQL Clauses
-- The SQL where clause : the where clause allows user to filter data from the table. the where clause allows user to extract only those records that specify a specified condition.

-- where clause  query --
select * from customer where active = 1;
select * from customer where active = 0;

select customer_id, first_name, active from customer where active = 1;
select customer_id, first_name, active from customer where active = 0;

select * from customer;
select * from store;

Select * from Customer where first_name like "M%";
Select * from Customer where first_Name like "%G";
Select * from Customer where last_name like "%L";
Select * from Customer where email like "%org";
Select * from Customer where email like "%@%";






