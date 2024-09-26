USE QhatuPERU
go

CREATE FUNCTION udf_MontoGuia(
	@guia int)
	RETURNS money
BEGIN
	RETURN (SELECT SUM(PrecioVenta * CantidadEnviada)
		FROM GUIA_DETALLE
		WHERE NumGuia = @guia)
END
go

-- Invocando a la función
DECLARE @laGuia int
SET @laGuia = 77
SELECT dbo.udf_MontoGuia(@laGuia)
go



