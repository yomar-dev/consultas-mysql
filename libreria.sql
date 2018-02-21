-- MySQL dump 10.16  Distrib 10.1.28-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: libreria
-- ------------------------------------------------------
-- Server version	10.1.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `action_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `action_type` enum('venta','prestamo','devolucion') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publisher_id` int(10) unsigned NOT NULL,
  `title` varchar(60) NOT NULL,
  `author` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(5,2) DEFAULT NULL,
  `copies` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,1,'Mastering MySQL','John Goodman','Clases de bases de datos usando MySQL',10.50,4),(2,2,'Trigonometria avanzada','Pi Tagoras','Trigonometria desde sus origenes',7.30,2),(3,3,'Advanced Statistics','Carl Gauss','De curvas y otras graficas',23.60,1),(4,4,'Redes Avanzadas','Tim Bernes-Lee','Lo que viene siendo el Internet',13.50,4),(5,2,'Curvas Parabolicas','Napoleon TNT','Historia de la parabola',6.99,10),(6,1,'Ruby On (the) Road','A Miner','Un nuevo acercamiento a la programacion',18.75,4),(7,1,'Estudios basicos de estudios','John Goodman','Clases de datos usando MySQL',10.50,4),(8,4,'Donde esta Y?','John Goodman','Clases de datos usando MySQL',10.50,4),(9,3,'Quimica Avanzada','John White','Profitable studies on chemistry',45.35,1),(10,4,'Graficas Matematicas','Rene Descartes','De donde viene el plano',13.99,7),(11,4,'Numeros Importantes','Leonard Euler','De numeros que a veces nos sirven',10.00,3),(12,3,'Modelado de conocimiento','Jack Friedman','Una vez adquirido, como se guarda el conocimiento',29.99,2),(13,3,'Teoria de juegos','John Nash','A o B?',12.55,3),(14,1,'Calculo de variables','Brian Kernhigan','Programacion mega basica',9.50,3),(15,5,'Produccion de streaming','Juan Pablo Rojas','De la oficina ala pan',23.49,9),(16,5,'ELearning','JFD & DvdH','Diseno y ejecucion de educacion online',23.55,4),(17,5,'Pet Caring for Geeks','KC','Que tu perro aprenda a programar',18.79,3),(18,1,'Algebra basica','Al Juarismi','Esto de encontrar X o Y, dependiendo',13.50,8);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publishers` (
  `publisher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES (1,'OReilly','USA'),(2,'Santillana','Mexico'),(3,'MIT Edu','USA'),(4,'UTPC','Colombia'),(5,'Grupo Anaya','España');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ricardo','ricardo@hola.com'),(2,'Laura','laura@hola.com'),(3,'Jose','jose@hola.com'),(4,'Sofia','sofia@hola.com'),(5,'Fernanda','fernanda@hola.com'),(6,'Jose Guillermo','memo@hola.com'),(7,'Maria','maria@hola.com'),(8,'Susana','susana@hola.com'),(9,'Jorge','jorge@hola.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-20 22:58:30
