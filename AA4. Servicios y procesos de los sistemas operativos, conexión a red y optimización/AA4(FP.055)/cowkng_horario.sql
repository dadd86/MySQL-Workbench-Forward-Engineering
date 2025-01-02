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
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_actividad` int NOT NULL,
  `id_instalacion` int NOT NULL,
  `id_profesor` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_actividad`,`id_instalacion`,`fecha`,`hora`),
  KEY `actividad_instalacion_idx` (`id_instalacion`),
  KEY `actividad_monitor` (`id_profesor`),
  CONSTRAINT `actividad_horario` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`),
  CONSTRAINT `actividad_instalacion` FOREIGN KEY (`id_instalacion`) REFERENCES `instalacion` (`id_instalacion`),
  CONSTRAINT `actividad_monitor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,12,1,'2022-01-03','19:00:00',NULL),(1,12,7,'2022-01-06','19:00:00',NULL),(1,12,5,'2022-01-10','19:00:00',NULL),(1,12,5,'2022-01-13','19:00:00',NULL),(1,12,4,'2022-01-17','19:00:00',NULL),(1,12,3,'2022-01-20','19:00:00',NULL),(1,12,2,'2022-01-24','19:00:00',NULL),(1,12,6,'2022-01-27','19:00:00',NULL),(1,12,7,'2022-01-31','19:00:00',NULL),(2,2,5,'2022-01-09','13:00:00',NULL),(2,2,3,'2022-01-16','13:00:00',NULL),(2,2,2,'2022-01-23','13:00:00',NULL),(2,2,3,'2022-01-30','13:00:00',NULL),(2,12,7,'2022-01-04','18:00:00',NULL),(2,12,6,'2022-01-07','18:00:00',NULL),(2,12,1,'2022-01-11','18:00:00',NULL),(2,12,2,'2022-01-14','18:00:00',NULL),(2,12,3,'2022-01-18','18:00:00',NULL),(2,12,4,'2022-01-21','18:00:00',NULL),(2,12,5,'2022-01-25','18:00:00',NULL),(2,12,6,'2022-01-28','18:00:00',NULL),(3,2,7,'2022-01-03','18:00:00',NULL),(3,2,5,'2022-01-06','18:00:00',NULL),(3,2,3,'2022-01-10','18:00:00',NULL),(3,2,2,'2022-01-13','18:00:00',NULL),(3,2,4,'2022-01-17','18:00:00',NULL),(3,2,6,'2022-01-20','18:00:00',NULL),(3,2,7,'2022-01-24','18:00:00',NULL),(3,2,5,'2022-01-27','18:00:00',NULL),(3,2,3,'2022-01-31','18:00:00',NULL),(4,2,1,'2022-01-04','20:00:00',NULL),(4,2,1,'2022-01-07','20:00:00',NULL),(4,2,2,'2022-01-11','20:00:00',NULL),(4,2,5,'2022-01-14','20:00:00',NULL),(4,2,7,'2022-01-18','20:00:00',NULL),(4,2,7,'2022-01-21','20:00:00',NULL),(4,2,6,'2022-01-25','20:00:00',NULL),(4,2,5,'2022-01-28','20:00:00',NULL),(5,1,4,'2022-01-03','08:00:00',NULL),(5,1,5,'2022-01-06','08:00:00',NULL),(5,1,6,'2022-01-10','08:00:00',NULL),(5,1,7,'2022-01-13','08:00:00',NULL),(5,1,2,'2022-01-17','08:00:00',NULL),(5,1,1,'2022-01-20','08:00:00',NULL),(5,1,4,'2022-01-24','08:00:00',NULL),(5,1,3,'2022-01-27','08:00:00',NULL),(5,1,2,'2022-01-31','08:00:00',NULL),(6,1,1,'2022-01-04','08:00:00',NULL),(6,1,3,'2022-01-07','08:00:00',NULL),(6,1,2,'2022-01-11','08:00:00',NULL),(6,1,6,'2022-01-14','08:00:00',NULL),(6,1,7,'2022-01-18','08:00:00',NULL),(6,1,4,'2022-01-21','08:00:00',NULL),(6,1,3,'2022-01-25','08:00:00',NULL),(6,1,2,'2022-01-28','08:00:00',NULL),(7,3,1,'2022-01-03','13:30:00',NULL),(7,3,5,'2022-01-05','18:00:00',NULL),(7,3,6,'2022-01-06','13:30:00',NULL),(7,3,5,'2022-01-08','18:00:00',NULL),(7,3,2,'2022-01-10','13:30:00',NULL),(7,3,1,'2022-01-12','18:00:00',NULL),(7,3,4,'2022-01-13','13:30:00',NULL),(7,3,5,'2022-01-15','18:00:00',NULL),(7,3,7,'2022-01-17','13:30:00',NULL),(7,3,7,'2022-01-19','18:00:00',NULL),(7,3,6,'2022-01-20','13:30:00',NULL),(7,3,5,'2022-01-22','18:00:00',NULL),(7,3,5,'2022-01-24','13:30:00',NULL),(7,3,5,'2022-01-26','18:00:00',NULL),(7,3,4,'2022-01-27','13:30:00',NULL),(7,3,4,'2022-01-29','18:00:00',NULL),(7,3,3,'2022-01-31','13:30:00',NULL),(8,1,2,'2022-01-03','14:30:00',NULL),(8,1,1,'2022-01-06','14:30:00',NULL),(8,1,3,'2022-01-10','14:30:00',NULL),(8,1,1,'2022-01-13','14:30:00',NULL),(8,1,2,'2022-01-17','14:30:00',NULL),(8,1,6,'2022-01-20','14:30:00',NULL),(8,1,3,'2022-01-24','14:30:00',NULL),(8,1,5,'2022-01-27','14:30:00',NULL),(8,1,4,'2022-01-31','14:30:00',NULL),(8,2,6,'2022-01-05','09:00:00',NULL),(8,2,5,'2022-01-08','09:00:00',NULL),(8,2,4,'2022-01-12','09:00:00',NULL),(8,2,3,'2022-01-15','09:00:00',NULL),(8,2,2,'2022-01-19','09:00:00',NULL),(8,2,7,'2022-01-22','09:00:00',NULL),(8,2,6,'2022-01-26','09:00:00',NULL),(8,2,5,'2022-01-29','09:00:00',NULL),(9,1,5,'2022-01-05','08:00:00',NULL),(9,1,4,'2022-01-08','08:00:00',NULL),(9,1,4,'2022-01-12','08:00:00',NULL),(9,1,4,'2022-01-15','08:00:00',NULL),(9,1,5,'2022-01-19','08:00:00',NULL),(9,1,4,'2022-01-22','08:00:00',NULL),(9,1,5,'2022-01-26','08:00:00',NULL),(9,1,3,'2022-01-29','08:00:00',NULL),(9,2,2,'2022-01-09','09:00:00',NULL),(9,2,3,'2022-01-16','09:00:00',NULL),(9,2,2,'2022-01-23','09:00:00',NULL),(9,2,3,'2022-01-30','09:00:00',NULL),(10,2,5,'2022-01-03','09:00:00',NULL),(10,2,6,'2022-01-06','09:00:00',NULL),(10,2,5,'2022-01-10','09:00:00',NULL),(10,2,6,'2022-01-13','09:00:00',NULL),(10,2,5,'2022-01-17','09:00:00',NULL),(10,2,4,'2022-01-20','09:00:00',NULL),(10,2,3,'2022-01-24','09:00:00',NULL),(10,2,2,'2022-01-27','09:00:00',NULL),(10,2,2,'2022-01-31','09:00:00',NULL),(11,6,1,'2022-01-04','13:30:00',NULL),(11,6,1,'2022-01-07','13:30:00',NULL),(11,6,1,'2022-01-11','13:30:00',NULL),(11,6,6,'2022-01-14','13:30:00',NULL),(11,6,7,'2022-01-18','13:30:00',NULL),(11,6,5,'2022-01-21','13:30:00',NULL),(11,6,4,'2022-01-25','13:30:00',NULL),(11,6,4,'2022-01-28','13:30:00',NULL),(12,5,3,'2022-01-05','10:00:00',NULL),(12,5,3,'2022-01-08','10:00:00',NULL),(12,5,2,'2022-01-12','10:00:00',NULL),(12,5,2,'2022-01-15','10:00:00',NULL),(12,5,1,'2022-01-19','10:00:00',NULL),(12,5,1,'2022-01-22','10:00:00',NULL),(12,5,1,'2022-01-26','10:00:00',NULL),(12,5,1,'2022-01-29','10:00:00',NULL),(13,6,2,'2022-01-05','14:30:00',NULL),(13,6,2,'2022-01-08','14:30:00',NULL),(13,6,3,'2022-01-12','14:30:00',NULL),(13,6,3,'2022-01-15','14:30:00',NULL),(13,6,3,'2022-01-19','14:30:00',NULL),(13,6,4,'2022-01-22','14:30:00',NULL),(13,6,4,'2022-01-26','14:30:00',NULL),(13,6,6,'2022-01-29','14:30:00',NULL),(14,2,7,'2022-01-04','09:00:00',NULL),(14,2,5,'2022-01-04','14:30:00',NULL),(14,2,7,'2022-01-07','09:00:00',NULL),(14,2,6,'2022-01-07','14:30:00',NULL),(14,2,6,'2022-01-11','09:00:00',NULL),(14,2,6,'2022-01-11','14:30:00',NULL),(14,2,6,'2022-01-14','09:00:00',NULL),(14,2,6,'2022-01-14','14:30:00',NULL),(14,2,5,'2022-01-18','09:00:00',NULL),(14,2,5,'2022-01-18','14:30:00',NULL),(14,2,5,'2022-01-21','09:00:00',NULL),(14,2,5,'2022-01-21','14:30:00',NULL),(14,2,4,'2022-01-25','09:00:00',NULL),(14,2,1,'2022-01-25','14:30:00',NULL),(14,2,1,'2022-01-28','09:00:00',NULL),(14,2,1,'2022-01-28','14:30:00',NULL),(14,3,1,'2022-01-09','08:00:00',NULL),(14,3,1,'2022-01-23','08:00:00',NULL),(15,12,1,'2022-01-05','13:30:00',NULL),(15,12,1,'2022-01-08','13:30:00',NULL),(15,12,1,'2022-01-12','13:30:00',NULL),(15,12,1,'2022-01-15','13:30:00',NULL),(15,12,2,'2022-01-19','13:30:00',NULL),(15,12,2,'2022-01-22','13:30:00',NULL),(15,12,3,'2022-01-26','13:30:00',NULL),(15,12,4,'2022-01-29','13:30:00',NULL),(16,1,4,'2022-01-04','10:00:00',NULL),(16,1,4,'2022-01-07','10:00:00',NULL),(16,1,4,'2022-01-09','10:00:00',NULL),(16,1,4,'2022-01-11','10:00:00',NULL),(16,1,6,'2022-01-14','10:00:00',NULL),(16,1,7,'2022-01-16','10:00:00',NULL),(16,1,5,'2022-01-18','10:00:00',NULL),(16,1,4,'2022-01-21','10:00:00',NULL),(16,1,3,'2022-01-23','10:00:00',NULL),(16,1,2,'2022-01-25','10:00:00',NULL),(16,1,2,'2022-01-28','10:00:00',NULL),(16,1,2,'2022-01-30','10:00:00',NULL),(17,1,3,'2022-01-03','10:00:00',NULL),(17,1,3,'2022-01-06','10:00:00',NULL),(17,1,4,'2022-01-10','10:00:00',NULL),(17,1,5,'2022-01-13','10:00:00',NULL),(17,1,6,'2022-01-17','10:00:00',NULL),(17,1,7,'2022-01-20','10:00:00',NULL),(17,1,6,'2023-01-24','10:00:00',NULL),(17,1,1,'2023-01-27','10:00:00',NULL),(17,1,1,'2023-01-31','10:00:00',NULL),(18,4,3,'2022-01-20','20:00:00',NULL),(18,4,3,'2022-01-24','20:00:00',NULL),(18,4,1,'2023-01-03','20:00:00',NULL),(18,4,2,'2023-01-06','20:00:00',NULL),(18,4,4,'2023-01-10','20:00:00',NULL),(18,4,5,'2023-01-13','20:00:00',NULL),(18,4,2,'2023-01-17','20:00:00',NULL),(18,4,2,'2023-01-27','20:00:00',NULL),(18,4,1,'2023-01-31','20:00:00',NULL),(19,1,1,'2023-01-05','20:00:00',NULL),(19,1,2,'2023-01-08','20:00:00',NULL),(19,1,3,'2023-01-12','20:00:00',NULL),(19,1,4,'2023-01-15','20:00:00',NULL),(19,1,5,'2023-01-19','20:00:00',NULL),(19,1,2,'2023-01-22','20:00:00',NULL),(19,1,1,'2023-01-26','20:00:00',NULL),(19,1,2,'2023-01-29','20:00:00',NULL),(20,1,1,'2023-01-04','19:00:00',NULL),(20,1,5,'2023-01-07','19:00:00',NULL),(20,1,5,'2023-01-11','19:00:00',NULL),(20,1,4,'2023-01-14','19:00:00',NULL),(20,1,3,'2023-01-18','19:00:00',NULL),(20,1,5,'2023-01-21','19:00:00',NULL),(20,1,6,'2023-01-25','19:00:00',NULL),(20,1,6,'2023-01-28','19:00:00',NULL),(20,3,5,'2022-01-16','08:00:00',NULL),(20,3,4,'2023-01-30','08:00:00',NULL),(21,2,2,'2022-01-15','19:00:00',NULL),(21,2,3,'2023-01-05','19:00:00',NULL),(21,2,2,'2023-01-08','19:00:00',NULL),(21,2,2,'2023-01-12','19:00:00',NULL),(21,2,2,'2023-01-19','19:00:00',NULL),(21,2,2,'2023-01-22','19:00:00',NULL),(21,2,1,'2023-01-26','19:00:00',NULL),(21,2,5,'2023-01-29','19:00:00',NULL),(21,12,4,'2023-01-09','12:30:00',NULL),(21,12,3,'2023-01-16','12:30:00',NULL),(21,12,2,'2023-01-23','12:30:00',NULL),(21,12,1,'2023-01-30','12:30:00',NULL);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 17:24:42
