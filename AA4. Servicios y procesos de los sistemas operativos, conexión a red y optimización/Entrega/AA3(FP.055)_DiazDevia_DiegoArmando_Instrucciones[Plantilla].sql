-- Active: 1702721619122@@127.0.0.1@3306@cowkng
-- Active: 1702721619122@@127.0.0.1@3306@cowkng
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

/*
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
--CASO 4 NO EJECUTAR
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
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------NO EJECUTAR-------------------------------------------------------------------------------------------------------------------------------------------------------
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 4

-- Desactivamos la comprobación de claves foráneas para evitar conflictos
SET FOREIGN_KEY_CHECKS=0;

-- Insertamos a DiegoA DiazD si no existe
INSERT INTO socio (documento_identidad, nombre, apellido1, sexo, fecha_nacimiento, id_plan, fecha_alta, activo, telefono_contacto, email, codigo_postal, observaciones)
SELECT 'DNI1213245D', 'DiegoA', 'DiazD', 'M', '1986-02-11', 1, CURDATE(), 1, '600123450', 'diego.diaz@example.com', '28001', 'Observaciones Diego'
FROM DUAL
WHERE NOT EXISTS (
    SELECT documento_identidad FROM socio WHERE documento_identidad = 'DNI1213245D'
);

-- Insertamos a Jaan Haag si no existe
INSERT INTO socio (documento_identidad, nombre, apellido1, sexo, fecha_nacimiento, id_plan, fecha_alta, activo, telefono_contacto, email, codigo_postal, observaciones)
SELECT 'DNI12345J', 'Jaan', 'Haag', 'M', '1991-01-01', 6, CURDATE(), 1, '600123451', 'jaan.haag@example.com', '28002', 'Observaciones Jaan'
FROM DUAL
WHERE NOT EXISTS (
    SELECT documento_identidad FROM socio WHERE documento_identidad = 'DNI12345J'
);

-- Insertamos a Lars Poque si no existe
INSERT INTO socio (documento_identidad, nombre, apellido1, sexo, fecha_nacimiento, id_plan, fecha_alta, activo, telefono_contacto, email, codigo_postal, observaciones)
SELECT 'DNI12345L', 'Lars', 'Poque', 'M', '1992-01-01', 7, CURDATE(), 1, '600123452', 'lars.poque@example.com', '28003', 'Observaciones Lars'
FROM DUAL
WHERE NOT EXISTS (
    SELECT documento_identidad FROM socio WHERE documento_identidad = 'DNI12345L'
);

-- Insertamos a Carolina Carmona si no existe
INSERT INTO socio (documento_identidad, nombre, apellido1, sexo, fecha_nacimiento, id_plan, fecha_alta, activo, telefono_contacto, email, codigo_postal, observaciones)
SELECT 'DNI12345C', 'Carolina', 'Carmona', 'F', '1993-01-01', 1, CURDATE(), 1, '600123453', 'carolina.carmona@example.com', '28004', 'Observaciones Carolina'
FROM DUAL
WHERE NOT EXISTS (
    SELECT documento_identidad FROM socio WHERE documento_identidad = 'DNI12345C'
);

-- Insertamos en 'corporativo' para Jaan Haag y Lars Poque (suponiendo que son los socios en planes corporativos)
INSERT INTO corporativo (id_socio, nif) VALUES
((SELECT id_socio FROM socio WHERE documento_identidad = 'DNI12345J'), 'NIFEMPRESA3'),
((SELECT id_socio FROM socio WHERE documento_identidad = 'DNI12345L'), 'NIFEMPRESA4');
-- Reactivamos la comprobación de claves foráneas
SET FOREIGN_KEY_CHECKS=1;
--Comprobramos que los socios han sido introducidos correctamente
SELECT * FROM socio
WHERE documento_identidad IN ('DNI1213245D', 'DNI12345J', 'DNI12345L', 'DNI12345C');
--Comprobamos que los socios corporativos han sido introducidos correctamente
SELECT socio.id_socio, socio.nombre, corporativo.nif
FROM socio
INNER JOIN corporativo ON socio.id_socio = corporativo.id_socio
WHERE socio.documento_identidad IN ('DNI12345J', 'DNI12345L');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 5

-- Desactivar temporalmente las restricciones de clave foránea
SET FOREIGN_KEY_CHECKS = 0;

-- Eliminar socios con códigos postales específicos
DELETE FROM socio
WHERE codigo_postal IN ('28026', '41005', '15024');

-- Reactivar las restricciones de clave foránea
SET FOREIGN_KEY_CHECKS = 1;
-- Consultar si aún existen socios con los códigos postales especificados
SELECT *
FROM socio
WHERE codigo_postal IN ('28026', '41005', '15024');

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 6

-- Seleccionamos las columnas requeridas combinando la información de varias tablas
SELECT 
    s.id_socio,                            -- ID del socio
    CONCAT(s.nombre, ' ', s.apellido1, ' ', IFNULL(s.apellido2, '')) AS 'Nombre Completo',  -- Nombre completo del socio en una sola columna
    c.nif,                                 -- NIF de la empresa asociada al socio corporativo
    e.empresa                              -- Nombre de la empresa asociada al socio corporativo
FROM 
    socio s
    INNER JOIN corporativo c ON s.id_socio = c.id_socio  -- JOIN entre 'socio' y 'corporativo' usando id_socio
    INNER JOIN empresa e ON c.nif = e.nif                -- JOIN entre 'corporativo' y 'empresa' usando NIF
WHERE 
    s.activo = 1                                         -- Filtramos solo los socios activos
ORDER BY 
    e.empresa,                                           -- Ordenamos primero por nombre de la empresa
    s.nombre, s.apellido1, s.apellido2;                  -- Luego por nombre del socio

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 7

-- Seleccionamos las columnas requeridas combinando la información de varias tablas
SELECT 
    s.id_socio AS 'idSocio',                            -- ID del socio
    CONCAT(s.nombre, ' ', s.apellido1, ' ', IFNULL(s.apellido2, '')) AS 'Nombre Completo',  -- Nombre completo del socio en una sola columna
    c.nif AS 'NIF Empresa',                             -- NIF de la empresa asociada al socio corporativo
    e.empresa AS 'Nombre Empresa'                       -- Nombre de la empresa asociada al socio corporativo
FROM 
    socio s
    INNER JOIN corporativo c ON s.id_socio = c.id_socio  -- JOIN entre 'socio' y 'corporativo' usando id_socio
    INNER JOIN empresa e ON c.nif = e.nif                -- JOIN entre 'corporativo' y 'empresa' usando NIF
WHERE 
    s.activo = 1                                         -- Filtramos solo los socios activos
ORDER BY 
    e.empresa,                                           -- Ordenamos primero por nombre de la empresa
    CONCAT(s.nombre, ' ', s.apellido1, ' ', IFNULL(s.apellido2, '')); -- Luego por nombre del socio

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 8

-- Contamos el número de actividades impartidas por cada profesor en el año 2023
SELECT 
    h.id_profesor,                              -- ID del profesor
    p.nombre,                                   -- Nombre del profesor
    COUNT(h.id_actividad) AS 'Actividades'      -- Cantidad de actividades impartidas
FROM 
    horario h
    INNER JOIN profesor p ON h.id_profesor = p.id_profesor  -- JOIN entre 'horario' y 'profesor' usando id_profesor
WHERE 
    YEAR(h.fecha) = 2023                        -- Filtramos las actividades del año 2023
GROUP BY 
    h.id_profesor, p.nombre                     -- Agrupamos por ID y nombre del profesor
ORDER BY 
    'Actividades' DESC;                         -- Ordenamos por el número de actividades impartidas, de mayor a menor

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 9

-- Selecciona las actividades que se realizan a las 10:00 de la mañana
SELECT 
    a.id_actividad,                 -- ID de la actividad
    a.actividad,                    -- Nombre de la actividad
    h.fecha,                        -- Fecha de la actividad
    h.hora                          -- Hora de la actividad
FROM 
    actividad a
    INNER JOIN horario h            -- JOIN entre 'actividad' y 'horario' usando id_actividad
    ON a.id_actividad = h.id_actividad
WHERE 
    h.hora = '10:00:00'             -- Filtra las actividades que comienzan a las 10:00
ORDER BY 
    h.fecha;                        -- Ordena las actividades por fecha

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 10

-- Cuenta el número de instalaciones en la tabla 'instalacion'
SELECT 
    COUNT(*) AS 'Número de instalaciones'  -- Asigna un alias a la columna para que se muestre como 'Número de instalaciones'
FROM 
    instalacion;                          -- Selecciona la tabla 'instalacion' para contar sus filas

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--CASO 11

SELECT 
    p.plan AS 'Plan',                      -- Muestra el nombre del plan
    COUNT(s.id_socio) AS 'Número de socios', -- Cuenta el número de socios en cada plan
    FORMAT(p.cuota_mensual, 2) AS 'Cuota mensual', -- Formatea la cuota mensual con 2 decimales
    FORMAT(COUNT(s.id_socio) * p.cuota_mensual, 2) AS 'Total' -- Calcula el total estimado de cobro por plan y lo formatea
FROM 
    socio s
INNER JOIN 
    plan p ON s.id_plan = p.id_plan         -- Une las tablas 'socio' y 'plan' para obtener la información de los planes de cada socio
WHERE 
    p.tipo <> 'E'                           -- Filtra para excluir los planes corporativos ('E' por Empresa)
GROUP BY 
    p.plan                                  -- Agrupa los resultados por nombre de plan
ORDER BY 
    p.plan;                                 -- Ordena los resultados por nombre de plan
