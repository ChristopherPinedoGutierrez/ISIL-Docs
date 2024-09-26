DECLARE @num1 int, @contador int, @num2 decimal(7,2)
SET @num1 = CAST(RAND()*10 AS int)
SET @contador = 0
SET @num2 = 0

WHILE @contador <= @num1
BEGIN
	PRINT CONCAT('Contador = ', @contador, ' - ', @num2)
	SET @contador = @contador + 1
	SET @num2 = RAND()
	IF @num2 > 0.5
		BEGIN
		PRINT 'Bucle interrumpido, Num2 > 0.50'
		BREAK
		END
	ELSE
		CONTINUE
END
PRINT 'Se ha ejecutado BREAK'
