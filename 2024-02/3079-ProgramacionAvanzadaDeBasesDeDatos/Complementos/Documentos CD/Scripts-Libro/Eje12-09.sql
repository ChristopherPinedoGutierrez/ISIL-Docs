USE QhatuPERU
go

BEGIN TRANSACTION;
BEGIN TRY
	-- Sentencias SQL que forman parte de la transacción.
    -- Sentencia que genera un error de integridsd referencial.
    DELETE FROM GUIA_ENVIO
		WHERE NumGuia = 1;
END TRY
BEGIN CATCH
	EXECUTE usp_InfoError;
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
go