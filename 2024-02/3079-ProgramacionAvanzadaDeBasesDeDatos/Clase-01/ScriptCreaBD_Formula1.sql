/* Despliegue de la base de datos Formula1 */
CREATE DATABASE Formula1;
go

USE Formula1;

/* Crear la tabla Circuito
El nombre de su PK es PK_Circuito
*/
CREATE TABLE Circuito(
	codCircuito smallint not null 
		CONSTRAINT PK_Circuito PRIMARY KEY,
	nombre varchar(75) not null,
	ciudad varchar(25) not null,
	pais varchar(25) not null );

/* Con una sola instrucción, crear la tabla Carrera
y su relación con la tabla Circuito
El nombre de la PK de Carrera es PK_Carrera
El nombre de la FK de Carrera es FK_Carrera_Circuito
*/
CREATE TABLE Carrera(
	codCarrera integer not null
		CONSTRAINT PK_Carrera PRIMARY KEY,
	nombre varchar(50) not null,
	año smallint not null,
	fecha datetime not null,
	ronda tinyint not null,
	codCircuito smallint not null
		CONSTRAINT FK_Carrera_Circuito
		FOREIGN KEY REFERENCES Circuito);

/* Crear la tabla Piloto con todas sus propiedades
El nombre de la PK es PK_Piloto
*/
CREATE TABLE Piloto(
	codPiloto integer not null 
		CONSTRAINT PK_Piloto PRIMARY KEY,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	fechaNac datetime null,
	nacionalidad varchar(25) null);

/* Crear la tabla Marca
El nombre de la PK es PK_Marca
*/
CREATE TABLE Marca(
	codMarca smallint not null
		CONSTRAINT PK_Marca PRIMARY KEY,
	nombre varchar(25) not null,
	nacionalidad varchar(25) null);

/* Crear la tabla Resultado con una PK simple
en la columna codResultado cuyo tipo es integer
y que tiene la propiedad IDENTITY
Seguir la convención establecida para nombrar las claves
*/
CREATE TABLE Resultado(
	codResultado integer not null IDENTITY
		CONSTRAINT PK_Resultado PRIMARY KEY,
	codCarrera integer not null
		CONSTRAINT FK_Resultado_Carrera
		FOREIGN KEY REFERENCES Carrera,
	codPiloto integer not null
		CONSTRAINT FK_Resultado_Piloto
		FOREIGN KEY REFERENCES Piloto,
	codMarca smallint not null
		CONSTRAINT FK_Resultado_Marca
		FOREIGN KEY REFERENCES Marca,
	numAuto smallint not null,
	puesto tinyint null,
	puntosPiloto smallint null,
	puntosMarca smallint null);

/* Cambiar el tipo de dato de la columna fecha de la
tabla Carrera al tipo DATE
*/
ALTER TABLE Carrera
	ALTER COLUMN fecha date not null;

ALTER TABLE Piloto
	ALTER COLUMN fechaNac date null;



















