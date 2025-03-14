-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2025 a las 03:45:26
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
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE `datos` (
  `correo` varchar(100) DEFAULT NULL,
  `columna1` varchar(60) DEFAULT NULL,
  `columna2` varchar(60) DEFAULT NULL,
  `desempeño` int(3) DEFAULT NULL,
  `curso_concluido` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datos`
--

INSERT INTO `datos` (`correo`, `columna1`, `columna2`, `desempeño`, `curso_concluido`) VALUES
('le22080148@merida.tecnm.mx', 'le22080148', 'merida.tecnm.mx', 8, 'N'),
('LE23080908@meridamtecnm.mx', 'km5745730', 'meridamtecnm.mx', 0, 'N'),
('LE24080327@merida.tecnm.mx', 'LE24080327', 'merida.tecnm.mx', 90, 'S'),
('le23080489@merida.tecnm.mx', 'le23080489', 'merida.tecnm.mx', 75, 'S'),
('LE23080455@merida.tecnm.mx', 'LE23080455', 'merida.tecnm.mx', 79, 'S'),
('LE23081287@merida.tecnm.mx', 'LE23081287', 'merida.tecnm.mx', 87, 'S'),
('LE24080223@merida.tecnm.mx', 'LE24080223', 'merida.tecnm.mx', 85, 'S'),
('le23080775@merida.tecnm.mx', 'le23080775', 'merida.tecnm.mx', 84, 'S'),
('LE18081467@merida.tecnm.mx', 'LE18081467', 'merida.tecnm.mx', 0, 'N'),
('LE24080233@merida.tecnm.mx', 'LE24080233', 'merida.tecnm.mx', 86, 'S'),
('LE24080069@merida.tecnm.mx', 'LE24080069', 'merida.tecnm.mx', 3, 'N'),
('LE24080076@merida.tecnm.mx', 'LE24080076', 'merida.tecnm.mx', 43, 'N'),
('le22080148@merida.tecnm.mx', 'le22080148', 'merida.tecnm.mx', 8, 'N'),
('LE23080908@meridamtecnm.mx', 'km5745730', 'meridamtecnm.mx', 0, 'N'),
('LE24080327@merida.tecnm.mx', 'LE24080327', 'merida.tecnm.mx', 90, 'S'),
('le23080489@merida.tecnm.mx', 'le23080489', 'merida.tecnm.mx', 75, 'S'),
('LE23080455@merida.tecnm.mx', 'LE23080455', 'merida.tecnm.mx', 79, 'S'),
('LE23081287@merida.tecnm.mx', 'LE23081287', 'merida.tecnm.mx', 87, 'S'),
('LE24080223@merida.tecnm.mx', 'LE24080223', 'merida.tecnm.mx', 85, 'S'),
('le23080775@merida.tecnm.mx', 'le23080775', 'merida.tecnm.mx', 84, 'S'),
('LE18081467@merida.tecnm.mx', 'LE18081467', 'merida.tecnm.mx', 0, 'N'),
('LE24080233@merida.tecnm.mx', 'LE24080233', 'merida.tecnm.mx', 86, 'S'),
('LE24080069@merida.tecnm.mx', 'LE24080069', 'merida.tecnm.mx', 3, 'N'),
('LE24080076@merida.tecnm.mx', 'LE24080076', 'merida.tecnm.mx', 43, 'N'),
('educont.serv.tecnm@gmail.com', 'educont.serv.tecnm', 'gmail.com', 0, 'N'),
('gramirez@zapotlanejo.tecmm.edu.mx', 'gramirez', 'zapotlanejo.tecmm.edu.mx', 32, 'N'),
('eduardonievesa@gmail.com', 'eduardonievesa', 'gmail.com', 46, 'N'),
('l19200233@pachuca.tecnm.mx', 'l19200233', 'pachuca.tecnm.mx', 70, 'S'),
('pv18021296@vallarta.tecmm.edu.mx', 'pv18021296', 'vallarta.tecmm.edu.mx', 70, 'S'),
('L20520105@chilpancingo.tecnm.mx', 'L20520105', 'chilpancingo.tecnm.mx', 0, 'N'),
('antonio.delgado@nortenayarit.tecnm.mx', 'antonio.delgado', 'nortenayarit.tecnm.mx', 3, 'N'),
('jose.ca@crodemerida.tecnm.mx', 'jose.ca', 'crodemerida.tecnm.mx', 34, 'N'),
('nlsofia264@gmail.com', 'nlsofia264', 'gmail.com', 0, 'N'),
('monica.ca@cuautitlan.tecnm.mx', 'monica.ca', 'cuautitlan.tecnm.mx', 0, 'N'),
('l221000168@mazatlan.tecnm.mx', 'l221000168', 'mazatlan.tecnm.mx', 72, 'S'),
('vinculacion@centla.tecnm.mx', 'vinculacion', 'centla.tecnm.mx', 17, 'N'),
('daniapalacios901@gmail.com', 'daniapalacios901', 'gmail.com', 0, 'N'),
('angeliuxpex2@gmail.com', 'angeliuxpex2', 'gmail.com', 0, 'N'),
('vin_lcardenas@tecnm.mx', 'vin_lcardenas', 'tecnm.mx', 3, 'N'),
('edgar.gv@parral.tecnm.mx', 'edgar.gv', 'parral.tecnm.mx', 99, 'S'),
('L22520350@chilpancingo.tecnm.mx', 'L22520350', 'chilpancingo.tecnm.mx', 99, 'S'),
('L23100475@nlaredo.tecnm.mx', 'L23100475', 'nlaredo.tecnm.mx', 22, 'N'),
('yara.rb@crodemerida.tecnm.mx', 'yara.rb', 'crodemerida.tecnm.mx', 0, 'N'),
('gabrielmsp@gmail.com', 'gabrielmsp', 'gmail.com', 0, 'N'),
('l20171225@culiacan.tecnm.mx', 'l20171225', 'culiacan.tecnm.mx', 100, 'S'),
('analiliasosa@misantla.tecnm.mx', 'analiliasosa', 'misantla.tecnm.mx', 0, 'N'),
('mvallejo@itlinares.edu.mx', 'mvallejo', 'itlinares.edu.mx', 0, 'N'),
('obetg3380@gmail.com', 'obetg3380', 'gmail.com', 0, 'N'),
('231063011@tecnmtlahuac.onmicrosoft.com', '231063011', 'tecnmtlahuac.onmicrosoft.com', 32, 'N'),
('lulipop.1702@gmail.com', 'lulipop.1702', 'gmail.com', 3, 'N'),
('cuboyde321@gmail.com', 'cuboyde321', 'gmail.com', 0, 'N'),
('221064160@tecnmtlahuac.onmicrosoft.com', '221064160', 'tecnmtlahuac.onmicrosoft.com', 80, 'S'),
('sharonfernandezlopez17@gmail.com', 'sharonfernandezlopez17', 'gmail.com', 90, 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos2`
--

CREATE TABLE `datos2` (
  `correo` varchar(100) NOT NULL,
  `columna1` varchar(50) DEFAULT NULL,
  `columna2` varchar(50) DEFAULT NULL,
  `desempeño` int(11) NOT NULL,
  `curso_concluido` char(1) NOT NULL CHECK (`curso_concluido` in ('S','N')),
  `fecha_corte` varchar(100) DEFAULT NULL,
  `titulo_curso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
