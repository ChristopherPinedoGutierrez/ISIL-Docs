USE Supermercados;

-- Obtener el precio promedio de los productos
-- que comercializa Supermercados
SELECT avg(PrecioProveedor)
FROM PRODUCTO;

-- Obtener una lista de los productos cuyo precio
-- está por encima del precio promedio
SELECT IdProducto, Nombre, PrecioProveedor
FROM PRODUCTO
WHERE PrecioProveedor > (SELECT avg(PrecioProveedor)
							FROM PRODUCTO);

-- TIPOS DE SUBCONSULTAS
--
/*
Subconsulta definida en la lista de columnas de la
consulta principal
SELECT ..., (SELECT ...), ...
FROM Tablas
WHERE filtroFilas
En este caso, la subconsulta debe entregar un solo valor
(1 fila, 1 columna)
*/

-- Generar una lista de productos que muestre:
-- código y nombre del producto
-- precio del producto
-- diferencia entre el precio del producto y el precio promedio
SELECT IdProducto, Nombre, PrecioProveedor,
	PrecioProveedor - 
	(SELECT avg(PrecioProveedor) FROM PRODUCTO) AS Diferencia
FROM PRODUCTO;

/*
Subconsulta definida en el WHERE de la consulta principal.

SELECT ...
FROM Tablas
WHERE filtroFilas operador (SELECT ... )

Si operador es un operador relacional (=, <, >, <=, >=, <>)
la subconsulta debe entregar un solo valor (1 fila, 1 columna)

Si operador es distinto a un operador relacional,
la subconsulta puede entregar un conjunto de valores
(varias filas, 1 columna)
*/

-- Obtener una lista de los productos cuyo precio
-- está por encima del precio promedio
SELECT IdProducto, Nombre, PrecioProveedor
FROM PRODUCTO
WHERE PrecioProveedor > (SELECT avg(PrecioProveedor)
							FROM PRODUCTO);
