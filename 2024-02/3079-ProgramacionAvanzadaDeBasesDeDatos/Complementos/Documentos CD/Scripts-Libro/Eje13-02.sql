USE QhatuPERU
go

CREATE FUNCTION udf_ProveedorLineaArticulo(
	@linea integer)
	RETURNS table
AS
RETURN (SELECT DISTINCT ARTICULO.CodProveedor,
		PROVEEDOR.NomProveedor,
		PROVEEDOR.Direccion, PROVEEDOR.Ciudad
FROM ARTICULO INNER JOIN PROVEEDOR
	ON ARTICULO.CodProveedor = PROVEEDOR.CodProveedor
WHERE ARTICULO.CodLinea = @linea)
go

-- Invocando a la función
SELECT * FROM udf_ProveedorLineaArticulo(6)
go