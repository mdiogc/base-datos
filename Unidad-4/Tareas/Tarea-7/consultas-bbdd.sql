-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
select coches.modelo, coches.precio, clientes.nombre 
from coches, ventas, clientes 
where coches.id_coche = ventas.id_coche
and ventas.id_cliente = clientes.id_cliente;

/**
┌────────────────┬─────────┬─────────────────┐
│     modelo     │ precio  │     nombre      │
├────────────────┼─────────┼─────────────────┤
│ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ SUV 2023       │ 30000.0 │ Carlos López    │
│ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ Híbrido 2022   │ 27000.0 │ Miguel González │
│ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
└────────────────┴─────────┴─────────────────┘
**/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
select clientes.nombre
from clientes, ventas, coches
where clientes.id_cliente = ventas.id_cliente
and ventas.id_coche = coches.id_coche
and coches.precio > (select avg(precio) from coches);

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Carlos López    │
│ Pedro Rodríguez │
│ Isabel Díaz     │
│ Elena Torres    │
└─────────────────┘
**/


-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
select modelo, precio
from coches
where id_coche not in (select id_coche from ventas);
/**
┌─────────────┬─────────┐
│   modelo    │ precio  │
├─────────────┼─────────┤
│ Pickup 2022 │ 31000.0 │
└─────────────┴─────────┘
**/


-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.
select sum(coches.precio) as total_gastado
from ventas
join coches on ventas.id_coche = coches.id_coche;
/**
┌───────────────┐
│ total_gastado │
├───────────────┤
│ 259000.0      │
└───────────────┘
**/


-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?
select coches.modelo, ventas.fecha_venta, clientes.nombre
from ventas, coches, clientes
where ventas.id_coche = coches.id_coche
and ventas.id_cliente = clientes.id_cliente
order by ventas.fecha_venta desc;

/**
┌────────────────┬─────────────┬─────────────────┐
│     modelo     │ fecha_venta │     nombre      │
├────────────────┼─────────────┼─────────────────┤
│ Eléctrico 2021 │ 2023-10-05  │ Elena Torres    │
│ Deportivo 2023 │ 2023-08-25  │ Isabel Díaz     │
│ Híbrido 2022   │ 2023-07-20  │ Miguel González │
│ Compacto 2021  │ 2023-06-15  │ Laura Sánchez   │
│ Camioneta 2023 │ 2023-05-05  │ Pedro Rodríguez │
│ Coupé 2022     │ 2023-04-10  │ Ana Martínez    │
│ SUV 2023       │ 2023-03-25  │ Carlos López    │
│ Hatchback 2021 │ 2023-02-20  │ María Gómez     │
│ Sedán 2022     │ 2023-01-15  │ Juan Pérez      │
└────────────────┴─────────────┴─────────────────┘
**/

-- Encontrar el modelo de coche más caro que ha sido reparado al menos una vez.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
SELECT coches.modelo
FROM coches
JOIN ventas ON coches.id_coche = ventas.id_coche
WHERE coches.precio = (
    SELECT MAX(precio)
    FROM coches
    JOIN ventas ON coches.id_coche = ventas.id_coche);
/**
┌────────────────┐
│     modelo     │
├────────────────┤
│ Eléctrico 2021 │
└────────────────┘
**/

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
select clientes.nombre, count(ventas.id_venta) as cantidad_coches_comprados
from clientes
join ventas on clientes.id_cliente = ventas.id_cliente
group by clientes.nombre
order by cantidad_coches_comprados desc;
/**
┌─────────────────┬───────────────────────────┐
│     nombre      │ cantidad_coches_comprados │
├─────────────────┼───────────────────────────┤
│ Pedro Rodríguez │ 1                         │
│ Miguel González │ 1                         │
│ María Gómez     │ 1                         │
│ Laura Sánchez   │ 1                         │
│ Juan Pérez      │ 1                         │
│ Isabel Díaz     │ 1                         │
│ Elena Torres    │ 1                         │
│ Carlos López    │ 1                         │
│ Ana Martínez    │ 1                         │
└─────────────────┴───────────────────────────┘
**/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
select clientes.nombre, coches.marca 
from clientes, ventas, coches
where clientes.id_cliente = ventas.id_cliente
and ventas.id_coche = coches.id_coche
and coches.marca = 'Toyota';
/**
┌────────────┬────────┐
│   nombre   │ marca  │
├────────────┼────────┤
│ Juan Pérez │ Toyota │
└────────────┴────────┘
**/

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 
select avg(clientes.edad) as promedio_edad
from clientes, ventas, coches
where clientes.id_cliente = ventas.id_cliente
and ventas.id_coche = coches.id_coche
and coches.precio > 25000;

/**
┌──────────────────┐
│  promedio_edad   │
├──────────────────┤
│ 32.8333333333333 │
└──────────────────┘
**/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
select coches.modelo, coches.precio
from coches, ventas, clientes
where coches.id_coche = ventas.id_coche
and ventas.id_cliente = clientes.id_cliente
and clientes.edad > 30;

/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ SUV 2023       │ 30000.0 │
│ Camioneta 2023 │ 32000.0 │
│ Compacto 2021  │ 20000.0 │
│ Deportivo 2023 │ 35000.0 │
└────────────────┴─────────┘
**/

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
select coches.modelo, 
       (select count(*) 
        from ventas 
        where ventas.id_coche = coches.id_coche 
        and fecha_venta >= '2022-01-01' 
        and fecha_venta <= '2022-12-31') as cantidad_ventas
from coches;

/**
┌────────────────┬─────────────────┐
│     modelo     │ cantidad_ventas │
├────────────────┼─────────────────┤
│ Sedán 2022     │ 0               │
│ Hatchback 2021 │ 0               │
│ SUV 2023       │ 0               │
│ Coupé 2022     │ 0               │
│ Camioneta 2023 │ 0               │
│ Compacto 2021  │ 0               │
│ Híbrido 2022   │ 0               │
│ Deportivo 2023 │ 0               │
│ Pickup 2022    │ 0               │
│ Eléctrico 2021 │ 0               │
└────────────────┴─────────────────┘
**/

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG
select coches.modelo, coches.precio
from coches, ventas, clientes
where coches.id_coche = ventas.id_coche
and ventas.id_cliente = clientes.id_cliente
and clientes.edad < 30
and coches.precio > (
    select avg(coches.precio)
    from coches, ventas, clientes
    where coches.id_coche = ventas.id_coche
    and ventas.id_cliente = clientes.id_cliente
    and clientes.edad < 30
);

/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ Eléctrico 2021 │ 40000.0 │
└────────────────┴─────────┘
**/

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
select coches.marca, count(*) as total_ventas
from ventas, coches
where ventas.id_coche = coches.id_coche
group by coches.marca
order by total_ventas desc;
/**
┌────────────┬──────────────┐
│   marca    │ total_ventas │
├────────────┼──────────────┤
│ Volkswagen │ 1            │
│ Toyota     │ 1            │
│ Tesla      │ 1            │
│ Nissan     │ 1            │
│ Mazda      │ 1            │
│ Hyundai    │ 1            │
│ Honda      │ 1            │
│ Ford       │ 1            │
│ Chevrolet  │ 1            │
└────────────┴──────────────┘
**/
