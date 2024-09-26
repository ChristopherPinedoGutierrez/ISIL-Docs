USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo, Presentacion,
	PrecioProveedor, CodProveedor
FROM ARTICULO
go

SELECT ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo,
	ARTICULO.Presentacion, ARTICULO.PrecioProveedor,
	ARTICULO.CodProveedor, PROVEEDOR.NomProveedor,
	PROVEEDOR.Departamento
FROM ARTICULO INNER JOIN PROVEEDOR
	ON ARTICULO.CodProveedor = PROVEEDOR.CodProveedor
ORDER BY ARTICULO.CodArticulo
go


