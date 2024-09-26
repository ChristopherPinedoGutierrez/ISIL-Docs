USE Test
go

SELECT OBJECT_NAME(referencing_id) AS nombreDesencadenante, 
    o.type_desc AS tipo, 
    referenced_entity_name AS tablaReferenciada
FROM sys.sql_expression_dependencies AS sed
	INNER JOIN sys.objects AS o 
	ON sed.referencing_id = o.object_id
WHERE referencing_id = OBJECT_ID('tg_Update_DetalleFactura'); 
go