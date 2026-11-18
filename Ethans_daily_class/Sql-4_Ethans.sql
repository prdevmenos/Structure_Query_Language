-- Functions --
-- Aggregate Functions --
-- avg --
use sakila;

select * from payment;
select avg(amount) from payment;
select avg(amount) from payment where rental_id = 2;
-- practice --
select * from payment;
select sum(amount), avg(amount) from payment;
select sum(amount), avg(amount) from payment where rental_id = 2;

-- sum --
select sum(amount) from payment;
select sum(amount) from payment where staff_id = 1;

-- min & max--
select max(amount) from payment;
select min(amount) from payment;

-- as for aliasing --
select first_name as fn from customer;
select max(amount) as Maximum_Amount from payment;

-- round --
select amount from payment;
select amount, round(amount, 1) as rounding from payment;

-- Character Function --
-- concat --
select concat(staff_id, payment_id) as Id from payment;
select staff_id, payment_id, concat(staff_id, payment_id) as Id from payment;

-- length --
select * from language;
select name, length(name) as L from language;

-- upper / lower --
select name, upper(name) from language;
select name, lower(name) from language;
select name, lower(name), upper(name) from language;
select upper(name) from language where name = 'English';

-- substring -- 
select name, substring(name, 1, 3) as first_3 from language;
select name, substr(name, 1, 2) as first_2 from language;
-- right --
select name, right(name, 3) from language;
select * from film;
select title, right(title, 5) from film; 
-- left --
select name, left(name, 3) from language;
select title, left(title, 5) from film; 

-- replace --
select description, replace(description, 'A ', 'The ') from film;
select length, description, replace(description, 'A ', 'The ') from film where length = 133;

-- Window Function --
-- It can be applied selected rows(record), we can say particular window in table. 
-- OVER clause in window function
-- types-> 1. Aggregate 2. Ranking 3. Value

-- 1. Aggregate --
-- avg --
use batch22;
select * from employee;
select Department, avg(Salary) over(partition by Department) from employee;
select FirstName, LastName, Department, sum(salary) over(partition by Department) as Sum_Salary from employee;

-- 2. Rank --
select FirstName, LastName, Salary, Department, rank() over(order by salary) as Rank_ from employee;
select FirstName, LastName, Salary, Department, rank() over(partition by Department order by salary) as Rank_ from employee;
-- Note : dense_rank --
select FirstName, LastName, Salary, Department, dense_rank() over(order by salary desc) as Rank_ from employee;

-- row_number() --
select FirstName, LastName, Salary, Department, row_number() over(order by salary desc) from employee;
select FirstName, LastName, Salary, Department, row_number() over(partition by Department order by salary desc) 
as Row_Number_ from employee;

-- lead & lag --
select FirstName, LastName, Salary, Department, lead(salary) over() as Lead_ from employee;
select FirstName, LastName, Salary, Department, lag(salary) over(partition by department) as Lag_ from employee;
select FirstName, LastName, Salary, Department, lag(salary) over(partition by department order by salary) 
as Lag_ from employee;

-- ntile --
select FirstName, LastName, Salary, Department, ntile(3) over() as Groups_ from employee;
select FirstName, LastName, Salary, Department, ntile(3) over(order by Salary) as Groups_ from employee;
select FirstName, LastName, Salary, Department, ntile(3) over(partition by Department order by Salary) 
as Groups_ from employee;