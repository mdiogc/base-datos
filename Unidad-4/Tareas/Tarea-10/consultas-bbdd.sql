--Proporciona una consulta que muestre solo los clientes de Brasil.
select firstname, country from customers where country= 'Brazil';
/**
┌───────────┬─────────┐
│ FirstName │ Country │
├───────────┼─────────┤
│ Luís      │ Brazil  │
│ Eduardo   │ Brazil  │
│ Alexandre │ Brazil  │
│ Roberto   │ Brazil  │
│ Fernanda  │ Brazil  │
└───────────┴─────────┘
**/

--Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.
select customers.firstname, customers.lastname, invoices.InvoiceId, invoices.InvoiceDate, invoices.BillingCountry 
from customers join invoices on customers.CustomerId = invoices.CustomerId
where invoices.BillingCountry = 'Brazil' ;
/**
┌───────────┬───────────┬───────────┬─────────────────────┬────────────────┐
│ FirstName │ LastName  │ InvoiceId │     InvoiceDate     │ BillingCountry │
├───────────┼───────────┼───────────┼─────────────────────┼────────────────┤
│ Eduardo   │ Martins   │ 25        │ 2009-04-09 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 34        │ 2009-05-23 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 35        │ 2009-06-05 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 57        │ 2009-09-06 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 58        │ 2009-09-07 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 68        │ 2009-10-17 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 80        │ 2009-12-10 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 98        │ 2010-03-11 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 121       │ 2010-06-13 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 123       │ 2010-06-17 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 132       │ 2010-07-31 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 143       │ 2010-09-15 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 154       │ 2010-11-14 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 155       │ 2010-11-14 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 166       │ 2010-12-25 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 177       │ 2011-02-16 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 195       │ 2011-05-06 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 199       │ 2011-05-21 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 221       │ 2011-08-25 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 251       │ 2012-01-09 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 252       │ 2012-01-22 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 253       │ 2012-01-22 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 264       │ 2012-03-03 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 275       │ 2012-04-25 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 297       │ 2012-07-28 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 316       │ 2012-10-27 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 319       │ 2012-11-01 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 327       │ 2012-12-07 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 349       │ 2013-03-18 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 350       │ 2013-03-31 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 372       │ 2013-07-02 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 373       │ 2013-07-03 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 382       │ 2013-08-07 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 383       │ 2013-08-12 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 395       │ 2013-10-05 00:00:00 │ Brazil         │
└───────────┴───────────┴───────────┴─────────────────────┴────────────────┘
**/
--Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
select lastname, FirstName, title 
from employees where title='Sales Support Agent';
/**
┌──────────┬───────────┬─────────────────────┐
│ LastName │ FirstName │        Title        │
├──────────┼───────────┼─────────────────────┤
│ Peacock  │ Jane      │ Sales Support Agent │
│ Park     │ Margaret  │ Sales Support Agent │
│ Johnson  │ Steve     │ Sales Support Agent │
└──────────┴───────────┴─────────────────────┘
**/
--Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.
select distinct BillingCountry from invoices;
/**
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Germany        │
│ Norway         │
│ Belgium        │
│ Canada         │
│ USA            │
│ France         │
│ Ireland        │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ India          │
│ Brazil         │
│ Portugal       │
│ Netherlands    │
│ Spain          │
│ Sweden         │
│ Czech Republic │
│ Finland        │
│ Denmark        │
│ Italy          │
│ Poland         │
│ Austria        │
│ Hungary        │
│ Argentina      │
└────────────────┘
**/
--Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
select customers.firstname, customers.lastname, invoices.BillingCountry, invoices.total
from customers join invoices on customers.CustomerId = invoices.CustomerId
where invoices.BillingCountry = 'Brazil' ;
/**
┌───────────┬───────────┬────────────────┬───────┐
│ FirstName │ LastName  │ BillingCountry │ Total │
├───────────┼───────────┼────────────────┼───────┤
│ Eduardo   │ Martins   │ Brazil         │ 8.91  │
│ Roberto   │ Almeida   │ Brazil         │ 0.99  │
│ Fernanda  │ Ramos     │ Brazil         │ 1.98  │
│ Alexandre │ Rocha     │ Brazil         │ 1.98  │
│ Fernanda  │ Ramos     │ Brazil         │ 3.96  │
│ Alexandre │ Rocha     │ Brazil         │ 13.86 │
│ Fernanda  │ Ramos     │ Brazil         │ 5.94  │
│ Luís      │ Gonçalves │ Brazil         │ 3.98  │
│ Luís      │ Gonçalves │ Brazil         │ 3.96  │
│ Alexandre │ Rocha     │ Brazil         │ 8.91  │
│ Fernanda  │ Ramos     │ Brazil         │ 0.99  │
│ Luís      │ Gonçalves │ Brazil         │ 5.94  │
│ Eduardo   │ Martins   │ Brazil         │ 1.98  │
│ Roberto   │ Almeida   │ Brazil         │ 1.98  │
│ Roberto   │ Almeida   │ Brazil         │ 13.86 │
│ Eduardo   │ Martins   │ Brazil         │ 3.96  │
│ Luís      │ Gonçalves │ Brazil         │ 0.99  │
│ Eduardo   │ Martins   │ Brazil         │ 5.94  │
│ Roberto   │ Almeida   │ Brazil         │ 8.91  │
│ Eduardo   │ Martins   │ Brazil         │ 0.99  │
│ Alexandre │ Rocha     │ Brazil         │ 1.98  │
│ Fernanda  │ Ramos     │ Brazil         │ 1.98  │
│ Fernanda  │ Ramos     │ Brazil         │ 13.86 │
│ Alexandre │ Rocha     │ Brazil         │ 3.96  │
│ Alexandre │ Rocha     │ Brazil         │ 5.94  │
│ Luís      │ Gonçalves │ Brazil         │ 1.98  │
│ Fernanda  │ Ramos     │ Brazil         │ 8.91  │
│ Luís      │ Gonçalves │ Brazil         │ 13.86 │
│ Alexandre │ Rocha     │ Brazil         │ 0.99  │
│ Roberto   │ Almeida   │ Brazil         │ 1.98  │
│ Eduardo   │ Martins   │ Brazil         │ 1.98  │
│ Roberto   │ Almeida   │ Brazil         │ 3.96  │
│ Luís      │ Gonçalves │ Brazil         │ 8.91  │
│ Eduardo   │ Martins   │ Brazil         │ 13.86 │
│ Roberto   │ Almeida   │ Brazil         │ 5.94  │
└───────────┴───────────┴────────────────┴───────┘
**/
--Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
select employees.lastname, employees.firstname
/**

**/
--Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
select invoices.total, customers.FirstName, customers.Country
/**

**/
--¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?


/**

**/
--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.

/**

**/
--Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY

/**

**/
--Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.

/**

**/
--Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.

/**

**/
--Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.

/**

**/
--Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.

/**

**/
--Proporciona una consulta que muestre todas las facturas.

/**

**/
--Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.

/**

**/
--¿Qué agente de ventas realizó más ventas en 2009?

/**

**/
--Escribir una consulta que muestre todas las playlists de la base de datos.

/**

**/

--Escribe una consulta que liste todas las canciones de una playlist.

/**

**/

--Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.

/**

**/