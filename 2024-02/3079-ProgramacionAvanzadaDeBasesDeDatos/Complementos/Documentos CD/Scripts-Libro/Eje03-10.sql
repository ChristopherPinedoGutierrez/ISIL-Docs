USE QhatuPERU
Go

CREATE TABLE ARTICULO (
        CodArticulo			int IDENTITY PRIMARY KEY,
        CodLinea           	int NOT NULL,
        CodProveedor       	int NOT NULL,
        DescripcionArticulo varchar(40) NOT NULL,
        Presentacion        varchar(30) NULL,
        PrecioProveedor     money NULL,
        StockActual         smallint NULL,
        StockMinimo         smallint NULL,
        Descontinuado       bit )
go

SELECT name FROM sys.tables
go

	
