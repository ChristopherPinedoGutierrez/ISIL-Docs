USE Master
go

IF EXISTS( SELECT name FROM sysdatabases
	WHERE name = 'BibliotecaGyS' )
DROP DATABASE BibliotecaGyS
go

CREATE DATABASE BibliotecaGyS
go

USE BibliotecaGyS
go

CREATE TABLE USUARIO (
       usu_cod              char(6) NOT NULL,
       usu_pat              varchar(20) NOT NULL,
       usu_mat              varchar(20) NOT NULL,
       usu_nom              varchar(20) NOT NULL,
       usu_dir              varchar(60) NOT NULL,
       usu_tel              varchar(20) NULL,
       usu_hab              int NOT NULL,
       PRIMARY KEY (usu_cod)
)
go


CREATE TABLE TEMA (
       tem_cod              int NOT NULL,
       tem_des              varchar(40) NOT NULL,
       PRIMARY KEY (tem_cod)
)
go

CREATE TABLE PUBLICACION (
       pub_cod              int NOT NULL,
       pub_nom              varchar(100) NOT NULL,
       pub_aut              varchar(45) NOT NULL,
       tem_cod              int NOT NULL,
       pub_sum              varchar(350) NULL,
       PRIMARY KEY (pub_cod), 
       FOREIGN KEY (tem_cod)
                             REFERENCES TEMA
)
go

CREATE TABLE EJEMPLAR (
       eje_num              int NOT NULL,
       pub_cod              int NOT NULL,
       eje_edi              varchar(45) NULL,
       eje_num_edi          int NULL,
       eje_dis              char(1) NULL,
       PRIMARY KEY (eje_num, pub_cod), 
       FOREIGN KEY (pub_cod)
                             REFERENCES PUBLICACION
)
go

CREATE TABLE RECIBO (
       rec_num              int NOT NULL,
       rec_fec_emi          datetime NOT NULL,
       rec_mon              decimal(8,0) NOT NULL,
       PRIMARY KEY (rec_num)
)
go

CREATE TABLE PRESTAMO (
       pub_cod              int NOT NULL,
       pre_fec_sal          datetime NOT NULL,
       eje_num              int NOT NULL,
       usu_cod              char(6) NOT NULL,
       pre_fec_dev          datetime NULL,
       pre_fec_ent          datetime NULL,
       pre_mul_imp          decimal(8,0) NULL,
       pre_mul_pag          decimal(8,0) NULL,
       rec_num              int NULL,
       PRIMARY KEY (pub_cod, pre_fec_sal, eje_num), 
       FOREIGN KEY (rec_num)
                             REFERENCES RECIBO,
       FOREIGN KEY (usu_cod)
			        REFERENCES USUARIO,
       FOREIGN KEY (pub_cod)
                             REFERENCES PUBLICACION
)
go

CREATE TABLE RESERVACION (
       res_cod             int NOT NULL IDENTITY(1,1),
       pub_cod              int NOT NULL,
       usu_cod              char(6) NOT NULL,
       res_fec              datetime NOT NULL,
       pre_eje		char(1) NOT NULL,
       PRIMARY KEY (res_cod), 
       FOREIGN KEY (usu_cod)
                             REFERENCES USUARIO 
)
go

CREATE TABLE BIBLIOTECARIO (
       bib_cod              int NOT NULL,
       bib_nom              varchar(45) NOT NULL,
       bib_dir              varchar(60) NULL,
       bib_tel              varchar(20) NULL,
       bib_cla              varchar(10) NOT NULL,
       PRIMARY KEY (bib_cod)
)
go

SELECT name FROM sysobjects
	WHERE type = 'U'
go


