USE QhatuPERU
go

CREATE FUNCTION udf_ListaGuias(
	@salida varchar(15))
	RETURNS @lista table(
		Numero int NOT NULL PRIMARY KEY,
		Descripcion varchar(75) NOT NULL)
AS
BEGIN
	IF @salida = 'Tienda'
		INSERT @lista
		SELECT g.NumGuia, t.direccion
			FROM GUIA_ENVIO g INNER JOIN TIENDA t
				ON g.CodTienda = t.CodTienda
	ELSE IF @salida = 'Fecha'
		INSERT @lista
		SELECT NumGuia, CONVERT(CHAR(11), FechaSalida, 106)
			FROM GUIA_ENVIO
	RETURN
END
go

-- Invocando a la función
SELECT * FROM dbo.udf_ListaGuias('Fecha')
go

SELECT * FROM dbo.udf_ListaGuias('Tienda')
go




