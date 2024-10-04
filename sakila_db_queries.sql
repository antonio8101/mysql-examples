-- select * from actor where last_name = 'DAVIS';

select * from actor where last_name like '%DAVIS%'; 


select * from actor where id in (177, 181);

select distinct last_update,first_name from actor;
select distinct last_update from actor;
select count(*) from actor;

select first_name, count(*) from actor WHERE first_name like '%M%' GROUP BY first_name HAVING count(*) > 1 ORDER BY count(*) desc;  



select title, release_year from film limit 20, 5;


select release_year from film GROUP by release_year;

select release_year from film GROUP by release_year;

# Trova il numero dei CUSTOMER per ciascuno STORE
select store_id, count(*) from customer group by store_id; 


select customer_table.customer_id as codice_cliente, sum(amount) as totale 
from payment group by customer_id having totale >= 100 order by totale desc limit 5; 

-- Trova quanto ha pagato solo un cliente
from payment -- STEP 0
where amount > 5 -- STEP 1 // SELECT ROWS 
select amount as parziale
---- 
order by parziale desc;


-- linq in c#
var result = from user in users
             where user.Age > 18
             select new { user.Name, user.Age, prezzo };
             
var result1 = from user in result
              where prezzo > 18
             select new { user.Name, user.Age }; // MAP - REDUCE


select concat(first_name, ' ' ,last_name) as nome from customer;

SELECT first_name, last_name FROM actor 
INNER JOIN film_actor fa USING(actor_id)
LIMIT 5;


SELECT 
    cst.customer_id, 
    cst.first_name, 
    cst.last_name, 
    cst.email,
    pct.totale,
    CONCAT(cty.city,' (',ctr.country,')') as city
FROM customer AS cst
-- DICHIARAZIONE della JOIN
INNER JOIN
(   
    -- SUBQUERIES nelle JOIN
    -- tabella o QUERY a cui legarsi
    SELECT 
        customer_id AS codice_cliente, 
        sum(amount) AS totale 
    FROM payment 
    GROUP BY customer_id 
    HAVING totale >= 100 
    ORDER BY totale DESC
    LIMIT 5
) AS pct -- alias
ON pct.codice_cliente = cst.customer_id -- criterio di unione
-- TABELLA
INNER JOIN
    address AS adr 
ON adr.address_id = cst.address_id
-- TABELLA
INNER JOIN
    city AS cty
ON cty.city_id = adr.city_id
-- TABELLA
INNER JOIN
    country AS ctr
ON ctr.country_id = cty.country_id
ORDER BY pct.totale DESC;

SELECT 
    ctr.country, 
    count(*) AS cities
FROM country AS ctr
LEFT JOIN city AS cty
ON ctr.country_id = cty.city_id
GROUP BY ctr.country_id;

SELECT country, count(*) as cities
FROM city
INNER JOIN country AS ctr
ON ctr.country_id = city.country_id
GROUP BY ctr.country
ORDER BY cities DESC;

-- UNION
SELECT first_name
FROM actor
UNION 
SELECT first_name
FROM customer

SELECT COUNT(*)
FROM (
    SELECT first_name
FROM actor
UNION 
SELECT first_name
FROM customer
) AS results

SELECT COUNT(*)
FROM (
    SELECT first_name
FROM actor
UNION ALL
SELECT first_name
FROM customer
) AS results

-- SUBQUERIES FROM
SELECT (
    SELECT COUNT(*)
    FROM (
        SELECT first_name
    FROM actor
    UNION 
    SELECT first_name
    FROM customer
    ) AS results 
) as union_results,
(
    SELECT COUNT(*)
    FROM (
        SELECT first_name
    FROM actor
    UNION 
    SELECT first_name
    FROM customer
    ) AS results 
) as union_all_results


-- SUBQUERIES
SELECT country, (
    -- SUBQUERIES nella SELECT (DOBBIAMO TORNARE UN REDORD / UNA COLONNA)
    SELECT COUNT(*) 
    FROM city 
    WHERE country_id = country.country_id 
) as cities
FROM country
ORDER BY cities DESC;

SELECT * FROM customer 
WHERE customer_id IN (
    -- SUBQUERIES nel WHERE (DOBBIAMO TORNARE UNA COLONNA)
    SELECT 
        customer_id AS codice_cliente 
    FROM payment 
    GROUP BY customer_id 
    HAVING sum(amount) >= 180
)

SELECT * FROM customer 
WHERE customer_id = (
    -- SUBQUERIES nel WHERE (DOBBIAMO TORNARE UNA COLONNA)
    SELECT 
        customer_id AS codice_cliente 
    FROM payment 
    GROUP BY customer_id 
    HAVING sum(amount) >= 180
    ORDER BY SUM(amount) DESC
    LIMIT 1
)




INSERT INTO actor (first_name, last_name)
VALUES 
    ('Paolo', 'Villaggio'),
    ('Teo', 'Teocoli'),
    ('Teo', 'Teocoli');