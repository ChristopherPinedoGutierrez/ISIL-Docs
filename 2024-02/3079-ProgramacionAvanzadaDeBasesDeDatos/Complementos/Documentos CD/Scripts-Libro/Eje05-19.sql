USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo, 
	Presentacion, PrecioProveedor
FROM ARTICULO
WHERE PrecioProveedor BETWEEN 5.50 AND 7
go