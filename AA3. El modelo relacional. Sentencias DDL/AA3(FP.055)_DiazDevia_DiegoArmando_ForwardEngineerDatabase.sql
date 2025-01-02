-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Actividades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Actividades` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Actividades` (
  `PK_IdActividades` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Actividades` VARCHAR(255) NOT NULL,
  `Descripcion` VARCHAR(1000) NOT NULL,
  `Nivel` VARCHAR(50) NOT NULL,
  `FK_DuracionSesion` INT UNSIGNED NOT NULL,
  `CertificadoOficial` VARCHAR(1) NOT NULL,
  `CertificadoCurso` VARCHAR(1) NOT NULL,
  `Presencial` VARCHAR(1) NOT NULL,
  `MaterialesPropios` VARCHAR(1) NOT NULL,
  `Observaciones` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`PK_IdActividades`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdActividades_UNIQUE` ON `Actividades` (`PK_IdActividades` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Planes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Planes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Planes` (
  `PK_IdPlanes` INT UNSIGNED NOT NULL,
  `Planes` VARCHAR(255) NOT NULL,
  `FK_TipoSocio` VARCHAR(1) NOT NULL,
  `MatriculaPersona` DECIMAL(7,2) UNSIGNED NOT NULL,
  `CuotaMensual` DECIMAL(7,2) UNSIGNED NOT NULL,
  `Descripcion` VARCHAR(1000) NULL,
  `FK_Actividades` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PK_IdPlanes`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idPlanes_UNIQUE` ON `Planes` (`PK_IdPlanes` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Tipo_UNIQUE` ON `Planes` (`FK_TipoSocio` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `FK_Actividades_UNIQUE` ON `Planes` (`FK_Actividades` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Socios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Socios` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Socios` (
  `PK_IdSocios` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `DocumentoIdentidad` INT UNSIGNED NOT NULL,
  `Nombre` VARCHAR(255) NOT NULL,
  `Apellido1` VARCHAR(255) NOT NULL,
  `Apellido2` VARCHAR(255) NOT NULL,
  `Direccion` VARCHAR(255) NOT NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  `FechaNacimiento` VARCHAR(45) NOT NULL,
  `FK_PlanSocio` INT UNSIGNED NOT NULL,
  `FK_TipoSocio` VARCHAR(1) NOT NULL,
  `FechaAlta` VARCHAR(45) NOT NULL,
  `NumeroTarjetaAcceso` INT UNSIGNED NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Ciudad` VARCHAR(255) NOT NULL,
  `CodigoPostal` VARCHAR(255) NOT NULL,
  `Observaciones` VARCHAR(1000) NULL,
  `Activo` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`PK_IdSocios`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `idSocios_UNIQUE` ON `Socios` (`PK_IdSocios` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `DocumentoIdentidad_UNIQUE` ON `Socios` (`DocumentoIdentidad` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `NumeroTarjetaAcceso_UNIQUE` ON `Socios` (`NumeroTarjetaAcceso` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `FK_PlanSocio_UNIQUE` ON `Socios` (`FK_PlanSocio` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `FK_TipoSocio_UNIQUE` ON `Socios` (`FK_TipoSocio` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TCoporativo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TCoporativo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TCoporativo` (
  `PK_IdSocio` INT UNSIGNED NOT NULL,
  `FK_NIF_Empresa` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PK_IdSocio`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdSocio_UNIQUE` ON `TCoporativo` (`PK_IdSocio` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `TAutonomo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TAutonomo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `TAutonomo` (
  `PK_IdSocio` INT UNSIGNED NOT NULL,
  `NumeroCuenta` VARCHAR(24) NOT NULL,
  `Banco` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`PK_IdSocio`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdSocio_UNIQUE` ON `TAutonomo` (`PK_IdSocio` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `RegistrosEmpresas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RegistrosEmpresas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `RegistrosEmpresas` (
  `PK_ID_Registro` INT UNSIGNED ZEROFILL NOT NULL,
  `FK_NIF_Empresa` INT UNSIGNED NOT NULL,
  `FK_IdPlanes` INT UNSIGNED NOT NULL,
  `NombreEmpresa` VARCHAR(255) NOT NULL,
  `TelefonoContacto` VARCHAR(255) NOT NULL,
  `PersonaContacto` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `FechaInicioConvenio` DATE NOT NULL,
  `FechaFinalConvenio` DATE NOT NULL,
  PRIMARY KEY (`PK_ID_Registro`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdPlanes_UNIQUE` ON `RegistrosEmpresas` (`FK_IdPlanes` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `ID_Registro_UNIQUE` ON `RegistrosEmpresas` (`PK_ID_Registro` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `AuditTrail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AuditTrail` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `AuditTrail` (
  `ID_Historial` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PK_IdSocio` INT UNSIGNED NOT NULL,
  `FechaCambio` DATE NOT NULL,
  `PlanAnterior` INT NOT NULL,
  `PlanActual` INT NOT NULL,
  `FechaAltaPlanAnterior` DATE NOT NULL,
  `BajaDefinitiva` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`ID_Historial`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdSocio_UNIQUE` ON `AuditTrail` (`PK_IdSocio` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `ID_Historial_UNIQUE` ON `AuditTrail` (`ID_Historial` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Profesores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Profesores` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Profesores` (
  `PK_IdProfesores` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido1` VARCHAR(45) NOT NULL,
  `Apellido2` VARCHAR(45) NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `Formacion` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`PK_IdProfesores`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdProfesores_UNIQUE` ON `Profesores` (`PK_IdProfesores` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Nombre_UNIQUE` ON `Profesores` (`Nombre` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Apellido1_UNIQUE` ON `Profesores` (`Apellido1` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Apellido2_UNIQUE` ON `Profesores` (`Apellido2` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Horarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Horarios` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Horarios` (
  `PK_IdHorarios` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FK_IdActividad` INT UNSIGNED NOT NULL,
  `Sala` VARCHAR(255) NOT NULL,
  `FK_Fecha` DATE NULL,
  `Hora` TIME NOT NULL,
  `Profesor` INT UNSIGNED NOT NULL,
  `Observaciones` VARCHAR(1000) NOT NULL,
  `FK_DuracionSesion` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PK_IdHorarios`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdHorarios_UNIQUE` ON `Horarios` (`PK_IdHorarios` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `FK_IdActividad1_UNIQUE` ON `Horarios` (`FK_IdActividad` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Profesor_UNIQUE` ON `Horarios` (`Profesor` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Instalacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Instalacion` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Instalacion` (
  `PK_IdInstalacion` INT UNSIGNED NOT NULL,
  `Zona` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Tamaño` INT NOT NULL,
  `Aforo` INT NOT NULL,
  PRIMARY KEY (`PK_IdInstalacion`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdZonaEstandar_UNIQUE` ON `Instalacion` (`PK_IdInstalacion` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Tamaño_UNIQUE` ON `Instalacion` (`Tamaño` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `Aforo_UNIQUE` ON `Instalacion` (`Aforo` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ActividadesPermitidas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ActividadesPermitidas` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `ActividadesPermitidas` (
  `PK_IdActividades` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FK_IdPLan` INT UNSIGNED NOT NULL,
  `FK_Id_Actividad` INT UNSIGNED NOT NULL,
  `PK_IdInstalacion` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PK_IdActividades`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdActividades_UNIQUE` ON `ActividadesPermitidas` (`PK_IdActividades` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `FK_IdPLan_UNIQUE` ON `ActividadesPermitidas` (`FK_IdPLan` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `FK_ID_Actividad_UNIQUE` ON `ActividadesPermitidas` (`FK_Id_Actividad` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdInstalacion_UNIQUE` ON `ActividadesPermitidas` (`PK_IdInstalacion` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Seguimiento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Seguimiento` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Seguimiento` (
  `PK_IdSeguimiento` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FK_IdSocio` INT UNSIGNED NOT NULL,
  `FK_Fecha` DATE NOT NULL,
  `NotaObtenida` INT NOT NULL,
  `Seguimientocol` VARCHAR(45) NULL,
  PRIMARY KEY (`PK_IdSeguimiento`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE UNIQUE INDEX `PK_IdSeguimiento_UNIQUE` ON `Seguimiento` (`PK_IdSeguimiento` ASC) VISIBLE;

SHOW WARNINGS;
CREATE UNIQUE INDEX `FK_IdSocio_UNIQUE` ON `Seguimiento` (`FK_IdSocio` ASC) VISIBLE;

SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- procedure InsertarHorario
-- -----------------------------------------------------

USE `mydb`;
DROP procedure IF EXISTS `InsertarHorario`;
SHOW WARNINGS;

DELIMITER $$
USE `mydb`$$
CREATE PROCEDURE InsertarHorario(
    IN FK_IdActividad INT,
    IN Sala VARCHAR(255),
    IN Fecha DATE,
    IN Hora TIME,
    IN Profesor VARCHAR(255),
    IN Observaciones TEXT
)
BEGIN
    -- Variable para almacenar si hay solapamiento
    DECLARE solapamiento INT;

    -- Verificar solapamientos
    SELECT COUNT(*) INTO solapamiento FROM Horarios
    WHERE Sala = Sala AND Fecha = Fecha AND
    ((Hora BETWEEN Hora AND ADDTIME(Hora, SEC_TO_TIME(DuracionSesion * 60))) OR
    (ADDTIME(Hora, SEC_TO_TIME(DuracionSesion * 60)) > Hora AND Hora < ADDTIME(Hora, SEC_TO_TIME(DuracionSesion * 60))));

    -- Si no hay solapamientos, insertar el horario
    IF solapamiento = 0 THEN
        INSERT INTO Horarios (FK_IdActividad, Sala, Fecha, Hora, Profesor, Observaciones)
        VALUES (FK_IdActividad, Sala, Fecha, Hora, Profesor, Observaciones);
    ELSE
        -- Manejar el caso de solapamiento, por ejemplo, lanzar un error
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solapamiento detectado, no se puede insertar el horario.';
    END IF;
END;$$

DELIMITER ;
SHOW WARNINGS;
USE `mydb`;

DELIMITER $$

USE `mydb`$$
DROP TRIGGER IF EXISTS `Socios_AFTER_INSERT` $$
SHOW WARNINGS$$
USE `mydb`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`Socios_AFTER_INSERT` AFTER INSERT ON `Socios` FOR EACH ROW
BEGIN
    IF NEW.FK_TipoSocio = 'A' THEN
        INSERT INTO TAutonomo (PK_IdSocio, NumeroCuenta, Banco) VALUES (NEW.PK_IdSocios, NULL, NULL);
    ELSEIF NEW.FK_TipoSocio = 'E' THEN
        INSERT INTO TCorporativo (PK_IdSocio, NIF_Empresa) VALUES (NEW.PK_IdSocios, NULL);
    END IF;
END;
END;$$

SHOW WARNINGS$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
