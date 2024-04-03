<div align="justify">

![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)

# Tarea 2 de trabajo con índices

Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:
- documento char (8) not null,
- nombre varchar(30) not null,
- domicilio varchar(30),
- ciudad varchar(20),
- provincia varchar (20),
- telefono varchar(11)

Se pide: 
- Elimine la tabla "cliente" si existe. 
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    DROP TABLE IF EXISTS cliente;

    Query OK, 0 rows affected, 1 warning (0,01 sec)
    ```
- Cree la tabla si clave primaria y incluye a posteriori esta.
    >__Nota__:_Muestra el comando y la salida_. 

    ```sql
    CREATE TABLE cliente (
    documento char (8) not null,nombre varchar(30) not null,domicilio varchar(30),ciudad varchar(20),provincia varchar (20),telefono varchar(11)
    );
        +-----------+-------------+------+-----+---------+-------+
    | Field     | Type        | Null | Key | Default | Extra |
    +-----------+-------------+------+-----+---------+-------+
    | documento | char(8)     | NO   |     | NULL    |       |
    | nombre    | varchar(30) | NO   |     | NULL    |       |
    | domicilio | varchar(30) | YES  |     | NULL    |       |
    | ciudad    | varchar(20) | YES  |     | NULL    |       |
    | provincia | varchar(20) | YES  |     | NULL    |       |
    | telefono  | varchar(11) | YES  |     | NULL    |       |
    +-----------+-------------+------+-----+---------+-------+


    ALTER TABLE cliente MODIFY documento INT NOT NULL, ADD PRIMARY KEY(documento);

    +-----------+-------------+------+-----+---------+-------+
    | Field     | Type        | Null | Key | Default | Extra |
    +-----------+-------------+------+-----+---------+-------+
    | documento | int         | NO   | PRI | NULL    |       |
    | nombre    | varchar(30) | NO   |     | NULL    |       |
    | domicilio | varchar(30) | YES  |     | NULL    |       |
    | ciudad    | varchar(20) | YES  |     | NULL    |       |
    | provincia | varchar(20) | YES  |     | NULL    |       |
    | telefono  | varchar(11) | YES  |     | NULL    |       |
    +-----------+-------------+------+-----+---------+-------+

    ```
- Define los siguientes indices:
   - Un índice único por el campo "documento" y un índice común por ciudad y provincia.
        >__Nota__:_Muestra el comando y la salida. Justifica el tipo de indice en un comentario_. 

    ```sql
    CREATE UNIQUE INDEX idx_documento ON cliente(documento);
    CREATE INDEX idx_ciudad_provincia ON cliente(ciudad, provincia);
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+


    ```
    - Vea los índices de la tabla.
        >__Nota__:_Muestra el comando y la salida __"show index"___.
 
    ```sql
    SHOW INDEX FROM cliente;
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    ```
- Agregue un índice único por el campo "telefono".
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    CREATE UNIQUE INDEX idx_telefono ON cliente(telefono);
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name             | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY              |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | idx_documento        |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    | cliente |          0 | idx_telefono         |            1 | telefono    | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    | cliente |          1 | idx_ciudad_provincia |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
    +---------+------------+----------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

    ```
- Elimina los índices.
    >__Nota__:_Muestra el comando y la salida_.

    ```sql
    ALTER TABLE cliente DROP INDEX idx_ciudad_provincia, DROP INDEX idx_documento, DROP INDEX idx_telefono;

     show index from cliente;
    +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
    +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
    | cliente |          0 | PRIMARY  |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
    +---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

    ```
</div>