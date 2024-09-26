sp_addmessage 60001, 16,
'The status of article %i (%s) has changed to DISCONTINUED (valor 0)',
'us_english'
go

sp_addmessage 60001, 16,
'El estado del artículo %2! (%1!) ha cambiado a DESCONTINUADO (valor 0)',
'spanish'
go

RAISERROR(60001, 16, 1, 199, 'Arroz perlado')
go


