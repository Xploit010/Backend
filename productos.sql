-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-12-2024 a las 02:25:53
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
-- Base de datos: `catalogo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `image` varchar(255) DEFAULT 'https://supermercadolaestacion.com/56491-large_default/ponque-ramito-ramo-bolsa-x-10-unidades.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `activo`, `image`) VALUES
(2, 'gansitos m', '100gr', 4543.00, 1, 'https://m.media-amazon.com/images/I/81pJG6c0CzL._SL1500_.jpg'),
(4, 'achiras ', '400 ml', 4546.00, 1, 'https://copservir.vtexassets.com/arquivos/ids/1107733/ACHIRAS-RAMO_F.png?v=638345951119530000'),
(5, 'nucita r', '110gr', 1423.00, 1, 'https://cdn1.totalcommerce.cloud/mercacentro/product-zoom/es/nucita-achocolatada-dp-1000-1.webp'),
(7, 'antonio', '900 ml', 4000.00, 1, 'https://copservir.vtexassets.com/arquivos/ids/1260280-800-auto?v=638457616792270000&width=800&height=auto&aspect=true'),
(8, 'yogurt', '2200 ml', 4552.00, 1, 'https://i5.walmartimages.com/seo/Yoplait-Original-Smooth-Style-Vanilla-Low-Fat-Yogurt-32-OZ-Yogurt-Tub_858db20e-db77-4ab7-ad51-e380ee322aee.55a066c696b0e374aa1a8a22e9b0be78.jpeg'),
(9, 'juan p', '1400gr', 6469.00, 1, 'https://images.cookforyourlife.org/wp-content/uploads/2021/01/yogurt-parfait-smaller.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `descripcion` (`descripcion`) USING HASH;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
