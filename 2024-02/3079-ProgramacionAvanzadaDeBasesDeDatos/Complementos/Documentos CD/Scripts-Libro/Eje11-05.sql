USE Pruebas
go

CREATE TABLE Padre(
	codPadre int PRIMARY KEY,
	nomPadre varchar(15) not null )

CREATE TABLE Hijo(
	codHijo int PRIMARY KEY,
	nomHijo varchar(15) not null,
	codPadre int not null FOREIGN KEY
	REFERENCES Padre )
go

BEGIN TRANSACTION
	INSERT INTO Padre VALUES(100, 'Juan')
		IF (@@error <> 0) GOTO hayError
	INSERT INTO Hijo VALUES(101, 'Pedro', 99)
	-- padre 99 no existe
		IF (@@error <> 0) GOTO hayError
COMMIT TRANSACTION
RETURN
hayError:
ROLLBACK TRANSACTION
go

SELECT * FROM Padre
SELECT * FROM Hijo
go



