# funciones de agregación: COUNT, SUM, AVG, MAX, MIN
use world;
show tables;
select * from country;

# SUM()
SELECT SUM(SurfaceArea) AS 'Area Total' FROM country;

# AVG()
SELECT SUM(SurfaceArea) AS 'Area Total',
AVG(LifeExpectancy) AS 'Esperanza de vida media'
FROM country;

# COUNT()
SELECT
COUNT(*) AS 'Total de países',
SUM(SurfaceArea) AS 'Area Total',
AVG(LifeExpectancy) AS 'Esperanza de vida media'
FROM country;

# MIN()
SELECT
COUNT(*) AS 'Total de países',
SUM(SurfaceArea) AS 'Area Total',
AVG(LifeExpectancy) AS 'Esperanza de vida media',
MIN(LifeExpectancy) AS 'Mínima esperanza de vida'
FROM country;

# MAX()
SELECT
COUNT(*) AS 'Total de países',
SUM(SurfaceArea) AS 'Area Total',
AVG(LifeExpectancy) AS 'Esperanza de vida media',
MIN(LifeExpectancy) AS 'Mínima esperanza de vida',
MAX(LifeExpectancy) AS 'Máxima esperanza de vida'
FROM country;

# Ejercicio:
# Encontrar un intervalo típico para la esperanza de vida
SELECT * FROM country;

SELECT AVG(LifeExpectancy) AS 'Esp. vida media', STDDEV(LifeExpectancy) AS 'Desviación Estandar' FROM country;

SELECT ROUND(AVG(LifeExpectancy) - STDDEV(LifeExpectancy)) AS 'Lim inf',
ROUND(AVG(LifeExpectancy) + STDDEV(LifeExpectancy)) AS 'Lim sup' 
FROM country;

# Claúsula GROUP BY
SELECT * FROM country;
-- Encontrar la superficie total de cada continente
SELECT Continent AS 'Continente', SUM(SurfaceArea) AS 'Sup. del Continente'
FROM country
GROUP BY Continent;

-- Encontrar la esperanza de vida media para cada continente
SELECT * FROM country;

SELECT Continent AS 'Continente', AVG(LifeExpectancy) AS 'Esperanza de vida media'
FROM country
GROUP BY Continent ORDER BY AVG(LifeExpectancy);

# Claúsula HAVING
select * from country;

-- Mostrar los continentes con una esperanza de vida mayor a 70 años
SELECT Continent AS 'Continente', AVG(LifeExpectancy) AS 'Esperanza de vida'
FROM country
GROUP BY Continent
HAVING AVG(LifeExpectancy)> 70
ORDER BY AVG(LifeExpectancy);
-- WHERE con columnas normales, el HAVING requiere comparar con una función de agregación.

##### Orden para hacer las querys #####
# SELECT ... AS 'Alias' FROM tableX
# GROUP BY
# HAVING + función de agregación y comparación
# ORDER BY

# Ejercicios
# Funciones de agregación usando la tabla numpidb
use numpidb;
show tables;
select * from imc;

-- 1. Obtener el índice de masa corporal promedio para las mujeres y para los hombres
select sexo, round(avg(imc), 2) as 'IMC promedio' from imc group by sexo;

-- 2. Calcular la edad promedio de los estudiantes
select round(avg(edad),2) as 'Edad promedio' from estudiantes;

-- 3. Obtener el mínimo, máximo y el promedio del índice de masa corporal para cada edad
select * from imc;
select edad, min(imc) as 'IMC mínimo', max(imc) as 'IMC máximo', round(avg(imc),2) as 'IMC promedio' from imc group by edad order by edad;

