-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-09-2022 a las 17:17:46
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
-- Base de datos: `db1`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaSucia` ()   SELECT 
	CL.nombreCliente, 
    CL.tipoDocumento, 
    CL.Identificacion, 
    CL.telefono, 
    CL.ciudad, 
    F.IdFactura, 
    F.ValorFactura, 
    P.nombreProducto, 
    V.FechaVenta, 
    V.CantidadVentas, 
    E.NombreEmpresa, 
    E.Nit 
    FROM CLIENTE CL 
    JOIN FACTURA F ON F.IdCliente = CL.IdCliente 
    JOIN Producto P ON F.IdProducto = P.idProducto 
    JOIN DB2.Venta V ON CL.idCliente = V.idCliente 
    JOIN DB2.Empresa E ON V.idVenta = E.IdVenta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DatosLimpios` ()   SELECT * FROM DB3.CONSULTA$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LimpiarDatos` ()   INSERT INTO DB3.Consulta
        SELECT 
        null,
        UPPER(TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Cl.nombreCliente, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@',''))) AS nombreCliente, 
        UPPER(TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(Cl.TipoDocumento, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@',''))) AS TipoDocumento, 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CL.Identificacion, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS Identificacion, 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CL.telefono, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS Telefono, 
        UPPER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(CL.ciudad, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS Ciudad,
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(F.IdFactura, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS IdFactura,
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(F.ValorFactura, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS ValorFactura,
        UPPER(TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(P.nombreProducto, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@',''))) AS nombreProducto, 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(V.FechaVenta, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS FechaVentas,
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(V.CantidadVentas, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS CantidadVentas,
        UPPER(TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(E.NombreEmpresa, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@',''))) AS NombreEmpresa,
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(E.Nit, '"',''),'#',''),'$',''),'!',''),'%',''),'&',''),'/',''),'(',''),'(',''),'=',''),'?',''),'¡',''),'|',''),'@','')) AS Nit
        FROM Cliente CL 
        JOIN Factura F ON F.IdCliente = CL.IdCliente
        JOIN Producto P ON F.IdProducto = P.idProducto
        JOIN DB2.Venta V ON CL.idCliente = V.idCliente
        JOIN DB2.Empresa E ON V.idVenta = E.IdVenta$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) NOT NULL,
  `nombreCliente` varchar(100) NOT NULL,
  `tipoDocumento` varchar(20) DEFAULT NULL,
  `identificacion` varchar(12) NOT NULL,
  `telefono` varchar(13) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `nombreCliente`, `tipoDocumento`, `identificacion`, `telefono`, `ciudad`) VALUES(12, 'johan', 'cedula', '123', '123', 'bogota');
INSERT INTO `cliente` (`IdCliente`, `nombreCliente`, `tipoDocumento`, `identificacion`, `telefono`, `ciudad`) VALUES(13, 'Angie Gutierrez\"#\"#$$', 'Cedula', '24234', '573218917161', 'Bogota');
INSERT INTO `cliente` (`IdCliente`, `nombreCliente`, `tipoDocumento`, `identificacion`, `telefono`, `ciudad`) VALUES(14, 'Samuel Rodriguez', 'Cedula Extrangera', '56754', '5731176542311', 'Cali');
INSERT INTO `cliente` (`IdCliente`, `nombreCliente`, `tipoDocumento`, `identificacion`, `telefono`, `ciudad`) VALUES(15, 'AleJanDro EcheVerri*/', 'Tarjeta de IdEntidad', '42356', '5731246718912', 'CArTaGenA*');
INSERT INTO `cliente` (`IdCliente`, `nombreCliente`, `tipoDocumento`, `identificacion`, `telefono`, `ciudad`) VALUES(16, 'jAcInToH', 'cEdUlA*{', '11211121', '01800117711', 'bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `IdFactura` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valorFactura` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`IdFactura`, `cantidad`, `valorFactura`, `IdCliente`, `IdProducto`) VALUES(1, 3, 5000, 12, 12233);
INSERT INTO `factura` (`IdFactura`, `cantidad`, `valorFactura`, `IdCliente`, `IdProducto`) VALUES(2, 3, 5000, 12, 12233);
INSERT INTO `factura` (`IdFactura`, `cantidad`, `valorFactura`, `IdCliente`, `IdProducto`) VALUES(3, 5, 8500, 13, 114);
INSERT INTO `factura` (`IdFactura`, `cantidad`, `valorFactura`, `IdCliente`, `IdProducto`) VALUES(4, 6, 4000, 15, 115);
INSERT INTO `factura` (`IdFactura`, `cantidad`, `valorFactura`, `IdCliente`, `IdProducto`) VALUES(5, 3, 5000, 12, 12233);
INSERT INTO `factura` (`IdFactura`, `cantidad`, `valorFactura`, `IdCliente`, `IdProducto`) VALUES(6, 7, 4000, 16, 116);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombreProducto` varchar(50) NOT NULL,
  `tipoProducto` enum('Linea General','Oferta Limitada') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nombreProducto`, `tipoProducto`) VALUES(113, 'PAPAS', 'Linea General');
INSERT INTO `producto` (`idProducto`, `nombreProducto`, `tipoProducto`) VALUES(114, 'BRocOli*/', 'Linea General');
INSERT INTO `producto` (`idProducto`, `nombreProducto`, `tipoProducto`) VALUES(115, 'ToMaTes_', 'Linea General');
INSERT INTO `producto` (`idProducto`, `nombreProducto`, `tipoProducto`) VALUES(116, 'CebOlLin_', 'Linea General');
INSERT INTO `producto` (`idProducto`, `nombreProducto`, `tipoProducto`) VALUES(12233, 'PAPAS', 'Linea General');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`IdFactura`),
  ADD KEY `IdCliente` (`IdCliente`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `IdFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12234;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
