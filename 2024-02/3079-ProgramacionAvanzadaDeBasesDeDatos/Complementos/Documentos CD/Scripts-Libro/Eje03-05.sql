USE QhatuPERU
go

ALTER TABLE TablaPrueba
	ADD campo5 VARCHAR(20) NOT NULL
go

INSERT INTO TablaPrueba 
	VALUES(1, 'RMM0123456', '19/03/2012', 1375.50, 'Rosa')
INSERT INTO TablaPrueba 
	VALUES(2, 'JCS9876543', '21/09/2012', 1250.50, 'Juvenal')
go

SELECT * FROM TablaPrueba
go

ALTER TABLE TablaPrueba
	ADD campo6 DECIMAL(12,3) NOT NULL
go
-- Error 4901: no se puede agregar una columna NOT NULL a una tabla que tiene datos

ALTER TABLE TablaPrueba
	ADD campo6 DECIMAL(12,3) NULL
go

UPDATE TablaPrueba SET campo6 = 123.456
	WHERE campo1 = 1
UPDATE TablaPrueba SET campo6 = 678.123
	WHERE campo1 = 2
go

ALTER TABLE TablaPrueba
	ALTER COLUMN campo6 DECIMAL(12,3) NOT NULL
go




