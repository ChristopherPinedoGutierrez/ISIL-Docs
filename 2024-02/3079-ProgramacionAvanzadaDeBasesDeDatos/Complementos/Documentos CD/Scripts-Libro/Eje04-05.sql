USE BibliotecaGyS
go

INSERT INTO recibo(rec_num, rec_fec_emi, rec_mon)
	VALUES(1001, getdate(), 10)
go

SELECT * FROM recibo
go
