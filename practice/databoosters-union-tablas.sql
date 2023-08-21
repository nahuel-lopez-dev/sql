########## Unión de tablas ##########
-- Llave primaria o Primary Key
# Se utiliza para identificar en forma única cada línea (registro) de una tabla
# No puede tener valores nulos

-- Llave foránea o Foraign Key
# Es una limitación referencial entre dos tablas.
# La clave foránea identifica un campo en una tabla (tabla hija o referendo) que se refiere a un campo de otra tabla (tabla padre o referenciada)

use numpidb;
show tables;

##### INNER JOIN #####
select * from estudiantes;
select * from secciones;

SELECT E.nombre AS estudiantes, S.id AS seccion FROM estudiantes E
JOIN secciones S
ON E.seccion_id = S.id;
-- Notar que: JOIN es lo mismo que INNER JOIN 
-- Al escribir JOIN se toma por defecto un INNER JOIN

##### LEFT JOIN #####
select * from estudiantes;
select * from secciones;

SELECT * FROM estudiantes E
LEFT JOIN secciones S
ON E.seccion_id = S.id;

##### RIGHT JOIN #####
select * from estudiantes;
select * from secciones;

# Se espera que todos los registros de secciones aparezcan 
# y de estudiantes aparezcan solo aquellos que hagan math
# con secciones
SELECT * FROM estudiantes E
RIGHT JOIN secciones S
ON E.seccion_id = S.id;

##### Notar la diferencia con LEFT JOIN
SELECT * FROM estudiantes E
LEFT JOIN secciones S
ON E.seccion_id = S.id;

##### Notar la diferencia con INNER JOIN
SELECT * FROM estudiantes E
INNER JOIN secciones S
ON E.seccion_id = S.id;


##### JOIN con múltiples tablas #####
USE employees;
SHOW TABLES;

SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

# obteniendo el nombre y apellido de un empleado con su respectivo departamento
SELECT E.first_name AS nombre, E.last_name AS apellido, D.dept_name AS departamento FROM employees E 
JOIN dept_emp DE 
ON E.emp_no = DE.emp_no
JOIN departments D 
ON D.dept_no = DE.dept_no;

# obteniendo además el salario del empleado
select * from salaries;

SELECT 
E.first_name AS nombre, 
E.last_name AS apellido, 
D.dept_name AS departamento, 
S.salary AS salario 
FROM employees E 
JOIN dept_emp DE 
ON E.emp_no = DE.emp_no
JOIN departments D 
ON D.dept_no = DE.dept_no
JOIN salaries S 
ON S.emp_no = E.emp_no;

##### Ejercicio
-- Determinar el salario promedio de cada departamento y ordenar los resultados de mayor a menor
use employees;
show tables;

# obteniendo el salario por departamento, todavía no cumple la consigna
SELECT D.dept_name AS Departamento, S.salary AS Salario FROM departments D 
JOIN dept_emp DE 
ON DE.dept_no = D.dept_no
JOIN salaries S 
ON S.emp_no = DE.emp_no;

# Usando la función de agregación AVG con el trabajo previo de los JOIN, 
# agrupando por departamento, ordenando por AVG de salary y en forma descendente
# Ahora si se obtiene la consulta pedida
SELECT D.dept_name AS Departamento, AVG(S.salary) AS "Salario Promedio" FROM departments D 
JOIN dept_emp DE 
ON DE.dept_no = D.dept_no
JOIN salaries S 
ON S.emp_no = DE.emp_no
GROUP BY D.dept_name
ORDER BY AVG(S.salary) DESC;
