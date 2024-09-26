USE Master
go

IF EXISTS ( SELECT name FROM sysdatabases WHERE name = 'NorthwindMarket' )
	DROP DATABASE NorthwindMarket
go

CREATE DATABASE NorthwindMarket
go

USE NorthwindMarket
go

CREATE TABLE Linea(
	codLinea smallint not null IDENTITY(1,1) PRIMARY KEY,
	codLineaOrigen smallint not null,
	nomLinea nvarchar(20) not null,
	descripcion nvarchar(120) null )
go

CREATE TABLE Abastecedor(
	codAbastecedor integer not null IDENTITY(1,1) PRIMARY KEY,
	codAbastecedorOrigen integer not null,
	nomAbastecedor nvarchar(40) not null,
	direccion nvarchar(60) null,
	telefono nvarchar(24) null,
	ciudad nvarchar(15) null,
	pais nvarchar(15) null )
go

CREATE TABLE Articulo(
	codArticulo integer not null IDENTITY(1,1) PRIMARY KEY,
	codArticuloOrigen integer not null,
	nomArticulo nvarchar(40) not null,
	codLinea smallint not null FOREIGN KEY
		REFERENCES Linea,
	codAbastecedor integer not null FOREIGN KEY
		REFERENCES Abastecedor,
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
	codArticulo integer not null FOREIGN KEY
		REFERENCES Articulo,
	precioVenta money not null,
	cantidad smallint not null
	PRIMARY KEY(numPedido, codArticulo) )
go


