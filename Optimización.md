## Triggers (Disparadores)
- ¿Qué es un Trigger?

Un trigger es un conjunto de instrucciones que se ejecuta automáticamente cuando ocurre un evento en la base de datos, como insertar, actualizar o eliminar datos.
- **Ejemplos**:

  - Si alguien intenta poner un precio negativo para un producto, el trigger cambia ese precio a 0 antes de guardar el dato.
  ```sql
  CREATE TRIGGER antesDeInsertarProducto
  BEFORE INSERT ON Producto
  FOR EACH ROW
  BEGIN
  IF NEW.precio < 0 THEN
  SET NEW.precio = 0;
  END IF;
  END;
  ```
  - Supongamos que tenemos una tabla de empleados y queremos mantener un historial de cambios cada vez que se actualiza el salario de un empleado.
    Tablas:
        Empleado: idEmpleado, nombre, salario
        HistorialSalarios: idHistorial, idEmpleado, salarioAnterior, nuevoSalario, fechaCambio
  ```sql
     CREATE TRIGGER actualizarHistorialSalario
    AFTER UPDATE ON Empleado
    FOR EACH ROW
    BEGIN
        IF NEW.salario != OLD.salario THEN
            INSERT INTO HistorialSalarios (idEmpleado, salarioAnterior, nuevoSalario, fechaCambio)
            VALUES (OLD.idEmpleado, OLD.salario, NEW.salario, NOW());
        END IF;
    END;
  ```

### NEW y OLD en Triggers
- En MySQL, NEW y OLD se utilizan dentro de los triggers para referirse a los valores de las columnas antes y después de una operación que activa el trigger.

  - **NEW**: Contiene los valores que tendrán las columnas después de la operación.
        Usado en triggers **BEFORE INSERT, AFTER INSERT, BEFORE UPDATE y AFTER UPDATE**.
  - **OLD**: Contiene los valores que tenían las columnas antes de la operación.
        Usado en triggers **BEFORE DELETE, AFTER DELETE, BEFORE UPDATE y AFTER UPDATE.**

## Procedimientos Almacenados
- Qué es un Procedimiento Almacenado?

Un procedimiento almacenado es una serie de instrucciones que puedes guardar y ejecutar cuando lo necesites. Funciona como una receta para hacer algo en la base de datos.

- **Ejemplos**:
  
   - Un procedimiento para agregar un nuevo cliente y anotar si es un cliente internacional.
  ```sql
          CREATE PROCEDURE agregarCliente(
        IN idCliente INT,
        IN pais VARCHAR(50),
        IN nombre VARCHAR(50),
        IN apellido VARCHAR(50)
    )
    BEGIN
        DECLARE observacion VARCHAR(100);
        
        IF pais != 'España' THEN
            SET observacion = 'Cliente internacional';
        ELSE
            SET observacion = NULL;
        END IF;
        
        INSERT INTO Cliente (idCliente, pais, nombre, apellido, observaciones)
        VALUES (idCliente, pais, nombre, apellido, observacion);
    END;
    ```
  - Supongamos que tenemos una tabla de clientes y otra de transacciones, y queremos crear un procedimiento que devuelva el saldo actual de un cliente.
  ```sql
        CREATE PROCEDURE obtenerSaldoCliente (IN cliente_id INT)
    BEGIN
        DECLARE saldo DECIMAL(10,2);
        
        SELECT SUM(monto) INTO saldo
        FROM Transacciones
        WHERE cliente_id = cliente_id;
        
        SELECT saldo;
    END;
  ```

## Cursores

- ¿Qué es un Cursor?

Un cursor te permite revisar filas de una tabla una por una, para hacer algo con cada fila.
   
- **Ejemplos**:

  - Revisar todas las reservas en una fecha específica y actualizar el estado de las habitaciones a "Reservada".
 
    ```sql
        CREATE PROCEDURE revisarReservas(fecha DATE)
    BEGIN
        DECLARE done INT DEFAULT 0;
        DECLARE numHabitacion INT;
        DECLARE cursorReservas CURSOR FOR
            SELECT numHabitacion FROM Reserva WHERE fechaEntrada = fecha;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
        
        OPEN cursorReservas;
        leerReservas: LOOP
            FETCH cursorReservas INTO numHabitacion;
            IF done THEN
                LEAVE leerReservas;
            END IF;
            
            UPDATE Habitacion SET estado = 'Reservada' WHERE numHabitacion = numHabitacion;
        END LOOP leerReservas;
        
        CLOSE cursorReservas;
    END;
    ```

    - Supongamos que tienes una tabla de empleados y quieres incrementar el salario de cada empleado en un cierto porcentaje.

    ```sql
    CREATE PROCEDURE aumentarSalarios(porcentaje INT)
    BEGIN
        DECLARE done BOOLEAN DEFAULT FALSE;
        DECLARE salario_actual DECIMAL(10, 2);
        DECLARE cur CURSOR FOR SELECT salario FROM Empleados;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO salario_actual;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE Empleados SET salario = salario + (salario * porcentaje / 100);
    END LOOP;
    CLOSE cur;
    END;
    ```

























  
##
