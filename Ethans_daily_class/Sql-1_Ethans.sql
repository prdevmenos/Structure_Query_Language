create database Ethans ;
use Ethans ;
-- Create Table --
-- Not Null --
create table Employee(
Eid int not null,
Salary int,
City varchar(30));

-- Unique --
create table student(
S_id int unique,
marks int,
Name varchar(30) not null,
gender varchar(10));

-- primary key & foreign key --
create table school_info(
Class_Id int not null,
teacher varchar(40),
student_name varchar(30),
primary key(Class_Id));

create table person(
Class_id int not null,
P_id int not null,
name varchar(20),
salary int, 
primary key(P_id),
foreign key(P_id) references school_info(Class_id));

-- check --
create table Fruits(
seed int not null check(seed > 0),
length int,
color varchar(10));

insert into Fruits values(2, 4, 'Red');
insert into Fruits values(0, 3, 'Red');
insert into Fruits values(4, 5, 'Green');
select * from Fruits;

-- default --
create table Employee1(
Eid int not null,
Salary int,
city varchar(20) default 'Pune');

insert into Employee1 values(11, 60000, default);
insert into Employee1 values(22, 120000, 'Mumbai');
select * from Employee1;

create table customers(
Customer_id int not null auto_increment,
Customer_Name varchar(40) not null,
City Varchar(20) default 'Pune',
primary key(Customer_Id)
);

create table orders(
Order_Id int not null auto_increment,
Customer_id int not null,
Order_Name varchar(30) not null,
primary key(Order_Id),
foreign key(Customer_id) references Customers(Customer_id)
);

Insert into customers (Customer_Name,City) Values("Raj Arya","Mumbai");
Insert into customers (Customer_Name,City) Values("Khushi Malik", "Bengaluru");
Insert into customers (Customer_Name,City) Values("Rajiv Manik","Hyderabad");
Insert into customers (Customer_Name,City) Values("Sreeja Roy","Kolkata");
Insert into customers (Customer_Name,City) Values("Monika Singh","Noida");
Insert into customers (Customer_Name,City) Values("Rajesh Kapoor","Pune"); 

select * from customers;
Insert into orders (Customer_id, Order_Name) Values(2, 'Toothbrush');
Insert into orders (Customer_id, Order_Name) Values(1, 'Toothpaste');
Insert into orders (Customer_id, Order_Name) Values(1, "Maggi");
Insert into orders (Customer_id, Order_Name) Values(2, "Rice");
Insert into orders (Customer_id, Order_Name) Values(5, "Pulse");
Insert into orders (Customer_id, Order_Name) Values(4, "Wheat");

select * from orders;

