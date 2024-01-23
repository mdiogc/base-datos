<div align="justify";>

## Apuntes de SQL3 para el examen ;)
---

Los tipos de datos básicos de SQLite:

-  **text**: se usa para almacenar cadenas de caracteres. Una cadena es una secuencia de caracteres. Se coloca entre comillas (simples); ejemplo: 'Hola', 'Juan Perez'. El tipo "text" define una cadena de longitud variable.
- **integer**: se usa para guardar valores numéricos enteros. Definimos campos de este tipo cuando queremos representar, por ejemplo, cantidades.
- **real**: se usa para almacenar valores numéricos con decimales. Se utiliza como separador el punto (.). Definimos campos de este tipo para precios, por ejemplo.
- **blob**: se usa para almacenar valores en formato binario (imágenes, archivos de sonido etc.)

Antes de crear una tabla debemos pensar en sus campos y optar por el tipo de dato adecuado para cada uno de ellos. Por ejemplo, si en un campo almacenaremos números enteros, el tipo "real" sería una mala elección; si vamos a guardar precios, el tipo "real" es más adecuado, no así "integer" que no tiene decimales.

```sql
 create table libro(
	titulo text,
	autor text,
	editorial text,
	precio real,
	cantidad integer
 );
```

### Para ver la tabla
```sql
. mode box
select * from x
```

### Modelo de como se ve los ve los insert()

```sql
INSERT INTO comments ( name, email, website_url, comment )
VALUES ( 'Shivam Mamgain', 'xyz@gmail.com',
'shivammg.blogspot.com', 'Great tutorial for beginners.' );
```
> Como podemos ver los valores se irán añadiendo a las filas por orden.












</div>