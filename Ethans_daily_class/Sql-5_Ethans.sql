use sakila;

select * from city;
select * from country;

-- Joins --
-- Inner Join --
select city.city, city.city_id, country.country, country.country_id 
from city  inner join country on city.country_id = country.country_id;

-- Right Join --
select city.city, city.city_id, country.country, country.country_id 
from city  right join country on city.country_id = country.country_id;

-- Left Join --
select city.city, city.city_id, country.country, country.country_id 
from city left join country on city.country_id = country.country_id;

select * from film;
select * from film_actor;

select film.title, film.description, film_actor.actor_id, film_actor.last_update
from film_actor left join film on film.film_id = film_actor.film_id;

-- Full Outer Join --
-- here we are using union / union all for outer join

select city.city, city.city_id, country.country, country.country_id 
from city  right join country on city.country_id = country.country_id
union all
select city.city, city.city_id, country.country, country.country_id 
from city left join country on city.country_id = country.country_id;

-- Natural Join --
select city.city from city natural join country;




