<div align="justify";>

# Tarea 3 sobre sqlite3 funciones de base de datos

<p align="center">
  <img width="" height="200" src="https://logowik.com/content/uploads/images/sqlite1911.jpg">
</p>

Ejemplo de los create tables

```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);
```
Ejemplos de los insert into

```sql
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
```

## Paso 3: Realización de consultas

- Realiza las siguientes consultas, y muestra el resultado obtenido:

    1. Funciones UPPER y LOWER:
    **Muestra el nombre de todos los empleados en mayúsculas.**
    ```sql
    sqlite> select upper(nombre) as nombre_mayusculas from empleados;
    ```

    2. Funciones Numéricas:
    **Calcula el valor absoluto del salario de todos los empleados.**
    ```sql
     select  nombre, abs(salario) as valor_absoluto from empleados;
    ```

    3. Funciones de Fecha y Hora:
    **Muestra la fecha actual.**
    ```sql
    select current_date as fecha_actual from empleados limit 1;
    ```

    4. Funciones de Agregación: 
    **Calcula el promedio de salarios de todos los empleados.**
    ```sql
    select avg(salario) as promedio_salario from empleados;

    ```
    **Convierte la cadena '123' a un valor entero.**
    ```sql
    select nombre, cast(salario as integer) as salario_entero from empleados;

    ```

    5. Funciones de Manipulación de Cadenas:
    **Concatena el nombre y el departamento de cada empleado.**
    ```sql
   select nombre|| " " || departamento as nombre_y_departamento from empleados;
    ```

    6. Funciones de Manipulación de Cadenas (CONCAT_WS):
    **Concatena el nombre y el departamento de cada empleado con un guion como separador.**
    ```sql
    select nombre|| "-" || departamento as nombre_y_departamento from empleados;
    ```

    7. Funciones de Control de Flujo (CASE):
    **Categoriza a los empleados según sus salarios.**
    ```sql
    select nombre, case when salario > 50000 then 'Alto' else 'Bajo' end as rango_salario from empleados;
    ```

    8. Funciones de Agregación (SUM):
    **Calcula la suma total de salarios de todos los empleados.**

    ```sql
    select sum(salario) as suma_salario from empleados;
    ```

    9. Funciones Numéricas (ROUND):
    **Redondea el salario de todos los empleados a dos decimales.**

    ```sql
    select nombre, round (salario, 2) as salario_redondeado from empleados;
    ```

    10. Funciones de Manipulación de Cadenas (LENGTH):
    **Muestra la longitud de cada nombre de empleado.**
    ```sql
    select nombre, length(nombre) as long_nombre from empleados;
    ```

    11. Funciones de Agregación (COUNT): **Cuenta el número total de empleados en cada departamento.**
    ```sql
    select departamento,count(*) from empleados group by departamento;
    ```

    12. Funciones de Fecha y Hora (CURRENT_TIME): 
    **Muestra la hora actual.**
    ```sql
    select current_time from empleados;
    ```
    13. Funciones de Conversión (CAST):
    **Convierte el salario a un valor de punto flotante.**
    ```sql
    select salario, cast(salario as float) as salario_flotante from empleados;
    ```
    14. Funciones de Manipulación de Cadenas (SUBSTR): 
    **Muestra los primeros tres caracteres de cada nombre de empleado.**
    ```sql
     select substr(nombre, 1,3) as tres_primeras_letras from empleados;
    ```







**Order By and Like.**
1. Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
```sql
select * from empleados where (departamento like 'Ventas') order by salario > 52000;
```
2. Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
```sql
 select * from empleados where (nombre like '%a%') order by salario asc;
```
3. Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
```sql
select nombre from empleados where departamento = 'Recursos Humanos' and salario between 45000 and 55000 order by salario asc limit 16;
```
4. Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
```sql
select nombre, salario from empleados order by salario desc limit 5;
```
5. Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
```sql
select nombre from empleados where (nombre like 'M%' or nombre like 'N%') and salario > 50000;
```

6. Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
```sql
select * from empleados where (departamento like 'Ventas' or departamento like 'TI') order by nombre;
```
7. Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
```sql
select distinct(salario) from empleados order by salario asc;
```
8. Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
```sql
select * from empleados where departamento like 'Ventas' and (nombre like '%o' or nombre like '%a');
```
9. Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
```sql
select * from empleados where salario not between 55000 and 70000 order by departamento;
```
10. Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
```sql
select * from empleados where departamento like 'Recursos Humanos’ and nombre not like '%e%';
```


</div>