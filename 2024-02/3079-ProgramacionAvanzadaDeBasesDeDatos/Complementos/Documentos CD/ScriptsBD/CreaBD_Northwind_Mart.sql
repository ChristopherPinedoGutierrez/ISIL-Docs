USE master
go

CREATE DATABASE Northwind_Mart
go

USE Northwind_Mart
go

CREATE TABLE Dim_Categoria(
	Categoria_SKey int NOT NULL
		CONSTRAINT pk_Dim_Categoria PRIMARY KEY,
	Categoria_ID int NOT NULL,
	Categoria_Nombre nvarchar(20) NOT NULL,
	Categoria_Descripcion nvarchar(100) NOT NULL )
go	

CREATE TABLE Dim_Producto(
	Producto_SKey int NOT NULL
		CONSTRAINT pk_Dim_Producto PRIMARY KEY,
	Producto_ID int NOT NULL,
	Producto_Nombre nvarchar(60) NOT NULL,
	Producto_PUnitario money NULL,
	Producto_Categoria_SKey int NOT NULL
		CONSTRAINT fk_Dim_Producto_Dim_Categoria
		FOREIGN KEY REFERENCES Dim_Categoria )
go

CREATE TABLE Dim_Empleado(
	Empleado_SKey int NOT NULL
		CONSTRAINT pk_Dim_Empleado PRIMARY KEY,
	Empleado_ID int NOT NULL,
	Empleado_NombreCompleto nvarchar(50) NOT NULL )
go		

CREATE TABLE Dim_PaisCliente(
	PaisCliente_SKey int NOT NULL
		CONSTRAINT pk_Dim_PaisCliente PRIMARY KEY,	
	Cliente_Pais nvarchar(15) NOT NULL )
go

CREATE TABLE Dim_Cliente(
	Cliente_SKey int NOT NULL
		CONSTRAINT pk_Dim_Cliente PRIMARY KEY,
	Cliente_ID nvarchar(5) NOT NULL,
	Cliente_Nombre nvarchar(40) NOT NULL,
	PaisCliente_SKey int NOT NULL
		CONSTRAINT fk_Dim_Cliente_Dim_PaisCliente
		FOREIGN KEY REFERENCES Dim_PaisCliente )
go

CREATE TABLE Dim_PaisProveedor(
	PaisProveedor_SKey int NOT NULL
		CONSTRAINT pk_Dim_PaisProveedor PRIMARY KEY,	
	Proveedor_Pais nvarchar(15) NOT NULL )
go

CREATE TABLE Dim_Proveedor(
	Proveedor_SKey int NOT NULL
		CONSTRAINT pk_Dim_Proveedor PRIMARY KEY,
	Proveedor_ID int NOT NULL,
	Proveedor_Nombre nvarchar(40) NOT NULL,
	PaisProveedor_SKey int NOT NULL
		CONSTRAINT fk_Dim_Proveedor_Dim_PaisProveedor
		FOREIGN KEY REFERENCES Dim_PaisProveedor )
go

CREATE TABLE Dim_Tiempo(
	Tiempo_Skey int NOT NULL
		CONSTRAINT pk_Dim_Tiempo PRIMARY KEY,
	Tiempo_Fecha date NOT NULL,
	Tiempo_Año int NOT NULL,
	Tiempo_Trimestre int NOT NULL,
	Tiempo_Mes int NOT NULL,
	Tiempo_DiaDeMes int NOT NULL,
	Tiempo_Descripcion_Trimestre nvarchar(15) NULL,
	Tiempo_Descripcion_Mes nvarchar(10) NULL )
go	

CREATE TABLE Fact_Ventas(
	Cliente_SKey int NOT NULL
		CONSTRAINT fk_Fact_Ventas_Dim_Cliente
		FOREIGN KEY REFERENCES Dim_Cliente,
	Empleado_SKey int NOT NULL
		CONSTRAINT fk_Fact_Ventas_Dim_Empleado
		FOREIGN KEY REFERENCES Dim_Empleado,
	Producto_SKey int NOT NULL
		CONSTRAINT fk_Fact_Ventas_Dim_Producto
		FOREIGN KEY REFERENCES Dim_Producto,
	Proveedor_SKey int NOT NULL
		CONSTRAINT fk_Fact_Ventas_Dim_Proveedor
		FOREIGN KEY REFERENCES Dim_Proveedor,
	Tiempo_Skey int NOT NULL
		CONSTRAINT fk_Fact_Ventas_Dim_Tiempo
		FOREIGN KEY REFERENCES Dim_Tiempo,
	Ventas_Unidades int NOT NULL,	
	Ventas_Monto money NOT NULL
	CONSTRAINT pk_Fact_Ventas
	PRIMARY KEY(Cliente_SKey, Empleado_SKey,
		Producto_SKey, Proveedor_SKey, Tiempo_SKey ))
go	

