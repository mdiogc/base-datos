<div align="justify";>

# Normalización

La normalización es el tercer paso que deberás seguir siempre que quierás hacer una Base de Datos. Su principal función es corregir los pasos anteriores para que cumplan unas formas establecidas llamadas Formas Normales.

En sí todas las bases de datos necesitarán tener resultos cualquier problema de actualización, inserción, eliminación y rebundancia. Las formas normales que hemos dados son las siguientes:

### Primera Forma normal:
Su principal función es eliminar cualquier tipo de redundancia que exista en nuestra base de datos. Es necesario analizar los elementos que la componen para que todos ellos sean valores atómicos y únicos en sus correspondientes columnas y filas. 

Cuando tenemos que tener cuidado es en las propiedades multievaluadas y compuestas. Estas por lo general, son las que crean los comflictos de rebundacia en la tabla principal.

Un ejemplo sería el siguiente:


| ID | Nombre          | Teléfonos          |
|----|-----------------|-------------------|
| 1  | Pedro Rodríguez     | 555-1234, 555-5678 |

Esta tabla correspondería antes de realizar la primera forma normal. Ahora aplicando la primera forma normal.


| ID | Nombre          | Teléfonos          |
|----|-----------------|-------------------|
| 1  | Pedro Rodríguez     | 555-1234 
| 1  | Pedro Rodríguez   | 555-5678 |

---
### Segunda Forma normal:
Es un principio en la normalización que se centra en la eliminación de dependencias parciales en una tabla. Para cumplir con la 2FN, una tabla debe cumplir con dos criterios:
- Cumplir con la 1FN
- Eliminar las depencias parciales: Cada atributo no clave de la tabla debe depender completamente de la clave primaria. No puede depender solo de una parte de la clave primaria, lo que se conoce como una dependencia parcial. Así mismo, añadir que si es necesario poner una  clave primaria, porque no la tenemos, deberemos añadirsela nosotros.

En resumen, la 2FN ayuda a organizar los datos de manera que evita redundancias y asegura una estructura más coherente al garantizar que cada atributo no clave dependa completamente de la clave primaria.

Un ejemplo sería el siguiente: 

Así sería con la 1FN completa y faltaría ponerla en 2FN:

| Estudiante_ID | Nombre    | Curso_ID | Descripción     | Profesor     |
|---------------|-----------|----------|-----------------|--------------|
| 1             | Pepito      | 101      | Matemáticas     | Dr. Rodríguez |
| 1             | Pepito      | 102      | Historia         | Dr. Pérez     |
| 2             | Laura     | 101      | Matemáticas     | Dr. Rodríguez |
| 3             | Luis    | 103      | Ciencias        | Dr. Gómez     |
| 3             | Luis    | 104      | Literatura       | Dr. García    |

En 2FN, quedaría de la siguiente manera:

__Estudiantes__

| Estudiante_ID | Nombre    |
|---------------|-----------|
| 1             | Pepito      |
| 2             | Laura     |
| 3             | Luis    |

__Cursos__

| Curso_ID | Descripción     | Profesor     |
|----------|-----------------|--------------|
| 101      | Matemáticas     | Dr. Rodríguez |
| 102      | Historia         | Dr. Pérez     |
| 103      | Ciencias        | Dr. Gómez     |
| 104      | Literatura       | Dr. García    |


---
### Tercera Forma normal:

En esta, se trata de eliminar las dependencias transitivas; es decir, ningun atributo no clave debe depender transitivamente de la clave primaria. Esto significa que si un atributo no clave depende de otro atributo no clave, ambos deben formar parte de una clave candidata o el atributo dependiente debe ser eliminado. 

Como pasa en la 2FN, la 3FN es necesario que cumpla con la 1FN y con la 2FN. Si no este paso no se podría realizar.

En resumen, la 3FN ayuda a elimnar estas dependencias de una tabla, asegurando que los datos estén organizados de manera más eficiente y reduciendo la redundancia en la base de datos.

Con el ejemplo anterior, la tercera forma normal quedaría de la siguiente forma normal:

__Cursos__


| Curso_ID | Descripción     |
|----------|-----------------|
| 101      | Matemáticas     |
| 102      | Historia         |
| 103      | Ciencias        |
| 104      | Literatura       |

__Profesor__

| Profesor_ID | Profesor     |
|----------|--------------|
| 1001      | Dr. Rodríguez |
| 1002      | Dr. Pérez     |
| 1003      | Dr. Gómez     |
| 1004      | Dr. García    |

__Curso_Profesor__

| Curso_ID | Profesor_ID     |
|----------|--------------|
| 101      | 1001 |
| 102      | 1002     |
| 103      | 1003     |
| 104      | 1004    |

---
## Ejercicio Completo
Para no generar un documento markdown tan grande, hemos decidio ponerlo en otro fichero. En el siguiente enlace, les redirigue al ejercicio ya realizado.

- [Normalización del Ejercicio](Ejercicio-Normalizaci%C3%B3n.md)

</div>