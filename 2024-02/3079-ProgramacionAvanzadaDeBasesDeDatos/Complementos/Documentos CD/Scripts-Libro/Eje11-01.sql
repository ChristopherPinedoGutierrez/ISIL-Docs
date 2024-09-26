CREATE DATABASE Pruebas

USE Pruebas

SET NOCOUNT ON

SET IMPLICIT_TRANSACTIONS OFF

CREATE TABLE Prueba1(
	colA int )

INSERT INTO Prueba1 VALUES(1)
PRINT @@TRANCOUNT
-- 0 transacciones abiertas

-- Inicio de una transacción explícita
BEGIN TRANSACTION
INSERT INTO Prueba1 VALUES(2)
PRINT @@TRANCOUNT
-- 1 transacción abierta

COMMIT TRANSACTION
PRINT @@TRANCOUNT
-- 0 transacciones abiertas

SET IMPLICIT_TRANSACTIONS ON

INSERT INTO Prueba1 VALUES(3)
PRINT @@TRANCOUNT
-- 1 transacción abierta
-- pese a que no se ha ejecutado BEGIN TRANSACTION

COMMIT TRANSACTION
PRINT @@TRANCOUNT
-- 0 transacciones abiertas

BEGIN TRANSACTION
PRINT @@TRANCOUNT
-- 2 transacciones abiertas
-- IMPLICIT_TRANSACTIONS es ON
-- se anida la transacción explícita

INSERT INTO Prueba1 VALUES(4)

COMMIT TRANSACTION
PRINT @@TRANCOUNT
-- 1 transacción abierta

COMMIT TRANSACTION
-- cerramos la transacción abierta

SET IMPLICIT_TRANSACTIONS OFF










