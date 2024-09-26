USE QhatuPERU
go

CREATE VIEW v_Inventario
	WITH ENCRYPTION
AS
SELECT LINEA.NomLinea, ARTICULO.CodArticulo,
	ARTICULO.DescripcionArticulo, ARTICULO.Presentacion,
	ARTICULO.stockActual, ARTICULO.stockMinimo
FROM LINEA INNER JOIN ARTICULO
	ON LINEA.CodLinea = ARTICULO.CodLinea
go

-- Consultando la vista
SELECT * FROM v_Inventario
go

-- Revisando la definición de la vista
sp_helptext v_Inventario
go


