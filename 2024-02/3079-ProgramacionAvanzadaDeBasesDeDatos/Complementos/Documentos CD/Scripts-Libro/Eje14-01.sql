CREATE DATABASE Test
go

USE Test
go

-- Crear tablas MAESTRO-DETALLE
CREATE TABLE Factura(
	IdFactura int PRIMARY KEY,
	FecFactura date DEFAULT getdate(),
	Cliente varchar(30) not null,
	MontoFactura money null )
go

CREATE TABLE DetalleFactura(
	IdFactura int not null,
	IdProducto integer not null,
	PrecioUnitario money not null,
	Cantidad int not null )
go

ALTER TABLE DetalleFactura
	ADD CONSTRAINT pk_DetalleFactura
	PRIMARY KEY( IdFactura, IdProducto )
go
 

ALTER TABLE DetalleFactura
	ADD CONSTRAINT fk_DetalleFactura_Factura
	FOREIGN KEY( IdFactura )
	REFERENCES Factura
go

SET DATEFORMAT dmy
go

INSERT INTO Factura 
	VALUES( 1, '31/10/2012', 'Comercial Gómez', NULL )
INSERT INTO Factura 
	VALUES( 2, '02/11/2012', 'Juan López Cordero', NULL )
go

INSERT DetalleFactura VALUES( 1, 101, 12.5, 100 )
INSERT DetalleFactura VALUES( 1, 127, 15, 50 )
INSERT DetalleFactura VALUES( 1, 107, 10, 50 )
INSERT DetalleFactura VALUES( 2, 132, 15.5, 100 )
INSERT DetalleFactura VALUES( 2, 107, 10, 250 )
go

UPDATE Factura SET montoFactura = 2500
	WHERE idFactura = 1
UPDATE Factura SET montoFactura = 4050
	WHERE idFactura = 2
go


