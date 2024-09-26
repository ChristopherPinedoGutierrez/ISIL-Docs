USE QhatuPERU
go

CREATE PROCEDURE usp_BuscaGuiaArticulo
	@fecha char(10), @articulo varchar(20)
AS
SET NOCOUNT ON
SELECT gd.NumGuia, gd.CodArticulo, a.DescripcionArticulo
FROM GUIA_DETALLE gd INNER JOIN ARTICULO a
	ON gd.CodArticulo = a.CodArticulo
INNER JOIN GUIA_ENVIO g
	ON gd.NumGuia = g.NumGuia
WHERE CONVERT(CHAR(10), g.FechaSalida, 103) = @fecha
	AND a.DescripcionArticulo LIKE '%' + @articulo + '%'

IF @@rowcount = 0
	RAISERROR('No existe guías para el artículo %s en la fecha %s.', 16, 1, @articulo, @fecha)
go

-- Probando el procedimiento
EXEC usp_BuscaGuiaArticulo '26/05/2013', 'GALLETA'
go

