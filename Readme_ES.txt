MySQL Workbench Forward Engineering
Este archivo SQL contiene el script de Forward Engineering generado con MySQL Workbench para crear la base de datos "mydb" y sus correspondientes tablas, procedimientos almacenados y triggers. El propósito de este script es establecer la estructura de la base de datos para su implementación en un servidor MySQL, permitiendo gestionar los datos de una plataforma de suscripción para una empresa o gimnasio, entre otras funcionalidades.

Descripción de la Base de Datos
Esquema mydb
Se crea el esquema de base de datos "mydb" con el conjunto de caracteres utf8.
Se utilizan varias tablas interrelacionadas para gestionar información de actividades, planes, socios, profesores, instalaciones, horarios y más.

Tablas en la Base de Datos
1. Actividades
	Descripción: Almacena la información de las actividades que se ofrecen (por ejemplo, yoga, informática).
	Campos: ID de actividad, nombre de actividad, descripción, nivel, duración de sesión, certificados, etc.
2. Planes
	Descripción: Define los planes disponibles para los socios (por ejemplo, plan básico, plan corporativo).
	Campos: ID del plan, nombre del plan, tipo de socio, matrícula, cuota mensual, descripción, actividad asociada, etc.
3. Socios
	Descripción: Información sobre los socios (por ejemplo, nombre, contacto, fecha de alta, plan asignado).
	Campos: ID del socio, documento de identidad, nombre, dirección, fecha de nacimiento, teléfono, correo electrónico, observaciones, etc.
4. T_Corporativo y T_Autonomo
	Descripción: Almacenan información adicional de socios según su tipo (corporativos o autónomos).
	Campos: ID del socio, NIF de empresa para socios corporativos, número de cuenta y banco para autónomos.
5. RegistrosEmpresas
	Descripción: Registra las empresas asociadas a los socios, especialmente para los socios corporativos.
	Campos: ID de registro, NIF de la empresa, ID del plan, nombre de la empresa, fecha de inicio y finalización del convenio, etc.
6. AuditTrail
	Descripción: Guarda los cambios en los planes de los socios.
	Campos: ID del historial, ID del socio, fecha de cambio, plan anterior y actual, etc.
7. Profesores
	Descripción: Información sobre los profesores que imparten actividades.
	Campos: ID del profesor, nombre, apellidos, fecha de nacimiento, formación, etc.
8. Horarios
	Descripción: Gestiona los horarios de las actividades que se realizan.
	Campos: ID de actividad, ID de instalación, ID de profesor, fecha y hora, observaciones, etc.
9. Instalación
	Descripción: Detalles sobre las instalaciones donde se realizan las actividades.
	Campos: ID de instalación, zona, nombre, descripción, tamaño, aforo, etc.
10. ActividadesPermitidas
	Descripción: Define las actividades permitidas en cada instalación.
	Campos: ID de actividad, ID de plan, ID de actividad permitida, ID de instalación.
11. Seguimiento
	Descripción: Realiza un seguimiento de los socios sobre las actividades que han realizado.
	Campos: ID de seguimiento, ID del socio, fecha de realización, nota obtenida.

Procedimientos Almacenados
Procedimiento InsertarHorario
Este procedimiento se utiliza para insertar horarios para las actividades. Verifica si hay solapamientos con otros horarios en la misma sala y fecha. Si no hay solapamientos, inserta el nuevo horario. Si hay solapamientos, lanza un error.

Trigger Socios_AFTER_INSERT
Este trigger se activa después de insertar un nuevo socio y maneja la inserción automática en las tablas de TAutonomo o TCoporativo, según el tipo de socio.

Casos de Uso
Caso 1: Consultas de Empresas y Actividades
Realiza consultas para obtener información sobre empresas y sus actividades asociadas.

Caso 2: Actualización de Cuotas
Permite actualizar la cuota mensual de los planes con un precio de matrícula inferior a un valor especificado.

Caso 3: Gestión de Socios
Registra nuevos socios en la base de datos, realiza comprobaciones y actualizaciones en las tablas correspondientes.

Caso 4: Eliminación de Registros Duplicados
Detecta y elimina registros duplicados en la tabla socio.

Caso 5: Transacciones y Control de Errores
Realiza transacciones para insertar socios, comprobar la existencia de empresas y actualizar las tablas de manera segura.

Instalación y Uso
Requisitos:

MySQL 8.0 o superior.
Herramienta de administración de bases de datos como MySQL Workbench.
Ejecución:

Cargar el script SQL en MySQL Workbench o en tu consola MySQL.
Ejecutar el script para crear las tablas y procedimientos almacenados en la base de datos.
Configuración:

Modificar las credenciales de acceso según sea necesario.
Asegúrate de tener configurados los privilegios necesarios para la ejecución de los procedimientos y triggers.
Contribuciones
Las contribuciones son bienvenidas. Si deseas mejorar este proyecto o agregar nuevas funcionalidades, por favor abre un pull request.