USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo,
	'Acción a tomar' = CASE
		WHEN StockActual <= StockMinimo THEN 'URGENTE: Colocar pedido'
		WHEN StockActual < StockMinimo * 1.1 THEN 'Stock cerca al mínimo'
		ELSE 'Stock adecuado'
	END
FROM ARTICULO
go
