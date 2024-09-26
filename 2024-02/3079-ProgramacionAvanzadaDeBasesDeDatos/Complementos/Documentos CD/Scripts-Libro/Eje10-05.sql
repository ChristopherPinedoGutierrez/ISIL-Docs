DECLARE @num decimal(7,2)
SET @num = RAND()*100

IF @num > 50
	BEGIN
		SET @num = @num * (-1)
		PRINT CONCAT('Valor cambiado = ', @num)
	END
ELSE
	PRINT CONCAT('Valor sin cambio = ', @num)

