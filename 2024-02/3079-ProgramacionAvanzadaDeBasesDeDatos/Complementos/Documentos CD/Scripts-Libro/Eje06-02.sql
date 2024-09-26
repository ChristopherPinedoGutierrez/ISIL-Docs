USE QhatuPERU
go

SELECT MAX(precioProveedor) AS 'Precio Alto',
	MIN(precioProveedor) AS 'Precio Bajo'
FROM ARTICULO
go

SELECT MAX(fechaSalida), MIN(fechaSalida)
FROM GUIA_ENVIO
go

SELECT MIN(descripcionArticulo),
	MAX(descripcionArticulo)
FROM ARTICULO
go



