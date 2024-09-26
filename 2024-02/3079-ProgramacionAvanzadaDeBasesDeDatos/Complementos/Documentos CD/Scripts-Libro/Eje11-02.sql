USE Pruebas
go

CREATE TABLE PruebaBatch(
	ColA int PRIMARY KEY,
	ColB char(3) not null )
go

INSERT INTO PruebaBatch VALUES(1, 'aaa')
INSERT INTO PruebaBatch VALUES(2, 'bbb')
INSERT INTO PruebaBatch VALEUS(3, 'ccc')
-- Error de sintáxis en el último INSERT
go

SELECT * FROM PruebaBatch
go

