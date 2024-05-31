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
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        CREATE TABLE IF NOT EXISTS empleados_destino (emp_nombre VARCHAR (100));
      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          INSERT INTO empleados_destino (emp_nombre) SELECT DISTINCT emp_nombre FROM empleados where salario > 3000;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```
```sql
    select * from empleados_destino;
    +------------+
    | emp_nombre |
    +------------+
    | Juan       |
    | María      |
    | Pedro      |
    +------------+
    3 rows in set (0,00 sec)

    mysql> select *from empleados;
    +----+--------+---------+
    | id | nombre | salario |
    +----+--------+---------+
    |  1 | Juan   | 9000.00 |
    |  2 | María  | 3500.00 |
    |  3 | Pedro  | 9600.00 |
    +----+--------+---------+
    3 rows in set (0,00 sec)

```
  

2. Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.

    ```sql
    DELIMITER //
    DROP PROCEDURE IF EXISTS aumentar_a;
    CREATE PROCEDURE aumentar_a()
    BEGIN
        DECLARE done INT DEFAULT FALSE;
        DECLARE emp_id INT;
        DECLARE emp_nombre VARCHAR(100);
        DECLARE emp_salario DECIMAL(10, 2);
        DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE nombre regexp 'a';
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO emp_id, emp_nombre, emp_salario;
            IF done THEN
                LEAVE read_loop;
            END IF;
            UPDATE empleados set salario = salario * (1 + 10 / 100) where id = emp_id;
            
        END LOOP;
        CLOSE cur;
    END //
    DELIMITER ;

      ```

    ```sql
    call aumentar_a();
    Query OK, 0 rows affected (0,03 sec)

    mysql> select * from empleados;
    +----+--------+---------+
    | id | nombre | salario |
    +----+--------+---------+
    |  1 | Juan   | 9900.00 |
    |  2 | María  | 3850.00 |
    |  3 | Pedro  | 9600.00 |
    +----+--------+---------+
    3 rows in set (0,00 sec)
```


```


3. Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.
   
    ```sql
    DELIMITER //
    DROP PROCEDURE IF EXISTS rango_especifico;
    CREATE PROCEDURE rango_especifico(IN id_principio INT, IN id_final INT)
    BEGIN
        DECLARE done INT DEFAULT FALSE;
        DECLARE emp_id INT;
        DECLARE emp_nombre VARCHAR(100);
        DECLARE emp_salario DECIMAL(10, 2);
        DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE id between id_principio and id_final;

        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO emp_id, emp_nombre, emp_salario;
            IF done THEN
                LEAVE read_loop;
            END IF;
            select emp_id, emp_nombre, emp_salario;
            
        END LOOP;
        CLOSE cur;
    END //
    DELIMITER ;
    ```
```sql
call rango_especifico(2, 3);
+--------+------------+-------------+
| emp_id | emp_nombre | emp_salario |
+--------+------------+-------------+
|      2 | María      |     3850.00 |
+--------+------------+-------------+
1 row in set (0,00 sec)

+--------+------------+-------------+
| emp_id | emp_nombre | emp_salario |
+--------+------------+-------------+
|      3 | Pedro      |     9600.00 |
+--------+------------+-------------+
1 row in set (0,00 sec)

Query OK, 0 rows affected (0,00 sec)

```


4. Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.


      ```sql
      
    DELIMITER //
    DROP PROCEDURE IF EXISTS elimar_empleados;
    CREATE PROCEDURE eliminar_empleados()
    BEGIN
        DECLARE done INT DEFAULT FALSE;
        DECLARE emp_id INT;
        DECLARE emp_nombre VARCHAR(100);
        DECLARE emp_salario DECIMAL(10, 2);
        DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados WHERE salario between 2000 and 2500;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO emp_id, emp_nombre, emp_salario;
            IF done THEN
                LEAVE read_loop;
            END IF;
            DELETE FROM empleados where id = emp_id;
            
        END LOOP;
        CLOSE cur;
    END //
    DELIMITER ;

      ```

5. Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.
   
      ```sql
      
    DELIMITER //
    DROP PROCEDURE IF EXISTS aumentar_20;
    CREATE PROCEDURE aumentar_20(IN p_nombre VARCHAR(100))
    BEGIN
        DECLARE done INT DEFAULT FALSE;
        DECLARE emp_id INT;
        DECLARE emp_nombre VARCHAR(100);
        DECLARE emp_salario DECIMAL(10, 2);
        DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados where nombre = p_nombre;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

        OPEN cur;
        read_loop: LOOP
            FETCH cur INTO emp_id, emp_nombre, emp_salario;
            IF done THEN
                LEAVE read_loop;
            END IF;
            UPDATE empleados set salario = salario * (1 + 20 / 100) where id = emp_id;
            
        END LOOP;
        CLOSE cur;
    END //
    DELIMITER ;

      ```





</div>