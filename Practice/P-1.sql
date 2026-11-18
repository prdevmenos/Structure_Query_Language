use practice;
create table employee(
Eid int not null,
Emp_Name varchar(40),
Department varchar(25),
City varchar(20),
Salary int,
primary key(Eid)
);
drop table employee;
create table employee(
Eid int not null,
Emp_Name varchar(40),
Department varchar(25),
City varchar(20),
Salary int,
primary key(Eid)
);

create table salary_payments(
Eid int not null,
Pid int not null,
P_date date,
Amount int,
P_status varchar(30),
primary key(Pid),
foreign key(Eid) references employee(Eid)
);

insert into employee values(1001, "Rohan Kapoor", "Finance", "Mumbai", 75000);
insert into employee values(1002, "Anjali Singh", "Finance", "Mumbai", 68000);
insert into employee values(1003, "Priya Nair", "Marketing", "Delhi", 72000);
insert into employee values(1004, "Anjali Singh", "Marketing", "Delhi", 65000);
insert into employee values(1005, "Vikram Desai", "IT", "Pune", 90000);

select * from employee;

insert into salary_payments values(1001, 5001, '2024-01-31', 75000, "Paid");
insert into salary_payments values(1002, 5002, '2024-01-31', 68000, "Paid");
insert into salary_payments values(1003, 5003, '2024-01-31', 72000, "Pending");
insert into salary_payments values(1001, 5004, '2024-02-27', 58000, "Paid");

select * from salary_payments;

