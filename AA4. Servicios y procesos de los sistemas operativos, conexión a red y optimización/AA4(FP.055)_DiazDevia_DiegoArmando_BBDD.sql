-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cowkng
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cowkng` ;

-- -----------------------------------------------------
-- Schema cowkng
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cowkng` DEFAULT CHARACTER SET utf8mb3 ;
SHOW WARNINGS;
USE `cowkng` ;

-- -----------------------------------------------------
-- Table `actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `actividad` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `actividad` (
  `id_actividad` INT NOT NULL AUTO_INCREMENT,
  `actividad` VARCHAR(40) NOT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `nivel` ENUM('Inicial', ' Básico', 'Intermedio', 'Avanzado') NOT NULL COMMENT 'niveles de dificultad',
  `duracion_sesion_minutos` INT NOT NULL,
  `observaciones` VARCHAR(255) NULL DEFAULT NULL,
  `certoficial` TINYINT NULL DEFAULT NULL,
  `certcurso` TINYINT NULL DEFAULT NULL,
  `presencial` TINYINT NULL DEFAULT NULL,
  `matpropios` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_actividad`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `plan` (
  `id_plan` INT NOT NULL AUTO_INCREMENT,
  `plan` VARCHAR(45) NOT NULL,
  `tipo` CHAR(1) NULL DEFAULT NULL,
  `matricula` DECIMAL(10,2) NOT NULL,
  `cuota_mensual` DECIMAL(10,2) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_plan`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Plan_UNIQUE` ON `plan` (`plan` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `socio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `socio` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `socio` (
  `id_socio` INT NOT NULL AUTO_INCREMENT,
  `documento_identidad` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `apellido1` VARCHAR(20) NOT NULL,
  `apellido2` VARCHAR(20) NULL DEFAULT NULL,
  `sexo` CHAR(1) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `id_plan` INT NOT NULL,
  `fecha_alta` DATE NOT NULL,
  `activo` TINYINT NOT NULL,
  `tarjeta_acceso` VARCHAR(15) NULL DEFAULT NULL,
  `telefono_contacto` VARCHAR(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `codigo_postal` CHAR(5) NOT NULL,
  `observaciones` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_socio`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `empresa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `empresa` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `empresa` (
  `nif` VARCHAR(15) NOT NULL,
  `empresa` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `persona_contacto` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fecha_inicio_convenio` DATE NOT NULL,
  `fecha_fin_convenio` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`nif`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Empresa_UNIQUE` ON `empresa` (`empresa` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `corporativo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corporativo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `corporativo` (
  `id_socio` INT NOT NULL,
  `nif` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`nif`, `id_socio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `historico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `historico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `historico` (
  `id_socio` INT NOT NULL,
  `tipo_socio` INT NOT NULL COMMENT '1=Autonomo, 2=Corporativo',
  `fecha_cambio` DATE NOT NULL,
  `plan_anterior` INT NOT NULL,
  `plan_actual` INT NULL DEFAULT NULL,
  `nif_empresa` VARCHAR(15) NULL DEFAULT NULL,
  `tarjeta_acceso` VARCHAR(15) NULL DEFAULT NULL,
  `fecha_alta_plan` DATE NULL DEFAULT NULL,
  `baja_definitiva` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`id_socio`, `fecha_cambio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;
CREATE INDEX `historico_socio_idx` ON `historico` (`id_socio` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `instalacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `instalacion` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `instalacion` (
  `id_instalacion` INT NOT NULL,
  `zona` VARCHAR(15) NOT NULL COMMENT 'zona 24h y estándar',
  `denominacion` VARCHAR(45) NOT NULL,
  `descripcion_zona` VARCHAR(255) NULL DEFAULT NULL,
  `metros_cuadrados` DECIMAL(10,2) NOT NULL,
  `aforo` INT NOT NULL,
  PRIMARY KEY (`id_instalacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `profesor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profesor` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `profesor` (
  `id_profesor` INT NOT NULL AUTO_INCREMENT,
  `documento_identidad` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `apellido1` VARCHAR(20) NOT NULL,
  `apellido2` VARCHAR(20) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `formacion` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_profesor`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `horario` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `horario` (
  `id_actividad` INT NOT NULL,
  `id_instalacion` INT NOT NULL,
  `id_profesor` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `observaciones` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_actividad`, `id_instalacion`, `fecha`, `hora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `plan_actividad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan_actividad` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `plan_actividad` (
  `id_plan` INT NOT NULL,
  `id_actividad` INT NOT NULL,
  PRIMARY KEY (`id_actividad`, `id_plan`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `principal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `principal` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `principal` (
  `idsocio` INT NOT NULL,
  `cuenta` VARCHAR(20) NOT NULL,
  `banco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idsocio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `seguimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `seguimiento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `seguimiento` (
  `id_socio` INT NOT NULL,
  `id_actividad` INT NOT NULL,
  `fecha_realizacion` DATE NOT NULL,
  `nota` INT NOT NULL,
  PRIMARY KEY (`id_socio`, `id_actividad`, `fecha_realizacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
