<div align="justify">


![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)



Se pide realizar los procedimientos y funciones:

Realice los siguientes procedimientos y funciones sobre la base de datos jardineria.
- Función  __calcular_precio_total_pedido__
  >__Nota__:Dado un código de pedido la función debe calcular la suma total del pedido. Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.
   - Parámetros de entrada: codigo_pedido (INT)
   - Parámetros de salida: El precio total del pedido (FLOAT)

  ```sql
  DELIMITER $$
  DROP FUNCTION IF EXISTS calcular_precio_total_pedido;
  CREATE FUNCTION calcular_precio_total_pedido (codigo_pedido INTEGER) RETURNS FLOAT DETERMINISTIC
  BEGIN
  DECLARE total_precio FLOAT;
  SELECT SUM(cantidad * precio_unidad) INTO total_precio
  FROM detalle_pedido
  WHERE codigo_pedido = codigo_pedido;

  RETURN total_precio;
  END $$
  DELIMITER;
  ```



- Función  __calcular_suma_pedidos_cliente__
  >__Nota__:Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.
  - Parámetros de entrada: codigo_cliente (INT)
  - Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)

  ```sql
  DELIMITER $$
  DROP FUCTION IF EXIST calcular_suma_pedidos_clientes;
  CREATE FUNCTION calcular_suma_pedidos_clientes (codigo_cliente INTEGER) RETURNS FLOAT DETERMINISTIC
  BEGIN 
  BEGIN
  DECLARE total_pedidos INT;
  SELECT COUNT(codigo_cliente) INTO total_pedidos
  FROM pedido
  WHERE codigo_cliente = codigo_cliente;
  RETURN total_pedidos;
  END $$
  DELIMITER;
  ```

- Función __calcular_suma_pagos_cliente__
  >__Nota__:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
  - Parámetros de entrada: codigo_cliente (INT)
  - Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)
  
  ```sql
  DELIMITER $$

  DROP FUNCTION IF EXISTS calcular_suma_pagos_cliente;

  CREATE FUNCTION calcular_suma_pagos_cliente(codigo_cliente INTEGER) RETURNS FLOAT DETERMINISTIC
  BEGIN
  DECLARE total_pagado FLOAT;
  SELECT SUM(calcular_precio_total_pedido(codigo_pedido)) INTO total_pagado
  FROM pedido
  WHERE codigo_cliente = codigo_cliente;
  RETURN total_pagado;
  END $$
  DELIMITER;
  ```

   
- Procedimiento __calcular_pagos_pendientes__
  >__Nota__:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.

  ```sql

  ```

### Carga de datos

- Realiza la carga de la BBDD de [Jardineria](file/jardineria.sql) y describe los pasos que has realizado.



</div>
