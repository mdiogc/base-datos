1. Habitaciones reservadas para el día 15 de marzo de 2023
```sql
SELECT * FROM ReservaHabitac WHERE fechaEntrada = '2023-03-15';
```
Resultado:
```sql
+-----------+--------------+-------------+------+---------------+---------+
| idReserva | fechaEntrada | fechaSalida | iva  | numHabitacion | cliente |
+-----------+--------------+-------------+------+---------------+---------+
|         1 | 2023-03-15   | 2023-03-25  | 0.07 |           101 | 12345   |
|         2 | 2023-03-15   | 2023-03-25  | 0.07 |           102 | 12345   |
+-----------+--------------+-------------+------+---------------+---------+
```
2. Clientes procedentes de España y Francia
```sql
SELECT idCliente, pais FROM Cliente WHERE pais IN ('España', 'Francia');
```
3. Precios de los distintos tipos de habitación por temporada
Aquí asumimos que tenemos las tablas PrecioHabitacion y Temporada:

```sql
SELECT p.tipoHabitacion, t.temporada, p.precio
FROM PrecioHabitacion p
JOIN Temporada t ON p.idPrecio = t.idPrecio;
```
4. Clientes y nº de reserva para aquellos que han realizado alguna reserva en marzo
```sql
SELECT c.*, R.idReserva
FROM Cliente c
LEFT JOIN ReservaHabitac R ON c.idCliente = R.cliente AND R.fechaEntrada regexp '2023-03';
```
5. Clientes con el mismo primer apellido
```sql
SELECT c1.*
FROM Cliente c1
JOIN Cliente c2 ON c1.primerApellido = c2.primerApellido AND c1.idCliente <> c2.idCliente;
```
6. Gasto en servicios realizado por cada reserva
Asumimos que hay una tabla GastoServicio:

```sql
SELECT r.idReserva, SUM(gs.precio) as gasto_total
FROM ReservaHabitac r
JOIN GastoServicio gs ON r.idReserva = gs.idReserva
GROUP BY r.idReserva;
```
7. Precio del servicio más caro y del más barato
```sql
SELECT MAX(precio) AS maximo_precio, MIN(precio) AS minimo_precio FROM Servicio;
```
Resultado:
```sql
+---------------+---------------+
| maximo_precio | minimo_precio |
+---------------+---------------+
|         10.00 |          1.00 |
+---------------+---------------+
```
8. Precio de las habitaciones y sus respectivos tipos durante la temporada de verano (tipo 'A')
```sql
SELECT p.precio, p.tipoHabitacion 
FROM PrecioHabitacion p 
JOIN Temporada t ON p.idPrecio = t.idPrecio 
WHERE t.temporada = 'A';
```

CREAR Vistas
1. Clientes cuyo apellido incluya la sílaba "le" ordenados por su identificador
```sql
CREATE VIEW apellido AS 
SELECT idCliente, primerApellido 
FROM Cliente 
WHERE primerApellido REGEXP 'le' 
ORDER BY idCliente;
```
Consulta la vista:

```sql
SELECT * FROM apellido;
```
Resultado:
```
+-----------+----------------+
| idCliente | primerApellido |
+-----------+----------------+
| 12345     | Iglesias       |
+-----------+----------------+
```
2. Clientes con alguna observación anotada ordenados por su primer apellido
```sql
CREATE VIEW vclientes AS 
SELECT primerApellido, observaciones 
FROM Cliente 
WHERE observaciones IS NOT NULL 
ORDER BY primerApellido;
```
Consulta la vista:

```sql
SELECT * FROM vclientes;
```
Resultado:
```sql
+----------------+------------------+
| primerApellido | observaciones    |
+----------------+------------------+
| Iglesias       | Buen cliente     |
| Schmidt        | Cliente exigente |
+----------------+------------------+
```
3. Servicios cuyo precio supere los 5€ ordenados por su código de servicio
```sql
CREATE VIEW maxservicios AS 
SELECT * 
FROM Servicio 
WHERE precio > 5 
ORDER BY idServicio;
```
Consulta la vista:
```sql
SELECT * FROM maxservicios;
```
Resultado:
```sql
+------------+----------------+-----------------+--------+------+------------+
| idServicio | nombreServicio | descripcion     | precio | iva  | fecha      |
+------------+----------------+-----------------+--------+------+------------+
|          1 | Comedor        | 1 menu del día  |  10.00 | 7.00 | 2023-01-01 |
+------------+----------------+-----------------+--------+------+------------+
```
4. Clientes que han utilizado el servicio de comedor
Asumimos que hay una tabla que relaciona clientes con servicios:
```sql
CREATE VIEW scliente AS 
SELECT c.idCliente, c.nombre, c.primerApellido, c.segundoApellido 
FROM Cliente c 
JOIN ServicioCliente sc ON c.idCliente = sc.idCliente 
JOIN Servicio s ON sc.idServicio = s.idServicio 
WHERE s.nombreServicio = 'Comedor';
```
5. Características de cada habitación reservada
Asumimos la existencia de una tabla Habitacion:
```sql
CREATE VIEW hab_reservadas AS 
SELECT r.numHabitacion, h.tipo, h.capacidad, r.fechaEntrada, r.fechaSalida 
FROM ReservaHabitac r 
JOIN Habitacion h ON r.numHabitacion = h.numHabitacion;
```
6. Servicios nunca contratados
```sql
CREATE VIEW servicios_no_contratados AS 
SELECT * 
FROM Servicio s 
WHERE NOT EXISTS (
    SELECT 1 
    FROM ServicioCliente sc 
    WHERE sc.idServicio = s.idServicio
);
```
7. Número de clientes por nacionalidad
```sql
CREATE VIEW n_clienten AS 
SELECT pais, COUNT(idCliente) AS num_clientes 
FROM Cliente 
GROUP BY pais;
```
Consulta la vista:
```sql
SELECT * FROM n_clienten;
/**Resultado:**/

+----------+--------------+
| pais     | num_clientes |
+----------+--------------+
| España   |            2 |
| Alemania |            1 |
| Francia  |            1 |
| Italia   |            1 |
+----------+--------------+
```
8. Número de habitaciones por categoría de habitación
Asumimos que hay una tabla CategoriaHabitacion:

sql
Copiar código
CREATE VIEW n_hab_categoria AS 
SELECT categoria, COUNT(numHabitacion) AS num_habitaciones 
FROM Habitacion 
GROUP BY categoria;
9. Número de servicios ofrecidos por tipo de servicio
Asumimos que hay una columna tipoServicio en la tabla Servicio:

sql
Copiar código
CREATE VIEW nservicios AS 
SELECT tipoServicio, COUNT(idServicio) AS num_servicios 
FROM Servicio 
GROUP BY tipoServicio;
10. Datos del cliente excepto las observaciones
sql
Copiar código
CREATE VIEW dcliente AS 
SELECT idCliente, pais, nombre, primerApellido, segundoApellido, direccion, telefono 
FROM Cliente;
Consulta la vista:

sql
Copiar código
SELECT * FROM dcliente;
Resultado:

plaintext
Copiar código
+-----------+----------+----------+----------------+-----------------+------------------------+------------+
| idCliente | pais     | nombre   | primerApellido | segundoApellido | direccion              | telefono   |
+-----------+----------+----------+----------------+-----------------+------------------------+------------+
| 12345     | España   | Felipe   | Iglesias       | López           | Avda Los Castros, 44   | 942344444  |
| 43215     | Alemania | Hans     | Schmidt        | Müller          | Hauptstrasse 123       | 65890234   |
| 44444     | España   | Cristina | García         | García          | Calle Mayor, 67        | 942456444  |
| 45678     | Francia  | Ludovic  | Giuly          | Bourquin        | 18 avenue Alsacen Cour | 37890194   |
| 45680     | Italia   | Giulia   | Bianchi        | NULL            | Via Verdi 5            | 3209876543 |
+-----------+----------+----------+----------------+-----------------+------------------------+------------+
11. Datos del cliente y el gasto total realizado
Asumimos que hay una tabla Factura:

sql
Copiar código
CREATE VIEW gasto_cliente AS 
SELECT c.idCliente, c.nombre, c.primerApellido, SUM(f.total) AS gasto_total 
FROM Cliente c 
JOIN ReservaHabitac r ON c.idCliente = r.cliente 
JOIN Factura f ON r.idReserva = f.idReserva 
GROUP BY c.idCliente;
Índices
1. Índice sobre el atributo pais de la tabla Cliente
sql
Copiar código
CREATE INDEX indx_cliente ON Cliente(pais);

EXPLAIN SELECT * FROM Cliente WHERE pais = 'España';
Resultado del EXPLAIN:

plaintext
Copiar código
+----+-------------+---------+------------+------+---------------+------+---------+-------+------+----------+-----------------------+
| id | select_type | table   | partitions | type | possible_keys | key  | key_len | ref   | rows | filtered | Extra                 |
+----+-------------+---------+------------+------+---------------+------+---------+-------+------+----------+-----------------------+
|  1 | SIMPLE      | Cliente | NULL       | ref  | pais          | pais | 80      | const |    2 |   100.00 | Using index condition |
+----+-------------+---------+------------+------+---------------+------+---------+-------+------+----------+-----------------------+
2. Índice sobre el atributo numHabitacion de la tabla ReservaHabitac
sql
Copiar código
CREATE INDEX indx_numhab ON ReservaHabitac(numHabitacion);

EXPLAIN SELECT * FROM ReservaHabitac WHERE numHabitacion = 101;
Resultado del EXPLAIN:

plaintext
Copiar código
+----+-------------+----------------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key         | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | ReservaHabitac | NULL       | ref  | indx_numhab   | indx_numhab | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+-------------+---------+-------+------+----------+-------+
3. Índice sobre el atributo nombreServicio de la tabla Servicio
sql
Copiar código
CREATE INDEX indx_num_serv ON Servicio(nombreServicio);

EXPLAIN SELECT * FROM Servicio WHERE nombreServicio = 'Comedor';
Resultado del EXPLAIN:

plaintext
Copiar código
+----+-------------+----------+------------+------+----------------+----------------+---------+-------+------+----------+-----------------------+
| id | select_type | table    | partitions | type | possible_keys  | key            | key_len | ref   | rows | filtered | Extra                 |
+----+-------------+----------+------------+------+----------------+----------------+---------+-------+------+----------+-----------------------+
|  1 | SIMPLE      | Servicio | NULL       | ref  | nombreServicio | nombreServicio | 40      | const |    1 |   100.00 | Using index condition |
+----+-------------+----------+------------+------+----------------+----------------+---------+-------+------+----------+-----------------------+
Estas consultas y vistas deben cubrir las necesidades solicitadas. Para ejecutar y verificar cada consulta, asegúrate de tener la estructura de la base de datos y los datos correctos en tu entorno SQL.






