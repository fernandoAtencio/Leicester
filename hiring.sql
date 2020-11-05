-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2020 a las 01:46:49
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hiring`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipos` int(2) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `eliminado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `figuras`
--

CREATE TABLE `figuras` (
  `id_figuras` int(11) NOT NULL,
  `id_partido` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `eliminado` tinyint(1) NOT NULL DEFAULT 0,
  `foto` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id_jugadores` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `eliminado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partido` int(11) NOT NULL,
  `gol_local` int(2) NOT NULL,
  `ts_create` timestamp NOT NULL DEFAULT current_timestamp(),
  `ts_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `habilitado` tinyint(1) NOT NULL DEFAULT 1,
  `eliminado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL,
  `gol_visitante` int(2) NOT NULL,
  `puntaje` int(1) NOT NULL,
  `hora` time NOT NULL,
  `id_equipo` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipos`);

--
-- Indices de la tabla `figuras`
--
ALTER TABLE `figuras`
  ADD PRIMARY KEY (`id_figuras`),
  ADD KEY `id_partido` (`id_partido`),
  ADD KEY `id_jugador` (`id_jugador`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_jugadores`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipos` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `figuras`
--
ALTER TABLE `figuras`
  MODIFY `id_figuras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_jugadores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `figuras`
--
ALTER TABLE `figuras`
  ADD CONSTRAINT `figuras_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugadores`),
  ADD CONSTRAINT `figuras_ibfk_2` FOREIGN KEY (`id_partido`) REFERENCES `partidos` (`id_partido`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_equipos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
