DECLARE @num int
SET @num = CAST(RAND()*100 AS int)

IF @num >= 0 AND @num <= 30 GOTO Marca1
IF @num > 30 AND @num <= 50 GOTO Marca2
IF @num > 50 AND @num <= 100 GOTO Marca3

Marca1:
PRINT CONCAT('Num=', @num, ' [0,30]')
GOTO Marca4
Marca2:
PRINT CONCAT('Num=', @num, ' (30,50]')
GOTO Marca4
Marca3:
PRINT CONCAT('Num=', @num, ' (50,100]')
Marca4:
PRINT 'Fin'