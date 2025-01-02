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
-- Table structure for table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento` (
  `id_socio` int NOT NULL,
  `id_actividad` int NOT NULL,
  `fecha_realizacion` date NOT NULL,
  `nota` int NOT NULL,
  PRIMARY KEY (`id_socio`,`id_actividad`,`fecha_realizacion`),
  KEY `seguimiento_actividad` (`id_actividad`),
  CONSTRAINT `seguimiento_actividad` FOREIGN KEY (`id_actividad`) REFERENCES `actividad` (`id_actividad`),
  CONSTRAINT `seguimiento_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento`
--

LOCK TABLES `seguimiento` WRITE;
/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
INSERT INTO `seguimiento` VALUES (2,1,'2022-01-06',7),(2,2,'2023-01-06',7),(2,5,'2023-01-08',8),(2,6,'2022-01-06',5),(2,21,'2023-02-06',7),(42,2,'2023-03-06',10),(42,5,'2023-01-08',6),(42,8,'2023-01-08',8),(42,9,'2023-04-04',3),(42,20,'2022-01-09',9),(53,10,'2022-01-10',5),(53,11,'2023-04-04',3),(53,12,'2023-01-08',8),(53,15,'2022-01-10',5),(66,1,'2023-01-08',8),(66,6,'2023-01-08',6),(66,11,'2023-01-08',6),(66,20,'2023-03-06',10),(68,7,'2023-03-06',10),(68,8,'2023-01-08',8),(68,9,'2022-01-10',5),(68,13,'2023-01-08',6),(68,14,'2023-01-08',8),(92,15,'2023-03-06',10),(92,16,'2022-01-10',5),(92,17,'2023-01-08',6),(92,17,'2023-03-06',10);
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;
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
