-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cowkng
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `id_actividad` int NOT NULL AUTO_INCREMENT,
  `actividad` varchar(40) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nivel` enum('Inicial',' Básico','Intermedio','Avanzado') NOT NULL COMMENT 'niveles de dificultad',
  `duracion_sesion_minutos` int NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `certoficial` tinyint DEFAULT NULL,
  `certcurso` tinyint DEFAULT NULL,
  `presencial` tinyint DEFAULT NULL,
  `matpropios` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,'Acroyoga','Es una disciplina que mezcla el yoga, las acrobacias y el masaje. Se practica en parejas','Intermedio',50,NULL,0,1,0,1),(2,'Informatica','Informatica nivel usuario','Inicial',50,NULL,1,0,1,0),(3,'Informatica avanzada','Informatica nivel usuario avanzado','Intermedio',45,NULL,1,1,1,0),(4,'Inteligencia Artificial 1','Inteligencia Artificial nivel usuario','Intermedio',55,NULL,1,1,0,0),(5,'Inteligencia Artificial 2','Inteligencia Artificial nivel usuario avanzado','Avanzado',55,NULL,1,1,0,0),(6,'Inteligencia Artificial 3','Inteligencia Artificial nivel experto','Avanzado',30,NULL,1,1,1,0),(7,'Crea tu empresa 1','Aprende a crear tu propia empresa nivel 1','Inicial',50,NULL,1,0,0,0),(8,'Crea tu empresa 2','Aprende a crear tu propia empresa nivel 2','Intermedio',50,NULL,0,1,0,1),(9,'Crea tu empresa 3','Aprende a crear tu propia empresa nivel 3','Avanzado',50,NULL,1,1,0,0),(10,'Contabilidad 1','Aprende contabilidad nivel 1','Inicial',50,NULL,0,1,0,0),(11,'Contabilidad 2','Aprende contabilidad nivel 2','Intermedio',50,NULL,1,0,1,1),(12,'Contabilidad 3','Aprende contabilidad nivel 3','Avanzado',50,NULL,1,0,1,1),(13,'Coaching 1','Coaching nivel básico','Inicial',50,NULL,1,0,1,1),(14,'Coaching 2','Coaching nivel medio','Intermedio',50,NULL,0,0,0,1),(15,'Coaching 3','Coaching nivel experto','Avanzado',50,NULL,1,1,0,1),(16,'Gestion capital humano 1','Gestion capital humano primera parte','Inicial',30,NULL,0,1,1,1),(17,'Gestion capital humano 2','Gestion capital humano segunda parte','Intermedio',50,NULL,0,1,0,1),(18,'Gestion capital humano 3','Gestion capital humano tercera parte','Avanzado',30,NULL,1,1,0,0),(19,'Bases de datos empresariales 1','Bases de datos empresariales nivel 1','Intermedio',50,NULL,1,1,1,1),(20,'Bases de datos empresariales 2','Bases de datos empresariales nivel 2','Avanzado',50,NULL,1,1,1,1),(21,'Zumba','Mezcla de ritmos latinos –salsa, merengue, flamenco o bachata– y ejercicios aeróbicos','Intermedio',50,NULL,0,1,1,0);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 17:24:43
