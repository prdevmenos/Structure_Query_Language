use batch22;
select * from dept;
select * from emp;
select * from salgrade;

-- display all emp name who reporting to Blake
select ename from emp where mgr = (
select empno from emp where ename = 'BlAKE'); 

-- display emp details who are working in Chicago.
select * from emp 
where deptno = (select deptno from dept where loc ='Chicago');

-- display all emp who salary is less than avg salary
select * from emp
where sal < (select avg(sal) from emp);

-- List the emp details whose salary is greateer than the lowest salary of emp belonging to deptno = 20 
select * from emp
where sal > (select min(sal) from emp group by deptno having deptno = 20);

-- Multirow --
-- display emp details who are working in accounting and sales deapartments
select empno, ename, sal, deptno from emp 
where deptno in(select deptno from dept where dname in('accounting','sales'));

-- display the emp details who are getting max salary in each department.
select empno, ename, sal, deptno from emp
where sal in(select max(sal) from emp group by deptno);

-- list all employee name who have atleast one person reporting to them.
select ename from emp where empno in(select mgr from emp);
 
-- find out the names of emp who have receive salary less than the average salary for each type of job.
select ename from emp 
where sal < all(select avg(sal) from emp group by job); 

-- find out the names of emp who have receive salary less than either of average salary for each type of job
select ename from emp 
where sal < any(select avg(sal) from emp group by job); 
