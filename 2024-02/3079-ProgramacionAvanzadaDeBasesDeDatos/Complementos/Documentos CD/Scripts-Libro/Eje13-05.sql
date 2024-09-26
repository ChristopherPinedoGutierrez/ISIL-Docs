USE QhatuPERU
go

-- Función tabla evaluada en línea que retorna todos
-- los subordinados del empleado que se le entrega como
-- argumento
CREATE FUNCTION udf_ListaSubordinados(
	@colaborador AS INT )
	RETURNS @lista TABLE(
		idColaborador int not null,
		nombre varchar(40)not null,
		idSuperior int null,
		nivel int not null )
AS
BEGIN
	WITH Arbol_Colaboradores(idColaborador, nombre, 
		idSuperior, nivel)
	AS
	( 
   	-- Miembro ancla
    SELECT idColaborador, nombre, idSuperior, 0
    FROM Colaborador
    WHERE idColaborador = @colaborador
	 
    UNION all
    
    -- Miembro recursivo
    SELECT c.idColaborador, c.nombre, c.idSuperior, ac.nivel+1
    FROM Colaborador c INNER JOIN Arbol_Colaboradores ac
		ON c.idSuperior = ac.idColaborador
	)
	INSERT INTO @lista
    SELECT * FROM Arbol_Colaboradores
	RETURN
END
go

SELECT * FROM udf_ListaSubordinados(2)
go

-- Subordinados del responsable de cada departamento
SELECT * FROM Departamento d
	CROSS APPLY udf_ListaSubordinados(d.idResponsable) ls
go

SELECT * FROM Departamento d
	OUTER APPLY udf_ListaSubordinados(d.idResponsable) ls
go





