/* Script de creación de Northwind_Stg */

USE master
go

CREATE DATABASE Northwind_Stg
go

USE Northwind_Stg
go

CREATE TABLE Cliente_Stg(
	skCliente integer not null IDENTITY(1,1),
	idCliente nvarchar(5) not null,	
	nomCliente nvarchar(40) not null,
	pais nvarchar(15) null )
go

CREATE TABLE PaisCliente_Stg(
	skPaisCliente integer not null IDENTITY(1,1),
	nomPaisCliente nvarchar(15) not null )
go	

CREATE TABLE Empleado_Stg(
	skEmpleado integer not null IDENTITY(1,1),
	idEmpleado integer not null,
	nomEmpleado nvarchar(50) not null )
go

CREATE TABLE Categoria_Stg(
	skCategoria integer not null IDENTITY(1,1),
	idCategoria integer not null,
	nomCategoria nvarchar(20) not null,
	desCategoria nvarchar(100) not null )
go

CREATE TABLE Producto_Stg(
	skProducto integer not null IDENTITY(1,1),
	idProducto integer not null,
	nomProducto nvarchar(60) not null,
	presentacion nvarchar(20) null,
	precioUnitario money null,
	idCategoria integer not null,
	nomCategoria nvarchar(20) not null )
go

CREATE TABLE PaisProveedor_Stg(
	skPaisProveedor integer not null IDENTITY(1,1),
	nomPaisProveedor nvarchar(15) not null )
go

CREATE TABLE Proveedor_Stg(
	skProveedor integer not null IDENTITY(1,1),
	idProveedor integer not null,
	nomProveedor nvarchar(40) not null,
	nomPaisProveedor nvarchar(15) not null )
go

CREATE TABLE Tiempo_Stg(
	skTiempo integer not null IDENTITY(1,1),
	fecha date not null,
	dia integer not null,
	mes integer not null,
	trimestre integer not null,
	año integer not null,
	cmes nvarchar(10) null,
	ctrimestre nvarchar(15) null )
go	

CREATE TABLE Ventas_Stg(
	idCliente nvarchar(5) not null,
	skCliente integer not null,
	idEmpleado integer not null,
	skEmpleado integer not null,
	idProducto integer not null,
	skProducto integer not null,
	idProveedor integer not null,
	skProveedor integer not null,
	fecha date not null,
	skTiempo integer not null,
	unidadesVendidas integer not null,
	montoVendido money not null )
go
	

	
	




