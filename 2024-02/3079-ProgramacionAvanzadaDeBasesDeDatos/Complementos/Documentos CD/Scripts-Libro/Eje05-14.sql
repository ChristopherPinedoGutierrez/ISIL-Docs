USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE 'gloria'
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE 'gloria%'
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE '%gloria'
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo LIKE '%gloria%'
go
