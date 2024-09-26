USE QhatuPERU
go

SELECT CodLinea, DescripcionArticulo,
	StockActual AS Unidades
FROM ARTICULO
go

SELECT CodLinea,
	SUM(StockActual) AS 'Total unidades'
FROM ARTICULO
GROUP BY CodLinea
go

SELECT CodLinea, DescripcionArticulo,
	StockActual AS Unidades,
	SUM(StockActual) OVER(PARTITION BY CodLinea)
		AS 'Total unidades'
FROM ARTICULO
go



SELECT CodLinea, stockActual,
	SUM(stockActual) OVER(PARTITION BY CodLinea)
		AS 'Total unidades'
FROM ARTICULO
go