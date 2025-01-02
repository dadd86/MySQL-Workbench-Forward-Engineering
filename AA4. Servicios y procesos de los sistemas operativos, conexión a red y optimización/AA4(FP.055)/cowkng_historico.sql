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
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `id_socio` int NOT NULL,
  `tipo_socio` int NOT NULL COMMENT '1=Autonomo, 2=Corporativo',
  `fecha_cambio` date NOT NULL,
  `plan_anterior` int NOT NULL,
  `plan_actual` int DEFAULT NULL,
  `nif_empresa` varchar(15) DEFAULT NULL,
  `tarjeta_acceso` varchar(15) DEFAULT NULL,
  `fecha_alta_plan` date DEFAULT NULL,
  `baja_definitiva` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_socio`,`fecha_cambio`),
  KEY `historico_socio_idx` (`id_socio`),
  CONSTRAINT `historico_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (6,2,'2022-02-05',7,7,'B85868339',NULL,'2019-02-24',1),(9,1,'2022-02-24',1,3,NULL,NULL,'2021-03-01',0),(13,2,'2022-01-26',7,7,'A28788909',NULL,'2018-04-09',1),(24,1,'2022-01-13',4,4,NULL,'ALCI00024','2019-08-01',1),(25,1,'2022-03-09',1,1,NULL,NULL,'2017-11-28',1),(26,1,'2022-01-22',3,3,NULL,NULL,'2018-05-27',1),(27,1,'2022-02-14',2,2,NULL,NULL,'2019-08-14',1),(28,1,'2022-03-01',4,4,NULL,'ALVA00028','2019-09-06',1),(29,2,'2022-03-07',7,7,'B85868339',NULL,'2017-08-13',1),(34,1,'2022-03-12',2,3,NULL,NULL,'2021-03-17',0),(47,1,'2020-01-01',6,6,NULL,NULL,'2018-05-12',1),(80,2,'2022-01-08',8,8,'B85868339','JEHE00080','2019-03-28',1),(81,2,'2022-02-17',7,7,'A79935607',NULL,'2019-02-03',1),(82,2,'2022-03-05',8,8,'A79935607','BESM00082','2019-05-17',1);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
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
