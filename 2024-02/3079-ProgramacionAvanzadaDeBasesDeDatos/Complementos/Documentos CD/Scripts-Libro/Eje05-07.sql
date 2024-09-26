USE QhatuPERU
go

SELECT CodTienda, 
	Direccion + ' - ' + Distrito AS Ubicación
FROM TIENDA
go
