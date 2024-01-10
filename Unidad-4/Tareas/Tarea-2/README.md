# Tarea-2 sobre sqlite


```sql
create table propietarios ( id integer not null primary key autoincrement, nombre text not null, apellido text not null, dni text unicode );

create table vehiculos ( id integer not null primary key autoincrement, marca text not null, modelo text not null, anio integer not null, id_propietario integer  references propietarios(id_propietario));

```