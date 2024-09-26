USE QhatuPERU
go

SELECT AVG(PrecioProveedor) FROM ARTICULO
go

SELECT CodArticulo, DescripcionArticulo, PrecioProveedor,
	Diferencia = PrecioProveedor -
		(SELECT AVG(PrecioProveedor) FROM ARTICULO)
FROM ARTICULO
go




