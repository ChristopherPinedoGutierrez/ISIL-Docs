USE QhatuPERU
go

SELECT CodArticulo, PrecioVenta, CantidadEnviada,
	Monto = PrecioVenta * CantidadEnviada
FROM GUIA_DETALLE
go

