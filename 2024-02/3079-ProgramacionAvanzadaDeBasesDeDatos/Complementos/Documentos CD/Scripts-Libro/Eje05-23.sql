USE QhatuPERU
go

CREATE TABLE Empleado(
	IdEmpleado int PRIMARY KEY,
	Apellido varchar(30) not null,
	HaberBasico money not null,
	PorcentajeComision decimal(3,1) null )
go

INSERT INTO Empleado
	VALUES(1, 'CASTRO ARENAS', 1200, 5)
INSERT INTO Empleado
	VALUES(2, 'LUNA ESPEJO', 1000, 10)
INSERT INTO Empleado
	VALUES(3, 'SOTO BUENO', 1400, NULL)
INSERT INTO Empleado
	VALUES(4, 'MARQUEZ ARIZAGA', 1500, NULL)
INSERT INTO Empleado
	VALUES(5, 'DAVILA SANCHEZ', 1200, 7.5)
go

SELECT idEmpleado, apellido, haberBasico,
	porcentajeComision
FROM Empleado
WHERE porcentajeComision IS NOT NULL
go



