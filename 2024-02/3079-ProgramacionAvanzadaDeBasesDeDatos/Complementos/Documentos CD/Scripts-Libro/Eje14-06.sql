USE Test
go

CREATE TRIGGER tg_update_v_Usuarios
ON v_Usuarios
INSTEAD OF UPDATE
AS
DECLARE @tipo char(1)
SET @tipo = (SELECT left(idUsuario, 1)
					FROM inserted)
IF @tipo = 'C'
	BEGIN
	UPDATE Cliente
		SET Cliente.telefono = inserted.telefono
		FROM Cliente INNER JOIN inserted
		ON Cliente.idCliente = inserted.idUsuario
	END
ELSE
IF @tipo = 'P'
	BEGIN
	UPDATE Proveedor
		SET Proveedor.telefono = inserted.telefono
		FROM Proveedor INNER JOIN inserted
		ON Proveedor.idProveedor = inserted.idUsuario
	END
go

-- Verificamos el teléfomo registrado para P0001
SELECT * FROM Proveedor
	WHERE idProveedor = 'P0001'
go
-- Su telefono es 4512345

-- Usamos la vista para cambiar el telefono de P0001
UPDATE v_Usuarios
	SET telefono = '4231234'
	WHERE idUsuario = 'P0001'
go

SELECT * FROM Proveedor
go
-- el telefono de P0001 fue actualizado en la tabla correspondiente




