-- Creación de la base de datos
CREATE DATABASE ONG_ConstruyendoFuturo;
GO

-- Uso de la base de datos
USE ONG_ConstruyendoFuturo;
GO

-- Creación de la tabla SEDE
CREATE TABLE SEDE (
    codsede INT PRIMARY KEY, -- Código único de la sede
    ciudad NVARCHAR(100) NOT NULL, -- Ciudad donde está ubicada la sede
    pais NVARCHAR(100) NOT NULL, -- País de la sede
    direccion NVARCHAR(255) NOT NULL, -- Dirección de la sede
    telefono NVARCHAR(20), -- Teléfono de contacto
    nomdirector NVARCHAR(150) NOT NULL -- Nombre del director
);
GO

-- Creación de la tabla PROYECTO
CREATE TABLE PROYECTO (
    codproyecto INT PRIMARY KEY, -- Código único del proyecto
    titulo NVARCHAR(200) NOT NULL, -- Título del proyecto
    fechainicio DATE NOT NULL, -- Fecha de inicio
    fechafin DATE NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL CHECK (presupuesto <= 100000), -- Presupuesto con límite de $100,000
    nombregestor NVARCHAR(150) NOT NULL, -- Nombre del gestor del proyecto
    codsede INT NOT NULL, -- Relación con la sede que lo gestiona
    CONSTRAINT FK_PROYECTO_SEDE FOREIGN KEY (codsede) REFERENCES SEDE(codsede),
	CONSTRAINT CK_FECHAS CHECK (fechafin > fechainicio), 
    CONSTRAINT CK_DURACION CHECK (fechafin <= DATEADD(DAY, 180, fechainicio)) -- Cantidad máxima de días
);
GO

-- Creación de la tabla POBLACION
CREATE TABLE POBLACION (
    codpoblacion INT PRIMARY KEY, -- Código único de la población
    nompoblacion NVARCHAR(200) NOT NULL, -- Nombre de la población
    pais NVARCHAR(100) NOT NULL, -- País donde está ubicada
    canthabitantes INT NOT NULL CHECK (canthabitantes BETWEEN 5000 AND 10000) -- Habitantes entre 5,000 y 10,000
);
GO

-- Creación de la tabla ACCION
CREATE TABLE ACCION (
    codaccion INT PRIMARY KEY, -- Código único de la acción
    descripcion NVARCHAR(255) NOT NULL, -- Descripción de la acción
    inversion DECIMAL(10, 2) NOT NULL CHECK (inversion <= 10000), -- Inversión con límite de $10,000
    codproyecto INT NOT NULL, -- Relación con el proyecto asociado
    codpoblacion INT NOT NULL, -- Relación con la población afectada
    CONSTRAINT FK_ACCION_PROYECTO FOREIGN KEY (codproyecto) REFERENCES PROYECTO(codproyecto),
    CONSTRAINT FK_ACCION_POBLACION FOREIGN KEY (codpoblacion) REFERENCES POBLACION(codpoblacion)
);
GO

-- Relación muchos a muchos entre PROYECTO y POBLACION
CREATE TABLE PROYECTO_POBLACION (
    codproyecto INT NOT NULL, -- Código del proyecto
    codpoblacion INT NOT NULL, -- Código de la población
    PRIMARY KEY (codproyecto, codpoblacion), -- Llave compuesta
    CONSTRAINT FK_PROYECTO_POBLACION_PROYECTO FOREIGN KEY (codproyecto) REFERENCES PROYECTO(codproyecto),
    CONSTRAINT FK_PROYECTO_POBLACION_POBLACION FOREIGN KEY (codpoblacion) REFERENCES POBLACION(codpoblacion)
);
GO
