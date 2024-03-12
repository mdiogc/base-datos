## Mi base de datos en MySQl

- Consultas simples:
    1. Mostrar todos los clientes.
```sql
select * from clientes;
+------------+------------+---------------+
| id_cliente | nombre     | direccion     |
+------------+------------+---------------+
|          1 | Cliente 1  | Dirección 1   |
|          2 | Cliente 2  | Dirección 2   |
|          3 | Cliente 3  | Dirección 3   |
|          4 | Cliente 4  | Dirección 4   |
|          5 | Cliente 5  | Dirección 5   |
|          6 | Cliente 6  | Dirección 6   |
|          7 | Cliente 7  | Dirección 7   |
|          8 | Cliente 8  | Dirección 8   |
|          9 | Cliente 9  | Dirección 9   |
|         10 | Cliente 10 | Dirección 10  |
|         11 | Cliente 11 | Dirección 11  |
|         12 | Cliente 12 | Dirección 12  |
|         13 | Cliente 13 | Dirección 13  |
|         14 | Cliente 14 | Dirección 14  |
|         15 | Cliente 15 | Dirección 15  |
|         16 | Cliente 16 | Dirección 16  |
|         17 | Cliente 17 | Dirección 17  |
|         18 | Cliente 18 | Dirección 18  |
|         19 | Cliente 19 | Dirección 19  |
|         20 | Cliente 20 | Dirección 20  |
+------------+------------+---------------+
```
2. Mostrar todos los productos.
```sql
select * from productos;
+-------------+-------------+--------+
| id_producto | nombre      | precio |
+-------------+-------------+--------+
|           1 | Producto 1  |  10.99 |
|           2 | Producto 2  |   20.5 |
|           3 | Producto 3  |  30.99 |
|           4 | Producto 4  |   40.5 |
|           5 | Producto 5  |  50.99 |
|           6 | Producto 6  |   60.5 |
|           7 | Producto 7  |  70.99 |
|           8 | Producto 8  |   80.5 |
|           9 | Producto 9  |  90.99 |
|          10 | Producto 10 |  100.5 |
|          11 | Producto 11 | 110.99 |
|          12 | Producto 12 |  120.5 |
|          13 | Producto 13 | 130.99 |
|          14 | Producto 14 |  140.5 |
|          15 | Producto 15 | 150.99 |
|          16 | Producto 16 |  160.5 |
|          17 | Producto 17 | 170.99 |
|          18 | Producto 18 |  180.5 |
|          19 | Producto 19 | 190.99 |
|          20 | Producto 20 |  200.5 |
+-------------+-------------+--------+
```
3. Mostrar todas las órdenes.
```sql
select * from ordenes; 
+----------+------------+-------------+----------+
| id_orden | id_cliente | id_producto | cantidad |
+----------+------------+-------------+----------+
|        1 |          1 |           1 |        2 |
|        2 |          2 |           2 |        1 |
|        3 |          3 |           3 |        3 |
|        4 |          4 |           4 |        2 |
|        5 |          5 |           5 |        1 |
|        6 |          6 |           6 |        2 |
|        7 |          7 |           7 |        3 |
|        8 |          8 |           8 |        2 |
|        9 |          9 |           9 |        1 |
|       10 |         10 |          10 |        2 |
|       11 |         11 |          11 |        3 |
|       12 |         12 |          12 |        2 |
|       13 |         13 |          13 |        1 |
|       14 |         14 |          14 |        2 |
|       15 |         15 |          15 |        3 |
|       16 |         16 |          16 |        2 |
|       17 |         17 |          17 |        1 |
|       18 |         18 |          18 |        2 |
|       19 |         19 |          19 |        3 |
|       20 |         20 |          20 |        2 |
+----------+------------+-------------+----------+
```

4. Mostrar los primeros 5 clientes ordenados por nombre.
```sql
select * from clientes order by nombre limit 5;


```
5. Mostrar los productos con un precio mayor a 50.
```sql
select * from productos where precio > 50;


```
6. Mostrar todas las órdenes realizadas por el cliente con ID 1.
```sql
select * from ordenes where id_cliente = 1;


```
7. Mostrar los clientes cuyos nombres comienzan con la letra "M".
```sql
select * from clientes where nombre regexp 'M';
--No devuelve nada--
```
8. Mostrar las órdenes que contienen más de 2 productos.
```sql
select * from ordenes where cantidad > 2;


```
9. Mostrar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio desc;


```

- Consultas de ejemplo para practicar joins

1. Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes 
```sql

```
2. Seleccionar todas las órdenes junto con los productos correspondientes
```sql

```
3. Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50
```sql

```
4. Obtener el nombre de los productos que no se han ordenado aún
```sql

```
5. Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes
```sql

```
6. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos
```sql

```
7. Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes
```sql

```
8. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado
```sql

```
9. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto
```sql

```
10. Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
```sql

```
11. Obtener el nombre de los productos junto con el nombre de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados
```sql

```
12. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos
```sql

```
13. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
```sql

```
14. Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
```sql

```