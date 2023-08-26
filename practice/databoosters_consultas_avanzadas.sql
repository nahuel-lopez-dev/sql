########## Consultas avanzadas ##########
#########################################
use world;
show tables;
select * from country;

select Name as nombre, continent as continente, population as población from country where population > 150000000;
select name, continent, SurfaceArea from country where SurfaceArea > 9000000;

##### UNION y UNION ALL #####
SELECT Name, Continent FROM country WHERE Population > 150000000
UNION
SELECT Name, Continent FROM country WHERE SurfaceArea > 9000000;

##### Subconsulta (subquery) #####
-- Característica poderosa de MySQL que permite realizar consultas más complejas y flexibles.
-- Es una consulta anidada dentro de otra consulta, lo que significa que se utiliza el resultado de una consulta como entrada para otra consulta.
-- Esto permite combinar y relacionar datos de diferentes tablas o aplicar condiciones más específicas, siempre para extraer información.
-- A veces conviene usar algún JOIN, pero otras conviene usar una subconsulta.

-- Subconsulta en SELECT: 
-- PERMITE Construir una nueva columna
# SELECT Columna, (SELECT subconsulta) AS alias
# FROM tabla;

-- Subconsulta en WHERE: 
-- NO PERMITE Construir una nueva columna, pero condiciona la consulta con datos de otra tabla
# SELECT columna
# FROM tabla
# WHERE columna IN (SELECT subconsulta);

-- Subconsulta en HAVING: 
-- Para cuando se hace un GROUP BY y luego un HAVING. 
-- Se usa para datos agrupados, contar datos, extraer promedios, etc.
# SELECT columna
# FROM tabla
# GROUP BY columna
# HAVING columna IN (SELECT subconsulta);

-- Subconsulta con EXISTS: 
# SELECT columna
# FROM tabla
# WHERE EXISTS (SELECT subconsulta);


##### Subconsultas con cláusula EXISTS
SELECT * 
FROM city
WHERE city.CountryCode = "AGO"
AND city.Population > 1000000;

# subconsulta:
SELECT Name
FROM country -- el where exists va a transformar lo que sigue en un valor booleano
WHERE EXISTS(
	SELECT * 
    FROM city
    WHERE city.CountryCode = country.Code
    AND city.Population > 8000000
);

##### Subconsultas con cláusula SELECT
-- La subconsulta debe traer un único resultado, sino dará error
SELECT 
	Name AS País,
    (SELECT Language 
    FROM countrylanguage 
    WHERE CountryCode = country.Code 
    ORDER BY Percentage 
    DESC LIMIT 1) AS Lenguaje,
    (SELECT Percentage 
    FROM countrylanguage 
    WHERE CountryCode = country.Code 
    ORDER BY Percentage 
    DESC LIMIT 1) AS Porcentaje
FROM country;


##### Subconsultas con cláusula FROM
-- Para realizar la búsqueda sobre una tabla virtual, y así delimitar el rango de datos
SELECT * FROM country;
SELECT Name, Region, LifeExpectancy FROM country;

SELECT Region, LifeExpectancy 
FROM (SELECT Name, Region, LifeExpectancy FROM country) AS tb
WHERE LifeExpectancy > 80;

##### Subconsultas con cláusula WHERE
-- 
SELECT Name FROM country;
SELECT CountryCode FROM countrylanguage WHERE Language = "Spanish";

SELECT Name 
FROM country
WHERE Code in (
	SELECT CountryCode
    FROM countrylanguage
    WHERE Language = "Spanish"
);

##### Subconsultas con cláusula HAVING
-- 
SELECT * FROM country;
SELECT * FROM countrylanguage;
SELECT * FROM countrylanguage WHERE CountryCode = "COL";

SELECT COUNT(*)
FROM countrylanguage
WHERE countrylanguage.CountryCode = "COL";

SELECT Name 
FROM country
HAVING (
	SELECT COUNT(*)
    FROM countrylanguage
    WHERE countrylanguage.CountryCode = country.Code
)>10;

########## Ejercicios Subconsultas ##########
USE employees;
SHOW TABLES;

-- 1. Consulta para obtener los empleados con salarios superiores al salario promedio
SELECT * FROM salaries;

SELECT (SELECT CONCAT(first_name," ", last_name) FROM employees WHERE emp_no = salaries.emp_no) AS Empleado, salary
FROM salaries
WHERE salary > (
	SELECT AVG(salary) FROM salaries
);

-- 2. Consulta para obtener los países cuya población es mayor que la población promedio
USE world;
SHOW TABLES;

SELECT Name, Population
FROM country
WHERE Population > (
	SELECT AVG(Population) FROM country
);

-- 3. Consulta para obtener los países que tienen un área superior al área promedio de todos los países de su continente
SELECT Name, SurfaceArea
FROM country c1
WHERE SurfaceArea > (
	SELECT AVG(SurfaceArea) FROM country WHERE Continent = c1.Continent
);
 