-- Selección de libros cuyo título comienza con "H".
select titulo from libro where titulo regexp '^H';

/***
No hay titulo que empiece con H
***/


-- Libros escritos por autores cuyos nombres terminan con "ing".
select libro.titulo, autor.nombre as nombre_autor
from libro join autor on libro.autor_id = autor.id_autor
where autor.nombre regexp 'ing$';



-- Libros con títulos que contienen la palabra "and" en cualquier posición.
 select titulo from libro where titulo regexp 'and'; 
 /**
┌──────────────────────────────────┐
│              titulo              │
├──────────────────────────────────┤
│ The Old Man and the Sea          │
│ Alice's Adventures in Wonderland │
│ War and Peace                    │
│ Crime and Punishment             │
└──────────────────────────────────┘
 **/


-- Libros cuyo título comienza con una vocal.
select titulo from libro where titulo regexp '^[aeiouAEIOU]';

/**
┌──────────────────────────────────┐
│              titulo              │
├──────────────────────────────────┤
│ One Hundred Years of Solitude    │
│ Alice's Adventures in Wonderland │
│ Anna Karenina                    │
└──────────────────────────────────┘
**/

-- Libros cuyo autor tiene al menos una vocal repetida.

SELECT libro.titulo, autor.nombre AS nombre_autor
FROM libro, autor
WHERE libro.autor_id = autor.id_autor
      AND autor.nombre REGEXP '([aeiouAEIOU]).*\\1';




-- Libros con precios que tienen dos dígitos decimales exactos.

SELECT titulo, precio
FROM libro
WHERE precio REGEXP '\\.[0-9]{2}$';




-- Libros cuyos títulos tienen al menos tres palabras.

SELECT titulo
FROM libro
WHERE titulo REGEXP '\\b\\w+\\b(\\s\\b\\w+\\b){2,}';


-- Obtener todos los autores cuyo nombre empieza con la letra "A":
select nombre from autor where nombre regexp '^A';

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Agatha Christie │
└─────────────────┘
**/


-- Seleccionar los libros cuyo título contiene la palabra "SQL":
select titulo from libro where titulo regexp 'SQL';

/**
No hay titulo que contiene 'SQL'
**/



-- Obtener todos los autores cuyo nombre termina con "ez":
select nombre from autor where nombre regexp 'ez$';
/**
No hay nombre que finalice con 'ez'
**/


-- Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:
select nombre from autor where nombre regexp '.....';
/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ J.K. Rowling    │
│ Stephen King    │
│ George Orwell   │
│ Jane Austen     │
│ Agatha Christie │
└─────────────────┘
**/

-- Seleccionar los libros cuya editorial es diferente de "EditorialX":
select editorial from libro where editorial not regexp 'EditorialX';
/**
┌─────────────────────────────────────────────┐
│                  editorial                  │
├─────────────────────────────────────────────┤
│ Charles Scribner's Sons                     │
│ J.B. Lippincott & Co.                       │
│ Little, Brown and Company                   │
│ Harper & Row                                │
│ Chatto & Windus                             │
│ George Allen & Unwin                        │
│ George Allen & Unwin                        │
│ Geoffrey Bles                               │
│ Homer                                       │
│ Homer                                       │
│ Harper & Brothers                           │
│ Alfred A. Knopf                             │
│ The Viking Press                            │
│ Emily Brontë                                │
│ Charles Scribner's Sons                     │
│ Pétion                                      │
│ Ward, Lock, and Company                     │
│ George Newnes                               │
│ Lackington, Hughes, Harding, Mavor, & Jones │
│ Macmillan                                   │
│ Niccolò Machiavelli                         │
│ Francisco de Robles                         │
│ Dante Alighieri                             │
│ The Russian Messenger                       │
│ A. Lacroix, Verboeckhoven & Cie.            │
│ Macmillan Publishers                        │
│ Methuen & Co.                               │
│ The Russian Messenger                       │
│ The Russian Messenger                       │
└─────────────────────────────────────────────┘
**/







-- Obtener todos los autores cuyo nombre contiene al menos una vocal:
select nombre from autor where nombre regexp '[aeiouAEIOU]';
/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ J.K. Rowling    │
│ Stephen King    │
│ George Orwell   │
│ Jane Austen     │
│ Agatha Christie │
└─────────────────┘
**/



-- Seleccionar los libros cuyo título comienza con una letra mayúscula:
select titulo from libro where titulo regexp '^[A-Z]'
/**
┌───────────────────────────────────┐
│              titulo               │
├───────────────────────────────────┤
│ The Great Gatsby                  │
│ To Kill a Mockingbird             │
│ The Catcher in the Rye            │
│ One Hundred Years of Solitude     │
│ Brave New World                   │
│ The Hobbit                        │
│ The Lord of the Rings             │
│ The Chronicles of Narnia          │
│ The Odyssey                       │
│ The Iliad                         │
│ Moby-Dick                         │
│ The Road                          │
│ The Grapes of Wrath               │
│ Wuthering Heights                 │
│ The Old Man and the Sea           │
│ The Count of Monte Cristo         │
│ The Picture of Dorian Gray        │
│ The Adventures of Sherlock Holmes │
│ Frankenstein                      │
│ Alice's Adventures in Wonderland  │
│ The Prince                        │
│ Don Quixote                       │
│ The Divine Comedy                 │
│ Anna Karenina                     │
│ Les Misérables                    │
│ The Jungle Book                   │
│ The Wind in the Willows           │
│ War and Peace                     │
│ Crime and Punishment              │
└───────────────────────────────────┘
**/


-- Obtener todos los autores cuyo nombre no contiene la letra "r":
select nombre from autor where nombre not regexp 'r';
/**
┌──────────────┐
│    nombre    │
├──────────────┤
│ J.K. Rowling │
│ Stephen King │
│ Jane Austen  │
└──────────────┘
**/








-- Seleccionar los libros cuya editorial empieza con la letra "P":
select editorial from libro where editorial regexp '^P';
/**
┌───────────┐
│ editorial │
├───────────┤
│ Pétion    │
└───────────┘
**/


-- Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:
 select nombre from autor where nombre regexp '......';
/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ J.K. Rowling    │
│ Stephen King    │
│ George Orwell   │
│ Jane Austen     │
│ Agatha Christie │
└─────────────────┘
**/


-- Seleccionar los libros cuyo título contiene al menos un número:
 select titulo from libro where titulo regexp ' \d';
/**
los titulos no tienen numero
**/


-- Obtener todos los autores cuyo nombre inicia con una vocal:
select nombre from autor where nombre regexp '^[AEIOU]';

/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Agatha Christie │
└─────────────────┘
**/


-- Obtener todos los autores cuyo nombre no contiene espacios en blanco:

select nombre
from autor
where nombre not regexp ' ';




-- Seleccionar los libros cuyo título termina con una vocal:
select titulo from libro where titulo regexp '[aeiouAEIOU]$';
/**
┌───────────────────────────────┐
│            titulo             │
├───────────────────────────────┤
│ The Catcher in the Rye        │
│ One Hundred Years of Solitude │
│ The Chronicles of Narnia      │
│ The Old Man and the Sea       │
│ The Count of Monte Cristo     │
│ The Prince                    │
│ Don Quixote                   │
│ Anna Karenina                 │
│ War and Peace                 │
└───────────────────────────────┘
**/



-- Obtener todos los autores cuyo nombre contiene la secuencia "er":
select nombre from autor where nombre regexp 'er';
/**
Ningún autor contine la sequencia 'er'
**/


-- Seleccionar los libros cuyo título empieza con la palabra "The":
 select titulo from libro where titulo regexp '^[The]';
/**
┌───────────────────────────────────┐
│              titulo               │
├───────────────────────────────────┤
│ The Great Gatsby                  │
│ To Kill a Mockingbird             │
│ The Catcher in the Rye            │
│ The Hobbit                        │
│ The Lord of the Rings             │
│ The Chronicles of Narnia          │
│ The Odyssey                       │
│ The Iliad                         │
│ The Road                          │
│ The Grapes of Wrath               │
│ The Old Man and the Sea           │
│ The Count of Monte Cristo         │
│ The Picture of Dorian Gray        │
│ The Adventures of Sherlock Holmes │
│ The Prince                        │
│ The Divine Comedy                 │
│ The Jungle Book                   │
│ The Wind in the Willows           │
└───────────────────────────────────┘
**/


-- Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:
select nombre from autor where nombre regexp '[A-Z]{1,}';
/**
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ J.K. Rowling    │
│ Stephen King    │
│ George Orwell   │
│ Jane Austen     │
│ Agatha Christie │
└─────────────────┘
**/

-- Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:
SELECT titulo, precio
FROM libro
WHERE precio REGEXP '^[0-9]+\\.[0-9]{2}$';





-- Obtener todos los autores cuyo nombre no contiene números:
select nombre from autor where nombre regexp not '\D';

/**
Ningún nombe de los autores contiene un número
**/

-- Seleccionar los libros cuyo título contiene al menos tres vocales:

SELECT titulo
FROM libro
WHERE titulo REGEXP '[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU]';




-- Obtener todos los autores cuyo nombre inicia con una consonante:

SELECT nombre
FROM autor
WHERE nombre REGEXP '^[^aeiouAEIOU]';





-- Seleccionar los libros cuyo título no contiene la palabra "Science":
 select titulo from libro where titulo regexp not 'Science';

/**
Ningún titulo contiene la palabra "Science"
**/



-- Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:


SELECT nombre
FROM autor
WHERE nombre REGEXP '(\\w)\\1';




-- Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":
select nombre from autor where nombre regexp '^M' or 'n$';

/**
Ningún autor  empieza con "M" o termina con "n"
**/




-- Obtener todos los autores cuyo nombre no contiene caracteres especiales:

SELECT nombre
FROM autor
WHERE nombre REGEXP '^[a-zA-Z0-9 ]+$';


