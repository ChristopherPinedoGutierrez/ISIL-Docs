USE QhatuPERU
go

-- Artículos enviados a las tiendas
SELECT GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
ORDER BY 1
go

-- Eliminando filas duplicadas
SELECT DISTINCT GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
ORDER BY 1
go

