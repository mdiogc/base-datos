<div align="justify";>

# Tarea 4 sobre sqlite3 funciones de base de datos

**Responde a las siguientes cuestiones**


1. Realiza el diagrama ER de la BBDD supermercado.
2. Realiza el diagrama MR de la BBDD supermercado.
3. Indica si la BBDD esta normalizada hasta la 3ª forma normal, justificando la respuesta.

Paso 4: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

1. Mostrar todos los productos de la categoría "Bebidas".
```sql
select * from productos where categoria like 'Bebidas';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```
2. Listar los productos ordenados por precio de forma descendente.
```sql
 select * from  productos order by  precio desc;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 16 │ Café               │ Bebidas   │ 5.0    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
└────┴────────────────────┴───────────┴────────┘
```
3. Calcular el precio total de todos los productos en la tabla "productos".
```sql
select sum(precio) as suma_precio from productos;
┌─────────────┐
│ suma_precio │
├─────────────┤
│ 52.5        │
└─────────────┘
```

4. Encontrar los productos con un nombre que contenga la letra 'a'.
```sql
select * from productos where nombre like '%a%';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño    │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```

5. Obtener la cantidad total de productos vendidos en todas las fechas.

```sql
select sum(cantidad) as  suma_producto from ventas;
┌───────────────┐
│ suma_producto │
├───────────────┤
│ 43            │
└───────────────┘
```
6. Encontrar el producto más caro en cada categoría.
```sql
select categoria, max(precio) from productos group by categoria;
┌───────────┬─────────────┐
│ categoria │ max(precio) │
├───────────┼─────────────┤
│ Alimentos │ 2.5         │
│ Bebidas   │ 5.0         │
│ Carnes    │ 5.5         │
│ Cocina    │ 4.5         │
│ Conservas │ 2.3         │
│ Desayuno  │ 3.5         │
│ Frutas    │ 3.0         │
│ Higiene   │ 2.0         │
│ Hogar     │ 1.5         │
│ Limpieza  │ 2.8         │
│ Lácteos   │ 4.0         │
│ Panadería │ 1.2         │
│ Snacks    │ 1.7         │
│ Verduras  │ 2.2         │
└───────────┴─────────────┘
```

7. Listar los productos que no han sido vendidos.
```sql
 select * from  productos where id not in (select p.id from productos as p, ventas as v where p.id = v.id_producto);
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘
```

8. Calcular el precio promedio de los productos en la categoría "Snacks".
```sql
select avg(precio) as precio_promedio from productos  where categoria = 'Snacks';
┌─────────────────┐
│ precio_promedio │
├─────────────────┤
│ 1.7             │
└─────────────────┘
```

9. Encontrar los productos que han sido vendidos más de 5 veces.

```sql
select id_producto,cantidad from ventas where cantidad >= 5;
┌─────────────┬──────────┐
│ id_producto │ cantidad │
├─────────────┼──────────┤
│ 1           │ 5        │
│ 6           │ 10       │
│ 14          │ 7        │
│ 18          │ 6        │
└─────────────┴──────────┘
```

10. Mostrar la fecha y la cantidad de ventas para cada producto.
```sql
select id_producto, current_date, cantidad from ventas;
┌─────────────┬──────────────┬──────────┐
│ id_producto │ current_date │ cantidad │
├─────────────┼──────────────┼──────────┤
│ 1           │ 2024-01-18   │ 5        │
│ 2           │ 2024-01-18   │ 3        │
│ 4           │ 2024-01-18   │ 2        │
│ 5           │ 2024-01-18   │ 1        │
│ 6           │ 2024-01-18   │ 10       │
│ 8           │ 2024-01-18   │ 4        │
│ 10          │ 2024-01-18   │ 2        │
│ 14          │ 2024-01-18   │ 7        │
│ 16          │ 2024-01-18   │ 3        │
│ 18          │ 2024-01-18   │ 6        │
└─────────────┴──────────────┴──────────┘
```

11. Encontrar los productos que tienen un precio menor o igual a 2.
```sql
select nombre, precio from productos where precio <= 2;
┌────────────────────┬────────┐
│       nombre       │ precio │
├────────────────────┼────────┤
│ Leche              │ 1.8    │
│ Pan                │ 1.2    │
│ Huevos             │ 1.0    │
│ Yogurt             │ 2.0    │
│ Papel Higiénico    │ 1.5    │
│ Cepillo de Dientes │ 2.0    │
│ Galletas           │ 1.7    │
│ Jabón de Baño      │ 1.2    │
│ Botellas de Agua   │ 1.0    │
└────────────────────┴────────┘
```

12. Calcular la cantidad total de ventas para cada fecha.

```sql

```
13. Listar los productos cuyo nombre comienza con la letra 'P'.
```sql

```

14. Obtener el producto más vendido en términos de cantidad.

```sql

```
15. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.
```sql

```
16. Calcular el total de ventas para cada producto.
```sql

```
17. Encontrar los productos con un precio entre 3 y 4.
```sql

```
18. Listar los productos y sus categorías ordenados alfabéticamente por categoría.
```sql

```
19. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.
```sql

```
20. Mostrar los productos que no pertenecen a la categoría "Higiene".
```sql

```
21. Encontrar la cantidad total de productos en cada categoría.
```sql

```
22. Listar los productos que tienen un precio igual a la media de precios.

```sql

```

23. Calcular el precio total de los productos vendidos en cada fecha.

```sql

```
24. Mostrar los productos con un nombre que termina con la letra 'o'.
```sql

```
25. Encontrar los productos que han sido vendidos en más de una fecha.
```sql

```
26. Listar los productos cuya categoría comienza con la letra 'L'.
```sql

```
27. Calcular el total de ventas para cada producto en la fecha '2024-01-17'.
```sql

```
28. Mostrar los productos cuyo nombre tiene al menos 5 caracteres.
```sql

```
29. Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".
```sql

```




</div>