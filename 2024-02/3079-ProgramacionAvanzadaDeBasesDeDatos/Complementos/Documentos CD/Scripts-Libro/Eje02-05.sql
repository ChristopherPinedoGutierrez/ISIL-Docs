ALTER DATABASE DBPrueba1
SET single_user
go

SELECT DATABASEPROPERTYEX('DBPrueba1', 'UserAccess')
go