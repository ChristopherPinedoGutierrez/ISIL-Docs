USE QhatuPERU
go

-- Consulta autojoin, creación de la tabla con autorelación
CREATE TABLE Trabajador(
	idTrabajador int PRIMARY KEY,
	Apellidos varchar(30) not null,
	Jefe int null )
go

ALTER TABLE Trabajador
	ADD CONSTRAINT fk_Trabajador_Trabajador
	FOREIGN KEY(Jefe)
	REFERENCES Trabajador
go

INSERT INTO Trabajador VALUES(102, 'Ardiles Soto', NULL)
INSERT INTO Trabajador VALUES(101, 'Camacho Saravia', 102)
INSERT INTO Trabajador VALUES(105, 'Vilchez Santos', 102)
INSERT INTO Trabajador VALUES(103, 'Sánchez Aliaga', 101)
INSERT INTO Trabajador VALUES(104, 'Castro Avila', 101)
INSERT INTO Trabajador VALUES(107, 'Urrunaga Tapia', 101)
INSERT INTO Trabajador VALUES(106, 'Juárez Pinto', 105)
go

SELECT * FROM Trabajador
go

SELECT T1.idTrabajador, T1.apellidos, T2.apellidos AS Jefe
FROM Trabajador T1 INNER JOIN Trabajador T2
	ON T1.jefe = T2.idTrabajador
go

SELECT T1.idTrabajador, T1.apellidos, T2.apellidos AS Jefe
FROM Trabajador T1 LEFT OUTER JOIN Trabajador T2
	ON T1.jefe = T2.idTrabajador
go



