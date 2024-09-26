USE Test
go

SELECT object_id, type, type_desc, is_trigger_event, event_group_type, event_group_type_desc 
FROM sys.events
WHERE object_id = OBJECT_ID('tg_Update_DetalleFactura')
go

