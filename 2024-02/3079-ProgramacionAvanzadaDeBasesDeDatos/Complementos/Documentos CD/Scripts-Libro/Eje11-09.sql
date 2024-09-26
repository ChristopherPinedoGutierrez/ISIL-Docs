USE QhatuPERU
go

CREATE PROCEDURE usp_MontoOrdenesAñoMes
	@año smallint,
	@mes smallint,
	@monto money OUTPUT
AS
SET NOCOUNT ON;
SET @monto = ( SELECT SUM(ORDEN_DETALLE.PrecioCompra *
		ORDEN_DETALLE.CantidadRecibida) AS Monto
	FROM ORDEN_COMPRA INNER JOIN ORDEN_DETALLE
		ON ORDEN_COMPRA.NumOrden = ORDEN_DETALLE.NumOrden
	WHERE YEAR(ORDEN_COMPRA.FechaIngreso) = @año
		AND MONTH(ORDEN_COMPRA.FechaIngreso) = @mes);
go

DECLARE @elMonto money
EXEC usp_MontoOrdenesAñoMes 2013, 4, @elMonto OUTPUT
SELECT 'Monto órdenes Abril 2013 = ', @elMonto
go

