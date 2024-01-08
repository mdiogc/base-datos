<div align="justify";>


# Ejercicios Normalizados
Una vez realizado el modelo-MR para configurar nuestra Base de Datos. Debemos seguir el tercer paso: **La Normalización**. Gracias a esta, podremos corregir los pasos anteriores para que cumplan unas formas establecidas llamadas Formas Normales.

En este caso, tomaremos las dos entidades fundamentales que contienen más datos que corregir como *Estudiante*, *Curso* y *Profesor*. Para simular a la realidad, hemos añadido datos aleatorios según los atributos que poseían.

---

> Aunque en el modelo entidad relación ya pusimos los atributos como datos anatómicos, hemos querido poner el supuesto en que así no fuese:

__Alumnos_Profesores__

DNI_Alumno|Nombre y Apellido|Email|Dirección|ID_Profesor|DNI_Profesor|Nombre y Apellido|Curso_ID|Asignatura
|----------------|------|----|------|-----|-----|-----|------|-------|
|123456J|José Hernández|joseherndz@gmail.com, josehdz123@gmail.com|Calle girasol, 45, Santa cruz, Santa cruz, 2, 38001|01|1238584L|Sergio Delgado|100|Programación
|528545K|Sandra Hernández|sandra23@gmail.com|Calle girasol, 45, Santa cruz, Santa cruz, 2, 38001|02|7854783M|Joatham Expósito|101|Base de datos
|126786K|María García|maria345gc@gmail.com|Calle Bermuda, 12, Santa cruz, 5, Puerto de la cruz, 38400|01|1238584L|Sergio Delgado|100|Programación


### Primera Forma Normal

> Como podemos observar, al hacer la primera forma normal, hemos puesto todos los datos de forma única. eliminando así conflictos de redundancia.


__Estudiante__
 DNI    |Nombre|Apellido  |Email| Calle |Número| Provincia | Municipio| Piso | Código
|-------|------|----------|----------------------|---------|----|----|------|-----|-----|
|123456J|José  |Hernández |joseherndz@gmail.com  |Girasol|45|Santa cruz|Santa Cruz|2|38001
|123456J|José  |Hernández |josehdz123@gmail.com  |Girasol|45|Santa cruz|Santa Cruz|2|38001
|528545K|Sandra|Hernández |sandra23@gmail.com|Girasol|45|Santa cruz|Santa Cruz|2|38001
|126786K|María |García    |maria345gc@gmail.com  |Bermuda|12|Santa cruz|Puerto de la cruz|5|38400

__Profesor__

ID_profesor|Nombre|Apellido|DNI|
|----------|------|--------|---|
|01|Sergio|Delgado|1238584L|
|02|Joatham|Expósito|7854783M|

---

### Segunda Forma Normal

Nosotros nos decidimos a poner estudiante como la entidad principal del proyecto. En base a esto, nos quedamos con las que están directamente relacionadas con la clave principal.

__Alumno__
DNI_Alumno|Nombre|Apellido|
|----------|------|--------|
|123456J|José|Hernández|
|528545K|Sandra|Hernández|
|126786K|María|García|

__Profesores__

ID_profesor|Nombre|Apellido|ID_Curso|Asignatura
|----------|------|--------|--------|-------|
|01|Sergio|Delgado|100|Programación
|02|Joatham|Expósito|101|Base de Datos
---

### Tercera Forma Normal

Como ya explicamos en el documento anterior, la tercera forma normal nos encargaremos de separar las dependencias transitivas de la clave principal.

En primer lugar, separamos email y toda la dirección en tablas separadas para evitar el problema de actualización e inserción.

__Estudiante__
 DNI    |Nombre|Apellido  |Email|Dirección| 
|-------|------|----------|-----|---------|
|123456J|José  |Hernández |333  |10001|
|528545K|Sandra|Hernández |444|10001|
|126786K|María |García    |555  |10002|


__Dirección__
|Id_dirección| Calle |Número| Provincia | Municipio| Piso |Código Postal|
|------------|-------|------|-----------|----------|------|-------------|
|10001| Girasol|45|Santa Cruz|Santa Cruz|2|38001
|10002|Bermuda|12|Santa Cruz|Puerto de la Cruz|5|38400

__Email__
|Id_email|email|
|--------|-----|
|333|joseherndz@gmail.com|
|444|sandra23@gmail.com|
|555|maria345gc@gmail.com|


Posterior a esto, relacionaremos el resto de tablas que falta. En su inmesa mayoría son cardinalidades máximas N:M dando la necesidad de crear tablas intermedias entre unas y otras. Así mismo, como en el proyecto no se nos aportan datos descriptivos dentro de muchas de ellas, nos quedaremos con las id.


__Curso__                        
ID_Curso|Asignatura
|--------|-------|
|100|Programación
|101|Base de Datos


__Profesores__

ID_profesor|Nombre|Apellido|
|----------|------|--------|
|01|Sergio|Delgado
|02|Joatham|Expósito|

Al tener una cardinalidad de N:M es necesario crear una tabla extra para relacionarlas.

__Curso_Profesor__
ID_Curso|ID_Profesor
|--------|-------|
|100|01|
|101|02|

---
Como en la anterior, es necesario la creación de una tabla intermedia al tratarse de una cardinalidad máxima de N:M.
__Curso__                        
ID_Curso|Asignatura
|--------|-------|
|100|Programación
|101|Base de Datos


__Estudiante__
 DNI    |Nombre|Apellido  |Email|Dirección| 
|-------|------|----------|-----|---------|
|123456J|José  |Hernández |333  |10001|
|528545K|Sandra|Hernández |444|10001|
|126786K|María |García    |555  |10002|

__Curso_Estudiante__
ID_Curso|DNI_estudiante|
|--------|-------|
|100|123456J|
|100|528545K|
|100|126786K|
|101|123456J|
|101|528545K|
|101|126786K|

---
__Curso__                        
ID_Curso|Asignatura|Id_programa|
|--------|-------|-------------|
|100|Programación|486|
|101|Base de Datos|487|

__Programa__                     
ID_Programa|
|--------|
|486|
|487|

Aquí hereda la ID de programa, Curso al tratase de una 1:N, la que tiene la cardinalidad N hereda la PK.

---

__Curso__                        
ID_Curso|Asignatura|Id_programa|
|--------|-------|-------------|
|100|Programación|486|
|101|Base de Datos|487|

__Aula__
|Id_aula|Nombre|
|-------|------|
|490| Medusa|
|491| Primaria|

__Curso_Aula__
|Id_aula|Id_curso|
|-------|------|
|490| 100|
|491| 101|

---

__Estudiante__
 DNI    |Nombre|Apellido  |Email|Dirección| 
|-------|------|----------|-----|---------|
|123456J|José  |Hernández |333  |10001|
|528545K|Sandra|Hernández |444|10001|
|126786K|María |García    |555  |10002|

__Libros__
|Id_libros|Género|
|-------|------|
|4000| Acción|
|4001| Fantasía|

__Estudiante_libros__
|DNI_estudiantes|Id_libros|
|-------|------|
|123456J| 4000|
|528545K| 4001|
|126786K| 40001|

---

__Estudiante__
 DNI    |Nombre|Apellido  |Email|Dirección| 
|-------|------|----------|-----|---------|
|123456J|José  |Hernández |333  |10001|
|528545K|Sandra|Hernández |444|10001|
|126786K|María |García    |555  |10002|

__Programa__                     
ID_Programa|
|--------|
|486|
|487|

__Estudiante_Programa__
|DNI_estudiante|Id_programa|
|----------|----------------|
|123456J|486|
|528545K|486|
|126786K|486|
|123456J|487|
|528545K|487|
|126786K|487|

---
__Estudiante__
 DNI    |Nombre|Apellido  |Email|Dirección| 
|-------|------|----------|-----|---------|
|123456J|José  |Hernández |333  |10001|
|528545K|Sandra|Hernández |444|10001|
|126786K|María |García    |555  |10002|


__Profesores__

ID_profesor|Nombre|Apellido|
|----------|------|--------|
|01|Sergio|Delgado
|02|Joatham|Expósito|

__Estudiante_profesor__
|DNI_estudiante|Id_profesor|
|----------|----------------|
|123456J|01|
|528545K|01|
|126786K|01|
|123456J|02|
|528545K|02|
|126786K|02|


---
__Programa__                     
ID_Programa|
|--------|
|486|
|487|

__Departamento__
|Id_departamento| Nombre|
|---------------|-------|
|5000|D_Programación|
|5001|D_BaseDatos|

__Programa_Departamento__
|Id_programa|Id_departamento|
|----------|----------------|
|486|5000|
|487|5001|

---
__Libros__
|Id_libros|Género|
|-------|------|
|4000| Acción|
|4001| Fantasía|

__Biblioteca__

|Id_biblioteca|
|-------|
|6000|
|6001|

__Libros_Biblioteca__
|Id_libros|Id_biblioteca|
|-------|------|
|4000| 6000|
|4001| 6001|

---

__Estudiante__
 DNI    |Nombre|Apellido  |Email|Dirección| 
|-------|------|----------|-----|---------|
|123456J|José  |Hernández |333  |10001|
|528545K|Sandra|Hernández |444|10001|
|126786K|María |García    |555  |10002|

__Becas__
|Id_becas|
|-------|
|7000| 
|7001|

__Estudiantes_Becas__
|DNI_estudiantes|Id_becas|
|-------|------|
|123456J|7000|
|528545K|7000|
|126786K|7000|
|123456J|7001|
|528545K|7001|
|126786K|7001|

---

__Becas__
|Id_becas|
|-------|
|7000| 
|7001|

__Empresas__
|Id_empresas|
|-------|
|8000| 
|8001|

__Becas_Empresas__
|Id_becas|Id_empresas|
|-------|------------|
|7000| 8000|
|7001|8001|

---

__Empresas__
|Id_empresas|
|-------|
|8000| 
|8001|

__Eventos__
|Id_eventos|
|-------|
|9000| 
|9001|

__Empresas_Eventos__
|Id_empresas| Id_eventos|
|-------|---------------|
|8000| 9000|
|8001|9001|

---

__Eventos__
|Id_eventos|
|-------|
|9000| 
|9001|

__Instalaciones__
|Id_instalaciones|
|-------|
|10000| 
|10001|

__Eventos_Instalaciones__
|Id_eventos| Id_instalaciones|
|-------|---------------|
|9000| 10000|
|9001|10001|

---
__Eventos__
|Id_eventos|
|-------|
|9000| 
|9001|

__Patrocionadores__
|Id_patrocinadores|
|-------|
|11000| 
|11001|

__Eventos_Patrocionadores__
|Id_eventos| Id_patrocinadores|
|-------|---------------|
|9000| 11000|
|9001|11001|

---


</div>