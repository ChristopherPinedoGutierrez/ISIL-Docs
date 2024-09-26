USE QhatuPERU
go

SELECT DescripcionArticulo
FROM ARTICULO
WHERE CodArticulo = (SELECT CodArticulo
						FROM GUIA_DETALLE
						WHERE CantidadEnviada > 100)
IF @@ERROR <> 0
	PRINT 'Se ha producido un error'

