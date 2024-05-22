# Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

- Tabla alumnos:

  - id (entero sin signo)
  - nombre (cadena de caracteres)
  - apellido1 (cadena de caracteres)
  - apellido2 (cadena de caracteres)
  - email (cadena de caracteres)

      ```sql
      CREATE DATABASE IF NOT EXISTS test;

      USE test;

      CREATE TABLE IF NOT EXISTS alumnos (
          id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          nombre VARCHAR(50),
          apellido1 VARCHAR(50),
          apellido2 VARCHAR(50),
          email VARCHAR(100)
      );


1. Escribe una función llamado __crear_email__ que dados los parámetros de entrada: __nombre, apellido1, apellido2 y dominio__, cree una dirección de email y la devuelva como salida.

- Función: crear_email
  - Entrada:
      - nombre (cadena de caracteres)
      - apellido1 (cadena de caracteres)
      - apellido2 (cadena de caracteres)
      - dominio (cadena de caracteres)
  - Salida:
      - email (cadena de caracteres)

El email devuelve una dirección de correo electrónico con el siguiente formato:

- El primer carácter del parámetro nombre.
- Los tres primeros caracteres del parámetro apellido1.
- Los tres primeros caracteres del parámetro apellido2.
- El carácter @.
- El dominio pasado como parámetro.
- La dirección de email debe estar en minúsculas.

    ```sql
    
    DELIMITER $$
    CREATE FUNCTION eliminar_acentos(cadena VARCHAR(255)) RETURNS VARCHAR(255)
    BEGIN
        SET cadena = REPLACE(cadena, 'á', 'a');
        SET cadena = REPLACE(cadena, 'é', 'e');
        SET cadena = REPLACE(cadena, 'í', 'i');
        SET cadena = REPLACE(cadena, 'ó', 'o');
        SET cadena = REPLACE(cadena, 'ú', 'u');
        RETURN cadena;
    END$$
    DELIMITER ;

    ```

- También crea una función llamada __eliminar_acentos__ que reciba una cadena de caracteres y devuelva la misma cadena sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.

- Función: eliminar_acentos
  - Entrada:
    - cadena (cadena de caracteres)
  - Salida:
    - (cadena de caracteres)

> ___La función crear_email deberá hacer uso de la función eliminar_acentos___.


      ```sql
      DELIMITER $$
      CREATE FUNCTION eliminar_acentos(cadena VARCHAR(255)) RETURNS VARCHAR(255)
      BEGIN
          SET cadena = REPLACE(cadena, 'á', 'a');
          SET cadena = REPLACE(cadena, 'é', 'e');
          SET cadena = REPLACE(cadena, 'í', 'i');
          SET cadena = REPLACE(cadena, 'ó', 'o');
          SET cadena = REPLACE(cadena, 'ú', 'u');
          RETURN cadena;
      END$$
      DELIMITER ;
      ```    

Una vez creada la tabla escriba un trigger con las siguientes características:

- Trigger:
  - __trigger_crear_email_before_insert__. Se ejecuta sobre la tabla alumnos. Se ejecuta antes de una operación de inserción.Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla. Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.


      ```sql

      CREATE TRIGGER trigger_crear_email_before_insert 
      BEFORE INSERT ON alumnos 
      FOR EACH ROW 
      BEGIN
          IF NEW.email IS NULL THEN
              SET NEW.email = crear_email(NEW.nombre, NEW.apellido1, NEW.apellido2, 'dominio.com');
          END IF;
      END;
      ```