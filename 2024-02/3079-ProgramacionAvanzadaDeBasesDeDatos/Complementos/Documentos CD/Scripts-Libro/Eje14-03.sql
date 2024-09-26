USE Test
go

-- Desencadenante por ELIMINACION
-- para DetalleFactura
-- Recalcula el Monto de la Factura
-- por cada detalle eliminado
CREATE TRIGGER tg_delete_DetalleFactura
ON DetalleFactura AFTER DELETE
AS
DECLARE @factura int
DECLARE @suma money
SET @factura = ( SELECT idFactura FROM deleted )
SET @suma = 
	( SELECT SUM( PrecioUnitario * Cantidad )
		FROM DetalleFactura
		WHERE DetalleFactura.idFactura = @factura )
UPDATE factura
	SET MontoFactura = @suma
	WHERE idFactura = @factura
go

-- Prueba del desencadenante mediante
-- la eliminación del primer detalle
-- de la factura 1
DELETE FROM DetalleFactura
	WHERE idFactura = 1 AND idProducto = 101
go

-- Verificando la data
SELECT * FROM DetalleFactura
go

SELECT * FROM Factura
go



