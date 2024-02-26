<div align="justify">

# Tarea 13: Consultas


## Consultas de una única tabla
1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
```sql
select apellido1, apellido2, nombre from persona order by apellido1, apellido2, nombre;
┌────────────┬────────────┬───────────┐
│ apellido1  │ apellido2  │  nombre   │
├────────────┼────────────┼───────────┤
│ Domínguez  │ Guerrero   │ Antonio   │
│ Fahey      │ Considine  │ Antonio   │
│ Gea        │ Ruiz       │ Sonia     │
│ Gutiérrez  │ López      │ Juan      │
│ Hamill     │ Kozey      │ Manolo    │
│ Heller     │ Pagac      │ Pedro     │
│ Herman     │ Pacocha    │ Daniel    │
│ Hernández  │ Martínez   │ Irene     │
│ Herzog     │ Tremblay   │ Ramón     │
│ Kohler     │ Schoen     │ Alejandro │
│ Koss       │ Bayer      │ José      │
│ Lakin      │ Yundt      │ Inma      │
│ Lemke      │ Rutherford │ Cristina  │
│ Monahan    │ Murray     │ Micaela   │
│ Ramirez    │ Gea        │ Zoe       │
│ Ruecker    │ Upton      │ Guillermo │
│ Saez       │ Vega       │ Juan      │
│ Schmidt    │ Fisher     │ David     │
│ Schowalter │ Muller     │ Francesca │
│ Spencer    │ Lakin      │ Esther    │
│ Stiedemann │ Morissette │ Alfredo   │
│ Streich    │ Hirthe     │ Carmen    │
│ Strosin    │ Turcotte   │ Ismael    │
│ Sánchez    │ Pérez      │ Salvador  │
└────────────┴────────────┴───────────┘
```

2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
```sql
select nombre, apellido1, apellido2 from persona where telefono is null;
┌───────────┬────────────┬───────────┐
│  nombre   │ apellido1  │ apellido2 │
├───────────┼────────────┼───────────┤
│ Pedro     │ Heller     │ Pagac     │
│ Ismael    │ Strosin    │ Turcotte  │
│ Esther    │ Spencer    │ Lakin     │
│ Carmen    │ Streich    │ Hirthe    │
│ Antonio   │ Fahey      │ Considine │
│ Guillermo │ Ruecker    │ Upton     │
│ Francesca │ Schowalter │ Muller    │
└───────────┴────────────┴───────────┘
```
3. Devuelve el listado de los alumnos que nacieron en 1999.
```sql
select * from persona where fecha_nacimiento regexp  '1999';

┌────┬───────────┬─────────┬───────────┬───────────┬─────────┬─────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre  │ apellido1 │ apellido2 │ ciudad  │    direccion    │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼─────────┼───────────┼───────────┼─────────┼─────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 7  │ 97258166K │ Ismael  │ Strosin   │ Turcotte  │ Almería │ C/ Neptuno      │           │ 1999/05/24       │ H    │ alumno │
│ 22 │ 41491230N │ Antonio │ Domínguez │ Guerrero  │ Almería │ C/ Cabo de Gata │ 626652498 │ 1999/02/11       │ H    │ alumno │
└────┴───────────┴─────────┴───────────┴───────────┴─────────┴─────────────────┴───────────┴──────────────────┴──────┴────────┘

```
4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
```sql
select nif, nombre, apellido1, apellido2, telefono, tipo from persona where telefono is null and nif regexp '[K]$' and tipo = 'profesor';
┌───────────┬───────────┬───────────┬───────────┬──────────┬──────────┐
│    nif    │  nombre   │ apellido1 │ apellido2 │ telefono │   tipo   │
├───────────┼───────────┼───────────┼───────────┼──────────┼──────────┤
│ 10485008K │ Antonio   │ Fahey     │ Considine │          │ profesor │
│ 85869555K │ Guillermo │ Ruecker   │ Upton     │          │ profesor │
└───────────┴───────────┴───────────┴───────────┴──────────┴──────────┘
```
5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
```sql
select nombre, cuatrimestre, id_grado from asignatura where cuatrimestre = '1' and id_grado = '7';
┌───────────────────────────────────────────┬──────────────┬──────────┐
│                  nombre                   │ cuatrimestre │ id_grado │
├───────────────────────────────────────────┼──────────────┼──────────┤
│ Biologia celular                          │ 1            │ 7        │
│ Física                                    │ 1            │ 7        │
│ Matemáticas I                             │ 1            │ 7        │
│ Química general                           │ 1            │ 7        │
│ Química orgánica                          │ 1            │ 7        │
│ Botánica agrícola                         │ 1            │ 7        │
│ Fisiología vegetal                        │ 1            │ 7        │
│ Genética molecular                        │ 1            │ 7        │
│ Ingeniería bioquímica                     │ 1            │ 7        │
│ Termodinámica y cinética química aplicada │ 1            │ 7        │
│ Bases moleculares del desarrollo vegetal  │ 1            │ 7        │
│ Fisiología animal                         │ 1            │ 7        │
│ Metabolismo y biosíntesis de biomoléculas │ 1            │ 7        │
│ Operaciones de separación                 │ 1            │ 7        │
│ Patología molecular de plantas            │ 1            │ 7        │
│ Técnicas instrumentales básicas           │ 1            │ 7        │
└───────────────────────────────────────────┴──────────────┴──────────┘
```
## Consultas multitabla (Join)
1. Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
```sql
select * from persona where sexo = 'M', tipo = 'alumno' join grado on grado.id = asignatura.id_grado join asignatura on 
```
2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
```sql
select * from asignatura join grado on grado.id = asignatura.id_grado where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

┌────┬────────────────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┬────┬─────────────────────────────────────────────┐
│ id │                                 nombre                                 │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │ id │                   nombre                    │
├────┼────────────────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┼────┼─────────────────────────────────────────────┤
│ 1  │ Álgegra lineal y matemática discreta                                   │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 2  │ Cálculo                                                                │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 3  │ Física para informática                                                │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 4  │ Introducción a la programación                                         │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 5  │ Organización y gestión de empresas                                     │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 6  │ Estadística                                                            │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 7  │ Estructura y tecnología de computadores                                │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 8  │ Fundamentos de electrónica                                             │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 9  │ Lógica y algorítmica                                                   │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 10 │ Metodología de la programación                                         │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 11 │ Arquitectura de Computadores                                           │ 6.0      │ básica      │ 2     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 12 │ Estructura de Datos y Algoritmos I                                     │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 13 │ Ingeniería del Software                                                │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 14 │ Sistemas Inteligentes                                                  │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 15 │ Sistemas Operativos                                                    │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 16 │ Bases de Datos                                                         │ 6.0      │ básica      │ 2     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 17 │ Estructura de Datos y Algoritmos II                                    │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 18 │ Fundamentos de Redes de Computadores                                   │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 19 │ Planificación y Gestión de Proyectos Informáticos                      │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 20 │ Programación de Servicios Software                                     │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 21 │ Desarrollo de interfaces de usuario                                    │ 6.0      │ obligatoria │ 3     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 22 │ Ingeniería de Requisitos                                               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 23 │ Integración de las Tecnologías de la Información en las Organizaciones │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 24 │ Modelado y Diseño del Software 1                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 25 │ Multiprocesadores                                                      │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 26 │ Seguridad y cumplimiento normativo                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 27 │ Sistema de Información para las Organizaciones                         │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 28 │ Tecnologías web                                                        │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 29 │ Teoría de códigos y criptografía                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 30 │ Administración de bases de datos                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 31 │ Herramientas y Métodos de Ingeniería del Software                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 32 │ Informática industrial y robótica                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 33 │ Ingeniería de Sistemas de Información                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 34 │ Modelado y Diseño del Software 2                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 35 │ Negocio Electrónico                                                    │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 36 │ Periféricos e interfaces                                               │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 37 │ Sistemas de tiempo real                                                │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 38 │ Tecnologías de acceso a red                                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 39 │ Tratamiento digital de imágenes                                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 40 │ Administración de redes y sistemas operativos                          │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 41 │ Almacenes de Datos                                                     │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 42 │ Fiabilidad y Gestión de Riesgos                                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 43 │ Líneas de Productos Software                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 44 │ Procesos de Ingeniería del Software 1                                  │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 45 │ Tecnologías multimedia                                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 46 │ Análisis y planificación de las TI                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 47 │ Desarrollo Rápido de Aplicaciones                                      │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica                   │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 49 │ Inteligencia del Negocio                                               │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 50 │ Procesos de Ingeniería del Software 2                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 51 │ Seguridad Informática                                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
└────┴────────────────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┴────┴─────────────────────────────────────────────┘




```
3. Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
```sql

```
4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
```sql

```     
5. Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
```sql

```
6. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
```sql

```
## Consultas multitabla (Where)
1. Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
```sql

```
2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql

```
3. Devuelve un listado con los departamentos que no tienen profesores asociados.

4. Devuelve un listado con los profesores que no imparten ninguna asignatura.
```sql

```
5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql

```
6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
```sql

```

## Consultas resúmen (Funciones)
1. Devuelve el número total de alumnas que hay.
```sql

```
2. Calcula cuántos alumnos nacieron en 1999.
```sql

```
3. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
```sql

```
4. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
```sql

```
5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
```sql

```
6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
```sql

```
7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
```sql

```
8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
```sql

```
9. Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
```sql

```
## Subconsultas
1. Devuelve todos los datos del alumno más joven.
```sql

```
2. Devuelve un listado con los profesores que no están asociados a un departamento.
```sql

```
3. Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql

``` 
4. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
```sql

```
5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql

``` 
6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql

```
</div>