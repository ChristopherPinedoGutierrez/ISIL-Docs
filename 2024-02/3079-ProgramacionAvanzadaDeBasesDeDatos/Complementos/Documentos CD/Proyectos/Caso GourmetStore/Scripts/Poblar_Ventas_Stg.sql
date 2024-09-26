USE Northwind
go

SELECT Orders.CustomerID, Northwind_Stg..Cliente_Stg.skCliente,
	Orders.EmployeeID, Northwind_Stg..Empleado_Stg.skEmpleado,
	[Order Details].ProductID, Northwind_Stg..Producto_Stg.skProducto,
	Products.SupplierID, Northwind_Stg..Proveedor_Stg.skProveedor,
	DATEFROMPARTS(YEAR(Orders.OrderDate), MONTH(Orders.OrderDate), DAY(Orders.OrderDate)) AS fecha,
	Northwind_Stg..Tiempo_Stg.skTiempo,
	[Order Details].Quantity AS unidadesVendidas,
	[Order Details].Quantity * [Order Details].UnitPrice AS montoVendido
FROM Orders INNER JOIN Northwind_Stg..Cliente_Stg
	ON Orders.CustomerID = Northwind_Stg..Cliente_Stg.idCliente
INNER JOIN Northwind_Stg..Empleado_Stg
	ON Orders.EmployeeID = Northwind_Stg..Empleado_Stg.idEmpleado
INNER JOIN [Order Details]
	ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Northwind_Stg..Producto_Stg
	ON [Order Details].ProductID = Northwind_Stg..Producto_Stg.idProducto
INNER JOIN Products
	ON [Order Details].ProductID = Products.ProductID
INNER JOIN Northwind_Stg..Proveedor_Stg
	ON Products.SupplierID = Northwind_Stg..Proveedor_Stg.idProveedor
INNER JOIN Northwind_Stg..Tiempo_Stg
	ON DATEFROMPARTS(YEAR(Orders.OrderDate), MONTH(Orders.OrderDate), DAY(Orders.OrderDate)) = Northwind_Stg..Tiempo_Stg.fecha



