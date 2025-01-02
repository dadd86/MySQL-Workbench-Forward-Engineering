MySQL Workbench Forward Engineering
Project Overview
This project demonstrates the forward engineering process in MySQL Workbench, which includes creating and managing a comprehensive database schema for managing various aspects of a co-working space. 
The schema includes tables related to activities, plans, members (socios), installations, schedules, and several other associated entities. The operations also involve creating triggers, 
stored procedures, and users, as well as performing various queries to manipulate and manage data.

Database Schema
Tables
Actividades: Stores data related to different activities offered in the co-working space, including their description, difficulty level, duration, and whether they are certified.
Planes: Contains information about membership plans, including the type of membership, registration fees, monthly quotas, and related activities.
Socios: Stores details of the members (individuals) of the co-working space, including personal information, plan subscription, and contact details.
TCoporativo: Links corporate clients to the members (socios) who belong to the corporate plan.
TAutonomo: Stores data for individual self-employed members, such as their bank account information.
RegistrosEmpresas: Maintains the record of companies that have subscribed to the services of the co-working space.
AuditTrail: Keeps track of any changes made to members' subscriptions, especially in terms of plan changes.
Profesores: Contains information about instructors teaching various activities in the co-working space.
Horarios: Tracks the schedule of activities, including the date, time, instructor, and location.
Instalacion: Stores information regarding the physical locations or rooms within the co-working space, including their size and capacity.
ActividadesPermitidas: Links activities to specific plans and installations where they can take place.
Seguimiento: Tracks progress of members in various activities, including their obtained scores or feedback.

Procedures and Triggers
InsertarHorario: A stored procedure that inserts a new schedule entry for an activity, ensuring that there are no conflicts in room bookings.
Socios_AFTER_INSERT: A trigger that ensures when a new member joins, they are automatically added to the relevant table (either TAutonomo or TCoporativo) based on their plan type.

User Management
CoWorkAdmin: A user created with administrative privileges over the entire database, allowing them to manage the database and create new users.
Supervisor: A user created for managing specific activities and schedules, with limited permissions over certain tables.
Contable: A user with permissions related to plans and financial data, such as fees and member subscriptions.
Transaction Management: Several transaction-based operations are used to manage data, ensuring that changes are only committed if all conditions are met.

Example Use Cases
Case 1: Selects all companies with an active subscription to the co-working space, ordering them by company name.
Case 2: Retrieves activities that offer an official certificate and are not presencial.
Case 3: Updates the monthly quota of certain plans based on the registration fee.
Case 4: Demonstrates how to insert new members while checking for duplicate records and ensures the process is atomic using transactions.

SQL Operations
Table Creation: The schema is created using CREATE TABLE statements. Each table has relationships defined using foreign keys, ensuring data integrity.
Data Insertion: Several INSERT INTO statements are provided to populate the tables with initial data. These include membership, activities, and schedule records.
Complex Queries: The SQL queries cover various scenarios like retrieving member data, counting the number of activities conducted by each professor, and calculating the total monthly fee for each plan.
Transaction Handling: SQL transactions (START TRANSACTION, COMMIT, ROLLBACK) are used to ensure that changes to the database are safely applied and can be undone if necessary.

Security and Permissions
User Permissions: The GRANT and REVOKE commands are used to manage access for different users. Permissions are carefully assigned to ensure users only have access to the data they need, based on their roles (admin, supervisor, accountant).
Foreign Key Constraints: Foreign keys are defined across tables to maintain referential integrity, preventing orphaned records and ensuring the data is consistent.

Setup and Configuration
MySQL Setup: The schema and data can be loaded into MySQL Workbench, and the necessary configurations are set, including character set and SQL modes.
User Creation: The CREATE USER statements define users with specific roles and permissions to access and manage the database.

Conclusion
This project demonstrates how to build a relational database for managing a co-working space using MySQL. It includes all essential components like table creation, 
data insertion, and user management, along with transaction handling to ensure data integrity. By following the steps outlined in this project, 
you can implement a similar database schema for any co-working or membership-based business model.