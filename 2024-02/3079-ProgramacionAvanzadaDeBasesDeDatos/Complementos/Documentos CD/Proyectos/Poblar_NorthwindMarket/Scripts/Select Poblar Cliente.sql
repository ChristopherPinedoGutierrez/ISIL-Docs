USE Northwind
go

SELECT CustomerID, CompanyName, Address,
	Phone, City, Country
FROM Customers
UNION
SELECT CAST(LOCAL.IdLocal AS nvarchar(5)),
	'MarketPERU', Local.Direccion,
	Local.Telefono, 'Lima', 'Perú'
FROM MarketPERU..LOCAL
go
