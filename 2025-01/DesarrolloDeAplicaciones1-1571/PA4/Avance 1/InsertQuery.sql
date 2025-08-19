USE torneo_karate;
-- Academias
INSERT INTO academia (nombre, ruc) VALUES ('Dojo Dragón Rojo', '20123456789');
INSERT INTO academia (nombre, ruc) VALUES ('Samurái de Acero', '20987654321');

-- Karatecas - Dojo Dragón Rojo
INSERT INTO karateca (dni, nombre_completo, edad, peso, sexo, rango, modalidad, id_liga)
VALUES 
('12345678', 'Carlos Yamamoto', 18, 65.0, 'M', 4, 'KUMITE', 1),
('23456789', 'Luis Inoue', 17, 68.5, 'M', 5, 'KUMITE', 1),
('34567890', 'Ana Takeda', 19, 55.0, 'F', 3, 'KUMITE', 1),
('45678901', 'María Kato', 18, 59.0, 'F', 2, 'KUMITE', 1);

-- Karatecas - Samurái de Acero
INSERT INTO karateca (dni, nombre_completo, edad, peso, sexo, rango, modalidad, id_liga)
VALUES 
('56789012', 'Pedro Nakamura', 18, 66.0, 'M', 4, 'KUMITE', 2),
('67890123', 'Lucía Tanaka', 17, 56.5, 'F', 5, 'KUMITE', 2),
('78901234', 'Fernando Ishida', 20, 75.0, 'M', 3, 'KUMITE', 2),
('89012345', 'Keiko Morita', 19, 58.0, 'F', 2, 'KUMITE', 2);
