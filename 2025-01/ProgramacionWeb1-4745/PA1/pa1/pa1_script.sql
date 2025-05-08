-- 1. Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS pa1_db;
USE pa1_db;

-- 2. Crear la tabla solo si no existe
CREATE TABLE IF NOT EXISTS componentes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  tipo VARCHAR(50),
  marca VARCHAR(50),
  precio DECIMAL(8,2),
  stock INT
);

-- 3. Insertar datos solo si la tabla está vacía
-- El uso de multiples SELECR y de UNION ALL junto con la validacion final evita duplicados en caso se ejecute más de una vez
INSERT INTO componentes (nombre, tipo, marca, precio, stock)
SELECT * FROM (
  SELECT 'Ryzen 5 5600X', 'CPU', 'AMD', 750.00, 10 UNION ALL
  SELECT 'Core i5-12400F', 'CPU', 'Intel', 820.00, 15 UNION ALL
  SELECT 'GeForce RTX 3060', 'GPU', 'NVIDIA', 1500.00, 8 UNION ALL
  SELECT 'Radeon RX 6600', 'GPU', 'AMD', 1300.00, 5 UNION ALL
  SELECT 'HyperX Fury 16GB', 'RAM', 'Kingston', 280.00, 20 UNION ALL
  SELECT 'Corsair Vengeance 16GB', 'RAM', 'Corsair', 290.00, 25 UNION ALL
  SELECT 'SSD 1TB NVMe', 'Almacenamiento', 'Western Digital', 400.00, 12 UNION ALL
  SELECT 'HDD 2TB', 'Almacenamiento', 'Seagate', 280.00, 10 UNION ALL
  SELECT 'Fuente 650W 80 Plus Bronze', 'PSU', 'EVGA', 250.00, 18 UNION ALL
  SELECT 'Placa B550M', 'Placa Madre', 'Gigabyte', 600.00, 7 UNION ALL
  SELECT 'Placa Z690', 'Placa Madre', 'ASUS', 950.00, 5 UNION ALL
  SELECT 'Cooler Hyper 212', 'Refrigeración', 'Cooler Master', 150.00, 10 UNION ALL
  SELECT 'Gabinete ATX RGB', 'Gabinete', 'NZXT', 350.00, 6 UNION ALL
  SELECT 'Memoria DDR5 32GB', 'RAM', 'G.Skill', 520.00, 9 UNION ALL
  SELECT 'SSD 500GB SATA', 'Almacenamiento', 'Kingston', 200.00, 14 UNION ALL
  SELECT 'GeForce RTX 4070', 'GPU', 'NVIDIA', 3200.00, 4 UNION ALL
  SELECT 'Core i7-13700K', 'CPU', 'Intel', 1800.00, 3 UNION ALL
  SELECT 'Ryzen 7 5800X', 'CPU', 'AMD', 1200.00, 6 UNION ALL
  SELECT 'Fuente 750W Modular', 'PSU', 'Corsair', 420.00, 11 UNION ALL
  SELECT 'Cooler Líquido 240mm', 'Refrigeración', 'NZXT', 480.00, 2
) AS tmpTable
WHERE NOT EXISTS (SELECT 1 FROM componentes);
