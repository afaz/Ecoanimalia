-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.5.27 - MySQL Community Server (GPL)
-- SO del servidor:              Win32
-- HeidiSQL Versión:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para ecoanimalia
CREATE DATABASE IF NOT EXISTS `ecoanimalia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecoanimalia`;


-- Volcando estructura para tabla ecoanimalia.detalleadopcion
CREATE TABLE IF NOT EXISTS `detalleadopcion` (
  `SERIE` int(11) DEFAULT NULL,
  `ID_FICHA_ADOPCION` int(11) DEFAULT NULL,
  KEY `FK_DetalleADOPCION_mascota` (`SERIE`),
  KEY `FK_DetalleADOPCION_fichaadopcion` (`ID_FICHA_ADOPCION`),
  CONSTRAINT `FK_DetalleADOPCION_fichaadopcion` FOREIGN KEY (`ID_FICHA_ADOPCION`) REFERENCES `fichaadopcion` (`ID`),
  CONSTRAINT `FK_detalleadopcion_mascota` FOREIGN KEY (`SERIE`) REFERENCES `mascota` (`SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.detalleadopcion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalleadopcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleadopcion` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.fichaadopcion
CREATE TABLE IF NOT EXISTS `fichaadopcion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PERSONA` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `ESTADO` tinyint(4) NOT NULL,
  `RELACION_RESPONSABLE` varchar(50) NOT NULL,
  `OBSERVACIONES` varchar(200) NOT NULL,
  `FECHA_ADOPCION` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FICHAADOPCION_persona` (`ID_PERSONA`),
  KEY `FK_FICHAADOPCION_usuario` (`ID_USUARIO`),
  CONSTRAINT `FK_FICHAADOPCION_persona` FOREIGN KEY (`ID_PERSONA`) REFERENCES `persona` (`ID`),
  CONSTRAINT `FK_FICHAADOPCION_usuario` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.fichaadopcion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `fichaadopcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichaadopcion` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.fichatemporal
CREATE TABLE IF NOT EXISTS `fichatemporal` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TIPO_MASCOTA` int(11) NOT NULL,
  `ID_PERSONA` int(11) NOT NULL,
  `TAMANO` varchar(10) NOT NULL,
  `ESTADO` varchar(10) NOT NULL,
  `OBSERVACIONES` varchar(50) DEFAULT NULL,
  `VOLUNTARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fichatemporal_tipomascota` (`TIPO_MASCOTA`),
  KEY `FK_fichatemporal_persona` (`ID_PERSONA`),
  KEY `FK_fichatemporal_tamañomascota` (`TAMANO`),
  KEY `FK_fichatemporal_usuario` (`VOLUNTARIO`),
  CONSTRAINT `FK_fichatemporal_persona` FOREIGN KEY (`ID_PERSONA`) REFERENCES `persona` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fichatemporal_tipomascota` FOREIGN KEY (`TIPO_MASCOTA`) REFERENCES `tipomascota` (`ID`),
  CONSTRAINT `FK_fichatemporal_usuario` FOREIGN KEY (`VOLUNTARIO`) REFERENCES `usuario` (`SERIE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.fichatemporal: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `fichatemporal` DISABLE KEYS */;
INSERT INTO `fichatemporal` (`ID`, `TIPO_MASCOTA`, `ID_PERSONA`, `TAMANO`, `ESTADO`, `OBSERVACIONES`, `VOLUNTARIO`) VALUES
	(7, 1, 14, 'Grande', 'Activo', NULL, 1);
/*!40000 ALTER TABLE `fichatemporal` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.historialclinico
CREATE TABLE IF NOT EXISTS `historialclinico` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERIE` int(11) NOT NULL,
  `FECHA` date NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_HistorialClinico_mascota` (`SERIE`),
  CONSTRAINT `FK_historialclinico_mascota` FOREIGN KEY (`SERIE`) REFERENCES `mascota` (`SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.historialclinico: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historialclinico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialclinico` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.imagenmascota
CREATE TABLE IF NOT EXISTS `imagenmascota` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERIE` int(11) DEFAULT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `IMAGEN` longblob NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_imagen_mascota_mascota` (`SERIE`),
  CONSTRAINT `FK_imagenmascota_mascota` FOREIGN KEY (`SERIE`) REFERENCES `mascota` (`SERIE`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.imagenmascota: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `imagenmascota` DISABLE KEYS */;
INSERT INTO `imagenmascota` (`ID`, `SERIE`, `DESCRIPCION`, `IMAGEN`) VALUES
/*!40000 ALTER TABLE `imagenmascota` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.mascota
CREATE TABLE IF NOT EXISTS `mascota` (
  `SERIE` int(11) NOT NULL,
  `USUARIO` int(11) NOT NULL,
  `ID_TEMPORAL` int(11) NOT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `ID_TIPO` int(11) DEFAULT NULL,
  `TAMANO` varchar(10) DEFAULT NULL,
  `ESTADO` varchar(50) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `RAZA` varchar(50) NOT NULL,
  `SEXO` varchar(50) NOT NULL,
  `COLOR` varchar(50) NOT NULL,
  `EDAD` varchar(50) DEFAULT NULL,
  `ESTERILIZADO` char(2) DEFAULT NULL,
  `FECHA_ESTERILIZACION` date DEFAULT NULL,
  PRIMARY KEY (`SERIE`),
  KEY `FK_Mascota_tipomascota` (`ID_TIPO`),
  KEY `FK_mascota_estadomascota` (`ESTADO`),
  KEY `FK_mascota_usuario` (`USUARIO`),
  KEY `FK_mascota_fichatemporal` (`ID_TEMPORAL`),
  CONSTRAINT `FK_mascota_fichatemporal` FOREIGN KEY (`ID_TEMPORAL`) REFERENCES `fichatemporal` (`ID`),
  CONSTRAINT `FK_mascota_tipomascota` FOREIGN KEY (`ID_TIPO`) REFERENCES `tipomascota` (`ID`),
  CONSTRAINT `FK_mascota_usuario` FOREIGN KEY (`USUARIO`) REFERENCES `usuario` (`SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.mascota: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` (`SERIE`, `USUARIO`, `ID_TEMPORAL`, `FECHA_INGRESO`, `ID_TIPO`, `TAMANO`, `ESTADO`, `NOMBRE`, `RAZA`, `SEXO`, `COLOR`, `EDAD`, `ESTERILIZADO`, `FECHA_ESTERILIZACION`) VALUES
	(1, 2, 7, '2014-04-07', 1, 'Mediano', 'En Recuperacion', 'sasha', 'siberiano', 'Hembra', 'pardo', '1 año', 'Si', '2014-04-03');
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDOS` varchar(50) NOT NULL,
  `DNI` char(9) NOT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL,
  `SEXO` varchar(14) DEFAULT NULL,
  `EDAD` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FACEBOOK` varchar(50) DEFAULT NULL,
  `RPM` varchar(11) DEFAULT NULL,
  `TEL_MOV` int(11) DEFAULT NULL,
  `TEL_CLARO` int(11) DEFAULT NULL,
  `TEL_NEX` varchar(11) DEFAULT NULL,
  `TEL_CASA` int(11) DEFAULT NULL,
  `HORARIO_DISPONIBLE` varchar(50) DEFAULT NULL,
  `RELACION_RESCATISTA` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DNI` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.persona: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`ID`, `NOMBRE`, `APELLIDOS`, `DNI`, `DIRECCION`, `SEXO`, `EDAD`, `EMAIL`, `FACEBOOK`, `RPM`, `TEL_MOV`, `TEL_CLARO`, `TEL_NEX`, `TEL_CASA`, `HORARIO_DISPONIBLE`, `RELACION_RESCATISTA`) VALUES
	(14, 'cesar', 'salazar', '543534', 'calle  angamos', 'Masculino', '21 años', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.tipomascota
CREATE TABLE IF NOT EXISTS `tipomascota` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.tipomascota: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tipomascota` DISABLE KEYS */;
INSERT INTO `tipomascota` (`ID`, `DESCRIPCION`) VALUES
	(1, 'Perro'),
	(2, 'Gato'),
	(3, 'Conejo');
/*!40000 ALTER TABLE `tipomascota` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `SERIE` int(20) NOT NULL,
  `CODIGO` varchar(25) NOT NULL,
  `ENCARGADO` int(11) DEFAULT NULL,
  `USUARIO` varchar(50) DEFAULT NULL,
  `CONTRASENA` varchar(50) DEFAULT NULL,
  `TIPO` varchar(50) NOT NULL,
  `NOMBRES` varchar(100) NOT NULL,
  `APELLIDOS` varchar(100) NOT NULL,
  `SEXO` varchar(50) DEFAULT NULL,
  `DNI` char(8) NOT NULL,
  `DIRECCION` varchar(1000) DEFAULT NULL,
  `REFERENCIA` varchar(1000) DEFAULT NULL,
  `MOVISTAR` int(10) DEFAULT NULL,
  `CLARO` int(10) DEFAULT NULL,
  `NEXTEL` int(10) DEFAULT NULL,
  `TELEFONO` int(10) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `FACEBOOK` varchar(100) DEFAULT NULL,
  `OCUPACION` varchar(100) DEFAULT NULL,
  `ESTADO` varchar(50) NOT NULL,
  PRIMARY KEY (`SERIE`,`CODIGO`),
  UNIQUE KEY `USUARIO_CONTRASEÑA` (`USUARIO`,`CONTRASENA`),
  KEY `FK_usuario_usuario` (`ENCARGADO`),
  CONSTRAINT `FK_usuario_usuario` FOREIGN KEY (`ENCARGADO`) REFERENCES `usuario` (`SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`SERIE`, `CODIGO`, `ENCARGADO`, `USUARIO`, `CONTRASENA`, `TIPO`, `NOMBRES`, `APELLIDOS`, `SEXO`, `DNI`, `DIRECCION`, `REFERENCIA`, `MOVISTAR`, `CLARO`, `NEXTEL`, `TELEFONO`, `EMAIL`, `FACEBOOK`, `OCUPACION`, `ESTADO`) VALUES
	(1, 't456', NULL, 'rosinaldo.santur', 'mtMP/JakMVdoDQSFyEfY3g==', 'administrador', 'rosinaldo', 'chaupis santur', 'Masculino', '54543', 'calle mancora f2 lote 14', 'por amotape con peru', 9753435, 95435345, 853543, 354116, 'rosi_8_1993@hotmail.com', 'rosinaldo santur', 'estudiante', 'activo'),
	(2, 't78', NULL, 'aline.arevalo', 'nvjKTG69r6g=', 'encargado', 'aline fiama', 'arevalo zapata', 'Femenino', '5463643', '', '', 0, 0, 0, 0, '', '', '', 'activo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.vacuna
CREATE TABLE IF NOT EXISTS `vacuna` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERIE` int(11) NOT NULL,
  `NUMERO_VACUNA` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `OBSERVACION` varchar(50) DEFAULT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_vacuna_mascota` (`SERIE`),
  CONSTRAINT `FK_vacuna_mascota` FOREIGN KEY (`SERIE`) REFERENCES `mascota` (`SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.vacuna: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vacuna` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacuna` ENABLE KEYS */;


-- Volcando estructura para tabla ecoanimalia.visita
CREATE TABLE IF NOT EXISTS `visita` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERIE` int(11) DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL,
  `OBSERVACION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_visita_mascota` (`SERIE`),
  CONSTRAINT `FK_visita_mascota` FOREIGN KEY (`SERIE`) REFERENCES `mascota` (`SERIE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla ecoanimalia.visita: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;