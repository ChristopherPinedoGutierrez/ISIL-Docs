USE QhatuPERU
go

CREATE TABLE TablaPrueba(
	campo1 INT NOT NULL ,
	campo2 CHAR(10) NOT NULL ,
	campo3 DATETIME NULL )
go

ALTER TABLE TablaPrueba
	ADD campo4 MONEY NULL
go

sp_help TablaPrueba
go

