USE QhatuPERU
go

ALTER TABLE ARTICULO
	ADD CONSTRAINT DF_Articulo_Descontinuado
	DEFAULT 0 FOR Descontinuado
go
	
INSERT INTO ARTICULO(CodLinea, CodProveedor, DescripcionArticulo)
	VALUES(1,15,'CARAMELOS SURTIDO DE FRUTAS')
go

SELECT DescripcionArticulo, Descontinuado
FROM ARTICULO
go


