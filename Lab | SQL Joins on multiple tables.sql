---- Lab | SQL Joins on multiple tables

--- 1 Write a query to display for each store its store ID, city, and country.
select city, country, SID
from staff_list 

--- 2. Write a query to display how much business, in dollars, each store brought in.
select sum(amount), staff_id
from payment
group by staff_id
order by sum(amount)

--- 3. What is the average running time of films by category?
select (sum(length)/count(length)), category
from film_list 
group by category
order by (sum(length)/count(length))

--- 4. Which film categories are longest?
select sum(length), category
from film_list 
group by category
order by sum(length) desc

--- 5. Display the most frequently rented movies in descending order.
select count(r.rental_id), i.inventory_id, f.film_id, f.title
from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on f.film_id = i.film_id
group by f.title, i.inventory_id, f.film_id, f.title
order by count(r.rental_id) desc

--- 6 List the top five genres in gross revenue in descending order.
select c.category_id, f.film_id, i.inventory_id, count(r.rental_id), c.name 
from category c
join film_category f on c.category_id = f.category_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by c.name, c.category_id, f.film_id, i.inventory_id
order by count(r.rental_id) asc

--- 7 Is "Academy Dinosaur" available for rent from Store 1?
select f.title, f.film_id, i.inventory_id, r.staff_id, s.store_id
from film f 
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join staff s on r.staff_id = s.staff_id
join store st on s.store_id = st.store_id
where f.title = 'Academy Dinosaur' 
having store_id = 1



