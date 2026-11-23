use company;

-- Ranking Functions
-- Ranking functions are - RANK(), ROW_NUMBER(), DENSE_RANK(), NTILE().

-- Note : ranking window function always takes order by clause inside over() clause. 

select first_name, salary, department,
row_number() over(partition by department order by salary desc) as salary_rank
from employees
order by department, salary desc;

-- Demonstrating RANK() — add a duplicate salary to see tie behaviour
-- (In our dataset, Priya earns 110,000 and Vikram earns 130,000 — no ties)
-- Below we show the output with a hypothetical tie in the IT department)
SELECT first_name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY department, salary DESC;

select first_name, department, salary,
rank() over(partition by department order by salary desc) as salary_rank
from employees
order by department, salary desc;

-- DENSE_RANK() - ranking with no gaps
SELECT first_name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_with_gap,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_no_gap
FROM employees
ORDER BY department, salary DESC;


