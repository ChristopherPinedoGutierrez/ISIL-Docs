-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2025 a las 21:24:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bodega_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `fecha_ingreso`, `usuario_id`) VALUES
(63, 'Arroz Costeño 1kg', 'Arroz de calidad superior', 4.50, 100, '2025-06-15', 1),
(64, 'Azúcar Rubia 1kg', 'Azúcar rubia empacada', 3.20, 80, '2025-06-15', 1),
(65, 'Aceite Primor 1L', 'Aceite vegetal comestible', 10.00, 50, '2025-06-15', 1),
(66, 'Leche Gloria 400g', 'Leche evaporada entera', 4.80, 60, '2025-06-15', 1),
(67, 'Fideos Don Vittorio 500g', 'Fideos tallarín fino', 3.90, 70, '2025-06-15', 1),
(68, 'Galletas Oreo 144g', 'Paquete de galletas rellenas', 2.80, 45, '2025-06-15', 1),
(69, 'Café Altomayo 250g', 'Café molido en bolsa', 14.50, 30, '2025-06-15', 1),
(70, 'Atún Florida 170g', 'Lata de atún en agua', 5.20, 90, '2025-06-15', 1),
(71, 'Panetón D´Onofrio 900g', 'Panetón tradicional', 18.00, 25, '2025-06-15', 1),
(72, 'Agua Cielo 2.5L', 'Botella de agua sin gas', 3.00, 100, '2025-06-15', 1),
(73, 'Inca Kola 1.5L', 'Gaseosa peruana', 6.00, 55, '2025-06-15', 1),
(74, 'Papel Higiénico Elite x4', 'Papel de baño suave', 8.00, 40, '2025-06-15', 1),
(75, 'Jabón Bolívar 150g', 'Jabón para lavar ropa', 2.50, 85, '2025-06-15', 1),
(76, 'Shampoo Sedal 340ml', 'Shampoo para cabello', 10.00, 35, '2025-06-15', 1),
(77, 'Cera Sapolio 200ml', 'Cera para pisos', 7.00, 40, '2025-06-15', 1),
(78, 'Detergente Ariel 800g', 'Detergente en polvo', 12.00, 60, '2025-06-15', 1),
(79, 'Cloro Ayudín 1L', 'Desinfectante para pisos', 4.20, 75, '2025-06-15', 1),
(80, 'Pan Francés x10', 'Pan recién horneado', 3.00, 30, '2025-06-15', 1),
(81, 'Huevos x12', 'Docena de huevos frescos', 7.80, 40, '2025-06-15', 1),
(82, 'Plátano de Isla x1kg', 'Plátano maduro', 3.50, 50, '2025-06-15', 1),
(83, 'Manzana Israel x1kg', 'Manzana dulce', 5.00, 45, '2025-06-15', 1),
(84, 'Carne Molida x1kg', 'Carne de res', 18.00, 20, '2025-06-15', 1),
(85, 'Pollo Entero x1kg', 'Pollo fresco', 12.50, 25, '2025-06-15', 1),
(86, 'Yogurt Gloria 1L', 'Yogurt bebible', 7.50, 30, '2025-06-15', 1),
(87, 'Queso Fresco x500g', 'Queso de vaca artesanal', 9.00, 35, '2025-06-15', 1),
(88, 'Pan de molde Bimbo', 'Pan blanco tajado', 6.00, 40, '2025-06-15', 1),
(89, 'Mayonesa Alacena 250g', 'Mayonesa clásica', 4.20, 60, '2025-06-15', 1),
(90, 'Ketchup Heinz 397g', 'Salsa de tomate', 6.50, 45, '2025-06-15', 1),
(91, 'Sal Lobos 1kg', 'Sal de mesa y cocina', 2.20, 70, '2025-06-15', 1),
(92, 'Harina Blanca Flor 1kg', 'Harina preparada', 4.60, 50, '2025-06-15', 1),
(93, 'Mantequilla Laive 200g', 'Mantequilla con sal', 7.00, 30, '2025-06-15', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `rol` enum('cliente','admin') DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `clave`, `direccion`, `telefono`, `rol`) VALUES
(1, 'Admin', 'admin@bodega.com', 'claveEncriptada', 'Lima', '999999999', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
