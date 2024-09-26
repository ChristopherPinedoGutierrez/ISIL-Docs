USE QhatuPERU
go

DECLARE @msg nvarchar(2048)
DECLARE @articulo varchar(40)
BEGIN TRY
	SET NOCOUNT ON
	UPDATE ARTICULO
		SET StockActual = 0, Descontinuado = 0
		WHERE CodArticulo = 9
	SET @articulo = (SELECT DescripcionArticulo
					FROM ARTICULO
					WHERE CodArticulo = 9)
	SET @msg = FORMATMESSAGE(60001, 9, @articulo);
	THROW 60001, @msg, 1
END TRY
BEGIN CATCH
	THROW
END CATCH

