BEGIN
	DECLARE @num1 decimal(7,2), @num2 decimal(7,2)
	DECLARE @producto decimal(12,2)

	SET @num1 = RAND()*10
	SET @num2 = RAND()*10
	SET @producto = @num1 * @num2

	PRINT CONCAT('Num1 = ', @num1)
	PRINT CONCAT('Num2 = ', @num2)
	PRINT CONCAT('Producto = ', @producto)
END

