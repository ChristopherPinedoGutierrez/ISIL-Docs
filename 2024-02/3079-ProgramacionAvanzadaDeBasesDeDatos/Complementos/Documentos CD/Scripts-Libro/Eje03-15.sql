USE QhatuPERU
go

ALTER TABLE ARTICULO
	ADD CONSTRAINT CK_Articulo_PrecioProveedor
	CHECK( PrecioProveedor >= 0 )
go

INSERT INTO ARTICULO(CodLinea, CodProveedor,
	DescripcionArticulo, Presentacion,
	PrecioProveedor)
	VALUES(2,12,
		'JAMONADA ESPECIAL LA SEGOVIANA',
		'KILOGRAMO',-15)
go
