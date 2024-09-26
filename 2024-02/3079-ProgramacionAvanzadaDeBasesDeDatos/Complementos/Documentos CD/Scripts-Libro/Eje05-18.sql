USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE '[^pdf]%'
ORDER BY DescripcionArticulo
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE '[^d-p]%'
ORDER BY DescripcionArticulo
go

	
