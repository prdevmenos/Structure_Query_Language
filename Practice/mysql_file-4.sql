use company_hr;
select * from employees;

-- CASE Statement in SQL
-- Classify employees by salary band

select first_name, last_name, salary,
case 
	when salary < 70000 then'Entry Level'
	when salary >= 70000 and salary < 90000 then 'Mid Level'
	when salary >= 90000 then 'Senior Level'
	else 'Unclassified'
end as salary_band
from employees;

select first_name, last_name, department,
case
	when salary < 50000 then 'Entry Level'
    when salary >= 50000 and salary < 75000 then 'Mid Level'
    when salary >= 75000 and salary < 90000 then 'Senior Level'
    when salary >= 90000 then 'Senior Most Level'
    else 'Unclassified'
end as Salary_Band
from employees;
