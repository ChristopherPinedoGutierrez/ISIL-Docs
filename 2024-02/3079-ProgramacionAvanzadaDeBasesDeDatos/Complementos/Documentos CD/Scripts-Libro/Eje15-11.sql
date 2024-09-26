USE master
go

CREATE LOGIN [smatsukawa-lap\jperez] FROM Windows
go

USE Northwind
go

CREATE USER jperez FOR LOGIN [smatsukawa-lap\jperez]
go

ALTER LOGIN [SMATSUKAWA-LAP\jperez]
	WITH DEFAULT_DATABASE = Northwind
go

sp_addrolemember db_datareader, jperez
go

GRANT INSERT, UPDATE, DELETE ON Categories
	TO jperez
go

DENY SELECT ON Employees TO jperez
go

