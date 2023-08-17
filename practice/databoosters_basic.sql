USE employees;
SHOW TABLES;

# Haciendo comentarios con : # y --
# Se describe la tabla
-- Se describe la tabla
DESCRIBE departments;

# utilizando la base de datos world
USE world;
# seleccionando todo lo que está en la tabla city
SELECT * FROM city;
# seleccionando columnas, el orden importa, ya que es el orden en que aparecerán en la consulta
SELECT id, name, population FROM city;
# seleccionando todo lo que está en la tabla country
SELECT * FROM country;
# condicionando la consulta
SELECT name, region FROM country;

########## alias ##########
-- Se pueden asignar alias con el mismo nombre, no genera error, tener cuidado con eso. Buscar nombres diferentes.
SELECT name AS nombre, region AS "Nombre de Region" FROM country;

########## Distinct ######### 
-- Para eliminar filas o registros repetidos
SELECT * FROM city;
select countrycode as "Código país" from city; 
SELECT countrycode as "Codigo pais" FROM city;
SELECT DISTINCT CountryCode as "Codigo pais", Name FROM city; 

########## Operadores aritméticos ########## 
SELECT 5-8; -- -3
SELECT 5+8; -- 13
SELECT 5*8; -- 40
SELECT 41/5; -- 8.2000
SELECT 41 DIV 5; -- 8
SELECT mod(41,5); -- 1

SHOW TABLES;
SELECT * FROM country;
SELECT Name, (Population/SurfaceArea) AS "Habitantes por km2" FROM country;

