USE QhatuPERU
go

CREATE VIEW v_ListaPrecios
AS
SELECT LINEA.NomLinea, ARTICULO.CodArticulo,
	ARTICULO.DescripcionArticulo,
	ARTICULO.Presentacion,
	ARTICULO.PrecioProveedor
FROM LINEA INNER JOIN ARTICULO
	ON LINEA.CodLinea = ARTICULO.CodLinea
go

SELECT * FROM v_ListaPrecios
go
