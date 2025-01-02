CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `PK_IdActividades` int unsigned NOT NULL AUTO_INCREMENT,
  `Actividades` varchar(255) NOT NULL,
  `Descripcion` varchar(1000) NOT NULL,
  `Nivel` varchar(50) NOT NULL,
  `FK_DuracionSesion` int unsigned NOT NULL,
  `CertificadoOficial` varchar(1) NOT NULL,
  `CertificadoCurso` varchar(1) NOT NULL,
  `Presencial` varchar(1) NOT NULL,
  `MaterialesPropios` varchar(1) NOT NULL,
  `Observaciones` varchar(1000) NOT NULL,
  PRIMARY KEY (`PK_IdActividades`),
  UNIQUE KEY `PK_IdActividades_UNIQUE` (`PK_IdActividades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actividadespermitidas`
--

DROP TABLE IF EXISTS `actividadespermitidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividadespermitidas` (
  `PK_IdActividades` int unsigned NOT NULL AUTO_INCREMENT,
  `FK_IdPLan` int unsigned NOT NULL,
  `FK_Id_Actividad` int unsigned NOT NULL,
  `PK_IdInstalacion` int unsigned NOT NULL,
  PRIMARY KEY (`PK_IdActividades`),
  UNIQUE KEY `PK_IdActividades_UNIQUE` (`PK_IdActividades`),
  UNIQUE KEY `FK_IdPLan_UNIQUE` (`FK_IdPLan`),
  UNIQUE KEY `FK_ID_Actividad_UNIQUE` (`FK_Id_Actividad`),
  UNIQUE KEY `PK_IdInstalacion_UNIQUE` (`PK_IdInstalacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividadespermitidas`
--

LOCK TABLES `actividadespermitidas` WRITE;
/*!40000 ALTER TABLE `actividadespermitidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividadespermitidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audittrail`
--

DROP TABLE IF EXISTS `audittrail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audittrail` (
  `ID_Historial` int unsigned NOT NULL AUTO_INCREMENT,
  `PK_IdSocio` int unsigned NOT NULL,
  `FechaCambio` date NOT NULL,
  `PlanAnterior` int NOT NULL,
  `PlanActual` int NOT NULL,
  `FechaAltaPlanAnterior` date NOT NULL,
  `BajaDefinitiva` varchar(1) NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  UNIQUE KEY `PK_IdSocio_UNIQUE` (`PK_IdSocio`),
  UNIQUE KEY `ID_Historial_UNIQUE` (`ID_Historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audittrail`
--

LOCK TABLES `audittrail` WRITE;
/*!40000 ALTER TABLE `audittrail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audittrail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `PK_IdHorarios` int unsigned NOT NULL AUTO_INCREMENT,
  `FK_IdActividad` int unsigned NOT NULL,
  `Sala` varchar(255) NOT NULL,
  `FK_Fecha` date DEFAULT NULL,
  `Hora` time NOT NULL,
  `Profesor` int unsigned NOT NULL,
  `Observaciones` varchar(1000) NOT NULL,
  `FK_DuracionSesion` int unsigned NOT NULL,
  PRIMARY KEY (`PK_IdHorarios`),
  UNIQUE KEY `PK_IdHorarios_UNIQUE` (`PK_IdHorarios`),
  UNIQUE KEY `FK_IdActividad1_UNIQUE` (`FK_IdActividad`),
  UNIQUE KEY `Profesor_UNIQUE` (`Profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instalacion`
--

DROP TABLE IF EXISTS `instalacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instalacion` (
  `PK_IdInstalacion` int unsigned NOT NULL,
  `Zona` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Tamaño` int NOT NULL,
  `Aforo` int NOT NULL,
  PRIMARY KEY (`PK_IdInstalacion`),
  UNIQUE KEY `PK_IdZonaEstandar_UNIQUE` (`PK_IdInstalacion`),
  UNIQUE KEY `Tamaño_UNIQUE` (`Tamaño`),
  UNIQUE KEY `Aforo_UNIQUE` (`Aforo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalacion`
--

LOCK TABLES `instalacion` WRITE;
/*!40000 ALTER TABLE `instalacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `instalacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `PK_IdPlanes` int unsigned NOT NULL,
  `Planes` varchar(255) NOT NULL,
  `FK_TipoSocio` varchar(1) NOT NULL,
  `MatriculaPersona` decimal(7,2) unsigned NOT NULL,
  `CuotaMensual` decimal(7,2) unsigned NOT NULL,
  `Descripcion` varchar(1000) DEFAULT NULL,
  `FK_Actividades` int unsigned NOT NULL,
  PRIMARY KEY (`PK_IdPlanes`),
  UNIQUE KEY `idPlanes_UNIQUE` (`PK_IdPlanes`),
  UNIQUE KEY `Tipo_UNIQUE` (`FK_TipoSocio`),
  UNIQUE KEY `FK_Actividades_UNIQUE` (`FK_Actividades`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesores`
--

DROP TABLE IF EXISTS `profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesores` (
  `PK_IdProfesores` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido1` varchar(45) NOT NULL,
  `Apellido2` varchar(45) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Formacion` varchar(255) NOT NULL,
  PRIMARY KEY (`PK_IdProfesores`),
  UNIQUE KEY `PK_IdProfesores_UNIQUE` (`PK_IdProfesores`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`),
  UNIQUE KEY `Apellido1_UNIQUE` (`Apellido1`),
  UNIQUE KEY `Apellido2_UNIQUE` (`Apellido2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesores`
--

LOCK TABLES `profesores` WRITE;
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrosempresas`
--

DROP TABLE IF EXISTS `registrosempresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrosempresas` (
  `PK_ID_Registro` int(10) unsigned zerofill NOT NULL,
  `FK_NIF_Empresa` int unsigned NOT NULL,
  `FK_IdPlanes` int unsigned NOT NULL,
  `NombreEmpresa` varchar(255) NOT NULL,
  `TelefonoContacto` varchar(255) NOT NULL,
  `PersonaContacto` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `FechaInicioConvenio` date NOT NULL,
  `FechaFinalConvenio` date NOT NULL,
  PRIMARY KEY (`PK_ID_Registro`),
  UNIQUE KEY `PK_IdPlanes_UNIQUE` (`FK_IdPlanes`),
  UNIQUE KEY `ID_Registro_UNIQUE` (`PK_ID_Registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrosempresas`
--

LOCK TABLES `registrosempresas` WRITE;
/*!40000 ALTER TABLE `registrosempresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `registrosempresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimiento` (
  `PK_IdSeguimiento` int unsigned NOT NULL AUTO_INCREMENT,
  `FK_IdSocio` int unsigned NOT NULL,
  `FK_Fecha` date NOT NULL,
  `NotaObtenida` int NOT NULL,
  `Seguimientocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PK_IdSeguimiento`),
  UNIQUE KEY `PK_IdSeguimiento_UNIQUE` (`PK_IdSeguimiento`),
  UNIQUE KEY `FK_IdSocio_UNIQUE` (`FK_IdSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimiento`
--

LOCK TABLES `seguimiento` WRITE;
/*!40000 ALTER TABLE `seguimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socios`
--

DROP TABLE IF EXISTS `socios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socios` (
  `PK_IdSocios` int unsigned NOT NULL AUTO_INCREMENT,
  `DocumentoIdentidad` int unsigned NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido1` varchar(255) NOT NULL,
  `Apellido2` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `FechaNacimiento` varchar(45) NOT NULL,
  `FK_PlanSocio` int unsigned NOT NULL,
  `FK_TipoSocio` varchar(1) NOT NULL,
  `FechaAlta` varchar(45) NOT NULL,
  `NumeroTarjetaAcceso` int unsigned NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Ciudad` varchar(255) NOT NULL,
  `CodigoPostal` varchar(255) NOT NULL,
  `Observaciones` varchar(1000) DEFAULT NULL,
  `Activo` varchar(1) NOT NULL,
  PRIMARY KEY (`PK_IdSocios`),
  UNIQUE KEY `idSocios_UNIQUE` (`PK_IdSocios`),
  UNIQUE KEY `DocumentoIdentidad_UNIQUE` (`DocumentoIdentidad`),
  UNIQUE KEY `NumeroTarjetaAcceso_UNIQUE` (`NumeroTarjetaAcceso`),
  UNIQUE KEY `FK_PlanSocio_UNIQUE` (`FK_PlanSocio`),
  UNIQUE KEY `FK_TipoSocio_UNIQUE` (`FK_TipoSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socios`
--

LOCK TABLES `socios` WRITE;
/*!40000 ALTER TABLE `socios` DISABLE KEYS */;
/*!40000 ALTER TABLE `socios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tautonomo`
--

DROP TABLE IF EXISTS `tautonomo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tautonomo` (
  `PK_IdSocio` int unsigned NOT NULL,
  `NumeroCuenta` varchar(24) NOT NULL,
  `Banco` varchar(255) NOT NULL,
  PRIMARY KEY (`PK_IdSocio`),
  UNIQUE KEY `PK_IdSocio_UNIQUE` (`PK_IdSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tautonomo`
--

LOCK TABLES `tautonomo` WRITE;
/*!40000 ALTER TABLE `tautonomo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tautonomo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcoporativo`
--

DROP TABLE IF EXISTS `tcoporativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcoporativo` (
  `PK_IdSocio` int unsigned NOT NULL,
  `FK_NIF_Empresa` int unsigned NOT NULL,
  PRIMARY KEY (`PK_IdSocio`),
  UNIQUE KEY `PK_IdSocio_UNIQUE` (`PK_IdSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcoporativo`
--

LOCK TABLES `tcoporativo` WRITE;
/*!40000 ALTER TABLE `tcoporativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcoporativo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 20:03:05
