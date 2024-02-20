

# Tarea 12: Consultas


## Crear las tablas


```sql
CREATE TABLE cliente (
    id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre text NOT NULL,
    apellido1 text NOT NULL,
    apellido2 text NULL,
    ciudad text NOT NULL,
    categoría integer NULL);


CREATE TABLE comercial (
    id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    nombre text NOT NULL,
    apellido1 text NOT NULL,
    apellido2 text NULL,
    categoria real NOT NULL);


CREATE TABLE pedido (
    id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    total real NOT NULL,
    fecha date NOT NULL,
    id_cliente integer references cliente(id),
    id_comercial integer references comercial(id));
```

## Consultas sobre una tabla

1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
```sql
select * from pedido order by fecha desc;
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘
```

2. Devuelve todos los datos de los dos pedidos de mayor valor.
```sql
select total from pedido order by total desc limit 2;
┌────────┐
│ total  │
├────────┤
│ 5760.0 │
│ 3045.6 │
└────────┘
```

3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
```sql
 select distinct cliente.id, nombre from cliente, pedido where cliente.id = pedido.id;

┌────┬───────────┐
│ id │  nombre   │
├────┼───────────┤
│ 1  │ Aarón     │
│ 2  │ Adela     │
│ 3  │ Adolfo    │
│ 4  │ Adrián    │
│ 5  │ Marcos    │
│ 6  │ María     │
│ 7  │ Pilar     │
│ 8  │ Pepe      │
│ 9  │ Guillermo │
│ 10 │ Daniel    │
└────┴───────────┘
```

4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
```sql
select * from pedido where fecha regexp '^2017-' and total > 500;

┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘
```

5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

```sql
select nombre, apellido1, apellido2 from comercial where categoria between 0.05 and 0.11;

┌─────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │
├─────────┼───────────┼───────────┤
│ Diego   │ Flores    │ Salas     │
│ Antonio │ Vega      │ Hernández │
│ Alfredo │ Ruiz      │ Flores    │
└─────────┴───────────┴───────────┘
```

6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
```sql
select max(categoria) as categoria_maxima from comercial;
┌──────────────────┐
│ categoria_maxima │
├──────────────────┤
│ 0.15             │
└──────────────────┘
```


7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
```sql
select id, nombre, apellido1 from cliente where apellido2 is not null order by nombre, apellido1;
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │
│ 2  │ Adela     │ Salas     │
│ 3  │ Adolfo    │ Rubio     │
│ 10 │ Daniel    │ Santana   │
│ 9  │ Guillermo │ López     │
│ 5  │ Marcos    │ Loyola    │
│ 6  │ María     │ Santana   │
│ 8  │ Pepe      │ Ruiz      │
└────┴───────────┴───────────┘
```

8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
```sql
select nombre from cliente where nombre regexp '^(A.*n|P.*)$' order by nombre;
┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘
```

9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
```sql
select nombre from clientes where nombre regexp '^[^A]'
order by nombre;
┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘
```

10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

```sql
select distinct nombre from comercial where nombre regexp '[oO]$';
┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘
```

## Consultas multitabla
> [!NOTE]
> utilizando las cláusulas join.

1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
```sql
select distinct cliente.id, nombre, apellido1, apellido2 from cliente join pedido on pedido.id = cliente.id order by nombre;
┌────┬───────────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │
├────┼───────────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │
│ 2  │ Adela     │ Salas     │ Díaz      │
│ 3  │ Adolfo    │ Rubio     │ Flores    │
│ 4  │ Adrián    │ Suárez    │           │
│ 10 │ Daniel    │ Santana   │ Loyola    │
│ 9  │ Guillermo │ López     │ Gómez     │
│ 5  │ Marcos    │ Loyola    │ Méndez    │
│ 6  │ María     │ Santana   │ Moreno    │
│ 8  │ Pepe      │ Ruiz      │ Santana   │
│ 7  │ Pilar     │ Ruiz      │           │
└────┴───────────┴───────────┴───────────┘
```
2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
```sql
select * from pedido join cliente on pedido.id = cliente.id order by cliente.nombre;
┌────┬─────────┬────────────┬────────────┬──────────────┬────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoría │
├────┼─────────┼────────────┼────────────┼──────────────┼────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 1  │ Aarón     │ Rivero    │ Gómez     │ Almería │ 100       │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 2  │ Adela     │ Salas     │ Díaz      │ Granada │ 200       │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 3  │ Adolfo    │ Rubio     │ Flores    │ Sevilla │           │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 4  │ Adrián    │ Suárez    │           │ Jaén    │ 300       │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 5  │ Marcos    │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 6  │ María     │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 8  │ Pepe      │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 7  │ Pilar     │ Ruiz      │           │ Sevilla │ 300       │
└────┴─────────┴────────────┴────────────┴──────────────┴────┴───────────┴───────────┴───────────┴─────────┴───────────┘

```
3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
```sql
select * from pedido join comercial on pedido.id = comercial.id order by comercial.nombre;
┌────┬─────────┬────────────┬────────────┬──────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼────────────┼────────────┼──────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
└────┴─────────┴────────────┴────────────┴──────────────┴────┴─────────┴───────────┴───────────┴───────────┘

```
4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
```sql
select * from cliente join pedido on pedido.id = cliente.id join comercial on pedido.id = comercial.id;
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoría │ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┴────┴─────────┴───────────┴───────────┴───────────┘
```
5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
```sql
select * from cliente join pedido on pedido.id = cliente.id where fecha regexp '2017' and total between 300 and 1000;
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬───────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoría │ id │ total │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼───────┼────────────┼────────────┼──────────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5 │ 2017-09-10 │ 5          │ 2            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴───────┴────────────┴────────────┴──────────────┘
```
6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
```sql
select distinct comercial.nombre, comercial.apellido1, comercial.apellido2 from comercial join pedido on pedido.id_comercial = comercial.id join cliente on pedido.id_cliente = cliente.id where cliente.nombre ||' '||cliente.apellido1||' '||cliente.apellido2 = 'María Santana Moreno';

┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘
```
7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
```sql
select distinct cliente.nombre from cliente join pedido on pedido.id_cliente = cliente.id join comercial on pedido.id_comercial = comercial.id where comercial.nombre ||' '||comercial.apellido1||' '||comercial.apellido2 = 'Daniel Sáez Vega';

┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ María  │
└────────┘
```
## Consultas resumen (Funciones)

1. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
```sql
select sum(total) as cantidad_total from pedido;

┌────────────────┐
│ cantidad_total │
├────────────────┤
│ 20992.83       │
└────────────────┘

```
2. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
```sql
select avg(total) as cantidad_media from pedido;
┌────────────────┐
│ cantidad_media │
├────────────────┤
│ 1312.051875    │
└────────────────┘

```
3. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
```sql
select count(distinct id_comercial) as total_comerciales from pedido;
┌───────────────────┐
│ total_comerciales │
├───────────────────┤
│ 6                 │
└───────────────────┘

```
4. Calcula el número total de clientes que aparecen en la tabla cliente.
```sql
select count(*) as total_clientes from cliente;
┌────────────────┐
│ total_clientes │
├────────────────┤
│ 10             │
└────────────────┘

```
5. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
```sql
select max(total) as mayor_cantidad from pedido;
┌────────────────┐
│ mayor_cantidad │
├────────────────┤
│ 5760.0         │
└────────────────┘

```
6. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
```sql
select min(total) as menor_cantidad from pedido;
┌────────────────┐
│ menor_cantidad │
├────────────────┤
│ 65.26          │
└────────────────┘

```
7. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
```sql
select ciudad, max(categoria) as max_categoria
from cliente
group by ciudad;
┌─────────┬───────────────┐
│ ciudad  │ max_categoria │
├─────────┼───────────────┤
│ Almería │ 200           │
│ Cádiz   │ 100           │
│ Granada │ 225           │
│ Huelva  │ 200           │
│ Jaén    │ 300           │
│ Sevilla │ 300           │
└─────────┴───────────────┘

```
8. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
```sql
select id_cliente, nombre, apellido1, fecha, max(total) as max_valor_pedido
from pedido join cliente on pedido.id_cliente = cliente.id
group by id_cliente, fecha;
┌────────────┬────────┬───────────┬────────────┬──────────────────┐
│ id_cliente │ nombre │ apellido1 │   fecha    │ max_valor_pedido │
├────────────┼────────┼───────────┼────────────┼──────────────────┤
│ 1          │ Aarón  │ Rivero    │ 2016-09-10 │ 270.65           │
│ 1          │ Aarón  │ Rivero    │ 2019-03-11 │ 2389.23          │
│ 2          │ Adela  │ Salas     │ 2015-09-10 │ 5760.0           │
│ 2          │ Adela  │ Salas     │ 2017-04-25 │ 3045.6           │
│ 2          │ Adela  │ Salas     │ 2017-10-05 │ 65.26            │
│ 3          │ Adolfo │ Rubio     │ 2016-08-17 │ 75.29            │
│ 4          │ Adrián │ Suárez    │ 2017-10-10 │ 1983.43          │
│ 5          │ Marcos │ Loyola    │ 2017-09-10 │ 948.5            │
│ 5          │ Marcos │ Loyola    │ 2017-10-05 │ 150.5            │
│ 6          │ María  │ Santana   │ 2017-02-02 │ 145.82           │
│ 6          │ María  │ Santana   │ 2019-01-25 │ 545.75           │
│ 7          │ Pilar  │ Ruiz      │ 2016-07-27 │ 2400.6           │
│ 8          │ Pepe   │ Ruiz      │ 2015-06-27 │ 250.45           │
│ 8          │ Pepe   │ Ruiz      │ 2016-08-17 │ 110.5            │
│ 8          │ Pepe   │ Ruiz      │ 2016-10-10 │ 2480.4           │
└────────────┴────────┴───────────┴────────────┴──────────────────┘

```
9. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
```sql
select id_cliente, nombre, apellido1, fecha, max(total) as max_valor_pedido
from pedido
join cliente on pedido.id_cliente = cliente.id
where total > 2000
group by id_cliente, fecha;
┌────────────┬────────┬───────────┬────────────┬──────────────────┐
│ id_cliente │ nombre │ apellido1 │   fecha    │ max_valor_pedido │
├────────────┼────────┼───────────┼────────────┼──────────────────┤
│ 1          │ Aarón  │ Rivero    │ 2019-03-11 │ 2389.23          │
│ 2          │ Adela  │ Salas     │ 2015-09-10 │ 5760.0           │
│ 2          │ Adela  │ Salas     │ 2017-04-25 │ 3045.6           │
│ 7          │ Pilar  │ Ruiz      │ 2016-07-27 │ 2400.6           │
│ 8          │ Pepe   │ Ruiz      │ 2016-10-10 │ 2480.4           │
└────────────┴────────┴───────────┴────────────┴──────────────────┘

```
10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
```sql
select id_comercial, nombre, apellido1, apellido2, max(total) as max_valor_pedido
from pedido
join comercial on pedido.id_comercial = comercial.id
where fecha = '2016-08-17'
group by id_comercial;
┌──────────────┬─────────┬───────────┬───────────┬──────────────────┐
│ id_comercial │ nombre  │ apellido1 │ apellido2 │ max_valor_pedido │
├──────────────┼─────────┼───────────┼───────────┼──────────────────┤
│ 3            │ Diego   │ Flores    │ Salas     │ 110.5            │
│ 7            │ Antonio │ Vega      │ Hernández │ 75.29            │
└──────────────┴─────────┴───────────┴───────────┴──────────────────┘

```
11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
```sql
select cliente.id, nombre, apellido1, apellido2, count(pedido.id) as total_pedidos
from cliente
left join pedido on cliente.id = pedido.id_cliente
group by cliente.id, nombre, apellido1, apellido2;
┌────┬───────────┬───────────┬───────────┬───────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ total_pedidos │
├────┼───────────┼───────────┼───────────┼───────────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ 3             │
│ 2  │ Adela     │ Salas     │ Díaz      │ 3             │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ 1             │
│ 4  │ Adrián    │ Suárez    │           │ 1             │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ 2             │
│ 6  │ María     │ Santana   │ Moreno    │ 2             │
│ 7  │ Pilar     │ Ruiz      │           │ 1             │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ 3             │
│ 9  │ Guillermo │ López     │ Gómez     │ 0             │
│ 10 │ Daniel    │ Santana   │ Loyola    │ 0             │
└────┴───────────┴───────────┴───────────┴───────────────┘

```
12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
```sql
select cliente.id, nombre, apellido1, apellido2, count(pedido.id) as total_pedidos_2017
from cliente
left join pedido on cliente.id = pedido.id_cliente and strftime('%Y', pedido.fecha) = '2017'
group by cliente.id, nombre, apellido1, apellido2;
┌────┬───────────┬───────────┬───────────┬────────────────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ total_pedidos_2017 │
├────┼───────────┼───────────┼───────────┼────────────────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │ 0                  │
│ 2  │ Adela     │ Salas     │ Díaz      │ 2                  │
│ 3  │ Adolfo    │ Rubio     │ Flores    │ 0                  │
│ 4  │ Adrián    │ Suárez    │           │ 1                  │
│ 5  │ Marcos    │ Loyola    │ Méndez    │ 2                  │
│ 6  │ María     │ Santana   │ Moreno    │ 1                  │
│ 7  │ Pilar     │ Ruiz      │           │ 0                  │
│ 8  │ Pepe      │ Ruiz      │ Santana   │ 0                  │
│ 9  │ Guillermo │ López     │ Gómez     │ 0                  │
│ 10 │ Daniel    │ Santana   │ Loyola    │ 0                  │
└────┴───────────┴───────────┴───────────┴────────────────────┘

```
13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
```sql
select cliente.id, nombre, apellido1, max(total) as max_cantidad_pedido
from cliente
left join pedido on cliente.id = pedido.id_cliente
group by cliente.id, nombre, apellido1;
┌────┬───────────┬───────────┬─────────────────────┐
│ id │  nombre   │ apellido1 │ max_cantidad_pedido │
├────┼───────────┼───────────┼─────────────────────┤
│ 1  │ Aarón     │ Rivero    │ 2389.23             │
│ 2  │ Adela     │ Salas     │ 5760.0              │
│ 3  │ Adolfo    │ Rubio     │ 75.29               │
│ 4  │ Adrián    │ Suárez    │ 1983.43             │
│ 5  │ Marcos    │ Loyola    │ 948.5               │
│ 6  │ María     │ Santana   │ 545.75              │
│ 7  │ Pilar     │ Ruiz      │ 2400.6              │
│ 8  │ Pepe      │ Ruiz      │ 2480.4              │
│ 9  │ Guillermo │ López     │                     │
│ 10 │ Daniel    │ Santana   │                     │
└────┴───────────┴───────────┴─────────────────────┘

```
14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
```sql
select strftime('%Y', fecha) as año, max(total) as max_valor_pedido
from pedido
group by año;
┌──────┬──────────────────┐
│ año  │ max_valor_pedido │
├──────┼──────────────────┤
│ 2015 │ 5760.0           │
│ 2016 │ 2480.4           │
│ 2017 │ 3045.6           │
│ 2019 │ 2389.23          │
└──────┴──────────────────┘

```
15. Devuelve el número total de pedidos que se han realizado cada año.
```sql
select strftime('%Y', fecha) as año, count(*) as total_pedidos
from pedido
group by año;
┌──────┬───────────────┐
│ año  │ total_pedidos │
├──────┼───────────────┤
│ 2015 │ 2             │
│ 2016 │ 5             │
│ 2017 │ 6             │
│ 2019 │ 3             │
└──────┴───────────────┘

```
## Subconsultas

### Con operadores básicos de comparación

1. Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER
JOIN).
```sql
select *
from pedido
where id_cliente = (select id from cliente where nombre = 'Adela' and apellido1 = 'Salas' and apellido2 = 'Díaz');
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1            │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘

```
2. Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar join)
```sql
select count(*) as num_pedidos
from pedido
where id_comercial = (select id from comercial where nombre = 'Daniel' and apellido1 = 'Sáez' and apellido2 = 'Vega');
┌─────────────┐
│ num_pedidos │
├─────────────┤
│ 6           │
└─────────────┘

```
3. Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar join)
```sql
select *
from cliente
where id = (select id_cliente from pedido where strftime('%Y', fecha) = '2019' order by total desc limit 1);
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘

```
4. Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
```sql
select fecha, total
from pedido
where id_cliente = (select id from cliente where nombre = 'Pepe' and apellido1 = 'Ruiz' and apellido2 = 'Santana')
order by total asc limit 1;
┌────────────┬───────┐
│   fecha    │ total │
├────────────┼───────┤
│ 2016-08-17 │ 110.5 │
└────────────┴───────┘

```
5. Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
```sql
select cliente.*, pedido.*
from cliente , pedido
where cliente.id = pedido.id_cliente
and strftime('%Y', pedido.fecha) = '2017'
and pedido.total >= (select avg(total) from pedido where strftime('%Y', fecha) = '2017');
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘

```
### Subconsultas con IN y NOT IN

6. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql
select *
from cliente
where id not in (select id_cliente from pedido);
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘

```
7. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
```sql
select *
from comercial
where id not in (select id_comercial from pedido);
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘

```
### Subconsultas con EXISTS y not exists

8. Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT
EXISTS).
```sql
select *
from cliente
where not exists (select * from pedido where pedido.id_cliente = cliente.id);
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘

```
9. Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o not exists).
```sql
select *
from comercial
where not exists (select * from pedido where pedido.id_comercial = comercial.id);
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘

```