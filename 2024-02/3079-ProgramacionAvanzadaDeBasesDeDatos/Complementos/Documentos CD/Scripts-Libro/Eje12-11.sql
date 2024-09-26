USE Pruebas
go
-- Esta base de datos la creamos
-- en el capítulo 11 del libro

CREATE TABLE PruebaThrow(
	Col1 integer PRIMARY KEY)
go

BEGIN TRY
	SET NOCOUNT ON
	INSERT INTO PruebaThrow VALUES(1)
	-- Forzamos un error de violación de clave primaria
	INSERT INTO PruebaThrow VALUES(2)
END TRY
BEGIN CATCH
	PRINT 'THROW en el bloque CATCH';
	-- la instrucción anterior a THROW
	-- debe tener el ; de finalización de sentencia
	THROW
END CATCH

