-- phpMyAdmin SQL Dump
-- version 4.4.14.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2015 a las 22:15:54
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_educare`
--
CREATE DATABASE IF NOT EXISTS `db_educare` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_educare`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimentacion`
--

CREATE TABLE IF NOT EXISTS `alimentacion` (
  `id_alimentacion` int(11) NOT NULL,
  `tipo_alimento` varchar(45) DEFAULT NULL,
  `porcion_alimento` varchar(45) DEFAULT NULL,
  `observacion_alimento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `id_alumno` varchar(13) NOT NULL,
  `nombre_alum` varchar(25) DEFAULT NULL,
  `apellidos_alum` varchar(35) DEFAULT NULL,
  `fech_nac_alum` date DEFAULT NULL,
  `curp_alum` varchar(18) DEFAULT NULL,
  `lugar_nacimiento_alum` varchar(80) DEFAULT NULL COMMENT 'Plan de las hayas,Municipio  Alto lucero, Veracruz.',
  `tutor_id_tutor` varchar(13) NOT NULL,
  `domicilio_id_domicilio` int(11) NOT NULL,
  `datos_medicos_id_datos_medicos` int(11) NOT NULL,
  `fech_alta_alum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_alum` tinyint(4) NOT NULL DEFAULT '1',
  `fech_baja_alum` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `id_asistencia` int(11) NOT NULL,
  `alumno_id_alumno` varchar(13) NOT NULL,
  `entrada_id_entrada` int(11) NOT NULL,
  `estancia_id_estancia` int(11) NOT NULL,
  `salida_id_salida` int(11) NOT NULL,
  `fech_dia_asistencia` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE IF NOT EXISTS `contacto` (
  `id_contacto` varchar(13) NOT NULL,
  `nombre_cont` varchar(45) NOT NULL,
  `apellidos_cont` varchar(45) NOT NULL,
  `tel_celular_cont` varchar(15) NOT NULL,
  `tel_casa_cont` varchar(15) NOT NULL,
  `imagen_cont` varchar(255) DEFAULT NULL,
  `ine_cont` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_medicos`
--

CREATE TABLE IF NOT EXISTS `datos_medicos` (
  `id_datos_medicos` int(11) NOT NULL,
  `tipo_sangre_dm` varchar(5) DEFAULT NULL,
  `enfermedad_dm` varchar(45) DEFAULT NULL,
  `alergico_medicamento_dm` varchar(45) DEFAULT NULL,
  `peso_dm` float DEFAULT NULL,
  `estatura_dm` float DEFAULT NULL,
  `nss_dm` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE IF NOT EXISTS `domicilio` (
  `id_domicilio` int(11) NOT NULL,
  `calle_dom` varchar(45) NOT NULL,
  `numExt_dom` varchar(5) DEFAULT NULL,
  `numInt_dom` varchar(5) DEFAULT NULL,
  `colonia_dom` varchar(45) DEFAULT NULL,
  `cod_postal_dom` varchar(8) DEFAULT NULL,
  `localidad_dom` varchar(45) DEFAULT NULL,
  `municipio_dom` varchar(45) DEFAULT NULL,
  `estado_dom` varchar(45) DEFAULT NULL,
  `pais_dom` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`id_domicilio`, `calle_dom`, `numExt_dom`, `numInt_dom`, `colonia_dom`, `cod_postal_dom`, `localidad_dom`, `municipio_dom`, `estado_dom`, `pais_dom`) VALUES
(1, 'Agustin Lara', '6', NULL, 'Indeco Animas', '91190', 'Xalapa', 'Xalapa', 'Veracruz', 'Mexico'),
(2, 'Diana Laura', '19', NULL, '23 de Marzo', '91153', 'Xalapa', 'Xalapa', 'Veracruz', 'Mexico'),
(3, 'Manuel Armenta', '10', '10', 'Plan de las Hayas', '91134', 'Plan de las Hayas', 'Juchique de Ferrer', 'Veracruz', 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `id_empleado` varchar(13) NOT NULL,
  `tipo_empleado_id_tipo_empleado` int(2) NOT NULL,
  `nombre_emp` varchar(25) NOT NULL,
  `apellidos_emp` varchar(35) NOT NULL,
  `sexo_emp` enum('M','F') DEFAULT NULL,
  `tel_celular_emp` varchar(15) DEFAULT NULL,
  `tel_casa_emp` varchar(13) DEFAULT NULL,
  `nivel_estudio_emp` varchar(30) DEFAULT NULL,
  `ced_profecional_emp` varchar(18) DEFAULT NULL,
  `email_emp` varchar(50) DEFAULT NULL,
  `imagen_emp` varchar(255) DEFAULT NULL,
  `usuario_id_usuario` int(11) DEFAULT NULL,
  `domicilio_id_domicilio` int(11) NOT NULL,
  `fech_alta_emp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_emp` tinyint(4) DEFAULT '1',
  `fech_baja_emp` timestamp NULL DEFAULT NULL,
  `empresa_id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `tipo_empleado_id_tipo_empleado`, `nombre_emp`, `apellidos_emp`, `sexo_emp`, `tel_celular_emp`, `tel_casa_emp`, `nivel_estudio_emp`, `ced_profecional_emp`, `email_emp`, `imagen_emp`, `usuario_id_usuario`, `domicilio_id_domicilio`, `fech_alta_emp`, `status_emp`, `fech_baja_emp`, `empresa_id_empresa`) VALUES
('admin', 1, 'Liliana', 'Llerena Gonzalez', 'F', NULL, NULL, NULL, NULL, 'direccion@edu-care.mx', '', 1, 1, '2015-08-17 19:24:09', 1, NULL, 1),
('EMP-001', 3, 'Eleazar ', 'Fernandez Ramirez', 'M', '2288462124', '2288462124', 'Superiores', NULL, 'evi_skorpion@hotmail.com', 'eleazar.jpg', 2, 2, '2015-08-17 19:43:54', 1, NULL, 1),
('EMP-002', 2, 'Beatriz Adriana', 'Salamanca Flores', 'F', '2791141206', '2791141206', 'Preparatoria', NULL, 'avvi_teamo@hotmail.com', 'beatriz.jpg', 3, 3, '2015-08-17 19:46:40', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL,
  `nombre_emp` varchar(45) NOT NULL,
  `rfc_emp` varchar(15) NOT NULL COMMENT 'Se debe de ingresar el RFC con homoclave, lo cual ayudará para emitir comprobantes fiscales',
  `logo_emp` varchar(145) DEFAULT NULL,
  `tel_principal_emp` varchar(15) DEFAULT NULL,
  `tel_secundario_emp` varchar(15) DEFAULT NULL,
  `email_emp` varchar(45) DEFAULT NULL,
  `web_emp` varchar(45) DEFAULT NULL,
  `fech_alta_emp` date NOT NULL,
  `regimen_id_regimen` int(11) NOT NULL,
  `plantel_id_plantel` int(11) NOT NULL,
  `domicilio_id_domicilio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cuando la empresa emite facturas a clientes como publico general se debe de \r\nutilizar el RFC generico XAXX010101000 y en el caso de que se cliente extranjero\r\nse debe de utilizar el RC generico exclusivo para ellos: XEXX010101000';

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nombre_emp`, `rfc_emp`, `logo_emp`, `tel_principal_emp`, `tel_secundario_emp`, `email_emp`, `web_emp`, `fech_alta_emp`, `regimen_id_regimen`, `plantel_id_plantel`, `domicilio_id_domicilio`) VALUES
(1, 'Educare, Preschool & Nursey', 'XAXX010101000', 'logo.svg', '2288462124', '2791141206', 'direccion@edu-care.mx', 'https://www.edu-care.mx', '2015-09-01', 8, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE IF NOT EXISTS `entrada` (
  `id_entrada` int(11) NOT NULL,
  `empleado_id_empleado` varchar(13) NOT NULL,
  `persona_autorizada_id_persona_autorizada` int(11) NOT NULL,
  `fech_ent` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_salud_ent` varchar(45) DEFAULT NULL,
  `sintomas_ent` varchar(45) DEFAULT NULL,
  `status_aseo_ent` varchar(45) DEFAULT NULL,
  `status_utiles_ent` varchar(45) DEFAULT NULL,
  `status_fisico_ent` varchar(45) DEFAULT NULL,
  `observacion_pa_ent` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estancia`
--

CREATE TABLE IF NOT EXISTS `estancia` (
  `id_estancia` int(11) NOT NULL,
  `alimentacion_id_alimentacion` int(11) NOT NULL,
  `status_descanso` enum('S','N') DEFAULT NULL,
  `tiempo_descanso` time DEFAULT NULL,
  `funcion_excretora_id_funcion_excretora` int(11) NOT NULL,
  `status_animo_id_status_animo` int(11) NOT NULL,
  `incidencia_estancia` varchar(45) DEFAULT NULL,
  `descrip_insidencia_estancia` varchar(45) DEFAULT NULL,
  `folio_incidencia_estancia` varchar(45) DEFAULT NULL,
  `problema_salud` varchar(45) DEFAULT NULL,
  `descrip_prob_salud` varchar(45) DEFAULT NULL,
  `atencion_prob_salud` varchar(45) DEFAULT NULL,
  `observacion_general_estancia` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion_excretora`
--

CREATE TABLE IF NOT EXISTS `funcion_excretora` (
  `id_funcion_excretora` int(11) NOT NULL,
  `control_esfinter` tinyint(4) DEFAULT '0',
  `fun_exc_pipil` varchar(45) DEFAULT NULL,
  `fun_exc_popo` varchar(45) DEFAULT NULL,
  `status_alerta_fe` tinyint(4) DEFAULT '0',
  `observacion_fe` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
  `id_inscripcion` int(11) NOT NULL,
  `alumno_id_alumno` varchar(13) NOT NULL,
  `empleado_id_empleado` varchar(13) NOT NULL,
  `nivel_id_nivel` varchar(13) NOT NULL,
  `periodo_escolar_id_periodo_escolar` int(11) NOT NULL,
  `salon_id_salon` varchar(13) NOT NULL,
  `fech_inscripcion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_inscripcion` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE IF NOT EXISTS `nivel` (
  `id_nivel` varchar(13) NOT NULL,
  `nombre_niv` varchar(24) NOT NULL,
  `descrip_niv` varchar(20) NOT NULL,
  `edad_mes_niv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`id_nivel`, `nombre_niv`, `descrip_niv`, `edad_mes_niv`) VALUES
('NIV-001', 'Nursery', 'De 40 dÃ­as a 12 mes', 12),
('NIV-002', 'Toddler One', 'De 12 meses a 24 mes', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo_escolar`
--

CREATE TABLE IF NOT EXISTS `periodo_escolar` (
  `id_periodo_escolar` int(11) NOT NULL,
  `fech_inicio_pe` date NOT NULL,
  `fech_fin_pe` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `periodo_escolar`
--

INSERT INTO `periodo_escolar` (`id_periodo_escolar`, `fech_inicio_pe`, `fech_fin_pe`) VALUES
(1, '2015-09-11', '2015-09-17'),
(2, '2015-12-31', '2016-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_autorizada`
--

CREATE TABLE IF NOT EXISTS `persona_autorizada` (
  `alumno_id_alumno` varchar(13) NOT NULL,
  `tutor_id_tutor` varchar(13) NOT NULL,
  `fech_alta_pa` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_pa` tinyint(4) DEFAULT '1',
  `cont_emergencia_pa` tinyint(4) DEFAULT '0',
  `parentesco_pa` varchar(20) DEFAULT NULL,
  `contacto_id_contacto` varchar(13) NOT NULL,
  `id_persona_autorizada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantel`
--

CREATE TABLE IF NOT EXISTS `plantel` (
  `id_plantel` int(11) NOT NULL,
  `nombre_plan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `plantel`
--

INSERT INTO `plantel` (`id_plantel`, `nombre_plan`) VALUES
(1, 'Educare, Indeco Animas'),
(5, 'sdfsdgfs');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimen`
--

CREATE TABLE IF NOT EXISTS `regimen` (
  `id_regimen` int(11) NOT NULL,
  `descrip_regimen` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Regímenes emitidos por el SAT';

--
-- Volcado de datos para la tabla `regimen`
--

INSERT INTO `regimen` (`id_regimen`, `descrip_regimen`) VALUES
(1, 'ASALARIADOS'),
(2, 'HONORARIOS(SERVICIOS PROFECIONALES)'),
(3, 'ARRENDAMIENTO DE INMUEBLES'),
(4, 'ACTIVIDADES EMPRESARIALES'),
(5, 'INCORPORACION FISCAL'),
(6, 'PERSONAS MORALES DEL REGIMEN GENERAL'),
(7, 'PERSONAS MORALES CON FINES NO LUCRATIVOS'),
(8, 'ASOCIACIONES RELIGIOSAS'),
(9, 'REGIMEN FISCAL DE EXTRANJEROS QUE PERCIBEN INGRESO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE IF NOT EXISTS `salida` (
  `id_salida` int(11) NOT NULL,
  `empleado_id_empleado` varchar(13) NOT NULL,
  `persona_autorizada_id_persona_autorizada` int(11) NOT NULL,
  `fech_sal` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status_salud_sal` varchar(45) DEFAULT NULL,
  `sintomas_sal` varchar(45) DEFAULT NULL,
  `status_aseo_sal` varchar(45) DEFAULT NULL,
  `status_utiles_sal` varchar(45) DEFAULT NULL,
  `status_fisico_sal` varchar(45) DEFAULT NULL,
  `observacion_pa_sal` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salon`
--

CREATE TABLE IF NOT EXISTS `salon` (
  `id_salon` varchar(13) NOT NULL,
  `descrip_salon` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `salon`
--

INSERT INTO `salon` (`id_salon`, `descrip_salon`) VALUES
('AUL-001', 'Aula Uno'),
('AUL-002', 'Aula Dos'),
('AUL-003', 'Aula 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_animo`
--

CREATE TABLE IF NOT EXISTS `status_animo` (
  `id_status_animo` int(11) NOT NULL,
  `tipo_status_animo` varchar(45) DEFAULT NULL,
  `lloro_sa` tinyint(4) DEFAULT '0',
  `peleo_sa` tinyint(4) DEFAULT '0',
  `participo_sa` tinyint(4) DEFAULT '1',
  `observacion_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE IF NOT EXISTS `tipo_empleado` (
  `id_tipo_empleado` int(2) NOT NULL,
  `tipo_empleado_te` varchar(25) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`id_tipo_empleado`, `tipo_empleado_te`) VALUES
(1, 'Administrador'),
(2, 'Filtro'),
(3, 'Docente'),
(4, 'Secretaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE IF NOT EXISTS `tutor` (
  `id_tutor` varchar(13) NOT NULL,
  `nombre_tutor` varchar(45) NOT NULL,
  `apellidos_tutor` varchar(60) NOT NULL,
  `tel_celular_tutor` varchar(15) NOT NULL,
  `tel_casa_tutor` varchar(15) DEFAULT NULL,
  `email_tutor` varchar(45) DEFAULT NULL,
  `fech_alta_tutor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_tutor` tinyint(4) NOT NULL DEFAULT '1',
  `domicilio_id_domicilio` int(11) NOT NULL,
  `imagen_tutor` varchar(255) DEFAULT NULL,
  `fech_baja_tutor` timestamp NULL DEFAULT NULL,
  `fech_nac_tutor` date DEFAULT NULL,
  `lugar_nacimiento_tutor` varchar(80) DEFAULT NULL,
  `curp_tutor` varchar(18) DEFAULT NULL,
  `ocupacion_tutor` varchar(45) DEFAULT NULL COMMENT 'FERE861105HVZRML09\nFERE861105HVZRML09',
  `ine_tutor` varchar(18) DEFAULT NULL,
  `sexo_tutor` enum('M','F') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usu` varchar(12) NOT NULL COMMENT 'nombre que se asigna a un empleado para que pueda acceder a la aplicación',
  `password_usu` varchar(50) NOT NULL,
  `status_usu` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Define si el usuario esta activo(1), inactivo(0),asignado a un empleado en especifico(2)'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usu`, `password_usu`, `status_usu`) VALUES
(1, 'liliana', 'liliana', 2),
(2, 'eleazar', 'eleazar', 2),
(3, 'adriana', 'adriana', 2),
(5, 'franck', '3123123', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimentacion`
--
ALTER TABLE `alimentacion`
  ADD PRIMARY KEY (`id_alimentacion`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`),
  ADD KEY `fk_alumno_tutor1_idx` (`tutor_id_tutor`),
  ADD KEY `fk_alumno_domicilio1_idx` (`domicilio_id_domicilio`),
  ADD KEY `fk_alumno_datos_medicos1_idx` (`datos_medicos_id_datos_medicos`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `fk_asistencia_alumno1_idx` (`alumno_id_alumno`),
  ADD KEY `fk_asistencia_entrada1_idx` (`entrada_id_entrada`),
  ADD KEY `fk_asistencia_estancia1_idx` (`estancia_id_estancia`),
  ADD KEY `fk_asistencia_salida1_idx` (`salida_id_salida`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `datos_medicos`
--
ALTER TABLE `datos_medicos`
  ADD PRIMARY KEY (`id_datos_medicos`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id_domicilio`),
  ADD KEY `id_domicilio` (`id_domicilio`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `fk_empleado_usuario1_idx` (`usuario_id_usuario`),
  ADD KEY `fk_empleado_tipoEmpleado1_idx` (`tipo_empleado_id_tipo_empleado`),
  ADD KEY `fk_empleado_domicilio1_idx` (`domicilio_id_domicilio`) USING BTREE,
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `fk_empleado_empresa1_idx` (`empresa_id_empresa`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id_empresa`,`regimen_id_regimen`),
  ADD KEY `fk_empresa_regimen1_idx` (`regimen_id_regimen`) USING BTREE,
  ADD KEY `fk_empresa_plantel1_idx` (`plantel_id_plantel`),
  ADD KEY `fk_empresa_domicilio1_idx` (`domicilio_id_domicilio`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`id_entrada`),
  ADD KEY `fk_entrada_empleado1_idx` (`empleado_id_empleado`),
  ADD KEY `fk_entrada_persona_autorizada1_idx` (`persona_autorizada_id_persona_autorizada`);

--
-- Indices de la tabla `estancia`
--
ALTER TABLE `estancia`
  ADD PRIMARY KEY (`id_estancia`),
  ADD KEY `fk_estancia_alimentacion1_idx` (`alimentacion_id_alimentacion`),
  ADD KEY `fk_estancia_funcion_excretora1_idx` (`funcion_excretora_id_funcion_excretora`),
  ADD KEY `fk_estancia_status_animo1_idx` (`status_animo_id_status_animo`);

--
-- Indices de la tabla `funcion_excretora`
--
ALTER TABLE `funcion_excretora`
  ADD PRIMARY KEY (`id_funcion_excretora`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD KEY `fk_inscripcion_alumno1_idx` (`alumno_id_alumno`),
  ADD KEY `fk_inscripcion_empleado1_idx` (`empleado_id_empleado`),
  ADD KEY `fk_inscripcion_nivel1_idx` (`nivel_id_nivel`),
  ADD KEY `fk_inscripcion_periodo_escolar1_idx` (`periodo_escolar_id_periodo_escolar`),
  ADD KEY `fk_inscripcion_salon1_idx` (`salon_id_salon`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`id_nivel`);

--
-- Indices de la tabla `periodo_escolar`
--
ALTER TABLE `periodo_escolar`
  ADD PRIMARY KEY (`id_periodo_escolar`);

--
-- Indices de la tabla `persona_autorizada`
--
ALTER TABLE `persona_autorizada`
  ADD PRIMARY KEY (`id_persona_autorizada`),
  ADD KEY `fk_table1_alumno1_idx` (`alumno_id_alumno`),
  ADD KEY `fk_table1_tutor1_idx` (`tutor_id_tutor`),
  ADD KEY `fk_persona_autorizada_contacto1_idx` (`contacto_id_contacto`);

--
-- Indices de la tabla `plantel`
--
ALTER TABLE `plantel`
  ADD PRIMARY KEY (`id_plantel`),
  ADD KEY `id_plantel` (`id_plantel`);

--
-- Indices de la tabla `regimen`
--
ALTER TABLE `regimen`
  ADD PRIMARY KEY (`id_regimen`),
  ADD KEY `id_regimen` (`id_regimen`) USING BTREE;

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `fk_salida_empleado1_idx` (`empleado_id_empleado`),
  ADD KEY `fk_salida_persona_autorizada1_idx` (`persona_autorizada_id_persona_autorizada`);

--
-- Indices de la tabla `salon`
--
ALTER TABLE `salon`
  ADD PRIMARY KEY (`id_salon`);

--
-- Indices de la tabla `status_animo`
--
ALTER TABLE `status_animo`
  ADD PRIMARY KEY (`id_status_animo`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`id_tipo_empleado`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id_tutor`),
  ADD KEY `fk_tutor_domicilio1_idx` (`domicilio_id_domicilio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id_domicilio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `periodo_escolar`
--
ALTER TABLE `periodo_escolar`
  MODIFY `id_periodo_escolar` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `plantel`
--
ALTER TABLE `plantel`
  MODIFY `id_plantel` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `regimen`
--
ALTER TABLE `regimen`
  MODIFY `id_regimen` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  MODIFY `id_tipo_empleado` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `fk_alumno_datos_medicos1` FOREIGN KEY (`datos_medicos_id_datos_medicos`) REFERENCES `datos_medicos` (`id_datos_medicos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alumno_domicilio1` FOREIGN KEY (`domicilio_id_domicilio`) REFERENCES `domicilio` (`id_domicilio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alumno_tutor1` FOREIGN KEY (`tutor_id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_asistencia_alumno1` FOREIGN KEY (`alumno_id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asistencia_entrada1` FOREIGN KEY (`entrada_id_entrada`) REFERENCES `entrada` (`id_entrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asistencia_estancia1` FOREIGN KEY (`estancia_id_estancia`) REFERENCES `estancia` (`id_estancia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_asistencia_salida1` FOREIGN KEY (`salida_id_salida`) REFERENCES `salida` (`id_salida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_domicilio1` FOREIGN KEY (`domicilio_id_domicilio`) REFERENCES `domicilio` (`id_domicilio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empleado_empresa1` FOREIGN KEY (`empresa_id_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empleado_tipoEmpleado1` FOREIGN KEY (`tipo_empleado_id_tipo_empleado`) REFERENCES `tipo_empleado` (`id_tipo_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empleado_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_domicilio1` FOREIGN KEY (`domicilio_id_domicilio`) REFERENCES `domicilio` (`id_domicilio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_plantel1` FOREIGN KEY (`plantel_id_plantel`) REFERENCES `plantel` (`id_plantel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_regimen1` FOREIGN KEY (`regimen_id_regimen`) REFERENCES `regimen` (`id_regimen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_entrada_empleado1` FOREIGN KEY (`empleado_id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entrada_persona_autorizada1` FOREIGN KEY (`persona_autorizada_id_persona_autorizada`) REFERENCES `persona_autorizada` (`id_persona_autorizada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estancia`
--
ALTER TABLE `estancia`
  ADD CONSTRAINT `fk_estancia_alimentacion1` FOREIGN KEY (`alimentacion_id_alimentacion`) REFERENCES `alimentacion` (`id_alimentacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estancia_funcion_excretora1` FOREIGN KEY (`funcion_excretora_id_funcion_excretora`) REFERENCES `funcion_excretora` (`id_funcion_excretora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estancia_status_animo1` FOREIGN KEY (`status_animo_id_status_animo`) REFERENCES `status_animo` (`id_status_animo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_inscripcion_alumno1` FOREIGN KEY (`alumno_id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripcion_empleado1` FOREIGN KEY (`empleado_id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripcion_nivel1` FOREIGN KEY (`nivel_id_nivel`) REFERENCES `nivel` (`id_nivel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripcion_periodo_escolar1` FOREIGN KEY (`periodo_escolar_id_periodo_escolar`) REFERENCES `periodo_escolar` (`id_periodo_escolar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripcion_salon1` FOREIGN KEY (`salon_id_salon`) REFERENCES `salon` (`id_salon`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona_autorizada`
--
ALTER TABLE `persona_autorizada`
  ADD CONSTRAINT `fk_persona_autorizada_contacto1` FOREIGN KEY (`contacto_id_contacto`) REFERENCES `contacto` (`id_contacto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_alumno1` FOREIGN KEY (`alumno_id_alumno`) REFERENCES `alumno` (`id_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_table1_tutor1` FOREIGN KEY (`tutor_id_tutor`) REFERENCES `tutor` (`id_tutor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `fk_salida_empleado1` FOREIGN KEY (`empleado_id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_salida_persona_autorizada1` FOREIGN KEY (`persona_autorizada_id_persona_autorizada`) REFERENCES `persona_autorizada` (`id_persona_autorizada`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `fk_tutor_domicilio1` FOREIGN KEY (`domicilio_id_domicilio`) REFERENCES `domicilio` (`id_domicilio`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/* Usuario para la base de datos educare*/GRANT USAGE ON *.* TO 'educare'@'localhost' IDENTIFIED BY PASSWORD '*32E06B037419A3A429596432A1D81AF430C30336';

GRANT ALL PRIVILEGES ON `educare`.* TO 'educare'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `db\_educare`.* TO 'educare'@'localhost' WITH GRANT OPTION;

GRANT PROXY ON ''@'' TO 'educare'@'localhost' WITH GRANT OPTION;

GRANT USAGE ON *.* TO 'educare'@'localhost' IDENTIFIED BY PASSWORD '*32E06B037419A3A429596432A1D81AF430C30336';

GRANT ALL PRIVILEGES ON `educare`.* TO 'educare'@'localhost' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `db\_educare`.* TO 'educare'@'localhost' WITH GRANT OPTION;

GRANT PROXY ON ''@'' TO 'educare'@'localhost' WITH GRANT OPTION;