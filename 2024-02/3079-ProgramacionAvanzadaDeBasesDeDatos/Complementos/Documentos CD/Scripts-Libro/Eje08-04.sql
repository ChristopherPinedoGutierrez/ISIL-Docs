USE QhatuPERU
go

-- Crear una tabla con columnas de distintas tablas origen
SELECT ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo,
	ARTICULO.Presentacion, ARTICULO.PrecioProveedor,
	LINEA.NomLinea, PROVEEDOR.NomProveedor
INTO CatalogoArticulos
FROM ARTICULO INNER JOIN LINEA
	ON ARTICULO.CodLinea = LINEA.CodLinea
INNER JOIN PROVEEDOR
	ON ARTICULO.CodProveedor = PROVEEDOR.CodProveedor
go

SELECT * FROM CatalogoArticulos
go
