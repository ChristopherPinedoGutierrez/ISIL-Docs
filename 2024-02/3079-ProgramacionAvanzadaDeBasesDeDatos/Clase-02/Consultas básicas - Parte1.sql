/* DISEÑO DE CONSULTAS O QUERIES */
USE Formula1;

-- Obtener una lista de los pilotos registrados en la base de datos
SELECT * FROM Piloto;

/* Sintáxis básica de SELECT
SELECT * | listaColumnas
FROM tabla
[WHERE filtroFilas]
[ORDER BY col(s)];
*/

SELECT nombre, apellido, idPiloto, fechaNacimiento
FROM Piloto;

-- Obtener un lista que muestre el nombre, apellido y la
-- edad de cada piloto
--
-- Uso de una columna calculada o columna computada
-- fórmula para obtener la edad del piloto
SELECT nombre, apellido, 
	YEAR(getdate()) - year(fechaNacimiento) AS edad
FROM Piloto;

SELECT year(GETDATE());

-- Obtener una lista que muestre para cada carrera lo siguiente:
-- código de la carrera, nombre de la carrera, fecha,
-- nombre del circuito en el que se ejecutó la carrera.

-- Carrera.idCarrera, Carrera.nomCarrera, Carrera.fecha
-- Circuito.nomCircuito
--
-- Relación: Carrera.idCircuito = Circuito.idCircuito

/*
SELECT * | listaColumnas
FROM TablaA INNER JOIN TablaB
	ON relación_TablaA_TablaB;
*/
SELECT Carrera.idCarrera, Carrera.nomCarrera, Carrera.fecha,
	Circuito.nomCircuito
FROM Carrera INNER JOIN Circuito
	ON Carrera.idCircuito = Circuito.idCircuito;


-- Obtener un listado de los resultados de la carrera cuyo 
-- idCarrera es 1. La lista debe mostrar:
-- nombre del piloto, apellido del piloto, nacionalidad del piloto
-- su posición al final de la carrera, marca de auto que condujo

-- Piloto.nombre, Piloto.apellido, Piloto.nacionalidad
-- Resultado.posicionFinal, Marca.nomMarca
-- Relaciones:
-- Piloto.idPiloto = Resultado.idPiloto
-- Marca.idMarca = Resultado.idMarca
SELECT Piloto.nombre, Piloto.apellido, Piloto.nacionalidad,
	Resultado.posicionFinal, Marca.nomMarca
FROM Resultado 
INNER JOIN Piloto
	ON Piloto.idPiloto = Resultado.idPiloto
INNER JOIN Marca
	ON Marca.idMarca = Resultado.idMarca

-- El conjunto está mostrando los resultados de todos los pilotos
-- en todas las carreras en la que participaron.
-- Añadiendo el filtro para mostrar solo los resultados de la
-- carrera cuyo idCarrera es 1
SELECT Piloto.nombre, Piloto.apellido, Piloto.nacionalidad,
	Resultado.posicionFinal, Marca.nomMarca
FROM Resultado 
INNER JOIN Piloto
	ON Piloto.idPiloto = Resultado.idPiloto
INNER JOIN Marca
	ON Marca.idMarca = Resultado.idMarca
WHERE Resultado.idCarrera = 1;

-- Reto (5 puntos)
-- Lista de pilotos que han ganado las carreras
-- corridas en el circuito cuyo idCircuito es 3.
-- La lista debe mostrar: nombre del piloto, apellido del piloto,
-- la temporada, la marca de auto que condujo
SELECT Piloto.nombre, Piloto.apellido, Carrera.temporada,
	Marca.nomMarca
FROM Piloto
INNER JOIN Resultado ON Piloto.idPiloto = Resultado.idPiloto
INNER JOIN Carrera ON Carrera.idCarrera = Resultado.idCarrera
INNER JOIN Marca ON Marca.idMarca = Resultado.idMarca
WHERE Carrera.idCircuito = 3 AND Resultado.posicionFinal = 1
ORDER BY 3;













