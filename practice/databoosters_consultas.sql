USE employees;

# Clausula WHERE para aplicar filtros a las consultas
SELECT * FROM salaries WHERE salary = 40000;

# operadores de comparación: = != > < >= <= 
SELECT 5 > 4; -- 1 VERDADERO
SELECT 7 < 2; -- 0 FALSO

SELECT * FROM salaries WHERE salary > 135000;

# operadores lógicos AND, OR y NOT
SELECT TRUE AND TRUE;
SELECT TRUE OR FALSE;
SELECT NOT FALSE AND NOT FALSE;

SELECT * FROM employees WHERE gender = "M" AND last_name = "Facello";

# Diferencia entre NOT y !=
-- != compara dos cantidades y devuelve un booleano
-- NOT cambia el valor a un valor booleano

SELECT NOT FALSE;
SELECT FALSE != FALSE;
SELECT 5!=3; -- Devuelve un booleano comparando dos cosas
SELECT 'HOLA' != 'HOLA1';

SELECT * FROM employees;
SELECT * FROM employees WHERE gender != 'M';
SELECT * FROM employees WHERE NOt gender = 'M';

# operador BETWEEN para donde las claúsulas WHERE tengan un rango
SELECT * FROM employees WHERE emp_no BETWEEN 10001 AND 10005; -- es más específico para rangos
SELECT * FROM employees WHERE emp_no >= 10001 AND emp_no <= 10005; -- sería lo equivalente con operadores lógicos
SELECT * FROM employees WHERE birth_date BETWEEN "1953-01-01" AND "1953-12-31"; -- Buscando a todos los empleados que nacieron en 1953
SELECT * FROM employees WHERE birth_date BETWEEN "1953-12-31" AND "1953-01-01"; -- Funciona si está ordenado de menor a mayor, por eso en este caso no funciona
SELECT * FROM employees WHERE birth_date NOT BETWEEN "1953-01-01" AND "1953-12-31"; -- Buscando a todos los empleados que NO nacieron en 1953

# operador LIKE para encontrar patrones dentro de cadenas, como en las regex
SELECT * FROM employees;
SELECT * FROM employees WHERE first_name LIKE "Ge%"; -- SQL soporta dos comodines: % no importa lo que sigue
SELECT * FROM employees WHERE first_name LIKE "_e%"; -- SQL soporta dos comodines: _ no importa que caracter sea
# la primer letra no importa cual sea, la segunda es la e y lo demás puede ser lo que sea.alter

SELECT * FROM employees WHERE birth_date LIKE "1953%"; -- Todos los empleados que nacieron en 1953, equivalente al BETWEEN de arrib pero más corto
SELECT * FROM employees WHERE birth_date LIKE "%09___"; -- Todos los empleados que nacieron en septiembre

SELECT * FROM employees WHERE first_name LIKE "%o"; -- Todos los empleados cuyo nombre terminan en o
SELECT * FROM employees WHERE first_name LIKE "p%o"; -- Todos los empleados cuyo nombre empiezan con p y terminan en o. Notar que no es caseSensitive

# operador IN 
SELECT * FROM employees;
SELECT * FROM employees WHERE first_name = "Parto" OR first_name = "Georgi";

SELECT * FROM employees WHERE first_name IN ("Parto", "Georgi", "Chirstian"); -- es equivalente a la concatenación de nombres

# Ejemplos prácticos de consultas con filtros:
-- 1. Encontrar los empleados contratados luego de una determinada fecha y sean de género femenino
SELECT * FROM employees WHERE hire_date > "1995-12-31" AND gender = "F";

-- 2. Encontrar los empleados varones que tienen una edad actual de 60 años
SELECT first_name AS nombre, last_name AS apellido, DATEDIFF("2023-08-11", birth_date)/365 AS edad 
FROM employees 
WHERE DATEDIFF("2023-08-11", birth_date)/365 >= 60 AND DATEDIFF("2023-08-11", birth_date)/365 < 61; 

