DECLARE @num1 int, @contador int, @num2 decimal(7,2)
SET @num1 = CAST(RAND()*10 AS int)
SET @contador = 0
SET @num2 = 0

WHILE @contador <= @num1
	BEGIN
	SET @num2 = RAND()
	PRINT CONCAT('Contador = ', @contador, ' - ', @num2)
	SET @contador = @contador + 1
	END

