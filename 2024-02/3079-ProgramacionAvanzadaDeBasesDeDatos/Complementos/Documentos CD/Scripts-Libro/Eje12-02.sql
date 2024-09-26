DECLARE @denom decimal(18,4), @contador integer
DECLARE @pi decimal(18,4), @control bit
SET @denom = 3.0
SET @contador = 0

SET @pi = 4.0
SET @control = 0
WHILE @contador < 20000000
BEGIN
	IF @control = 0
		BEGIN
		SET @pi = @pi + (4.0/@denom)
		SET @control = 1
		END
	ELSE
		BEGIN
		SET @pi = @pi + (4.0/@denom)
		SET @control = 0
		END
	SET @contador = @contador + 1
	SET @denom = @denom + 2.0
END
PRINT CONCAT('PI = ', @pi)