USE QhatuPERU
go

SELECT CodProveedor, NomProveedor,
	Telefono, Departamento
FROM PROVEEDOR
WHERE Departamento <> 'Lima'
go
