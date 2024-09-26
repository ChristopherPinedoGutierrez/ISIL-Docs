USE BibliotecaGyS
go

CREATE TABLE pruebaIdentidad(
	codigo int IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(15) not null,
	telefono varchar(15) null )
go

INSERT INTO pruebaIdentidad(nombre, telefono)
	VALUES('Gustavo', '99981234')

INSERT INTO pruebaIdentidad(nombre, telefono)
	VALUES('Ricardo', '2211234')

INSERT INTO pruebaIdentidad(nombre, telefono)
	VALUES('Gloria', '3493212')
go

SELECT * FROM pruebaIdentidad
go

