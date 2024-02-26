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
-- Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
select p.* from persona as p 
JOIN alumno_se_matricula_asignatura as asma ON p.id=asma.id_alumno
JOIN asignatura as asig ON asma.id_asignatura=asig.id
JOIN grado as g ON asig.id_grado=g.id
where p.sexo='M' and g.nombre='Grado en Ingeniería Informática (Plan 2015)' group by p.id;
/**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
**/
-- Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
select a.* from asignatura as a JOIN grado as g ON a.id_grado=g.id where g.nombre='Grado en Ingeniería Informática (Plan 2015)';
/**
┌────┬──────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                            nombre                            │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 1  │ Álgegra lineal y matemática discreta                         │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 2  │ Cálculo                                                      │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 3  │ Física para informática                                      │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 4  │ Introducción a la programación                               │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 5  │ Organización y gestión de empresas                           │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 6  │ Estadística                                                  │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 7  │ Estructura y tecnología de computadores                      │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 8  │ Fundamentos de electrónica                                   │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 9  │ Lógica y algorítmica                                         │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 10 │ Metodología de la programación                               │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 11 │ Arquitectura de Computadores                                 │ 6.0      │ básica      │ 2     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 12 │ Estructura de Datos y Algoritmos I                           │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 13 │ Ingeniería del Software                                      │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 14 │ Sistemas Inteligentes                                        │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 15 │ Sistemas Operativos                                          │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 16 │ Bases de Datos                                               │ 6.0      │ básica      │ 2     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 17 │ Estructura de Datos y Algoritmos II                          │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 18 │ Fundamentos de Redes de Computadores                         │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 19 │ Planificación y Gestión de Proyectos Informáticos            │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 20 │ Programación de Servicios Software                           │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 21 │ Desarrollo de interfaces de usuario                          │ 6.0      │ obligatoria │ 3     │ 1            │ 14          │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 23 │ Integración de las Tecnologías de la Información en las Orga │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│    │ nizaciones                                                   │          │             │       │              │             │          │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 24 │ Modelado y Diseño del Software 1                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 25 │ Multiprocesadores                                            │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 26 │ Seguridad y cumplimiento normativo                           │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 27 │ Sistema de Información para las Organizaciones               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 28 │ Tecnologías web                                              │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 29 │ Teoría de códigos y criptografía                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 30 │ Administración de bases de datos                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 31 │ Herramientas y Métodos de Ingeniería del Software            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 32 │ Informática industrial y robótica                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 33 │ Ingeniería de Sistemas de Información                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 34 │ Modelado y Diseño del Software 2                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 35 │ Negocio Electrónico                                          │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 36 │ Periféricos e interfaces                                     │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 37 │ Sistemas de tiempo real                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 38 │ Tecnologías de acceso a red                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 39 │ Tratamiento digital de imágenes                              │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 40 │ Administración de redes y sistemas operativos                │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 41 │ Almacenes de Datos                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 42 │ Fiabilidad y Gestión de Riesgos                              │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 43 │ Líneas de Productos Software                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 44 │ Procesos de Ingeniería del Software 1                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 45 │ Tecnologías multimedia                                       │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 46 │ Análisis y planificación de las TI                           │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 47 │ Desarrollo Rápido de Aplicaciones                            │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica         │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 49 │ Inteligencia del Negocio                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 50 │ Procesos de Ingeniería del Software 2                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 51 │ Seguridad Informática                                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
└────┴──────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
**/
-- Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona as p JOIN profesor as prof ON p.id=prof.id_profesor
JOIN departamento as d ON prof.id_departamento=d.id order by p.apellido1, p.apellido2, p.nombre;
/**
┌────────────┬────────────┬───────────┬────────────────────┐
│ apellido1  │ apellido2  │  nombre   │       nombre       │
├────────────┼────────────┼───────────┼────────────────────┤
│ Fahey      │ Considine  │ Antonio   │ Economía y Empresa │
│ Hamill     │ Kozey      │ Manolo    │ Informática        │
│ Kohler     │ Schoen     │ Alejandro │ Matemáticas        │
│ Lemke      │ Rutherford │ Cristina  │ Economía y Empresa │
│ Monahan    │ Murray     │ Micaela   │ Agronomía          │
│ Ramirez    │ Gea        │ Zoe       │ Informática        │
│ Ruecker    │ Upton      │ Guillermo │ Educación          │
│ Schmidt    │ Fisher     │ David     │ Matemáticas        │
│ Schowalter │ Muller     │ Francesca │ Química y Física   │
│ Spencer    │ Lakin      │ Esther    │ Educación          │
│ Stiedemann │ Morissette │ Alfredo   │ Química y Física   │
│ Streich    │ Hirthe     │ Carmen    │ Educación          │
└────────────┴────────────┴───────────┴────────────────────┘
**/
-- Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
select a.nombre, c.anyo_inicio, c.anyo_fin from persona as p 
JOIN alumno_se_matricula_asignatura as asma ON p.id=asma.id_alumno
JOIN curso_escolar as c ON c.id=asma.id_curso_escolar
JOIN asignatura as a ON a.id=asma.id_curso_escolar
where p.nif='26902806M';
/**
┌──────────────────────────────────────┬─────────────┬──────────┐
│                nombre                │ anyo_inicio │ anyo_fin │
├──────────────────────────────────────┼─────────────┼──────────┤
│ Álgegra lineal y matemática discreta │ 2014        │ 2015     │
│ Álgegra lineal y matemática discreta │ 2014        │ 2015     │
│ Álgegra lineal y matemática discreta │ 2014        │ 2015     │
└──────────────────────────────────────┴─────────────┴──────────┘
**/
-- Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
select d.nombre from departamento as d 
JOIN profesor as p ON d.id=p.id_departamento
JOIN asignatura as a ON p.id_profesor=a.id_profesor
JOIN grado as g ON g.id=a.id_grado
where g.nombre='Grado en Ingeniería Informática (Plan 2015)' group by d.id;
/**
┌─────────────┐
│   nombre    │
├─────────────┤
│ Informática │
└─────────────┘
**/
-- Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
select p.* from persona as p 
JOIN alumno_se_matricula_asignatura as asma ON p.id=asma.id_alumno
JOIN curso_escolar as c ON c.id=asma.id_curso_escolar
JOIN asignatura as a ON asma.id_asignatura=a.id
where c.anyo_inicio=2018 and c.anyo_fin=2019 group by p.id;
/**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
**/


--Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
select d.nombre as "nombre departamento", p.nombre, p.apellido1, p.apellido2 from persona as p, profesor as prof, departamento as d where p.id=prof.id_profesor and prof.id_departamento is NULL;
/**
Todos los profesores tienen departamento
**/

--Devuelve un listado con los profesores que no están asociados a un departamento.
select p.* from persona as p, profesor as prof, departamento as d where p.id=prof.id_profesor and prof.id_departamento is NULL;
/**
Todos los profesores tienen departamento
**/
--Devuelve un listado con los departamentos que no tienen profesores asociados.
select d.* from departamento as d where d.id NOT IN (select DISTINCT(id_departamento) from profesor);
/**
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
**/
--Devuelve un listado con los profesores que no imparten ninguna asignatura.
select p.* from persona as p, profesor as prof, asignatura as a where p.id=prof.id_profesor and prof.id_profesor NOT IN (select DISTINCT(id_profesor) from asignatura where id_profesor is NOT NULL) group by p.id;
/**
┌────┬───────────┬───────────┬────────────┬────────────┬─────────┬───────────────────────────┬───────────┬──────────────────┬──────┬──────────┐
│ id │    nif    │  nombre   │ apellido1  │ apellido2  │ ciudad  │         direccion         │ telefono  │ fecha_nacimiento │ sexo │   tipo   │
├────┼───────────┼───────────┼────────────┼────────────┼─────────┼───────────────────────────┼───────────┼──────────────────┼──────┼──────────┤
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
└────┴───────────┴───────────┴────────────┴────────────┴─────────┴───────────────────────────┴───────────┴──────────────────┴──────┴──────────┘
**/
--Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select a.* from asignatura as a where a.id_profesor is NULL;
/**
┌────┬──────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                            nombre                            │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 23 │ Integración de las Tecnologías de la Información en las Orga │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│    │ nizaciones                                                   │          │             │       │              │             │          │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 24 │ Modelado y Diseño del Software 1                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 25 │ Multiprocesadores                                            │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 26 │ Seguridad y cumplimiento normativo                           │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 27 │ Sistema de Información para las Organizaciones               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 28 │ Tecnologías web                                              │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 29 │ Teoría de códigos y criptografía                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 30 │ Administración de bases de datos                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 31 │ Herramientas y Métodos de Ingeniería del Software            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 32 │ Informática industrial y robótica                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 33 │ Ingeniería de Sistemas de Información                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 34 │ Modelado y Diseño del Software 2                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 35 │ Negocio Electrónico                                          │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 36 │ Periféricos e interfaces                                     │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 37 │ Sistemas de tiempo real                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 38 │ Tecnologías de acceso a red                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 39 │ Tratamiento digital de imágenes                              │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 40 │ Administración de redes y sistemas operativos                │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 41 │ Almacenes de Datos                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 42 │ Fiabilidad y Gestión de Riesgos                              │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 43 │ Líneas de Productos Software                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 44 │ Procesos de Ingeniería del Software 1                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 45 │ Tecnologías multimedia                                       │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 46 │ Análisis y planificación de las TI                           │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 47 │ Desarrollo Rápido de Aplicaciones                            │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica         │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 49 │ Inteligencia del Negocio                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 50 │ Procesos de Ingeniería del Software 2                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 51 │ Seguridad Informática                                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 52 │ Biologia celular                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 53 │ Física                                                       │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 54 │ Matemáticas I                                                │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 55 │ Química general                                              │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 56 │ Química orgánica                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 57 │ Biología vegetal y animal                                    │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 58 │ Bioquímica                                                   │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 59 │ Genética                                                     │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 60 │ Matemáticas II                                               │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 61 │ Microbiología                                                │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 62 │ Botánica agrícola                                            │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 63 │ Fisiología vegetal                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 64 │ Genética molecular                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 65 │ Ingeniería bioquímica                                        │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 66 │ Termodinámica y cinética química aplicada                    │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 67 │ Biorreactores                                                │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 68 │ Biotecnología microbiana                                     │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 69 │ Ingeniería genética                                          │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 70 │ Inmunología                                                  │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 71 │ Virología                                                    │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal                     │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 73 │ Fisiología animal                                            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 74 │ Metabolismo y biosíntesis de biomoléculas                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 75 │ Operaciones de separación                                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 76 │ Patología molecular de plantas                               │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 77 │ Técnicas instrumentales básicas                              │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 78 │ Bioinformática                                               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 79 │ Biotecnología de los productos hortofrutículas               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 80 │ Biotecnología vegetal                                        │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 81 │ Genómica y proteómica                                        │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 82 │ Procesos biotecnológicos                                     │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 83 │ Técnicas instrumentales avanzadas                            │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
└────┴──────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
**/

--Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
select d.nombre as "Nombre departamento", a.nombre from departamento as d, profesor as p, asignatura as a
where d.id=p.id_departamento and p.id_profesor=a.id_profesor and a.id NOT IN (select id_asignatura from alumno_se_matricula_asignatura);
/**
┌─────────────────────┬───────────────────────────────────────────────────┐
│ Nombre departamento │                      nombre                       │
├─────────────────────┼───────────────────────────────────────────────────┤
│ Informática         │ Arquitectura de Computadores                      │
│ Informática         │ Estructura de Datos y Algoritmos I                │
│ Informática         │ Ingeniería del Software                           │
│ Informática         │ Sistemas Inteligentes                             │
│ Informática         │ Sistemas Operativos                               │
│ Informática         │ Bases de Datos                                    │
│ Informática         │ Estructura de Datos y Algoritmos II               │
│ Informática         │ Fundamentos de Redes de Computadores              │
│ Informática         │ Planificación y Gestión de Proyectos Informáticos │
│ Informática         │ Programación de Servicios Software                │
│ Informática         │ Desarrollo de interfaces de usuario               │
└─────────────────────┴───────────────────────────────────────────────────┘
**/

-- Devuelve el número total de alumnas que hay.
select COUNT(*) as "Total alumnas" from persona where tipo='alumno' and sexo='M';
/**
┌───────────────┐
│ Total alumnas │
├───────────────┤
│ 3             │
└───────────────┘
**/
-- Calcula cuántos alumnos nacieron en 1999.
select COUNT(*) as "nacidos en 1999" from persona where tipo='alumno' and fecha_nacimiento regexp '1999/';
/**
┌─────────────────┐
│ nacidos en 1999 │
├─────────────────┤
│ 2               │
└─────────────────┘
**/
 
-- Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
select d.nombre, COUNT(p.id_profesor) as "Numero profesores" from departamento as d INNER JOIN profesor as p ON d.id=p.id_departamento group by d.id order by COUNT(p.id_profesor) DESC;
/**
┌────────────────────┬───────────────────┐
│       nombre       │ Numero profesores │
├────────────────────┼───────────────────┤
│ Educación          │ 3                 │
│ Química y Física   │ 2                 │
│ Economía y Empresa │ 2                 │
│ Matemáticas        │ 2                 │
│ Informática        │ 2                 │
│ Agronomía          │ 1                 │
└────────────────────┴───────────────────┘
**/
-- Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
select d.nombre, COUNT(p.id_profesor) as "Numero profesores" from departamento as d LEFT JOIN profesor as p ON d.id=p.id_departamento group by d.id order by COUNT(p.id_profesor) DESC;
/**
┌─────────────────────┬───────────────────┐
│       nombre        │ Numero profesores │
├─────────────────────┼───────────────────┤
│ Educación           │ 3                 │
│ Informática         │ 2                 │
│ Matemáticas         │ 2                 │
│ Economía y Empresa  │ 2                 │
│ Química y Física    │ 2                 │
│ Agronomía           │ 1                 │
│ Filología           │ 0                 │
│ Derecho             │ 0                 │
│ Biología y Geología │ 0                 │
└─────────────────────┴───────────────────┘
**/
-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
select g.nombre, COUNT(a.id) as "Numero asignatura" from grado as g LEFT JOIN asignatura as a ON g.id=a.id_grado group by g.id order by COUNT(a.id) DESC;
/**
┌────────────────────────────────────────────────────────┬───────────────────┐
│                         nombre                         │ Numero asignatura │
├────────────────────────────────────────────────────────┼───────────────────┤
│ Grado en Ingeniería Informática (Plan 2015)            │ 51                │
│ Grado en Biotecnología (Plan 2015)                     │ 32                │
│ Grado en Ingeniería Agrícola (Plan 2015)               │ 0                 │
│ Grado en Ingeniería Eléctrica (Plan 2014)              │ 0                 │
│ Grado en Ingeniería Electrónica Industrial (Plan 2010) │ 0                 │
│ Grado en Ingeniería Mecánica (Plan 2010)               │ 0                 │
│ Grado en Ingeniería Química Industrial (Plan 2010)     │ 0                 │
│ Grado en Ciencias Ambientales (Plan 2009)              │ 0                 │
│ Grado en Matemáticas (Plan 2010)                       │ 0                 │
│ Grado en Química (Plan 2009)                           │ 0                 │
└────────────────────────────────────────────────────────┴───────────────────┘
**/
-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
select g.nombre, COUNT(a.id) as "Numero asignatura" from grado as g INNER JOIN asignatura as a ON g.id=a.id_grado group by g.id HAVING COUNT(a.id) > 40 order by COUNT(a.id) DESC;
/**
┌─────────────────────────────────────────────┬───────────────────┐
│                   nombre                    │ Numero asignatura │
├─────────────────────────────────────────────┼───────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 51                │
└─────────────────────────────────────────────┴───────────────────┘
**/
-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
select g.nombre, a.tipo, SUM(a.creditos) as "Total creditos" from grado as g INNER JOIN asignatura as a ON g.id=a.id_grado group by g.id, a.tipo order by SUM(a.creditos) DESC;
/**
┌─────────────────────────────────────────────┬─────────────┬────────────────┐
│                   nombre                    │    tipo     │ Total creditos │
├─────────────────────────────────────────────┼─────────────┼────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ optativa    │ 180.0          │
│ Grado en Biotecnología (Plan 2015)          │ obligatoria │ 120.0          │
│ Grado en Ingeniería Informática (Plan 2015) │ básica      │ 72.0           │
│ Grado en Biotecnología (Plan 2015)          │ básica      │ 60.0           │
│ Grado en Ingeniería Informática (Plan 2015) │ obligatoria │ 54.0           │
└─────────────────────────────────────────────┴─────────────┴────────────────┘
**/
-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
select c.anyo_inicio, COUNT(asma.id_alumno) as "Numero alumnos" from alumno_se_matricula_asignatura as asma INNER JOIN curso_escolar as c ON asma.id_curso_escolar=c.id group by c.id;
/**
┌─────────────┬────────────────┐
│ anyo_inicio │ Numero alumnos │
├─────────────┼────────────────┤
│ 2014        │ 9              │
│ 2018        │ 30             │
└─────────────┴────────────────┘
**/
-- Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
select p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) as "Numero asignaturas" from persona as p INNER JOIN profesor as prof ON p.id=prof.id_profesor
LEFT JOIN asignatura as a ON prof.id_profesor=a.id_profesor group by prof.id_profesor order by "Numero asignaturas" DESC;
/**
┌────┬───────────┬────────────┬────────────┬────────────────────┐
│ id │  nombre   │ apellido1  │ apellido2  │ Numero asignaturas │
├────┼───────────┼────────────┼────────────┼────────────────────┤
│ 14 │ Manolo    │ Hamill     │ Kozey      │ 11                 │
│ 3  │ Zoe       │ Ramirez    │ Gea        │ 10                 │
│ 5  │ David     │ Schmidt    │ Fisher     │ 0                  │
│ 8  │ Cristina  │ Lemke      │ Rutherford │ 0                  │
│ 10 │ Esther    │ Spencer    │ Lakin      │ 0                  │
│ 12 │ Carmen    │ Streich    │ Hirthe     │ 0                  │
│ 13 │ Alfredo   │ Stiedemann │ Morissette │ 0                  │
│ 15 │ Alejandro │ Kohler     │ Schoen     │ 0                  │
│ 16 │ Antonio   │ Fahey      │ Considine  │ 0                  │
│ 17 │ Guillermo │ Ruecker    │ Upton      │ 0                  │
│ 18 │ Micaela   │ Monahan    │ Murray     │ 0                  │
│ 20 │ Francesca │ Schowalter │ Muller     │ 0                  │
└────┴───────────┴────────────┴────────────┴────────────────────┘
**/

-- Devuelve todos los datos del alumno más joven.
select * from persona where fecha_nacimiento=(select MAX(fecha_nacimiento) from persona where tipo='alumno');
/**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬───────────────────┬──────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion     │ telefono │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼───────────────────┼──────────┼──────────────────┼──────┼────────┤
│ 4  │ 17105885A │ Pedro  │ Heller    │ Pagac     │ Almería │ C/ Estrella fugaz │          │ 2000/10/05       │ H    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴───────────────────┴──────────┴──────────────────┴──────┴────────┘
**/
-- Devuelve un listado con los profesores que no están asociados a un departamento.
select p.* from persona as p INNER JOIN profesor as prof ON p.id=prof.id_profesor where prof.id_departamento NOT IN (select id from departamento);
/**
Todos los profesores tienen departamento
**/
-- Devuelve un listado con los departamentos que no tienen profesores asociados.
select * from departamento where id NOT IN (select id_departamento from profesor);
/**
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
**/

-- Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura
select p.* from persona as p INNER JOIN profesor as prof ON p.id=prof.id_profesor
where prof.id_departamento IN (select id_departamento from departamento) and prof.id_profesor NOT IN (select DISTINCT(id_profesor) from asignatura where id_profesor NOT NULL);
/**
┌────┬───────────┬───────────┬────────────┬────────────┬─────────┬───────────────────────────┬───────────┬──────────────────┬──────┬──────────┐
│ id │    nif    │  nombre   │ apellido1  │ apellido2  │ ciudad  │         direccion         │ telefono  │ fecha_nacimiento │ sexo │   tipo   │
├────┼───────────┼───────────┼────────────┼────────────┼─────────┼───────────────────────────┼───────────┼──────────────────┼──────┼──────────┤
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
└────┴───────────┴───────────┴────────────┴────────────┴─────────┴───────────────────────────┴───────────┴──────────────────┴──────┴──────────┘
**/

-- Devuelve un listado con las asignaturas que no tienen un profesor asignado.
select * from asignatura where id_profesor NOT IN (select id_profesor from profesor) or id_profesor is NULL;
/**
┌────┬──────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                            nombre                            │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 23 │ Integración de las Tecnologías de la Información en las Orga │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│    │ nizaciones                                                   │          │             │       │              │             │          │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 24 │ Modelado y Diseño del Software 1                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 25 │ Multiprocesadores                                            │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 26 │ Seguridad y cumplimiento normativo                           │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 27 │ Sistema de Información para las Organizaciones               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 28 │ Tecnologías web                                              │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 29 │ Teoría de códigos y criptografía                             │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 30 │ Administración de bases de datos                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 31 │ Herramientas y Métodos de Ingeniería del Software            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 32 │ Informática industrial y robótica                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 33 │ Ingeniería de Sistemas de Información                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 34 │ Modelado y Diseño del Software 2                             │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 35 │ Negocio Electrónico                                          │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 36 │ Periféricos e interfaces                                     │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 37 │ Sistemas de tiempo real                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 38 │ Tecnologías de acceso a red                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 39 │ Tratamiento digital de imágenes                              │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 40 │ Administración de redes y sistemas operativos                │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 41 │ Almacenes de Datos                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 42 │ Fiabilidad y Gestión de Riesgos                              │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 43 │ Líneas de Productos Software                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 44 │ Procesos de Ingeniería del Software 1                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 45 │ Tecnologías multimedia                                       │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 46 │ Análisis y planificación de las TI                           │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 47 │ Desarrollo Rápido de Aplicaciones                            │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica         │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 49 │ Inteligencia del Negocio                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 50 │ Procesos de Ingeniería del Software 2                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 51 │ Seguridad Informática                                        │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 52 │ Biologia celular                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 53 │ Física                                                       │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 54 │ Matemáticas I                                                │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 55 │ Química general                                              │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 56 │ Química orgánica                                             │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 57 │ Biología vegetal y animal                                    │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 58 │ Bioquímica                                                   │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 59 │ Genética                                                     │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 60 │ Matemáticas II                                               │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 61 │ Microbiología                                                │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 62 │ Botánica agrícola                                            │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 63 │ Fisiología vegetal                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 64 │ Genética molecular                                           │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 65 │ Ingeniería bioquímica                                        │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 66 │ Termodinámica y cinética química aplicada                    │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 67 │ Biorreactores                                                │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 68 │ Biotecnología microbiana                                     │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 69 │ Ingeniería genética                                          │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 70 │ Inmunología                                                  │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 71 │ Virología                                                    │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal                     │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 73 │ Fisiología animal                                            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 74 │ Metabolismo y biosíntesis de biomoléculas                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 75 │ Operaciones de separación                                    │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 76 │ Patología molecular de plantas                               │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 77 │ Técnicas instrumentales básicas                              │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 78 │ Bioinformática                                               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 79 │ Biotecnología de los productos hortofrutículas               │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 80 │ Biotecnología vegetal                                        │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 81 │ Genómica y proteómica                                        │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 82 │ Procesos biotecnológicos                                     │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 83 │ Técnicas instrumentales avanzadas                            │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
└────┴──────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
**/
-- Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.*
FROM departamento AS d
WHERE d.id NOT IN (
    SELECT id_departamento
    FROM profesor AS p
    INNER JOIN asignatura AS a ON p.id_profesor = a.id_profesor
);
/**
┌────┬─────────────────────┐
│ id │       nombre        │
├────┼─────────────────────┤
│ 2  │ Matemáticas         │
│ 3  │ Economía y Empresa  │
│ 4  │ Educación           │
│ 5  │ Agronomía           │
│ 6  │ Química y Física    │
│ 7  │ Filología           │
│ 8  │ Derecho             │
│ 9  │ Biología y Geología │
└────┴─────────────────────┘
**/





</div>