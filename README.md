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
	price DECIMAL(5,2)
);


CREATE TABLE publisher (
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

### Notas:

1) **UNSIGNED:** No guarda el signo del identificador.
2) **UNIQUE:** Restringe una columna para asegurarse que no se escriban valores duplicados.