USE QhatuPERU
go

SELECT SUM(CantidadEnviada)
FROM GUIA_DETALLE INNER JOIN ARTICULO
	ON GUIA_DETALLE.CodArticulo =
		ARTICULO.CodArticulo
WHERE ARTICULO.CodLinea = 4
go

SELECT ARTICULO.CodArticulo,
	ARTICULO.DescripcionArticulo,
	Despachado =
		ISNULL(SUM(GUIA_DETALLE.CantidadEnviada), 0),
	Porcentaje =
	CONVERT(float,
		ISNULL(SUM(GUIA_DETALLE.CantidadEnviada), 0))
			/
			(SELECT SUM(CantidadEnviada)
				FROM GUIA_DETALLE INNER JOIN ARTICULO
				ON GUIA_DETALLE.CodArticulo =
					ARTICULO.CodArticulo
				WHERE ARTICULO.CodLinea = 4) * 100
FROM ARTICULO LEFT OUTER JOIN GUIA_DETALLE
	ON ARTICULO.CodArticulo =
		GUIA_DETALLE.CodArticulo
WHERE ARTICULO.CodLinea = 4
GROUP BY ARTICULO.CodArticulo,
	ARTICULO.DescripcionArticulo
go

