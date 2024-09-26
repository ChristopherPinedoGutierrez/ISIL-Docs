USE QhatuPERU
go

CREATE PROCEDURE usp_PrecioArticulo
	@articulo integer,
	@precio money OUTPUT
AS
SET NOCOUNT ON;
SET @precio = (SELECT PrecioProveedor
				FROM ARTICULO
				WHERE CodArticulo = @articulo);
go

DECLARE @elPrecio money
EXECUTE usp_PrecioArticulo 217, @elPrecio OUTPUT
SELECT @elPrecio
go
