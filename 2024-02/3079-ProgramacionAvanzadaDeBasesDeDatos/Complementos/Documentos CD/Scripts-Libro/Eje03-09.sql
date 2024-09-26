USE QhatuPERU
go

CREATE TABLE ORDEN_DETALLE (
	NumOrden             int NOT NULL,
	CodArticulo          int NOT NULL,
	PrecioCompra         money NOT NULL,
	CantidadSolicitada   smallint NOT NULL,
	CantidadRecibida     smallint NULL,
	Estado               varchar(10) NULL )
go

ALTER TABLE ORDEN_DETALLE
	ADD CONSTRAINT PK_ORDEN_DETALLE
	PRIMARY KEY( NumOrden, CodArticulo )
go
