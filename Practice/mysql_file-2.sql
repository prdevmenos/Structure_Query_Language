use company_hr;
select * from employees;

-- copy all columns and all rows:
create table new_employee as 
select * from employees;

select * from new_employee;

-- copy selected data from table using where condition:
create table emp1 as 
select * from employees 
where emp_id > 3;

select * from emp1;

-- copy structure only - no data(using false where condition);
create table emp2 as
select * from employees
where 1 = 0;

select * from emp2;

create table customers(
customer_id INT UNIQUE AUTO_INCREMENT,
customer_name VARCHAR(50) NOT NULL,
email VARCHAR(30) UNIQUE NOT NULL,
phone VARCHAR(15),
city VARCHAR(40),
created_at DATE,
primary key(customer_id)
);

-- Insert five sample customers
-- customer_id is omitted — AUTO_INCREMENT assigns 1, 2, 3, 4, 5
INSERT INTO customers (customer_name, email, phone, city, created_at)
VALUES
('Rahul Mehta', 'rahul.mehta@email.com', '9876543210', 'Mumbai', '2023-06-01'),
('Priya Sharma', 'priya.sharma@email.com', '9123456780', 'Delhi', '2023-07-15'),
('Arjun Kapoor', 'arjun.kapoor@email.com', '9988776655', 'Bangalore', '2023-08-20'),
('Sneha Patel', 'sneha.patel@email.com', '9765432100', 'Ahmedabad', '2023-09-05'),
('Vikram Nair', 'vikram.nair@email.com', '9654321098', 'Chennai', '2023-10-12');

select * from customers;

create table orders(
order_id INT UNIQUE AUTO_INCREMENT,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
product_name VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
total_amount DECIMAL(10,2) NOT NULL,
status VARCHAR(30) DEFAULT'Pending',
primary key(order_id),
foreign key(customer_id) references customers(customer_id)
);

-- Insert sample orders
-- customer_id values must exist in the customers table (1 through 5)
INSERT INTO orders (customer_id, order_date, product_name, quantity, total_amount, status)
VALUES
(1, '2024-01-10', 'Laptop', 1, 75000.00, 'Delivered'),
(1, '2024-01-22', 'Wireless Mouse', 2, 1500.00, 'Delivered'),
(2, '2024-01-15', 'Smartphone', 1, 45000.00, 'Shipped'),
(3, '2024-02-01', 'Mechanical Keyboard', 1, 4500.00, 'Delivered'),
(3, '2024-02-18', 'Monitor', 1, 22000.00, 'Pending'),
(4, '2024-03-05', 'Headphones', 1, 3500.00, 'Delivered'),
(5, '2024-03-12', 'Webcam', 1, 2800.00, 'Shipped'),
(1, '2024-03-20', 'USB Hub', 1, 1200.00, 'Pending');

select * from orders;

select customers.customer_name, orders.product_name, orders.quantity
from customers
left join orders
on customers.customer_id = orders.customer_id;

SELECT
    customers.customer_name,
    orders.product_name,
    orders.quantity
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- below query written in professional standard.
select 
	c.customer_name,
    o.product_name,
    o.quantity
from customers c 
right join orders o
on c.customer_id = o.customer_id;

select
	c.customer_name, 
    o.order_id,
    o.product_name, 
    o.quantity, 
    o.total_amount,
    o.status
from customers c
inner join orders o
on c.customer_id = o.customer_id;


