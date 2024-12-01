-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2024 a las 20:13:09
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectococo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conform`
--

CREATE TABLE `conform` (
  `Id` int(11) NOT NULL,
  `User` int(11) DEFAULT NULL,
  `Groups` int(11) DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conform`
--

INSERT INTO `conform` (`Id`, `User`, `Groups`, `Estado`) VALUES
(1, 1, 2, 'A'),
(17, 7, 8, 'D'),
(18, 11, 8, 'D'),
(42, 2, 13, 'A'),
(43, 3, 13, 'D'),
(44, 4, 13, 'A'),
(45, 6, 13, 'D'),
(46, 7, 13, 'D'),
(47, 8, 13, 'D'),
(48, 9, 13, 'D'),
(49, 10, 13, 'D'),
(50, 11, 13, 'D'),
(51, 8, 2, 'A'),
(52, 2, 14, 'A'),
(53, 7, 14, 'D'),
(55, 1, 15, 'A'),
(56, 15, 15, 'D'),
(57, 18, 15, 'D'),
(58, 2, 16, 'A'),
(59, 3, 16, 'D'),
(60, 4, 16, 'A'),
(61, 6, 16, 'D'),
(62, 1, 17, 'D'),
(63, 18, 17, 'D'),
(64, 19, 17, 'D'),
(65, 1, 18, 'A'),
(66, 3, 18, 'D'),
(67, 4, 18, 'A'),
(68, 6, 18, 'D'),
(69, 7, 18, 'D'),
(70, 8, 18, 'D'),
(71, 4, 14, 'D'),
(72, 4, 16, 'A');

--
-- Disparadores `conform`
--
DELIMITER $$
CREATE TRIGGER `AfterConformDelete` AFTER DELETE ON `conform` FOR EACH ROW BEGIN
    
    IF ((SELECT COUNT(*) FROM conform WHERE Groups = OLD.Groups) < 2) THEN
        DELETE FROM groups
        WHERE Id = OLD.Groups;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friends`
--

CREATE TABLE `friends` (
  `Id` int(11) NOT NULL,
  `UserReceptor` int(11) DEFAULT NULL,
  `UserEmisor` int(11) DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `friends`
--

INSERT INTO `friends` (`Id`, `UserReceptor`, `UserEmisor`, `Estado`) VALUES
(15, 1, 10, 'A'),
(19, 10, 15, 'A'),
(20, 12, 13, 'A'),
(21, 10, 13, 'A'),
(23, 11, 10, 'A'),
(26, 4, 1, 'P'),
(28, 7, 1, 'A'),
(29, 2, 1, 'A'),
(30, 2, 17, 'A'),
(31, 19, 18, 'A'),
(32, 1, 19, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `UserCreator` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`Id`, `Name`, `Description`, `UserCreator`) VALUES
(2, 'No', 'No', 2),
(8, 'Proyecto', '', 10),
(13, 'Soy Issaac', 'dsadsadas', 17),
(14, 'dsadsad', 'dasdasdas', 1),
(15, 'Castle', 'Serie de television', 19),
(16, 'dsadsadada', 'dsadasdasda', 1),
(17, 'dsadsadasda', 'dasdsadadas', 2),
(18, 'Nuevo', 'Nuevo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messagesgroup`
--

CREATE TABLE `messagesgroup` (
  `Id` int(11) NOT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `UserEmisor` int(11) DEFAULT NULL,
  `Groups` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `messagesgroup`
--

INSERT INTO `messagesgroup` (`Id`, `Message`, `UserEmisor`, `Groups`) VALUES
(1, 'Buen dia', 1, 2),
(4, 'Hola', 1, 2),
(5, 'Diego', 1, 2),
(6, 'Creo que no', 1, 2),
(7, 'Si', 2, 2),
(8, 'Que tal', 10, 8),
(9, 'Bueno', 2, 2),
(10, 'Que tal', 17, 13),
(11, 'Que tal', 2, 2),
(12, 'Hola', 2, 13),
(13, 'Oye', 1, 13),
(14, 'Que', 2, 13),
(15, 'Bueno', 2, 13),
(16, 'Tal vez', 1, 13),
(17, 'Bueni', 2, 2),
(18, 'Hola', 2, 14),
(19, 'Adios', 1, 14),
(20, 'Bueno', 1, 2),
(21, 'Oye', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messagesuser`
--

CREATE TABLE `messagesuser` (
  `Id` int(11) NOT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `UserEmisor` int(11) DEFAULT NULL,
  `UserReceptor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `messagesuser`
--

INSERT INTO `messagesuser` (`Id`, `Message`, `UserEmisor`, `UserReceptor`) VALUES
(1, 'Buen dia', 1, 2),
(3, 'Hola', 1, 10),
(4, 'Hola', 10, 1),
(5, 'Adios', 1, 10),
(6, 'Hola', 10, 1),
(7, 'Hola', 10, 1),
(8, 'Hola', 10, 1),
(9, 'Adios', 10, 1),
(13, 'QUe tal', 13, 10),
(14, 'Tal vez', 10, 1),
(15, 'Ok', 1, 10),
(16, 'Que tal', 10, 1),
(17, 'Porque no te guardas?', 10, 1),
(18, 'Que tal', 10, 1),
(19, 'Bueno', 1, 10),
(20, 'Si bueno', 7, 1),
(21, 'Creo que tal vez', 7, 1),
(22, 'Supongo', 1, 7),
(23, 'Bueno', 1, 2),
(24, 'Bueno', 1, 2),
(25, 'Issac', 17, 2),
(26, 'Checa perro', 17, 2),
(27, 'QUe cosa', 2, 17),
(28, 'Bueno', 1, 2),
(29, 'Ok', 2, 1),
(30, 'Pues tal vez', 2, 1),
(31, 'Creo que no', 1, 2),
(32, 'Ya o que', 10, 1),
(33, 'Que tal', 19, 18),
(34, 'Como estas?', 19, 18),
(35, 'Bueno', 19, 18),
(36, 'En serio', 18, 19),
(37, 'Oye', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `User` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Estado` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`Id`, `Name`, `LastName`, `User`, `Password`, `Estado`) VALUES
(1, 'Diego', 'Romero', 'Diego', 'Romero', 'A'),
(2, 'Kaleb', 'Real', 'Kaleb', 'Real', 'D'),
(3, 'Diego', 'Persona', 'Persona', 'Diego', 'D'),
(4, 'Personas', 'Persoans', 'Personas', 'Personas', 'D'),
(6, 'Franco', 'Escamilla', 'Franco', 'Escamilla', 'D'),
(7, 'Howar', 'Walowits', '1234', '1234', 'A'),
(8, 'Faizy', 'Faizy', 'Faizy', 'Faizy', 'D'),
(9, 'pedro', 'pedro', 'pedro', 'pedro', 'D'),
(10, 'Oscar', 'Oscar', 'Oscar', 'Oscar', 'D'),
(11, 'Algo', 'Algo', 'Algo', 'Algo', 'D'),
(12, 'Si', 'Si', 'Si', 'Si', 'D'),
(13, 'Filomeno', 'Filomeno', 'Filomeno', 'Filomeno', 'D'),
(14, 'Fue', 'Fue', 'Fue', 'Fue', 'D'),
(15, 'Gustavo', 'Nuno', 'Gustavo', 'Nuno', 'D'),
(16, 'Maruicio', 'Chambeador', 'Maruicio', 'Cricko', 'D'),
(17, 'Issaac', 'Chavez', 'Issaac', 'Chavez', 'D'),
(18, 'Castle', 'Castle', 'Castle', 'Castle', 'D'),
(19, 'Becket', 'Becket', 'Becket', 'Becket', 'D');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conform`
--
ALTER TABLE `conform`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `conform_ibfk_2` (`Groups`),
  ADD KEY `conform_ibfk_1` (`User`);

--
-- Indices de la tabla `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `friends_ibfk_1` (`UserReceptor`),
  ADD KEY `friends_ibfk_2` (`UserEmisor`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `groups_ibfk_1` (`UserCreator`);

--
-- Indices de la tabla `messagesgroup`
--
ALTER TABLE `messagesgroup`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `messagesgroup_ibfk_2` (`Groups`),
  ADD KEY `messagesgroup_ibfk_1` (`UserEmisor`);

--
-- Indices de la tabla `messagesuser`
--
ALTER TABLE `messagesuser`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `messagesuser_ibfk_1` (`UserEmisor`),
  ADD KEY `messagesuser_ibfk_2` (`UserReceptor`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `conform`
--
ALTER TABLE `conform`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `friends`
--
ALTER TABLE `friends`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `messagesgroup`
--
ALTER TABLE `messagesgroup`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `messagesuser`
--
ALTER TABLE `messagesuser`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conform`
--
ALTER TABLE `conform`
  ADD CONSTRAINT `conform_ibfk_1` FOREIGN KEY (`User`) REFERENCES `users` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `conform_ibfk_2` FOREIGN KEY (`Groups`) REFERENCES `groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`UserReceptor`) REFERENCES `users` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`UserEmisor`) REFERENCES `users` (`Id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`UserCreator`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `messagesgroup`
--
ALTER TABLE `messagesgroup`
  ADD CONSTRAINT `messagesgroup_ibfk_1` FOREIGN KEY (`UserEmisor`) REFERENCES `users` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messagesgroup_ibfk_2` FOREIGN KEY (`Groups`) REFERENCES `groups` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `messagesuser`
--
ALTER TABLE `messagesuser`
  ADD CONSTRAINT `messagesuser_ibfk_1` FOREIGN KEY (`UserEmisor`) REFERENCES `users` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messagesuser_ibfk_2` FOREIGN KEY (`UserReceptor`) REFERENCES `users` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
