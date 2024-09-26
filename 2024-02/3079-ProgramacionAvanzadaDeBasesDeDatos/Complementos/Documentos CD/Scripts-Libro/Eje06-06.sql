USE QhatuPERU
go

SELECT codLinea, codProveedor,
	AVG(precioProveedor) AS 'Precio promedio'
FROM ARTICULO
GROUP BY codLinea, codProveedor
ORDER BY codLinea, codProveedor
go

SELECT codLinea, codProveedor,
	AVG(precioProveedor) AS 'Precio promedio'
FROM ARTICULO
GROUP BY codLinea, codProveedor
WITH ROLLUP
go

SELECT codLinea, codProveedor,
	AVG(precioProveedor) AS 'Precio promedio'
FROM ARTICULO
GROUP BY codLinea, codProveedor
WITH CUBE
ORDER BY 1,2
go

SELECT codLinea, codProveedor,
	AVG(precioProveedor) AS 'Precio promedio'
FROM ARTICULO
GROUP BY ROLLUP(codLinea, codProveedor)
go

SELECT codLinea, codProveedor,
	AVG(precioProveedor) AS 'Precio promedio'
FROM ARTICULO
GROUP BY CUBE(codLinea, codProveedor)
go






