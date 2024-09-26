USE Test
go

-- Desencadenante AFTER INSERT
-- para DetalleFactura.
-- Recalcula el Monto de la Factura
-- por cada detalle insertado.
CREATE TRIGGER tg_insert_DetalleFactura
ON DetalleFactura AFTER INSERT
AS
DECLARE @factura int
DECLARE @suma money
SET @factura = ( SELECT idFactura FROM inserted )
SET @suma = 
	( SELECT SUM( precioUnitario * cantidad )
		FROM DetalleFactura
		WHERE DetalleFactura.idFactura = @factura )
UPDATE Factura
	SET montoFactura = @suma
	WHERE idFactura = @factura
go

-- Probando el desencadenante
-- Registrando la factura 3
SET DATEFORMAT DMY
go

INSERT INTO Factura 
	VALUES( 3, '02/11/2012',
		'Rep. Asunción', NULL )
go

-- Probando el desencadenante
INSERT DetalleFactura VALUES( 3, 101, 12.5, 100 )
INSERT DetalleFactura VALUES( 3, 127, 15, 100 )
INSERT DetalleFactura VALUES( 3, 107, 10, 100 )
go

-- Verificando la data
SELECT * FROM DetalleFactura
go

SELECT * FROM Factura
go



