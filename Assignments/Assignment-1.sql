use sakila;

-- 1 --
-- Write a SQL query to fetch all columns from the” category" table. 
select * from category;

-- 2 --
-- Retrieve only the names from the "category" table. 
select name from category;

-- 3 --
-- Fetch the total number of counts in the "category" table.
select count(category_id) as Counting from category;

-- 4 --
-- Find the no. of counts from payment table where staff_id is greater than 2 and amount is less than 5. 
select * from payment;
select count(payment_id) as Counts from payment where staff_id > 2 and amount < 5; 

-- 5 --
-- Find the minimum and maximum values of column active from table customer. 
select * from customer;
select min(active), max(active) from customer;

-- 6 --
-- Retrieve the film id from table film where rental_rate = 4 
select * from film;
select film_id from film where rental_rate = 4;

-- 7 --
-- Retrieve the details of title from table film whose names start with the letter 'A'. 
select title from film where title like 'A%';

-- 8 --
-- Fetch the name of language from the "language" table in ascending order.
select * from language;
select name as Name from language order by name;




