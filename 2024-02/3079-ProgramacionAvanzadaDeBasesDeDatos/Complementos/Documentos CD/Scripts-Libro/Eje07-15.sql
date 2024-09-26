USE QhatuPERU
go

SELECT CodArticulo, DescripcionArticulo
FROM ARTICULO
WHERE CodArticulo NOT IN 
	(SELECT CodArticulo FROM GUIA_DETALLE)
ORDER BY CodArticulo
go

