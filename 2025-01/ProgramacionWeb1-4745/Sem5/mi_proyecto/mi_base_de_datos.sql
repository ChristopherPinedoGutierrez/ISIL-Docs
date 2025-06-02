CREATE DATABASE IF NOT EXISTS mi_base_de_datos;
USE mi_base_de_datos;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    ciudad VARCHAR(50),
    sexo VARCHAR(10)
);

INSERT INTO usuarios (nombre, edad, ciudad, sexo) VALUES
('Juan Perez', 30, 'Madrid', 'Hombre'),
('Ana Lopez', 25, 'Barcelona', 'Mujer'),
('Pedro Gomez', 40, 'Valencia', 'Hombre'),
('Laura Martinez', 22, 'Madrid', 'Mujer'),
('Carlos Ruiz', 35, 'Barcelona', 'Hombre');