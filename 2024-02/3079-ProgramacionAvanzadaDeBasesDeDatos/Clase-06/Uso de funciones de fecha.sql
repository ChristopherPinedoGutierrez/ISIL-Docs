USE Supermercados;

/* Funciones de fecha
*/
SELECT GETDATE();
-- fecha y hora del sistema (servidor)

-- Obtener partes de fecha
-- obtener el año de una fecha
-- year(fecha), entrega un valor entero
SELECT FechaSalida, year(FechaSalida) AS año
FROM GUIA;

-- obtener el mes de una fecha
-- month(fecha), entrega un entero
SELECT FechaSalida, year(FechaSalida) AS año,
	month(FechaSalida) AS mes
FROM GUIA;

-- obtener el número del dia de una fecha
-- day(fecha), entrega un entero
SELECT FechaSalida, year(FechaSalida) AS año,
	month(FechaSalida) AS mes, day(FechaSalida) AS dia
FROM GUIA;

-- Uso de la función datepart
-- datepart(parteFecha, fecha), entrega un entero
-- obtener el mes de una fecha
SELECT FechaSalida, datepart(month, FechaSalida) AS mes
FROM GUIA;

-- obtener el trimestre de una fecha
SELECT FechaSalida, datepart(quarter, FechaSalida) AS trimestre
FROM GUIA;

-- obtener el día de la semana de una fecha
SELECT FechaSalida, datepart(WEEKDAY, FechaSalida) 
FROM GUIA;

-- Uso de la función datename
-- datename(parteFecha, fecha), entrega una cadena

-- obtener el año de una fecha
SELECT FechaSalida, datename(year, FechaSalida)
FROM GUIA;

-- obtener el mes de una fecha
SELECT FechaSalida, datename(month, FechaSalida)
FROM GUIA;

-- obtener el día de la semana de una fecha
SELECT FechaSalida, datename(dw, FechaSalida)
FROM GUIA;

-- En Supermercados, la tabla GUIA es una relación
-- de todas las salidas del almacén.
-- Generar un listado de todas las salidas
-- ejecutadas en marzo del 2020.
SELECT * FROM GUIA
WHERE YEAR(FechaSalida) = 2020
	AND MONTH(FechaSalida) = 3;

-- Obtener el rango de fechas registradas en  la
-- tabla GUIA
SELECT min(FechaSalida), max(FechaSalida)
FROM GUIA;

-- ¿Cuánto es el monto total (en dinero)
-- despachado el 10 de septiembre del 2024?
SELECT sum(GUIA_DETALLE.PrecioVenta * GUIA_DETALLE.Cantidad)
FROM GUIA_DETALLE INNER JOIN GUIA
	ON GUIA_DETALLE.IdGuia = GUIA.IdGuia
WHERE GUIA.FechaSalida = '10/09/2024';
-- el servidor puede leer la cadena '10/09/2024'
-- como 10 septiembre 2024, pero también la puede leer
-- como 9 octubre 2024.
-- Por lo general, no solemos conocer con qué formato 
-- de fecha está trabajando el servidor.

-- Solución 1: usar para la cadena de fecha el formato ANSI
SELECT sum(GUIA_DETALLE.PrecioVenta * GUIA_DETALLE.Cantidad)
FROM GUIA_DETALLE INNER JOIN GUIA
	ON GUIA_DETALLE.IdGuia = GUIA.IdGuia
WHERE GUIA.FechaSalida = '2024/09/10';

-- Solución 2:
SET DATEFORMAT DMY;

SELECT sum(GUIA_DETALLE.PrecioVenta * GUIA_DETALLE.Cantidad)
FROM GUIA_DETALLE INNER JOIN GUIA
	ON GUIA_DETALLE.IdGuia = GUIA.IdGuia
WHERE GUIA.FechaSalida = '10/09/2024';











