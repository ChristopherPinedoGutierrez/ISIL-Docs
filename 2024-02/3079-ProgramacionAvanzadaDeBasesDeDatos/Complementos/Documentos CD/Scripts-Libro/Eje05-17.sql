USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE '[d-p]%'
ORDER BY DescripcionArticulo
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE '[p-d]%'
ORDER BY DescripcionArticulo
go
