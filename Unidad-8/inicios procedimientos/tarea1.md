<div align="justify">


![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)



En este ejercicio, vamos a trabajar en la creación de una base de datos simple utilizando MySQL. Esta base de datos estará diseñada para __administrar información de usuarios y productos__. Una vez que hayamos creado la base de datos y las tablas necesarias, vamos a implementar procedimientos almacenados y funciones para realizar operaciones comunes sobre estos datos.

Pasos:
- 1. Crea la bbdd. _ Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: "Users" para almacenar información de usuarios y "Products" para almacenar información de productos._

  ```sql
  CREATE DATABASE IF NOT EXISTS SimpleDB;

  USE SimpleDB;

  CREATE TABLE IF NOT EXISTS Users (
      UserID INT AUTO_INCREMENT PRIMARY KEY,
      UserName VARCHAR(50) NOT NULL,
      Email VARCHAR(100) NOT NULL
  );

  CREATE TABLE IF NOT EXISTS Products (
      ProductID INT AUTO_INCREMENT PRIMARY KEY,
      ProductName VARCHAR(100) NOT NULL,
      Price DECIMAL(10, 2) NOT NULL
  );
  ```

- 2. Realiza la inserción de algunos datos de prueba.
  
  ```sql

  INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
  INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

  INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
  INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);

  ```

  >__Nota__:_Realizar la inserción de al menos_ ___3 elementos___ _más en cada tabla_.

- 3. Crea __procedimientos almacenados__ para realizar operaciones como __insertar un nuevo usuario, actualizar el nombre de un usuario__, etc.
  - Procedimiento para insertar un nuevo usuario.


  ```sql 
    DELIMITER $$
    drop procedure if exists insertar_usuario;
    create procedure insertar_usuario (IN pusername VARCHAR(50),
        IN email VARCHAR(50))
    begin 
        insert into Users (UserName, Email) values(pusername, email);
    end$$
    DELIMITER ; 
  ```
 - Procedimiento para actualizar el nombre de un usuario.

 ```sql
    DELIMITER $$
    drop procedure if exists actualizar_usuario;
    create procedure actualizar_nombre (IN userid int, in nuevo_nombre varchar(50))
    begin
        update Users set UserName = nuevo_nombre where UserID = userid;
    end$$
    DELIMITER ; 
 ```
  
>__Nota__: _Realiza la invocación y la verificación de que ha funcionado correctamente_.

- 4. Implementa funciones para realizar cálculos o consultas:
  - Función para calcular el precio total de un conjunto de productos.

    ```sql
    DELIMITER $$
    DROP FUNCTION IF EXISTS calc_total;

    CREATE FUNCTION calc_total() RETURNS FLOAT DETERMINISTIC
    BEGIN
    DECLARE result FLOAT;
    SELECT sum(Price) as total from Products into result;
    RETURN result;
    END$$
    DELIMITER ;

    ```
    ```sql
        SELECT calc_total();

    +--------------+
    | calc_total() |
    +--------------+
    |        47.24 |
    +--------------+
    ```

  - Función para contar el número de usuarios.

  ```sql
    DELIMITER $$
    DROP FUNCTION IF EXISTS calc_users$$

    CREATE FUNCTION calc_users() RETURNS INTEGER DETERMINISTIC
    BEGIN
    DECLARE result INTEGER;
    SELECT count(UserID) as num_users from Users into result;
    RETURN result;
    END$$

    DELIMITER ;
  ```

  ```sql
    SELECT calc_users();
    +--------------+
    | calc_users() |
    +--------------+
    |            6 |
    +--------------+
```

>__Nota__: _Realiza la invocación y la verificación de que ha funcionado correctamente_.


</div>

