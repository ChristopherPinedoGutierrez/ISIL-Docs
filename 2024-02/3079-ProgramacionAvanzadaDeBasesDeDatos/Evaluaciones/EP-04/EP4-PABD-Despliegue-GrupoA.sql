-- CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE ConstruyendoFuturo;
GO
USE ConstruyendoFuturo;
GO

-- TABLA: SEDE
CREATE TABLE Sede (
    codsede INT PRIMARY KEY,
    pais VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    nomdirector VARCHAR(150) NOT NULL
);
GO

-- TABLA: PROYECTO
CREATE TABLE Proyecto (
    codproyecto INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    fechainicio DATE NOT NULL,
    fechafin DATE NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL CHECK (presupuesto <= 100000),
    nombregestor VARCHAR(150) NOT NULL,
    codsede INT NOT NULL,
    FOREIGN KEY (codsede) REFERENCES Sede(codsede),
    CHECK (DATEDIFF(DAY, fechainicio, fechafin) <= 180)
);
GO

-- TABLA: POBLACION
CREATE TABLE Poblacion (
    codpoblacion INT PRIMARY KEY,
    nompoblacion VARCHAR(200) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    canthabitantes INT NOT NULL CHECK (canthabitantes BETWEEN 5000 AND 10000)
);
GO

-- TABLA INTERMEDIA: PROYECTO_POBLACION
CREATE TABLE Proyecto_Poblacion (
    codproyecto INT,
    codpoblacion INT,
    PRIMARY KEY (codproyecto, codpoblacion),
    FOREIGN KEY (codproyecto) REFERENCES Proyecto(codproyecto),
    FOREIGN KEY (codpoblacion) REFERENCES Poblacion(codpoblacion)
);
GO

-- TABLA: ACCION
CREATE TABLE Accion (
    codaccion INT PRIMARY KEY,
    codproyecto INT NOT NULL,
    codpoblacion INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    inversion DECIMAL(10, 2) NOT NULL CHECK (inversion <= 10000),
    FOREIGN KEY (codproyecto) REFERENCES Proyecto(codproyecto),
    FOREIGN KEY (codpoblacion) REFERENCES Poblacion(codpoblacion)
);
GO

-- INSERTAR DATOS DE PRUEBA
-- SEDE
INSERT INTO Sede VALUES (1, 'Perú', 'Lima', 'Av. Principal 123', '999888777', 'Juan Perez');
INSERT INTO Sede VALUES (2, 'Colombia', 'Bogotá', 'Calle 45 #12-34', '888777666', 'Maria Gomez');
INSERT INTO Sede VALUES (3, 'Chile', 'Santiago', 'Av. Providencia 567', '777666555', 'Carlos Núñez');
INSERT INTO Sede VALUES (4, 'México', 'Ciudad de México', 'Insurgentes Sur 890', '666555444', 'Elena Martínez');
INSERT INTO Sede VALUES (5, 'Argentina', 'Buenos Aires', 'Calle Corrientes 1234', '555444333', 'Roberto López');
GO

-- POBLACION
INSERT INTO Poblacion VALUES (1, 'Pueblo A', 'Perú', 6000);
INSERT INTO Poblacion VALUES (2, 'Pueblo B', 'Colombia', 7000);
INSERT INTO Poblacion VALUES (3, 'Pueblo C', 'Chile', 8000);
INSERT INTO Poblacion VALUES (4, 'Pueblo D', 'México', 9000);
INSERT INTO Poblacion VALUES (5, 'Pueblo E', 'Argentina', 7500);
GO

-- PROYECTO
INSERT INTO Proyecto VALUES ('Proyecto Agua', '2024-01-01', '2024-06-01', 80000, 'Luis Torres', 1);
INSERT INTO Proyecto VALUES ('Proyecto Salud', '2024-02-01', '2024-07-01', 95000, 'Ana Ruiz', 2);
INSERT INTO Proyecto VALUES ('Proyecto Educación', '2024-03-01', '2024-08-01', 85000, 'Pedro Sánchez', 3);
INSERT INTO Proyecto VALUES ('Proyecto Vivienda', '2024-04-01', '2024-09-01', 70000, 'Laura Gómez', 4);
INSERT INTO Proyecto VALUES ('Proyecto Alimentación', '2024-05-01', '2024-10-01', 90000, 'Jorge Ramírez', 5);
GO

-- PROYECTO_POBLACION
INSERT INTO Proyecto_Poblacion VALUES (1, 1);
INSERT INTO Proyecto_Poblacion VALUES (2, 2);
INSERT INTO Proyecto_Poblacion VALUES (3, 3);
INSERT INTO Proyecto_Poblacion VALUES (4, 4);
INSERT INTO Proyecto_Poblacion VALUES (5, 5);
GO

-- ACCION
INSERT INTO Accion VALUES (1, 1, 1, 'Construcción de un pozo', 5000);
INSERT INTO Accion VALUES (2, 2, 2, 'Campaña de vacunación', 8000);
INSERT INTO Accion VALUES (3, 3, 3, 'Construcción de escuela', 7000);
INSERT INTO Accion VALUES (4, 4, 4, 'Construcción de viviendas', 6000);
INSERT INTO Accion VALUES (5, 5, 5, 'Entrega de alimentos', 9000);
GO

-- CONSULTAS DE PRUEBA
-- 1. Listar proyectos y las sedes que los gestionan
SELECT Proyecto.titulo, Sede.nomdirector, Sede.pais
FROM Proyecto
JOIN Sede ON Proyecto.codsede = Sede.codsede;
GO

-- 2. Listar las poblaciones beneficiadas por cada proyecto
SELECT Proyecto.titulo, Poblacion.nompoblacion, Poblacion.canthabitantes
FROM Proyecto
JOIN Proyecto_Poblacion ON Proyecto.codproyecto = Proyecto_Poblacion.codproyecto
JOIN Poblacion ON Proyecto_Poblacion.codpoblacion = Poblacion.codpoblacion;
GO

-- 3. Total de inversión por proyecto
SELECT Proyecto.titulo, SUM(Accion.inversion) AS total_inversion
FROM Proyecto
JOIN Accion ON Proyecto.codproyecto = Accion.codproyecto
GROUP BY Proyecto.titulo;
GO

-- OBJETOS DEL LADO DEL SERVIDOR
-- FUNCION: Calcular el total de habitantes beneficiados por proyecto
CREATE FUNCTION TotalHabitantes(@codproyecto INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = SUM(Poblacion.canthabitantes)
    FROM Proyecto_Poblacion
    JOIN Poblacion ON Proyecto_Poblacion.codpoblacion = Poblacion.codpoblacion
    WHERE Proyecto_Poblacion.codproyecto = @codproyecto;
    RETURN @total;
END;
GO

-- PROCEDIMIENTO: Insertar proyectos con validaciones
CREATE PROCEDURE InsertarProyecto 
    @titulo VARCHAR(100),
    @fechainicio DATE,
    @fechafin DATE,
    @presupuesto DECIMAL(10, 2),
    @nombregestor VARCHAR(100),
    @codsede INT
AS
BEGIN
    IF @presupuesto > 100000
    BEGIN
        RAISERROR ('El presupuesto excede el límite permitido.', 16, 1);
        RETURN;
    END;

    IF DATEDIFF(DAY, @fechainicio, @fechafin) > 180
    BEGIN
        RAISERROR ('La duración del proyecto excede los 180 días.', 16, 1);
        RETURN;
    END;

    INSERT INTO Proyecto (titulo, fechainicio, fechafin, presupuesto, nombregestor, codsede)
    VALUES (@titulo, @fechainicio, @fechafin, @presupuesto, @nombregestor, @codsede);
END;
GO

-- TRIGGER: Evitar inversión superior a $10,000 en acciones
CREATE TRIGGER ValidarInversionAccion
ON Accion
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @inversion DECIMAL(10, 2);
    SELECT @inversion = inversion FROM inserted;

    IF @inversion > 10000
    BEGIN
        RAISERROR ('La inversión en la acción excede el límite permitido.', 16, 1);
        ROLLBACK;
        RETURN;
    END;

    INSERT INTO Accion SELECT * FROM inserted;
END;
GO

-- USO DE OBJETOS DEL LADO DEL SERVIDOR
-- FUNCION
SELECT dbo.TotalHabitantes(1) AS TotalHabitantesProyecto1;

-- PROCEDIMIENTO
EXEC InsertarProyecto 
    @titulo = 'Proyecto Medio Ambiente',
    @fechainicio = '2024-07-01',
    @fechafin = '2024-12-01',
    @presupuesto = 75000,
    @nombregestor = 'Marta Díaz',
    @codsede = 2;

-- TRIGGER
INSERT INTO Accion (codaccion, codproyecto, codpoblacion, descripcion, inversion) 
VALUES (7, 2, 2, 'Campaña intensiva de vacunación', 12000);
