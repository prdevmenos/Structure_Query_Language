Create Database Solving_Questions;
use Solving_Questions;

-- Create Table --
Create table Student(
Id int unique,
FirstName varchar(30) not null,
Lastname varchar(30),
Salary int,
Email varchar(45)
); 

Create table Employee(
Employee_id int unique,
Name varchar(30) not null,
Age int check(Age > 0),
Salary decimal(10,2)
);

-- Add column into Employee --
Alter Table Employee add email varchar(40);
select * from Employee;

-- Modify Column datatype --
Alter Table Employee modify Salary int;

-- Drop or remove a column from Table --
Alter Table Employee drop email;
select * from Employee;

-- Modify a new constraint to a existing table --
Alter Table Employee modify Employee_id int primary key; 
Alter Table Employee Add Constraint UC_Name Unique (Name);
Select * From Employee ;

-- Add a Foreign Key --
-- Example 1
Create table Employee1(
Employee_id int not null,
Name varchar(30) not null,
Age int,
Salary int,
primary key(Employee_Id)
);

Create Table Person(
Employee_Id int not null,
Person_Id int not null,
FirstName varchar(20),
LastName varchar(20),
Email varchar(40),
primary key(Person_Id),
foreign key(Person_Id) references Employee1(Employee_Id)
);

-- Example 2
Create Table Department(
Department_Id int primary key,
Department_Name varchar(50)
);

Alter Table Employee add Department_id int, 
add constraint FK_Department foreign key (Department_id) references Department(Department_id);

-- drop a table --
Drop table Student;

-- truncate a table --
-- Write a SQL query to remove all rows from a table while retaining its structure.


select * from emp1 where salary > 60000;
select name from emp1 where department = 'HR';
select * from emp where age > 30;
select * from emp where Hiredate = '2021/01/01';
select * from emp where city in ('Pune','Mumbai');
select * from emp where salary between 40000 and 60000;
select * from emp where name like 'S%';
select * from emp where department != 'IT';
