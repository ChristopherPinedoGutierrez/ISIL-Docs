/**
 *
 * DBMS           :  SQL Server
 * Base de Datos  :  EDUCA
 * Descripción    :  Base de Datos de control academico sencillo
 * Script         :  Crea la Base de Datos
 * Creao por      :  Ing. Eric Gustavo Coronel Castillo
 * Email          :  gcoronelc@gmail.com
 * Web site       :  http://gcoronelc.blogspot.com
 *
**/


-- ======================================================
-- CREA LA BASE DE DATOS
-- ======================================================

USE master
GO

IF( NOT EXISTS ( SELECT 1 FROM sys.sysdatabases WHERE name='EDUCA' ) )
BEGIN
	CREATE DATABASE EDUCA
END
GO

USE EDUCA
GO

-- ======================================================
-- ELIMINA TABLA
-- ======================================================

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='PAGO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.PAGO
END

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='MATRICULA' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.MATRICULA
END

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='CURSO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.CURSO
END

IF( EXISTS ( SELECT 1 FROM sys.sysobjects 
	WHERE name='ALUMNO' and xtype = 'u') )
BEGIN
	DROP TABLE dbo.ALUMNO
END

-- ======================================================
-- TABLA CURSO
-- ======================================================

CREATE TABLE dbo.CURSO(
	cur_id INT NOT NULL IDENTITY(1,1),
	cur_nombre VARCHAR(100) NOT NULL,
	cur_vacantes SMALLINT NOT NULL,
	cur_matriculados SMALLINT NOT NULL
		CONSTRAINT df_curso_matriculados DEFAULT 0,
	cur_profesor VARCHAR(100) NULL,
	cur_precio MONEY NOT NULL
)
GO

-- ======================================================
-- TABLA ALUMNO
-- ======================================================

CREATE TABLE dbo.ALUMNO(
	alu_id INT NOT NULL IDENTITY(1,1),
	alu_nombre VARCHAR(100) NOT NULL,
	alu_direccion VARCHAR(100) NOT NULL,
	alu_telefono VARCHAR(20) NULL,
	alu_email VARCHAR(50) NULL
)
GO

-- ======================================================
-- TABLA MATRICULA
-- ======================================================

CREATE TABLE dbo.MATRICULA(
	cur_id INT NOT NULL,
	alu_id INT NOT NULL,
	mat_fecha DATETIME NOT NULL,
	mat_precio MONEY NOT NULL,
	mat_cuotas SMALLINT NOT NULL,
	mat_nota SMALLINT NULL
)
GO

-- ======================================================
-- TABLA PAGO
-- ======================================================

CREATE TABLE dbo.PAGO(
	cur_id INT NOT NULL,
	alu_id INT NOT NULL,
	pag_cuota SMALLINT NOT NULL,
	pag_fecha DATE NOT NULL,
	pag_importe MONEY NOT NULL
)
GO


-- ======================================================
-- RESTRICCIONES DE LA TABLA CURSO
-- ======================================================

-- CLAVE PRIMARIA

ALTER TABLE dbo.curso
	ADD CONSTRAINT pk_curso
	PRIMARY KEY( cur_id )
GO

-- El nombre del curso es único

ALTER TABLE dbo.curso
	ADD CONSTRAINT u_curso_nombre
	UNIQUE( cur_nombre )
GO

-- Vacantes mayor que cero

ALTER TABLE dbo.curso
	ADD CONSTRAINT chk_curso_vacantes
	CHECK( cur_vacantes > 0 )
GO

-- Matriculados mayor o igual que cero, y menor o igual que las vacantes

ALTER TABLE dbo.curso
	ADD CONSTRAINT chk_curso_matriculados
	CHECK( cur_matriculados >= 0 AND cur_matriculados <= cur_vacantes )
GO

-- Precio mayor que cero
ALTER TABLE dbo.curso
	ADD CONSTRAINT chk_curso_precio
	CHECK( cur_precio > 0 )
GO

-- Insertar Datos
INSERT INTO dbo.CURSO(cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES('SQL Server Implementación',24,1000.0,'Gustavo coronel');
GO

INSERT INTO dbo.CURSO(cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES('SQL Server Administración',24,1000.0,'Gustavo coronel');
GO

INSERT INTO dbo.CURSO(cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES('Inteligencia de Negocios',24,1500.0,'Sergio Matsukawa');
GO

INSERT INTO dbo.CURSO(cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES('Programación Transact-SQL',24,1200.0,NULL);
GO

INSERT INTO dbo.CURSO(cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES('Java Fundamentos',24,1600.0,'Gustavo Coronel');
GO

INSERT INTO dbo.CURSO(cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES('Java Cliente-Servidor',30,1600.0,'Gustavo Coronel');
GO

INSERT INTO dbo.CURSO(cur_nombre,cur_vacantes,cur_precio,cur_profesor)
VALUES('Java Web',30,1800.0,NULL);
GO

-- ======================================================
-- RESTRICCIONES DE LA TABLA ALUMNO
-- ======================================================

ALTER TABLE dbo.ALUMNO
	ADD CONSTRAINT PK_ALUMNO
	PRIMARY KEY ( ALU_ID)
GO

ALTER TABLE dbo.ALUMNO
	ADD CONSTRAINT U_ALUMNO_EMAIL
	UNIQUE( ALU_EMAIL )
GO

ALTER TABLE dbo.ALUMNO
ADD CONSTRAINT U_ALUMNO_NOMBRE
UNIQUE( ALU_NOMBRE )
GO

INSERT INTO dbo.ALUMNO 
VALUES( 'YESENIA VIRHUEZ','LOS OLIVOS','986412345','yesenia@hotmail.com')
go
INSERT INTO dbo.ALUMNO 
VALUES( 'OSCAR ALVARADO FERNANDEZ','MIRAFLORES',NULL,'oscar@gmail.com')
go
INSERT INTO dbo.ALUMNO 
VALUES( 'GLADYS REYES CORTIJO','SAN BORJA','875643562','gladys@hotmail.com')
go
INSERT INTO dbo.ALUMNO 
VALUES( 'SARA RIEGA FRIAS','SAN ISIDRO',NULL,'sara@yahoo.com')
go
INSERT INTO dbo.ALUMNO 
VALUES( 'JHON VELASQUEZ DEL CASTILLO','LOS OLIVOS','78645345','jhon@movistar.com')
go
INSERT INTO dbo.ALUMNO 
VALUES( 'MARIA EULALIA VELASQUEZ TORVISCO','SURCO','6573456','mvelasques@gmail.com')
go
INSERT INTO dbo.ALUMNO 
VALUES( 'FIORELLA LIZET VITELLA REYES','SAN BORJA','5468790','fvitela@outlook.com')
go

-- ======================================================
-- RESTRICCIONES DE LA TABLA MATRICULA
-- ======================================================

ALTER TABLE dbo.MATRICULA
	ADD CONSTRAINT PK_MATRICULA
	PRIMARY KEY( CUR_ID, ALU_ID)
GO

ALTER TABLE dbo.MATRICULA
	ADD CONSTRAINT FK_MATRICULA_CURSO
	FOREIGN KEY (CUR_ID)
	REFERENCES CURSO
GO

ALTER TABLE dbo.MATRICULA
	ADD CONSTRAINT FK_MATRICULA_ALUMNO
	FOREIGN KEY (ALU_ID)
	REFERENCES ALUMNO
GO

ALTER TABLE dbo.MATRICULA
	ADD CONSTRAINT CHK_MATRICULA_PRECIO
	CHECK( MAT_PRECIO >= 0.0 )
GO

ALTER TABLE dbo.MATRICULA
	ADD CONSTRAINT CHK_MATRICULA_CUOTAS
	CHECK( MAT_CUOTAS > 0 )
GO

SET DATEFORMAT DMY
GO

INSERT INTO dbo.MATRICULA
VALUES(1, 5,'15-04-' + cast(year(getdate()) as varchar) +' 10:30',800.0,1,15)
GO

INSERT INTO dbo.MATRICULA
VALUES(1, 3,'16-04-' + cast(year(getdate()) as varchar) +' 11:45',1000.0,2,18)
GO

INSERT INTO dbo.MATRICULA
VALUES(1, 4,'18-04-' + cast(year(getdate()) as varchar) +' 08:33',1200.0,3,12)
GO

INSERT INTO dbo.MATRICULA
VALUES(2, 1,'15-04-' + cast(year(getdate()) as varchar) +' 12:33',800.0,1,16)
GO

INSERT INTO dbo.MATRICULA
VALUES(2, 2,'01-05-' + cast(year(getdate()) as varchar) +' 15:34',1000.0,2,10)
GO

INSERT INTO dbo.MATRICULA
VALUES(2, 3,'03-05-' + cast(year(getdate()) as varchar) +' 16:55',1300.0,3,14)
GO

INSERT INTO dbo.MATRICULA
VALUES(2, 4,'04-05-' + cast(year(getdate()) as varchar) +' 17:00',400.0,1,18)
GO

INSERT INTO dbo.MATRICULA
VALUES(2, 5,'06-05-' + cast(year(getdate()) as varchar) +' 13:12',750.0,1,17)
GO

-- ======================================================
-- Actualizar la columna matriculados en la tabla curso
-- ======================================================

UPDATE dbo.CURSO
SET cur_matriculados = (
	SELECT COUNT(*) FROM dbo.MATRICULA
	WHERE dbo.MATRICULA.cur_id = dbo.CURSO.cur_id
)
GO

-- ======================================================
-- RESTRICCIONES EN LA TABLA PAGO
-- ======================================================

-- Clave Primaria

ALTER TABLE dbo.PAGO
	ADD CONSTRAINT PK_PAGO
	PRIMARY KEY(cur_id,alu_id,pag_cuota)
GO

-- Clave Foránea

ALTER TABLE dbo.PAGO
	ADD CONSTRAINT FK_PAGO_MATRICULA
	FOREIGN KEY(cur_id,alu_id)
	REFERENCES matricula;
GO

-- Cargar Datos

set dateformat dmy
go

declare @anio varchar(10)
set @anio = cast(year(getdate()) as varchar)
insert into dbo.PAGO values(1,3,1,'16-04-' + @anio,500)
insert into dbo.PAGO values(1,3,2,'16-05-' + @anio,500)
insert into dbo.PAGO values(1,4,1,'18-04-' + @anio,400)
insert into dbo.PAGO values(1,4,2,'18-05-' + @anio,400)
insert into dbo.PAGO values(2,1,1,'15-04-' + @anio,800)
insert into dbo.PAGO values(2,2,1,'01-05-' + @anio,500)
insert into dbo.PAGO values(2,3,1,'03-05-' + @anio,430)
insert into dbo.PAGO values(2,3,2,'03-06-' + @anio,430)
insert into dbo.PAGO values(2,4,1,'04-05-' + @anio,400)
insert into dbo.PAGO values(2,5,1,'06-05-' + @anio,750)
go

-- ======================================================
-- FIN
-- ======================================================

select * from dbo.ALUMNO
select * from dbo.CURSO
select * from dbo.MATRICULA
select * from dbo.PAGO
go
