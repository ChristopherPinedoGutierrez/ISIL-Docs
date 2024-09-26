USE master
go

CREATE DATABASE DBPrueba2
ON PRIMARY(
	NAME = DBPrueba2_data ,
	FILENAME = 'D:\SQLServer2012\Data\DBPrueba2.mdf' ,
	SIZE = 8MB ,
	MAXSIZE = 15MB,
	FILEGROWTH = 1MB )
LOG ON(
	NAME = DBPrueba2_log ,
	FILENAME = 'D:\SQLServer2012\Data\DBPrueba2_log.ldf' ,
	SIZE = 3MB ,
	MAXSIZE = 8MB,
	FILEGROWTH = 10% )
go

SELECT name FROM sysdatabases
go
