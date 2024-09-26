USE QhatuPERU
go

SELECT codLinea,
	COUNT(codArticulo) AS Artículos
FROM ARTICULO
GROUP BY codLinea
go

SELECT codLinea, codProveedor,
	COUNT(codArticulo) AS Artículos
FROM ARTICULO
WHERE codLinea IN (1, 5)
GROUP BY codLinea, codProveedor
ORDER BY codLinea
go

SELECT codArticulo,
	SUM(precioVenta * cantidadEnviada)
	AS 'Monto total'
FROM GUIA_DETALLE
GROUP BY codArticulo
ORDER BY 'Monto total' DESC
go

SELECT codArticulo,
	SUM(precioVenta * cantidadEnviada)
		AS 'Monto total'
FROM GUIA_DETALLE
GROUP BY codArticulo
HAVING SUM(precioVenta * cantidadEnviada) > 20000
ORDER BY 'Monto total' DESC
go


