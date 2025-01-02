
-- Comando para borrar tabla ya creada ///////DROP Table PLANES/////////
/*Esta es la secuencia para crear la table en comando SQL*/
-- Creación de la tabla Planes
CREATE TABLE Planes (
    ID INT PRIMARY KEY,                                                         --UId
    Nombre VARCHAR2(255),                                                       --Atributo Nombre
    Tipo CHAR(1) CHECK (Tipo IN ('A', 'E')),                                    -- Aseguramos que solo pueda ser 'A' o 'E', esta linea con el comando CHECK se asegura 
                                                                                -- que solo se pueda introducir 'A' o 'E' 
    MatriculaPersona DECIMAL(7, 2),                                             --Atributo Matricula por persona 
    CuotaMensual DECIMAL(7, 2),                                                 --Atributo Couta Mensual
    Descripcion VARCHAR2(1000)                                                  --Atributo descrpticion
);

-- Creación de la tabla Socios para almacenar datos comunes de todos los socios
CREATE TABLE Socios (
    ID_Socio INT PRIMARY KEY,
    Nombre VARCHAR2(255),
    Direccion VARCHAR2(255),
    Telefono VARCHAR2(15),
    Email VARCHAR2(100),
    ID_Plan INT,
    FechaInscripcion DATE,                                                      --no permite valores 0
    FechaCaducidad DATE,
    CONSTRAINT fk_plan FOREIGN KEY (ID_Plan) REFERENCES Planes(ID)              --CONSTRAINT se utiliza para definir una restriccion en una tabla
                                                                                --fk_plan es el nombre de restriccion sobre la clave foranea(FOREIGN KEY)
                                                                                --FOREING KEY (ID_Plan) con esto especificamos la columna a la que se le aplica la restriccion
                                                                                --REFERENCES Planes(ID) Esto indica que la columna ID_PLAN de la tabla SOCIOS solo debe contener
                                                                                --los valores que ya existe en la tabla 'Planes' exactamaente a la columna ID, 
);

-- Creación de la tabla TrabajadoresCorporativos para aquellos afiliados por una organización
CREATE TABLE TrabajadoresCorporativos (
    ID_Socio INT PRIMARY KEY,
    NIF_Empresa VARCHAR2(9),
    CONSTRAINT fk_socio_corporativo FOREIGN KEY (ID_Socio) REFERENCES Socios(ID_Socio)
);

-- Creación de la tabla TrabajadoresAutonomos para los responsables del pago del plan
CREATE TABLE TrabajadoresAutonomos (
    ID_Socio INT PRIMARY KEY,
    Banco VARCHAR2(255),
    NumeroCuenta VARCHAR2(24),
    CONSTRAINT fk_socio_autonomo FOREIGN KEY (ID_Socio) REFERENCES Socios(ID_Socio)
);

/*Una vez creadas las tablas, solo he encontrado dos soluciones o borrar la tabla entera con la primera linea o modificar y agragar, como lo hago a continuacion*/
ALTER TABLE Socios ADD DocumentoIdentidad VARCHAR2(20);
ALTER TABLE Socios ADD Apellido1 VARCHAR2(255);
ALTER TABLE Socios ADD Apellido2 VARCHAR2(255);
ALTER TABLE Socios ADD Sexo CHAR(1) CHECK (Sexo IN ('M','F','O'));               --Masculino, femenino, otros
ALTER TABLE Socios ADD FechaNAcimiento DATE;
ALTER TABLE Socios ADD FechaAlta DATE;
ALTER TABLE Socios ADD NumeroTArjetaAcceso VARCHAR2(20);
ALTER TABLE Socios ADD Ciudad VARCHAR2(255);
ALTER TABLE Socios ADD CodigoPostal VARCHAR(10);
ALTER TABLE Socios ADD Observaciones VARCHAR2(1000);
ALTER TABLE Socios ADD Activo CHAR(1) check (Activo IN('S', 'N'));

CREATE TABLE Empresas (
    NIF VARCHAR2(9) PRIMARY KEY,                                                -- NIF de la empresa, que actúa como clave primaria única
    NombreEmpresa VARCHAR2(255),                                                -- Nombre de la empresa
    TelefonoContacto VARCHAR2(15),                                              -- Teléfono de contacto con la empresa
    PersonaContacto VARCHAR2(255),                                              -- Nombre de la persona de contacto en la empresa
    EmailContacto VARCHAR2(100),                                                -- Correo electrónico de la persona de contacto
    FechaInicioConvenio DATE,                                                   -- Fecha de inicio del convenio con el coWorking
    FechaFinConvenio DATE                                                       -- Fecha en la que termina el convenio
);

CREATE TABLE HistoricoPlanesSocios (
    ID_Historico INT PRIMARY KEY,                                               -- Un identificador único para cada entrada en el historial
    ID_Socio INT NOT NULL,                                                      -- La clave foránea que se refiere al ID del socio en la tabla Socios
    FechaCambio DATE NOT NULL,                                                  -- La fecha en la que se realizó el cambio de plan o la baja
    PlanAnterior INT,                                                           -- La clave foránea que se refiere al plan anterior del socio
    PlanActual INT,                                                             -- La clave foránea que se refiere al nuevo plan del socio
    FechaAltaPlanAnterior DATE,                                                 -- La fecha de alta del plan anterior
    BajaDefinitiva CHAR(1) CHECK (BajaDefinitiva IN ('S', 'N')),                -- Indica si se trata de una baja definitiva ('S' para sí, 'N' para no)
    CONSTRAINT fk_historico_socio FOREIGN KEY (ID_Socio) REFERENCES Socios(ID_Socio),
    CONSTRAINT fk_plan_anterior FOREIGN KEY (PlanAnterior) REFERENCES Planes(ID),
    CONSTRAINT fk_plan_actual FOREIGN KEY (PlanActual) REFERENCES Planes(ID)
);


CREATE TABLE Actividades (
    IdActividad INT PRIMARY KEY,
    Actividad VARCHAR2(255),
    Descripcion VARCHAR2(1000),
    Nivel VARCHAR2(50) CHECK (Nivel IN ('Inicial', 'Básico', 'Intermedio', 'Avanzado')),
    DuracionSesion INT,                                                         -- Duración de la sesión en minutos
    CertificadoOficial CHAR(1) CHECK (CertificadoOficial IN ('S', 'N')),
    CertificadoCurso CHAR(1) CHECK (CertificadoCurso IN ('S', 'N')),
    Presencial CHAR(1) CHECK (Presencial IN ('S', 'N')),
    MaterialesPropios CHAR(1) CHECK (MaterialesPropios IN ('S', 'N')),
    Observaciones VARCHAR2(1000)
);

CREATE TABLE Horarios (
    IdHorario INT PRIMARY KEY,
    IdActividad INT NOT NULL,
    Sala VARCHAR2(255) NOT NULL,
    Fecha DATE NOT NULL,
    Hora VARCHAR2(5) NOT NULL, -- Formato 'HH24:MI'
    Profesor VARCHAR2(255),
    Observaciones VARCHAR2(1000),
    CONSTRAINT fk_horario_actividad FOREIGN KEY (IdActividad) REFERENCES Actividades (IdActividad)
);

CREATE TABLE Profesores (
    Id_Profesor INT PRIMARY KEY,
    Nombre VARCHAR2(255),
    Apellido1 VARCHAR2(255),
    Apellido2 VARCHAR2(255),
    FechaNacimiento DATE,
    Formacion VARCHAR2(1000)
);

/*Con las tablas Instalaciones y actividades permitidas se lleva un registro detallado 
de que activiades estan disponibles para cada tipo de plan*/
CREATE TABLE Instalaciones (
    IdInstalacion INT PRIMARY KEY,
    Zona VARCHAR2(50) CHECK (Zona IN ('24h', 'Estándar')), -- Restricción para los tipos de zona
    Nombre VARCHAR2(255),
    Descripcion VARCHAR2(1000),
    TamanoM2 INT,
    Aforo INT
);
CREATE TABLE ActividadesPermitidas (
    IdPlan INT,
    IdActividad INT,
    CONSTRAINT fk_actividad_plan FOREIGN KEY (IdPlan) REFERENCES Planes (ID),
    CONSTRAINT fk_actividad_actividades FOREIGN KEY (IdActividad) REFERENCES Actividades (IdActividad),
    CONSTRAINT pk_actividadesPermitidas PRIMARY KEY (IdPlan, IdActividad)
);

CREATE TABLE Seguimiento(
    IdSeguimiento INT PRIMARY KEY,                                              -- Identificador único de cada registro de seguimiento
    IdSocio INT NOT NULL,                                                       -- Clave foránea que referencia al socio que recibe el seguimiento
    FechaActividad DATE NOT NULL,                                               -- Fecha en la que se realizó la actividad de seguimiento
    NotaObtenida NUMBER(3,1),                                                   -- Nota obtenida en la actividad, puede ser NULL si aún no se ha asignado una nota
    CONSTRAINT fk_seguimiento_socio FOREIGN KEY (IdSocio) REFERENCES Socios (ID_Socio)
);

CREATE SEQUENCE profesor_seq START WITH 1;
/*Añadimos la columna Id_Profesor a la tabla Horarios
de esta manera cada registro en la tabla horarios se vinculara a un unico profesor*/
ALTER TABLE Horarios ADD (
    Id_Profesor INT,
    CONSTRAINT fk_horario_profesor FOREIGN KEY (Id_Profesor) REFERENCES Profesores (Id_Profesor)
);

--Se crea una secuencia para los ID de seguimiento
CREATE SEQUENCE seguimiento_seq START WITH 1;

/*------------------------------------------------------------------------------
--------------------------------------------------------------------------------
                En Esta seccion del codigo se generan todos los disparadores
--------------------------------------------------------------------------------
------------------------------------------------------------------------------*/

/*Para asegurar de que no se solapen las horas lo hare con un disparador
Se realiza la consulta de los horarios existentes y se compara con el horario que 
se quiere introducir. Si se produce un solapamiento se lanza un error con el comando RAISE_APPLICATIN_Error*/
CREATE SEQUENCE horario_seq START WITH 1;
/*To_date(Fecha ||''||Hora....) lo convierte la cadena concatenada en un valor que oracle lo puede comparar
NUMTODSINTERVAL(....) de la Tabla Actividades--> atributo Duracionsesion convierte ese valor  a un intervalo de tiempo 
para que se pueda añadir o restar a una fecha/hora*/
CREATE OR REPLACE TRIGGER trg_check_overlap
BEFORE INSERT OR UPDATE ON Horarios
FOR EACH ROW
DECLARE
    v_count INT;
    v_duracion INT;
BEGIN
    -- Se obtiene la duración de la sesión de la tabla Actividades para el ID de actividad correspondiente
    SELECT DuracionSesion INTO v_duracion FROM Actividades WHERE IdActividad = :NEW.IdActividad;

    -- Se calcula si existen registros que representen un solapamiento con el nuevo horario
    SELECT COUNT(*)
    INTO v_count
    FROM Horarios h
    WHERE h.Sala = :NEW.Sala
    AND h.Fecha = :NEW.Fecha
    AND h.IdHorario != :NEW.IdHorario -- Se excluye el horario actual en caso de actualización
    AND NOT (
        TO_DATE(TO_CHAR(h.Fecha, 'YYYY-MM-DD') || ' ' || h.Hora, 'YYYY-MM-DD HH24:MI') >= TO_DATE(TO_CHAR(:NEW.Fecha, 'YYYY-MM-DD') || ' ' || :NEW.Hora, 'YYYY-MM-DD HH24:MI') + NUMTODSINTERVAL(v_duracion, 'MINUTE')
        OR
        TO_DATE(TO_CHAR(h.Fecha, 'YYYY-MM-DD') || ' ' || h.Hora, 'YYYY-MM-DD HH24:MI') + NUMTODSINTERVAL((SELECT DuracionSesion FROM Actividades WHERE IdActividad = h.IdActividad), 'MINUTE') <= TO_DATE(TO_CHAR(:NEW.Fecha, 'YYYY-MM-DD') || ' ' || :NEW.Hora, 'YYYY-MM-DD HH24:MI')
    );

    -- Si se encontró al menos un registro que se solape, lanzar un error
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Solapamiento de horario en la misma sala.');
    END IF;
END;


/*--------------------------------------------------------------------------------
------------------------------------------------------------------------------*/



/*En esta seccion hacemos un disparador para que la tabla histrial se actalice si un 
ID_Plan seda de baja definitivamente con el valor NULL*/
CREATE OR REPLACE TRIGGER trg_after_plan_drop
AFTER UPDATE OF ID_Plan ON Socios
FOR EACH ROW
WHEN (OLD.ID_Plan IS NOT NULL AND NEW.ID_Plan IS NULL)
BEGIN
    INSERT INTO HistoricoPlanesSocios (
        ID_Historico, ID_Socio, FechaCambio, PlanAnterior, PlanActual, FechaAltaPlanAnterior, BajaDefinitiva
    ) VALUES (
        historico_seq.NEXTVAL, :OLD.ID_Socio, SYSDATE, :OLD.ID_Plan, NULL, :OLD.FechaAlta, 'S'
    );
END;

/*------------------------------------------------------------------------------
------------------------------------------------------------------------------*/

/*Secuencia para crear el ID_Socio automaticamente por sistema.
CREATE SEQUENCE es para crear la secuencia con el nombre socio_seq
START WITH 1 indica que la secuencia comienza siempre con el valor 1*/
CREATE SEQUENCE socio_seq START WITH 1;                                         
CREATE OR REPLACE TRIGGER Socios_before_insert                                  --Crea o reemplaza un disparador existente llamado Socios_before_insert
BEFORE INSERT ON Socios                                                         --Especifica que el disparador se ejecute antes de la operacion de insercion en la tabla SOCIOS
FOR EACH ROW                                                                    --Indica que el disparador se ejecutara sobre cada linea que se inserte
BEGIN
    SELECT socio_seq.NEXTVAL INTO :new.ID_Socio FROM dual;                      -- Selecciona el siguiente valor de la secuencia 'socio_seq' y lo asigna a 'ID_Socio' de la nueva fila
                                                                                -- ':new' es un pseudoregistro que representa la nueva fila que se está insertando
END;

/*------------------------------------------------------------------------------
------------------------------------------------------------------------------*/

CREATE SEQUENCE historico_seq START WITH 1;

/*Esta seccion es un disparador para que la tabla de historial se actualice automaticamente 
cada vez que hay cambion en el ID_PLAN de la tabla de socios*/
CREATE OR REPLACE TRIGGER trg_after_plan_change
AFTER UPDATE OF ID_Plan ON Socios
FOR EACH ROW
WHEN (OLD.ID_Plan IS NOT NULL AND NEW.ID_Plan IS NOT NULL AND OLD.ID_Plan <> NEW.ID_Plan)
BEGIN
    INSERT INTO HistoricoPlanesSocios (
        ID_Historico, ID_Socio, FechaCambio, PlanAnterior, PlanActual, FechaAltaPlanAnterior, BajaDefinitiva
    ) VALUES (
        historico_seq.NEXTVAL, :OLD.ID_Socio, SYSDATE, :OLD.ID_Plan, :NEW.ID_Plan, :OLD.FechaAlta, 'N'
    );
END;

