USE QhatuPERU
go

SELECT ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo,
	ARTICULO.Presentacion, ARTICULO.PrecioProveedor,
	ARTICULO.CodProveedor, PROVEEDOR.NomProveedor,
	PROVEEDOR.Departamento
FROM ARTICULO INNER JOIN PROVEEDOR
	ON ARTICULO.CodProveedor = PROVEEDOR.CodProveedor
ORDER BY ARTICULO.CodArticulo
go

SELECT CodArticulo, DescripcionArticulo,
	Presentacion, PrecioProveedor,
	CodProveedor, NomProveedor,
	Departamento
FROM ARTICULO INNER JOIN PROVEEDOR
	ON ARTICULO.CodProveedor = PROVEEDOR.CodProveedor
ORDER BY CodArticulo
go
-- error 209

SELECT CodArticulo, DescripcionArticulo,
	Presentacion, PrecioProveedor,
	ARTICULO.CodProveedor, NomProveedor,
	Departamento
FROM ARTICULO INNER JOIN PROVEEDOR
	ON ARTICULO.CodProveedor = PROVEEDOR.CodProveedor
ORDER BY CodArticulo
go

SELECT Art.CodArticulo, Art.DescripcionArticulo,
	Art.Presentacion, Art.PrecioProveedor,
	Art.CodProveedor, Prov.NomProveedor,
	Prov.Departamento
FROM ARTICULO Art INNER JOIN PROVEEDOR Prov
	ON Art.CodProveedor = Prov.CodProveedor
ORDER BY Art.CodArticulo
go






