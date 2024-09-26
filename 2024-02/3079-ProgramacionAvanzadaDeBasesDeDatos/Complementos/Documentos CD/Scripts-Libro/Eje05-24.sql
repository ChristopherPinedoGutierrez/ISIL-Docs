USE QhatuPERU
go

SELECT idEmpleado, apellido, haberBasico,
	porcentajeComision,
	monto = haberBasico + 10000 * porcentajeComision / 100
FROM Empleado
go


