USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo, 
	Presentacion, PrecioProveedor
FROM ARTICULO
WHERE PrecioProveedor < 1.50
go