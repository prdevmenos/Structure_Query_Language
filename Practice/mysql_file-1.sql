CREATE DATABASE company_hr;
USE company_hr;

CREATE TABLE employees(
	emp_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    salary DECIMAL(10,2),
    city VARCHAR(40),
    department VARCHAR(40),
    hire_date DATE,
    PRIMARY KEY(emp_id)
);

CREATE TABLE departments(
	dept_id INT NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR(40) NOT NULL,
    location VARCHAR(40),
    manager_id INT,
    emp_id INT,
    PRIMARY KEY(dept_id),
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

-- to verify the table structure in the database after creating a table.
DESC employees;
DESC departments;

INSERT INTO employees(first_name, last_name, email, phone, department, salary, hire_date) 
VALUES('Rohan', 'Kapoor', 'rohan@gmail.com','9845541780', 'Finance', 90000.00, '2026-05-26');

INSERT INTO employees(first_name, last_name, email, phone, department, salary, hire_date) 
VALUES
('Priya', 'Nair', 'priya.nair@company.com', '9845123456', 'Marketing', 68000.00, '2023-06-15'),
('Vikram', 'Desai', 'vikram.desai@company.com', '9712034567', 'IT', 90000.00, '2022-11-01'),
('Anjali', 'Mehta', 'anjali.mehta@company.com', '9654789012', 'HR', 62000.00, '2024-01-10'),
('Rahul', 'Sharma', 'rahul.sharma@company.com', '9123456789', 'Finance', 80000.00, '2021-08-20'),
('Sneha', 'Patel', 'sneha.patel@company.com', '9087654321', 'IT', 95000.00, '2020-03-12');

SELECT * FROM employees ;

CREATE TABLE books (
book_id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(200) NOT NULL,
author VARCHAR(150) NOT NULL,
isbn VARCHAR(20) UNIQUE, 
genre VARCHAR(80),
publisher VARCHAR(150),
publish_year YEAR, 
total_copies INT DEFAULT 1,
available_copies INT DEFAULT 1,
price DECIMAL(8,2),
is_available BOOLEAN DEFAULT TRUE,
added_date DATE DEFAULT (CURRENT_DATE),
PRIMARY KEY (book_id)
);

CREATE TABLE members (
member_id INT NOT NULL AUTO_INCREMENT,
full_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone VARCHAR(15),
membership_type VARCHAR(20) DEFAULT 'Standard',
join_date DATE NOT NULL,
expiry_date DATE,
is_active BOOLEAN DEFAULT TRUE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (member_id)
);

select * from departments;
select * from employees;

select first_name, last_name, department from employees;
select first_name, last_name, salary from employees;

select 
	first_name AS FIRST_NAME,
    last_name AS LAST_NAME,
    department AS DEPARTMENT,
    salary AS SALARY
from employees;

drop database diabetes;
