-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 19:35:41
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db-canciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albums_db`
--

CREATE TABLE `albums_db` (
  `id` int(11) NOT NULL,
  `artista` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `anio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `albums_db`
--

INSERT INTO `albums_db` (`id`, `artista`, `nombre`, `anio`) VALUES
(16, 'The beatles', 'Abbey road', 1969),
(17, 'Led zeppelin', 'Physical Graffiti', 1975),
(19, 'Pink Floyd', 'The wall', 1979);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canciones_db`
--

CREATE TABLE `canciones_db` (
  `id` int(11) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `anio` int(11) NOT NULL,
  `banda` varchar(30) NOT NULL,
  `album` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `canciones_db`
--

INSERT INTO `canciones_db` (`id`, `genero`, `anio`, `banda`, `album`, `nombre`) VALUES
(17, 'Rock', 1969, 'The beatles', 16, 'Here comes the sun'),
(18, 'Rock', 1975, 'Led zeppelin', 17, 'Night Flight'),
(19, 'Rock', 1969, 'The beatles', 16, 'Come together'),
(22, 'Rock', 1979, 'Pink Floyd', 19, 'Another brick in the wall');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_db`
--

CREATE TABLE `users_db` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contraseña` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users_db`
--

INSERT INTO `users_db` (`id`, `email`, `contraseña`) VALUES
(1, 'agustinperez@hotmail.com', '$2a$12$SSx7lQqQhQmECchd243o.u7x1zDbP4QhogISXNr74OKm/G3wFNaeG'),
(2, 'tatycardoso@hotmail.com', '$2a$12$UQG.e.NuzDGc/7IBO2nz3OGc/twKmIvQAzi2Zbs/szEPbqyUyKqZC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albums_db`
--
ALTER TABLE `albums_db`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `canciones_db`
--
ALTER TABLE `canciones_db`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album` (`album`);

--
-- Indices de la tabla `users_db`
--
ALTER TABLE `users_db`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `albums_db`
--
ALTER TABLE `albums_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `canciones_db`
--
ALTER TABLE `canciones_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `users_db`
--
ALTER TABLE `users_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `canciones_db`
--
ALTER TABLE `canciones_db`
  ADD CONSTRAINT `canciones_db_ibfk_1` FOREIGN KEY (`album`) REFERENCES `albums_db` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
