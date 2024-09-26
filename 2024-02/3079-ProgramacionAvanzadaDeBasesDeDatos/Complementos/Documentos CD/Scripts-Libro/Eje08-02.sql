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

-- Ranking de los 5 primeros
SELECT TOP 5 GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC
go

-- Ranking de los 5 primeros incluyendo los empates
SELECT TOP 5 WITH TIES GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC
go

-- Quinto superior
SELECT TOP 20 PERCENT GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC
go

-- Quinto superior con empates
SELECT TOP 20 PERCENT WITH TIES GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC
go



