<div align="justify">

# SQL y MySQL

Las diferencias principales entre SQL y MySql a la hora de crear una base de datos:

- SQL:
```sql
CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    edad INTEGER,
    correo TEXT
);
```
- MySql:
```sql
CREATE DATABASE IF NOT EXISTS tienda;

USE tienda;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre Varchar(50),
    edad INT,
    correo Varchar(50)
);
```

Podemos hacer varias observaciones al respecto:
- En MySql debemos crear una ```database``` y luego ```use```  junto al nombre de esta, para poder usarla y operar con ella.
- la ```primary key``` en el formato MySql deberá ponerse ```auto_increment```, en vez de ```integer``` será ```int```.
- Es opcional, pero sigue siendo importante usar en vez de ```text```el comando ```varchar``` junto a sus paréntisis donde se señalará entre 50 y 255 números de carácteres.
- Los ```insert into``` y ```values``` seguiran siendo los mismos y operando de la misma manera.



## CONSULTAS BÁSICAS

- Seleccionar datos de una tabla
```sql
select * from tabla1;
```
- Seleccionar datos datos con una condición. Ejemplo: Mostrar los usuarios que tienen más de 25 años.
```sql
select * from usuarios where edad > 25;
```
- Seleccionar datos con fecha actual. Ejemplo: Mostrar los pedidos realizados el día de hoy.
```sql
select * from pedidos where fecha_pedido = CURDATE();
```
- Seleccionar el total de productos
```sql
select count(*) as total_productos from productos;
```
- Seleccionar la media de edad
```sql
select avg(edad) as promedio_edad from usuarios;
```
- Mostrar los productos ordenados por precio de forma descendente.
```sql
select * from productos order by precio desc;
```
 >>> Uso del ```regexp```
- Mostrar los usuarios que tienen la letra 'a' en su nombre.
```sql
select * from usuarios where nombre regexp 'a';
```
- Mostrar los productos con un precio entre 20 y 50.
```sql
select * from productos where precio between 20 and 50;
```






</div>