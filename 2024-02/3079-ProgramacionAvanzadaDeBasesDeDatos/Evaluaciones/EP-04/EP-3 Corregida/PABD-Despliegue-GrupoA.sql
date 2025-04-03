-- Creaci�n de la base de datos
CREATE DATABASE ONG_ConstruyendoFuturo;
GO

-- Uso de la base de datos
USE ONG_ConstruyendoFuturo;
GO

-- Creaci�n de la tabla SEDE
CREATE TABLE SEDE (
    codsede INT PRIMARY KEY, -- C�digo �nico de la sede
    ciudad NVARCHAR(100) NOT NULL, -- Ciudad donde est� ubicada la sede
    pais NVARCHAR(100) NOT NULL, -- Pa�s de la sede
    direccion NVARCHAR(255) NOT NULL, -- Direcci�n de la sede
    telefono NVARCHAR(20), -- Tel�fono de contacto
    nomdirector NVARCHAR(150) NOT NULL -- Nombre del director
);
GO

-- Creaci�n de la tabla PROYECTO
CREATE TABLE PROYECTO (
    codproyecto INT PRIMARY KEY, -- C�digo �nico del proyecto
    titulo NVARCHAR(200) NOT NULL, -- T�tulo del proyecto
    fechainicio DATE NOT NULL, -- Fecha de inicio
    fechafin DATE NOT NULL,
    presupuesto DECIMAL(10, 2) NOT NULL CHECK (presupuesto <= 100000), -- Presupuesto con l�mite de $100,000
    nombregestor NVARCHAR(150) NOT NULL, -- Nombre del gestor del proyecto
    codsede INT NOT NULL, -- Relaci�n con la sede que lo gestiona
    CONSTRAINT FK_PROYECTO_SEDE FOREIGN KEY (codsede) REFERENCES SEDE(codsede),
	CONSTRAINT CK_FECHAS CHECK (fechafin > fechainicio), 
    CONSTRAINT CK_DURACION CHECK (fechafin <= DATEADD(DAY, 180, fechainicio)) -- Cantidad m�xima de d�as
);
GO

-- Creaci�n de la tabla POBLACION
CREATE TABLE POBLACION (
    codpoblacion INT PRIMARY KEY, -- C�digo �nico de la poblaci�n
    nompoblacion NVARCHAR(200) NOT NULL, -- Nombre de la poblaci�n
    pais NVARCHAR(100) NOT NULL, -- Pa�s donde est� ubicada
    canthabitantes INT NOT NULL CHECK (canthabitantes BETWEEN 5000 AND 10000) -- Habitantes entre 5,000 y 10,000
);
GO

-- Creaci�n de la tabla ACCION
CREATE TABLE ACCION (
    codaccion INT PRIMARY KEY, -- C�digo �nico de la acci�n
    descripcion NVARCHAR(255) NOT NULL, -- Descripci�n de la acci�n
    inversion DECIMAL(10, 2) NOT NULL CHECK (inversion <= 10000), -- Inversi�n con l�mite de $10,000
    codproyecto INT NOT NULL, -- Relaci�n con el proyecto asociado
    codpoblacion INT NOT NULL, -- Relaci�n con la poblaci�n afectada
    CONSTRAINT FK_ACCION_PROYECTO FOREIGN KEY (codproyecto) REFERENCES PROYECTO(codproyecto),
    CONSTRAINT FK_ACCION_POBLACION FOREIGN KEY (codpoblacion) REFERENCES POBLACION(codpoblacion)
);
GO

-- Relaci�n muchos a muchos entre PROYECTO y POBLACION
CREATE TABLE PROYECTO_POBLACION (
    codproyecto INT NOT NULL, -- C�digo del proyecto
    codpoblacion INT NOT NULL, -- C�digo de la poblaci�n
    PRIMARY KEY (codproyecto, codpoblacion), -- Llave compuesta
    CONSTRAINT FK_PROYECTO_POBLACION_PROYECTO FOREIGN KEY (codproyecto) REFERENCES PROYECTO(codproyecto),
    CONSTRAINT FK_PROYECTO_POBLACION_POBLACION FOREIGN KEY (codpoblacion) REFERENCES POBLACION(codpoblacion)
);
GO
