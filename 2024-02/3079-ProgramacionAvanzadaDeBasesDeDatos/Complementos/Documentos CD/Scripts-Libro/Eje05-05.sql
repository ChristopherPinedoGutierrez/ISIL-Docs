SELECT	CodArticulo AS Código,
		DescripcionArticulo AS Descripción,
		Presentacion AS Unidad,
		PrecioProveedor AS 'Precio unitario'
FROM ARTICULO
go

SELECT	Código = CodArticulo,
		Descripción = DescripcionArticulo,
		Unidad = Presentacion,
		'Precio unitario' = PrecioProveedor
FROM ARTICULO
go

SELECT	CodArticulo Código,
		DescripcionArticulo Descripción,
		Presentacion Unidad,
		PrecioProveedor 'Precio unitario'
FROM ARTICULO
go

	


	


