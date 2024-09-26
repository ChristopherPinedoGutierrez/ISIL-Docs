USE QhatuPERU
go

CREATE PROCEDURE usp_GuiasFechaTienda
	@tienda varchar(20),
	@año smallint,
	@mes smallint
AS
SET NOCOUNT ON;
SELECT GUIA_ENVIO.NumGuia,
	GUIA_ENVIO.FechaSalida,
	GUIA_ENVIO.CodTienda
FROM TIENDA INNER JOIN GUIA_ENVIO
	ON TIENDA.CodTienda = GUIA_ENVIO.CodTienda
WHERE TIENDA.Distrito = @tienda
	AND YEAR(GUIA_ENVIO.FechaSalida) = @año
	AND MONTH(GUIA_ENVIO.FechaSalida) = @mes;
go

--  entrega de parámetros por posición
DECLARE @laTienda varchar(20)
DECLARE @elAño smallint, @elMes smallint
SET @laTienda = 'Pueblo Libre'
SET @elAño = 2013
SET @elMes = 3
EXEC usp_GuiasFechaTienda @laTienda, @elAño, @elMes
go

-- entrega de parámetros por posición
EXEC usp_GuiasFechaTienda 'Pueblo Libre', 2013, 3
go

-- entrega de parámetros por referencia
EXEC usp_GuiasFechaTienda
	@año = 2013,
	@mes = 3,
	@tienda = 'Pueblo Libre'
go


