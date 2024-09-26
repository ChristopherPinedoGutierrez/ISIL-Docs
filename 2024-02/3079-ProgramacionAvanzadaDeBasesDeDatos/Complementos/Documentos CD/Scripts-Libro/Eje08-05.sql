USE QhatuPERU
go

-- Ranking de los artículos mas solicitados por las tiendas
-- guardado en la tabla RankingArticulos
SELECT IDENTITY(integer, 1, 1) AS Puesto,
	GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo,
	SUM(GUIA_DETALLE.CantidadEnviada) AS TotalUnidades
INTO RankingArticulos
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo = ARTICULO.CodArticulo
GROUP BY GUIA_DETALLE.CodArticulo,
	ARTICULO.DescripcionArticulo
ORDER BY TotalUnidades DESC
go

-- Mostrar los puestos del 11 al 15 en el ranking
SELECT * FROM RankingArticulos
ORDER BY Puesto
	OFFSET 10 ROWS
		FETCH NEXT 5 ROWS ONLY
go