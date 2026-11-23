use company;

-- Creating a Table named employees.

CREATE TABLE employees (
emp_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
job_title VARCHAR(100) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
hire_date DATE NOT NULL
);

-- Inserting a data into table employees.

INSERT INTO employees (first_name, department, job_title, salary, hire_date)
VALUES
('Rahul', 'IT', 'Software Engineer', 85000.00, '2021-03-15'),
('Priya', 'IT', 'Senior Engineer', 110000.00, '2019-06-01'),
('Vikram', 'IT', 'IT Manager', 130000.00, '2018-11-20'),
('Anjali', 'HR', 'HR Executive', 55000.00, '2022-01-10'),
('Sneha', 'HR', 'HR Manager', 78000.00, '2020-08-05'),
('Arjun', 'Finance', 'Finance Analyst', 72000.00, '2021-05-12'),
('Meena', 'Finance', 'Senior Analyst', 95000.00, '2019-09-20'),
('Rajesh', 'Finance', 'Finance Manager', 120000.00, '2017-03-01'),
('Kavya', 'Marketing', 'Content Strategist', 60000.00, '2022-07-01'),
('Rohan', 'Marketing', 'Marketing Manager', 88000.00, '2020-02-14');

-- To retrieve a data in the form of rows and columns.

select * from employees;

-- Group By approach
select department , avg(salary) as avg_salary
from employees
group by department;

-- Windows FUnction
select first_name, salary, department, 
AVG(salary) OVER(partition by department order by department) as Avg_Salary
from employees;

select emp_id, first_name, salary, department, job_title,
avg(salary) over(partition by job_title order by department) as avg_salary
from employees;

select emp_id, first_name, salary,
sum(salary) over() as sum_salary
from employees;

select emp_id, first_name, department, salary,
avg(salary) over() as avg_salary
from employees;

select emp_id, first_name, department, salary,
avg(salary) over(partition by department) as AVG_Salary
from employees;

select emp_id, first_name, department, salary,
avg(salary) over(partition by department order by salary desc) as salary_mean
from employees;

-- Partition by with count(*).
select first_name, department,
count(*) over(partition by department) emp_count
from employees;

-- order by inside over() clause - to sort a window
select first_name, department, salary, 
avg(salary) over(partition by department order by salary desc) as salary_avg
from employees;

select first_name, department, salary, 
avg(salary) over(partition by department order by salary asc) as salary_avg
from employees;

-- order by without partition by in windows function.
select first_name, department, salary,
avg(salary) over(order by salary asc) as SALARY_AVG
from employees;

-- Aggregate Window Function
SELECT first_name, department, salary,

-- Partition total: sum of all salaries in this department
SUM(salary) OVER (PARTITION BY department) AS dept_total,

-- Running total: cumulative sum within department by salary order
SUM(salary) OVER (PARTITION BY department ORDER BY salary)
running_dept_total,

-- Salary as % of department total (rounded to 1 decimal)
ROUND(salary / SUM(salary) OVER (PARTITION BY department) * 100,1) AS pct_of_dept
FROM employees
ORDER BY department, salary;

-- Count/head count with window function
SELECT first_name, department, hire_date,

-- Total number of employees in the same department
COUNT(*) OVER (PARTITION BY department) AS dept_headcount,

-- Cumulative count of employees hired up to and including this employee
COUNT(*) OVER (PARTITION BY department ORDER BY hire_date) AS cumulative_hires
FROM employees
ORDER BY department, hire_date;

-- AVG — Per-Department Average and Variance from Average
select first_name, department, salary,hire_date,
round(avg(salary) over(partition by department),2) as dept_avg,
round(salary - avg(salary) over(partition by department),2) as diff_avg
from employees
order by department, salary;

