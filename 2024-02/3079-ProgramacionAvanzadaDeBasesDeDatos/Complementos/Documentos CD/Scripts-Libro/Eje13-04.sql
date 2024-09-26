USE QhatuPERU
go

-- Creación de la tabla Colaborador
CREATE TABLE Colaborador(
	IdColaborador int PRIMARY KEY,
	Nombre varchar(40) not null,
	IdSuperior int null )
go

INSERT INTO Colaborador 
	VALUES(1, 'Matsukawa Maeda, Sergio', NULL)
INSERT INTO Colaborador 
	VALUES(2, 'Coronel Castillo, Gustavo', 1)
INSERT INTO Colaborador 
	VALUES(3, 'Marcelo Villalobos, Ricardo', 1)
INSERT INTO Colaborador 
	VALUES(4, 'Henostroza Macedo, Guino', 1)
INSERT INTO Colaborador 
	VALUES(5, 'Lucho Lutgardo, Edgar', 2)
INSERT INTO Colaborador 
	VALUES(6, 'Flores Manco, Julio', 2)
INSERT INTO Colaborador 
	VALUES(7, 'Valencia Morales, Pedro', 3)
INSERT INTO Colaborador 
	VALUES(8, 'Carrasco Muñoz, Joel', 3)
INSERT INTO Colaborador 
	VALUES(9, 'Arista Arbildo, Nori', 3)
INSERT INTO Colaborador 
	VALUES(10, 'Becerra Florez, Ursula', 4)
INSERT INTO Colaborador 
	VALUES(11, 'Alcántara Cerna, Violeta', 7)
INSERT INTO Colaborador 
	VALUES(12, 'Zegarra Zavaleta, Daniel', 7)
INSERT INTO Colaborador 
	VALUES(13, 'Gonzales Villegas, Julio', 7)
INSERT INTO Colaborador 
	VALUES(14, 'Guerra Guerra, Jorge', 11)
go

-- Creación de la tabla DEPARTAMENTO
CREATE TABLE Departamento(
	idDepartamento int PRIMARY KEY,
	nombre varchar(30) not null,
	idResponsable int null FOREIGN KEY
	REFERENCES Colaborador )
go

INSERT INTO Departamento VALUES(1, 'Recursos Humanos', 2)
INSERT INTO Departamento VALUES(2, 'Marketing', 7)
INSERT INTO Departamento VALUES(3, 'Finanzas', 8)
INSERT INTO Departamento VALUES(4, 'Investigación', 9)
INSERT INTO Departamento VALUES(5, 'Capacitación', 4)
INSERT INTO Departamento VALUES(6, 'Logística', NULL)
go

SELECT * FROM Colaborador
go

SELECT * FROM Departamento
go
