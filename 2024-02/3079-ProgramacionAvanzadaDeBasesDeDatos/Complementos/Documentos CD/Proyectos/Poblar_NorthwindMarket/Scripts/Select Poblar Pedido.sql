USE Northwind
go

SELECT OrderID, NorthwindMarket..Cliente.codCliente,
	OrderDate
FROM Orders INNER JOIN NorthwindMarket..Cliente
	ON Orders.CustomerID = NorthwindMarket..Cliente.codClienteOrigen
UNION
SELECT GUIA.IdGuia, NorthwindMarket..Cliente.codCliente,
	GUIA.FechaSalida
FROM MarketPERU..GUIA INNER JOIN NorthwindMarket..Cliente
	ON CAST(MarketPERU..GUIA.IdLocal AS nvarchar(5)) =
		NorthwindMarket..Cliente.codClienteOrigen
go


