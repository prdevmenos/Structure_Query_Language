-- view --

use batch22;
create view xyz as select firstname, lastname from employee;
select * from employee;
select * from xyz;

select now();
select curdate();
select curtime();
use sakila;

create  view Inner_ as select city.city, country.country from city inner join country on city.country_id = country.country_id;
select * from Inner_;
select * from payment;
select last_update, date_add(last_update, interval 2 year) as L from payment; 
select * from continent;