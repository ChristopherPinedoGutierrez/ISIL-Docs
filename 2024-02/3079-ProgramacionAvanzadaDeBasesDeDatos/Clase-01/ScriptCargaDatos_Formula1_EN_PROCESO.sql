USE Formula1;

-- Cargar los 2 registros a la tabla Circuito
-- La carga se debe ejecutar fila por fila
INSERT INTO Circuito 
	VALUES(1, 'Albert Park Grand Prix Circuit', 
		'Melbourne', 'Australia');
INSERT INTO Circuito 
	VALUES(2, 'Sepang International Circuit', 
		'Kuala Lumpur', 'Malaysia');

SELECT * FROM Circuito;

-- Cargar las 4 marcas de la muestra de datos a la 
-- tabla Marca usando una sola sentencia INSERT
INSERT INTO Marca VALUES
	(1, 'McLaren', 'British'),
	(2, 'BMW Sauber', 'German'),
	(6, 'Ferrari', 'Italian'),
	(23, 'Brawn', 'British');

SELECT * FROM Marca;


