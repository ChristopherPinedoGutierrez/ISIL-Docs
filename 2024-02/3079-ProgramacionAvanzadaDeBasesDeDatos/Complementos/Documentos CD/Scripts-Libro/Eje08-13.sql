USE QhatuPERU
go

SELECT * FROM Trabajador
go

WITH EmpleadosCTE(Codigo, Nombre, Nivel)
AS
(
-- miembro ancla - consulta no recursiva
SELECT idTrabajador, Apellidos, 0 AS Nivel
FROM Trabajador
WHERE Jefe IS NULL
UNION ALL
-- miembro recursivo - consulta recursiva
SELECT t.idTrabajador, t.Apellidos, Nivel+1
FROM Trabajador t INNER JOIN EmpleadosCTE e
	ON t.Jefe = e.Codigo
)
-- consulta externa
SELECT * FROM EmpleadosCTE
go
