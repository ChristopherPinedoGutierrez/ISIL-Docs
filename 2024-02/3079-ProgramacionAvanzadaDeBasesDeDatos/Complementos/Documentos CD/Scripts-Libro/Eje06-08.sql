USE QhatuPERU
go

SELECT codLinea, codProveedor,
	AVG(precioProveedor) AS 'Precio promedio'
FROM ARTICULO
GROUP BY codLinea, codProveedor
ORDER BY 1,2
go

SELECT codLinea, 
	[1] AS Proveedor1, [14] AS Proveedor14,
	[15] AS Proveedor15
FROM
(SELECT precioProveedor, codLinea, codProveedor
	FROM ARTICULO) origen
PIVOT (AVG(precioProveedor)
	FOR codProveedor
	IN ([1], [14], [15])) AS destino
go

SELECT codProveedor, 
	[1] AS Linea1, [2] AS Linea2,
	[4] AS Linea4
FROM
(SELECT precioProveedor, codLinea, codProveedor
	FROM ARTICULO
	WHERE codProveedor IN (1, 14, 15)) origen
PIVOT (AVG(precioProveedor)
	FOR codLinea
	IN ([1], [2], [4])) AS destino
go

SELECT codProveedor, 
	[1] AS Linea1, [2] AS Linea2,
	[3] AS Linea3
FROM
(SELECT precioProveedor, codLinea, codProveedor
	FROM ARTICULO) origen
PIVOT (AVG(precioProveedor)
	FOR codLinea
	IN ([1], [2], [3])) AS destino
go


