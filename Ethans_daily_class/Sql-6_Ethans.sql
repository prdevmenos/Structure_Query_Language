SET SQL_SAFE_UPDATES = 0;
use batch22;
select * from Employee;

-- Delete --
delete from Employee where FirstName ='John';

-- Update --
Update Employee Set Department = 'Technology' where EmployeeId = 4;

-- Alter -- 
Alter table Employee Drop HireDate;
Alter table Employee Add Email varchar(50);

-- Commit and Rollback --
set autocommit  = 0;
delete from employee where FirstName = 'Sarah';
rollback;

-- Truncate --
Truncate table Employee;

-- Drop --
Drop Table Employee;
Drop database batch22;

