USE Master
go

IF EXISTS ( SELECT name FROM sysdatabases WHERE name = 'NorthwindMarket' )
	DROP DATABASE NorthwindMarket
go

CREATE DATABASE NorthwindMarket
go

USE NorthwindMarket
go

CREATE TABLE Categoria(
	codCategoria smallint not null IDENTITY(1,1) PRIMARY KEY,
	codCategoriaOrigen smallint not null,
	nomCategoria nvarchar(20) not null,
	descripcion nvarchar(120) null )
go

CREATE TABLE Proveedor(
	codProveedor integer not null IDENTITY(1,1) PRIMARY KEY,
	codProveedorOrigen integer not null,
	nomProveedor nvarchar(40) not null,
	direccion nvarchar(60) null,
	telefono nvarchar(24) null,
	ciudad nvarchar(15) null,
	pais nvarchar(15) null )
go

CREATE TABLE Producto(
	codProducto integer not null IDENTITY(1,1) PRIMARY KEY,
	codProductoOrigen integer not null,
	nomProducto nvarchar(40) not null,
	codCategoria smallint not null FOREIGN KEY
		REFERENCES Categoria,
	codProveedor integer not null FOREIGN KEY
		REFERENCES Proveedor,
	presentacion nvarchar(30) null,
	precioUnitario money null,
	stockActual smallint null,
	stockMinimo smallint null,
	descontinuado bit not null )
go

CREATE TABLE Cliente(
	codCliente integer not null IDENTITY(1,1) PRIMARY KEY,
	codClienteOrigen nvarchar(5) not null,
	nomCliente nvarchar(40) not null,
	direccion nvarchar(60) null,
	telefono nvarchar(24) null,
	ciudad nvarchar(15) null,
	pais nvarchar(15) null )
go

CREATE TABLE Pedido(
	numPedido integer not null IDENTITY(1,1) PRIMARY KEY,
	numPedidoOrigen integer not null,
	codCliente integer not null FOREIGN KEY
		REFERENCES Cliente,
	fecha date null )
go

CREATE TABLE DetallePedido(
	numPedido integer not null FOREIGN KEY
		REFERENCES Pedido,
	codProducto integer not null FOREIGN KEY
		REFERENCES Producto,
	precioVenta money not null,
	cantidad smallint not null
	PRIMARY KEY(numPedido, codProducto) )
go


