USE master;
GO

IF DB_ID('Facultad') IS NOT NULL
BEGIN
	ALTER DATABASE Facultad
	SET SINGLE_USER 
	WITH ROLLBACK IMMEDIATE
    DROP DATABASE Facultad;
    PRINT 'Base de datos eliminada correctamente.';
END
ELSE
BEGIN
    PRINT 'La base de datos no existe.';
END

CREATE DATABASE Facultad;
GO

USE Facultad;
GO

CREATE TABLE Carrera (
    codCarrera SMALLINT CONSTRAINT PK_Carrera PRIMARY KEY,
    nomCarrera VARCHAR(75) NOT NULL UNIQUE,
    fecCreacion DATE NOT NULL
);
GO

CREATE TABLE Curso (
    codCurso INT CONSTRAINT PK_Curso PRIMARY KEY,
    nomCurso VARCHAR(75) NOT NULL UNIQUE,
    creditos TINYINT NOT NULL
);
GO

CREATE TABLE MallaCurricular (
    codCarrera SMALLINT NOT NULL,
    codCurso INT NOT NULL,
    ciclo TINYINT NOT NULL,
    codPreRequisito INT NULL,
    CONSTRAINT PK_MallaCurricular PRIMARY KEY (codCarrera, codCurso),
    CONSTRAINT FK_MallaCurricular_Carrera FOREIGN KEY (codCarrera) REFERENCES Carrera(codCarrera),
    CONSTRAINT FK_MallaCurricular_Curso FOREIGN KEY (codCurso) REFERENCES Curso(codCurso),
    CONSTRAINT FK_MallaCurricular_CursoPre FOREIGN KEY (codPreRequisito) REFERENCES Curso(codCurso)
);
GO

CREATE TABLE Profesor (
    codProfesor INT NOT NULL,
    apellido VARCHAR(35) NOT NULL,
    nombre VARCHAR(35) NOT NULL,
    tipoDoc VARCHAR(5) NOT NULL DEFAULT 'DNI',
    numDoc VARCHAR(10) NOT NULL,
	CONSTRAINT PK_Profesor PRIMARY KEY (codProfesor)
);
GO

CREATE TABLE Asignacion (
    codCurso INT NOT NULL,
    codProfesor INT NOT NULL,
    diaSemana CHAR(2) NULL CHECK (diaSemana IN ('LU', 'MA', 'MI', 'JU', 'VI', 'SA')),
    horaInicio TINYINT NULL CHECK (horaInicio BETWEEN 7 AND 20),
    horaFin TINYINT NULL,
	CONSTRAINT CK_Horario CHECK (horaFin <= 22 AND horaFin > horaInicio),
    CONSTRAINT PK_Asignacion PRIMARY KEY (codCurso, codProfesor),
    CONSTRAINT FK_Asignacion_Curso FOREIGN KEY (codCurso) REFERENCES Curso(codCurso),
    CONSTRAINT FK_Asignacion_Profesor FOREIGN KEY (codProfesor) REFERENCES Profesor(codProfesor)
);
GO
