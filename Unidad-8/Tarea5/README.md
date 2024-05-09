<div align="justify">


![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)



La base de datos de __"empleados"__ es un sistema diseñado para gestionar información relacionada con los empleados de una empresa. Esta base de datos está estructurada en torno a la entidad principal "empleados", que contiene información detallada sobre cada empleado. La estructura de la base de datos se compone de una única tabla principal llamada "empleados".

La tabla "empleados" está diseñada con las siguientes columnas:

- __id__: Esta columna sirve como identificador único para cada empleado. Es de tipo entero y se genera automáticamente utilizando la propiedad AUTO_INCREMENT.
- __nombre__: Almacena el nombre completo de cada empleado. Es de tipo cadena de caracteres (VARCHAR) con una longitud máxima de 100 caracteres.
- __salario__: Esta columna registra el salario de cada empleado. Se define como un número decimal (DECIMAL) con una precisión de 10 dígitos en total y 2 dígitos después del punto decimal.

```sql
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```

Veamos la tabla:

```sql
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3520.00 |
+----+--------+---------+
```

Realiza:

1. Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla __empleados_destiono__.
    
      ```sql
    DELIMITER //
        CREATE PROCEDURE copiar_nombres()
    BEGIN
        IF NOT EXISTS (
        SELECT * FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = DATABASE()
        AND TABLE_NAME = 'empleados_destino'
    ) THEN
        CREATE TABLE empleados_destino (
            nombre VARCHAR(255) NOT NULL
        );
    END IF;
    INSERT INTO empleados_destino (nombre)
    SELECT nombre
    FROM empleados
    WHERE salario > 3000;
    END //
    DELIMITER ;
      ```

```sql
 show tables;
+-------------------+
| Tables_in_empresa |
+-------------------+
| empleados         |
| empleados_destino |
+-------------------+
2 rows in set (0,00 sec)

mysql> select * from empleados_destino;
+--------+
| nombre |
+--------+
| Juan   |
| María  |
| Pedro  |
+--------+
3 rows in set (0,01 sec)

```
      

   

2. Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.

      ```sql
      DELIMITER //
        CREATE PROCEDURE empleados_contienen_a()
    BEGIN
        IF NOT EXISTS (
        SELECT * FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = DATABASE()
        AND TABLE_NAME = 'empleados_destino'
    ) THEN
        CREATE TABLE empleados_destino (
            nombre VARCHAR(255) NOT NULL
        );
    END IF;
    INSERT INTO empleados_destino (nombre)
    SELECT nombre
    FROM empleados
    WHERE salario > 3000;
    END //
    DELIMITER ;
      ```

3. Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.
   
      ```sql
      
      ```

4. Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.


      ```sql
      
      ```

5. Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.
   
      ```sql
      
      ```





</div>