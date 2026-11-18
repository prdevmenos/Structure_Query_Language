create database practice;

use practice;
create table Customers(
customer_id int primary key auto_increment,
customer_name varchar(40) not null,
email varchar(50) not null unique,
phone varchar(15),
city varchar(15),
created_at date
);

-- customer_id is auto incremented
Insert into Customers Values(101,"Ram", "ram@gmail.com", "8574961789", "Mumbai", '2023-07-15');
Insert into Customers Values(104,"Shyam", "Shy@gmail.com", '8464643351', "Delhi", '2024-08-03');
Insert into Customers Values(103,"Raghu", "Ragh@gmail.com", '7878474177', 'Pune', '2025-03-28');
Insert into Customers (customer_name, email, phone, city) Values("Raj", "raj@yahoo.com", '8777841258','Kanpur');
Insert into Customers (customer_name, email, phone, city) Values ("Shreya Patel", 'shreya@zoho.com','9948794655','Hyderabad');
Insert into Customers (customer_name, email, city, created_at) Values("Vikram Nair", "vikram@yahoo.com",'Bengaluru', '2025-09-26');
Insert into Customers (customer_name, email, city) Values ('Arjun Kapoor' ,'kapoor@zoho.com','Noida');

select * from Customers;

create table orders(
order_id int primary key auto_increment,
customer_id int not null,
order_date date not null,
product_name varchar(50) not null,
quantity int not null,
total_amount decimal(10,2) not null,
status varchar(30) default 'Pending',
Foreign key(customer_id) references
Customers(customer_id)
);

Insert into orders (customer_id, order_date, product_name, quantity, total_amount, status)
values(101, '2023-08-31',"Toothpaste", 3, 231.75,'Delivered'),(102, '2023-09-17',"Detergent", 5, 59.89,'Shipped'),
(105,'2023-10-19',"Shampoo", 98, 314.69, 'Deliverd'),(107, '2023-11-15', "Wheatfloor", 4, 645.57,'Pending');

select * from orders;

