USE QhatuPERU
go

DECLARE @proveedor varchar(40)
SET @proveedor = '%El Gordito%'

SELECT ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo
FROM ARTICULO INNER JOIN PROVEEDOR
	ON ARTICULO.CodProveedor = PROVEEDOR.CodProveedor
WHERE PROVEEDOR.NomProveedor LIKE @proveedor
go

