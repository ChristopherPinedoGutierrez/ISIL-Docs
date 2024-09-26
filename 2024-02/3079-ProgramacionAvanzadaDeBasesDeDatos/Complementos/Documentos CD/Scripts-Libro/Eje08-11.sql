USE QhatuPERU
go

-- Consulta que muestra el monto despachado
-- de todos los envíos a las tiendas.
SELECT LINEA.NomLinea AS Linea,
	CAST(YEAR(GUIA_ENVIO.FechaSalida) AS CHAR(4)) + '-' +
	DATENAME(MONTH, GUIA_ENVIO.FechaSalida) AS Periodo,
	GUIA_DETALLE.CantidadEnviada * GUIA_DETALLE.PrecioVenta
	AS Monto
FROM LINEA INNER JOIN ARTICULO
	ON LINEA.CodLinea = ARTICULO.CodLinea
INNER JOIN GUIA_DETALLE
	ON ARTICULO.CodArticulo = GUIA_DETALLE.CodArticulo
INNER JOIN GUIA_ENVIO
	ON GUIA_DETALLE.NumGuia = GUIA_ENVIO.NumGuia
go

-- Consulta PIVOT que consolida y pivotea
-- la data de la consulta anterior
SELECT * FROM
(
SELECT LINEA.NomLinea AS Linea,
	CAST(YEAR(GUIA_ENVIO.FechaSalida) AS CHAR(4)) + '-' +
	DATENAME(MONTH, GUIA_ENVIO.FechaSalida) AS Periodo,
	GUIA_DETALLE.CantidadEnviada * GUIA_DETALLE.PrecioVenta
	AS Monto
FROM LINEA INNER JOIN ARTICULO
	ON LINEA.CodLinea = ARTICULO.CodLinea
INNER JOIN GUIA_DETALLE
	ON ARTICULO.CodArticulo = GUIA_DETALLE.CodArticulo
INNER JOIN GUIA_ENVIO
	ON GUIA_DETALLE.NumGuia = GUIA_ENVIO.NumGuia
) AS Origen
PIVOT (SUM(Monto) FOR Periodo
	IN ( [2013-Marzo], [2013-Abril] )) AS Destino
go

