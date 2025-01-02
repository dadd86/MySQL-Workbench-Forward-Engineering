----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Active: 1702466283473@@127.0.0.1@3306@cowkng
-- Seleccionar columnas específicas de la tabla 'empresa'
--CASO 1
SELECT DISTINCT
    empresa.nif,               -- NIF de la empresa
    empresa.empresa AS 'Nombre de Empresa', -- Selecciona y renombra la columna empresa para que aparezca como Nombre de Empresa en los resultados
    empresa.fecha_inicio_convenio  -- Fecha de inicio de convenio
FROM empresa-- Indica la tabla principal desde la cual se extraen los datos
INNER JOIN corporativo ON empresa.nif = corporativo.nif -- Une la tabla empresa con la tabla corporativo
WHERE empresa.fecha_inicio_convenio IS NOT NULL -- Filtra para incluir solo empresas con una fecha de inicio de convenio definida
ORDER BY empresa.empresa; -- Ordena los resultados por el nombre de la empresa

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 2
-- Selecciona las columnas deseadas de la tabla actividad
SELECT 
    id_actividad, -- ID de la actividad
    actividad, -- Nombre de la actividad
    descripcion AS 'Descricion de la actividad' -- Renombra la columna descripcion para que aparezca como Descricion de la actividad en los resultados
FROM 
    actividad -- Indica la tabla desde la cual se extraen los datos
WHERE 
    certoficial = 1 AND -- 1 indica que la actividad ofrece certificado oficial
    presencial = 0; -- 0 indica que la actividad no requiere presencia

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 3
-- Selecciona los planes con un precio de matrícula por debajo de 50 para ver sus cuotas mensuales actuales
SELECT id_plan, matricula, cuota_mensual
FROM plan
WHERE matricula < 50;-- Actualiza la cuota mensual
-- Selecciona los planes con un precio de matrícula por debajo de 50 para actualizar sus cuotas mensuales actuales
UPDATE plan
SET cuota_mensual = cuota_mensual * 1.15  -- Incrementa la cuota mensual en un 15%
WHERE matricula < 50;                      -- Condición: solo para aquellos planes con una matrícula menor a 50
-- Selecciona los planes con un precio de matrícula por debajo de 50 para ver sus cuotas mensuales actuales
SELECT id_plan, matricula, cuota_mensual
FROM plan
WHERE matricula < 50;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 4
-- Desactivamos la comprobación de claves foráneas para evitar conflictos
SET FOREIGN_KEY_CHECKS=0;
-- Insertamos nuevos socios, dos de ellos en planes corporativos
-- DiegoADiaz será uno de los nuevos socios
INSERT INTO socio (documento_identidad, nombre, apellido1, apellido2, sexo, fecha_nacimiento, id_plan, fecha_alta, activo, tarjeta_acceso, telefono_contacto, email, codigo_postal, observaciones) VALUES
('DNI12345A', 'Diego', 'ADiaz', NULL, 'M', '1986-02-11', 1, CURDATE(), 1, NULL, '600123456', 'diego@diaz.com', '28001', 'Observaciones Diego'),
('DNI12345B', 'Denis', 'Amjoan', NULL, 'F', '1990-02-02', 2, CURDATE(), 1, NULL, '600123457', 'socio2@example.com', '28002', 'Observaciones Socio2'),
('DNI12345C', 'Rainer', 'Van-Derbur', NULL, 'M', '1990-03-03', 6, CURDATE(), 1, NULL, '600123458', 'socio3@example.com', '28003', 'Observaciones Socio3'),
('DNI12345D', 'Lars', 'Poque', NULL, 'F', '1990-04-04', 7, CURDATE(), 1, NULL, '600123459', 'socio4@example.com', '28004', 'Observaciones Socio4');
-- Suponiendo que los socios 3 y 4 están en planes corporativos y tienen NIFs de empresas existentes en la tabla 'empresa'
INSERT INTO corporativo (id_socio, nif) VALUES
(LAST_INSERT_ID() - 1, 'NIFEMPRESA3'),
(LAST_INSERT_ID(), 'NIFEMPRESA4');
-- Reactivamos la comprobación de claves foráneas
SET FOREIGN_KEY_CHECKS=1;
--Comprobramos que los socios han sido introducidos correctamente
SELECT * FROM socio
WHERE documento_identidad IN ('DNI12345A', 'DNI12345B', 'DNI12345C', 'DNI12345D');
--Comprobamos que los socios corporativos han sido introducidos correctamente
SELECT socio.id_socio, socio.nombre, corporativo.nif
FROM socio
INNER JOIN corporativo ON socio.id_socio = corporativo.id_socio
WHERE socio.documento_identidad IN ('DNI12345C', 'DNI12345D');

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
--Desactivar la comprobación de claves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;
--Eliminar referencias en la tabla corporativo
DELETE FROM corporativo
WHERE id_socio IN (
    SELECT id_socio
    FROM (
        SELECT id_socio
        FROM socio
        WHERE documento_identidad IN (
            SELECT documento_identidad
            FROM socio
            GROUP BY documento_identidad
            HAVING COUNT(*) > 1
        )
        AND id_socio NOT IN (
            SELECT MIN(id_socio)
            FROM socio
            GROUP BY documento_identidad
            HAVING COUNT(*) > 1
        )
    ) AS subquery
);
--Eliminar registros duplicados de socio
DELETE s1 FROM socio s1
INNER JOIN socio s2 
WHERE 
    s1.id_socio < s2.id_socio AND 
    s1.documento_identidad = s2.documento_identidad;
--Reactivar la comprobación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;
