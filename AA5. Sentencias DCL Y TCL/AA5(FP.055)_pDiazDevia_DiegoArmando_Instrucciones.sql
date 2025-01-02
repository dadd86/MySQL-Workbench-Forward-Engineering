-- Active: 1704484383584@@127.0.0.1@3306@cowkng
-- Active: 1704484383584@@127.0.0.1@3306@cowkng
-- Active: 1704484383584@@127.0.0.1@3306@cowkng
-----------------------------------------------------CASO 1------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Crear Usuario CoWorkAdmin
--% permite que el usuario desde cualquie HOST
-- PSS: DDiaz
-- Crear Usuario CoWorkAdmin
CREATE USER 'CoWorkAdmin'@'%' IDENTIFIED BY 'DDiaz';
-- Revocar privilegios que se habían dado previamente (si ya se ejecutó el GRANT anterior)
REVOKE ALL PRIVILEGES ON *.* FROM 'CoWorkAdmin'@'%';
REVOKE GRANT OPTION ON *.* FROM 'CoWorkAdmin'@'%';
-- Otorgar privilegios específicos para la base de datos Cowkng
GRANT ALL PRIVILEGES ON Cowkng.* TO 'CoWorkAdmin'@'%' WITH GRANT OPTION;
-- Otorgar privilegio para crear usuarios pero solo dentro de la base de datos Cowkng
-- Nota: CREATE USER no es un privilegio que se pueda limitar a una base de datos específica,
-- por lo que se otorga a nivel global pero se espera que CoWorkAdmin lo use responsablemente
GRANT CREATE USER, RELOAD ON *.* TO 'CoWorkAdmin'@'%';
-- Aplicar los cambios de los permisos
FLUSH PRIVILEGES;
-----------------------------------------------------CASO 2------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Para comprobar que el usuario se ha generado de forma correcta
SELECT user, host FROM mysql.user WHERE user = 'CoWorkAdmin';
--Mostramos los privilegios que tiene el usuario
SHOW GRANTS FOR 'CoWorkAdmin'@'%';
-----------------------------------------------------CASO 3------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Comprabamos con que usuario estamos conectados
SELECT CURRENT_USER();
SHOW PROCESSLIST;
-----------------------------------------------------CASO 4------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Creamos un usuario nuevo llamando supervisor
--PSS: DDiaz
-- Crear el usuario Supervisor con su contraseña
CREATE USER 'Supervisor'@'%' IDENTIFIED BY 'DDiaz';
-- Otorgar permisos para la tabla 'actividad'
GRANT SELECT, INSERT, UPDATE, DELETE ON Cowkng.actividad TO 'Supervisor'@'%';
-- Otorgar permisos para la tabla 'horario'
GRANT SELECT, INSERT, UPDATE, DELETE ON Cowkng.horario TO 'Supervisor'@'%';
-- Aplicar los cambios de los permisos
FLUSH PRIVILEGES;
-----------------------------------------------------CASO 5------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Crear el usuario Contable con su contraseña
CREATE USER 'Contable'@'%' IDENTIFIED BY 'DDiaz';
-- Otorgar permisos para la tabla 'plan' que podría contener la información de planes y suscripciones
GRANT SELECT, INSERT, UPDATE, DELETE ON Cowkng.plan TO 'Contable'@'%';
-- Otorgar permisos para la tabla 'socio' que podría contener la información de las suscripciones de los miembros
GRANT SELECT, INSERT, UPDATE, DELETE ON Cowkng.socio TO 'Contable'@'%';
-- Otorgar permisos para la tabla 'plan_actividad' que podría contener la información sobre qué planes incluyen qué actividades
GRANT SELECT, INSERT, UPDATE, DELETE ON Cowkng.plan_actividad TO 'Contable'@'%';
-- Aplicar los cambios de los permisos
FLUSH PRIVILEGES;
-----------------------------------------------------CASO 6------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Iniciar la transacción
START TRANSACTION;
-- Insertar un nuevo socio en la tabla 'socio'
INSERT INTO socio (documento_identidad, nombre, apellido1, apellido2, sexo, fecha_nacimiento, id_plan, fecha_alta, activo, telefono_contacto, email, codigo_postal, observaciones)
VALUES ('DocX64542D', 'ElCaballero', 'Mascara', 'Dorada', 'M', '1986-02-11', 4, '2024-01-11', 1, '1205488888', 'Elgringito@gringoland.com', '52048', 'VOY a SACAR un 10');
-- Obtener el ID del último socio insertado
SET @ultimo_socio_id = LAST_INSERT_ID();
--Verificar que la empresa existe en la tabla empresa:
SELECT * FROM empresa WHERE nif = '5487628';
--Si la empresa no existe, insertarla en la tabla empresa:
INSERT INTO empresa (nif, empresa, telefono, persona_contacto, email, fecha_inicio_convenio)
VALUES ('5487628', 'LosBitMasters', '01548859665', 'Diego', 'Diego@losbitmasters.com', '2023-07-01');
-- Asumiendo que ya conoces el NIF de la empresa y que el nuevo socio es un socio corporativo
INSERT INTO corporativo (id_socio, nif) VALUES (@ultimo_socio_id, '5487628');
-- Si ambas inserciones fueron exitosas, confirmar los cambios
COMMIT;
--Vamos a verificar que se han creado de forma correcta
--Verificar la Inserción en la Tabla socio:
SELECT * FROM socio WHERE documento_identidad = 'DocX64542D';
--Verificar la Inserción en la Tabla corporativo:
SELECT * FROM corporativo WHERE id_socio = (SELECT id_socio FROM socio WHERE documento_identidad = 'DocX64542D');
--Verificar la Existencia de la Empresa en la Tabla empresa:
SELECT * FROM empresa WHERE nif = '5487628';
-----------------------------------------------------CASO 7------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Iniciar la transacción
START TRANSACTION;
-- Verificar si ya existe un socio con el mismo documento_identidad
SELECT COUNT(*) INTO @socio_count FROM socio WHERE documento_identidad = 'Fast6545';
-- Insertar un nuevo socio en la tabla 'socio'
INSERT INTO socio (documento_identidad, nombre, apellido1, apellido2, sexo, fecha_nacimiento, id_plan, fecha_alta, activo, telefono_contacto, email, codigo_postal, observaciones)
VALUES ('Fast6545', 'Tragaldabas', 'Tola', 'Semoja', 'F', '1989-07-08', 2, '2022-11-20', 1, '0000000000', 'notelodoy@cogelo.com', '05215', 'Esta bien hecho');
-- Obtener los ID del socio
SELECT id_socio INTO @socio_ids
FROM socio
WHERE documento_identidad = 'Fast6545';
-- Obtener el ID del último socio insertado
SET @ultimo_socio_id = @socio_ids;
-- Insertar los datos bancarios en la tabla 'principal'
INSERT INTO principal (idsocio, cuenta, banco)
VALUES (@ultimo_socio_id, 'DE022158515487633', 'Bank11');
--Verificar la Existencia de la Actividad en la Tabla actividad:
SELECT * FROM actividad WHERE id_actividad = ID_Actividad;
-- Crear un SAVEPOINT
SAVEPOINT antes_seguimiento;
-- Insertar un seguimiento en la tabla 'seguimiento'
INSERT INTO seguimiento (id_socio, id_actividad, fecha_realizacion, nota)
VALUES (@ultimo_socio_id, 9, DATE_ADD('2023-11-28', INTERVAL 1 WEEK), Nota);
-- Crear un ROLLBACK TO SAVEPOINT para deshacer los cambios hasta el SAVEPOINT
ROLLBACK TO SAVEPOINT antes_seguimiento;
-- Confirmar los cambios hasta el SAVEPOINT
COMMIT;
--Verificar la Inserción del Nuevo Socio:
SELECT * FROM socio WHERE documento_identidad = 'Fast6545';
--Verificar la Inserción de los Datos Bancarios:
SELECT * FROM principal WHERE idsocio = (SELECT id_socio FROM socio WHERE documento_identidad = 'Fast6545');
--Verificar la Inserción en la Tabla seguimiento:
SELECT * FROM seguimiento WHERE id_socio = (SELECT id_socio FROM socio WHERE documento_identidad = 'Fast6545');
/*
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Desactivamos la comprobación de claves foráneas para evitar conflictos
SET FOREIGN_KEY_CHECKS=0;
--Verificar los registros duplicados
SELECT documento_identidad, COUNT(*)
FROM socio
GROUP BY documento_identidad
HAVING COUNT(*) > 1;
--Seleccionar los IDs de los registros duplicados, excepto uno
SELECT MIN(id_socio) as id_a_mantener
FROM socio
GROUP BY documento_identidad
HAVING COUNT(*) > 1;
-- Obtener los ID de los socios a eliminar
SELECT id_socio INTO @socio_ids
FROM socio
WHERE documento_identidad = 'Fast6545';
-- Eliminar registros relacionados en la tabla 'autonomo'
DELETE FROM principal
WHERE id_socio IN (SELECT id_socio FROM socio WHERE documento_identidad = 'Fast6545');

-- Eliminar los registros en la tabla 'socio'
DELETE FROM socio
WHERE documento_identidad = 'Fast6545';
DELETE FROM principal WHERE idsocio = @socio_ids;
DELETE FROM principal WHERE idsocio = @socio_ids;
DELETE FROM principal WHERE cuenta = 'número_de_cuenta';
SET FOREIGN_KEY_CHECKS = 1;
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
*/
