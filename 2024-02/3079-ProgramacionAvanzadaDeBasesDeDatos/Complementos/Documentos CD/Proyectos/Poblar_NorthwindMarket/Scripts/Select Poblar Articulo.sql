USE Northwind
go

SELECT ProductID, ProductName,
	NorthwindMarket..Linea.codLinea,
	NorthwindMarket..Abastecedor.codAbastecedor,
	QuantityPerUnit, UnitPrice, UnitsInStock,
	UnitsOnOrder, Discontinued
FROM Products INNER JOIN NorthwindMarket..Linea
	ON Products.CategoryID = NorthwindMarket..Linea.codLineaOrigen
INNER JOIN Categories
	ON NorthwindMarket..Linea.nomLinea = Categories.CategoryName
INNER JOIN NorthwindMarket..Abastecedor
	ON Products.SupplierID = NorthwindMarket..Abastecedor.codAbastecedorOrigen
INNER JOIN Suppliers
	ON NorthwindMarket..Abastecedor.nomAbastecedor = Suppliers.CompanyName

UNION

SELECT MarketPERU..PRODUCTO.IdProducto,
	MarketPERU..PRODUCTO.Nombre,
	NorthwindMarket..Linea.codLinea,
	NorthwindMarket..Abastecedor.codAbastecedor,
	MarketPERU..PRODUCTO.UnidadMedida,
	MarketPERU..PRODUCTO.PrecioProveedor,
	MarketPERU..PRODUCTO.StockActual,
	MarketPERU..PRODUCTO.StockMinimo,
	MarketPERU..PRODUCTO.Descontinuado
FROM MarketPERU..PRODUCTO INNER JOIN NorthwindMarket..Linea
	ON MarketPERU..PRODUCTO.IdCategoria = NorthwindMarket..Linea.codLineaOrigen
INNER JOIN MarketPERU..CATEGORIA
	ON NorthwindMarket..Linea.nomLinea = MarketPERU..CATEGORIA.Nombre
INNER JOIN NorthwindMarket..Abastecedor
	ON MarketPERU..PRODUCTO.IdProveedor = NorthwindMarket..Abastecedor.codAbastecedorOrigen
INNER JOIN MarketPERU..PROVEEDOR
	ON NorthwindMarket..Abastecedor.nomAbastecedor = MarketPERU..PROVEEDOR.Nombre
go
