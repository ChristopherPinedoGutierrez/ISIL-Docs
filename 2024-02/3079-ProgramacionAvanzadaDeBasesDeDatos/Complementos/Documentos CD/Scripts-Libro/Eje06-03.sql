USE QhatuPERU
go

SELECT	AVG(PrecioProveedor) AS 'Promedio',
		STDEV(PrecioProveedor) AS 'Desviación estándar',
		STDEVP(PrecioProveedor) AS 'Desviación estándar población',
		VAR(PrecioProveedor) AS 'Varianza',
		VARP(PrecioProveedor) AS 'Varianza población'
FROM ARTICULO
go