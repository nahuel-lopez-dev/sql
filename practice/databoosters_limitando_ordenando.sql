USE world;
SELECT * FROM city;

##### ORDER BY
SELECT * FROM city ORDER BY Name; -- por orden alfabético
SELECT * FROM city ORDER BY Population;

SELECT Name AS Ciudad, Population AS habitantes FROM city ORDER BY Population;

SELECT Name AS Ciudad, Population AS habitantes FROM city
WHERE Population < 1000 
ORDER BY Population;

##### IS NULL, IS NOT NULL
USE numpidb;
show tables;
select * from estudiantes;

select * from estudiantes
where seccion_id is not null
order by seccion_id;
# o lo que es equivalente
select * from estudiantes
where not seccion_id is null
order by seccion_id;

select * from estudiantes
where seccion_id is null
order by seccion_id;
# o lo que es equivalente
select * from estudiantes
where not seccion_id is not null
order by seccion_id;

select * from estudiantes
order by seccion_id;

##### Ordenamiento ascendente ASC y descendente DESC
# por defecto se ordena ascendente ASC
use world;

select name as ciudad, population as habitantes 
from city 
order by ciudad desc;

select name as ciudad, population as habitantes 
from city 
order by habitantes desc;

select name as ciudad, population as habitantes 
from city 
order by habitantes desc;

-- Notar que no hace falta el asc en este caso
select name as ciudad, population as habitantes 
from city 
order by habitantes asc;

-- Desordenando, de forma aleatoria
select name as ciudad, population as habitantes 
from city 
order by RAND();

-- para generar datos aleatorios
select * from city order by rand();

##### Claúsula LIMIT
use world;
select * from city;

select * from city limit 10;
-- Obtener el top 5 de ciudades según sus habitantes
select name, population from city order by population desc limit 5;
-- Escrito correctamente por convención, aunque el resultado es el mismo
SELECT Name, Population FROM city ORDER BY population DESC LIMIT 5;

-- Obtener 5 ciudades de forma aleatoria
SELECT name FROM city ORDER BY RAND() limit 5;

##### Limitando los resultados por página
select * from city
limit 5;
# Ahora por página
select * from city
limit 10,5; -- muestra los id 11, 12, 13, 14 y 15
-- el primer parámetro del limite indica la cantidad de registros a partir de la que se empieza a contar, 
-- el segundo la cantidad que se muestra.
-- si no se pasan dos parámetros, toma como el primero 0, por lo que lo que pasemos indica la cantidad 
-- que se busca limitar

# los últimos 5 registros
select * from city
order by id desc
limit 5;

# o lo que es lo mismo:
select * from city
order by id desc
limit 0,5; -- arranca del último registro con el id 4079 (porque está ordenado con DESC) y limita 5 registros. Es lo mismo que poner limit 5

select * from city
order by id
limit 2,5; -- arranca del id 3 y limita 5 registros

##### Ejercicios #####
USE world;
SHOW TABLES;
-- 1. Consulta para obtener los cinco países más pequeños en área de la tabla "country" (Base de datos: world)
SELECT * FROM country; -- para ver las columnas con las que trabajar

SELECT Name AS Nombre, SurfaceArea AS superficie 
FROM country 
ORDER BY SurfaceArea -- es el equivalente a ponerle ASC porque es el que se usa por defecto.
LIMIT 5;

-- 2. Consulta para obtener los cinco empleados más jóvenes de la tabla "employees" (Base de datos: employees)
USE employees; -- seleccionando la base de datos a trabajar
SHOW TABLES; -- viendo las tablas de la base de datos employees
SELECT * FROM employees; -- para poder visualizar las columnas con las que se puede trabajar en la tabla employees

SELECT first_name AS nombre, last_name AS apellido, birth_date AS fecha_nacimiento
FROM employees
ORDER BY birth_date DESC
LIMIT 5;

-- 3. Consulta para obtener los cinco departamentos con los nombres más largos de la tabla "departments" (Base de datos: employees)
USE employees;
SHOW TABLES;
SELECT * FROM departments;

-- Haciendo la consulta sin seguir las convenciones, el resultado es el mismo:
select dept_name
from departments
order by length(dept_name) desc
limit 5;

-- 4. Consulta para obtener los 20 países con la mayor población de la tabla "country"
use world;
show tables;
select * from country;

select name as nombre, continent as continente, population as población
from country
order by population desc
limit 20;
