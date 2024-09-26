USE QhatuPERU
go

SELECT SUM(precioVenta * cantidadEnviada)
FROM GUIA_DETALLE
go

SELECT SUM(cantidadEnviada)
FROM GUIA_DETALLE
WHERE codArticulo = 27
go



