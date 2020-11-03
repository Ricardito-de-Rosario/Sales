-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for denunciasdb
CREATE DATABASE IF NOT EXISTS `denunciasdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `denunciasdb`;

-- Dumping structure for table denunciasdb.tacciones
CREATE TABLE IF NOT EXISTS `tacciones` (
  `nAccion` smallint(2) NOT NULL AUTO_INCREMENT,
  `cAccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nAccion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tacciones: ~0 rows (approximately)
/*!40000 ALTER TABLE `tacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tacciones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.taccionespreviashecho
CREATE TABLE IF NOT EXISTS `taccionespreviashecho` (
  `id_nAccionPrevia` smallint(4) NOT NULL DEFAULT 0,
  `cAccionPrevia` varchar(100) NOT NULL DEFAULT '0',
  `cObsAccionPrevia` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nAccionPrevia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.taccionespreviashecho: ~0 rows (approximately)
/*!40000 ALTER TABLE `taccionespreviashecho` DISABLE KEYS */;
/*!40000 ALTER TABLE `taccionespreviashecho` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tactividadeseconomicasgrales
CREATE TABLE IF NOT EXISTS `tactividadeseconomicasgrales` (
  `id_nActividadEconomicaGral` smallint(4) NOT NULL DEFAULT 0,
  `cActividadEconomicaGral` varchar(50) DEFAULT NULL,
  `cDesActividadEconomica` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nActividadEconomicaGral`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tactividadeseconomicasgrales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tactividadeseconomicasgrales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tactividadeseconomicasgrales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tagravantes
CREATE TABLE IF NOT EXISTS `tagravantes` (
  `id_nAgravante` smallint(4) NOT NULL AUTO_INCREMENT,
  `cAgravante` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_nAgravante`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tagravantes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tagravantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagravantes` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tagravantesdelitos
CREATE TABLE IF NOT EXISTS `tagravantesdelitos` (
  `id_nHechoAgravante` int(11) unsigned zerofill NOT NULL,
  `id_nHecho` smallint(4) NOT NULL DEFAULT 0,
  `id_nAgravante` smallint(4) NOT NULL DEFAULT 0,
  `cHechoAgravante` varchar(100) DEFAULT NULL,
  `cComentarioAgravante` smallint(100) DEFAULT NULL,
  PRIMARY KEY (`id_nAgravante`,`id_nHecho`),
  UNIQUE KEY `idxHechoAgravante` (`id_nHechoAgravante`),
  KEY `idxHecho` (`id_nHecho`),
  KEY `idxAgravante` (`id_nHecho`),
  CONSTRAINT `fk_Agravante` FOREIGN KEY (`id_nAgravante`) REFERENCES `tagravantes` (`id_nAgravante`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Hecho` FOREIGN KEY (`id_nHecho`) REFERENCES `thechos` (`id_nHecho`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tagravantesdelitos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tagravantesdelitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagravantesdelitos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tarmasdenunciaspoliciales
CREATE TABLE IF NOT EXISTS `tarmasdenunciaspoliciales` (
  `id_ArmaDelito` int(11) NOT NULL AUTO_INCREMENT,
  `id_ConcurrenciaDelitos` int(11) NOT NULL DEFAULT 0,
  `id_nCalidadElemento` smallint(4) NOT NULL,
  `nGTC` double NOT NULL DEFAULT 0,
  `nMMA` double NOT NULL DEFAULT 0,
  `id_nCalibre` smallint(4) NOT NULL DEFAULT 0,
  `nEstadoElemento` smallint(4) NOT NULL DEFAULT 0,
  `nNumeroSerie` varchar(100) NOT NULL,
  `id_nPersonaDelito` int(11) NOT NULL DEFAULT 0,
  `id_nElemento` smallint(4) NOT NULL DEFAULT 1000,
  `idCartucho` smallint(4) NOT NULL,
  `nPropietarioArma` double NOT NULL DEFAULT 0,
  `cCodQR` varchar(150) NOT NULL,
  `cColorElemento` varchar(45) DEFAULT NULL,
  `nCantidadElemento` smallint(4) DEFAULT NULL,
  `bPPSF` tinyint(4) DEFAULT 0,
  `bFrancoServicio` tinyint(4) DEFAULT 1,
  `cOtraCaracteristicaElemento` varchar(255) DEFAULT NULL,
  `CantCartucho` smallint(4) DEFAULT NULL,
  `cNuevoDatoArma` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`id_ConcurrenciaDelitos`,`id_nCalidadElemento`,`nGTC`,`nMMA`,`id_nCalibre`,`nEstadoElemento`,`nNumeroSerie`,`id_nPersonaDelito`) USING BTREE,
  UNIQUE KEY `idxArmaDelito` (`id_ArmaDelito`),
  KEY `idxCalidadElemento` (`id_nCalidadElemento`),
  KEY `idxElemento` (`id_nElemento`),
  KEY `idxEstadoElemento` (`nEstadoElemento`),
  KEY `idxCartuchos` (`idCartucho`),
  KEY `idxCalibreArmaDenuncias` (`id_nCalibre`),
  KEY `idxArmaConcurrencia` (`id_ConcurrenciaDelitos`),
  KEY `idxGTC` (`nGTC`),
  KEY `idxCalidadArma` (`id_nCalidadElemento`),
  KEY `idxMMA` (`nMMA`),
  KEY `idxPersonaRelacionada` (`id_nPersonaDelito`),
  KEY `idxPropietarioArma` (`nPropietarioArma`),
  CONSTRAINT `fk_ArmaDelito` FOREIGN KEY (`id_ConcurrenciaDelitos`) REFERENCES `tdenunciaspolicialesconcurrenciadelitos` (`id_ConcurrenciaDelitos`) ON UPDATE CASCADE,
  CONSTRAINT `fk_CalibreArma` FOREIGN KEY (`id_nCalibre`) REFERENCES `tcalibresarmas` (`id_nCalibre`) ON UPDATE CASCADE,
  CONSTRAINT `fk_CalidadArma` FOREIGN KEY (`id_nCalidadElemento`) REFERENCES `tcalidadeslegaleselementos` (`id_nCalidadElemento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_CartuchosArmaDenuncias` FOREIGN KEY (`idCartucho`) REFERENCES `ttipoarmascartuchos` (`id_TipoCartucho`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ElementoArmaDenuncias` FOREIGN KEY (`id_nElemento`) REFERENCES `telementos` (`id_nElementos`) ON UPDATE CASCADE,
  CONSTRAINT `fk_EstadoArma` FOREIGN KEY (`nEstadoElemento`) REFERENCES `testadoselementos` (`id_nEstadoElemento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_GTC` FOREIGN KEY (`nGTC`) REFERENCES `tgtc` (`nGTC`) ON UPDATE CASCADE,
  CONSTRAINT `fk_MMA` FOREIGN KEY (`nMMA`) REFERENCES `tmarcasmodelosarmas` (`nMMA`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PersonaRelacionArma` FOREIGN KEY (`id_nPersonaDelito`) REFERENCES `tpersonasdenunciaspoliciales` (`id_nPersonaDelito`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tarmasdenunciaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tarmasdenunciaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarmasdenunciaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tarmasmaterialescategorias
CREATE TABLE IF NOT EXISTS `tarmasmaterialescategorias` (
  `id_ArmasMaterialesCategorias` smallint(4) NOT NULL,
  `ArmasMaterialesCategorias` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ArmasMaterialesCategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tarmasmaterialescategorias: ~0 rows (approximately)
/*!40000 ALTER TABLE `tarmasmaterialescategorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarmasmaterialescategorias` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tarmaspoliciales
CREATE TABLE IF NOT EXISTS `tarmaspoliciales` (
  `nOrigen` int(11) DEFAULT NULL,
  `cNumero` varchar(50) NOT NULL,
  `fFecha_Alta` date DEFAULT NULL,
  `fFecha_Baja` date DEFAULT NULL,
  `nTipo` smallint(4) DEFAULT NULL,
  `nMarca` smallint(4) NOT NULL,
  `nModelo` smallint(4) DEFAULT NULL,
  `nCalibre` smallint(4) DEFAULT NULL,
  `nClasificacion` smallint(4) DEFAULT NULL,
  `FM` smallint(4) DEFAULT NULL,
  `KRD` smallint(4) DEFAULT NULL,
  `nCant_Municiones` smallint(4) DEFAULT NULL,
  `Hora de la Carga` datetime DEFAULT NULL,
  `F_de la Carga` date DEFAULT NULL,
  `tarmaspolicialescol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cNumero`,`nMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tarmaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tarmaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarmaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tauditoria
CREATE TABLE IF NOT EXISTS `tauditoria` (
  `Id` int(11) NOT NULL,
  `PP` varchar(45) DEFAULT NULL,
  `Usu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tauditoria: ~0 rows (approximately)
/*!40000 ALTER TABLE `tauditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tauditoria` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tbieneslegales
CREATE TABLE IF NOT EXISTS `tbieneslegales` (
  `id_nBienLegal` smallint(4) NOT NULL,
  `cBienLegal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nBienLegal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tbieneslegales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbieneslegales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbieneslegales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tbovinos
CREATE TABLE IF NOT EXISTS `tbovinos` (
  `id_Bovino` smallint(6) NOT NULL,
  `cBovino` varchar(50) DEFAULT NULL,
  `cDetalleBovino` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_Bovino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tbovinos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbovinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbovinos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcalibresarmas
CREATE TABLE IF NOT EXISTS `tcalibresarmas` (
  `id_nCalibre` smallint(4) NOT NULL,
  `cCalibre` varchar(45) NOT NULL DEFAULT '0',
  `id_nTamanoCalibre` smallint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_nCalibre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcalibresarmas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcalibresarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcalibresarmas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcalidaddepersonas
CREATE TABLE IF NOT EXISTS `tcalidaddepersonas` (
  `id_nCalidad` smallint(2) NOT NULL,
  `cCalidadDe` varchar(80) DEFAULT NULL,
  `SIP` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_nCalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcalidaddepersonas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcalidaddepersonas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcalidaddepersonas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcalidadeslegaleselementos
CREATE TABLE IF NOT EXISTS `tcalidadeslegaleselementos` (
  `id_nCalidadElemento` smallint(4) NOT NULL,
  `cCalidadElemento` varchar(100) DEFAULT NULL,
  `SIP` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_nCalidadElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcalidadeslegaleselementos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcalidadeslegaleselementos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcalidadeslegaleselementos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcalles
CREATE TABLE IF NOT EXISTS `tcalles` (
  `Id_nCalleMigra` smallint(8) DEFAULT NULL,
  `Id_nCalle` varchar(100) DEFAULT NULL,
  `nLocalidad` int(11) NOT NULL,
  `cNombreCalle` varchar(100) NOT NULL,
  `nTipoCalle` smallint(4) NOT NULL,
  `cNombreAbreviado` varchar(100) DEFAULT NULL,
  `cNombreCalleMigra` varchar(100) DEFAULT NULL,
  `cNombreCompleto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nLocalidad`,`cNombreCalle`,`nTipoCalle`),
  UNIQUE KEY `Id_nCalle_UNIQUE` (`Id_nCalle`),
  KEY `TipoCalle_idx` (`nTipoCalle`),
  KEY `fk_LocalidadCalle` (`nLocalidad`),
  CONSTRAINT `TipoCalle` FOREIGN KEY (`nTipoCalle`) REFERENCES `ttiposcalles` (`id_nTiposCalles`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_LocalidadCalle` FOREIGN KEY (`nLocalidad`) REFERENCES `tciudades` (`nCodCiudad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcalles: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcalles` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcapitulos
CREATE TABLE IF NOT EXISTS `tcapitulos` (
  `id_nCapitulo` smallint(4) NOT NULL,
  `cCapitulo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nCapitulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcapitulos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcapitulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcapitulos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcaprinos
CREATE TABLE IF NOT EXISTS `tcaprinos` (
  `id_Caprino` smallint(4) NOT NULL,
  `cCaprino` varchar(50) NOT NULL DEFAULT '',
  `cDetalleCaprino` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_Caprino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcaprinos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcaprinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcaprinos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcategoriaelementos
CREATE TABLE IF NOT EXISTS `tcategoriaelementos` (
  `id_nCategoriaElemento` smallint(4) NOT NULL,
  `cCategoriaElemento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nCategoriaElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcategoriaelementos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcategoriaelementos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcategoriaelementos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcategoriasdelitos
CREATE TABLE IF NOT EXISTS `tcategoriasdelitos` (
  `id_nCategoriaDelito` smallint(4) NOT NULL,
  `CatDel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nCategoriaDelito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcategoriasdelitos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcategoriasdelitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcategoriasdelitos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tciudades
CREATE TABLE IF NOT EXISTS `tciudades` (
  `nCodCiudad` int(11) NOT NULL,
  `nCodPro` smallint(4) NOT NULL,
  `nPais` smallint(4) NOT NULL,
  `id_nDepProv` smallint(4) DEFAULT NULL,
  `id_DistritoProvincial` smallint(4) DEFAULT NULL,
  `cCiudad` varchar(100) CHARACTER SET utf8 NOT NULL,
  `cCod_Pos` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `nCod_Uni_Reg` int(11) DEFAULT NULL,
  `nRegión` int(11) DEFAULT NULL,
  `nCod_CC` smallint(4) NOT NULL,
  `cLatitudCiudad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cLongitudCiudad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cCoordenadasCiudad` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nSuperficieCiudad` double DEFAULT 0 COMMENT 'Se mide en Km2',
  `nPoblacionCenso2010` int(11) DEFAULT NULL,
  PRIMARY KEY (`nCodCiudad`),
  KEY `CodPais` (`nPais`),
  KEY `CodProv` (`nCodPro`),
  KEY `nCod_CC` (`nCod_CC`),
  KEY `fk_DistritoProvincial` (`id_DistritoProvincial`),
  KEY `fk_CodDepProv` (`id_nDepProv`),
  CONSTRAINT `fk_CodDepProv` FOREIGN KEY (`id_nDepProv`) REFERENCES `tdepartamentosprovinciales` (`id_nDepProv`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CodPais` FOREIGN KEY (`nPais`) REFERENCES `tpaises` (`id_nPais`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DistritoProvincial` FOREIGN KEY (`id_DistritoProvincial`) REFERENCES `tdistritosprovinciales` (`id_DistritoProvincial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kf_CodProv` FOREIGN KEY (`nCodPro`) REFERENCES `tprovincias` (`nCodPro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Dumping data for table denunciasdb.tciudades: ~0 rows (approximately)
/*!40000 ALTER TABLE `tciudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tciudades` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tclasificacionesarmas
CREATE TABLE IF NOT EXISTS `tclasificacionesarmas` (
  `id_nClasificionArma` smallint(4) NOT NULL,
  `cClasificacionArma` varchar(100) DEFAULT NULL,
  `cAcronimoClaArma` varchar(3) DEFAULT NULL,
  `cLegal` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_nClasificionArma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tclasificacionesarmas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tclasificacionesarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclasificacionesarmas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tclasificaciontu_servicio
CREATE TABLE IF NOT EXISTS `tclasificaciontu_servicio` (
  `id_nClasificacionTU_Servicio` smallint(4) NOT NULL,
  `cClasificacionTU_Servicio` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`id_nClasificacionTU_Servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tclasificaciontu_servicio: ~0 rows (approximately)
/*!40000 ALTER TABLE `tclasificaciontu_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclasificaciontu_servicio` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tclimas
CREATE TABLE IF NOT EXISTS `tclimas` (
  `id_nClima` smallint(4) NOT NULL,
  `cClima` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nClima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tclimas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tclimas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclimas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcodigos
CREATE TABLE IF NOT EXISTS `tcodigos` (
  `id_nCod` smallint(4) NOT NULL,
  `cCodigos` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcodigos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcodigos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcodigos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcolores
CREATE TABLE IF NOT EXISTS `tcolores` (
  `id_Color` smallint(4) NOT NULL DEFAULT 0,
  `cColor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tcolores: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcolores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcolores` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcovid19
CREATE TABLE IF NOT EXISTS `tcovid19` (
  `id_nCovid19` int(11) NOT NULL AUTO_INCREMENT,
  `id_nDepProv` smallint(4) NOT NULL DEFAULT 0,
  `dFecInicial` date NOT NULL DEFAULT '0000-00-00',
  `tHora` time NOT NULL DEFAULT '00:00:00',
  `dFechaFinal` date NOT NULL DEFAULT '0000-00-00',
  `nCodRegional` smallint(4) NOT NULL DEFAULT 0,
  `nAccion` smallint(2) NOT NULL DEFAULT 0,
  `nCanitdad` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_nDepProv`,`dFecInicial`,`tHora`,`dFechaFinal`,`nCodRegional`,`nAccion`),
  UNIQUE KEY `idxIdCovid` (`id_nCovid19`),
  KEY `idxAccion` (`nAccion`),
  KEY `idxDepProv` (`id_nDepProv`),
  KEY `idxUD` (`nCodRegional`),
  CONSTRAINT `fk_Accion` FOREIGN KEY (`nAccion`) REFERENCES `tacciones` (`nAccion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_DepProvCovid` FOREIGN KEY (`id_nDepProv`) REFERENCES `tdepartamentosprovinciales` (`id_nDepProv`) ON UPDATE CASCADE,
  CONSTRAINT `fk_RegPolCovid` FOREIGN KEY (`nCodRegional`) REFERENCES `tregionales` (`nCodRegional`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13087 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tcovid19: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcovid19` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcovid19` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tcuadriculaspoliciales
CREATE TABLE IF NOT EXISTS `tcuadriculaspoliciales` (
  `id_Cuadricula` smallint(4) NOT NULL,
  `nCodCiudad` int(11) NOT NULL,
  `nCuadricula` smallint(4) NOT NULL,
  `id_Distrito` smallint(4) NOT NULL,
  `id_nInspeccion` smallint(4) NOT NULL,
  `cCuadricula` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `bCuadriculaNoPatrullable` tinyint(4) DEFAULT NULL,
  `nCod_CC` smallint(4) NOT NULL,
  `nOrdenCuadricula` smallint(4) NOT NULL,
  PRIMARY KEY (`id_Cuadricula`),
  KEY `fk_DistritoMunicipal_idx` (`id_Distrito`),
  KEY `fk_CiudadesCuadriculas_idx` (`nCodCiudad`),
  KEY `fk_CiudadCuadricula_idx` (`nCodCiudad`),
  KEY `fk_InspeccionPolicial_idx` (`id_nInspeccion`),
  KEY `nCod_CC` (`nCod_CC`),
  CONSTRAINT `fk_CiuCuaPol` FOREIGN KEY (`nCodCiudad`) REFERENCES `tciudades` (`nCodCiudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DistritoMunicipal` FOREIGN KEY (`id_Distrito`) REFERENCES `tdistritosmunicipales` (`id_nDistritoMunicipal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_InspeccionPolicial` FOREIGN KEY (`id_nInspeccion`) REFERENCES `tinspecciones` (`id_nInspeccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Dumping data for table denunciasdb.tcuadriculaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tcuadriculaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcuadriculaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdelitoscontra
CREATE TABLE IF NOT EXISTS `tdelitoscontra` (
  `id_nContra` smallint(4) NOT NULL,
  `cDelitos_Contra` varchar(150) DEFAULT NULL,
  `cAbrevContra` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nContra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tdelitoscontra: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdelitoscontra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdelitoscontra` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdenunciaspoliciales
CREATE TABLE IF NOT EXISTS `tdenunciaspoliciales` (
  `id_Comunicacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_OrigenDatos` smallint(4) NOT NULL DEFAULT 0,
  `idTipoActuaciones` smallint(4) NOT NULL DEFAULT 0,
  `nNroPP` varchar(50) NOT NULL DEFAULT '0',
  `id_DepPolicial` smallint(8) NOT NULL DEFAULT 1 COMMENT 'Dependencia Interviniente',
  `id_DepPolicial2` smallint(8) NOT NULL DEFAULT 1 COMMENT 'Dependencia Remitente',
  `id_nUsuarioCarga` smallint(4) NOT NULL DEFAULT -3,
  `fHoraCarga` datetime DEFAULT NULL,
  `fFechaDenuncia` date DEFAULT NULL,
  `fHoraDenuncia` time DEFAULT NULL,
  `nSuscribeDenuncia` double DEFAULT NULL,
  `nFuncionSuscribeDenuncia` int(4) NOT NULL DEFAULT 0,
  `id_DepJudicial` smallint(4) NOT NULL DEFAULT 0,
  `cExponeDenunciante` mediumtext DEFAULT NULL,
  `cuij_mpa` varchar(45) DEFAULT NULL,
  `enviada_mpa` varchar(45) DEFAULT NULL,
  `cPdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nNroPP`,`id_DepPolicial`,`idTipoActuaciones`) USING BTREE,
  UNIQUE KEY `id_Comunicacion` (`id_Comunicacion`),
  KEY `fk_FunPol` (`nFuncionSuscribeDenuncia`),
  KEY `fk_TipoAct_idx` (`idTipoActuaciones`),
  KEY `fk_OrigenDato_idx` (`id_OrigenDatos`),
  KEY `idxDepJud` (`id_DepJudicial`),
  KEY `idxDepPolInterviniente` (`id_DepPolicial`) USING BTREE,
  KEY `idxDepPolRemitente` (`id_DepPolicial2`),
  CONSTRAINT `fk_DepJud` FOREIGN KEY (`id_DepJudicial`) REFERENCES `tjudiciales` (`id_DepJudicial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DepPol` FOREIGN KEY (`id_DepPolicial`) REFERENCES `tdependenciasud` (`id_DepPolicial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DepPolRemitente` FOREIGN KEY (`id_DepPolicial2`) REFERENCES `tdependenciasud` (`id_DepPolicial`) ON UPDATE CASCADE,
  CONSTRAINT `fk_FunPol` FOREIGN KEY (`nFuncionSuscribeDenuncia`) REFERENCES `tfuncionespoliciales` (`nCod_fun`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OrigenDato` FOREIGN KEY (`id_OrigenDatos`) REFERENCES `torigenesdatos` (`id_OrigenDatos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoAct` FOREIGN KEY (`idTipoActuaciones`) REFERENCES `ttiposactuaciones` (`idTipoActuaciones`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=911124581 DEFAULT CHARSET=utf8 MAX_ROWS=1000000;

-- Dumping data for table denunciasdb.tdenunciaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdenunciaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdenunciaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdenunciaspolicialesconcurrenciadelitos
CREATE TABLE IF NOT EXISTS `tdenunciaspolicialesconcurrenciadelitos` (
  `id_ConcurrenciaDelitos` int(11) NOT NULL AUTO_INCREMENT,
  `id_ConcurrenciaLugar` int(11) NOT NULL DEFAULT 0,
  `id_HOSoMo` double(12,0) NOT NULL DEFAULT 0,
  `id_nHechoAgravante` int(11) unsigned zerofill NOT NULL COMMENT 'Es lo que llama la gente de Análisis Subdelitos',
  `nSubCaratulaHechoDenunciado` smallint(4) NOT NULL DEFAULT 0 COMMENT 'Es una subdefinición de la incidencia',
  `id_nCategoriaDelito` smallint(4) NOT NULL DEFAULT 2,
  `bHechoGradoTentativa` tinyint(4) NOT NULL DEFAULT 0,
  `bHechoCalificado` tinyint(4) NOT NULL DEFAULT 0,
  `nModoFuga` smallint(4) NOT NULL DEFAULT 0,
  `id_nTipoAT` smallint(4) NOT NULL DEFAULT 0,
  `id_nEscalaGravedad` smallint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_ConcurrenciaLugar`,`id_HOSoMo`),
  UNIQUE KEY `idxConcurrenciaDelitos` (`id_ConcurrenciaDelitos`),
  KEY `idxHOSoMo` (`id_HOSoMo`),
  KEY `idxHechoAgravante` (`id_nHechoAgravante`),
  KEY `idxCategoriaDelito` (`id_nCategoriaDelito`),
  KEY `idxFuga` (`nModoFuga`),
  KEY `fk_TipoAT` (`id_nTipoAT`),
  KEY `fk_EscalaGravedad` (`id_nEscalaGravedad`),
  CONSTRAINT `fk_CategoriaDelito` FOREIGN KEY (`id_nCategoriaDelito`) REFERENCES `tcategoriasdelitos` (`id_nCategoriaDelito`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ConcurrenciaLugar` FOREIGN KEY (`id_ConcurrenciaLugar`) REFERENCES `tdenunciaspolicialesconcurrencialugares` (`id_ConcurrenciaLugar`) ON UPDATE CASCADE,
  CONSTRAINT `fk_EscalaGravedad` FOREIGN KEY (`id_nEscalaGravedad`) REFERENCES `tescalasgravedad` (`id_nEscalaGravedad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Fuga` FOREIGN KEY (`nModoFuga`) REFERENCES `tmodosfugas` (`id_ModoFuga`) ON UPDATE CASCADE,
  CONSTRAINT `fk_HOSoMo` FOREIGN KEY (`id_HOSoMo`) REFERENCES `tmodusdelitosobjetivos` (`id_HOSoMo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_HechoAgravante` FOREIGN KEY (`id_nHechoAgravante`) REFERENCES `tagravantesdelitos` (`id_nHechoAgravante`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoAT` FOREIGN KEY (`id_nTipoAT`) REFERENCES `ttiposat` (`id_nTipoAT`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7661 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tdenunciaspolicialesconcurrenciadelitos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdenunciaspolicialesconcurrenciadelitos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdenunciaspolicialesconcurrenciadelitos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdenunciaspolicialesconcurrencialugares
CREATE TABLE IF NOT EXISTS `tdenunciaspolicialesconcurrencialugares` (
  `id_ConcurrenciaLugar` int(11) NOT NULL AUTO_INCREMENT,
  `id_Comunicacion` int(11) NOT NULL DEFAULT 0,
  `nLocalidadHecho` int(11) NOT NULL DEFAULT 796,
  `fFechaLugar` date NOT NULL COMMENT 'Si existe un único lugar en el hecho ocurrido entonces coincide con la fecha del hecho.',
  `fHoraLugar` time NOT NULL COMMENT 'Si existe un único lugar en el hecho ocurrido entonces coincide con la Hora del hecho.',
  `nRangoHorarioHecho` smallint(4) NOT NULL DEFAULT 0 COMMENT 'Es un campo calculado que sale del campo HoraLugar',
  `cLugarConNombre` varchar(80) NOT NULL DEFAULT 'S/N',
  `cPuertoViaNauticaIngIsla` varchar(80) DEFAULT 'S/N',
  `cDependenciaPolicialCercana` varchar(80) NOT NULL DEFAULT 'S/N',
  `cCallePrincipalHecho` varchar(100) NOT NULL DEFAULT '796S/C0',
  `cAlturaCallePrincipalHecho` varchar(10) NOT NULL DEFAULT '0',
  `id_OrientacionCardinal` smallint(4) NOT NULL DEFAULT 0,
  `cInterseccionCallePrincipalHecho` varchar(100) NOT NULL DEFAULT '796S/C0',
  `cInterseccionCallePrincipalHecho2` varchar(100) NOT NULL DEFAULT '796S/C0',
  `nZona` smallint(4) NOT NULL DEFAULT 1,
  `id_Cuadricula` smallint(4) NOT NULL DEFAULT 0,
  `cReferenciaLugarHecho` mediumint(9) DEFAULT NULL,
  `id_nTipoLugarHecho` smallint(4) NOT NULL DEFAULT 0,
  `bLugarConSeñalCelular` tinyint(4) DEFAULT 0,
  `X` varchar(100) DEFAULT '0',
  `Y` varchar(100) DEFAULT '0',
  `cLongitud` varchar(100) DEFAULT '0',
  `cLatitud` varchar(100) DEFAULT '0',
  `cSeccionProv` varchar(5) NOT NULL DEFAULT '0',
  `cManzanaProv` varchar(5) NOT NULL DEFAULT '0',
  `nParcerlaProv` smallint(4) NOT NULL DEFAULT 0,
  `bSemaforo` tinyint(4) DEFAULT 0,
  `bCamara` tinyint(4) DEFAULT 0,
  `id_nClima` smallint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_Comunicacion`,`nLocalidadHecho`,`fFechaLugar`,`fHoraLugar`,`cCallePrincipalHecho`,`cAlturaCallePrincipalHecho`,`cLugarConNombre`,`id_nClima`),
  UNIQUE KEY `idxConcurrenciaLugar` (`id_ConcurrenciaLugar`),
  KEY `idxComunicacion` (`id_Comunicacion`),
  KEY `idxTipoLugarHecho` (`id_nTipoLugarHecho`),
  KEY `idxLocalidadHecho` (`nLocalidadHecho`),
  KEY `idxRangoHorario` (`nRangoHorarioHecho`),
  KEY `idxOrientacionCardinal` (`id_OrientacionCardinal`),
  KEY `idxCalle1Lugar` (`cCallePrincipalHecho`),
  KEY `idxCalle2Lugar` (`cInterseccionCallePrincipalHecho`),
  KEY `idxCalle3Lugar` (`cInterseccionCallePrincipalHecho2`),
  KEY `idxZonaLugar` (`nZona`),
  KEY `idxCuadricula` (`id_Cuadricula`),
  KEY `idxTipoLugar` (`id_nTipoLugarHecho`),
  KEY `idxClima` (`id_nClima`),
  CONSTRAINT `fk_Calle1Hecho` FOREIGN KEY (`cCallePrincipalHecho`) REFERENCES `tcalles` (`Id_nCalle`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Calle2Hecho` FOREIGN KEY (`cInterseccionCallePrincipalHecho`) REFERENCES `tcalles` (`Id_nCalle`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Calle3Hecho` FOREIGN KEY (`cInterseccionCallePrincipalHecho2`) REFERENCES `tcalles` (`Id_nCalle`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Cardinales` FOREIGN KEY (`id_OrientacionCardinal`) REFERENCES `torientacionescardinales` (`id_OrientacionCardinal`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Clima` FOREIGN KEY (`id_nClima`) REFERENCES `tclimas` (`id_nClima`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Comunicacion` FOREIGN KEY (`id_Comunicacion`) REFERENCES `tdenunciaspoliciales` (`id_Comunicacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Cuadricula` FOREIGN KEY (`id_Cuadricula`) REFERENCES `tcuadriculaspoliciales` (`id_Cuadricula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_LugarTipo` FOREIGN KEY (`id_nTipoLugarHecho`) REFERENCES `ttipolugarhecho` (`id_nTipoLugarHecho`) ON UPDATE CASCADE,
  CONSTRAINT `fk_RangoHorario` FOREIGN KEY (`nRangoHorarioHecho`) REFERENCES `trangoshorarios` (`id_nRangoHorario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoLugarHecho` FOREIGN KEY (`id_nTipoLugarHecho`) REFERENCES `ttipolugarhecho` (`id_nTipoLugarHecho`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ZonaHecho` FOREIGN KEY (`nZona`) REFERENCES `tzonas` (`id_Zona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36113 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tdenunciaspolicialesconcurrencialugares: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdenunciaspolicialesconcurrencialugares` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdenunciaspolicialesconcurrencialugares` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdepartamentosprovinciales
CREATE TABLE IF NOT EXISTS `tdepartamentosprovinciales` (
  `id_nDepProv` smallint(4) NOT NULL,
  `id_nDepProvRupp` smallint(4) NOT NULL,
  `id_nPais` smallint(4) NOT NULL,
  `nCodPro` smallint(4) NOT NULL,
  `cDepartamento` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cNombrePoligono` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cCoordenadasPoligono` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nPoblacion2010` int(11) DEFAULT NULL,
  `nCapitalDepartamento` int(11) DEFAULT NULL,
  `nSuperficieDepartamento` double DEFAULT NULL,
  `cDepartamentoNombreKML` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_nDepProv`),
  UNIQUE KEY `Índice 2` (`cDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Dumping data for table denunciasdb.tdepartamentosprovinciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdepartamentosprovinciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdepartamentosprovinciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdependencias
CREATE TABLE IF NOT EXISTS `tdependencias` (
  `nCodDep` smallint(4) NOT NULL,
  `nOrden` smallint(4) NOT NULL,
  `cDependencia` varchar(150) NOT NULL,
  `cDepCorto` varchar(100) DEFAULT NULL,
  `nCodDepUr2` smallint(4) DEFAULT NULL,
  `bListo` tinyint(4) DEFAULT NULL,
  `bJuris` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`nCodDep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tdependencias: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdependencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdependencias` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdependenciasud
CREATE TABLE IF NOT EXISTS `tdependenciasud` (
  `id_DepPolicial` smallint(8) NOT NULL AUTO_INCREMENT,
  `nCodCiu` int(11) NOT NULL,
  `nCodUd` smallint(4) NOT NULL,
  `nCodSud` smallint(4) NOT NULL DEFAULT 0,
  `nCodDep` smallint(4) NOT NULL,
  `nCodInsp` smallint(4) DEFAULT NULL,
  `cCallePrincipalDep` varchar(255) DEFAULT NULL,
  `cAlturaCallePrincipalDep` varchar(10) DEFAULT NULL,
  `cInterseccionCallePrincipalDep` varchar(255) NOT NULL,
  `x` varchar(100) DEFAULT NULL,
  `Y` varchar(100) DEFAULT NULL,
  `cLongitud` varchar(100) DEFAULT NULL,
  `cLatitud` varchar(100) DEFAULT NULL,
  `cObs_Domicilio` varchar(100) DEFAULT NULL,
  `nDistritoMunicipalDep` smallint(4) DEFAULT NULL,
  `cPrefijoTel` varchar(15) DEFAULT NULL,
  `cTel/Cel` varchar(80) DEFAULT NULL,
  `cCentrex` varchar(15) DEFAULT NULL,
  `cEmail` varchar(100) DEFAULT NULL,
  `NI` double DEFAULT NULL,
  `nCiuUdDep` int(11) DEFAULT NULL,
  PRIMARY KEY (`nCodDep`,`nCodUd`,`nCodCiu`,`nCodSud`),
  UNIQUE KEY `idxDepPol` (`id_DepPolicial`),
  KEY `CodUd_idx` (`nCodUd`),
  KEY `CodInsp_idx` (`nCodInsp`),
  KEY `CodCiu_idx` (`nCodCiu`),
  KEY `fk_DepDistrito_idx` (`nDistritoMunicipalDep`),
  KEY `fk_CallePri_idx` (`cCallePrincipalDep`),
  KEY `fk_CalleInter_idx` (`cInterseccionCallePrincipalDep`),
  KEY `fk_CodSubUd` (`nCodSud`),
  CONSTRAINT `CodCiu` FOREIGN KEY (`nCodCiu`) REFERENCES `tciudades` (`nCodCiudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CodDep` FOREIGN KEY (`nCodDep`) REFERENCES `tdependencias` (`nCodDep`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CodInsp` FOREIGN KEY (`nCodInsp`) REFERENCES `tinspecciones` (`id_nInspeccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CodUd` FOREIGN KEY (`nCodUd`) REFERENCES `tregionales` (`nCodRegional`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CallePrincipal` FOREIGN KEY (`cCallePrincipalDep`) REFERENCES `tcalles` (`Id_nCalle`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CodSubUd` FOREIGN KEY (`nCodSud`) REFERENCES `tsubunidades` (`nCodSud`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DepDistrito` FOREIGN KEY (`nDistritoMunicipalDep`) REFERENCES `tdistritosmunicipales` (`id_nDistritoMunicipal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tdependenciasud: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdependenciasud` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdependenciasud` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdistritosmunicipales
CREATE TABLE IF NOT EXISTS `tdistritosmunicipales` (
  `id_nDistritoMunicipal` smallint(4) NOT NULL,
  `cDistritoMunicipal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nDistritoMunicipal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tdistritosmunicipales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdistritosmunicipales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdistritosmunicipales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tdistritosprovinciales
CREATE TABLE IF NOT EXISTS `tdistritosprovinciales` (
  `id_DistritoProvincial` smallint(4) NOT NULL,
  `cDistritoPrivincial` varchar(100) NOT NULL DEFAULT '',
  `id_nDepProv` smallint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_DistritoProvincial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tdistritosprovinciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tdistritosprovinciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdistritosprovinciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.telementos
CREATE TABLE IF NOT EXISTS `telementos` (
  `id_nElementos` smallint(4) NOT NULL,
  `id_nCategoriaElementos` smallint(4) NOT NULL,
  `id_nBienLegal` smallint(4) NOT NULL,
  `cElemento` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_nElementos`),
  KEY `CategoriaElemento_idx` (`id_nCategoriaElementos`),
  KEY `BienLegal_idx` (`id_nBienLegal`),
  CONSTRAINT `BienLegal` FOREIGN KEY (`id_nBienLegal`) REFERENCES `tbieneslegales` (`id_nBienLegal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CategoriaElemento` FOREIGN KEY (`id_nCategoriaElementos`) REFERENCES `tcategoriaelementos` (`id_nCategoriaElemento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.telementos: ~0 rows (approximately)
/*!40000 ALTER TABLE `telementos` DISABLE KEYS */;
/*!40000 ALTER TABLE `telementos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.telementosdenunciaspoliciales
CREATE TABLE IF NOT EXISTS `telementosdenunciaspoliciales` (
  `id_nElementoDelito` int(11) NOT NULL AUTO_INCREMENT,
  `id_ConcurrenciaDelitos` int(11) NOT NULL DEFAULT 0,
  `id_nCalidadLegalElemento` smallint(4) NOT NULL DEFAULT 0,
  `id_nElementos` smallint(4) NOT NULL DEFAULT 0,
  `id_nPersonaDelito` int(11) NOT NULL DEFAULT 0,
  `nPropietarioElemento` double(22,0) NOT NULL,
  `nCantidadElemento` smallint(4) NOT NULL DEFAULT 0,
  `nMonedas` smallint(4) NOT NULL DEFAULT 0,
  `cEntidadBancaria` varchar(80) NOT NULL DEFAULT '0',
  `nEstadoElemento` smallint(4) NOT NULL DEFAULT 0,
  `cNumeroSerie` varchar(80) NOT NULL DEFAULT '0',
  `cMarcaElemento` varchar(80) NOT NULL DEFAULT '0',
  `cModeloElemento` varchar(80) NOT NULL DEFAULT '0',
  `cColorElemento` varchar(80) NOT NULL DEFAULT '0',
  `cFactorFormaElemento` varchar(80) NOT NULL DEFAULT '0',
  `OtraCaracteristicaElemento` varchar(80) NOT NULL DEFAULT '0',
  `cNuevoDatoElemento` varchar(45) DEFAULT NULL,
  `cImei` varchar(50) DEFAULT NULL,
  `cNroCel` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ConcurrenciaDelitos`,`id_nCalidadLegalElemento`,`id_nElementos`),
  UNIQUE KEY `idxElementoDelito` (`id_nElementoDelito`),
  KEY `idxConcurrenciaDelito` (`id_ConcurrenciaDelitos`),
  KEY `idxRelacionPersonaElemento` (`id_nPersonaDelito`),
  KEY `idx_CalidadElemento` (`id_nCalidadLegalElemento`) USING BTREE,
  KEY `idx_Elemento` (`id_nElementos`) USING BTREE,
  KEY `idx_Moneda` (`nMonedas`) USING BTREE,
  KEY `idx_EstadoElemento` (`nEstadoElemento`) USING BTREE,
  KEY `idxPropietarioElemento` (`nPropietarioElemento`),
  CONSTRAINT `fk_CalidadElemento` FOREIGN KEY (`id_nCalidadLegalElemento`) REFERENCES `tcalidadeslegaleselementos` (`id_nCalidadElemento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ConcurrenciaDelito` FOREIGN KEY (`id_ConcurrenciaDelitos`) REFERENCES `tdenunciaspolicialesconcurrenciadelitos` (`id_ConcurrenciaDelitos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Elemento` FOREIGN KEY (`id_nElementos`) REFERENCES `telementos` (`id_nElementos`) ON UPDATE CASCADE,
  CONSTRAINT `fk_EstadoElemento` FOREIGN KEY (`nEstadoElemento`) REFERENCES `testadoselementos` (`id_nEstadoElemento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Moneda` FOREIGN KEY (`nMonedas`) REFERENCES `tmonedas` (`nISO4217`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PropietarioPersona` FOREIGN KEY (`nPropietarioElemento`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_RelacionPersonaElemento` FOREIGN KEY (`id_nPersonaDelito`) REFERENCES `tpersonasdenunciaspoliciales` (`id_nPersonaDelito`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.telementosdenunciaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `telementosdenunciaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `telementosdenunciaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tentornolugarhecho
CREATE TABLE IF NOT EXISTS `tentornolugarhecho` (
  `id_nEntornoLugarHecho` smallint(4) NOT NULL,
  `cEntornoLugarHecho` varchar(90) DEFAULT NULL,
  `Detalle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nEntornoLugarHecho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tentornolugarhecho: ~0 rows (approximately)
/*!40000 ALTER TABLE `tentornolugarhecho` DISABLE KEYS */;
/*!40000 ALTER TABLE `tentornolugarhecho` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tequinos
CREATE TABLE IF NOT EXISTS `tequinos` (
  `id_Equino` smallint(4) NOT NULL,
  `cEquino` varchar(50) NOT NULL DEFAULT '',
  `cDetalleEquino` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_Equino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tequinos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tequinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tequinos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tescalasgravedad
CREATE TABLE IF NOT EXISTS `tescalasgravedad` (
  `id_nEscalaGravedad` smallint(4) NOT NULL,
  `cEscalaGravedad` varchar(45) DEFAULT NULL,
  `cDescripcionEscalaGravedad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nEscalaGravedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tescalasgravedad: ~0 rows (approximately)
/*!40000 ALTER TABLE `tescalasgravedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tescalasgravedad` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tespeciesganados
CREATE TABLE IF NOT EXISTS `tespeciesganados` (
  `id_EspecieGanado` smallint(4) NOT NULL COMMENT 'Especie es sinónimo de CATEGORÍA',
  `cEspecieGanado` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_EspecieGanado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tespeciesganados: ~0 rows (approximately)
/*!40000 ALTER TABLE `tespeciesganados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tespeciesganados` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tespeciesgeneralesganados
CREATE TABLE IF NOT EXISTS `tespeciesgeneralesganados` (
  `id_EspecieGralGanado` int(11) NOT NULL DEFAULT 0,
  `id_EspecieGanado` smallint(4) NOT NULL,
  `id_SubespecieGanado` smallint(4) NOT NULL,
  `id_GeneroGanado` smallint(4) NOT NULL,
  `cEspecieGralGanado` varchar(80) NOT NULL DEFAULT '',
  `cDetalleGanado` varchar(100) DEFAULT '',
  PRIMARY KEY (`id_EspecieGralGanado`),
  KEY `fk_EspecieGan` (`id_EspecieGanado`),
  KEY `fk_Subespecie` (`id_SubespecieGanado`),
  KEY `fk_GeneroGanado` (`id_GeneroGanado`),
  CONSTRAINT `fk_EspecieGan` FOREIGN KEY (`id_EspecieGanado`) REFERENCES `tespeciesganados` (`id_EspecieGanado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_GeneroGanado` FOREIGN KEY (`id_GeneroGanado`) REFERENCES `tgeneroganado` (`id_GeneroGanado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Subespecie` FOREIGN KEY (`id_SubespecieGanado`) REFERENCES `tsubespeciesganados` (`id_SubespecieGanado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tespeciesgeneralesganados: ~0 rows (approximately)
/*!40000 ALTER TABLE `tespeciesgeneralesganados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tespeciesgeneralesganados` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.testadosciviles
CREATE TABLE IF NOT EXISTS `testadosciviles` (
  `nEstadoCivl` smallint(2) NOT NULL,
  `cEstadoCivil` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`nEstadoCivl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.testadosciviles: ~0 rows (approximately)
/*!40000 ALTER TABLE `testadosciviles` DISABLE KEYS */;
/*!40000 ALTER TABLE `testadosciviles` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.testadoselementos
CREATE TABLE IF NOT EXISTS `testadoselementos` (
  `id_nEstadoElemento` smallint(4) NOT NULL,
  `cEstadoElemento` varchar(45) DEFAULT NULL,
  `bAuto` tinyint(4) DEFAULT NULL,
  `bArma` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_nEstadoElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.testadoselementos: ~0 rows (approximately)
/*!40000 ALTER TABLE `testadoselementos` DISABLE KEYS */;
/*!40000 ALTER TABLE `testadoselementos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.texplotacionesproductivas
CREATE TABLE IF NOT EXISTS `texplotacionesproductivas` (
  `id_nExplotacionProductiva` smallint(4) NOT NULL DEFAULT 1,
  `cExplotacionProductiva` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nExplotacionProductiva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.texplotacionesproductivas: ~0 rows (approximately)
/*!40000 ALTER TABLE `texplotacionesproductivas` DISABLE KEYS */;
/*!40000 ALTER TABLE `texplotacionesproductivas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tfiscales
CREATE TABLE IF NOT EXISTS `tfiscales` (
  `Id_nFiscal` smallint(4) NOT NULL,
  `cApeNomFiscal` varchar(80) DEFAULT NULL,
  `cE-mail` varchar(80) DEFAULT NULL,
  `cObsFical` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id_nFiscal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tfiscales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tfiscales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfiscales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tformascomunicaciones
CREATE TABLE IF NOT EXISTS `tformascomunicaciones` (
  `id_FormaComunicacion` smallint(4) NOT NULL,
  `cComunicacionPersonal` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`id_FormaComunicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tformascomunicaciones: ~0 rows (approximately)
/*!40000 ALTER TABLE `tformascomunicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tformascomunicaciones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tfuerzasseguridad
CREATE TABLE IF NOT EXISTS `tfuerzasseguridad` (
  `id_nFuerzaSeguridad` smallint(4) NOT NULL,
  `cFuerzaSeguridad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nFuerzaSeguridad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tfuerzasseguridad: ~0 rows (approximately)
/*!40000 ALTER TABLE `tfuerzasseguridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfuerzasseguridad` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tfuncionespoliciales
CREATE TABLE IF NOT EXISTS `tfuncionespoliciales` (
  `nCod_fun` int(11) NOT NULL,
  `cFuncion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nCod_fun`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tfuncionespoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tfuncionespoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tfuncionespoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tganadosdenunciaspoliciales
CREATE TABLE IF NOT EXISTS `tganadosdenunciaspoliciales` (
  `id_GanadoDenuncia` int(11) NOT NULL AUTO_INCREMENT,
  `id_ConcurrenciaDelitos` int(11) NOT NULL DEFAULT 0 COMMENT 'Es el id de la tabla ConcurrenciaDelitos',
  `id_nPersonaDelito` int(11) NOT NULL DEFAULT 0,
  `id_EspecieGralGanado` int(11) NOT NULL DEFAULT 0,
  `cRazaGanado` varbinary(50) NOT NULL DEFAULT '',
  `id_nSexo` smallint(4) NOT NULL DEFAULT 0 COMMENT 'Sexo del animal es Macho 1 o Hembra 2. Sino se informa es Desconocido 0.',
  `id_nElementos` smallint(4) NOT NULL DEFAULT 0,
  `id_ActividadProductiva` smallint(4) NOT NULL DEFAULT 1,
  `id_nExplotacionProductiva` smallint(4) NOT NULL DEFAULT 1,
  `cKgGanado` decimal(10,0) NOT NULL DEFAULT 0,
  `cVacunacionAproxGanado` varchar(50) NOT NULL DEFAULT '0',
  `nPropietarioGanado` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_nElementos`,`cRazaGanado`,`id_EspecieGralGanado`,`id_ActividadProductiva`,`id_nExplotacionProductiva`,`id_nSexo`,`id_ConcurrenciaDelitos`,`id_nPersonaDelito`) USING BTREE,
  UNIQUE KEY `idxGanadoDenunciado` (`id_GanadoDenuncia`),
  KEY `idxElementoAnimal` (`id_nElementos`),
  KEY `idxGandoDelito` (`id_ConcurrenciaDelitos`),
  KEY `idxEspecieGralGanado` (`id_EspecieGralGanado`),
  KEY `idxActividadProductiva` (`id_ActividadProductiva`),
  KEY `idxExplotacionProductiva` (`id_nExplotacionProductiva`),
  KEY `idxSexo` (`id_nSexo`),
  KEY `idxPropietarioGanado` (`nPropietarioGanado`),
  CONSTRAINT `fk_ActividadProductiva` FOREIGN KEY (`id_ActividadProductiva`) REFERENCES `tactividadesproductivas` (`id_ActividadProductiva`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ElementoAnimal` FOREIGN KEY (`id_nElementos`) REFERENCES `telementos` (`id_nElementos`) ON UPDATE CASCADE,
  CONSTRAINT `fk_EspecieGeneralGanado` FOREIGN KEY (`id_EspecieGralGanado`) REFERENCES `tespeciesgeneralesganados` (`id_EspecieGralGanado`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ExplotacionProductiva` FOREIGN KEY (`id_nExplotacionProductiva`) REFERENCES `texplotacionesproductivas` (`id_nExplotacionProductiva`) ON UPDATE CASCADE,
  CONSTRAINT `fk_GandoDelito` FOREIGN KEY (`id_ConcurrenciaDelitos`) REFERENCES `tdenunciaspolicialesconcurrenciadelitos` (`id_ConcurrenciaDelitos`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PropietarioGanado` FOREIGN KEY (`nPropietarioGanado`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Sexo` FOREIGN KEY (`id_nSexo`) REFERENCES `tsexo` (`id_nSexo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tganadosdenunciaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tganadosdenunciaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tganadosdenunciaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tgeneroganado
CREATE TABLE IF NOT EXISTS `tgeneroganado` (
  `id_GeneroGanado` smallint(4) NOT NULL,
  `cGeneroGanado` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_GeneroGanado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tgeneroganado: ~0 rows (approximately)
/*!40000 ALTER TABLE `tgeneroganado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgeneroganado` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tgenerosarmas
CREATE TABLE IF NOT EXISTS `tgenerosarmas` (
  `id_nGeneroArma` smallint(4) NOT NULL,
  `cGeneroArma` varchar(100) DEFAULT NULL,
  `cAcronimoGenArma` varchar(3) DEFAULT NULL,
  `cLegal` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_nGeneroArma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tgenerosarmas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tgenerosarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgenerosarmas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tgenerospersonas
CREATE TABLE IF NOT EXISTS `tgenerospersonas` (
  `id_nGeneroPersona` smallint(4) NOT NULL,
  `cGeneroPersona` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nGeneroPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tgenerospersonas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tgenerospersonas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgenerospersonas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tgtc
CREATE TABLE IF NOT EXISTS `tgtc` (
  `nGTC` double NOT NULL COMMENT 'Se forma así: Genero & "0" & TipoArma & "0" & Clasificacion',
  `id_nGenero` smallint(4) NOT NULL,
  `id_nTipo` smallint(4) NOT NULL,
  `id_nClasificacion` smallint(4) NOT NULL,
  `cGTC` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id_nGenero`,`id_nTipo`,`id_nClasificacion`),
  UNIQUE KEY `nGTC_UNIQUE` (`nGTC`),
  KEY `fk_TipoArma_idx` (`id_nTipo`),
  KEY `fk_ClasificacionArma_idx` (`id_nClasificacion`),
  CONSTRAINT `fk_ClasificacionArma` FOREIGN KEY (`id_nClasificacion`) REFERENCES `tclasificacionesarmas` (`id_nClasificionArma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_GeneroArma` FOREIGN KEY (`id_nGenero`) REFERENCES `tgenerosarmas` (`id_nGeneroArma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoArma` FOREIGN KEY (`id_nTipo`) REFERENCES `ttipoarmas` (`id_nTipoArma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tgtc: ~0 rows (approximately)
/*!40000 ALTER TABLE `tgtc` DISABLE KEYS */;
/*!40000 ALTER TABLE `tgtc` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.thechos
CREATE TABLE IF NOT EXISTS `thechos` (
  `id_nHecho` smallint(4) NOT NULL,
  `nContra` smallint(4) NOT NULL,
  `cHecho` varchar(150) DEFAULT NULL,
  `nCodigo` smallint(4) NOT NULL,
  `nLibro` smallint(4) NOT NULL,
  `nTitulo` smallint(4) NOT NULL,
  `nCapitulo` smallint(4) NOT NULL,
  `cArticulos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nHecho`),
  UNIQUE KEY `id_nHecho_UNIQUE` (`id_nHecho`),
  KEY `Contra_idx` (`nContra`),
  KEY `Codigo_idx` (`nCodigo`),
  KEY `Titulo_idx` (`nTitulo`),
  KEY `Capitulo_idx` (`nCapitulo`),
  KEY `Libro_idx` (`nLibro`),
  CONSTRAINT `Capitulo` FOREIGN KEY (`nCapitulo`) REFERENCES `tcapitulos` (`id_nCapitulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Codigo` FOREIGN KEY (`nCodigo`) REFERENCES `tcodigos` (`id_nCod`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Contra` FOREIGN KEY (`nContra`) REFERENCES `tdelitoscontra` (`id_nContra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Libro` FOREIGN KEY (`nLibro`) REFERENCES `tlibros` (`id_nLibro`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Titulo` FOREIGN KEY (`nTitulo`) REFERENCES `ttitulos` (`id_nTitulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.thechos: ~0 rows (approximately)
/*!40000 ALTER TABLE `thechos` DISABLE KEYS */;
/*!40000 ALTER TABLE `thechos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tinfodiario
CREATE TABLE IF NOT EXISTS `tinfodiario` (
  `nCodRegional` smallint(4) NOT NULL,
  `dFechaInfo1` date NOT NULL,
  `id_IncidenciaCircunstancia` smallint(4) NOT NULL,
  `nCantidadIncidenciaInfoDiario` smallint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`nCodRegional`,`dFechaInfo1`,`id_IncidenciaCircunstancia`),
  KEY `FK_tInfoDiario_tInfoDiarioIncidenciasCircunstancias` (`id_IncidenciaCircunstancia`),
  CONSTRAINT `FK_tInfoDiario_tInfoDiarioIncidenciasCircunstancias` FOREIGN KEY (`id_IncidenciaCircunstancia`) REFERENCES `tinfodiarioincidenciascircunstancias` (`id_IncidenciaCircunstancia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tinfodiario: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinfodiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinfodiario` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tinfodiariocircunstancias
CREATE TABLE IF NOT EXISTS `tinfodiariocircunstancias` (
  `id_Circunstancia` smallint(4) NOT NULL,
  `Circunstancia` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_Circunstancia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tinfodiariocircunstancias: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinfodiariocircunstancias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinfodiariocircunstancias` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tinfodiarioincidencias
CREATE TABLE IF NOT EXISTS `tinfodiarioincidencias` (
  `id_Incidencia` smallint(4) NOT NULL,
  `cIncidencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Incidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tinfodiarioincidencias: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinfodiarioincidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinfodiarioincidencias` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tinfodiarioincidenciascircunstancias
CREATE TABLE IF NOT EXISTS `tinfodiarioincidenciascircunstancias` (
  `id_IncidenciaCircunstancia` smallint(4) NOT NULL DEFAULT 0,
  `id_Incidencia` smallint(4) NOT NULL,
  `id_Circunstancia` smallint(4) NOT NULL,
  `cDescripciónIncidencia` varchar(80) NOT NULL,
  PRIMARY KEY (`id_Incidencia`,`id_Circunstancia`),
  KEY `Índice 1` (`id_IncidenciaCircunstancia`),
  KEY `fkCircunstancia` (`id_Circunstancia`),
  CONSTRAINT `fkCircunstancia` FOREIGN KEY (`id_Circunstancia`) REFERENCES `tinfodiariocircunstancias` (`id_Circunstancia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkIncidencia` FOREIGN KEY (`id_Incidencia`) REFERENCES `tinfodiarioincidencias` (`id_Incidencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tinfodiarioincidenciascircunstancias: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinfodiarioincidenciascircunstancias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinfodiarioincidenciascircunstancias` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tinforupp
CREATE TABLE IF NOT EXISTS `tinforupp` (
  `RUPP` int(11) NOT NULL DEFAULT 0,
  `FechaDDJJ` date NOT NULL DEFAULT '2001-01-01',
  `id_nHecho` smallint(4) NOT NULL DEFAULT 0,
  `id_nElementos` smallint(4) NOT NULL DEFAULT 0,
  `id_nTipoTransporte` smallint(4) NOT NULL DEFAULT 0,
  `id_Produccion` smallint(4) NOT NULL DEFAULT 0,
  `id_EspecieGralGanado` smallint(4) NOT NULL DEFAULT 0,
  `robo_agroquimico` varchar(2) NOT NULL DEFAULT '0',
  `robo_maquinaria` varchar(2) NOT NULL DEFAULT '0',
  `robo_semilla` varchar(2) NOT NULL DEFAULT '0',
  `CantElemento` smallint(8) NOT NULL DEFAULT 0,
  `ValorDelito` double NOT NULL DEFAULT 0,
  `robo_observacion` varchar(500) NOT NULL DEFAULT '0',
  `hizo_denuncia` varchar(2) NOT NULL DEFAULT '0',
  `distrito` smallint(4) NOT NULL DEFAULT 0,
  `Seccion` varchar(2) NOT NULL DEFAULT '0',
  `Manzana` smallint(4) NOT NULL DEFAULT 0,
  `Parcela` smallint(4) NOT NULL DEFAULT 0,
  `ParcelaX` varchar(150) NOT NULL DEFAULT '0',
  `ParcelaY` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`RUPP`,`FechaDDJJ`,`id_nHecho`,`id_nElementos`,`id_nTipoTransporte`,`id_Produccion`,`id_EspecieGralGanado`,`CantElemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tinforupp: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinforupp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinforupp` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tinspecciones
CREATE TABLE IF NOT EXISTS `tinspecciones` (
  `id_nInspeccion` smallint(4) NOT NULL,
  `cInspeccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nInspeccion`),
  UNIQUE KEY `cInspeccion_UNIQUE` (`cInspeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tinspecciones: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinspecciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinspecciones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tintervinientes
CREATE TABLE IF NOT EXISTS `tintervinientes` (
  `nCodInterviniente` smallint(4) NOT NULL,
  `cInterviniente` varchar(100) DEFAULT NULL,
  `bJuzViejos` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`nCodInterviniente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tintervinientes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tintervinientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tintervinientes` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tjudiciales
CREATE TABLE IF NOT EXISTS `tjudiciales` (
  `id_DepJudicial` smallint(4) NOT NULL AUTO_INCREMENT,
  `nCodInterviniente` smallint(4) NOT NULL,
  `nRegionalJudicial` smallint(4) NOT NULL,
  `nLocalidad` int(11) NOT NULL,
  `nIdFiscal` smallint(4) NOT NULL,
  `cCargoFiscal` varchar(45) DEFAULT NULL,
  `fFechaCargoFiscal` date DEFAULT NULL,
  `cDomicilioInterviniente` varchar(80) DEFAULT NULL,
  `nPrefijoTelInterviniente` varchar(5) DEFAULT NULL,
  `cTel/CelJudicialInterviniente` varchar(45) DEFAULT NULL,
  `cCentrexInterviniente` varchar(45) DEFAULT NULL,
  `cEmailInterviniente` varchar(85) DEFAULT NULL,
  `cCodJuz` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nCodInterviniente`,`nRegionalJudicial`,`nLocalidad`,`nIdFiscal`),
  UNIQUE KEY `idxDepJudicial` (`id_DepJudicial`),
  KEY `Fiscal_idx` (`nIdFiscal`),
  KEY `Localidad_idx` (`nLocalidad`),
  KEY `RegJud_idx` (`nRegionalJudicial`),
  CONSTRAINT `Fiscal` FOREIGN KEY (`nIdFiscal`) REFERENCES `tfiscales` (`Id_nFiscal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Interviniente` FOREIGN KEY (`nCodInterviniente`) REFERENCES `tintervinientes` (`nCodInterviniente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Localidad` FOREIGN KEY (`nLocalidad`) REFERENCES `tciudades` (`nCodCiudad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RegJud` FOREIGN KEY (`nRegionalJudicial`) REFERENCES `tregionales` (`nCodRegional`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tjudiciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tjudiciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tjudiciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tlibros
CREATE TABLE IF NOT EXISTS `tlibros` (
  `id_nLibro` smallint(4) NOT NULL,
  `cLibro` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tlibros: ~0 rows (approximately)
/*!40000 ALTER TABLE `tlibros` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlibros` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmarcasarmas
CREATE TABLE IF NOT EXISTS `tmarcasarmas` (
  `Id_nMarcaArma` smallint(4) NOT NULL,
  `cMarcaArma` varchar(150) DEFAULT NULL,
  `NI` double DEFAULT NULL,
  PRIMARY KEY (`Id_nMarcaArma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmarcasarmas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmarcasarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmarcasarmas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmarcasmodelosarmas
CREATE TABLE IF NOT EXISTS `tmarcasmodelosarmas` (
  `nMMA` double NOT NULL,
  `Id_nMarcaArma` smallint(4) NOT NULL,
  `id_nModeloArma` smallint(4) NOT NULL,
  `cMarcaModeloArma` varchar(105) DEFAULT NULL,
  `bAF` tinyint(4) DEFAULT 0 COMMENT 'Arma de Fuego',
  `bAB` tinyint(4) DEFAULT 0 COMMENT 'Arma Blanca',
  `bAC` tinyint(4) DEFAULT 0 COMMENT 'Arma de Contusión',
  `bAA` tinyint(4) DEFAULT 0 COMMENT 'Arma Arrojadiza',
  `bAP` tinyint(4) DEFAULT 0 COMMENT 'Arma Proyección',
  `bAE` tinyint(4) DEFAULT 0 COMMENT 'Arma Electrónica',
  `bAAC` tinyint(4) DEFAULT 0 COMMENT 'Arma de Aire Comprimido',
  `bAQ` tinyint(4) DEFAULT 0 COMMENT 'Arma Química',
  `bEP` tinyint(4) DEFAULT 0 COMMENT 'Armas y Polvoras',
  `bACC` tinyint(4) DEFAULT 0 COMMENT 'Arma de Construcción Casera',
  PRIMARY KEY (`Id_nMarcaArma`,`id_nModeloArma`),
  UNIQUE KEY `idxMMA_UNIQUE` (`nMMA`),
  KEY `idxModeloArma_idx` (`id_nModeloArma`),
  CONSTRAINT `fk_MarcaArrma` FOREIGN KEY (`Id_nMarcaArma`) REFERENCES `tmarcasarmas` (`Id_nMarcaArma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ModeloArma` FOREIGN KEY (`id_nModeloArma`) REFERENCES `tmodelosarmas` (`id_nModeloArma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmarcasmodelosarmas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmarcasmodelosarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmarcasmodelosarmas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmarcavehiculos
CREATE TABLE IF NOT EXISTS `tmarcavehiculos` (
  `id_nMarcaVehiculo` smallint(4) NOT NULL,
  `cMarcaVehiculo` varchar(85) DEFAULT NULL,
  `NI` double DEFAULT NULL,
  `id_nMarcaVehiculoMigra` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id_nMarcaVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmarcavehiculos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmarcavehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmarcavehiculos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmodelosarmas
CREATE TABLE IF NOT EXISTS `tmodelosarmas` (
  `id_nModeloArma` smallint(4) NOT NULL,
  `cModeloArma` varchar(150) DEFAULT NULL,
  `NI` double DEFAULT NULL,
  PRIMARY KEY (`id_nModeloArma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmodelosarmas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmodelosarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodelosarmas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmodelosvehiculos
CREATE TABLE IF NOT EXISTS `tmodelosvehiculos` (
  `nTMMV` double NOT NULL,
  `id_nTipoTransporte` smallint(4) NOT NULL DEFAULT 0,
  `nMarcaVehiculo` smallint(4) NOT NULL DEFAULT 0,
  `id_nModeloVehiculo` smallint(4) NOT NULL DEFAULT 0,
  `cTipoMarcaModeloVehiculo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoTransporte`,`nMarcaVehiculo`,`id_nModeloVehiculo`),
  UNIQUE KEY `idxTipoMarcaModeloVehiculo` (`nTMMV`),
  KEY `idxMarVeh_idx` (`nMarcaVehiculo`),
  KEY `idxModVeh_idx` (`id_nModeloVehiculo`),
  KEY `idxTipoVehiculo` (`id_nModeloVehiculo`),
  CONSTRAINT `fk_MarVeh` FOREIGN KEY (`nMarcaVehiculo`) REFERENCES `tmarcavehiculos` (`id_nMarcaVehiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ModVeh` FOREIGN KEY (`id_nModeloVehiculo`) REFERENCES `tmodelosvehiculosmodelos` (`id_nModeloVehiculo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_TipVeh` FOREIGN KEY (`id_nTipoTransporte`) REFERENCES `ttiposvehiculos` (`id_nTipoTransporte`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmodelosvehiculos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmodelosvehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodelosvehiculos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmodelosvehiculosmodelos
CREATE TABLE IF NOT EXISTS `tmodelosvehiculosmodelos` (
  `id_nModeloVehiculo` smallint(4) NOT NULL,
  `cModeloVehiculo` varchar(85) DEFAULT NULL,
  `id_nModeloVehiculoMigra` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id_nModeloVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmodelosvehiculosmodelos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmodelosvehiculosmodelos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodelosvehiculosmodelos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmodosfugas
CREATE TABLE IF NOT EXISTS `tmodosfugas` (
  `id_ModoFuga` smallint(4) NOT NULL,
  `cModoFuga` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_ModoFuga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmodosfugas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmodosfugas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodosfugas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmodusdelitosobjetivos
CREATE TABLE IF NOT EXISTS `tmodusdelitosobjetivos` (
  `id_HOSoMo` double(12,0) unsigned zerofill NOT NULL,
  `id_nHechos` smallint(4) NOT NULL,
  `id_nObjetivos` smallint(4) NOT NULL,
  `nSubObjetivo` smallint(4) NOT NULL DEFAULT 0,
  `id_nModusOperandi` smallint(4) NOT NULL,
  `cHechoObjetivoModus` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_nHechos`,`id_nObjetivos`,`id_nModusOperandi`,`nSubObjetivo`),
  UNIQUE KEY `idxHOSoMo` (`id_HOSoMo`),
  KEY `idxModus` (`id_nModusOperandi`),
  KEY `idxHecho` (`id_nHechos`),
  KEY `idxObjetivo` (`id_nObjetivos`),
  KEY `idxSubobjetivo` (`nSubObjetivo`),
  CONSTRAINT `fk_DelitoGral` FOREIGN KEY (`id_nHechos`) REFERENCES `thechos` (`id_nHecho`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ModusGral` FOREIGN KEY (`id_nModusOperandi`) REFERENCES `tmodusgenerales` (`id_nModusOperandi`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ObjetivoGral` FOREIGN KEY (`id_nObjetivos`) REFERENCES `tobjetivosgenerales` (`id_nObjetivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_SubobjetivoGral` FOREIGN KEY (`nSubObjetivo`) REFERENCES `tsubobjetivos` (`nSubObjetivo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmodusdelitosobjetivos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmodusdelitosobjetivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodusdelitosobjetivos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmodusgenerales
CREATE TABLE IF NOT EXISTS `tmodusgenerales` (
  `id_nModusOperandi` smallint(4) NOT NULL,
  `cModusOperandi` varchar(45) DEFAULT NULL,
  `cAclaracionModus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nModusOperandi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmodusgenerales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmodusgenerales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmodusgenerales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmonedas
CREATE TABLE IF NOT EXISTS `tmonedas` (
  `nISO4217` smallint(4) NOT NULL,
  `cISO4217` varchar(5) DEFAULT NULL,
  `cPais` varchar(90) DEFAULT NULL,
  `cMoneda` varchar(45) DEFAULT NULL,
  `cSimboloMoneda` varchar(3) DEFAULT NULL,
  `cFraccionMoneda` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nISO4217`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmonedas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmonedas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmonedas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tmovimientousuarios
CREATE TABLE IF NOT EXISTS `tmovimientousuarios` (
  `id_nUsuario` smallint(4) NOT NULL,
  `Fecha_Inicio` datetime DEFAULT NULL,
  `Fecha_Baja` datetime DEFAULT NULL,
  `tUsuarioAuditor` smallint(4) DEFAULT NULL,
  `tMotivoAccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tmovimientousuarios: ~0 rows (approximately)
/*!40000 ALTER TABLE `tmovimientousuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmovimientousuarios` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tobjetivosgenerales
CREATE TABLE IF NOT EXISTS `tobjetivosgenerales` (
  `id_nObjetivo` smallint(4) NOT NULL,
  `cObjetivo` varchar(70) DEFAULT NULL,
  `cAclaracionObjetivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tobjetivosgenerales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tobjetivosgenerales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tobjetivosgenerales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.toperativoscovid19
CREATE TABLE IF NOT EXISTS `toperativoscovid19` (
  `idOperativoCovid19` int(11) NOT NULL AUTO_INCREMENT,
  `id_nDepProv` smallint(4) NOT NULL,
  `dFecInicial` date NOT NULL,
  `tHora` time NOT NULL,
  `dFechaFinal` date NOT NULL,
  `nCodRegional` smallint(4) NOT NULL,
  `nAprendidos` smallint(8) NOT NULL,
  `nIntervenciones` smallint(8) NOT NULL,
  `nLlamados` smallint(8) NOT NULL,
  `nControlTransportePasajeros` smallint(8) NOT NULL,
  `nControlVehiculos` smallint(8) NOT NULL,
  `nSecuestroVehiculos` smallint(8) NOT NULL,
  PRIMARY KEY (`dFecInicial`,`tHora`,`dFechaFinal`,`nCodRegional`) USING BTREE,
  UNIQUE KEY `idxOperativoCovid19` (`idOperativoCovid19`),
  KEY `idxDeptoProv` (`id_nDepProv`),
  KEY `idxUD` (`nCodRegional`),
  CONSTRAINT `fk_DptoProv` FOREIGN KEY (`id_nDepProv`) REFERENCES `tdepartamentosprovinciales` (`id_nDepProv`) ON UPDATE CASCADE,
  CONSTRAINT `fk_UD` FOREIGN KEY (`nCodRegional`) REFERENCES `tregionales` (`nCodRegional`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.toperativoscovid19: ~0 rows (approximately)
/*!40000 ALTER TABLE `toperativoscovid19` DISABLE KEYS */;
/*!40000 ALTER TABLE `toperativoscovid19` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.torientacionescardinales
CREATE TABLE IF NOT EXISTS `torientacionescardinales` (
  `id_OrientacionCardinal` smallint(4) NOT NULL,
  `cOrientacionCardinal` varchar(10) NOT NULL,
  PRIMARY KEY (`id_OrientacionCardinal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.torientacionescardinales: ~0 rows (approximately)
/*!40000 ALTER TABLE `torientacionescardinales` DISABLE KEYS */;
/*!40000 ALTER TABLE `torientacionescardinales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.torigenesdatos
CREATE TABLE IF NOT EXISTS `torigenesdatos` (
  `id_OrigenDatos` smallint(4) NOT NULL,
  `cOrigenDato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_OrigenDatos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.torigenesdatos: ~0 rows (approximately)
/*!40000 ALTER TABLE `torigenesdatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `torigenesdatos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tovino
CREATE TABLE IF NOT EXISTS `tovino` (
  `id_Ovino` smallint(4) NOT NULL,
  `cOvino` varchar(50) NOT NULL DEFAULT '',
  `cDetalleOvino` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_Ovino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tovino: ~0 rows (approximately)
/*!40000 ALTER TABLE `tovino` DISABLE KEYS */;
/*!40000 ALTER TABLE `tovino` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tpaises
CREATE TABLE IF NOT EXISTS `tpaises` (
  `id_nPais` smallint(4) NOT NULL,
  `cIso` varchar(45) DEFAULT NULL,
  `cPais` varchar(100) DEFAULT NULL,
  `tPaisescol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nPais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tpaises: ~0 rows (approximately)
/*!40000 ALTER TABLE `tpaises` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpaises` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tpersonas
CREATE TABLE IF NOT EXISTS `tpersonas` (
  `nNroDocPersona` double NOT NULL DEFAULT 0 COMMENT 'En aquellas oportunidades que se deba ingresar una persona de la cual el nro de DNI sea desconcido. El sistema deberá otorgarle un número automáticamente que deberá ser menor a 1 millón. ',
  `bTipoPersonaFisica` tinyint(4) NOT NULL DEFAULT 0,
  `nTipoDocPersona` smallint(4) NOT NULL DEFAULT 0,
  `nSexoPersona` smallint(4) NOT NULL DEFAULT 1,
  `cApePatPersona` varchar(105) NOT NULL DEFAULT 'NN',
  `cNombresPersona` varchar(105) NOT NULL DEFAULT 'NN',
  `nEstadoCivil` smallint(2) DEFAULT NULL,
  `bPersonaNN` tinyint(4) DEFAULT 0,
  `cApeMatPersona` varchar(45) DEFAULT 'NN',
  `cSeudonimoPersona` varchar(105) DEFAULT 'NN',
  `cNacionalidad1Persona` varchar(45) DEFAULT 'Argentina',
  `cNacionalidad2Persona` varchar(45) DEFAULT 'S/N',
  `nGeneroPersona` smallint(4) NOT NULL DEFAULT 1,
  `id_nOcupacion` smallint(4) unsigned zerofill NOT NULL,
  `id_nProfesion` smallint(4) unsigned zerofill DEFAULT NULL,
  `id_nTipoSocietario` smallint(4) DEFAULT 0,
  `id_nTitularidad` smallint(4) NOT NULL DEFAULT 0,
  `id_nTipoInstitucion` smallint(4) NOT NULL DEFAULT 0,
  `id_nActividadEconomicaGral` smallint(4) NOT NULL DEFAULT 0,
  `id_nSubActividadEconomicaGral` smallint(4) NOT NULL DEFAULT 0,
  `fFacNac` date DEFAULT NULL,
  `cFotoPersona` varchar(45) DEFAULT NULL,
  `cId_persona` varchar(255) DEFAULT NULL,
  `nRUPP` int(11) DEFAULT 0,
  `nCUIT` double DEFAULT NULL,
  `cRubro` varchar(50) DEFAULT NULL,
  `cAmbito` varchar(50) DEFAULT NULL,
  `bGubernamental` tinyint(4) NOT NULL DEFAULT 0,
  `bSucursal` tinyint(1) NOT NULL DEFAULT 0,
  `cObsPersonas` mediumtext DEFAULT NULL,
  PRIMARY KEY (`bTipoPersonaFisica`,`nTipoDocPersona`,`nNroDocPersona`,`nSexoPersona`,`cApePatPersona`,`cNombresPersona`),
  UNIQUE KEY `iduNroDocPersona` (`nNroDocPersona`) USING BTREE,
  KEY `idxOcupacion` (`id_nOcupacion`),
  KEY `idxProfesion` (`id_nProfesion`),
  KEY `idx_GeneroPersonas_idx` (`nGeneroPersona`) USING BTREE,
  KEY `idxTitularidadEmpresa` (`id_nTitularidad`) USING BTREE,
  KEY `idxTipoInstitucion` (`id_nTipoInstitucion`),
  KEY `idxTipoSocietario` (`id_nTipoSocietario`),
  KEY `idxEstadoCivil` (`nGeneroPersona`),
  KEY `idxTipoDoc` (`nTipoDocPersona`) USING BTREE,
  KEY `idxSexoPersona` (`nSexoPersona`) USING BTREE,
  KEY `idxRupp2` (`nRUPP`) USING BTREE,
  KEY `idxEstadoCivilPer` (`nEstadoCivil`) USING BTREE,
  KEY `idxActividadE` (`id_nActividadEconomicaGral`),
  KEY `idxSubActividadE` (`id_nSubActividadEconomicaGral`),
  CONSTRAINT `fk_ActividadE` FOREIGN KEY (`id_nActividadEconomicaGral`) REFERENCES `tactividadeseconomicasgrales` (`id_nActividadEconomicaGral`) ON UPDATE CASCADE,
  CONSTRAINT `fk_EstadoCivilPer` FOREIGN KEY (`nEstadoCivil`) REFERENCES `testadosciviles` (`nEstadoCivl`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Genero` FOREIGN KEY (`nGeneroPersona`) REFERENCES `tgenerospersonas` (`id_nGeneroPersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Rupp2` FOREIGN KEY (`nRUPP`) REFERENCES `trupp` (`RUPP`) ON UPDATE CASCADE,
  CONSTRAINT `fk_SexoPersona` FOREIGN KEY (`nSexoPersona`) REFERENCES `tsexo` (`id_nSexo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_SubActividadE` FOREIGN KEY (`id_nSubActividadEconomicaGral`) REFERENCES `tsubactividadeseconomicasgrales` (`id_nSubActividadEconomicaGral`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoDoc` FOREIGN KEY (`nTipoDocPersona`) REFERENCES `ttiposdocumentospersonas` (`id_nTipoDoc`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoInstitucion` FOREIGN KEY (`id_nTipoInstitucion`) REFERENCES `ttiposinstituciones` (`id_nTipoInstitucion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoSocietario` FOREIGN KEY (`id_nTipoSocietario`) REFERENCES `ttipossocietarios` (`id_nTipoSocietario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TitularidadEmpresa` FOREIGN KEY (`id_nTitularidad`) REFERENCES `ttitularidadesempresas` (`id_nTitularidad`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tpersonas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tpersonas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpersonas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tpersonascomunicacion
CREATE TABLE IF NOT EXISTS `tpersonascomunicacion` (
  `id_nPersonaComunicacion` int(11) NOT NULL AUTO_INCREMENT,
  `nNroDocPersona` double NOT NULL DEFAULT 0,
  `id_FormaComunicacion` smallint(4) NOT NULL DEFAULT 0,
  `id_PropiedadComunicacion` smallint(4) NOT NULL DEFAULT 0,
  `cIdentificacionComunicacion` varchar(100) NOT NULL COMMENT 'Número de comunicación completo',
  `ObsPersonasComunicacion` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`nNroDocPersona`,`id_FormaComunicacion`,`id_PropiedadComunicacion`,`cIdentificacionComunicacion`),
  UNIQUE KEY `idxPersonaComunicacion` (`id_nPersonaComunicacion`),
  KEY `fk_Comu_idx` (`id_PropiedadComunicacion`),
  KEY `fk_FormaComu_idx` (`id_FormaComunicacion`),
  KEY `idxNroDocPer` (`nNroDocPersona`),
  CONSTRAINT `fk_FormaComu` FOREIGN KEY (`id_FormaComunicacion`) REFERENCES `tformascomunicaciones` (`id_FormaComunicacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_NroDocPer` FOREIGN KEY (`nNroDocPersona`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ProComu` FOREIGN KEY (`id_PropiedadComunicacion`) REFERENCES `tpropiedadcomunicacion` (`id_PropiedadComunicacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tpersonascomunicacion: ~0 rows (approximately)
/*!40000 ALTER TABLE `tpersonascomunicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpersonascomunicacion` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tpersonasdenunciaspoliciales
CREATE TABLE IF NOT EXISTS `tpersonasdenunciaspoliciales` (
  `id_nPersonaDelito` int(11) NOT NULL AUTO_INCREMENT,
  `id_ConcurrenciaDelitos` int(11) NOT NULL DEFAULT 0,
  `nNroDocPersona` double NOT NULL DEFAULT 0,
  `nCalidadPersona` smallint(4) NOT NULL DEFAULT 0,
  `nGeneroPersona` smallint(4) NOT NULL DEFAULT 0,
  `cOcupacion` varchar(105) DEFAULT NULL,
  `cCodAreaTel_CelPersona` varchar(5) DEFAULT NULL,
  `cTelCelPersona` varchar(45) DEFAULT NULL,
  `nEstadoCivl` smallint(2) NOT NULL DEFAULT 0,
  `nEdad` smallint(4) DEFAULT NULL,
  `nRangoEdad` smallint(4) NOT NULL DEFAULT 0,
  `bLesionada` tinyint(2) DEFAULT NULL,
  `id_TipoLesion` smallint(4) NOT NULL,
  `bEstadoEbriedad` tinyint(2) DEFAULT NULL,
  `id_nAccionPrevia` smallint(4) NOT NULL DEFAULT 0,
  `bEstadoDrogas` varchar(45) DEFAULT NULL,
  `cAtencionMedica` varchar(85) DEFAULT NULL,
  `ncantidadPersona` smallint(4) DEFAULT 1,
  `cSeudonimoPersona` varchar(105) DEFAULT NULL,
  `cNacionalidad1Persona` varchar(30) DEFAULT NULL,
  `cNacionalidad2Persona` varchar(30) DEFAULT NULL,
  `nPerteneceFS` smallint(6) NOT NULL DEFAULT 0,
  `cNIFS` varchar(45) DEFAULT NULL,
  `cGradoJerarquicoFS` varchar(45) DEFAULT NULL,
  `cFuncionFS` varchar(45) DEFAULT NULL,
  `cDestinoFS` varchar(85) DEFAULT NULL,
  `cCodAreaTel/CelPersona` varchar(10) DEFAULT NULL,
  `cEmailPersona` varchar(85) DEFAULT NULL,
  `cTelCelLaboral` varchar(15) DEFAULT NULL,
  `cReferenciasFS` varchar(105) DEFAULT NULL,
  `cNuevoDatoPersonas` varchar(255) DEFAULT NULL,
  `bFallecido` tinyint(2) DEFAULT 0,
  `cDescripcionFisica` tinytext DEFAULT NULL,
  `cObsPersonasDenunciasPoliciales` tinytext DEFAULT NULL,
  PRIMARY KEY (`id_ConcurrenciaDelitos`,`nNroDocPersona`,`nCalidadPersona`),
  UNIQUE KEY `idxPersonaDelito` (`id_nPersonaDelito`),
  KEY `idxCalidadPersona_idx` (`nCalidadPersona`),
  KEY `idxRangoEdad` (`nRangoEdad`),
  KEY `idxPersonas` (`nNroDocPersona`),
  KEY `idxPersonasFS` (`nPerteneceFS`),
  KEY `idxTipolesion` (`id_TipoLesion`),
  KEY `idxNroDocPer` (`nNroDocPersona`),
  KEY `idxEstadoCiv` (`nEstadoCivl`),
  KEY `idx_ConcurrenciaDelito` (`id_ConcurrenciaDelitos`),
  KEY `idx_Genero` (`nGeneroPersona`),
  CONSTRAINT `fk_CalidadPersona` FOREIGN KEY (`nCalidadPersona`) REFERENCES `tcalidaddepersonas` (`id_nCalidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DNI` FOREIGN KEY (`nNroDocPersona`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_EstadoCiv` FOREIGN KEY (`nEstadoCivl`) REFERENCES `testadosciviles` (`nEstadoCivl`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_GeneroDecladaro` FOREIGN KEY (`nGeneroPersona`) REFERENCES `tgenerospersonas` (`id_nGeneroPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_PersonasFS` FOREIGN KEY (`nPerteneceFS`) REFERENCES `tfuerzasseguridad` (`id_nFuerzaSeguridad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_RangoEdad` FOREIGN KEY (`nRangoEdad`) REFERENCES `trangosedades` (`id_nRangoEdad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tipolesion` FOREIGN KEY (`id_TipoLesion`) REFERENCES `ttiposlesiones` (`id_TipoLesion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kf_ConcurrenciaDelito` FOREIGN KEY (`id_ConcurrenciaDelitos`) REFERENCES `tdenunciaspolicialesconcurrenciadelitos` (`id_ConcurrenciaDelitos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tpersonasdenunciaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tpersonasdenunciaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpersonasdenunciaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tpersonasdomicilios
CREATE TABLE IF NOT EXISTS `tpersonasdomicilios` (
  `id_ConcurrenciaDelitos` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Si el domicilio ingresa por una actuación se deberá ingresar el mismo, si ingresa por otro vía el mismo será 0 cóom prederterminado',
  `nNroDocPersona` double NOT NULL,
  `cCallePrincipalPersona` varchar(100) NOT NULL,
  `cAlturaCallePrincipalPersona` varchar(45) NOT NULL DEFAULT '0' COMMENT 'Se puede ingresar una altura catastral o en Km para rutas. También alturas de referencias. ',
  `cLetraCallePrincipalPersona` tinytext DEFAULT NULL,
  `cInterseccionCallePrincipalPersona` varchar(100) DEFAULT NULL COMMENT 'Se puede utilizar para calle intersección o calle entre 1',
  `cInterseccionCallePrincipalPersona2` varchar(100) DEFAULT NULL COMMENT 'Se utiliza unicamente cómo calle entre 2',
  `fFechaActualizacion` datetime NOT NULL COMMENT 'Es la fecha en que el domiciio ingresa a la tabla. Si ingersa por una actuación ésta se corrsponde con la fecha del hecho o denuncia. ',
  `nLocalidadDomPersona` int(11) NOT NULL,
  `bZonaDomPersona` tinyint(4) DEFAULT NULL,
  `cReferenciaDomPersona` mediumtext DEFAULT NULL,
  `X` mediumtext DEFAULT NULL,
  `Y` mediumtext DEFAULT NULL,
  `cLongitud` mediumtext DEFAULT NULL,
  `cLatitud` mediumtext DEFAULT NULL,
  PRIMARY KEY (`nNroDocPersona`,`cCallePrincipalPersona`,`cAlturaCallePrincipalPersona`,`fFechaActualizacion`,`nLocalidadDomPersona`),
  KEY `idxCalleDomPersona` (`cCallePrincipalPersona`) USING BTREE,
  KEY `idxDNI` (`nNroDocPersona`),
  CONSTRAINT `fk_CalleDomPersona` FOREIGN KEY (`cCallePrincipalPersona`) REFERENCES `tcalles` (`Id_nCalle`) ON UPDATE CASCADE,
  CONSTRAINT `fk_DNI_Persona` FOREIGN KEY (`nNroDocPersona`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tpersonasdomicilios: ~0 rows (approximately)
/*!40000 ALTER TABLE `tpersonasdomicilios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpersonasdomicilios` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tpersonasfuerzasseguridad
CREATE TABLE IF NOT EXISTS `tpersonasfuerzasseguridad` (
  `id_nPersonalSeguridad` int(11) NOT NULL AUTO_INCREMENT,
  `cNIFS` int(11) NOT NULL,
  `id_nFuerzaSeguridad` smallint(4) NOT NULL,
  `nNroDocPersona` double NOT NULL,
  `cApeNom` varchar(150) DEFAULT NULL,
  `cGradoJerarquicoFS` varchar(95) DEFAULT NULL,
  `cFuncionFS` varchar(95) DEFAULT NULL,
  `cDestinoFS` varchar(95) DEFAULT NULL,
  `cReferenciasFS` varchar(95) DEFAULT NULL,
  `fFechaActualizacion` date DEFAULT NULL,
  PRIMARY KEY (`cNIFS`,`id_nFuerzaSeguridad`),
  UNIQUE KEY `idxPersonalSeguridad` (`id_nPersonalSeguridad`),
  KEY `fk_FuerzaSeguridad` (`id_nFuerzaSeguridad`),
  KEY `fk_DNI` (`nNroDocPersona`),
  CONSTRAINT `fk_FuerzaSeguridad` FOREIGN KEY (`id_nFuerzaSeguridad`) REFERENCES `tfuerzasseguridad` (`id_nFuerzaSeguridad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_NroDocPerSeg` FOREIGN KEY (`nNroDocPersona`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40408 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tpersonasfuerzasseguridad: ~0 rows (approximately)
/*!40000 ALTER TABLE `tpersonasfuerzasseguridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpersonasfuerzasseguridad` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tporcinos
CREATE TABLE IF NOT EXISTS `tporcinos` (
  `id_Porcino` smallint(4) NOT NULL,
  `cPorcino` varchar(50) NOT NULL DEFAULT '',
  `cDetallePorcino` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_Porcino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tporcinos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tporcinos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tporcinos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tproducciones
CREATE TABLE IF NOT EXISTS `tproducciones` (
  `id_Produccion` smallint(4) NOT NULL DEFAULT 0,
  `cProduccion` varchar(50) DEFAULT NULL,
  `id_Produccion1` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Produccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tproducciones: ~0 rows (approximately)
/*!40000 ALTER TABLE `tproducciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tproducciones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tpropiedadcomunicacion
CREATE TABLE IF NOT EXISTS `tpropiedadcomunicacion` (
  `id_PropiedadComunicacion` smallint(4) NOT NULL,
  `cPropiedadComunicacion` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`id_PropiedadComunicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tpropiedadcomunicacion: ~0 rows (approximately)
/*!40000 ALTER TABLE `tpropiedadcomunicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpropiedadcomunicacion` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tprovincias
CREATE TABLE IF NOT EXISTS `tprovincias` (
  `nCodPro` smallint(4) NOT NULL,
  `cProvincia` varchar(100) DEFAULT NULL,
  `id_nPais` smallint(4) DEFAULT NULL,
  `cLatProvincia` varchar(50) DEFAULT NULL,
  `cLonProvincia` varchar(50) DEFAULT NULL,
  `pCoordenadasProvincia` point DEFAULT NULL,
  `id_Api` smallint(4) DEFAULT NULL,
  `nPoblacionCenso2010` int(11) DEFAULT NULL,
  PRIMARY KEY (`nCodPro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tprovincias: ~0 rows (approximately)
/*!40000 ALTER TABLE `tprovincias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tprovincias` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.trangosedades
CREATE TABLE IF NOT EXISTS `trangosedades` (
  `id_nRangoEdad` smallint(4) NOT NULL,
  `cRangoEdad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nRangoEdad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.trangosedades: ~0 rows (approximately)
/*!40000 ALTER TABLE `trangosedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `trangosedades` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.trangoshorarios
CREATE TABLE IF NOT EXISTS `trangoshorarios` (
  `id_nRangoHorario` smallint(4) NOT NULL,
  `cRangoHorario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nRangoHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.trangoshorarios: ~0 rows (approximately)
/*!40000 ALTER TABLE `trangoshorarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `trangoshorarios` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.trazasanimales
CREATE TABLE IF NOT EXISTS `trazasanimales` (
  `id_nRazaAnimal` smallint(4) DEFAULT NULL,
  `cRazaAnimal` varchar(80) DEFAULT NULL,
  `bVacuno` int(11) DEFAULT 0,
  `bCarnet` tinyint(4) DEFAULT 0,
  `bLeche` tinyint(4) DEFAULT 0,
  `bLana` tinyint(4) DEFAULT 0,
  `bTiro` tinyint(4) DEFAULT 0,
  UNIQUE KEY `idxRazaAnimal` (`cRazaAnimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.trazasanimales: ~0 rows (approximately)
/*!40000 ALTER TABLE `trazasanimales` DISABLE KEYS */;
/*!40000 ALTER TABLE `trazasanimales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tregionales
CREATE TABLE IF NOT EXISTS `tregionales` (
  `nCodRegional` smallint(4) NOT NULL,
  `nTipoRegional` smallint(4) NOT NULL,
  `cRegional` varchar(255) DEFAULT NULL,
  `cResumenRegional` varchar(100) DEFAULT NULL,
  `cDepartamento` varchar(255) DEFAULT NULL,
  `nProvincia` smallint(4) DEFAULT NULL,
  `id_nDepProv` smallint(4) NOT NULL,
  PRIMARY KEY (`nCodRegional`),
  KEY `TipoRegional` (`nTipoRegional`),
  KEY `fk_DepProv` (`id_nDepProv`),
  CONSTRAINT `TipoRegional` FOREIGN KEY (`nTipoRegional`) REFERENCES `ttiporegionales` (`id_nTipoRegional`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_DepProv` FOREIGN KEY (`id_nDepProv`) REFERENCES `tdepartamentosprovinciales` (`id_nDepProv`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tregionales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tregionales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tregionales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.trupp
CREATE TABLE IF NOT EXISTS `trupp` (
  `RUPP` int(11) NOT NULL,
  `cuit` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`RUPP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.trupp: ~0 rows (approximately)
/*!40000 ALTER TABLE `trupp` DISABLE KEYS */;
/*!40000 ALTER TABLE `trupp` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.truppubicaciones
CREATE TABLE IF NOT EXISTS `truppubicaciones` (
  `RUPP` int(11) NOT NULL DEFAULT 0,
  `distrito` smallint(4) NOT NULL,
  `seccion` varchar(5) NOT NULL,
  `manzana` smallint(4) NOT NULL DEFAULT 0,
  `parcela` smallint(4) NOT NULL DEFAULT 0,
  `parcela_x` varchar(100) NOT NULL DEFAULT '0',
  `parcela_y` varchar(100) NOT NULL DEFAULT '0',
  `ParcelaUnica` tinyint(4) DEFAULT 0,
  `CoordendaParcela` varchar(100) DEFAULT NULL,
  `Y` varchar(100) DEFAULT NULL,
  `X` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RUPP`,`distrito`,`seccion`,`manzana`,`parcela`,`parcela_x`,`parcela_y`),
  KEY `fk_DistProv` (`distrito`),
  CONSTRAINT `fk_DistProv` FOREIGN KEY (`distrito`) REFERENCES `tdistritosprovinciales` (`id_DistritoProvincial`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Rupp` FOREIGN KEY (`RUPP`) REFERENCES `trupp` (`RUPP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.truppubicaciones: ~0 rows (approximately)
/*!40000 ALTER TABLE `truppubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `truppubicaciones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tsesion
CREATE TABLE IF NOT EXISTS `tsesion` (
  `Id_sesion` int(20) NOT NULL AUTO_INCREMENT,
  `Id_Usuario` int(20) NOT NULL,
  `id_Vista` smallint(4) NOT NULL,
  `SesionActiva` tinyint(4) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `accion` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `usuarioU` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`Id_sesion`),
  KEY `Id_Usuario` (`Id_Usuario`),
  KEY `id_Vista` (`id_Vista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Dumping data for table denunciasdb.tsesion: ~0 rows (approximately)
/*!40000 ALTER TABLE `tsesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsesion` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tsexo
CREATE TABLE IF NOT EXISTS `tsexo` (
  `id_nSexo` smallint(2) NOT NULL,
  `cSexo` varchar(45) DEFAULT NULL,
  `cSexoMH` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nSexo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tsexo: ~0 rows (approximately)
/*!40000 ALTER TABLE `tsexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsexo` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tsubactividadeseconomicasgrales
CREATE TABLE IF NOT EXISTS `tsubactividadeseconomicasgrales` (
  `id_nActividadEconomicaGral` smallint(4) NOT NULL,
  `id_nSubActividadEconomicaGral` smallint(4) NOT NULL,
  `bSectorProductivo` tinyint(4) DEFAULT NULL,
  `cSubActividadEconomicaGral` varchar(50) DEFAULT NULL,
  `cDesSubActividadEconomicaGral` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nActividadEconomicaGral`,`id_nSubActividadEconomicaGral`) USING BTREE,
  UNIQUE KEY `idxSubActividadEconomica` (`id_nSubActividadEconomicaGral`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tsubactividadeseconomicasgrales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tsubactividadeseconomicasgrales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsubactividadeseconomicasgrales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tsubespeciesganados
CREATE TABLE IF NOT EXISTS `tsubespeciesganados` (
  `id_SubespecieGanado` smallint(4) NOT NULL COMMENT 'Subespecie es sinónimo de SUBCATEGORÍA',
  `cSubespecieGanado` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_SubespecieGanado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tsubespeciesganados: ~0 rows (approximately)
/*!40000 ALTER TABLE `tsubespeciesganados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsubespeciesganados` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tsubobjetivos
CREATE TABLE IF NOT EXISTS `tsubobjetivos` (
  `nSubObjetivo` smallint(4) NOT NULL,
  `cSubObjetivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nSubObjetivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tsubobjetivos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tsubobjetivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsubobjetivos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tsubunidades
CREATE TABLE IF NOT EXISTS `tsubunidades` (
  `nCodSud` smallint(4) NOT NULL,
  `cSubUd` varchar(100) DEFAULT NULL,
  `bActual` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`nCodSud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tsubunidades: ~0 rows (approximately)
/*!40000 ALTER TABLE `tsubunidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsubunidades` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttamanocalibrearma
CREATE TABLE IF NOT EXISTS `ttamanocalibrearma` (
  `id_nTamanoCalibre` smallint(4) NOT NULL,
  `cTamanoCalibre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nTamanoCalibre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttamanocalibrearma: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttamanocalibrearma` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttamanocalibrearma` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttipoanimales
CREATE TABLE IF NOT EXISTS `ttipoanimales` (
  `id_nTipoAnimal` smallint(4) NOT NULL AUTO_INCREMENT,
  `cTipoAninal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoAnimal`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.ttipoanimales: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttipoanimales` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttipoanimales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttipoarmas
CREATE TABLE IF NOT EXISTS `ttipoarmas` (
  `id_nTipoArma` smallint(4) NOT NULL,
  `cTipoArma` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cObsTipoArma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoArma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttipoarmas: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttipoarmas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttipoarmas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttipoarmascartuchos
CREATE TABLE IF NOT EXISTS `ttipoarmascartuchos` (
  `id_TipoCartucho` smallint(4) NOT NULL,
  `Cartucho` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_TipoCartucho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttipoarmascartuchos: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttipoarmascartuchos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttipoarmascartuchos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttipoconfecciondocumento
CREATE TABLE IF NOT EXISTS `ttipoconfecciondocumento` (
  `id_ConfecDoc` smallint(4) NOT NULL,
  `cTipoConfeccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ConfecDoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttipoconfecciondocumento: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttipoconfecciondocumento` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttipoconfecciondocumento` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttipolugarhecho
CREATE TABLE IF NOT EXISTS `ttipolugarhecho` (
  `id_nTipoLugarHecho` smallint(4) NOT NULL,
  `id_nEntornoLugarhecho` smallint(4) NOT NULL,
  `cTipoLugarHecho` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoLugarHecho`),
  KEY `fk_EntornoLugar_idx` (`id_nEntornoLugarhecho`),
  CONSTRAINT `fk_EntornoLugar` FOREIGN KEY (`id_nEntornoLugarhecho`) REFERENCES `tentornolugarhecho` (`id_nEntornoLugarHecho`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttipolugarhecho: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttipolugarhecho` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttipolugarhecho` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiporegionales
CREATE TABLE IF NOT EXISTS `ttiporegionales` (
  `id_nTipoRegional` smallint(4) NOT NULL,
  `cTipoRegional` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoRegional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttiporegionales: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiporegionales` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiporegionales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiposactuaciones
CREATE TABLE IF NOT EXISTS `ttiposactuaciones` (
  `idTipoActuaciones` smallint(4) NOT NULL,
  `cTipoActuaciones` varchar(45) DEFAULT NULL,
  `cAcrónimo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`idTipoActuaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttiposactuaciones: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiposactuaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiposactuaciones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiposat
CREATE TABLE IF NOT EXISTS `ttiposat` (
  `id_nTipoAT` smallint(4) NOT NULL,
  `cTipoAccidenteTransito` varchar(45) DEFAULT NULL,
  `cDescripcionTAT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttiposat: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiposat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiposat` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiposcalles
CREATE TABLE IF NOT EXISTS `ttiposcalles` (
  `id_nTiposCalles` smallint(4) NOT NULL,
  `cTipoCalle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nTiposCalles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttiposcalles: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiposcalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiposcalles` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiposdocumentospersonas
CREATE TABLE IF NOT EXISTS `ttiposdocumentospersonas` (
  `id_nTipoDoc` smallint(4) NOT NULL,
  `cTipoDoc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoDoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttiposdocumentospersonas: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiposdocumentospersonas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiposdocumentospersonas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiposinstituciones
CREATE TABLE IF NOT EXISTS `ttiposinstituciones` (
  `id_nTipoInstitucion` smallint(4) NOT NULL,
  `cTipoInstitucion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoInstitucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.ttiposinstituciones: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiposinstituciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiposinstituciones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiposlesiones
CREATE TABLE IF NOT EXISTS `ttiposlesiones` (
  `id_TipoLesion` smallint(4) NOT NULL,
  `nTipoLesion` varchar(80) DEFAULT NULL,
  `cDescripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_TipoLesion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttiposlesiones: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiposlesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiposlesiones` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttipossocietarios
CREATE TABLE IF NOT EXISTS `ttipossocietarios` (
  `id_nTipoSocietario` smallint(4) NOT NULL DEFAULT 0,
  `cTipoSocietario` varchar(100) NOT NULL DEFAULT '0',
  `cObsTipoSocietario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoSocietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.ttipossocietarios: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttipossocietarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttipossocietarios` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttiposvehiculos
CREATE TABLE IF NOT EXISTS `ttiposvehiculos` (
  `id_nTipoTransporte` smallint(4) NOT NULL,
  `cTipoTransporte` varchar(85) DEFAULT NULL,
  `NI` double DEFAULT NULL,
  `id_nTipoTransporteMigra` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoTransporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttiposvehiculos: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttiposvehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttiposvehiculos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttipousuarios
CREATE TABLE IF NOT EXISTS `ttipousuarios` (
  `id_nTipoUsuario` smallint(4) NOT NULL,
  `cTipoUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttipousuarios: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttipousuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttipousuarios` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttitularidadesempresas
CREATE TABLE IF NOT EXISTS `ttitularidadesempresas` (
  `id_nTitularidad` smallint(4) NOT NULL,
  `cTitularidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_nTitularidad`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.ttitularidadesempresas: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttitularidadesempresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttitularidadesempresas` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.ttitulos
CREATE TABLE IF NOT EXISTS `ttitulos` (
  `id_nTitulo` smallint(4) NOT NULL,
  `cTitulo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_nTitulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.ttitulos: ~0 rows (approximately)
/*!40000 ALTER TABLE `ttitulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ttitulos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tusosvehiculos
CREATE TABLE IF NOT EXISTS `tusosvehiculos` (
  `Id_nUsoVehiculo` smallint(4) NOT NULL,
  `nClasificacionTransporteUrbano` smallint(4) NOT NULL,
  `cUsoVehiculo` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`Id_nUsoVehiculo`),
  KEY `fk_ClaTuSer_idx` (`nClasificacionTransporteUrbano`),
  CONSTRAINT `fk_ClaTuSer` FOREIGN KEY (`nClasificacionTransporteUrbano`) REFERENCES `tclasificaciontu_servicio` (`id_nClasificacionTU_Servicio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tusosvehiculos: ~0 rows (approximately)
/*!40000 ALTER TABLE `tusosvehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tusosvehiculos` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tusuarios
CREATE TABLE IF NOT EXISTS `tusuarios` (
  `Id_Usuario` smallint(4) NOT NULL AUTO_INCREMENT,
  `id_Vista` smallint(4) NOT NULL DEFAULT 201,
  `id_TipoUsuario` smallint(4) NOT NULL,
  `nDNI` double NOT NULL,
  `NicknameU` varchar(80) NOT NULL,
  `PasswordU` varchar(100) NOT NULL,
  `Usuario_Activo` tinyint(4) DEFAULT NULL,
  `Utimestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_Vista`,`id_TipoUsuario`,`NicknameU`),
  UNIQUE KEY `idxUsuario` (`Id_Usuario`),
  KEY `idxTipoUsuario` (`id_TipoUsuario`),
  KEY `idxDniUsuario` (`nDNI`),
  KEY `idxVista` (`id_Vista`),
  CONSTRAINT `fk_DniUsuario` FOREIGN KEY (`nDNI`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TipoUsuario` FOREIGN KEY (`id_TipoUsuario`) REFERENCES `ttipousuarios` (`id_nTipoUsuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tusuarios: ~0 rows (approximately)
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tvehiculosdenunciaspoliciales
CREATE TABLE IF NOT EXISTS `tvehiculosdenunciaspoliciales` (
  `id_nVehiculoDelito` int(11) NOT NULL DEFAULT 0,
  `id_ConcurrenciaDelitos` int(11) NOT NULL DEFAULT 0,
  `nCalidadLegalVehiculo` smallint(4) NOT NULL DEFAULT 0,
  `cDominio` varchar(15) NOT NULL DEFAULT '0',
  `cMotor` varchar(255) NOT NULL DEFAULT '0',
  `cChasis` varchar(255) NOT NULL DEFAULT '',
  `nTMMV` double NOT NULL DEFAULT 0,
  `id_nPersonaDelito` int(11) NOT NULL DEFAULT 0 COMMENT 'Persona que tenía relación con este vehículo al momento del hecho. Por ejemplo Conductor. ',
  `nElemento` smallint(4) NOT NULL DEFAULT 242,
  `cCilindrada` varchar(10) DEFAULT '0',
  `nUsoVehiculo` smallint(4) NOT NULL DEFAULT 0,
  `nAñoFabricacionVehículo` smallint(4) DEFAULT 0,
  `nEstadoVehiculo` smallint(4) NOT NULL DEFAULT 0,
  `cColorVehiculo` smallint(4) DEFAULT 0,
  `nCantidadVehiculo` smallint(10) DEFAULT 1,
  `cOtraCaracteristicaVehiculo` varchar(255) DEFAULT NULL,
  `RecuperoPersonalPolicial` tinyint(4) DEFAULT NULL,
  `RecuperoPropietario` tinyint(4) DEFAULT NULL,
  `nPropietarioVehiculo` double(22,0) NOT NULL DEFAULT 0,
  `cNuevoDatoVehiculo` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`nCalidadLegalVehiculo`,`cDominio`,`cMotor`,`cChasis`,`id_ConcurrenciaDelitos`,`nTMMV`,`id_nPersonaDelito`) USING BTREE,
  UNIQUE KEY `idxVehiculoDelito` (`id_nVehiculoDelito`),
  KEY `idxElemento` (`nElemento`),
  KEY `idxCalidadVehiculo` (`nCalidadLegalVehiculo`),
  KEY `idxTipoMarcaModelo` (`nTMMV`),
  KEY `idxEstadoVehiculo` (`nEstadoVehiculo`),
  KEY `idxUsoVehiculo` (`nUsoVehiculo`),
  KEY `idxConcurrenciaDelitoVehiculo` (`id_ConcurrenciaDelitos`),
  KEY `idxTMMV` (`nTMMV`),
  KEY `idxRelacionPersona` (`id_nPersonaDelito`),
  KEY `idxPropietario` (`nPropietarioVehiculo`) USING BTREE,
  CONSTRAINT `fk_CaliadLegalVehiculo` FOREIGN KEY (`nCalidadLegalVehiculo`) REFERENCES `tcalidadeslegaleselementos` (`id_nCalidadElemento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_ConcurrenciaDelitoVehiculo` FOREIGN KEY (`id_ConcurrenciaDelitos`) REFERENCES `tdenunciaspolicialesconcurrenciadelitos` (`id_ConcurrenciaDelitos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EstadoVehiculo` FOREIGN KEY (`nEstadoVehiculo`) REFERENCES `testadoselementos` (`id_nEstadoElemento`) ON UPDATE CASCADE,
  CONSTRAINT `fk_PersonaRelacionada` FOREIGN KEY (`id_nPersonaDelito`) REFERENCES `tpersonasdenunciaspoliciales` (`id_nPersonaDelito`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Propietario` FOREIGN KEY (`nPropietarioVehiculo`) REFERENCES `tpersonas` (`nNroDocPersona`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TMMV` FOREIGN KEY (`nTMMV`) REFERENCES `tmodelosvehiculos` (`nTMMV`) ON UPDATE CASCADE,
  CONSTRAINT `fk_UsoVehiculos` FOREIGN KEY (`nUsoVehiculo`) REFERENCES `tusosvehiculos` (`Id_nUsoVehiculo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_VehiculosElementos` FOREIGN KEY (`nElemento`) REFERENCES `telementos` (`id_nElementos`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tvehiculosdenunciaspoliciales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tvehiculosdenunciaspoliciales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvehiculosdenunciaspoliciales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tvinculospersonales
CREATE TABLE IF NOT EXISTS `tvinculospersonales` (
  `id_Vinculo` tinyint(4) NOT NULL,
  `cVinculo` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`id_Vinculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table denunciasdb.tvinculospersonales: ~0 rows (approximately)
/*!40000 ALTER TABLE `tvinculospersonales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvinculospersonales` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tvistassistab
CREATE TABLE IF NOT EXISTS `tvistassistab` (
  `id_Vista` smallint(4) NOT NULL,
  `cVista` varchar(85) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id_Vista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- Dumping data for table denunciasdb.tvistassistab: ~0 rows (approximately)
/*!40000 ALTER TABLE `tvistassistab` DISABLE KEYS */;
/*!40000 ALTER TABLE `tvistassistab` ENABLE KEYS */;

-- Dumping structure for table denunciasdb.tzonas
CREATE TABLE IF NOT EXISTS `tzonas` (
  `id_Zona` smallint(4) NOT NULL DEFAULT 1,
  `cZona` varchar(50) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table denunciasdb.tzonas: ~0 rows (approximately)
/*!40000 ALTER TABLE `tzonas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tzonas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
