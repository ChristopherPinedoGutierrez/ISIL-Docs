USE QhatuPERU
go

CREATE PROCEDURE usp_InfoError
AS
SELECT
    ERROR_NUMBER() AS NumeroError,
    ERROR_SEVERITY() AS SeveridadError,
    ERROR_STATE() AS EstadoError,
    ERROR_PROCEDURE() AS FuenteError,
    ERROR_LINE() AS LineaError,
    ERROR_MESSAGE() AS MensajeError;
GO

