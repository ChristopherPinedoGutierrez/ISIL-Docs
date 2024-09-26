USE QhatuPERU
go

-- Ranking de los artículos mas solicitados por las tiendas
SELECT GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC
go

-- Mostrar a partir del puesto 11
SELECT GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC OFFSET 10 ROWS
go

-- Mostrar las 5 siguientes después del puesto 10
SELECT GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC OFFSET 10 ROWS
	FETCH FIRST 5 ROWS ONLY
go
