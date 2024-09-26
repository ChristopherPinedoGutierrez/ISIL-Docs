USE Northwind
go

SELECT CategoryID, CategoryName,
CAST(Description AS nvarchar(120)) AS Descripcion
FROM Categories
UNION
SELECT IdCategoria, Nombre, Descripcion
FROM MarketPERU..Categoria
go
	
