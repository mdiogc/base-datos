<div align="justify";>

# Tarea 2 sobre sqlite3

<p align="center">
  <img width="" height="200" src="https://logowik.com/content/uploads/images/sqlite1911.jpg">
</p>

## **Paso 1: Crear una tabla con un campo de cada tipo**
1. **Para crear esta tarea, abriremos la línea de comandos y pondremos:**

```sql
sqlite3 tarea2.db
```

2. **Dentro de SQLite3, con el comando _CREATE TABLE_ crearemos las siguientes tablas:**


```sql
create table propietarios 
( id integer not null primary key autoincrement, 
nombre text not null, 
apellido text not null, 
dni text unicode );

create table vehiculos 
( id integer not null primary key autoincrement,
marca text not null, 
modelo text not null, 
anio integer not null, 
id_propietario integer references propietarios(id_propietario));

```

## **Paso 2: Insertar 20 entradas**

- Aquí tenemos algunos ejemplos de los insert de propietarios:
```sql
INSERT INTO propietarios VALUES(1,'Juan','Perez','12345678A');
INSERT INTO propietarios VALUES(2,'Maria','Lopez','87654321B');
INSERT INTO propietarios VALUES(3,'Carlos','Ruiz','11111111C');
INSERT INTO propietarios VALUES(4,'Laura','Gomez','22222222D');
...
```

- Aquí tenemos algunos ejemplos de los insert de vehiculos:

```sql
INSERT INTO vehiculos VALUES(1,'Ford','Fiesta',2019,1);
INSERT INTO vehiculos VALUES(2,'Toyota','Corolla',2018,2);
INSERT INTO vehiculos VALUES(3,'Nissan','Sentra',2020,3);
INSERT INTO vehiculos VALUES(4,'Chevrolet','Spark',2017,4);
...
```

## **Paso 3: Realizar las siguientes 10 consultas de datos**

- Seleccionar todos los propietarios

```sql
select * from propietarios;
```
- Listar todos los vehículos.
```sql
 select * from vehiculos;
```
- Seleccionar solo los nombres y apellidos de los propietarios.
```sql
select nombre, apellido from propietarios;
```
- Listar todas las marcas y modelos de los vehículos.
```sql
select marca, modelo from vehiculo;
```
- Seleccionar solo los propietarios con apellido "Perez".
```sql
select * from propietarios where apellido = 'Perez';
```
- Listar todos los vehículos con año 2019.
```sql
select * from vehiculos where anio=2019;
```
- Seleccionar propietarios que tienen vehículos de la marca "Toyota".
```sql
select v.* from vehiculos as v, propietarios as p where  p.id=v.id_propietario and v.marca="Toyota";
```
- Listar vehículos con marca "Ford" y modelo "Fiesta".
```sql
select * from vehiculos where marca="Ford" and modelo="Fiesta";
```
- Seleccionar propietarios con DNI "12345678A".
```sql
select * from propietarios where dni="12345678A";
```
- Listar vehículos que pertenecen al propietario con ID 5.
```sql
select * from vehiculos where id_propietario=5;
```

sqlite> .output datos.sql
sqlite> .dump
sqlite> .exit

</div>
