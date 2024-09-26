USE QhatuPERU
go

CREATE PROCEDURE usp_MontoGuiasFecha
	@año char(4),
	@mes char(2),
	@dia char(2),
	@monto money OUTPUT
AS
SET NOCOUNT ON;
DECLARE @fecha char(10);
SET @fecha = @dia + '/' + @mes + '/' + @año;
IF NOT EXISTS (SELECT FechaSalida
		FROM GUIA_ENVIO
		WHERE CONVERT(char(10), FechaSalida, 103) = @fecha)
	BEGIN
		RAISERROR('No hay guías para la fecha indicada.', 16, 1);
		RETURN;
	END;
SET @monto = (SELECT SUM(gd.CantidadEnviada * gd.PrecioVenta)
		FROM GUIA_DETALLE gd INNER JOIN GUIA_ENVIO ge
			ON gd.NumGuia = ge.NumGuia
		WHERE CONVERT(char(10), ge.FechaSalida, 103) = @fecha);
go

DECLARE @elMonto money
EXEC usp_MontoGuiasFecha 2013, 05, 21, @elMonto OUTPUT
SELECT @elMonto
go



