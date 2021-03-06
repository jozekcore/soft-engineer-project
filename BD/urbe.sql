-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-04-2018 a las 23:41:31
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `urbe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datospersonales`
--

CREATE TABLE `datospersonales` (
  `id_persona` int(8) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `genero` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `datospersonales`
--

INSERT INTO `datospersonales` (`id_persona`, `nombre`, `apellido`, `correo`, `telefono`, `cedula`, `fecha`, `genero`) VALUES
(1, 'Jackson Kilso', 'kele', 'jkilso@gmail.com', '04246305840', 26070666, '24-12-2007', 'Masculino'),
(2, 'gerardo', 'etv', 'gerardoepp@gmail.com', '04146441712', 25660835, '12-52-1994', 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id_orden` int(20) NOT NULL,
  `id_usuario_emisor` int(20) NOT NULL,
  `id_usuario_receptor` int(20) NOT NULL,
  `tipo_mantenimiento` varchar(20) NOT NULL,
  `usuario_equipo` varchar(50) NOT NULL,
  `mecanico_asignado` varchar(50) NOT NULL,
  `fecha_reporte` varchar(50) NOT NULL,
  `hora_reporte` varchar(20) NOT NULL,
  `fecha_inicio` varchar(20) NOT NULL,
  `hora_inicio` varchar(20) NOT NULL,
  `fecha_culminacion` varchar(20) NOT NULL,
  `hora_culminacion` varchar(20) NOT NULL,
  `km` int(50) NOT NULL,
  `unidad_equipo` varchar(50) NOT NULL,
  `placa_equipo` varchar(50) NOT NULL,
  `ultima_actividad` varchar(100) NOT NULL,
  `taller_externo` varchar(100) NOT NULL,
  `fecha_inicio_taller` varchar(50) NOT NULL,
  `fecha_culminacion_taller` varchar(50) NOT NULL,
  `hora_taller` varchar(20) NOT NULL,
  `garantia` varchar(20) NOT NULL,
  `descripcion_falla` varchar(200) NOT NULL,
  `estado_orden` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones`
--

CREATE TABLE `reparaciones` (
  `id_reparacion` int(100) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `procedencia` varchar(100) NOT NULL,
  `req_mant_no` varchar(100) NOT NULL,
  `precio_unit` int(50) NOT NULL,
  `precio_total` int(100) NOT NULL,
  `id_orden` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones_realizadas`
--

CREATE TABLE `reparaciones_realizadas` (
  `id_reparacion` int(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `id_orden` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuestos`
--

CREATE TABLE `repuestos` (
  `id_repuesto` int(50) NOT NULL,
  `cantidad` int(100) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `procedencia` varchar(100) NOT NULL,
  `req_mant_no` varchar(100) NOT NULL,
  `precio_unit` int(100) NOT NULL,
  `precio_total` int(100) NOT NULL,
  `id_orden` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_respuesta` int(50) NOT NULL,
  `id_orden` int(11) NOT NULL,
  `observacion` varchar(200) NOT NULL,
  `monto_repuesto` double NOT NULL,
  `monto_reparaciones` double NOT NULL,
  `total_facturado` double NOT NULL,
  `fecha_respuesta` varchar(50) NOT NULL,
  `hora_respuesta` varchar(50) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(8) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `clave` varchar(30) NOT NULL,
  `cargo` int(1) NOT NULL,
  `id_persona` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `clave`, `cargo`, `id_persona`) VALUES
(1, 'operaciones', '1234', 2, 1),
(2, 'mantenimiento', '1234', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id_orden`);

--
-- Indices de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD PRIMARY KEY (`id_reparacion`);

--
-- Indices de la tabla `reparaciones_realizadas`
--
ALTER TABLE `reparaciones_realizadas`
  ADD PRIMARY KEY (`id_reparacion`);

--
-- Indices de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  ADD PRIMARY KEY (`id_repuesto`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id_respuesta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `datospersonales`
--
ALTER TABLE `datospersonales`
  MODIFY `id_persona` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id_orden` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  MODIFY `id_reparacion` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reparaciones_realizadas`
--
ALTER TABLE `reparaciones_realizadas`
  MODIFY `id_reparacion` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repuestos`
--
ALTER TABLE `repuestos`
  MODIFY `id_repuesto` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id_respuesta` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
