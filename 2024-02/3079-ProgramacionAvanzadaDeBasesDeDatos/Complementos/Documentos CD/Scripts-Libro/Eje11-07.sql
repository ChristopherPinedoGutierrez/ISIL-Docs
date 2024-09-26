USE QhatuPERU
go

CREATE PROCEDURE usp_ArticulosProveedor
	@proveedor varchar(40)
AS
SET NOCOUNT ON;
SELECT ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo
FROM PROVEEDOR INNER JOIN ARTICULO
	ON PROVEEDOR.CodProveedor = ARTICULO.CodProveedor
WHERE PROVEEDOR.NomProveedor = @proveedor;
go

DECLARE @elProveedor varchar(40)
SET @elProveedor = 'Embutidos El Gordito'
EXEC usp_ArticulosProveedor @elProveedor
go

EXEC usp_ArticulosProveedor 'Embutidos El Gordito'
go



