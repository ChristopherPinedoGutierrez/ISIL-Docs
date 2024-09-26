USE QhatuPERU
go

-- Consultado que objetos de tipo Vista contiene
-- la base de datos QhatuPERU
SELECT name FROM sys.sysobjects
	WHERE type = 'V'
go

-- Obteniendo las propiedades de la vista v_ListaPrecios
sp_help v_ListaPrecios
go

-- Mostrando el código que ejecuta la vista
sp_helptext v_ListaPrecios
go

-- Mostrando los objetos que dependen de la vista
sp_depends v_ListaPrecios
go




