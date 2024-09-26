USE BibliotecaGyS
go

SELECT * FROM usuario
go

UPDATE usuario
	SET usu_tel = '5714315'
	WHERE usu_cod = '961002'
go

SELECT * FROM usuario
	WHERE usu_cod = '961002'
go
