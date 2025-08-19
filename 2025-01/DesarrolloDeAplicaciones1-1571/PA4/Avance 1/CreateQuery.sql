CREATE DATABASE torneo_karate;
USE torneo_karate;

CREATE TABLE academia (
  id_liga INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ruc VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE karateca (
  id_karateca INT AUTO_INCREMENT PRIMARY KEY,
  dni VARCHAR(8) NOT NULL UNIQUE,
  nombre_completo VARCHAR(100) NOT NULL,
  edad INT NOT NULL,
  peso DECIMAL(5,2) NOT NULL,
  sexo ENUM('M', 'F') NOT NULL,
  rango INT NOT NULL CHECK (rango BETWEEN 1 AND 10),
  modalidad VARCHAR(20) NOT NULL DEFAULT 'KUMITE',
  id_liga INT NOT NULL,
  FOREIGN KEY (id_liga) REFERENCES academia(id_liga)
);

CREATE TABLE llave (
  id_llave INT AUTO_INCREMENT PRIMARY KEY,
  id_karateca1 INT NOT NULL,
  id_karateca2 INT NOT NULL,
  ronda INT NOT NULL,
  ganador INT DEFAULT NULL,
  FOREIGN KEY (id_karateca1) REFERENCES karateca(id_karateca),
  FOREIGN KEY (id_karateca2) REFERENCES karateca(id_karateca),
  FOREIGN KEY (ganador) REFERENCES karateca(id_karateca)
);
