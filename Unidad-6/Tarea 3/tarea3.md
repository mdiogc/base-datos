<div align="justify">

![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)

# Tarea 3 de trabajo con índices

Las operaciones son las siguientes:

- Crea una base de datos que tendrá por nombre __Base_Indices__.

```sql
CREATE DATABASE __Base_Indices__;
```

- En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:

```sql
create table MOVIMIENTO(
Identificador int AUTO_INCREMENT primary key,
Articulo varchar(50),
Fecha date,   
Cantidad int);
```
- Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.
>__Nota__: _Muestra el resultado y razona la respueta_.

```sql
SHOW INDEX FROM MOVIMIENTO;
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
```
- Ejecuta la siguiente sentencia sql para generar datos de prueba:

    ```sql
    CREATE TABLE NumerosUnicos (
    Numero INT AUTO_INCREMENT PRIMARY KEY
    );

    INSERT INTO NumerosUnicos (Numero)
    SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

    INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
    SELECT 
        n.Numero,
        CONCAT('Producto', n.Numero),
        DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
        FLOOR(RAND() * 1000000) + 1
    FROM 
        NumerosUnicos n;

        DROP TABLE NumerosUnicos;
    ```
    >__Nota__: _Muestra el resultado y razona la respueta. Ejecuta un count sobre la tabla_.

    ```sql
    select count(*) from MOVIMIENTO;
    +----------+
    | count(*) |
    +----------+
    |     3588 |
    +----------+
    ```
- Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a
la que llamaremos MOVIMIENTO_BIS.

```sql
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
```
>__Nota__: _Muestra el resultado y razona la respueta_.

``` sql
 create table MOVIMIENTO_BIS select * from MOVIMIENTO;
Query OK, 3588 rows affected (0,25 sec)
Records: 3588  Duplicates: 0  Warnings: 0
```

- Con la cláusula __DESCRIBE__ observa cuál es la situación de la tabla clonada, ¿Qué le pasa al
índice y a la propiedad __AUTO_INCREMENT__?

>__Nota__: _Compara el resultado con la tabla MOVIMIENTO_.

```sql
describe MOVIMIENTO;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Identificador | int         | NO   | PRI | NULL    | auto_increment |
| Articulo      | varchar(50) | YES  |     | NULL    |                |
| Fecha         | date        | YES  |     | NULL    |                |
| Cantidad      | int         | YES  |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
4 rows in set (0,00 sec)

describe MOVIMIENTO_BIS;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | YES  |     | NULL    |       |
| Fecha         | date        | YES  |     | NULL    |       |
| Cantidad      | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0,00 sec)
```
>>> Se copió todo menos la ```PRIMARY KEY``` y el ```auto_increment```

- Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.

```sql
EXPLAIN SELECT * FROM MOVIMIENTO identificador=3;

+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+

EXPLAIN SELECT * FROM MOVIMIENTO_BIS where identificador=3;
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3588 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
```
- Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas.
En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).

```sql
CREATE INDEX IX_FECHA_BIS ON MOVIMIENTO_BIS (Fecha); 
SHOW INDEX FROM MOVIMIENTO_BIS;

+----------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO_BIS |          1 | IX_FECHA_BIS |            1 | Fecha       | A         |         120 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+----------------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0,01 sec)

CREATE INDEX IX_IDENTIFICADOR ON MOVIMIENTO_BIS (identificador); 
SHOW INDEX FROM MOVIMIENTO_BIS;

+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO_BIS |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO_BIS |          1 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3588 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0,01 sec)
```

- 8.- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
Consulta1

```sql
select * from MOVIMIENTO where identificador=3;

+---------------+-----------+------------+----------+
| Identificador | Articulo  | Fecha      | Cantidad |
+---------------+-----------+------------+----------+
|             3 | Producto3 | 2012-01-25 |   351930 |
+---------------+-----------+------------+----------+
1 row in set (0,00 sec)

```

consulta 2

```sql
select identificador from MOVIMIENTO_BIS where identificador=3;
+---------------+
| identificador |
+---------------+
|             3 |
+---------------+
1 row in set (0,00 sec)
```
>>>  La primera consulta selecciona todo, y la segunda el identificador.



Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así?
En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

- Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

Consulta 1:

```sql
SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN ‘01/01/2012’ and ‘01/03/2012’;
```

Consulta 2

```sql
SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN ‘01/01/2012’ and ‘01/03/2012’;
```

>>>  La primera consulta selecciona la fecha, y la segunda todo.

Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así?
En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

- Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.


```sql

CREATE INDEX IX_FECHA ON MOVIMIENTO (Fecha); 
```
- Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.

```sql
SHOW INDEX FROM MOVIMIENTO;
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO |          1 | IX_FECHA |            1 | Fecha         | A         |         120 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

SHOW INDEX FROM MOVIMIENTO_BIS;
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table          | Non_unique | Key_name         | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO_BIS |          1 | IX_FECHA_BIS     |            1 | Fecha         | A         |         120 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO_BIS |          1 | IX_IDENTIFICADOR |            1 | Identificador | A         |        3588 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------------+------------+------------------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+


```
- - Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
Consulta 1:


```sql
SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;


+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key      | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ref  | IX_FECHA      | IX_FECHA | 4       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+------+---------------+----------+---------+-------+------+----------+-------------+

```

Consulta 2:

```sql
SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
```

Consulta 3:

```sql
SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
```

Consulta 4:

```sql
SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 AND 01/03/2012;
```


</div>