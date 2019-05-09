-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.0.14 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para umanage
CREATE DATABASE IF NOT EXISTS `umanage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `umanage`;

-- Volcando estructura para tabla umanage.asignaturas
CREATE TABLE IF NOT EXISTS `asignaturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.asignaturas: ~0 rows (aproximadamente)
DELETE FROM `asignaturas`;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` (`id`, `codigo`, `nombre`, `estado`) VALUES
	(1, 'SIS1', 'Algoritmos', 1);
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.asignaturas_pensums
CREATE TABLE IF NOT EXISTS `asignaturas_pensums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `docente` int(11) NOT NULL,
  `pensums_id` int(11) NOT NULL,
  `asignaturas_id` int(11) NOT NULL,
  `semestres_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asignaturas_pensums_usuarios1_idx` (`docente`),
  KEY `fk_asignaturas_pensums_pensums1_idx` (`pensums_id`),
  KEY `fk_asignaturas_pensums_asignaturas1_idx` (`asignaturas_id`),
  KEY `fk_asignaturas_pensums_semestres1_idx` (`semestres_id`),
  CONSTRAINT `fk_asignaturas_pensums_asignaturas1` FOREIGN KEY (`asignaturas_id`) REFERENCES `asignaturas` (`id`),
  CONSTRAINT `fk_asignaturas_pensums_pensums1` FOREIGN KEY (`pensums_id`) REFERENCES `pensums` (`id`),
  CONSTRAINT `fk_asignaturas_pensums_semestres1` FOREIGN KEY (`semestres_id`) REFERENCES `semestres` (`id`),
  CONSTRAINT `fk_asignaturas_pensums_usuarios1` FOREIGN KEY (`docente`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.asignaturas_pensums: ~0 rows (aproximadamente)
DELETE FROM `asignaturas_pensums`;
/*!40000 ALTER TABLE `asignaturas_pensums` DISABLE KEYS */;
INSERT INTO `asignaturas_pensums` (`id`, `docente`, `pensums_id`, `asignaturas_id`, `semestres_id`) VALUES
	(1, 5, 1, 1, 1);
/*!40000 ALTER TABLE `asignaturas_pensums` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.caracteristicas
CREATE TABLE IF NOT EXISTS `caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `instalaciones_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_caracteristicas_instalaciones1_idx` (`instalaciones_id`),
  CONSTRAINT `fk_caracteristicas_instalaciones1` FOREIGN KEY (`instalaciones_id`) REFERENCES `instalaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.caracteristicas: ~0 rows (aproximadamente)
DELETE FROM `caracteristicas`;
/*!40000 ALTER TABLE `caracteristicas` DISABLE KEYS */;
INSERT INTO `caracteristicas` (`id`, `valor`, `nombre`, `instalaciones_id`) VALUES
	(1, 'aire_acondicionado', 'disponible', 1);
/*!40000 ALTER TABLE `caracteristicas` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.cargos
CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.cargos: ~0 rows (aproximadamente)
DELETE FROM `cargos`;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` (`id`, `nombre`) VALUES
	(1, 'default'),
	(2, 'coordinador'),
	(3, 'docente');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.horarios
CREATE TABLE IF NOT EXISTS `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `dia_semana` varchar(250) NOT NULL,
  `asignaturas_pensums_id` int(11) NOT NULL,
  `instalaciones_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_horarios_asignaturas_pensums1_idx` (`asignaturas_pensums_id`),
  KEY `fk_horarios_instalaciones1_idx` (`instalaciones_id`),
  CONSTRAINT `fk_horarios_asignaturas_pensums1` FOREIGN KEY (`asignaturas_pensums_id`) REFERENCES `asignaturas_pensums` (`id`),
  CONSTRAINT `fk_horarios_instalaciones1` FOREIGN KEY (`instalaciones_id`) REFERENCES `instalaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.horarios: ~0 rows (aproximadamente)
DELETE FROM `horarios`;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` (`id`, `hora_inicio`, `hora_fin`, `dia_semana`, `asignaturas_pensums_id`, `instalaciones_id`) VALUES
	(1, '07:00:00', '08:35:00', 'lunes', 1, 1);
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.instalaciones
CREATE TABLE IF NOT EXISTS `instalaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `cupo_max` int(11) NOT NULL,
  `tipo` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `sedes_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instalaciones_sedes1_idx` (`sedes_id`),
  CONSTRAINT `fk_instalaciones_sedes1` FOREIGN KEY (`sedes_id`) REFERENCES `sedes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.instalaciones: ~0 rows (aproximadamente)
DELETE FROM `instalaciones`;
/*!40000 ALTER TABLE `instalaciones` DISABLE KEYS */;
INSERT INTO `instalaciones` (`id`, `nombre`, `cupo_max`, `tipo`, `estado`, `sedes_id`) VALUES
	(1, 'A101', 32, 'Aula', 1, 1);
/*!40000 ALTER TABLE `instalaciones` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.instituciones
CREATE TABLE IF NOT EXISTS `instituciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `nit` varchar(250) NOT NULL,
  `ciudad` varchar(250) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.instituciones: ~0 rows (aproximadamente)
DELETE FROM `instituciones`;
/*!40000 ALTER TABLE `instituciones` DISABLE KEYS */;
INSERT INTO `instituciones` (`id`, `nombre`, `nit`, `ciudad`, `municipio`, `email`, `estado`, `direccion`) VALUES
	(1, 'U CTG', '123.123.123', 'Cartagena', 'Cartagena', 'uctg@ctg.co', 1, 'Cll 26');
/*!40000 ALTER TABLE `instituciones` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.jornadas
CREATE TABLE IF NOT EXISTS `jornadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.jornadas: ~0 rows (aproximadamente)
DELETE FROM `jornadas`;
/*!40000 ALTER TABLE `jornadas` DISABLE KEYS */;
INSERT INTO `jornadas` (`id`, `nombre`, `hora_inicio`, `hora_fin`) VALUES
	(1, 'Diurna', '07:00:00', '18:00:00');
/*!40000 ALTER TABLE `jornadas` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.pensums
CREATE TABLE IF NOT EXISTS `pensums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `es_principal` tinyint(4) NOT NULL,
  `programas_academicos_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pensums_programas_academicos1_idx` (`programas_academicos_id`),
  CONSTRAINT `fk_pensums_programas_academicos1` FOREIGN KEY (`programas_academicos_id`) REFERENCES `programas_academicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.pensums: ~0 rows (aproximadamente)
DELETE FROM `pensums`;
/*!40000 ALTER TABLE `pensums` DISABLE KEYS */;
INSERT INTO `pensums` (`id`, `nombre`, `estado`, `es_principal`, `programas_academicos_id`) VALUES
	(1, '190101', 1, 1, 1);
/*!40000 ALTER TABLE `pensums` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.programas_academicos
CREATE TABLE IF NOT EXISTS `programas_academicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `num_creditos` int(11) NOT NULL,
  `snies` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `coordinador` int(11) NOT NULL,
  `instituciones_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_programas_academicos_usuarios1_idx` (`coordinador`),
  KEY `fk_programas_academicos_instituciones1_idx` (`instituciones_id`),
  CONSTRAINT `fk_programas_academicos_instituciones1` FOREIGN KEY (`instituciones_id`) REFERENCES `instituciones` (`id`),
  CONSTRAINT `fk_programas_academicos_usuarios1` FOREIGN KEY (`coordinador`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.programas_academicos: ~0 rows (aproximadamente)
DELETE FROM `programas_academicos`;
/*!40000 ALTER TABLE `programas_academicos` DISABLE KEYS */;
INSERT INTO `programas_academicos` (`id`, `codigo`, `nombre`, `num_creditos`, `snies`, `estado`, `coordinador`, `instituciones_id`) VALUES
	(1, '123', 'ING. sistemas', 32, 'SIST12345', 1, 4, 1);
/*!40000 ALTER TABLE `programas_academicos` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.roles: ~0 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `nombre`) VALUES
	(1, 'administrador'),
	(2, 'coordinador'),
	(3, 'docente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.sedes
CREATE TABLE IF NOT EXISTS `sedes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `ciudad` varchar(250) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `instituciones_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sedes_instituciones1_idx` (`instituciones_id`),
  CONSTRAINT `fk_sedes_instituciones1` FOREIGN KEY (`instituciones_id`) REFERENCES `instituciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.sedes: ~0 rows (aproximadamente)
DELETE FROM `sedes`;
/*!40000 ALTER TABLE `sedes` DISABLE KEYS */;
INSERT INTO `sedes` (`id`, `nombre`, `direccion`, `ciudad`, `municipio`, `instituciones_id`) VALUES
	(1, 'Principal', 'Cll 26', 'Cartagena', 'Cartagena', 1);
/*!40000 ALTER TABLE `sedes` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.sedes_jornadas
CREATE TABLE IF NOT EXISTS `sedes_jornadas` (
  `jornadas_id` int(11) NOT NULL,
  `sedes_id` int(11) NOT NULL,
  KEY `fk_sedes_jornadas_jornadas1_idx` (`jornadas_id`),
  KEY `fk_sedes_jornadas_sedes1_idx` (`sedes_id`),
  CONSTRAINT `fk_sedes_jornadas_jornadas1` FOREIGN KEY (`jornadas_id`) REFERENCES `jornadas` (`id`),
  CONSTRAINT `fk_sedes_jornadas_sedes1` FOREIGN KEY (`sedes_id`) REFERENCES `sedes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.sedes_jornadas: ~0 rows (aproximadamente)
DELETE FROM `sedes_jornadas`;
/*!40000 ALTER TABLE `sedes_jornadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `sedes_jornadas` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.semestres
CREATE TABLE IF NOT EXISTS `semestres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.semestres: ~0 rows (aproximadamente)
DELETE FROM `semestres`;
/*!40000 ALTER TABLE `semestres` DISABLE KEYS */;
INSERT INTO `semestres` (`id`, `codigo`, `nombre`, `estado`) VALUES
	(1, 'SIS01', 'Semestre 1', 1);
/*!40000 ALTER TABLE `semestres` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(250) NOT NULL,
  `apellidos` varchar(250) NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `telefono` varchar(250) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_ingreso` datetime NOT NULL,
  `cargos_id` int(11) NOT NULL,
  `instituciones_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_cargos1_idx` (`cargos_id`),
  KEY `fk_usuarios_instituciones1_idx` (`instituciones_id`),
  CONSTRAINT `fk_usuarios_cargos1` FOREIGN KEY (`cargos_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `fk_usuarios_instituciones1` FOREIGN KEY (`instituciones_id`) REFERENCES `instituciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.usuarios: ~0 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `identificacion`, `email`, `contrasena`, `telefono`, `direccion`, `fecha_nacimiento`, `fecha_ingreso`, `cargos_id`, `instituciones_id`) VALUES
	(1, 'Prueba', 'P', '123456', 'prueba@uctg.co', '123456', '3212323234', 'Cll 56', '1991-08-08', '2018-05-05 00:00:00', 1, 1),
	(4, 'Prueba Coordinador', 'P', '1234567', 'prueba_coordinador@uctg.co', '123456', '3212323234', 'Cll 56', '1991-08-08', '2018-05-05 00:00:00', 2, 1),
	(5, 'Prueba Docente', 'P', '12345678', 'prueba_docente@uctg.co', '123456', '3212323234', 'Cll 56', '1991-08-08', '2018-05-05 00:00:00', 3, 1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla umanage.usuarios_roles
CREATE TABLE IF NOT EXISTS `usuarios_roles` (
  `usuarios_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  KEY `fk_usuarios_roles_usuarios1_idx` (`usuarios_id`),
  KEY `fk_usuarios_roles_roles1_id` (`roles_id`),
  CONSTRAINT `fk_usuarios_roles_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_usuarios_roles_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla umanage.usuarios_roles: ~0 rows (aproximadamente)
DELETE FROM `usuarios_roles`;
/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
INSERT INTO `usuarios_roles` (`usuarios_id`, `roles_id`) VALUES
	(1, 1),
	(4, 2),
	(5, 3);
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
