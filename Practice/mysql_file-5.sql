create database company;
use company;

-- Data Cleaning and Transformation
-- creating a table named as employee_raw below:

CREATE TABLE employees_raw (
emp_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(150),
phone VARCHAR(20),
department VARCHAR(50),
salary DECIMAL(10,2),
hire_date DATE,
city VARCHAR(50),
is_active VARCHAR(10)
);

-- Inserting raw data into above created schema of particular table.alter

INSERT INTO employees_raw
(first_name, last_name, email, phone, department, salary, hire_date, city, is_active)
VALUES
(' Rahul ','Mehta', 'rahul.mehta@email.com', '9876543210','IT', 90000.00,'2022-03-15','Mumbai', 'Yes'),
('priya', 'sharma', 'PRIYA.SHARMA@EMAIL.COM', NULL, 'marketing', 75000.00,'2021-06-01','delhi', 'yes'),
('VIKRAM', 'Desai', 'vikram.desai@email.com', '9988776655','IT', NULL, '2020-11-20','Hyderabad','YES'),
('Anjali', 'Mehta', NULL, '9765432100','HR', 62000.00,'2023-01-10','Delhi', 'No'),
('sneha', 'Patel', 'sneha.patel@email.com', '9654321098', NULL, 95000.00,'2019-08-05','pune', 'yes'),
('Rahul', 'Sharma', 'rahul.sharma@email.com', '0', 'Finance', 80000.00,'2020-05-12','Mumbai', 'Yes'),
(' Kavya ','Reddy', 'kavya.reddy@email.com', '9812345670','Marketing', 68000.00,'2022-09-01','Bangalore','YES'),
('Arjun', NULL, 'arjun.singh@email.com', '9123456789','HR', 72000.00,'2021-03-20', NULL, 'Yes'),
('Meena', 'Kumar', 'meena.kumar@email.com', NULL, 'IT', -5000.00,'2023-07-15','Chennai', 'yes'),
('Rajesh', 'Iyer', 'rajesh.iyer@email.com', '9900112233','Finance', 88000.00, NULL, 'Hyderabad', NULL);

select * from employees_raw;

-- Step-1 : Count Total Rows
-- How many rows present in table ?

select count(*) as total_rows from employees_raw;

-- Step-2 : Count null values per column
-- Count NULLs in every column at once

select
	COUNT(*) - COUNT(first_name) AS null_first_name,
    COUNT(*) - COUNT(last_name) AS null_last_name,
    COUNT(*) - COUNT(email) AS null_email,
	COUNT(*) - COUNT(phone) AS null_phone,
	COUNT(*) - COUNT(department) AS null_department,
	COUNT(*) - COUNT(salary) AS null_salary,
	COUNT(*) - COUNT(hire_date) AS null_hire_date,
	COUNT(*) - COUNT(city) AS null_city,
	COUNT(*) - COUNT(is_active) AS null_is_active
FROM employees_raw;

-- Step-3 : Identify Invalid Numeric values
-- Find Employees with a NULL or Impossible Salary.

select emp_id, first_name, salary
from employees_raw
where salary <= 0 or salary is null;

-- Step-4 : Identify invalid placeholder values
-- Detect phone number stored as obvious placehoders.

select emp_id, first_name, phone
from employees_raw
where phone = '0'or
	  phone = 'N/A' or
      length(trim(phone)) = 0;
      
-- Step-5 : Identify inconsistent capitalization
-- Check all distinct department values and their counts.

select department, count(*) as row_count
from employees_raw
group by department
order by department;

-- Find every row that has at least one NULL in any column
SELECT emp_id, first_name, last_name, email,
phone, department, salary, hire_date, city, is_active
FROM employees_raw
WHERE first_name IS NULL
OR last_name IS NULL
OR email IS NULL
OR phone IS NULL
OR department IS NULL
OR salary IS NULL
OR hire_date IS NULL
OR city IS NULL
OR is_active IS NULL;

-- How many rows have at least one NULL?
SELECT COUNT(*) AS incomplete_rows
FROM employees_raw
WHERE first_name IS NULL OR last_name IS NULL OR email IS NULL
OR phone IS NULL OR department IS NULL OR salary IS NULL
OR hire_date IS NULL OR city IS NULL OR is_active IS NULL;

-- Get a Null Count of every column
-- Complete NULL audit: count and percentage for each column
SELECT 'first_name' AS column_name,
COUNT(*) - COUNT(first_name) AS null_count,
ROUND((COUNT(*) - COUNT(first_name)) * 100.0 / COUNT(*), 1) AS null_pct
FROM employees_raw UNION ALL
SELECT 'last_name', COUNT(*) - COUNT(last_name),
ROUND((COUNT(*) - COUNT(last_name)) * 100.0 / COUNT(*), 1) FROM employees_raw UNION ALL
SELECT 'email', COUNT(*) - COUNT(email),
ROUND((COUNT(*) - COUNT(email)) * 100.0 / COUNT(*), 1) FROM employees_raw UNION ALL
SELECT 'phone', COUNT(*) - COUNT(phone),
ROUND((COUNT(*) - COUNT(phone)) * 100.0 / COUNT(*), 1) FROM employees_raw UNION ALL
SELECT 'department', COUNT(*) - COUNT(department),
ROUND((COUNT(*) - COUNT(department)) * 100.0 / COUNT(*), 1) FROM employees_raw UNION ALL
SELECT 'salary', COUNT(*) - COUNT(salary),
ROUND((COUNT(*) - COUNT(salary)) * 100.0 / COUNT(*), 1) FROM employees_raw UNION ALL
SELECT 'city', COUNT(*) - COUNT(city),
ROUND((COUNT(*) - COUNT(city)) * 100.0 / COUNT(*), 1) FROM employees_raw UNION ALL
SELECT 'is_active', COUNT(*) - COUNT(is_active),
ROUND((COUNT(*) - COUNT(is_active)) * 100.0 / COUNT(*), 1) FROM employees_raw
ORDER BY null_count DESC;

-- Employees with known salary.
-- Returned those employees where salary has been entered.

select emp_id, first_name, salary
from employees_raw
where salary is not null;

-- IS NOT NULL on Multiple Columns
-- Rows complete enough for a valid salary-by-department analysis

select emp_id, first_name, salary, department
from employees_raw
where salary is not null and
	  department is not null and
      salary > 0;

-- Repalcing Null Value with a fallback value or default value.
-- Show all employees; display 'Not Provided' where phone is NULL
SELECT emp_id, first_name,
	   COALESCE(phone, 'Not Provided') AS phone_display
FROM employees_raw; 

select emp_id, first_name,
	   coalesce(department, 'NA') as Department_Name
from employees_raw;

-- NULLIF() Function
-- Convert Phone'0' to null
-- Convert the '0' placeholder to NULL
select emp_id, first_name,
	   nullif(phone, '0') as phone_number
from employees_raw;

-- Combining NULLIF with COALESCE
-- Step 1: NULLIF converts '0' → NULL
-- Step 2: COALESCE converts NULL → 'Not Provided'
select emp_id, first_name,
	   coalesce(nullif(phone, '0'), 'Not Provided') as PHONE
from employees_raw;


