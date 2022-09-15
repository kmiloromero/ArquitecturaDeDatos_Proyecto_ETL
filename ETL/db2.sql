-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2022 a las 17:18:29
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `IdEmpreesa` int(11) NOT NULL,
  `NombreEmpresa` varchar(100) NOT NULL,
  `Nit` varchar(11) NOT NULL,
  `IdVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`IdEmpreesa`, `NombreEmpresa`, `Nit`, `IdVenta`) VALUES(122223, 'EXITO', '122222', 666);
INSERT INTO `empresa` (`IdEmpreesa`, `NombreEmpresa`, `Nit`, `IdVenta`) VALUES(212168, 'Jumbo', '90015', 777);
INSERT INTO `empresa` (`IdEmpreesa`, `NombreEmpresa`, `Nit`, `IdVenta`) VALUES(920321, 'OlImPica_', '89010', 999);
INSERT INTO `empresa` (`IdEmpreesa`, `NombreEmpresa`, `Nit`, `IdVenta`) VALUES(920322, 'OlImPica*{_', '89011', 1010);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `IdVenta` int(11) NOT NULL,
  `FechaVenta` date NOT NULL,
  `CantidadVentas` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`IdVenta`, `FechaVenta`, `CantidadVentas`, `IdCliente`) VALUES(666, '2022-02-09', 1000, 12);
INSERT INTO `venta` (`IdVenta`, `FechaVenta`, `CantidadVentas`, `IdCliente`) VALUES(777, '2022-06-12', 1000, 13);
INSERT INTO `venta` (`IdVenta`, `FechaVenta`, `CantidadVentas`, `IdCliente`) VALUES(888, '2022-03-09', 1000, 14);
INSERT INTO `venta` (`IdVenta`, `FechaVenta`, `CantidadVentas`, `IdCliente`) VALUES(999, '2022-03-09', 16000, 15);
INSERT INTO `venta` (`IdVenta`, `FechaVenta`, `CantidadVentas`, `IdCliente`) VALUES(1010, '2022-03-09', 7550, 16);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`IdEmpreesa`),
  ADD UNIQUE KEY `Nit` (`Nit`),
  ADD KEY `IdVenta` (`IdVenta`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`IdVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `IdEmpreesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920323;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `IdVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`IdVenta`) REFERENCES `venta` (`IdVenta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
