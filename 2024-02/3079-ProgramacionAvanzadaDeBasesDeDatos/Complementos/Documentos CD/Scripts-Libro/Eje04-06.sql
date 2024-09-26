USE BibliotecaGyS
go

CREATE TABLE PruebaFechas(
	fecha datetime not null )
go

-- Prueba 1: insertar 26 de noviembre de 1980
INSERT INTO PruebaFechas VALUES( '26 Nov 1980' )
go

SELECT * FROM PruebaFechas
go

-- Prueba 2: insertar la fecha 3 de enero del 2001
-- usando el formato mes/día/año
INSERT INTO PruebaFechas VALUES( '01/03/2001' )
go

SELECT * FROM PruebaFechas
go

-- Prueba 3: insertar la fecha 26 de noviembre de 1980
-- usando el formato mes/día/año
INSERT INTO PruebaFechas VALUES( '11/26/1980' )
go

-- Informando al servidor en qué formato se envían las
-- cadenas de fecha
SET DATEFORMAT MDY
go

-- Prueba 4: insertar la fecha 26 de noviembre
-- de 1980 usando el formato mes/día/año
INSERT INTO PruebaFechas VALUES( '11/26/1980' )
go
	
SELECT * FROM PruebaFechas
go
	
	





