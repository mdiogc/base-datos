<div align="justify">

![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)



# Trabajo con procedimientos de generación de información

Dado el procedimiento base:

```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```

Y las funciones descritas en [aleatoriedad](../../aleatoriedad.md), realiza los siguientes procedimientos, que realicen las siguietes operaciones:

  1. Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().

      ```sql
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
              (CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
      ```
    ## PROCEDIMIENTO 
        ```sql
       DROP PROCEDURE IF EXISTS prop1;
        DELIMITER //
        CREATE PROCEDURE prop1(IN prefix VARCHAR(50), input_rows INT, base_salary INT, max_salary INT)
        BEGIN
            DECLARE counter INT DEFAULT 0;

            WHILE counter < input_rows DO
                INSERT INTO empleados (nombre, salario) VALUES (CONCAT(prefix, RAND()), FLOOR(RAND() * (max_salary - base_salary + 1)) + base_salary);

                SET counter = counter + 1;
            END WHILE;
        END //
        DELIMITER ;
        ```

   ## SALIDA 
 ```sql
 call prop1("Empleados", 5, 1000, 7000);
Query OK, 1 row affected (0,04 sec)

mysql> select * from empleados;
+----+------------------------------+---------+
| id | nombre                       | salario |
+----+------------------------------+---------+
|  1 | Juan                         | 3000.00 |
|  2 | María                        | 3500.00 |
|  3 | Pedro                        | 3200.00 |
|  4 | Empleados0.15708135548707225 | 3185.00 |
|  5 | Empleados0.3495226775757248  | 4931.00 |
|  6 | Empleados0.22719895115792654 | 2023.00 |
|  7 | Empleados0.17107625042188562 | 3063.00 |
|  8 | Empleados0.20565847419729313 | 6982.00 |
+----+------------------------------+---------+
8 rows in set (0,00 sec)
 ```



 2. Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función __UUID()__.

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (UUID(), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
      ```
     ## PROCEDIMIENTO 
        ```sql
        DROP PROCEDURE IF EXISTS prop2;
        DELIMITER //
        CREATE PROCEDURE prop2(IN prefix VARCHAR(50), input_rows INT, base_salary INT, max_salary INT)
        BEGIN
            DECLARE counter INT DEFAULT 0;

            WHILE counter < input_rows DO
            INSERT INTO empleados (nombre, salario) VALUES (CONCAT(prefix, CONV(UUID(), 16, 10)), FLOOR(RAND() * (max_salary - base_salary + 1)) + base_salary);

                SET counter = counter + 1;
            END WHILE;
        END //
        DELIMITER ;
        ```

   ## SALIDA 

```sql
call prop2("Empleado", 3, 2000, 10000);
Query OK, 1 row affected (0,03 sec)

mysql> select * from empleados;
+----+------------------------------+---------+
| id | nombre                       | salario |
+----+------------------------------+---------+
|  1 | Juan                         | 3000.00 |
|  2 | María                        | 3500.00 |
|  3 | Pedro                        | 3200.00 |
|  4 | Empleados0.15708135548707225 | 3185.00 |
|  5 | Empleados0.3495226775757248  | 4931.00 |
|  6 | Empleados0.22719895115792654 | 2023.00 |
|  7 | Empleados0.17107625042188562 | 3063.00 |
|  8 | Empleados0.20565847419729313 | 6982.00 |
|  9 | Empleado2502870124           | 4942.00 |
| 10 | Empleado2502980842           | 8786.00 |
| 11 | Empleado2503054122           | 3102.00 |
+----+------------------------------+---------+
11 rows in set (0,00 sec)
```


  3. Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND().

      ```sql
      INSERT INTO empleados (nombre, salario)
      SELECT CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000
      FROM (SELECT 1 UNION SELECT 2) AS sub
      ORDER BY RAND()
      LIMIT 2;
      ```
## PROCEDIMIENTO 
        ```sql
        DELIMITER //
        
        CREATE PROCEDURE prop3(IN iterations INT)
        BEGIN
            DECLARE counter INT DEFAULT 0;
            DECLARE random_nombre varchar(100);
            DECLARE random_salario decimal (10, 2); 
            WHILE counter < iterations DO
            SET random_nombre = CONCAT('Empleado', RAND()), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000;
            SET random_salario = SELECT * FROM tabla ORDER BY RAND();;  
            INSERT INTO empleados(nombre, salario) values(random_nombre, random_salario);
                SET counter = counter + 1;
            END WHILE;
        END//

        DELIMITER ;
        ```

   ## SALIDA 





 4. Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1).

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000),
          (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (10000 - 2000 + 1)) + 2000);
    ```
 ## PROCEDIEMIENTO 

 ```sql
DROP PROCEDURE IF EXISTS prop4;
DELIMITER //
CREATE PROCEDURE prop4(IN input_rows INT, base_salary INT, max_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < input_rows DO
        INSERT INTO empleados (nombre, salario) VALUES (SUBSTRING_INDEX(UUID(), '-', -1), FLOOR(RAND() * (max_salary - base_salary + 1)) + base_salary);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;

 ```
## SALIDA
```SQL
call prop4(4, 2000, 7000 );
Query OK, 1 row affected (0,10 sec)

mysql> select * from empleados;
+----+------------------------------+---------+
| id | nombre                       | salario |
+----+------------------------------+---------+
|  1 | Juan                         | 3000.00 |
|  2 | María                        | 3500.00 |
|  3 | Pedro                        | 3200.00 |
|  4 | Empleados0.15708135548707225 | 3185.00 |
|  5 | Empleados0.3495226775757248  | 4931.00 |
|  6 | Empleados0.22719895115792654 | 2023.00 |
|  7 | Empleados0.17107625042188562 | 3063.00 |
|  8 | Empleados0.20565847419729313 | 6982.00 |
|  9 | Empleado2502870124           | 4942.00 |
| 10 | Empleado2502980842           | 8786.00 |
| 11 | Empleado2503054122           | 3102.00 |
| 12 | 080027077231                 | 2720.00 |
| 13 | 080027077231                 | 3534.00 |
| 14 | 080027077231                 | 2510.00 |
| 15 | 080027077231                 | 4949.00 |
+----+------------------------------+---------+
15 rows in set (0,00 sec)
```





 5. Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.

    ```sql
    INSERT INTO empleados (nombre, salario)
    VALUES (CONCAT('Empleado', RAND(1)), FLOOR(RAND(1) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(2)), FLOOR(RAND(2) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(3)), FLOOR(RAND(3) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(4)), FLOOR(RAND(4) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(5)), FLOOR(RAND(5) * (10000 - 2000 + 1)) + 2000),
          (CONCAT('Empleado', RAND(6)), FLOOR(RAND(6) * (10000 - 2000 + 1)) + 2000);
    ```
 ## PROCEDIEMIENTO 
 ```sql
DROP PROCEDURE IF EXISTS prop5;
DELIMITER //
CREATE PROCEDURE prop5(IN prefix VARCHAR(50), input_rows INT, base_salary INT, max_salary INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < input_rows DO
        INSERT INTO empleados (nombre, salario) VALUES (CONCAT(prefix, RAND(counter + 1)), FLOOR(RAND(counter + 1) * (max_salary - base_salary + 1)) + base_salary);

        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
```

## Salida
```sql
call prop5("Empleado", 6, 2000, 10000);
Query OK, 1 row affected (0,04 sec)

mysql> select * from empleados;
+----+------------------------------+---------+
| id | nombre                       | salario |
+----+------------------------------+---------+
|  1 | Juan                         | 3000.00 |
|  2 | María                        | 3500.00 |
|  3 | Pedro                        | 3200.00 |
|  4 | Empleados0.15708135548707225 | 3185.00 |
|  5 | Empleados0.3495226775757248  | 4931.00 |
|  6 | Empleados0.22719895115792654 | 2023.00 |
|  7 | Empleados0.17107625042188562 | 3063.00 |
|  8 | Empleados0.20565847419729313 | 6982.00 |
|  9 | Empleado2502870124           | 4942.00 |
| 10 | Empleado2502980842           | 8786.00 |
| 11 | Empleado2503054122           | 3102.00 |
| 12 | 080027077231                 | 2720.00 |
| 13 | 080027077231                 | 3534.00 |
| 14 | 080027077231                 | 2510.00 |
| 15 | 080027077231                 | 4949.00 |
| 16 | Empleado0.40540353712197724  | 5243.00 |
| 17 | Empleado0.6555866465490187   | 7245.00 |
| 18 | Empleado0.9057697559760601   | 9247.00 |
| 19 | Empleado0.15595286540310166  | 3247.00 |
| 20 | Empleado0.40613597483014313  | 5249.00 |
| 21 | Empleado0.6563190842571847   | 7251.00 |
+----+------------------------------+---------+
21 rows in set (0,00 sec)

```

Crea cada uno de los procedimientos, maximixando el número de parámetros de entrada necesarios, por ejemplo: ___nombre, salario, e id__.

___Crea el procedimiento, la invocación, y el estado de la tabla después de la invocación de este___.




</div>