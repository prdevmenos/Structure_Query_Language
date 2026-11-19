use company_hr;

-- INNER JOIN + WHERE: only delivered orders

select
	c.customer_name, 
    o.order_id,
    o.product_name, 
    o.quantity, 
    o.total_amount,
    o.status
from customers c
inner join orders o
on c.customer_id = o.customer_id
where o.status = 'Delivered';

select
	c.customer_name, 
    o.order_id,
    o.product_name, 
    o.quantity, 
    o.total_amount,
    o.status
from customers c
inner join orders o
on c.customer_id = o.customer_id
where o.status = 'Pending';


-- Inner Join with Aggregation
-- Total spending per customer (only customers who have ordered)

select 
	c.customer_name,
    count(o.order_id) as total_orders,
    sum(o.total_amount) as total_spent
from customers c
inner join orders o
on c.customer_id = o.customer_id
group by c.customer_name
order by total_spent DESC;
    
-- SQL Left Join
-- syntax

select c.customer_name, o.order_id, o.product_name
from customers c 
left join orders o 
on c.customer_id = o.customer_id;

-- LEFT JOIN: all customers, orders where available

select
	c.customer_id,
    c.customer_name,
    o.order_id,
    o.product_name,
    o.total_amount
from customers c
left join orders o 
on c.customer_id = o.customer_id;

-- Find customers who have never placed any order

select
	c.customer_id,
    c.customer_name,
    c.email
from customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is null;

-- Count orders per customer — include customers with 0 orders
select
	c.customer_name,
    count(o.order_id) as order_count
from customers c
left join orders o 
on c.customer_id = o.customer_id
group by c.customer_name
order by order_count DESC;

-- SQL Right Join
-- Syntax

select c.customer_name, o.order_id, o.product_name
from customers c
right join orders o 
on c.customer_id = o.customer_id;

-- RIGHT JOIN: all orders, customer details where available
select
	c.customer_name,
    c.city,
    o.order_id,
    o.product_name,
    o.total_amount
from customers c 
right join orders o 
on c.customer_id = o.customer_id;

-- SQL Full Join
-- Syntax

-- FULL JOIN: all customers and all orders
-- Standard SQL (works in PostgreSQL, SQL Server):
-- MySQL equivalent using UNION:

select 
	c.customer_name,
    o.order_id,
    o.product_name,
    o.total_amount
from customers c 
left join orders o 
on c.customer_id = o.customer_id
union
select
	c.customer_name,
    o.order_id,
    o.product_name,
    o.total_amount
from customers c 
right join orders o 
on c.customer_id = o.customer_id;

-- SQL Self Join
select * from employees;
