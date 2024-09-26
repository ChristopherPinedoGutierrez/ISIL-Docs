USE QhatuPERU
go

SELECT idEmpleado, apellido, haberBasico,
	porcentajeComision,
	monto = haberBasico +
		10000 * ISNULL(porcentajeComision,0)/100
FROM Empleado
go


