USE QhatuPERU
go

CREATE PROCEDURE usp_CatalogoArticulos
AS
SET NOCOUNT ON;
SELECT LINEA.NomLinea,
	ARTICULO.CodArticulo,
	ARTICULO.DescripcionArticulo,
	ARTICULO.Presentacion,
	ARTICULO.PrecioProveedor
FROM LINEA INNER JOIN ARTICULO
	ON LINEA.CodLinea = ARTICULO.CodLinea;
go

EXEC usp_CatalogoArticulos
go
