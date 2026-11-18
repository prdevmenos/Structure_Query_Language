use sakila;
-- like --
select * from customer;
-- select * from customer where first_name like 'D%'
-- Note : %D% this means d is present first_name in between, or start and ending also.
--        %D this means first_name ending with D.
--        D% this means first_name starting with D.
-- select * from customer where first_name like '%D%';
select * from customer where first_name like '%D';

-- and, or, not, like, in, not in, between -- 

-- order by :  this clause help the data to fetch in particular sequence like ascending or descending, it use to sort the 
-- result in ascending or descending order

select * from payment;
select staff_id, amount from payment order by amount desc;

select * from payment order by amount limit 2;
select * from payment order by payment_id limit 2;

select * from payment order by payment_id limit 2 offset 2;

-- Find second largest amount
select * from payment order by amount desc limit 1 offset 1;

