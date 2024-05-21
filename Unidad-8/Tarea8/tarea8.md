<div align="justify">

![Header](https://hoplasoftware.com/wp-content/uploads/2021/07/1024px-MySQL.ff87215b43fd7292af172e2a5d9b844217262571.png)

# Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

- Tabla alumnos:
  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - nota (número real)


  ```sql
    drop database if exists test;
    create database test;
    use test;

    create table alumnos(
        id int primary key auto_increment,
        nombre varchar(100),
        apellido1 varchar(100),
        apellido2 varchar(100),
        nota float);
  ```
  
Crea los siguientes __triggers__:
- __Trigger1__: _trigger_check_nota_before_insert_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de inserción.
  - Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.
    
    ```sql
        DELIMITER //
        create trigger _trigger_check_nota_before_insert_
        BEFORE INSERT on alumnos
        FOR EACH ROW
        
        begin
            if new.nota < 0 then set new.nota = 0;
            elseif new.nota > 10 then set new.nota = 10;
            end if;
        END;

        // DELIMITER;

    ```

- __Trigger2__ : _trigger_check_nota_before_update_.
  - Se ejecuta sobre la tabla alumnos.
  - Se ejecuta antes de una operación de actualización.
  - Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
  - Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.

    ```sql
    DELIMITER //
    create trigger _trigger_check_nota_before_update_
    before update on alumnos

    begin
    if new.nota > 0 then set new.nota = 0;
    elseif new.nota < 10 then set new.nota = 10;

    end if;

    END;

    // DELIMITER;

    ```




Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea el siguiente procedimiento:
- __Procedimiento1__:
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.
  - Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.

Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados.

---






</div>