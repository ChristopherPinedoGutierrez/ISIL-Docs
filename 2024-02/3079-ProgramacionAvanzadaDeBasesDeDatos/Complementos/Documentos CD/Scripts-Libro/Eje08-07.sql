USE QhatuPERU
go

SELECT COUNT(DISTINCT FechaIngreso) FROM ORDEN_COMPRA
go
-- 16 fechas distintas para FechaIngreso

SELECT COUNT(DISTINCT FechaSalida) FROM GUIA_ENVIO
go
-- 107 fechas distintas para FechaSalida

-- EXCEPT
-- Todas las fechas en las que hubo entradas,
-- pero no hubo salidas
SELECT CONVERT(CHAR(10), FechaIngreso, 103) AS FechaMovimiento,
	'Entrada' AS Movimiento
FROM ORDEN_COMPRA
EXCEPT
SELECT CONVERT(CHAR(10), FechaSalida, 103),
	'Salida' AS Movimiento
FROM GUIA_ENVIO
ORDER BY FechaMovimiento
go
-- 4 fechas en las que solo hubo entradas

