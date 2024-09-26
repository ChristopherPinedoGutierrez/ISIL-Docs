USE Northwind
go

SELECT NorthwindMarket..Pedido.numPedido,
	NorthwindMarket..Articulo.codArticulo,
	[Order Details].UnitPrice, Quantity
FROM [Order Details] INNER JOIN NorthwindMarket..Pedido
	ON [Order Details].OrderID = NorthwindMarket..Pedido.numPedidoOrigen
INNER JOIN NorthwindMarket..Articulo
	ON [Order Details].ProductID = NorthwindMarket..Articulo.codArticuloOrigen
INNER JOIN Products
	ON NorthwindMarket..Articulo.nomArticulo = Products.ProductName

UNION

SELECT NorthwindMarket..Pedido.numPedido,
	NorthwindMarket..Articulo.codArticulo,
	MarketPERU..GUIA_DETALLE.PrecioVenta,
	MarketPERU..GUIA_DETALLE.Cantidad
FROM MarketPERU..GUIA_DETALLE INNER JOIN NorthwindMarket..Pedido
	ON MarketPERU..GUIA_DETALLE.IdGuia = NorthwindMarket..Pedido.numPedidoOrigen
INNER JOIN MarketPERU..PRODUCTO
	ON MarketPERU..GUIA_DETALLE.IdProducto = MarketPERU..PRODUCTO.IdProducto
INNER JOIN NorthwindMarket..Articulo
	ON MarketPERU..PRODUCTO.Nombre = NorthwindMarket..Articulo.nomArticulo
		AND MarketPERU..GUIA_DETALLE.IdProducto = NorthwindMarket..Articulo.codArticuloOrigen
