USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo, CodProveedor
FROM ARTICULO
WHERE CodProveedor IN (7,1,3)
go