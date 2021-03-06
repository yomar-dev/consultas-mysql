# Consultas Básicas SQL (MySQL)

### Crear Base de Datos:

`
CREATE DATABASE libreria;
`

### Seleccionar la BD con la que queremos trabajar, en este caso *libreria*:

`
USE libreria;
`

### Crear Tablas:

~~~
CREATE TABLE books (
	book_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	publisher_id INTEGER UNSIGNED NOT NULL,
	title VARCHAR(60) NOT NULL,
	author VARCHAR(100) NOT NULL,
	description TEXT,
	price DECIMAL(5,2),
	copies INT NOT NULL DEFAULT 0
);


CREATE TABLE publishers (
	publisher_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	country VARCHAR(20)
);


CREATE TABLE users (
	user_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE actions (
	action_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	book_id INTEGER UNSIGNED NOT NULL,
	user_id INTEGER UNSIGNED NOT NULL,
	action_type ENUM('venta', 'prestamo', 'devolucion') NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
~~~

### INSERT INTO users:

~~~
INSERT INTO users(name, email) VALUES
    ('Ricardo', 'ricardo@hola.com'),
    ('Laura', 'laura@hola.com'),
    ('Jose', 'jose@hola.com'),
    ('Sofia', 'sofia@hola.com'),
    ('Fernanda', 'fernanda@hola.com'),
    ('Jose Guillermo', 'memo@hola.com'),
    ('Maria', 'maria@hola.com'),
    ('Susana', 'susana@hola.com'),
    ('Jorge', 'jorge@hola.com');
~~~

### INSERT INTO publishers:

~~~
INSERT INTO publishers(publisher_id, name, country) VALUES
    (1, 'OReilly', 'USA'),
    (2, 'Santillana', 'Mexico'),
    (3, 'MIT Edu', 'USA'),
    (4, 'UTPC', 'Colombia'),
    (5, 'Grupo Anaya', 'España');
~~~

### INSERT INTO books:

~~~
INSERT INTO books(publisher_id, title, author, description, price, copies) VALUES
    (1, 'Mastering MySQL', 'John Goodman', 'Clases de bases de datos usando MySQL', 10.50, 4),
    (2, 'Trigonometria avanzada', 'Pi Tagoras', 'Trigonometria desde sus origenes', 7.30, 2),
    (3, 'Advanced Statistics', 'Carl Gauss', 'De curvas y otras graficas', 23.60, 1),
    (4, 'Redes Avanzadas', 'Tim Bernes-Lee', 'Lo que viene siendo el Internet', 13.50, 4),
    (2, 'Curvas Parabolicas', 'Napoleon TNT', 'Historia de la parabola', 6.99, 10),
    (1, 'Ruby On (the) Road', 'A Miner', 'Un nuevo acercamiento a la programacion', 18.75, 4),
    (1, 'Estudios basicos de estudios', 'John Goodman', 'Clases de datos usando MySQL', 10.50 , 4),
    (4, 'Donde esta Y?', 'John Goodman', 'Clases de datos usando MySQL', 10.50, 4),
    (3, 'Quimica Avanzada', 'John White', 'Profitable studies on chemistry', 45.35, 1),
    (4, 'Graficas Matematicas', 'Rene Descartes', 'De donde viene el plano', 13.99, 7),
    (4, 'Numeros Importantes', 'Leonard Euler', 'De numeros que a veces nos sirven', 10, 3),
    (3, 'Modelado de conocimiento', 'Jack Friedman', 'Una vez adquirido, como se guarda el conocimiento', 29.99, 2),
    (3, 'Teoria de juegos', 'John Nash', 'A o B?', 12.55, 3),
    (1, 'Calculo de variables', 'Brian Kernhigan', 'Programacion mega basica', 9.50, 3),
    (5, 'Produccion de streaming', 'Juan Pablo Rojas', 'De la oficina ala pan', 23.49, 9),
    (5, 'ELearning', 'JFD & DvdH', 'Diseno y ejecucion de educacion online', 23.55, 4),
    (5, 'Pet Caring for Geeks', 'KC', 'Que tu perro aprenda a programar', 18.79, 3 ),
    (1, 'Algebra basica', 'Al Juarismi', 'Esto de encontrar X o Y, dependiendo', 13.50, 8);
~~~

### INSERT INTO actions:

~~~
INSERT INTO actions (book_id, user_id, action_type) VALUES
  (3, 2, 'venta'),
  (6, 1, 'prestamo'),
  (7, 7, 'prestamo'),
(7, 7, 'devolucion'),
  (2, 5, 'venta'),
  (10, 9, 'venta'),
  (18, 8, 'prestamo'),
  (12, 4, 'venta'),
  (1, 3, 'venta'),
  (4, 5, 'prestamo'),
  (5, 2, 'venta');
~~~

### Traer información del libro, que acción se realizó y el ID del usuario que realizó la acción.

~~~
SELECT a.action_id,
	b.title,
	a.action_type,
	a.user_id
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id;
~~~

### Traer información del libro, que acción se realizó y el nombre del usuario que realizó la acción.

~~~
SELECT a.action_id,
	b.title,
	a.action_type,
	u.name
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id;
~~~

### Traer información del libro, que acción se realizó, nombre del usuario que realizó la acción y el precio del libro.

~~~
SELECT a.action_id,
	b.title,
	a.action_type,
	u.name,
	b.price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id;
~~~

### Traer información de los libros que han sido vendidos y el precio del libro.

~~~
SELECT a.action_id,
	b.title,
	a.action_type,
	u.name,
	b.price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type = 'venta';
~~~

### Traer información de los libros que no han sido vendidos de diferentes maneras.

~~~
SELECT a.action_id,
	b.title,
	a.action_type,
	u.name,
	0 AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type <> 'venta';


SELECT a.action_id,
	b.title,
	a.action_type,
	u.name,
	0 AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type NOT IN ('venta');


SELECT a.action_id,
	b.title,
	a.action_type,
	u.name,
	0 AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type != 'venta';
~~~

### Ejemplo de UNION

~~~
SELECT a.action_id,
	b.title,
	a.action_type,
	u.name,
	0 AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type != 'venta'

UNION

SELECT a.action_id,
	b.title,
	a.action_type,
	u.name,
	b.price AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type = 'venta';
~~~

### Ordenar por action_id el resultado del UNION

~~~
SELECT a.action_id AS aid,
	b.title,
	a.action_type,
	u.name,
	0 AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type != 'venta'

UNION

SELECT a.action_id AS aid,
	b.title,
	a.action_type,
	u.name,
	b.price AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id
WHERE a.action_type = 'venta'

ORDER BY aid;
~~~


### Condicional

~~~
SELECT a.action_id AS aid,
	b.title,
	a.action_type,
	u.name,
	IF (a.action_type = 'venta', b.price, '') AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id;

SELECT a.action_id AS aid,
	b.title,
	a.action_type,
	u.name,
	IF (a.action_type = 'venta', b.price, 0) AS price
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id;
~~~


### Realizar un descuento del 10% a los libros con ID (1, 4, 7, 8, 2).

~~~
SELECT a.action_id AS aid,
	b.title,
	a.action_type,
	u.name,
	IF (a.action_type = 'venta', b.price, 0) AS price,
	b.book_id AS bid,
	IF (b.book_id IN (1, 4, 7, 8, 2), b.price * .9, b.price) AS dcto
FROM actions AS a
LEFT JOIN books AS b
	ON b.book_id = a.book_id
LEFT JOIN users AS u
	ON u.user_id = a.user_id;
~~~


### Consultar libros almacenados con su respectiva editorial

~~~
SELECT p.name, b.title
FROM books AS b
JOIN publishers AS p
WHERE b.publisher_id = p.publisher_id;
~~~


### Consultar libros almacenados con su respectiva editorial, precio y número de copias

~~~
SELECT p.name, b.title, b.price, b.copies
FROM books AS b
JOIN publishers AS p
WHERE b.publisher_id = p.publisher_id;
~~~


### Consultar cuanto dinero hay en stock por cada una de las editoriales.

~~~
SELECT
	p.publisher_id AS pid, 
	p.name,
	SUM(b.price * b.copies)
FROM books AS b
JOIN publishers AS p
WHERE b.publisher_id = p.publisher_id
GROUP BY pid;
~~~


### Consultar cuanto dinero hay en stock por cada una de las editoriales sin incluir los libros menores a $15.

~~~
SELECT
	p.publisher_id AS pid, 
	p.name,
	SUM(IF(b.price >= 15, b.price * b.copies, 0)) AS total
FROM books AS b
JOIN publishers AS p
WHERE b.publisher_id = p.publisher_id
GROUP BY pid;
~~~


### Consultar cantidad de libros por editorial

~~~
SELECT
	p.publisher_id AS pid, 
	p.name,
	COUNT(b.book_id) AS libros
FROM books AS b
LEFT JOIN publishers AS p ON p.publisher_id = b.publisher_id
GROUP BY pid;
~~~


### Sumar la cantidad de libros por editorial sin tener en cuenta los menores a $15

~~~
SELECT
	p.publisher_id AS pid, 
	p.name,
	COUNT(b.book_id) AS libros,
	SUM(IF(b.price >= 15, 1, 0)) AS libros_en_venta
FROM books AS b
LEFT JOIN publishers AS p ON p.publisher_id = b.publisher_id
GROUP BY pid;
~~~


### Consultar cuanto dinero y cuantos libros puedo vender por editorial, teniendo en cuenta que solo se pueden vender los mayores a $15.

~~~
SELECT
	p.publisher_id AS pid, 
	p.name,
	SUM(IF(b.price >= 15, b.price * b.copies, 0)) AS total,
	SUM(IF(b.price >= 15, 1, 0)) AS libros_por_vender
FROM books AS b
JOIN publishers AS p
WHERE b.publisher_id = p.publisher_id
GROUP BY pid;
~~~


### Agregar nueva columna a la table 'users'

~~~
ALTER TABLE users ADD COLUMN active TINYINT(1) NOT NULL DEFAULT '1';
~~~

### Notas:

1) **UNSIGNED:** No guarda el signo del identificador.
2) **UNIQUE:** Restringe una columna para asegurarse que no se escriban valores duplicados.
3) **Backup DB Windows:** `mysqldump -u username -ppassword -hhostname name_db > name_db.sql`