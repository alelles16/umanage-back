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

-- Volcando estructura para tabla umanage.asignaturas
CREATE TABLE IF NOT EXISTS `asignaturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla umanage.cargos
CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla umanage.jornadas
CREATE TABLE IF NOT EXISTS `jornadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla umanage.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla umanage.sedes_jornadas
CREATE TABLE IF NOT EXISTS `sedes_jornadas` (
  `jornadas_id` int(11) NOT NULL,
  `sedes_id` int(11) NOT NULL,
  KEY `fk_sedes_jornadas_jornadas1_idx` (`jornadas_id`),
  KEY `fk_sedes_jornadas_sedes1_idx` (`sedes_id`),
  CONSTRAINT `fk_sedes_jornadas_jornadas1` FOREIGN KEY (`jornadas_id`) REFERENCES `jornadas` (`id`),
  CONSTRAINT `fk_sedes_jornadas_sedes1` FOREIGN KEY (`sedes_id`) REFERENCES `sedes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla umanage.semestres
CREATE TABLE IF NOT EXISTS `semestres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
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

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla umanage.usuarios_roles
CREATE TABLE IF NOT EXISTS `usuarios_roles` (
  `usuarios_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  KEY `fk_usuarios_roles_usuarios1_idx` (`usuarios_id`),
  KEY `fk_usuarios_roles_roles1_id` (`roles_id`),
  CONSTRAINT `fk_usuarios_roles_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_usuarios_roles_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
