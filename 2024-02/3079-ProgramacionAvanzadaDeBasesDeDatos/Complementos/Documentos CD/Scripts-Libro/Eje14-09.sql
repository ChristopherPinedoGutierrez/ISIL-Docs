USE Test
go

SELECT  name, parent_id, create_date, modify_date, is_instead_of_trigger
FROM sys.triggers
WHERE type = 'TR'
go

SELECT  name, object_id, schema_id, parent_object_id,
	type_desc, create_date, modify_date, is_published
FROM sys.objects
WHERE type = 'TR' 
go

