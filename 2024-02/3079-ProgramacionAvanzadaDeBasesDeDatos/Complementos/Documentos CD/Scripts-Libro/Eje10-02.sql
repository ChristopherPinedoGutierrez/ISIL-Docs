USE QhatuPERU
go

-- asignar valor a variable usando SELECT
DECLARE @articulo varchar(40)
SELECT @articulo = 'COREDISE'
SELECT @articulo AS Nombre
go

-- asignar valor a variable con el resultado de una consulta
DECLARE @articulo varchar(40)
SELECT @articulo = DescripcionArticulo FROM ARTICULO
SELECT @articulo AS Nombre
go
-- le asigna a la variable el último de los valores leidos
-- por la consulta

DECLARE @articulo varchar(40)
SELECT @articulo = (SELECT DescripcionArticulo
		FROM ARTICULO WHERE CodProveedor = 999)
SELECT @articulo AS Nombre
go
-- la consulta no encuentra datos.
-- se le asigna el valor NULL a la variable


