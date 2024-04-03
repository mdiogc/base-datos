<div align="justify">
 
![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)
# Tarea 1. Trabajo con índices

Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
 - número de inscripción, comienza desde 1 cada año,
 - año de inscripción,
 - nombre del alumno,
 - documento del alumno,
 - domicilio,
 - ciudad,
 - provincia,
 - clave primaria: número de inscripto y año de inscripción.

Se pide: 
- Elimine la tabla "alumno" si existe. 
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    DROP TABLE IF EXISTS alumno;

    Query OK, 0 rows affected (0.00 sec)
    ```

- Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de 
inscripción).
    >__Nota__:_Muestra el comando y la salida_. 


```sql
create table alumno (
    numero_inscripcion INT AUTO_INCREMENT,
    año_inscripcion INT,
    nombre VARCHAR(50),
    documento VARCHAR(10),
    domicilio VARCHAR(100),
    ciudad VARCHAR(50),
    provincia VARCHAR(50),
    PRIMARY KEY(numero_inscripcion, año_inscripcion)
);

+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| numero_inscripcion | int          | NO   | PRI | NULL    | auto_increment |
| año_inscripcion    | int          | NO   | PRI | NULL    |                |
| nombre             | varchar(50)  | YES  |     | NULL    |                |
| documento          | varchar(10)  | YES  |     | NULL    |                |
| domicilio          | varchar(100) | YES  |     | NULL    |                |
| ciudad             | varchar(50)  | YES  |     | NULL    |                |
| provincia          | varchar(50)  | YES  |     | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+

```

- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        >__Nota__:_Muestra el comando y la salida. Justifica el tipo de indice en un comentario_. 
        ```sql
        CREATE UNIQUE INDEX idx_documento ON alumno(documento);
        CREATE INDEX idx_ciudad_provincia ON alumno(ciudad, provincia);
        ```
    - Vea los índices de la tabla.
        >__Nota__:_Muestra el comando y la salida __"show index"___.
        ```sql
        SHOW INDEXES FROM alumno;
        
        +--------+------------+--------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Table  | Non_unique | Key_name     | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
        +--------+------------+--------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | alumno |          0 | PRIMARY      |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | alumno |          0 | PRIMARY      |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | alumno |          0 | idx_doc      |            1 | documento          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        | alumno |          1 | idx_location |            1 | ciudad             | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        | alumno |          1 | idx_location |            2 | provincia          | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
        +--------+------------+--------------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        
        ```


- Intente ingresar un alumno con clave primaria repetida.
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    INSERT INTO alumno (ano_inscripcion, num_inscripcion, nombre_alumno, documento, domicilio, ciudad, provincia) 
    VALUES (2022, 1, 'Juan Pérez', '12345678', 'Calle Falsa 123', 'Ciudad Capital', 'Provincia A');

    ERROR 1062 (23000): Duplicate entry '2022-1' for key 'PRIMARY'
    ```
- Intente ingresar un alumno con documento repetido.
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    INSERT INTO alumno (numero_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia) 
    VALUES (2, 2024, 'Juan Perez', '12345678', 'Calle 123', 'Ciudad A', 'Provincia X');

    ERROR 1062 (23000): Duplicate entry '12345678' for key 'idx_documento'
    ```
- Ingrese varios alumnos de la misma ciudad y provincia.
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    INSERT INTO alumno (numero_inscripcion, anio_inscripcion, nombre, documento, domicilio, ciudad, provincia) 
    VALUES 
    (3, 2024, 'María García', '23456789', 'Calle 456', 'Ciudad B', 'Provincia Y'),
    (4, 2024, 'Pedro López', '34567890', 'Calle 789', 'Ciudad B', 'Provincia Y'),
    (5, 2024, 'Ana Martínez', '45678901', 'Calle 012', 'Ciudad B', 'Provincia Y');

    ```
- Elimina los indices creados, y muestra que ya no se encuentran.
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    DROP INDEX idx_documento, idx_ciudad_provincia ON alumno;
    +--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | alumno |          0 | PRIMARY  |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    +--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    Empty set (0.00 sec)
    ```
</div>
