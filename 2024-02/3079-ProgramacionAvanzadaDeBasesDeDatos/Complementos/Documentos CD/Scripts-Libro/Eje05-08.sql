USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo, Presentacion,
	PrecioProveedor
FROM ARTICULO
WHERE CodLinea = 5
go
