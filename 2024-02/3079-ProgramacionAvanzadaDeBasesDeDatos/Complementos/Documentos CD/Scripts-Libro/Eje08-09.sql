USE QhatuPERU
go

SELECT NomProveedor, Ciudad,
	Ubicacion =
		CASE Ciudad
			WHEN 'Lima' THEN 'Capital'
			WHEN 'Callao' THEN 'Puerto'
			ELSE 'Provincias'
		END
FROM PROVEEDOR
go
