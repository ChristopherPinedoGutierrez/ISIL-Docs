USE QhatuPERU
go

-- Vista para el listado de entradas
CREATE VIEW v_UnidadesEntrantes
AS
SELECT ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo,
	ISNULL(SUM( ORDEN_DETALLE.CantidadRecibida ), 0) AS Entradas
FROM ARTICULO LEFT OUTER JOIN ORDEN_DETALLE
	ON ARTICULO.CodArticulo = ORDEN_DETALLE.CodArticulo
GROUP BY ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo
go

-- Ejecución de la vista de entradas
SELECT * FROM v_UnidadesEntrantes
go

-- Vista para el listado de salidas
CREATE VIEW v_UnidadesSalientes
AS
SELECT ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo,
	ISNULL(SUM( GUIA_DETALLE.CantidadEnviada ), 0) AS Salidas
FROM ARTICULO LEFT OUTER JOIN GUIA_DETALLE
	ON ARTICULO.CodArticulo = GUIA_DETALLE.CodArticulo
GROUP BY ARTICULO.CodArticulo, ARTICULO.DescripcionArticulo
go

-- Ejecución de la vista de salidas
SELECT * FROM v_UnidadesSalientes
go

-- Combinación de las vistas para el balance
SELECT v_UnidadesEntrantes.CodArticulo,
	v_UnidadesEntrantes.DescripcionArticulo,
	v_UnidadesEntrantes.Entradas,
	v_UnidadesSalientes.Salidas
FROM v_UnidadesEntrantes INNER JOIN v_UnidadesSalientes
	ON v_UnidadesEntrantes.CodArticulo = 
		v_UnidadesSalientes.CodArticulo
ORDER BY v_UnidadesEntrantes.CodArticulo
go


