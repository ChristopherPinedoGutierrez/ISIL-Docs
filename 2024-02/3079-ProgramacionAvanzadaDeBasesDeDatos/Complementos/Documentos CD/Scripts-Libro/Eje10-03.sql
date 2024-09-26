USE QhatuPERU
go

SELECT NomProveedor, Direccion, Ciudad
FROM PROVEEDOR
WHERE Departamento <> 'Lima'
go

SELECT @@ROWCOUNT
go

