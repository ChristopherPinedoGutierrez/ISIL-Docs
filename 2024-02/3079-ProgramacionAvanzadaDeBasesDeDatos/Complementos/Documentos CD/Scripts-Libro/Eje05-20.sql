USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE DescripcionArticulo BETWEEN 'fru' AND 'hot'
go
