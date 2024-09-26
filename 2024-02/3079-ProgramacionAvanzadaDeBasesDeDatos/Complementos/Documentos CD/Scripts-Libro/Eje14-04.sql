USE Test
go

CREATE TRIGGER tg_update_DetalleFactura
ON DetalleFactura AFTER UPDATE
AS
IF UPDATE(precioUnitario) OR UPDATE(cantidad)
	BEGIN
	DECLARE @factura int
	DECLARE @suma money
	SET @factura = ( SELECT idFactura FROM inserted )
	SET @suma = 
		( SELECT SUM( PrecioUnitario * Cantidad )
			FROM DetalleFactura
			WHERE DetalleFactura.idFactura = @factura )
	UPDATE factura
		SET MontoFactura = @suma
		WHERE idFactura = @factura
	END
go

-- Prueba del desencadenante duplicando
-- la cantidad en el primer item de la factura 3
UPDATE DetalleFactura
	SET cantidad = 200
	WHERE idFactura = 3 AND idProducto = 101
go

-- Verificando la data
SELECT * FROM DetalleFactura
go

SELECT * FROM Factura
go





