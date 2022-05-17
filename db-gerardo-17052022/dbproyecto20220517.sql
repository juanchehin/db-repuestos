-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: dbproyecto
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agentes`
--

DROP TABLE IF EXISTS `agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agentes` (
  `idAgente` int unsigned NOT NULL COMMENT 'Nº Agente Entidad',
  `ApellidoAgente` varchar(50) NOT NULL COMMENT 'Apellidos',
  `NombreAgente` varchar(50) NOT NULL COMMENT 'Nombres',
  `Taller` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Esta en Taller',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  `FechaGrab` datetime NOT NULL,
  `DescripcionUsuGra` varchar(50) NOT NULL,
  PRIMARY KEY (`idAgente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Agentes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agentes`
--

LOCK TABLES `agentes` WRITE;
/*!40000 ALTER TABLE `agentes` DISABLE KEYS */;
INSERT INTO `agentes` VALUES (1111,'Romero','Juan',0,1,'2021-11-13 18:28:59','ADMIN'),(2222,'Uro','Maria Ines',0,1,'2021-11-13 18:28:59','ADMIN'),(3333,'Romero','Florencia',1,1,'2021-11-13 18:28:59','ADMIN');
/*!40000 ALTER TABLE `agentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicaciones`
--

DROP TABLE IF EXISTS `aplicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicaciones` (
  `idAplicacion` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Aplicación',
  `idUnidad` int unsigned NOT NULL DEFAULT '1' COMMENT 'Nº Interno Unidad',
  `idRepuesto` int unsigned NOT NULL DEFAULT '1' COMMENT 'Cód. Interno Repuesto',
  `idMovUnidad` int unsigned NOT NULL DEFAULT '9999' COMMENT 'Nro. Movimiento de Unidad',
  `DesTipoAplicacion` int unsigned NOT NULL COMMENT '1:Fábrica  2:Proveedor  3:Taller  4:Consumo',
  `Aplicado` int unsigned NOT NULL DEFAULT '0' COMMENT '1: SI - 0: NO',
  `Observacion` varchar(250) DEFAULT NULL COMMENT 'Observaciones',
  `FechaGrab` datetime NOT NULL,
  `DesUsuGra` varchar(50) NOT NULL,
  `FechaApli` datetime DEFAULT NULL,
  `DesUsuApl` varchar(50) DEFAULT NULL,
  `FechaAnul` datetime DEFAULT NULL COMMENT 'Fecha Anulación de la aplicación de repuesto',
  `UsuAnuApl` varchar(50) DEFAULT NULL COMMENT 'Usuario que anuló la aplicación de repuesto',
  `DesMotAnu` varbinary(250) DEFAULT NULL COMMENT 'Motivo de anulación de la aplicación de repuesto',
  PRIMARY KEY (`idAplicacion`),
  UNIQUE KEY `nrointuni_codintrep` (`idUnidad`,`idRepuesto`,`idMovUnidad`),
  KEY `apl_unid` (`idUnidad`),
  KEY `apl_repu` (`idRepuesto`),
  KEY `apl_movuni_idx` (`idMovUnidad`),
  CONSTRAINT `apl_movuni` FOREIGN KEY (`idMovUnidad`) REFERENCES `movimientounidades` (`idMovUnidad`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `apl_repu` FOREIGN KEY (`idRepuesto`) REFERENCES `repuestos` (`idRepuesto`),
  CONSTRAINT `apl_unid` FOREIGN KEY (`idUnidad`) REFERENCES `unidades` (`idUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Tabla de Aplicaciones de Repuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicaciones`
--

LOCK TABLES `aplicaciones` WRITE;
/*!40000 ALTER TABLE `aplicaciones` DISABLE KEYS */;
INSERT INTO `aplicaciones` VALUES (18,2,1,3333,3,1,'aplicado con normalidad','2022-05-17 10:48:42','admin','2022-05-17 11:06:55','admin',NULL,NULL,NULL),(19,2,2,3333,3,0,'NULL','2022-05-17 10:48:42','admin',NULL,NULL,NULL,NULL,NULL),(20,3,3,3333,3,0,'NULL','2022-05-17 11:01:39','admin3',NULL,NULL,NULL,NULL,NULL),(21,3,4,3333,3,0,'NULL','2022-05-17 11:01:39','admin3',NULL,NULL,NULL,NULL,NULL),(22,3,8,3333,3,0,'NULL','2022-05-17 11:01:39','admin3',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `aplicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auxvalret`
--

DROP TABLE IF EXISTS `auxvalret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auxvalret` (
  `valret001` varchar(100) DEFAULT NULL COMMENT 'Tabla auxiliar que almacena información sobre las transacciones.',
  `valret002` varchar(100) DEFAULT NULL,
  `valret003` varchar(100) DEFAULT NULL,
  `valret004` varchar(100) DEFAULT NULL,
  `valret005` varchar(100) DEFAULT NULL,
  `valret006` varchar(100) DEFAULT NULL,
  `valret007` varchar(100) DEFAULT NULL,
  `valret008` varchar(100) DEFAULT NULL,
  `valret009` varchar(100) DEFAULT NULL,
  `valret010` varchar(100) DEFAULT NULL,
  `valret099` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auxvalret`
--

LOCK TABLES `auxvalret` WRITE;
/*!40000 ALTER TABLE `auxvalret` DISABLE KEYS */;
/*!40000 ALTER TABLE `auxvalret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoingresos`
--

DROP TABLE IF EXISTS `carritoingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoingresos` (
  `idCarritoIngresos` int unsigned NOT NULL AUTO_INCREMENT,
  `idRepuesto` int DEFAULT NULL,
  `DesRepuesto` varchar(45) DEFAULT NULL,
  `CantidadIngresada` decimal(10,2) DEFAULT NULL,
  `PrecioUnitario` decimal(10,2) DEFAULT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idCarritoIngresos`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoingresos`
--

LOCK TABLES `carritoingresos` WRITE;
/*!40000 ALTER TABLE `carritoingresos` DISABLE KEYS */;
INSERT INTO `carritoingresos` VALUES (24,1,'inyector diesel 3',30.00,150.00,1),(25,2,'inyector diesel 4',10.00,70.33,1);
/*!40000 ALTER TABLE `carritoingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoretiros`
--

DROP TABLE IF EXISTS `carritoretiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoretiros` (
  `idCarritoRetiros` int unsigned NOT NULL AUTO_INCREMENT,
  `idRepuesto` int DEFAULT NULL,
  `DesRepuesto` varchar(45) DEFAULT NULL,
  `CantidadSolicitada` decimal(10,2) DEFAULT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idCarritoRetiros`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoretiros`
--

LOCK TABLES `carritoretiros` WRITE;
/*!40000 ALTER TABLE `carritoretiros` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritoretiros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobantes`
--

DROP TABLE IF EXISTS `comprobantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobantes` (
  `idComprobante` int unsigned NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Abreviatura` varchar(6) NOT NULL,
  `Letra` char(1) NOT NULL,
  `EstadoMemFiscal` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Requiere Nº de Memoria Fiscal',
  `idCliente` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Requiere Identificación del Cliente',
  `DomiCliente` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Rquiere Domicilio del Cliente',
  `DocuCliente` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Requiere Documento del Cliente',
  `TipDocCliente` int unsigned NOT NULL COMMENT 'Tipo de Documento Requerido',
  `MiniCliente` int unsigned NOT NULL DEFAULT '0' COMMENT 'Monto Minimo para identificar cliente de manera obligatoria',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idComprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Comprobantes AFIP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobantes`
--

LOCK TABLES `comprobantes` WRITE;
/*!40000 ALTER TABLE `comprobantes` DISABLE KEYS */;
INSERT INTO `comprobantes` VALUES (0,'SIN DATOS','S/D','X',0,0,0,0,0,0,1),(1,'FACTURAS A','FAC','A',0,1,1,1,80,0,1),(2,'NOTAS DE DEBITO A','NDD','A',0,1,1,1,80,0,1),(3,'NOTAS DE CREDITO A','NDC','A',0,1,1,1,80,0,1),(4,'RECIBOS A','REC','A',0,1,1,1,80,0,0),(5,'NOTA DE VENTA AL CONTADO A','NVC','A',0,1,1,1,80,0,0),(6,'FACTURAS B','FAC','B',0,1,1,1,0,2000,1),(7,'NOTAS DE DEBITO B','NDD','B',0,1,1,1,0,2000,1),(8,'NOTAS DE CREDITO B','NDC','B',0,1,1,1,0,2000,1),(9,'RECIBOS B','REC','B',0,1,1,1,0,2000,0),(10,'NOTA DE VENTA AL CONTADO B','NVC','B',0,1,1,1,0,2000,0),(11,'FACTURAS C','FAC','C',0,1,1,1,0,2000,1),(12,'NOTAS DE DEBITO C','NDD','C',0,1,1,1,0,2000,1),(13,'NOTAS DE CREDITO C','NDC','C',0,1,1,1,0,2000,1),(15,'RECIBOS C','REC','C',0,1,1,1,0,2000,0),(16,'NOTA DE VENTA AL CONTADO C','NVC','C',0,1,1,1,0,2000,0),(51,'FACTURAS M','FAC','M',0,1,1,1,80,0,0),(52,'NOTAS DE DEBITO M','NDD','M',0,1,1,1,80,0,0),(53,'NOTAS DE CREDITO M','NDC','M',0,1,1,1,80,0,0),(54,'RECIBOS M','REC','M',0,1,1,1,80,0,0),(55,'NOTA DE VENTA AL CONTADO M','NVC','M',0,1,1,1,80,0,0),(80,'COMPROBANTE DIARIO DE CIERRE (ZETA)','ZET','',0,0,0,0,0,0,1),(81,'TIQUE FACTURA A','TIQ','A',1,1,1,1,80,0,1),(82,'TIQUE FACTURA B','TIQ','B',1,1,1,1,0,2000,1),(91,'REMITOS R','RTO','R',0,0,0,0,0,0,1),(996,'VARIOS X','VAR','X',0,0,0,0,0,0,1),(997,'NOTA DE DEBITO X','NDD','X',0,0,0,0,0,0,1),(998,'NOTA DE CREDITO X','NDC','X',0,0,0,0,0,0,1),(999,'RECIBO X','REC','X',0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `comprobantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `idGrupo` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Grupo',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción Grupos',
  `Estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idGrupo`),
  UNIQUE KEY `Descripcion_UNIQUE` (`Descripcion`),
  KEY `gru_rep` (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='Tabla de Grupos de Repuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'ELECTRICIDAD',1),(3,'NGK',1),(4,'FERRETERIA',1),(5,'TREN DELANTERO',1),(6,'TREN TRASERO',1),(7,'prueba',0),(8,'FRENOS',1),(9,'EMBRAGUE',1),(11,'NEUMATICOS',0),(12,'TUERCAS',1),(13,'FILTRITO',1),(14,'PERNOS',1),(15,'GOMERIA',1),(18,'LLANTAS',1),(19,'FAROS',1),(27,'PARAGOLPES',1),(31,'RETROVISOR',1),(33,'eeee',1),(35,'TURBITO',1),(36,'111',1),(37,'prueba222222',1),(38,'prueba2222',1),(44,'Ferreteria 2',1),(45,'grupo 45',1);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresocompra`
--

DROP TABLE IF EXISTS `ingresocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresocompra` (
  `idIngreso` int unsigned NOT NULL AUTO_INCREMENT,
  `FechaRecepcion` date NOT NULL COMMENT 'Fecha de Recepción',
  `idTipoCompra` int unsigned NOT NULL COMMENT '1: Caja Chica - 2: licitacion',
  `OrdenCompra` varchar(10) NOT NULL COMMENT 'N° Orden de compra',
  `NroExpCompra` varchar(20) NOT NULL COMMENT 'Nº de Expediente de la Compra',
  `idProveedor` int unsigned NOT NULL COMMENT 'Cód. Proveedor',
  `idComprobante` int unsigned NOT NULL COMMENT 'Cód. de Comprobante',
  `AbrCompro` char(3) NOT NULL COMMENT 'Abreviatura del Comprobante',
  `LetraComp` char(1) NOT NULL COMMENT 'Letra del Comprobante',
  `PtoVentaCom` int unsigned NOT NULL COMMENT 'Punto de Venta del Comprobante',
  `NroCompro` int unsigned NOT NULL COMMENT 'Nº del Comprobante',
  `PrecioTotal` decimal(10,2) NOT NULL,
  `Observaciones` varchar(250) NOT NULL COMMENT 'Observaciones',
  `EstadoSolicitud` int unsigned NOT NULL COMMENT '1:Activo 9:Anulado',
  `FechaGrab` datetime NOT NULL,
  `DesUsuGra` varchar(50) NOT NULL,
  `FechaAnul` datetime DEFAULT NULL,
  `DesUsuAnu` varchar(50) DEFAULT NULL,
  `DesMotAnu` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idIngreso`),
  KEY `cpa_prov` (`idProveedor`),
  KEY `cpa_comp` (`idComprobante`),
  KEY `cpa_tipc` (`idTipoCompra`),
  CONSTRAINT `cpa_comp` FOREIGN KEY (`idComprobante`) REFERENCES `comprobantes` (`idComprobante`),
  CONSTRAINT `cpa_prov` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`),
  CONSTRAINT `cpa_tipc` FOREIGN KEY (`idTipoCompra`) REFERENCES `tipocompras` (`idTipoCompra`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COMMENT='Tabla de Ingreso por Compras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresocompra`
--

LOCK TABLES `ingresocompra` WRITE;
/*!40000 ALTER TABLE `ingresocompra` DISABLE KEYS */;
INSERT INTO `ingresocompra` VALUES (3,'2022-03-01',1,'2313','21313',2,1,'FAC','A',1,1,0.00,'dfs',1,'2022-03-01 23:18:29','admin',NULL,NULL,NULL),(5,'2022-03-01',1,'2313','21313',2,1,'FAC','A',1,1,0.00,'dfs',1,'2022-03-01 23:20:53','admin',NULL,NULL,NULL),(6,'2022-03-01',1,'2313','21313',2,1,'FAC','A',1,1,0.00,'dfs',1,'2022-03-01 23:21:32','admin',NULL,NULL,NULL),(7,'2022-03-01',1,'2313','21313',2,1,'FAC','A',1,1,0.00,'dfs',1,'2022-03-01 23:23:22','admin',NULL,NULL,NULL),(8,'2022-03-01',1,'342523','324324',1,11,'FAC','C',1,32,0.00,'factu c',1,'2022-03-01 23:25:16','admin',NULL,NULL,NULL),(9,'2022-03-01',1,'342523','324324',1,11,'FAC','C',1,32,0.00,'factu c',1,'2022-03-01 23:25:54','admin',NULL,NULL,NULL),(10,'2022-03-01',2,'3424','2324',2,11,'FAC','C',1,2000,0.00,'prueba',1,'2022-03-01 23:26:56','admin',NULL,NULL,NULL),(11,'2022-03-01',1,'342523','324324',1,11,'FAC','C',1,32,0.00,'factu c',1,'2022-03-01 23:27:53','admin',NULL,NULL,NULL),(12,'2022-03-01',1,'342523','324324',1,11,'FAC','C',1,32,0.00,'factu c',1,'2022-03-01 23:28:15','admin',NULL,NULL,NULL),(13,'2022-03-01',1,'342523','324324',1,11,'FAC','C',1,32,0.00,'factu c',1,'2022-03-01 23:30:03','admin',NULL,NULL,NULL),(14,'2022-03-01',1,'342523','324324',1,11,'FAC','C',1,32,0.00,'factu c',1,'2022-03-01 23:31:42','admin',NULL,NULL,NULL),(15,'2022-03-01',2,'3424','2324',2,11,'FAC','C',1,2000,0.00,'prueba',1,'2022-03-01 23:32:22','admin',NULL,NULL,NULL),(16,'2022-03-01',1,'342523','324324',1,11,'FAC','C',1,32,0.00,'factu c',1,'2022-03-01 23:35:43','admin',NULL,NULL,NULL),(17,'2022-03-03',1,'23213','23323',2,11,'FAC','C',1,345,0.00,'prueba',9,'2022-03-03 11:49:51','admin','2022-03-03 12:34:46','admin2','por error'),(18,'2022-03-20',1,'2321','21313L',1,11,'FAC','C',1,18,0.00,'prueba',1,'2022-03-20 10:07:17','admin',NULL,NULL,NULL),(19,'2022-03-20',1,'3243','L324234',2,80,'ZET','',1,18,0.00,'',1,'2022-03-20 11:58:34','admin',NULL,NULL,NULL),(20,'2022-03-20',1,'324fds3','L324ds234',2,11,'FAC','C',1,36,0.00,'',1,'2022-03-20 11:59:37','admin',NULL,NULL,NULL),(21,'2022-03-20',1,'324fds3','L324ds234',2,11,'FAC','C',1,36,0.00,'',1,'2022-03-20 12:00:08','admin',NULL,NULL,NULL),(23,'2022-03-20',1,'35435','543',2,11,'FAC','C',1,18,0.00,'undefined',1,'2022-03-20 21:34:22','undefined',NULL,NULL,NULL),(24,'2022-03-20',1,'35435','543',2,11,'FAC','C',1,18,0.00,'undefined',1,'2022-03-20 21:35:11','undefined',NULL,NULL,NULL),(25,'2022-03-20',1,'35435','543',2,11,'FAC','C',1,18,0.00,'undefined',1,'2022-03-20 21:35:47','undefined',NULL,NULL,NULL),(26,'2022-03-20',1,'35435','543',2,11,'FAC','C',1,18,0.00,'undefined',1,'2022-03-20 21:35:47','undefined',NULL,NULL,NULL),(27,'2022-03-20',1,'35435','543',2,11,'FAC','C',1,18,0.00,'undefined',1,'2022-03-20 21:35:48','undefined',NULL,NULL,NULL),(28,'2022-03-20',1,'35435','543',2,11,'FAC','C',1,18,0.00,'undefined',1,'2022-03-20 21:36:42','undefined',NULL,NULL,NULL),(29,'2022-03-20',1,'35435','543',2,11,'FAC','C',1,18,0.00,'undefined',1,'2022-03-20 21:36:43','undefined',NULL,NULL,NULL),(30,'2022-03-20',1,'2133','2313',2,11,'FAC','C',123,1,0.00,'undefined',1,'2022-03-20 21:55:36','undefined',NULL,NULL,NULL),(31,'2022-03-20',1,'1','1',2,1,'FAC','A',1,1,0.00,'undefined',1,'2022-03-20 21:58:26','',NULL,NULL,NULL),(32,'2022-03-20',1,'1','1',2,11,'FAC','C',1,1,0.00,'undefined',1,'2022-03-20 22:00:36','admin',NULL,NULL,NULL),(33,'2022-03-24',1,'1','1231',1,11,'FAC','C',1,1,0.00,'undefined',1,'2022-03-24 10:06:59','admin',NULL,NULL,NULL),(34,'2022-03-24',1,'1','111',2,11,'FAC','C',1,2,0.00,'undefined',1,'2022-03-24 10:11:15','admin',NULL,NULL,NULL),(35,'2022-03-24',1,'1','1',2,11,'FAC','C',1,3,0.00,'undefined',1,'2022-03-24 10:16:08','admin',NULL,NULL,NULL),(36,'2022-03-24',1,'1','11213',2,11,'FAC','C',1,20,0.00,'undefined',1,'2022-03-24 10:18:54','admin',NULL,NULL,NULL),(37,'2022-03-24',1,'1','123213',2,11,'FAC','C',1,33,0.00,'undefined',1,'2022-03-24 10:21:49','admin',NULL,NULL,NULL),(38,'2022-03-24',1,'123','2131',2,11,'FAC','C',1,123,0.00,'undefined',1,'2022-03-24 10:25:08','admin',NULL,NULL,NULL),(43,'2022-05-11',1,'232','l3000',2,11,'FAC','C',1,1,0.00,'prueba',1,'2022-05-11 11:01:35','admin',NULL,NULL,NULL),(50,'2022-05-11',1,'232','l3000',2,11,'FAC','C',1,1,0.00,'prueba',1,'2022-05-11 11:12:22','admin',NULL,NULL,NULL),(51,'2022-05-11',1,'232','l3000',2,11,'FAC','C',1,1,0.00,'prueba',1,'2022-05-11 11:16:57','admin',NULL,NULL,NULL),(52,'2022-05-11',1,'232','l3000',2,11,'FAC','C',1,1,0.00,'prueba',1,'2022-05-11 11:17:34','admin',NULL,NULL,NULL),(53,'2022-05-11',1,'2222','l4000',2,11,'FAC','C',1,123,0.00,'prueba2',1,'2022-05-11 11:20:44','admin',NULL,NULL,NULL),(56,'2022-05-11',1,'2222','l4000',2,11,'FAC','C',1,123,0.00,'prueba2',1,'2022-05-11 11:27:10','admin',NULL,NULL,NULL),(57,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 11:31:01','admin',NULL,NULL,NULL),(58,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 11:32:32','admin',NULL,NULL,NULL),(59,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 11:32:53','admin',NULL,NULL,NULL),(60,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 11:38:02','admin',NULL,NULL,NULL),(61,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',9,'2022-05-11 11:39:41','admin','2022-05-11 12:46:25','admin','por error'),(62,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:02:49','admin',NULL,NULL,NULL),(63,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:27','admin',NULL,NULL,NULL),(64,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:39','admin',NULL,NULL,NULL),(65,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:40','admin',NULL,NULL,NULL),(66,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:40','admin',NULL,NULL,NULL),(67,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:40','admin',NULL,NULL,NULL),(68,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:41','admin',NULL,NULL,NULL),(69,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:42','admin',NULL,NULL,NULL),(70,'2022-05-11',1,'444','555',2,11,'FAC','C',2,22,0.00,'prueba3',1,'2022-05-11 12:03:42','admin',NULL,NULL,NULL),(71,'2022-05-11',2,'333','EFE300',1,11,'FAC','C',11,1231,0.00,'PRU',1,'2022-05-11 12:37:16','admin',NULL,NULL,NULL),(72,'2022-05-16',1,'333','33',2,11,'FAC','C',1,12,0.00,'prueba',1,'2022-05-16 17:44:51','admin',NULL,NULL,NULL),(73,'2022-05-17',1,'372022','24324',2,11,'FAC','C',1,124,0.00,'prueba',1,'2022-05-17 08:45:21','admin',NULL,NULL,NULL),(74,'2022-05-17',1,'123','wrewr33',2,11,'FAC','C',12,123,0.00,'prueba',1,'2022-05-17 08:56:03','admin',NULL,NULL,NULL),(75,'2022-05-17',1,'1233','wrewr333',2,11,'FAC','C',12,123,0.00,'prueba',1,'2022-05-17 08:58:24','admin',NULL,NULL,NULL),(76,'2022-05-17',1,'12344','2432e',2,11,'FAC','C',10,100,0.00,'prueba',1,'2022-05-17 09:00:49','admin',NULL,NULL,NULL),(77,'2022-05-17',1,'3424','23434',2,11,'FAC','C',12,1234,0.00,'prueba',1,'2022-05-17 09:36:39','admin',NULL,NULL,NULL),(78,'2022-05-17',1,'3242','3242',2,11,'FAC','C',1,12,0.00,'prueba',1,'2022-05-17 09:39:57','admin',NULL,NULL,NULL),(79,'2022-05-17',1,'3242','3242',2,11,'FAC','C',1,12,0.00,'prueba',1,'2022-05-17 09:42:35','admin',NULL,NULL,NULL),(80,'2022-05-17',1,'3242','3242',2,11,'FAC','C',1,12,0.00,'prueba',1,'2022-05-17 09:43:39','admin',NULL,NULL,NULL),(81,'2022-05-17',1,'3242','3242',2,11,'FAC','C',1,12,5203.30,'prueba',1,'2022-05-17 09:45:56','admin',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ingresocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineasingresocompra`
--

DROP TABLE IF EXISTS `lineasingresocompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineasingresocompra` (
  `idIngreso` int unsigned NOT NULL COMMENT 'Nº Interno de Ingreso',
  `NroIteracion` int unsigned NOT NULL COMMENT 'Nº de Item Iteración',
  `idRepuesto` int unsigned NOT NULL COMMENT 'Cód. Interno de Repuesto',
  `DesRepuesto` varchar(100) NOT NULL COMMENT 'Descripcion del Repuesto',
  `CantidadRecibida` decimal(10,2) unsigned NOT NULL COMMENT 'Nº de Unidades Recibidas',
  `BanActStock` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Actualiza Stock',
  `PrecioUnitario` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idIngreso`,`NroIteracion`),
  KEY `lcpa_rep` (`idRepuesto`),
  CONSTRAINT `lcpa_cpa` FOREIGN KEY (`idIngreso`) REFERENCES `ingresocompra` (`idIngreso`),
  CONSTRAINT `lcpa_rep` FOREIGN KEY (`idRepuesto`) REFERENCES `repuestos` (`idRepuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Detalle de Ingreso de Compras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineasingresocompra`
--

LOCK TABLES `lineasingresocompra` WRITE;
/*!40000 ALTER TABLE `lineasingresocompra` DISABLE KEYS */;
INSERT INTO `lineasingresocompra` VALUES (5,1,1,'inyector diesel3',5.00,0,0.00,0.00),(6,1,1,'inyector diesel3',5.00,0,0.00,0.00),(7,1,1,'inyector diesel3',5.00,0,0.00,0.00),(8,1,1,'inyector diesel3',5.00,0,0.00,0.00),(9,1,1,'inyector diesel3',5.00,0,0.00,0.00),(10,1,1,'inyector diesel3',5.00,0,0.00,0.00),(11,1,1,'inyector diesel3',5.00,0,0.00,0.00),(12,1,1,'inyector diesel3',5.00,0,0.00,0.00),(13,1,1,'inyector diesel3',5.00,0,0.00,0.00),(14,1,1,'inyector diesel3',5.00,1,0.00,0.00),(15,1,1,'inyector diesel3',5.00,1,0.00,0.00),(16,1,1,'inyector diesel3',5.00,1,0.00,0.00),(17,1,2,'reten',20.00,1,0.00,0.00),(18,1,2,'reten',13.00,1,0.00,0.00),(19,1,2,'reten',13.00,1,0.00,0.00),(28,1,1,'diesel inyector3',10.00,1,0.00,0.00),(28,2,2,'retein',15.00,1,0.00,0.00),(29,1,2,'retein',15.00,1,0.00,0.00),(30,1,2,'retein',15.00,1,0.00,0.00),(31,1,2,'retein',15.00,1,0.00,0.00),(32,1,2,'retein',15.00,1,0.00,0.00),(33,1,1,'inyector diesel3',1.00,1,0.00,0.00),(33,2,5,'prueba2',1.00,1,0.00,0.00),(33,3,10,'prueba',1.00,1,0.00,0.00),(34,1,1,'inyector diesel3',1.00,1,0.00,0.00),(35,1,2,'reten',1.00,1,0.00,0.00),(36,1,1,'inyector diesel3',1.00,1,0.00,0.00),(37,1,2,'reten',1.00,1,0.00,0.00),(37,2,5,'prueba2',1.00,1,0.00,0.00),(38,1,1,'inyector diesel3',1.00,1,0.00,0.00),(50,1,1,'inyector diesel3',10.00,0,120.00,1200.00),(51,1,1,'inyector diesel3',10.00,0,120.00,1200.00),(52,1,1,'inyector diesel3',10.00,1,120.00,1200.00),(53,1,1,'inyector diesel3',10.00,1,120.00,1200.00),(56,1,1,'inyector diesel3',10.00,1,120.00,1200.00),(57,1,1,'inyector diesel3',10.00,1,120.00,1200.00),(58,1,1,'inyector diesel3',10.00,1,120.00,1200.00),(59,1,1,'inyector diesel3',10.00,1,120.00,1200.00),(60,1,1,'inyector diesel3',10.00,1,120.00,1200.00),(61,1,1,'inyector 1',20.00,1,130.00,2600.00),(61,2,2,'inyector 2',30.00,1,150.00,4500.00),(71,1,1,'inyector diesel 3',40.00,1,180.00,7200.00),(71,2,2,'inyector diesel 4',40.00,1,180.30,7212.00),(72,1,1,'inyector diesel 3',40.00,1,180.00,7200.00),(72,2,2,'inyector diesel 4',40.00,1,180.30,7212.00),(73,1,1,'inyector diesel 3',20.00,1,100.00,2000.00),(73,2,2,'inyector diesel 4',10.00,1,50.33,503.30),(74,1,1,'inyector diesel 3',20.00,1,100.00,2000.00),(74,2,2,'inyector diesel 4',10.00,1,50.33,503.30),(75,1,1,'inyector diesel 3',30.00,1,150.00,4500.00),(75,2,2,'inyector diesel 4',10.00,1,70.33,703.30),(76,1,1,'inyector diesel 3',30.00,1,150.00,4500.00),(76,2,2,'inyector diesel 4',10.00,1,70.33,703.30),(77,1,1,'inyector diesel 3',30.00,1,150.00,4500.00),(77,2,2,'inyector diesel 4',10.00,1,70.33,703.30),(78,1,1,'inyector diesel 3',30.00,1,150.00,4500.00),(78,2,2,'inyector diesel 4',10.00,1,70.33,703.30),(79,1,1,'inyector diesel 3',30.00,1,150.00,4500.00),(79,2,2,'inyector diesel 4',10.00,1,70.33,703.30),(80,1,1,'inyector diesel 3',30.00,1,150.00,4500.00),(80,2,2,'inyector diesel 4',10.00,1,70.33,703.30),(81,1,1,'inyector diesel 3',30.00,1,150.00,4500.00),(81,2,2,'inyector diesel 4',10.00,1,70.33,703.30);
/*!40000 ALTER TABLE `lineasingresocompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineasretirorepuestos`
--

DROP TABLE IF EXISTS `lineasretirorepuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineasretirorepuestos` (
  `idRetiro` int unsigned NOT NULL COMMENT 'Nº Interno de Retiro',
  `NroIteracion` int unsigned NOT NULL COMMENT 'Nº de Item Solicitado en Iteración',
  `idRepuesto` int unsigned NOT NULL COMMENT 'Cód. Interno del Artículo',
  `DesRepuesto` varchar(100) NOT NULL COMMENT 'Descripción del Artículo',
  `CantidadSolicitada` decimal(10,1) unsigned NOT NULL COMMENT 'Cantidad Solicitada',
  `BanActStock` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Actualiza Stock',
  PRIMARY KEY (`idRetiro`,`NroIteracion`),
  KEY `lret_rep` (`idRepuesto`),
  CONSTRAINT `lret_rep` FOREIGN KEY (`idRepuesto`) REFERENCES `repuestos` (`idRepuesto`),
  CONSTRAINT `lret_ret` FOREIGN KEY (`idRetiro`) REFERENCES `retirorepuestos` (`idRetiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lineas de Retiro de Repuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineasretirorepuestos`
--

LOCK TABLES `lineasretirorepuestos` WRITE;
/*!40000 ALTER TABLE `lineasretirorepuestos` DISABLE KEYS */;
INSERT INTO `lineasretirorepuestos` VALUES (45,1,1,'inyector diesel3',10.0,1),(45,2,2,'reten',5.0,1),(47,1,1,'inyector diesel3',10.0,1),(47,2,2,'reten',5.0,1),(48,1,1,'inyector diesel3',10.0,1),(48,2,2,'reten',5.0,1),(49,1,1,'inyector diesel3',10.0,1),(49,2,2,'reten',5.0,1),(50,1,1,'inyector diesel3',1.0,1),(50,2,2,'reten',1.0,1),(51,1,1,'inyector diesel3',12.0,1),(51,2,2,'reten',20.0,1),(52,1,2,'reten',10.0,1),(53,1,3,'tuerca',20.0,1),(53,2,1,'inyector diesel3',1.0,1),(53,3,2,'reten',6.0,1),(55,1,1,'inyector diesel 3',10.0,1),(56,1,1,'inyector diesel3',10.0,1),(56,2,2,'reten',20.0,1),(57,1,1,'inyector diesel3',5.0,1),(57,2,2,'reten',7.0,1),(58,1,3,'tuerca',5.0,1),(58,2,4,'AMORTIGUADOR',10.0,1),(58,3,8,'tornillo',7.0,1);
/*!40000 ALTER TABLE `lineasretirorepuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcarepuestos`
--

DROP TABLE IF EXISTS `marcarepuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcarepuestos` (
  `idMarcaRepuesto` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Marca de Repuesto',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción Marca de Repuestos',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idMarcaRepuesto`),
  UNIQUE KEY `desMarRep` (`Descripcion`),
  KEY `mrep_rep` (`idMarcaRepuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Tabla de Marcas de Repuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcarepuestos`
--

LOCK TABLES `marcarepuestos` WRITE;
/*!40000 ALTER TABLE `marcarepuestos` DISABLE KEYS */;
INSERT INTO `marcarepuestos` VALUES (1,'NGK',1),(2,'PIRELLI',1),(4,'YOKO',1),(6,'KUMHO',1),(13,'fe',1),(14,'DHL',1),(18,'eee',1),(19,'YAMAHA',1),(22,'YAMAHA2',1),(23,'YAMAHA3',1),(24,'pruebita',1),(25,'pruebita2',1),(26,'pruebita3',1),(27,'prueba4',1),(28,'prueba5',1),(29,'17',1);
/*!40000 ALTER TABLE `marcarepuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcaunidades`
--

DROP TABLE IF EXISTS `marcaunidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcaunidades` (
  `idMarcaUnidad` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Marca de Unidad',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idMarcaUnidad`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Tabla de Marcas de Unidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcaunidades`
--

LOCK TABLES `marcaunidades` WRITE;
/*!40000 ALTER TABLE `marcaunidades` DISABLE KEYS */;
INSERT INTO `marcaunidades` VALUES (1,'SIN MARCA',1),(2,'TOYOTA',1),(3,'FORD',1),(4,'CHEVROLET',1),(5,'VOLVO',1),(6,'MERCDES BENZ',1),(7,'VOLKSWAGEN',1),(12,'IVECO',1),(13,'AUDI',1),(14,'CATERPILLAR',1),(15,'FIAT',1),(16,'FREMEC',1),(17,'GM',1),(21,'pruebita',1);
/*!40000 ALTER TABLE `marcaunidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelounidades`
--

DROP TABLE IF EXISTS `modelounidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelounidades` (
  `idMarcaUnidad` int unsigned NOT NULL COMMENT 'Cod. Interno de Marca',
  `idModeloUnidad` int unsigned NOT NULL COMMENT 'Código de Modelo',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idMarcaUnidad`,`idModeloUnidad`),
  CONSTRAINT `mod_mar` FOREIGN KEY (`idMarcaUnidad`) REFERENCES `marcaunidades` (`idMarcaUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Modelos de Unidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelounidades`
--

LOCK TABLES `modelounidades` WRITE;
/*!40000 ALTER TABLE `modelounidades` DISABLE KEYS */;
INSERT INTO `modelounidades` VALUES (1,1,'SIN MODELO',1),(2,1,'SIN MODELO',1),(2,2,'HILUX 4X2',1),(2,3,'HILUX 4X4',1),(3,1,'SIN MODELO',1),(3,2,'RANGER',1),(3,3,'CARGO',1),(3,4,'CARGO 1722',1),(4,1,'SIN MODELO',1),(4,2,'S10 4X4',1),(6,1,'SIN MODELO',1),(6,2,'1624',1),(6,3,'1318',1),(7,1,'SIN MODELO',1),(12,1,'SIN MODELO',1),(13,1,'SIN MODELO',1),(14,1,'SIN MODELO',1),(15,1,'SIN MODELO',1),(16,1,'SIN MODELO',1),(17,1,'SIN MODELO',1),(17,2,'11',1);
/*!40000 ALTER TABLE `modelounidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientorepuestos`
--

DROP TABLE IF EXISTS `movimientorepuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientorepuestos` (
  `idNroMov` int unsigned NOT NULL AUTO_INCREMENT,
  `FecMovStock` date NOT NULL COMMENT 'Fecha del Movimiento',
  `idRepuesto` int unsigned NOT NULL COMMENT 'Código Int del Repuesto',
  `idOpeStock` int unsigned NOT NULL COMMENT 'Código Operación Stock',
  `NroCantMov` decimal(10,2) unsigned DEFAULT NULL COMMENT 'Nº de Unidades',
  `Comprobante` varchar(19) DEFAULT NULL COMMENT 'Comprobante de Referencia',
  `SignoOperacion` char(1) DEFAULT NULL COMMENT 'Signo de la Operación (+  -  R)',
  `idProveedor` int unsigned NOT NULL DEFAULT '1' COMMENT 'Cód. Proveedor',
  `RefOperacion` int unsigned DEFAULT NULL COMMENT 'Nº de Referencia',
  `ComentOperacion` varchar(254) DEFAULT NULL COMMENT 'Comentario de la Operación',
  `FechaGrab` datetime DEFAULT NULL,
  `DesUsuGra` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idNroMov`),
  KEY `srep_rep` (`idRepuesto`),
  KEY `srep_prov` (`idProveedor`),
  KEY `srep_oper` (`idOpeStock`),
  CONSTRAINT `srep_oper` FOREIGN KEY (`idOpeStock`) REFERENCES `operacionstocks` (`idOpeStock`),
  CONSTRAINT `srep_prov` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`),
  CONSTRAINT `srep_rep` FOREIGN KEY (`idRepuesto`) REFERENCES `repuestos` (`idRepuesto`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8 COMMENT='Movimientos de Repuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientorepuestos`
--

LOCK TABLES `movimientorepuestos` WRITE;
/*!40000 ALTER TABLE `movimientorepuestos` DISABLE KEYS */;
INSERT INTO `movimientorepuestos` VALUES (131,'2022-05-11',1,100,10.00,'ING Nº 0000000043','+',2,43,'INGRESO POR COMPRA','2022-05-11 11:01:35','admin'),(132,'2022-05-11',1,100,10.00,'ING Nº 0000000050','+',2,50,'INGRESO POR COMPRA','2022-05-11 11:12:22','admin'),(133,'2022-05-11',1,100,10.00,'ING Nº 0000000051','+',2,51,'INGRESO POR COMPRA','2022-05-11 11:16:57','admin'),(134,'2022-05-11',1,100,10.00,'ING Nº 0000000052','+',2,52,'INGRESO POR COMPRA','2022-05-11 11:17:34','admin'),(135,'2022-05-11',1,100,10.00,'ING Nº 0000000053','+',2,53,'INGRESO POR COMPRA','2022-05-11 11:20:44','admin'),(136,'2022-05-11',1,100,10.00,'ING Nº 0000000056','+',2,56,'INGRESO POR COMPRA','2022-05-11 11:27:10','admin'),(137,'2022-05-11',1,100,10.00,'ING Nº 0000000057','+',2,57,'INGRESO POR COMPRA','2022-05-11 11:31:01','admin'),(138,'2022-05-11',1,100,10.00,'ING Nº 0000000058','+',2,58,'INGRESO POR COMPRA','2022-05-11 11:32:32','admin'),(139,'2022-05-11',1,100,10.00,'ING Nº 0000000059','+',2,59,'INGRESO POR COMPRA','2022-05-11 11:32:53','admin'),(140,'2022-05-11',1,100,10.00,'ING Nº 0000000060','+',2,60,'INGRESO POR COMPRA','2022-05-11 11:38:02','admin'),(141,'2022-05-11',1,100,20.00,'ING Nº 0000000061','+',2,61,'INGRESO POR COMPRA','2022-05-11 11:39:41','admin'),(142,'2022-05-11',2,100,30.00,'ING Nº 0000000061','+',2,61,'INGRESO POR COMPRA','2022-05-11 11:39:41','admin'),(143,'2022-05-11',38,1,200.00,'0','',1,0,'ALTA DEL REPUESTO','2022-05-11 12:24:40','admin'),(144,'2022-05-11',1,100,40.00,'ING Nº 0000000071','+',1,71,'INGRESO POR COMPRA','2022-05-11 12:37:16','admin'),(145,'2022-05-11',2,100,40.00,'ING Nº 0000000071','+',1,71,'INGRESO POR COMPRA','2022-05-11 12:37:16','admin'),(146,'2022-05-11',1,200,20.00,'ING Nº 0000000061','-',2,61,'ANULACION INGRESO POR COMPRA','2022-05-11 12:46:25','admin'),(147,'2022-05-11',2,200,30.00,'ING Nº 0000000061','-',2,61,'ANULACION INGRESO POR COMPRA','2022-05-11 12:46:25','admin'),(148,'2022-05-11',1,101,10.00,'RET Nº 0000000055','-',1,0,'RETIRO DE ARTICULOS','2022-05-11 12:54:59','admin'),(149,'2022-05-16',1,100,40.00,'ING Nº 0000000072','+',2,72,'INGRESO POR COMPRA','2022-05-16 17:44:52','admin'),(150,'2022-05-16',2,100,40.00,'ING Nº 0000000072','+',2,72,'INGRESO POR COMPRA','2022-05-16 17:44:52','admin'),(151,'2022-05-17',1,100,20.00,'ING Nº 0000000073','+',2,73,'INGRESO POR COMPRA','2022-05-17 08:45:21','admin'),(152,'2022-05-17',2,100,10.00,'ING Nº 0000000073','+',2,73,'INGRESO POR COMPRA','2022-05-17 08:45:21','admin'),(153,'2022-05-17',1,100,20.00,'ING Nº 0000000074','+',2,74,'INGRESO POR COMPRA','2022-05-17 08:56:03','admin'),(154,'2022-05-17',2,100,10.00,'ING Nº 0000000074','+',2,74,'INGRESO POR COMPRA','2022-05-17 08:56:03','admin'),(155,'2022-05-17',1,100,30.00,'ING Nº 0000000075','+',2,75,'INGRESO POR COMPRA','2022-05-17 08:58:25','admin'),(156,'2022-05-17',2,100,10.00,'ING Nº 0000000075','+',2,75,'INGRESO POR COMPRA','2022-05-17 08:58:25','admin'),(157,'2022-05-17',1,100,30.00,'ING Nº 0000000076','+',2,76,'INGRESO POR COMPRA','2022-05-17 09:00:50','admin'),(158,'2022-05-17',2,100,10.00,'ING Nº 0000000076','+',2,76,'INGRESO POR COMPRA','2022-05-17 09:00:50','admin'),(159,'2022-05-17',1,100,30.00,'ING Nº 0000000077','+',2,77,'INGRESO POR COMPRA','2022-05-17 09:36:39','admin'),(160,'2022-05-17',2,100,10.00,'ING Nº 0000000077','+',2,77,'INGRESO POR COMPRA','2022-05-17 09:36:39','admin'),(161,'2022-05-17',1,100,30.00,'ING Nº 0000000078','+',2,78,'INGRESO POR COMPRA','2022-05-17 09:39:57','admin'),(162,'2022-05-17',2,100,10.00,'ING Nº 0000000078','+',2,78,'INGRESO POR COMPRA','2022-05-17 09:39:57','admin'),(163,'2022-05-17',1,100,30.00,'ING Nº 0000000079','+',2,79,'INGRESO POR COMPRA','2022-05-17 09:42:35','admin'),(164,'2022-05-17',2,100,10.00,'ING Nº 0000000079','+',2,79,'INGRESO POR COMPRA','2022-05-17 09:42:35','admin'),(165,'2022-05-17',1,100,30.00,'ING Nº 0000000080','+',2,80,'INGRESO POR COMPRA','2022-05-17 09:43:39','admin'),(166,'2022-05-17',2,100,10.00,'ING Nº 0000000080','+',2,80,'INGRESO POR COMPRA','2022-05-17 09:43:40','admin'),(167,'2022-05-17',1,100,30.00,'ING Nº 0000000081','+',2,81,'INGRESO POR COMPRA','2022-05-17 09:45:56','admin'),(168,'2022-05-17',2,100,10.00,'ING Nº 0000000081','+',2,81,'INGRESO POR COMPRA','2022-05-17 09:45:56','admin'),(169,'2022-05-17',1,101,10.00,'RET Nº 0000000056','-',1,0,'RETIRO DE ARTICULOS','2022-05-17 10:29:46','admin'),(170,'2022-05-17',2,101,20.00,'RET Nº 0000000056','-',1,0,'RETIRO DE ARTICULOS','2022-05-17 10:29:46','admin'),(171,'2022-05-17',1,101,5.00,'RET Nº 0000000057','-',1,0,'RETIRO DE ARTICULOS','2022-05-17 10:33:05','admin'),(172,'2022-05-17',2,101,7.00,'RET Nº 0000000057','-',1,0,'RETIRO DE ARTICULOS','2022-05-17 10:33:05','admin'),(173,'2022-05-17',3,101,5.00,'RET Nº 0000000058','-',1,0,'RETIRO DE ARTICULOS','2022-05-17 10:58:55','admin'),(174,'2022-05-17',4,101,10.00,'RET Nº 0000000058','-',1,0,'RETIRO DE ARTICULOS','2022-05-17 10:58:55','admin'),(175,'2022-05-17',8,101,7.00,'RET Nº 0000000058','-',1,0,'RETIRO DE ARTICULOS','2022-05-17 10:58:55','admin'),(176,'2022-05-17',3,201,5.00,'RET Nº 0000000058','+',1,0,'ANULACION RETIRO DE ARTICULOS','2022-05-17 11:02:54','admin'),(177,'2022-05-17',4,201,10.00,'RET Nº 0000000058','+',1,0,'ANULACION RETIRO DE ARTICULOS','2022-05-17 11:02:54','admin'),(178,'2022-05-17',8,201,7.00,'RET Nº 0000000058','+',1,0,'ANULACION RETIRO DE ARTICULOS','2022-05-17 11:02:54','admin');
/*!40000 ALTER TABLE `movimientorepuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientounidades`
--

DROP TABLE IF EXISTS `movimientounidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientounidades` (
  `idMovUnidad` int unsigned NOT NULL AUTO_INCREMENT,
  `idUnidad` int unsigned NOT NULL COMMENT 'Nº Interno de Unidad',
  `idAgenteIngreso` int unsigned NOT NULL COMMENT 'Nº Agente que Ingreso la unidad',
  `FechaIngresoUnidad` datetime NOT NULL COMMENT 'Fecha de Ingreso de la unidad',
  `DesMotivoFalla` varchar(250) NOT NULL COMMENT 'Descripcion de la Falla por la que Ingreso la unidad',
  `idSeccion` int unsigned NOT NULL COMMENT 'Sección a la que fue enviada la unidad',
  `DesSeccion` varchar(50) NOT NULL,
  `DesUsuIng` varchar(50) NOT NULL COMMENT 'Usuario que Registro el Ingreso',
  `idAgenteRetiro` int DEFAULT NULL COMMENT 'Nº Legajo Personal que Retiro la unidad',
  `FechaRetiraUnidad` datetime DEFAULT NULL COMMENT 'Fecha de Salida de la unidad',
  `DesUsuRet` varchar(50) DEFAULT NULL COMMENT 'Usuario que Registro la Salida',
  `FecAnuMov` datetime DEFAULT NULL COMMENT 'Fecha de Anulación del Movimiento',
  `DesUsuAnu` varchar(50) DEFAULT NULL COMMENT 'Usuario que Anulo la Operación',
  `DesMotAnu` varchar(250) DEFAULT NULL COMMENT 'Motivo de la Anulación del Movimiento',
  `Estado` int NOT NULL COMMENT '1:En Taller  2:Reparada  3:Retirada  9:Anulado',
  PRIMARY KEY (`idMovUnidad`),
  KEY `muni_uni` (`idUnidad`),
  KEY `muni_agei` (`idAgenteIngreso`),
  KEY `muni_sec` (`idSeccion`),
  KEY `muni_ager` (`idAgenteRetiro`),
  CONSTRAINT `muni_agei` FOREIGN KEY (`idAgenteIngreso`) REFERENCES `agentes` (`idAgente`),
  CONSTRAINT `muni_sec` FOREIGN KEY (`idSeccion`) REFERENCES `secciones` (`idSeccion`),
  CONSTRAINT `muni_uni` FOREIGN KEY (`idUnidad`) REFERENCES `unidades` (`idUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3334 DEFAULT CHARSET=utf8 COMMENT='Tabla seguimiento Ingresos y Egresos de Unidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientounidades`
--

LOCK TABLES `movimientounidades` WRITE;
/*!40000 ALTER TABLE `movimientounidades` DISABLE KEYS */;
INSERT INTO `movimientounidades` VALUES (3333,2,1111,'2011-11-11 00:00:00','por rotura',1007,'CHAPA Y PINTURA','jose',NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `movimientounidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacionstocks`
--

DROP TABLE IF EXISTS `operacionstocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacionstocks` (
  `idOpeStock` int unsigned NOT NULL COMMENT '1-99 Operación Base y >=100 Operación Movimientos',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción de la Operación',
  `Abreviatura` varchar(12) NOT NULL COMMENT 'Abreviatura de la Operación',
  PRIMARY KEY (`idOpeStock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Operaciones de Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacionstocks`
--

LOCK TABLES `operacionstocks` WRITE;
/*!40000 ALTER TABLE `operacionstocks` DISABLE KEYS */;
INSERT INTO `operacionstocks` VALUES (1,'ALTA DEL REPUESTO','ALTAREP'),(2,'BAJA DEL REPUESTO','BAJAREP'),(3,'MODIFICACION DEL REPUESTO','MODREP'),(4,'REGISTRO DEL REPUESTO EN DEPOSITO','REGREPDEP'),(5,'BLANQUEO DE STOCK','BLASTK'),(6,'AJUSTE DE STOCK','AJUSTK'),(7,'ACTIVAR REPUESTO','ACTREP'),(100,'INGRESO POR COMPRA','INGCPA'),(101,'RETIRO DE REPUESTO','RETDEP'),(102,'TRANSFERENCIAS','TRANSF'),(103,'PEDIDOS DE COMPRA','PEDCPA'),(200,'ANULACION INGRESO POR COMPRA','ANUINGCPA'),(201,'ANULACION RETIRO DE REPUESTO','ANURETDEP'),(202,'ANULACION TRANSFERENCIAS','ANUTRANSF'),(203,'ANULACION PEDIDO COMPRA','ANUPEDCPA');
/*!40000 ALTER TABLE `operacionstocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `idPermiso` int NOT NULL AUTO_INCREMENT,
  `DescripcionPerm` varchar(60) DEFAULT NULL,
  `FechaGrab` datetime NOT NULL,
  PRIMARY KEY (`idPermiso`),
  UNIQUE KEY `DescripcionPerm` (`DescripcionPerm`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Tabla de Permisos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'get_todos_usuarios','2021-11-11 00:00:00'),(2,'get_todos_permisos','2021-11-11 00:00:00'),(3,'get_todos_grupos','2021-11-11 00:00:00'),(4,'get_todos_repuestos','2021-11-11 00:00:00'),(5,'get_todas_marcas_repuestos','2021-11-11 00:00:00'),(6,'get_todas_subgrupos','2021-11-11 00:00:00'),(7,'get_sindatos_subgrupos','2021-11-11 00:00:00'),(8,'get_nombre_subgrupos','2021-11-11 00:00:00'),(9,'post_alta_repuesto','2022-02-12 00:00:00'),(10,'post_alta_marcarepuesto','2022-02-12 00:00:00'),(11,'get_carrito','2022-02-12 00:00:00'),(12,'post_alta_item_carrito','2022-02-12 00:00:00'),(13,'crear_grupo','2022-04-16 00:00:00'),(14,'get_id_grupo','2022-04-16 00:00:00');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedor` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Proveedor',
  `idTipoDocumento` int unsigned NOT NULL DEFAULT '80' COMMENT 'Tipo de Documento del Proveedor',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción',
  `NroDocumento` bigint unsigned DEFAULT NULL COMMENT 'Nº de Documento del Proveedor',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Activo',
  `FechaGrab` datetime NOT NULL,
  `DesUsuGra` varchar(50) NOT NULL,
  `FechaBaja` datetime DEFAULT NULL,
  `DesUsuBaj` varchar(50) DEFAULT NULL,
  `DesMotBaj` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `coddocpro_nrodocpro` (`idTipoDocumento`,`NroDocumento`),
  CONSTRAINT `prov_tdoc` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumentos` (`idTipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Tabla de Proveedores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,0,'SIN DATOS',0,1,'2021-11-11 12:13:46','ADMIN',NULL,NULL,NULL),(2,80,'GERARDO',27383502298,1,'2021-11-11 12:13:46','ADMIN',NULL,NULL,NULL),(5,80,'FABIAN',2342342,1,'2021-11-11 22:14:13','ADMIN',NULL,NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repuestos`
--

DROP TABLE IF EXISTS `repuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repuestos` (
  `idRepuesto` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Repuesto',
  `idGrupo` int unsigned DEFAULT '1' COMMENT 'Cód. de Grupo',
  `idSubGrupo` int unsigned DEFAULT '1' COMMENT 'Cód. de SubGrupo',
  `idMarcaRepuesto` int unsigned DEFAULT '1' COMMENT 'Cód. Marca del Repuesto',
  `Descripcion` varchar(100) NOT NULL COMMENT 'Descripción del Repuesto',
  `UnidadMedida` varchar(30) DEFAULT NULL COMMENT 'Descripción Unidad de Medida',
  `Codigo` varchar(20) DEFAULT NULL COMMENT 'Código',
  `PrecioCompra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Stock` int unsigned DEFAULT '1' COMMENT 'Stock Actual',
  `StockMinimo` int unsigned DEFAULT '1' COMMENT 'Stock Minimo',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Activo  0:Baja',
  `FechaGrab` datetime NOT NULL,
  `DesUsuGra` varchar(50) NOT NULL,
  `FechaBaja` datetime DEFAULT NULL,
  `DesUsuBaj` varchar(50) DEFAULT NULL,
  `DesMotBaj` varchar(250) DEFAULT NULL,
  `Foto` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idRepuesto`),
  UNIQUE KEY `Descripcion` (`Descripcion`),
  KEY `rep_marc` (`idMarcaRepuesto`),
  KEY `rep_sgru` (`idGrupo`,`idSubGrupo`),
  CONSTRAINT `rep_grup` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`),
  CONSTRAINT `rep_marc` FOREIGN KEY (`idMarcaRepuesto`) REFERENCES `marcarepuestos` (`idMarcaRepuesto`),
  CONSTRAINT `rep_scat` FOREIGN KEY (`idGrupo`, `idSubGrupo`) REFERENCES `subgrupos` (`idGrupo`, `idSubGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Tabla de Repuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repuestos`
--

LOCK TABLES `repuestos` WRITE;
/*!40000 ALTER TABLE `repuestos` DISABLE KEYS */;
INSERT INTO `repuestos` VALUES (1,1,2,1,'inyector diesel3','cm','1231',150.00,235,20,1,'2022-03-01 13:48:39','admin',NULL,NULL,NULL,NULL),(2,1,2,1,'reten','cm','2',70.33,63,20,1,'2022-03-01 13:49:05','admin',NULL,NULL,NULL,NULL),(3,1,2,1,'tuerca','mm','3',0.00,630,20,0,'2022-03-01 13:52:15','admin','2022-03-01 21:57:06','admin2','por rotura',NULL),(4,1,1,1,'AMORTIGUADOR','metros','12341',0.00,300,150,1,'2022-03-17 11:27:10','admin',NULL,NULL,NULL,'uploads/image-1647526848941.jpg'),(5,1,2,2,'prueba2','cm','32423',0.00,352,1,1,'2022-03-17 11:44:08','admin',NULL,NULL,NULL,'uploads/image-1647528248040.jpg'),(6,3,1,1,'aves de caza','ataca','23423',0.00,50,20,1,'2022-03-19 10:56:09','admin',NULL,NULL,NULL,'uploads/image-1647698169087.jpg'),(7,3,1,1,'sin imagen','cm','32432',0.00,50,10,1,'2022-03-19 11:03:57','admin',NULL,NULL,NULL,NULL),(8,4,1,2,'tornillo','cm','232131',0.00,34,29,1,'2022-03-19 16:59:10','undefined',NULL,NULL,NULL,'uploads/image-1647719950818.jpg'),(10,1,2,4,'prueba','cm','23423',0.00,31,5,1,'2022-03-19 19:08:20','undefined',NULL,NULL,NULL,NULL),(11,1,3,1,'rueda233','cm','11',0.00,200,20,1,'2022-03-19 19:18:01','admin',NULL,NULL,NULL,NULL),(14,1,1,4,'fe','fv','3244',0.00,50,20,1,'2022-03-20 21:50:21','undefined',NULL,NULL,NULL,'uploads/image-1647823821687.jpg'),(15,1,2,4,'dsadsadsadsad','1231','2131',0.00,20,20,1,'2022-03-24 11:45:07','undefined',NULL,NULL,NULL,'uploads/image-1648133107341.jpg'),(16,1,1,1,'perno','cm','1231',0.00,20,20,1,'2022-03-27 16:22:48','undefined',NULL,NULL,NULL,NULL),(17,1,3,2,'pernito 2','cm','231',0.00,20,20,1,'2022-03-27 16:24:21','undefined',NULL,NULL,NULL,NULL),(20,1,2,2,'asasa','cm','228383d',0.00,25,25,1,'2022-04-11 08:43:04','undefined',NULL,NULL,NULL,'uploads/image-1649677384601.jpg'),(21,1,2,1,'prueba22','cm','12321',0.00,50,30,1,'2022-04-13 17:09:09','undefined',NULL,NULL,NULL,'uploads/image-1649880549081.jpg'),(22,1,2,1,'rueda','cm','22',0.00,200,20,1,'2022-04-19 13:08:46','admin',NULL,NULL,NULL,NULL),(25,1,2,1,'rueda fate','cm','25',0.00,200,20,1,'2022-04-19 13:49:08','admin',NULL,NULL,NULL,NULL),(26,1,2,1,'rueda fate2','cm','26',0.00,200,20,1,'2022-04-19 15:53:54','admin',NULL,NULL,NULL,NULL),(27,1,2,1,'rueda fate3','cm','27',0.00,200,20,1,'2022-04-19 15:54:00','admin',NULL,NULL,NULL,NULL),(28,1,2,1,'rueda fate4','cm','28',0.00,200,20,1,'2022-04-19 15:54:03','admin',NULL,NULL,NULL,NULL),(29,1,2,1,'rueda fate5','cm','29',0.00,200,20,1,'2022-04-19 15:54:06','admin',NULL,NULL,NULL,NULL),(30,1,2,1,'rueda fate6','cm','30',0.00,200,20,1,'2022-04-19 15:54:11','admin',NULL,NULL,NULL,NULL),(31,1,2,1,'rueda fate7','cm','31',0.00,200,20,1,'2022-04-19 15:54:20','admin',NULL,NULL,NULL,NULL),(32,1,2,1,'rueda fate8','cm','32',0.00,200,20,1,'2022-04-19 15:54:23','admin',NULL,NULL,NULL,NULL),(33,1,2,1,'rueda fate9','cm','33',0.00,200,20,1,'2022-04-19 15:54:26','admin',NULL,NULL,NULL,NULL),(34,1,2,1,'rueda fate10','cm','34',0.00,200,20,1,'2022-04-19 15:54:29','admin',NULL,NULL,NULL,NULL),(35,1,2,1,'aaa','cm','3242',0.00,20,15,1,'2022-04-20 15:19:56','admin',NULL,NULL,NULL,NULL),(36,4,1,6,'cm231321','cm','2313',0.00,50,40,1,'2022-04-20 15:26:17','admin',NULL,NULL,NULL,NULL),(37,1,2,4,'pruebita44','cm','324324',0.00,1,80,1,'2022-04-20 15:33:08','admin',NULL,NULL,NULL,NULL),(38,1,2,4,'probando precio unit','cm','13123',160.00,200,20,1,'2022-05-11 12:24:40','admin',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `repuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retirorepuestos`
--

DROP TABLE IF EXISTS `retirorepuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retirorepuestos` (
  `idRetiro` int unsigned NOT NULL AUTO_INCREMENT,
  `idUnidad` int unsigned NOT NULL COMMENT 'Nº Interno de Unidad',
  `UnidadTaller` int unsigned NOT NULL COMMENT '1:Unidad en Taller',
  `OrdenTrabajo` int unsigned NOT NULL COMMENT 'Nº de Registro de Ingreso a Taller',
  `idSeccion` int unsigned NOT NULL COMMENT 'Cód. Interno de Seccion',
  `DesSeccion` varchar(50) NOT NULL COMMENT 'Descripción de la Seccion',
  `idAgente` int unsigned NOT NULL COMMENT 'Empleado que retiro los artículos',
  `DesAgente` varchar(50) NOT NULL COMMENT 'Decripción agente que retira ',
  `FecGraSol` datetime NOT NULL COMMENT 'Fecha de Grabación de Solicitud',
  `UsuGraSol` varchar(50) NOT NULL COMMENT 'Usuario que grabó la solicitud',
  `FecAutRet` datetime DEFAULT NULL COMMENT 'Fecha de Autorización de Retiro',
  `UsuAutRet` varchar(50) DEFAULT NULL COMMENT 'Usuario autorizo el retiro',
  `FecRetRep` datetime DEFAULT NULL COMMENT 'Fecha de retiro de los Repuestos',
  `UsuEntRep` varchar(50) DEFAULT NULL COMMENT 'Usuario que entrego los Repuestos',
  `FecAnuSol` datetime DEFAULT NULL COMMENT 'Fecha Anulación de la Solicitud',
  `UsuAnuSol` varchar(50) DEFAULT NULL COMMENT 'Usuario que anuló la solicitud',
  `DesMotAnu` varchar(250) DEFAULT NULL COMMENT 'Motivo de anulación de la solicitud',
  `EstadoSolicitud` int unsigned NOT NULL COMMENT '1:Cerrado  2: Autorizado  3:Retirado  9:Anulado',
  PRIMARY KEY (`idRetiro`),
  KEY `ret_uni` (`idUnidad`),
  KEY `ret_age` (`idAgente`),
  KEY `ret_sec` (`idSeccion`),
  CONSTRAINT `ret_age` FOREIGN KEY (`idAgente`) REFERENCES `agentes` (`idAgente`),
  CONSTRAINT `ret_sec` FOREIGN KEY (`idSeccion`) REFERENCES `secciones` (`idSeccion`),
  CONSTRAINT `ret_uni` FOREIGN KEY (`idUnidad`) REFERENCES `unidades` (`idUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='Registro de Retiros de Repuestos del Depósito';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retirorepuestos`
--

LOCK TABLES `retirorepuestos` WRITE;
/*!40000 ALTER TABLE `retirorepuestos` DISABLE KEYS */;
INSERT INTO `retirorepuestos` VALUES (6,2,1,3242,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-06 12:42:37','ger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(7,2,1,3242,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-06 12:43:03','ger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(12,2,1,12314,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-06 13:46:23','ger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(15,2,1,12314,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:20:48','ger',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(16,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:42:25','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(17,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:43:36','gerardo',NULL,NULL,NULL,NULL,'2021-12-10 08:55:24','G','GG',9),(18,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:47:05','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(19,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:48:40','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(20,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:50:23','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(21,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:54:15','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(22,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:57:52','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(23,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 08:59:09','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(24,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:00:13','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(25,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:01:51','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(26,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:04:36','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(27,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:05:51','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(28,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:07:17','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(29,3,1,324234,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:07:54','gerardo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(30,2,1,2432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:10:43','gerar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(31,2,1,2432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:11:21','gerar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(32,2,1,2432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:12:14','gerar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(33,2,1,2432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:12:46','gerar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(34,2,1,2432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:13:53','gerar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(35,2,1,2432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:15:22','gerar','2021-12-09 09:19:53','ge',NULL,NULL,'2021-12-09 09:21:16','geraaaa','prueba 2',9),(36,2,1,2432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:18:24','gerar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(37,2,0,11111,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:23:12','G',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(38,2,0,11111,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:24:41','G','2021-12-09 09:03:39','admin',NULL,NULL,'2021-12-09 09:18:54','gerard','prueba',9),(39,2,1,32432,1234,'ELECTRICIDAD',1111,'Romero, Juan','2021-12-07 09:51:43','ger','2021-12-07 13:16:34','G','2021-12-07 13:25:35','gg',NULL,NULL,NULL,3),(40,2,0,2342,1001,'AFINADO',2222,'Uro, Maria Ines','2022-02-06 22:06:14','sistema','2022-02-06 22:13:28','sistem2','2022-02-06 22:13:52','sistem3','2022-02-06 22:14:41','sistem9','Equivocacion de repuesto',9),(41,2,1,3242,1001,'AFINADO',2222,'Uro, Maria Ines','2022-02-14 18:58:10','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(43,2,0,1231,1001,'AFINADO',2222,'Uro, Maria Ines','2022-03-01 22:23:11','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(44,2,0,1231,1001,'AFINADO',2222,'Uro, Maria Ines','2022-03-01 22:25:12','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(45,2,0,1231,1001,'AFINADO',2222,'Uro, Maria Ines','2022-03-01 22:26:26','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(47,2,0,1231,1001,'AFINADO',2222,'Uro, Maria Ines','2022-03-01 22:34:22','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(48,2,0,1231,1001,'AFINADO',2222,'Uro, Maria Ines','2022-03-01 22:35:02','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(49,2,1,100213,1001,'AFINADO',2222,'Uro, Maria Ines','2022-03-01 22:38:47','admin','2022-03-01 22:41:59','encargadotaller','2022-03-01 22:42:48','encargadodeposito','2022-03-01 22:46:05','depositoenc','se confundio',9),(50,3,0,123141,1001,'AFINADO',1111,'Romero, Juan','2022-03-01 22:49:36','admin',NULL,NULL,NULL,NULL,'2022-03-01 22:53:24','admin2','por error',9),(51,2,0,333,1001,'AFINADO',1111,'Romero, Juan','2022-03-06 13:16:15','admin',NULL,NULL,'2022-03-08 09:44:29','admin',NULL,NULL,NULL,3),(52,2,1,34242,1001,'AFINADO',1111,'Romero, Juan','2022-03-06 13:20:30','admin',NULL,NULL,'2022-03-07 13:04:26','admin2',NULL,NULL,NULL,3),(53,2,0,2121,1001,'AFINADO',1111,'Romero, Juan','2022-03-08 09:46:47','admin','2022-03-08 09:47:33','admin','2022-03-08 09:47:41','admin4',NULL,NULL,NULL,3),(54,2,1,3333,1007,'CHAPA Y PINTURA',1111,'Romero, Juan','2022-05-11 12:54:27','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(55,2,1,3333,1007,'CHAPA Y PINTURA',1111,'Romero, Juan','2022-05-11 12:54:59','admin','2022-05-11 12:56:23','admin',NULL,NULL,NULL,NULL,NULL,2),(56,2,1,3333,1001,'AFINADO',1111,'Romero, Juan','2022-05-17 10:29:45','admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(57,2,1,3333,1001,'AFINADO',1111,'Romero, Juan','2022-05-17 10:33:05','admin','2022-05-17 10:34:51','admin','2022-05-17 10:48:42','admin',NULL,NULL,NULL,3),(58,3,1,3333,1007,'CHAPA Y PINTURA',2222,'Uro, Maria Ines','2022-05-17 10:58:54','admin','2022-05-17 11:01:14','admi2','2022-05-17 11:01:39','admin3','2022-05-17 11:02:53','admin','por error en numero de seccion',9);
/*!40000 ALTER TABLE `retirorepuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `DescripcionRol` varchar(50) NOT NULL,
  `FechaGrab` datetime NOT NULL,
  PRIMARY KEY (`idRol`),
  UNIQUE KEY `descr_rol` (`DescripcionRol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tabla de Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2021-11-11 23:18:54');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolespermisos`
--

DROP TABLE IF EXISTS `rolespermisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolespermisos` (
  `idRol` int NOT NULL,
  `idPermiso` int NOT NULL,
  `FechaGrab` datetime NOT NULL,
  PRIMARY KEY (`idRol`,`idPermiso`),
  KEY `key_rol` (`idRol`),
  KEY `key_perm` (`idPermiso`),
  CONSTRAINT `key_perm` FOREIGN KEY (`idPermiso`) REFERENCES `permisos` (`idPermiso`),
  CONSTRAINT `key_rol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de RolesPermisos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolespermisos`
--

LOCK TABLES `rolespermisos` WRITE;
/*!40000 ALTER TABLE `rolespermisos` DISABLE KEYS */;
INSERT INTO `rolespermisos` VALUES (1,1,'2021-11-11 00:00:00'),(1,2,'2021-11-11 00:00:00'),(1,3,'2021-11-11 00:00:00'),(1,4,'2021-11-11 00:00:00'),(1,5,'2021-11-11 00:00:00'),(1,6,'2021-11-11 00:00:00'),(1,7,'2021-11-11 00:00:00'),(1,8,'2021-11-11 00:00:00'),(1,9,'2022-02-12 00:00:00'),(1,10,'2022-02-12 00:00:00'),(1,11,'2022-02-12 00:00:00'),(1,12,'2022-02-12 00:00:00'),(1,13,'2022-04-16 00:00:00'),(1,14,'2022-04-16 00:00:00');
/*!40000 ALTER TABLE `rolespermisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secciones`
--

DROP TABLE IF EXISTS `secciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secciones` (
  `idSeccion` int unsigned NOT NULL COMMENT 'Código Empresa',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idSeccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Secciones del Taller';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secciones`
--

LOCK TABLES `secciones` WRITE;
/*!40000 ALTER TABLE `secciones` DISABLE KEYS */;
INSERT INTO `secciones` VALUES (1001,'AFINADO',1),(1003,'AJUSTE',1),(1007,'CHAPA Y PINTURA',1),(1010,'ELECTRICIDAD',1),(1011,'GOMERIA',1),(1012,'LAVADO Y ENGRASE',1),(1013,'MECANICA LIVIANA',1),(1234,'ELECTRICIDAD',1),(1235,'TORNERIA',1);
/*!40000 ALTER TABLE `secciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subgrupos`
--

DROP TABLE IF EXISTS `subgrupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subgrupos` (
  `idSubGrupo` int unsigned NOT NULL COMMENT 'Código de SubGrupo',
  `idGrupo` int unsigned NOT NULL COMMENT 'Código de Grupo',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción SubGrupos',
  `Estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idSubGrupo`,`idGrupo`),
  KEY `sgr_gru` (`idGrupo`),
  CONSTRAINT `sgr_gru` FOREIGN KEY (`idGrupo`) REFERENCES `grupos` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Sub Grupos de Repuestos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subgrupos`
--

LOCK TABLES `subgrupos` WRITE;
/*!40000 ALTER TABLE `subgrupos` DISABLE KEYS */;
INSERT INTO `subgrupos` VALUES (1,1,'SIN DATOS',1),(1,3,'SIN DATOS',1),(1,4,'SIN DATOS',1),(1,31,'SIN DATOS',1),(1,35,'SIN DATOS',1),(1,36,'SIN DATOS',1),(1,37,'SIN DATOS',1),(1,38,'SIN DATOS',1),(1,44,'SIN DATOS',1),(1,45,'SIN DATOS',1),(2,1,'faritos',1),(2,45,'prueba3',1),(3,1,'ewrewr',1),(4,1,'faritos chicos',1),(5,1,'PRU2',1);
/*!40000 ALTER TABLE `subgrupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocombustibles`
--

DROP TABLE IF EXISTS `tipocombustibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocombustibles` (
  `idTipoComb` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Tipo',
  `Descripcion` varchar(50) DEFAULT NULL COMMENT 'Descripción',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idTipoComb`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tabla de Tipos de Combustibles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocombustibles`
--

LOCK TABLES `tipocombustibles` WRITE;
/*!40000 ALTER TABLE `tipocombustibles` DISABLE KEYS */;
INSERT INTO `tipocombustibles` VALUES (1,'SIN TIPO',1),(2,'NAFTA',1),(3,'GAS OIL',1),(4,'GNC',1);
/*!40000 ALTER TABLE `tipocombustibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocompras`
--

DROP TABLE IF EXISTS `tipocompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocompras` (
  `idTipoCompra` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1: Caja Chica, 2: Licitación',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción Tipo de Compras',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idTipoCompra`),
  UNIQUE KEY `Descripcion_UNIQUE` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabla Tipo de Compras';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocompras`
--

LOCK TABLES `tipocompras` WRITE;
/*!40000 ALTER TABLE `tipocompras` DISABLE KEYS */;
INSERT INTO `tipocompras` VALUES (1,'CAJA CHICA',1),(2,'LICITACION',1);
/*!40000 ALTER TABLE `tipocompras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumentos`
--

DROP TABLE IF EXISTS `tipodocumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodocumentos` (
  `idTipoDocumento` int unsigned NOT NULL COMMENT 'Código AFIP',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción AFIP',
  `Abreviatura` varchar(12) NOT NULL COMMENT 'Abreviatura',
  `HabSisCred` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Habilitado para Créditos',
  `DocuFiscal` int unsigned NOT NULL DEFAULT '0' COMMENT '1:Documento Fiscal',
  PRIMARY KEY (`idTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipos de Documentos que Identifican a las Personas/Empresas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumentos`
--

LOCK TABLES `tipodocumentos` WRITE;
/*!40000 ALTER TABLE `tipodocumentos` DISABLE KEYS */;
INSERT INTO `tipodocumentos` VALUES (0,'CI POLICIA FEDERAL','CI PF',0,0),(1,'CI BUENOS AIRES','CI BS.AS',0,0),(2,'CI CATAMARCA','CI CAT',0,0),(3,'CI CORDOBA','CI CBA',0,0),(4,'CI CORRIENTES','CI COR',0,0),(5,'CI ENTRE RIOS','CI E.RIOS',0,0),(6,'CI JUJUY','CI JUJ',0,0),(7,'CI MENDOZA','CI MZA',0,0),(8,'CI LA RIOJA','CI RIOJA',0,0),(9,'CI SALTA','CI SAL',0,0),(10,'CI SAN JUAN','CI S.JUAN',0,0),(11,'CI SAN LUIS','CI S.LUIS',0,0),(12,'CI SANTA FE','CI STA.FE',0,0),(13,'CI SANTIAGO del ESTERO','CI SGO',0,0),(14,'CI TUCUMAN','CI TUC',0,0),(16,'CI CHACO','CI CHA',0,0),(17,'CI CHUBUT','CI CHU',0,0),(18,'CI FORMOSA','CI FOR',0,0),(19,'CI MISIONES','CI MIS',0,0),(20,'CI NEUQUEN','CI NEU',0,0),(21,'CI LA PAMPA','CI PAM',0,0),(22,'CI RIO NEGRO','CI RIO',0,0),(23,'CI SANTA CRUZ','CI SCR',0,0),(24,'CI TIERRA DEL FUEGO','CI T.FGO',0,0),(80,'CUIT','CUIT',1,1),(86,'CUIL','CUIL',1,1),(87,'CDI','CDI',0,0),(89,'LE','LE',0,0),(90,'LC','LC',0,0),(91,'CI EXTRANJERA','CI EXT',0,0),(92,'EN TRAMITE','TRAMITE',0,0),(93,'ACTA de NACIMIENTO','AC.NAC',0,0),(94,'PASAPORTE','PAS',1,0),(95,'CI Bs. As. RNP','CI RNP',0,0),(96,'DNI','DNI',1,0),(99,'SIN IDENTIFICACION','S/D',0,0);
/*!40000 ALTER TABLE `tipodocumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipounidades`
--

DROP TABLE IF EXISTS `tipounidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipounidades` (
  `idTipoUnidad` int unsigned NOT NULL COMMENT '1:Sin Tipo',
  `Descripcion` varchar(50) NOT NULL COMMENT 'Descripción',
  `Abreviatura` varchar(6) NOT NULL COMMENT 'Abreviatura',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Habilitado',
  PRIMARY KEY (`idTipoUnidad`),
  UNIQUE KEY `Abreviatura` (`Abreviatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Tipos de Unidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipounidades`
--

LOCK TABLES `tipounidades` WRITE;
/*!40000 ALTER TABLE `tipounidades` DISABLE KEYS */;
INSERT INTO `tipounidades` VALUES (1,'SIN DATOS','',1),(2,'CAMIONETA','CMTA',1),(3,'CAMION','CAMION',1),(4,'TOPADORA','TOPAD',1),(5,'AUTO','AUTO',1),(6,'CAMION CISTERNA DE COMBUSTIBLE','CCOMB',1);
/*!40000 ALTER TABLE `tipounidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `idUnidad` int unsigned NOT NULL AUTO_INCREMENT COMMENT '1:Sin Equipo',
  `Descripcion` varchar(100) NOT NULL COMMENT 'Descripción',
  `CodigoAnterior` varchar(8) NOT NULL COMMENT 'Código Inventario Anterior',
  `CodigoNuevo` varchar(8) NOT NULL COMMENT 'Código Inventario Nuevo',
  `NroDominio` varchar(7) NOT NULL COMMENT 'Nº Dominio',
  `AñoFabric` int unsigned NOT NULL COMMENT 'Año de Patentamiento',
  `idTipoUnidad` int unsigned NOT NULL COMMENT 'Cód. Tipo de Unidad',
  `idMarcaUnidad` int unsigned NOT NULL COMMENT 'Cód. Interno de Marca',
  `idModeloUnidad` int unsigned NOT NULL COMMENT 'Código de Modelo',
  `idTipoComb` int unsigned NOT NULL COMMENT 'Cód. tipo de Combustible',
  `Estado` int unsigned NOT NULL DEFAULT '1' COMMENT '1:Activo  2:En Reparación  9:Baja',
  `FechaGrab` datetime NOT NULL,
  `DesUsuGra` varchar(50) NOT NULL,
  `FechaBaja` datetime DEFAULT NULL,
  `DesUsuBaj` varchar(50) DEFAULT NULL,
  `DesMotBaj` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idUnidad`),
  UNIQUE KEY `CodigoNuevo` (`CodigoNuevo`),
  KEY `uni_tipun` (`idTipoUnidad`),
  KEY `uni_mod` (`idMarcaUnidad`,`idModeloUnidad`),
  KEY `uni_tcomb` (`idTipoComb`),
  CONSTRAINT `uni_marca` FOREIGN KEY (`idMarcaUnidad`) REFERENCES `marcaunidades` (`idMarcaUnidad`),
  CONSTRAINT `uni_mod` FOREIGN KEY (`idMarcaUnidad`, `idModeloUnidad`) REFERENCES `modelounidades` (`idMarcaUnidad`, `idModeloUnidad`),
  CONSTRAINT `uni_tcomb` FOREIGN KEY (`idTipoComb`) REFERENCES `tipocombustibles` (`idTipoComb`),
  CONSTRAINT `uni_tipun` FOREIGN KEY (`idTipoUnidad`) REFERENCES `tipounidades` (`idTipoUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='Tabla de Unidades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'SIN UNIDAD','S/D','S/D','S/D',1900,1,1,1,1,1,'2017-01-01 00:00:00','ADMIN',NULL,NULL,NULL),(2,'CAMION PRUEBA 1','S/D','SDC362','AB562RD',2017,3,3,3,3,1,'2018-03-19 10:39:31','ADMIN',NULL,NULL,NULL),(3,'CAMIONETA DOBLE CABINA','S/D','DKC256','AC520XX',2018,2,2,3,3,1,'2018-03-20 12:23:10','ADMIN',NULL,NULL,NULL),(5,'CAMION DE COMBUSTIBLE DESPACHO TRASERO','S/D','1CC7244','CVH334',2011,3,6,3,3,1,'2018-12-21 09:15:00','ADMIN',NULL,NULL,NULL),(6,'CAMION VOLCADOR DE 6M3','S/D','1CV7202','XVI',2006,3,3,4,3,1,'2018-12-21 10:37:03','ADMIN',NULL,NULL,NULL),(7,'CAMIONETA DOBLE CABINA S10','S/D','OCD7091','OLW975',2014,2,4,2,3,1,'2019-01-03 11:36:33','ADMIN',NULL,NULL,NULL),(8,'CAMIONETA CABINA SIMPLE S10','S/D','0CT7130','AA456PL',2018,2,4,2,3,1,'2019-01-18 10:18:26','ADMIN',NULL,NULL,NULL),(9,'1114','XXXXX','1CV7201','AB652LV',2018,3,6,3,3,1,'2019-01-21 11:20:52','ADMIN',NULL,NULL,NULL),(10,'CAMION VOLCADOR 6M3','123456','1CV7211','AB646SX',2017,3,6,2,3,1,'2019-01-22 09:25:57','ADMIN',NULL,NULL,NULL),(11,'pru','33','44','aa111bb',2021,2,2,2,3,9,'2022-03-06 12:48:50','admin','2022-03-06 13:03:08','admin2','por equivocacion');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int unsigned NOT NULL,
  `idAgente` int unsigned NOT NULL,
  `idRol` int NOT NULL,
  `DescripcionUsu` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `Estado` tinyint(1) DEFAULT '1',
  `FechaGrab` datetime DEFAULT NULL,
  PRIMARY KEY (`idAgente`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `DescripcionUsu` (`DescripcionUsu`),
  KEY `usu_age` (`idAgente`),
  KEY `usu_rol` (`idRol`),
  CONSTRAINT `usu_age` FOREIGN KEY (`idAgente`) REFERENCES `agentes` (`idAgente`),
  CONSTRAINT `usu_rol` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de Usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1111,1,'admin','admin@prueba.com','$2a$10$m4HiEz9RN70BvAp6/Fke1.YBQg2d05LPShB9ESYjgAKu9PDHWb3MW',1,'2022-01-29 02:16:09'),(2,2222,1,'admin2','prueba@prueba.com','$2a$10$OelKQVsULgGWpNpGQK6qr.PfNxGqWgq1CMGVt/.UBwLS/bydfOOta',1,'2022-01-29 15:46:30'),(3,3333,1,'admin3','prueba3@prueba3.com','1234',1,'2022-02-15 15:47:00');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbproyecto'
--

--
-- Dumping routines for database 'dbproyecto'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualiza_stock_repuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualiza_stock_repuesto`(
	IN `pidrepuesto` VARCHAR(8),
	IN `pcantidadrepuesto` DECIMAL(10,1),
    IN `ptipope` CHAR(1),
	IN `ptagroll` INT,
	IN `pnomusu` VARCHAR(50)
)
SALIR:BEGIN
	/*
    Actualiza Stock del Repuesto.
    */
    DECLARE ftexsql INT;
    DECLARE fnewexi DECIMAL;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS;
		SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
    START TRANSACTION;
   /* OBTIENE STOCK ACTUAL DEL REPUESTO */   
   SET ftexsql= (SELECT Stock FROM repuestos WHERE idRepuesto=pidrepuesto);
   SET @fexiact = ftexsql;
   IF ISNULL(@fexiact) THEN
  	   SET @fexiact=0;
  	END IF;
   select 'cantidad exist del repuesto',@fexiact,'' Mensaje;
	/* CALCULA NUEVA EXISTENCIA */
	SET fnewexi=0;
	CASE ptipope 
		WHEN '+' THEN
			SET fnewexi=@fexiact+pcantidadrepuesto;
		WHEN '-' THEN
			SET fnewexi=@fexiact-pcantidadrepuesto;
		WHEN 'R' THEN
			SET fnewexi=pcantidadrepuesto;
	END CASE;
	/* ACTUALIZA STOCK */
   UPDATE repuestos SET Stock=fnewexi WHERE idRepuesto=pidrepuesto;    

	SELECT 'cantidad existente del repuesto',ftexsql AS Mensaje;
	SELECT 'se actualizó el stock' Mensaje1;
	SELECT 'cantidad actualizada del repuesto',fnewexi,'' Mensaje2;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrito_ingresos_agregar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrito_ingresos_agregar`(
	IN `pidrepuesto` INT(4),
    IN `pdesrepuesto` VARCHAR(45),
	IN `pcantidadingresada` DECIMAL(10,2),
    IN `ppreciounitario` DECIMAL(10,2),
    IN `pidusuario` INT(8)
)
    COMMENT 'Alta un item de Tabla Temporal'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE pcarrito VARCHAR(40) default 'carritoingresos';
   DECLARE ptabaux VARCHAR(50) DEFAULT 'auxvalret';
    
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
	/* ALTA ITEM CARRITO */
		   
		   SET @fnrousu=0;
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(pcarrito),' WHERE idRepuesto=',"'",pidrepuesto,"'",' INTO @fnrousu');
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
           DEALLOCATE PREPARE fordsql;
           IF @fnrousu!=0 THEN
           select 'ya existe y hay que actualizar' Mensaje;
           end if;
           
           IF @fnrousu=0 THEN
				SET @ftexsql=CONCAT('INSERT INTO ',TRIM(pcarrito),' (idRepuesto,DesRepuesto,CantidadIngresada,
                PrecioUnitario,idUsuario) VALUES (',"'",
					 TRIM(pidrepuesto),"','",TRIM(pdesrepuesto),"','",TRIM(pcantidadingresada),"','",
					TRIM(ppreciounitario),"','",TRIM(pidusuario),"')");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
               select 'ok nuevo item' Mensaje;
			else
				SET @ftexsql=CONCAT('UPDATE ',TRIM(pcarrito),' SET CantidadIngresada = ',"'",
					 TRIM(pcantidadingresada),"' WHERE idRepuesto='",TRIM(pidrepuesto),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
				select 'ok actualizar cantidad ingresada item' Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrito_ingresos_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrito_ingresos_eliminar`(
	IN `pidrepuesto` INT(4)
)
    COMMENT 'Eliminar un item de Tabla Carrito de Ingresos de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE pcarrito VARCHAR(40) default 'carritoingresos';
   DECLARE ptabaux VARCHAR(50) DEFAULT 'auxvalret';
    
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
	/* ALTA ITEM CARRITO */
		   
		   SET @fnrorep=0;
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(pcarrito),' WHERE idRepuesto=',"'",pidrepuesto,"'",' INTO @fnrorep');
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
           DEALLOCATE PREPARE fordsql;
           /*IF @fnrousu!=0 THEN
           select 'ya existe y hay que actualizar' Mensaje;
           end if;*/
           
           IF @fnrorep=1 THEN
				SET @ftexsql=CONCAT('DELETE FROM ',TRIM(pcarrito),' WHERE idRepuesto=',"'",pidrepuesto,"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
			select 'Eliminado repuesto' Mensaje;
            else
            select 'No existe el id en la tabla' Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrito_retiros_agregar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrito_retiros_agregar`(
	IN `pidrepuesto` INT(4),
    IN `pdesrepuesto` VARCHAR(45),
	IN `pcantidadsolicitada` DECIMAL(10,2),
    IN `pidusuario` INT(8)
)
    COMMENT 'Alta un item de Tabla Temporal'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE pcarrito VARCHAR(40) default 'carritoretiros';
   DECLARE ptabaux VARCHAR(50) DEFAULT 'auxvalret';
    
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
	/* ALTA ITEM CARRITO */
		   
		   SET @fnrousu=0;
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(pcarrito),' WHERE idRepuesto=',"'",pidrepuesto,"'",' INTO @fnrousu');
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
           DEALLOCATE PREPARE fordsql;
           IF @fnrousu!=0 THEN
           select 'ya existe y hay que actualizar' Mensaje;
           end if;
           
           IF @fnrousu=0 THEN
				SET @ftexsql=CONCAT('INSERT INTO ',TRIM(pcarrito),' (idRepuesto,DesRepuesto,CantidadSolicitada,
                idUsuario) VALUES (',"'",
					 TRIM(pidrepuesto),"','",TRIM(pdesrepuesto),"','",TRIM(pcantidadsolicitada),"','",
					TRIM(pidusuario),"')");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
               select 'ok nuevo item' Mensaje;
			else
				SET @ftexsql=CONCAT('UPDATE ',TRIM(pcarrito),' SET CantidadSolicitada = ',"'",
					 TRIM(pcantidadsolicitada),"' WHERE idRepuesto='",TRIM(pidrepuesto),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
				select 'ok actualizar cantidad solicitada item' Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_carrito_retiros_eliminar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_carrito_retiros_eliminar`(
	IN `pidrepuesto` INT(4)
)
    COMMENT 'Eliminar un item de Tabla Carrito de  Retiro de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE pcarrito VARCHAR(40) default 'carritoretiros';
   DECLARE ptabaux VARCHAR(50) DEFAULT 'auxvalret';
    
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
	/* ALTA ITEM CARRITO */
		   
		   SET @fnrorep=0;
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(pcarrito),' WHERE idRepuesto=',"'",pidrepuesto,"'",' INTO @fnrorep');
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
           DEALLOCATE PREPARE fordsql;
           /*IF @fnrousu!=0 THEN
           select 'ya existe y hay que actualizar' Mensaje;
           end if;*/
           
           IF @fnrorep=1 THEN
				SET @ftexsql=CONCAT('DELETE FROM ',TRIM(pcarrito),' WHERE idRepuesto=',"'",pidrepuesto,"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
			select 'Eliminado repuesto' Mensaje;
            else
            select 'No existe el id en la tabla' Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_ficha_repuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_ficha_repuesto`(
	IN `pidrepuesto` VARCHAR(8),
	IN `pidopestock` CHAR(4),
	IN `pnrocantmov` VARCHAR(10),
	IN `pcomprobante` VARCHAR(19),
	IN `psignoope` CHAR(1),
	IN `pidproveedor` VARCHAR(8),
	IN `prefoperacion` VARCHAR(8),
	IN `pcomentoperacion` VARCHAR(254),
	IN `pnomusu` VARCHAR(50)
    
)
    COMMENT 'Graba Ficha del Artículo'
BEGIN
	DECLARE ffechoy DATE;
	DECLARE ffecgra DATETIME;
	DECLARE forsql2,fordfar CHAR DEFAULT '';
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexor2=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE forsql2 FROM @ftexor2;
   EXECUTE forsql2;
   DEALLOCATE PREPARE forsql2;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=CURDATE();
   SET ffecgra=NOW();
   /* GRABA FICHA DEL ARTICULO */
	SET @ftexor2=CONCAT('INSERT INTO movimientorepuestos (idRepuesto,FecMovStock,idOpeStock,NroCantMov,Comprobante,SignoOperacion,idProveedor,RefOperacion,',
	    'ComentOperacion,FechaGrab,DesUsuGra) VALUES (',"'",TRIM(pidrepuesto),"','",CAST(ffechoy AS CHAR),"','",TRIM(pidopestock),"','",TRIM(pnrocantmov),"','",
		 TRIM(pcomprobante),"','",psignoope,"','",TRIM(pidproveedor),"','",TRIM(prefoperacion),"','",TRIM(pcomentoperacion),"','",
		 CAST(ffecgra AS CHAR),"','",TRIM(pnomusu),"')");
  	PREPARE fordfar FROM @ftexor2;
   EXECUTE fordfar;
   DEALLOCATE PREPARE fordfar;
   select 'se registró correctamente el repuesto' Mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_ingreso_anulado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_ingreso_anulado`(
	IN `pidingreso` BIGINT,
	IN `pmotanu` VARCHAR(250),
	IN `pnomusu` VARCHAR(50)
)
    COMMENT 'Graba/Anula Ingreso por Compra'
BEGIN
   DECLARE fconite INTEGER;
   DECLARE ffecmov DATE;
   DECLARE ffecgra DATETIME;
   DECLARE fdescom VARCHAR(20);
   	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoingresos';
	DECLARE fordsql,fbuspar,fbusart,fgrastk,fgraart CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
   

   		/* PROCESO DE ANULACION */
			SET @ftexsql=CONCAT('SELECT COUNT(*),idProveedor FROM ingresocompra WHERE idIngreso=',"'",TRIM(pidingreso),"'",' AND EstadoSolicitud=',"'",'1',"'",
				 ' INTO @ffouing,@fcodpro');
		   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
  		   DEALLOCATE PREPARE fordsql;
           select 'ingreso',@ffouing,'' Mensaje;
  		   IF @ffouing=1 THEN
	
		      /* PROCESA ARTICULOS DE LA LISTA */
				SET @ftexsql=CONCAT('SELECT MAX(NroIteracion) FROM lineasingresocompra WHERE idIngreso=',"'",TRIM(pidingreso),"'",' INTO @fmaxite');
			   PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
	  		   DEALLOCATE PREPARE fordsql;
               select 'Nro Iteracion ',@fmaxite,'' Mensaje;
		      SET fconite=0;
				WHILE fconite<=(@fmaxite-1) DO
					SET fconite=fconite+1;
					SET @ftexsql=CONCAT('SELECT idRepuesto,CantidadRecibida,BanActStock FROM lineasingresocompra WHERE idIngreso=',"'",TRIM(pidingreso),"'",
						 ' AND NroIteracion=',"'",CAST(fconite AS CHAR),"'",' INTO @fcodart,@fnrouni,@factstk');
	 	     	   PREPARE fbusart FROM @ftexsql;
			      EXECUTE fbusart;
			      DEALLOCATE PREPARE fbusart;
                  select 'consutla a lineasingresocompra ',@fcodart,@fnrouni,@factstk,'' Mensaje;
              
				SET fdescom=CONCAT('ING Nº ',LPAD(pidingreso,10,'0'));
			      IF @factstk=1 THEN
 					   SET @fexiant=0;
					   SET @fnewexi=0;
						/* ACTUALIZA STOCK */
						SET @ftexsql=CONCAT('CALL sp_actualiza_stock_repuesto(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
							 '-',"','",'0',"','",TRIM(pnomusu),"')");
 	   	  		   PREPARE fgrastk FROM @ftexsql;
					EXECUTE fgrastk;
			      	DEALLOCATE PREPARE fgrastk;
                    select 'actualiza stock ' Mensaje;

				      /* GRABA FICHA DEL ARTICULO */
 					   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'200',"','",CAST(@fnrouni AS CHAR),"','",
						 	 TRIM(fdescom),"','",'-',"','",CAST(@fcodpro AS CHAR),"','",TRIM(pidingreso),"','",
							'ANULACION INGRESO POR COMPRA',"','",TRIM(pnomusu),"')");
						PREPARE fgrafar FROM @ftexsql;
					   EXECUTE fgrafar;
					   DEALLOCATE PREPARE fgrafar;
                       select 'if ficha' Mensaje;
					  ELSE
				      /* GRABA FICHA DEL ARTICULO */
 					   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'200',"','",CAST(@fnrouni AS CHAR),"','",
						 	 TRIM(fdescom),"','",'-',"','",CAST(@fcodpro AS CHAR),"','",TRIM(pidingreso),"','",
							  'ANULACION INGRESO POR COMPRA',"','",TRIM(pnomusu),"')");
							PREPARE fgrafar FROM @ftexsql;
							EXECUTE fgrafar;
							DEALLOCATE PREPARE fgrafar;
                            select 'else ficha' Mensaje;
					END IF;
              
				END WHILE;
				select 'fin de while' Mensaje;
              
               /* ANULA MOV. EN ingreso Compras */
              SET @ftexsql=CONCAT('UPDATE ingresocompra SET EstadoSolicitud=',"'",'9',"',",'FechaAnul=',"'",CAST(ffecgra AS CHAR),"',",'DesUsuAnu=',"'",CAST(pnomusu AS CHAR),"',",'DesMotAnu=',"'",
					TRIM(pmotanu),"'",' WHERE idIngreso=',"'",TRIM(pidingreso),"'");
			   PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
  			   DEALLOCATE PREPARE fordsql;
               select 'update compra repuestos' Mensaje;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_ingreso_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_ingreso_compra`(
    IN `pordencompra` VARCHAR(8),
    IN `ptipocompra` CHAR(4),
	IN `pnroexpcompra` VARCHAR(20),
	IN `pidproveedor` VARCHAR(8),
	IN `pidcomprobante` CHAR(3),
	IN `pptoventacom` CHAR(4),
	IN `pnrocompro` VARCHAR(8),
	IN `pobservaciones` VARCHAR(250),
	IN `pnomusu` VARCHAR(50),
    IN `pidusuario` VARCHAR(8)
)
    COMMENT 'Graba/Anula Ingreso por Compra'
SALIR:BEGIN
   DECLARE fconite INTEGER;
  DECLARE fsubtotal DECIMAL(10,2);
  DECLARE fpreciototal DECIMAL(10,2) default 0.00;
   DECLARE ffecmov DATE;
   DECLARE ffecgra DATETIME;
   DECLARE fdescom VARCHAR(20);
   	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoingresos';
	DECLARE fordsql,fbuspar,fbusart,fgrastk,fgraart,fprecom CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
   		/* PROCESO DE GRABACION */
			SET @ftexsql=CONCAT('SELECT Abreviatura,Letra FROM comprobantes WHERE idComprobante=',"'",TRIM(pidcomprobante),"'",' INTO @fabrcom,@fletcom');
		   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
  		   DEALLOCATE PREPARE fordsql;
           select 'comprobantes: ',@fabrcom,@fletcom,'' Mensaje;
   		/* GRABA INGRESO DE REPUESTOS*/
			SET @ftexsql=CONCAT('INSERT INTO ingresocompra (FechaRecepcion,idTipoCompra,OrdenCompra,NroExpCompra,idProveedor,idComprobante,AbrCompro,LetraComp,PtoVentaCom,NroCompro,PrecioTotal,',
				'Observaciones,EstadoSolicitud,FechaGrab,DesUsuGra) VALUES (',"'",CAST(ffecmov AS CHAR),"','",TRIM(ptipocompra),"','",TRIM(pordencompra),"','",TRIM(pnroexpcompra),"','",TRIM(pidproveedor),"','",
				TRIM(pidcomprobante),"','",@fabrcom,"','",@fletcom,"','",TRIM(pptoventacom),"','",TRIM(pnrocompro),"','",fpreciototal,"','",
				TRIM(pobservaciones),"','",'1',"','",CAST(ffecgra AS CHAR),"','",TRIM(pnomusu),"')");
     	   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
	      SELECT @@identity INTO @fnroing;
	      DEALLOCATE PREPARE fordsql;
	     select 'se grabó el ingreso por compra' Mensaje;
         
         /* PROCESA ARTICULOS DE LA LISTA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(ptabauxrep),' INTO @fmaxite');
	 	     	   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
			      DEALLOCATE PREPARE fordsql;
                  if (@fmaxite = 0 || isnull(@fmaxite)) THEN
					select 'CARRITO VACIO' Mensaje;
                    leave SALIR;
				end if;            
            
	      SET fconite=0;
	      WHILE fconite<=(@fmaxite-1) DO
				SET @ftexsql=CONCAT('SELECT idRepuesto,DesRepuesto,CantidadIngresada,PrecioUnitario FROM ',TRIM(ptabauxrep),'   LIMIT ',(fconite),',1 INTO @fcodart,@fdesart,@fnrouni,@fpreuni');
 	     	   PREPARE fbusart FROM @ftexsql;
		      EXECUTE fbusart;
		      DEALLOCATE PREPARE fbusart;
              select 'selecciona items del carrito ingreso',@fcodart,@fdesart,@fnrouni,@fpreuni,'' Mensaje;
		      /* BUSCA PARAMETROS ARTICULO */
			  /* SET @ftexsql=CONCAT('SELECT BanStockRep FROM repuestos WHERE idRepuesto=',"'",CAST(@fcodart AS CHAR ),"'",' INTO @factstk');
	     	   PREPARE fbuspar FROM @ftexsql;
		      EXECUTE fbuspar;
	   	   DEALLOCATE PREPARE fbuspar;
           select 'Act. Stock',@factstk,'' Mensaje;*/
		      /* GRABA DETALLE DE INGRESO */
              SET fconite=fconite+1;
               SET fsubtotal = @fnrouni * @fpreuni;
               select 'selecciona subtotal',fsubtotal,'' Mensaje;
               SET fpreciototal = fpreciototal + fsubtotal;
               select 'selecciona pr. total',fpreciototal,'' Mensaje2;
			  SET @ftexsql=CONCAT('INSERT INTO lineasingresocompra (idIngreso,NroIteracion,idRepuesto,DesRepuesto,CantidadRecibida,PrecioUnitario,Subtotal) VALUES (',"'",CAST(@fnroing AS CHAR),"','",
					 CAST(fconite AS CHAR),"','",CAST(@fcodart AS CHAR),"','",TRIM(@fdesart),"','",CAST(@fnrouni AS CHAR),"','",CAST(@fpreuni AS CHAR),"','",CAST(fsubtotal AS CHAR),"')");
	     	  PREPARE fgraart FROM @ftexsql;
		      EXECUTE fgraart;
		      DEALLOCATE PREPARE fgraart;
              select 'graba detalle de la linea de compra' Mensaje; 
				
                /* ACTUALIZA ULTIMO PRECIO DE COMPRA */
                SET @ftexsql=CONCAT('UPDATE repuestos SET PrecioCompra = ',"'",CAST(@fpreuni AS CHAR),"' WHERE idRepuesto ='",CAST(@fcodart AS CHAR),"'");
	     	  PREPARE fprecom FROM @ftexsql;
		      EXECUTE fprecom;
		      DEALLOCATE PREPARE fprecom;
              select 'actualiza precio de compra en repuestos',@fpreuni,@fcodart,'' Mensaje;
                /* ACTUALIZA STOCK */
		      SET fdescom=CONCAT('ING Nº ',LPAD(@fnroing,10,'0'));
		      /*IF @factstk=1 THEN*/
					SET @ftexsql=CONCAT('CALL sp_actualiza_stock_repuesto(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
						 '+',"','",'0',"','",TRIM(pnomusu),"')");
					   PREPARE fgrastk FROM @ftexsql;
					   EXECUTE fgrastk;
						DEALLOCATE PREPARE fgrastk;
						select 'actualiza el stock ' Mensaje;
		
				   /* GRABA FICHA DEL ARTICULO */
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'100',"','",CAST(@fnrouni AS CHAR),"','",
						 TRIM(fdescom),"','",'+',"','",TRIM(pidproveedor),"','",CAST(@fnroing AS CHAR),"','",
						 'INGRESO POR COMPRA',"','",TRIM(pnomusu),"')");
				   PREPARE fgrafar FROM @ftexsql;
				   EXECUTE fgrafar;
				   DEALLOCATE PREPARE fgrafar;
                   select 'graba ficha repuesto' Mensaje;
                   
				   /* ACTUALIZA lineas de compra de repuestos */
					SET @ftexsql=CONCAT('UPDATE lineasingresocompra SET BanActStock=',"'",'1',"'",' WHERE idIngreso=',
						 "'",CAST(@fnroing AS CHAR),"'",' AND NroIteracion=',"'",CAST(fconite AS CHAR),"'");
					PREPARE fordact FROM @ftexsql;
					EXECUTE fordact;
					DEALLOCATE PREPARE fordact;
					select 'bandera SET 1' Mensaje;
        
					select 'ACTUALIZA una linea de compra de repuestos' Mensaje;
        
				/*end IF;*/
            
	      END WHILE;
          select 'fin while' Mensaje;
          
          /* GRABA PRECIO TOTAL */
          
          UPDATE ingresocompra SET PrecioTotal = fpreciototal WHERE idIngreso=@fnroing;
          select 'Precio Total: ',fpreciototal,'' Mensaje4;
          /* DEVUELVE RESULTADO DE LA OPERACION */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002,valret003) VALUES (',"'",'1',"','",CAST(@fnroing AS CHAR),"','",
				 CAST(ffecmov AS CHAR),"')");
        	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
            
            select 'tabaux' Mensaje;
            
            /*BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
			SET @ftexsql=CONCAT('DELETEE FROM ',TRIM(ptabauxrep),' WHERE idUsuario="1"');
			PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
				SELECT 'borrar datos del carrito por usuario' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_ordentrabajo_ingresounidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_ordentrabajo_ingresounidad`(
	
	IN `pidunidad` VARCHAR(6),
	IN `pidseccion` CHAR(5),
	IN `pidagente` VARCHAR(6),
    IN `pdesmotivofalla` VARCHAR(250),
	IN `pnomusu` VARCHAR(50),
    IN `pidusuario` VARCHAR(8)
    
)
    COMMENT 'Graba Orden de Trabajo de ingreso de unidad'
SALIR:BEGIN
	DECLARE fconite INTEGER;
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE fdesemp,fdescom VARCHAR(100);
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoretiros';
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar,fborrep CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
  
   		/* PROCESO DE GENERAR ORDEN DE TRABAJO */
   		SET @ftexsql=CONCAT('SELECT Descripcion FROM unidades WHERE idUnidad=',"'",TRIM(pidunidad),"'",' INTO @fdesuni');
		   PREPARE fordsql FROM @ftexsql;
           EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
            select 'descripcion unidad',@fdesuni,'' Mensaje1;
           
   		SET @ftexsql=CONCAT('SELECT Descripcion FROM secciones WHERE idSeccion=',"'",TRIM(pidseccion),"'",' INTO @fdessec');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'seccion ',@fdessec,'' Mensaje2;
           
   		SET @ftexsql=CONCAT('SELECT ApellidoAgente,NombreAgente FROM agentes WHERE idAgente=',"'",TRIM(pidagente),"'",' INTO @fapeemp,@fnomemp');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'apellidoyynombre',@fapeemp,@fnomemp,'' Mensaje3;
           
		   IF NOT ISNULL(@fdesuni) AND NOT ISNULL(@fdessec) AND NOT ISNULL(@fapeemp) AND NOT ISNULL(@fnomemp) THEN
		      SET fdesemp=CONCAT(TRIM(@fapeemp),", ",TRIM(@fnomemp));
				SET @ftexsql=CONCAT('INSERT INTO movimientounidades (idUnidad,idAgenteIngreso,FechaIngresoUnidad,DesMotivoFalla,idSeccion,DesSeccion,DesUsuIng,idAgenteRetiro,',
				    'FechaRetiraUnidad,DesUsuRet,FecAnuMov,DesUsuAnu,DesMotAnu,Estado) VALUES (',"'",TRIM(pidunidad),"','",TRIM(pidagente),"','",CAST(ffecgra AS CHAR),"','",TRIM(pdesmotivofalla),"','",
					 TRIM(pidseccion),"','",TRIM(@fdessec),"','",TRIM(pnomusu),"','",'',"','",'',"','",'',"','",'',"','",'',"','",'',"','",'1',"')");
               PREPARE fordsql FROM @ftexsql;
		      EXECUTE fordsql;
		      SELECT @@identity INTO @fnroret;
		      DEALLOCATE PREPARE fordsql;
              select 'se grabó correctamente la orden de trabajo' Mensaje;
		      
             /*  IF NOT ISNULL(@fnroret) THEN
  					SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(ptabauxrep),' INTO @fmaxite');
	 	     	   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
			      DEALLOCATE PREPARE fordsql;
                  if (@fmaxite = 0 || isnull(@fmaxite)) THEN
					select 'CARRITO VACIO' Mensaje;
                    leave SALIR;
				end if;
                  
                  SET fconite=0;
			      /*WHILE fconite<=(@fmaxite-1) DO
	  					/*SET @ftexsql=CONCAT('SELECT product,name,qty FROM ',TRIM(ptabauxart),' WHERE nrointite=',"'",CAST(fconite AS CHAR),"'",
						    ' INTO @fcodart,@fdesart,@fnrouni');*/
					/*	SET @ftexsql=CONCAT('SELECT idRepuesto,DesRepuesto,CantidadSolicitada FROM ',TRIM(ptabauxrep),'  LIMIT ',(fconite),',1 INTO @fcodart,@fdesart,@fnrouni');
		 	     	   PREPARE fbusart FROM @ftexsql;
				      EXECUTE fbusart;
				      DEALLOCATE PREPARE fbusart;
                     
                     SET fconite=fconite+1;
							SET @ftexsql=CONCAT('INSERT INTO lineasretirorepuestos (idRetiro,NroIteracion,idRepuesto,DesRepuesto,CantidadSolicitada) VALUES (',"'",CAST(@fnroret AS CHAR),"','",
							 CAST(fconite AS CHAR),"','",CAST(@fcodart AS CHAR),"','",TRIM(@fdesart),"','",CAST(@fnrouni AS CHAR),"')");
  			     	   PREPARE fgraart FROM @ftexsql;
				      EXECUTE fgraart;
				      DEALLOCATE PREPARE fgraart;
                   
                   /*IF @fcodart>1 THEN
					SET @ftexsql=CONCAT('SELECT BanStockRep FROM repuestos WHERE idRepuesto=',"'",CAST(@fcodart AS CHAR ),"'",' INTO @factstk');
 		     	   PREPARE fbuspar FROM @ftexsql;
			      EXECUTE fbuspar;
		   	   DEALLOCATE PREPARE fbuspar;
               select 'act.stock ',@factstk,'' Mensaje;*/
		      	/* ACTUALIZA STOCK */
			      /*IF @factstk=1 THEN*/
					/*	SET @ftexsql=CONCAT('CALL sp_actualiza_stock_repuesto(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
							 '-',"','",'1',"','",TRIM(pnomusu),"')");
	 	   	  	   PREPARE fbuspar FROM @ftexsql;
			   	   EXECUTE fbuspar;
			      	DEALLOCATE PREPARE fbuspar;
                    select 'stock descontado' Mensaje;
				      /* GRABA FICHA DEL ARTICULO */
				    /*  SET fdescom=CONCAT('RET Nº ',LPAD(@fnroret,10,'0'));
					   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'101',"','",CAST(@fnrouni AS CHAR),"','",
							 TRIM(fdescom),"','",'-',"','",'1',"','",'0',"','",'RETIRO DE ARTICULOS',"','",TRIM(pnomusu),
							 "')");
					   PREPARE fgrafar FROM @ftexsql;
					   EXECUTE fgrafar;
					   DEALLOCATE PREPARE fgrafar;
                       select 'ok ficha de repuesto' Mensaje;
					   /* ACTUALIZA DetRetDep */
					/*	SET @ftexsql=CONCAT('UPDATE lineasretirorepuestos SET BanActStock=1 WHERE idRetiro=',
							 "'",CAST(@fnroret AS CHAR),"'",' AND NroIteracion=',"'",CAST(fconite AS CHAR),"'");
						PREPARE fordact FROM @ftexsql;
						EXECUTE fordact;
						DEALLOCATE PREPARE fordact;
                        select 'ok set lineasretiro' Mensaje;
			      
			END WHILE;
            select 'fin while' Mensaje;*/
				/*END IF;
				
                select 'La orden de trabajo creada con éxito' Mensaje;*/
			END IF;
            
             /* DEVUELVE RESULTADO DE LA OPERACION */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002,valret003) VALUES (',"'",'1',"','",CAST(@fnroret AS CHAR),"','",
				 CAST(ffecmov AS CHAR),"')");
        	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
	   	DEALLOCATE PREPARE fordsql;
        SELECT 'guardar id orden de trabajo en tabaux' Mensaje;
        
          /*BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
			/*SET @ftexsql=CONCAT('DELETE FROM ',TRIM(ptabauxrep),' WHERE idUsuario=',TRIM(pidusuario),'');
			PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
				SELECT 'borrar datos del carrito por usuario' Mensaje;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_repuesto_aplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_repuesto_aplicado`(
	IN `pidaplicacion` BIGINT,
	IN `pobservacion` VARCHAR(250),
    IN `pnomusu` VARCHAR(50)
    
)
    COMMENT 'Aplicación de Repuesto'
SALIR:BEGIN
	DECLARE fconite INTEGER;
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE fdesemp,fdescom VARCHAR(100);
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoretiros';
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar,fborrep CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
  /* PROCESO DE AUTORIZACION */
   		  /* ACTUALIZA encretdep */
			SET @ftexsql=CONCAT('UPDATE aplicaciones SET Aplicado=',"'",'1',"',",'Observacion=',"'",TRIM(pobservacion),"',",'FechaApli=',"'",CAST(ffecgra AS CHAR),"',",'DesUsuApl=',"'",
				 TRIM(pnomusu),"'",' WHERE idAplicacion=',"'",CAST(pidaplicacion AS CHAR),"'");
     	   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
	      DEALLOCATE PREPARE fordsql;
          select 'ok repuesto aplicado' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_repuesto_aplicado_anulado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_repuesto_aplicado_anulado`(
	IN `pidaplicacion` BIGINT,
	IN `pmotanu` VARCHAR(250),
	IN `pnomusu` VARCHAR(50)
    
)
    COMMENT 'Anular Aplicación de Repuesto'
SALIR:BEGIN
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar,fborrep CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
		/* PROCESO DE ANULACION */
   		SET @ftexsql=CONCAT('SELECT Aplicado FROM aplicaciones WHERE idAplicacion=',"'",TRIM(pidaplicacion),"'",' INTO @festsol');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
		   	IF @festsol=1  THEN
	      	/* ACTUALIZA aplicaciones */
				SET @ftexsql=CONCAT('UPDATE aplicaciones SET Aplicado=',"'",'0',"',",'FechaAnul=',"'",CAST(ffecgra AS CHAR),"',",'UsuAnuApl=',"'",
					 TRIM(pnomusu),"',",'DesMotAnu=',"'",TRIM(pmotanu),"'",' WHERE idAplicacion=',"'",CAST(pidaplicacion AS CHAR),"'");
	     	   PREPARE fordsql FROM @ftexsql;
		      EXECUTE fordsql;
	   	   DEALLOCATE PREPARE fordsql;
           select 'ok repuesto aplicado anulado' Mensaje;
           ELSE
				select 'No se aplicó el repuesto' Mensaje2;
		   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_retiro_anulado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_retiro_anulado`(
	IN `pidretiro` BIGINT,
	IN `pmotanu` VARCHAR(250),
	IN `pnomusu` VARCHAR(50)
    
)
    COMMENT 'Anular Orden de Retiro de Repuesto'
SALIR:BEGIN
	DECLARE fconite INTEGER;
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE fdesemp,fdescom VARCHAR(100);
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoretiros';
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar,fborrep CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
		/* PROCESO DE ANULACION */
   		SET @ftexsql=CONCAT('SELECT EstadoSolicitud FROM retirorepuestos WHERE idRetiro=',"'",TRIM(pidretiro),"'",' INTO @festsol');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
		   /*IF @festsol=1 OR @festsol=2 OR @festsol=3 THEN*/
		   	IF @festsol=1 OR @festsol=2 OR @festsol=3 THEN
					SET @ftexsql=CONCAT('SELECT MAX(NroIteracion) FROM lineasretirorepuestos WHERE idRetiro=',"'",CAST(pidretiro AS CHAR),"'",' INTO @fmaxite');
	  			   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
	   		   DEALLOCATE PREPARE fordsql;
               select 'nro max ite en lineasretiro',@fmaxite,'' Mensaje;
			      /* PROCESA ARTICULOS DE LA LISTA */
	   		   SET fconite=1;
               
			      WHILE fconite<=@fmaxite DO
						SET @ftexsql=CONCAT('SELECT idRepuesto,CantidadSolicitada,BanActStock FROM lineasretirorepuestos WHERE idRetiro=',"'",CAST(pidretiro AS CHAR),"'",
							 ' AND
                             NroIteracion=',"'",CAST(fconite AS CHAR),"'",' INTO @fcodart,@fnrouni,@factstk');
                   PREPARE fbusart FROM @ftexsql;
				      EXECUTE fbusart;
				      DEALLOCATE PREPARE fbusart;
                      select 'ok' Mensaje;
				      
				      	/* ACTUALIZA STOCK */
							SET @ftexsql=CONCAT('CALL sp_actualiza_stock_repuesto(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
								 '+',"','",'1',"','",TRIM(pnomusu),"')");
						PREPARE fbuspar FROM @ftexsql;
						EXECUTE fbuspar;
						DEALLOCATE PREPARE fbuspar;
						select 'ACT. STOCK' Mensaje;
					      /* GRABA FICHA DEL ARTICULO */
					      SET fdescom=CONCAT('RET Nº ',LPAD(pidretiro,10,'0'));
						   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'201',"','",CAST(@fnrouni AS CHAR),"','",
								 TRIM(fdescom),"','",'+',"','",'1',"','",'0',"','",'ANULACION RETIRO DE ARTICULOS',
								 "','",TRIM(pnomusu),"')");
						   PREPARE fgrafar FROM @ftexsql;
							EXECUTE fgrafar;
						   DEALLOCATE PREPARE fgrafar;
                           select 'grabar ficha' Mensaje;
				      
			      	SET fconite=fconite+1;
			      END WHILE;
                  select 'fin while' Mensaje;
		   	/*END IF;*/
            
	      	/* ACTUALIZA EncRetDep */
				SET @ftexsql=CONCAT('UPDATE retirorepuestos SET EstadoSolicitud=',"'",'9',"',",'FecAnuSol=',"'",CAST(ffecgra AS CHAR),"',",'UsuAnuSol=',"'",
					 TRIM(pnomusu),"',",'DesMotAnu=',"'",TRIM(pmotanu),"'",' WHERE idRetiro=',"'",CAST(pidretiro AS CHAR),"'");
	     	   PREPARE fordsql FROM @ftexsql;
		      EXECUTE fordsql;
	   	   DEALLOCATE PREPARE fordsql;
           select 'ok9' Mensaje;
		   END IF;
  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_retiro_autorizado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_retiro_autorizado`(
	IN `pidretiro` BIGINT,
	IN `pnomusu` VARCHAR(50)
    
)
    COMMENT 'Autoriza Orden de Retiro de Repuesto'
SALIR:BEGIN
	DECLARE fconite INTEGER;
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE fdesemp,fdescom VARCHAR(100);
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoretiros';
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar,fborrep CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
  /* PROCESO DE AUTORIZACION */
   		SET @ftexsql=CONCAT('UPDATE retirorepuestos SET FecAutRet=',"'",CAST(ffecgra AS CHAR),"',",'UsuAutRet=',"'",TRIM(pnomusu),"',",'EstadoSolicitud=',"'",
				 '2',"'",' WHERE idRetiro=',"'",CAST(pidretiro AS CHAR),"'");
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
			select 'Autorizado N° retiro',TRIM(pidretiro),'' Mensaje;
   		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_retiro_cerrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_retiro_cerrado`(
	
	IN `pidunidad` VARCHAR(6),
	IN `punidadtaller` CHAR(1),
	IN `pordentrabajo` VARCHAR(10),
	IN `pidseccion` CHAR(5),
	IN `pidagente` VARCHAR(6),
	IN `pnomusu` VARCHAR(50),
    IN `pidusuario` VARCHAR(8)
    
)
    COMMENT 'Graba Orden de Retiro de Repuesto'
SALIR:BEGIN
	DECLARE fconite INTEGER;
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE fdesemp,fdescom VARCHAR(100);
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoretiros';
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar,fborrep CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
  
   		/* PROCESO DE CIERRE */
   		SET @ftexsql=CONCAT('SELECT Descripcion FROM unidades WHERE idUnidad=',"'",TRIM(pidunidad),"'",' INTO @fdesuni');
		   PREPARE fordsql FROM @ftexsql;
           EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
            select 'descripcion unidad',@fdesuni,'' Mensaje;
           
   		SET @ftexsql=CONCAT('SELECT Descripcion FROM secciones WHERE idSeccion=',"'",TRIM(pidseccion),"'",' INTO @fdessec');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'seccion ',@fdessec,'' Mensaje;
           
   		SET @ftexsql=CONCAT('SELECT ApellidoAgente,NombreAgente FROM agentes WHERE idAgente=',"'",TRIM(pidagente),"'",' INTO @fapeemp,@fnomemp');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'apellidoyynombre',@fapeemp,@fnomemp,'' Mensaje;
           
		   IF NOT ISNULL(@fdesuni) AND NOT ISNULL(@fdessec) AND NOT ISNULL(@fapeemp) AND NOT ISNULL(@fnomemp) THEN
		      SET fdesemp=CONCAT(TRIM(@fapeemp),", ",TRIM(@fnomemp));
				SET @ftexsql=CONCAT('INSERT INTO retirorepuestos (idUnidad,UnidadTaller,OrdenTrabajo,idSeccion,DesSeccion,idAgente,DesAgente,FecGraSol,',
				    'UsuGraSol,EstadoSolicitud) VALUES (',"'",TRIM(pidunidad),"','",TRIM(punidadtaller),"','",TRIM(pordentrabajo),"','",TRIM(pidseccion),"','",
					 TRIM(@fdessec),"','",TRIM(pidagente),"','",TRIM(fdesemp),"','",CAST(ffecgra AS CHAR),"','",TRIM(pnomusu),"','",'1',"')");
               PREPARE fordsql FROM @ftexsql;
		      EXECUTE fordsql;
		      SELECT @@identity INTO @fnroret;
		      DEALLOCATE PREPARE fordsql;
              select 'aaaaa' Mensaje;
		      
               IF NOT ISNULL(@fnroret) THEN
  					SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(ptabauxrep),' INTO @fmaxite');
	 	     	   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
			      DEALLOCATE PREPARE fordsql;
                  if (@fmaxite = 0 || isnull(@fmaxite)) THEN
					select 'CARRITO VACIO' Mensaje;
                    leave SALIR;
				end if;
                  
                  SET fconite=0;
			      WHILE fconite<=(@fmaxite-1) DO
	  					/*SET @ftexsql=CONCAT('SELECT product,name,qty FROM ',TRIM(ptabauxart),' WHERE nrointite=',"'",CAST(fconite AS CHAR),"'",
						    ' INTO @fcodart,@fdesart,@fnrouni');*/
						SET @ftexsql=CONCAT('SELECT idRepuesto,DesRepuesto,CantidadSolicitada FROM ',TRIM(ptabauxrep),'  LIMIT ',(fconite),',1 INTO @fcodart,@fdesart,@fnrouni');
		 	     	   PREPARE fbusart FROM @ftexsql;
				      EXECUTE fbusart;
				      DEALLOCATE PREPARE fbusart;
                     
                     SET fconite=fconite+1;
							SET @ftexsql=CONCAT('INSERT INTO lineasretirorepuestos (idRetiro,NroIteracion,idRepuesto,DesRepuesto,CantidadSolicitada) VALUES (',"'",CAST(@fnroret AS CHAR),"','",
							 CAST(fconite AS CHAR),"','",CAST(@fcodart AS CHAR),"','",TRIM(@fdesart),"','",CAST(@fnrouni AS CHAR),"')");
  			     	   PREPARE fgraart FROM @ftexsql;
				      EXECUTE fgraart;
				      DEALLOCATE PREPARE fgraart;
                   
                   /*IF @fcodart>1 THEN
					SET @ftexsql=CONCAT('SELECT BanStockRep FROM repuestos WHERE idRepuesto=',"'",CAST(@fcodart AS CHAR ),"'",' INTO @factstk');
 		     	   PREPARE fbuspar FROM @ftexsql;
			      EXECUTE fbuspar;
		   	   DEALLOCATE PREPARE fbuspar;
               select 'act.stock ',@factstk,'' Mensaje;*/
		      	/* ACTUALIZA STOCK */
			      /*IF @factstk=1 THEN*/
						SET @ftexsql=CONCAT('CALL sp_actualiza_stock_repuesto(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
							 '-',"','",'1',"','",TRIM(pnomusu),"')");
	 	   	  	   PREPARE fbuspar FROM @ftexsql;
			   	   EXECUTE fbuspar;
			      	DEALLOCATE PREPARE fbuspar;
                    select 'stock descontado' Mensaje;
				      /* GRABA FICHA DEL ARTICULO */
				      SET fdescom=CONCAT('RET Nº ',LPAD(@fnroret,10,'0'));
					   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'101',"','",CAST(@fnrouni AS CHAR),"','",
							 TRIM(fdescom),"','",'-',"','",'1',"','",'0',"','",'RETIRO DE ARTICULOS',"','",TRIM(pnomusu),
							 "')");
					   PREPARE fgrafar FROM @ftexsql;
					   EXECUTE fgrafar;
					   DEALLOCATE PREPARE fgrafar;
                       select 'ok ficha de repuesto' Mensaje;
					   /* ACTUALIZA DetRetDep */
						SET @ftexsql=CONCAT('UPDATE lineasretirorepuestos SET BanActStock=1 WHERE idRetiro=',
							 "'",CAST(@fnroret AS CHAR),"'",' AND NroIteracion=',"'",CAST(fconite AS CHAR),"'");
						PREPARE fordact FROM @ftexsql;
						EXECUTE fordact;
						DEALLOCATE PREPARE fordact;
                        select 'ok set lineasretiro' Mensaje;
			      
			END WHILE;
            select 'fin while' Mensaje;
				END IF;
				
                select 'La orden de cierre creada con éxito' Mensaje;
			END IF;
            
             /* DEVUELVE RESULTADO DE LA OPERACION */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002,valret003) VALUES (',"'",'1',"','",CAST(@fnroret AS CHAR),"','",
				 CAST(ffecmov AS CHAR),"')");
        	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
	   	DEALLOCATE PREPARE fordsql;
        SELECT 'guardar id retiro en tabaux' Mensaje;
        
          /*BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
			SET @ftexsql=CONCAT('DELETE FROM ',TRIM(ptabauxrep),' WHERE idUsuario=',TRIM(pidusuario),'');
			PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
				SELECT 'borrar datos del carrito por usuario' Mensaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grabar_retiro_entregado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grabar_retiro_entregado`(
	IN `pidretiro` BIGINT,
	IN `pnomusu` VARCHAR(50)
    
)
    COMMENT 'Entrega de Repuesto'
SALIR:BEGIN
	DECLARE fconite INTEGER;
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE fdesemp,fdescom VARCHAR(100);
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'lineasretirorepuestos';
    DECLARE ptabretiro VARCHAR(30) default 'retirorepuestos';
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar,fborrep,fgraapl CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
  /* PROCESO DE ENTREGA */
			/* contar la cantidad de lineas de repuestos de la orden de entrega*/
			IF NOT ISNULL(pidretiro) THEN
  					SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(ptabauxrep),' WHERE idRetiro=',TRIM(pidretiro),' INTO @fmaxite');
	 	     	   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
			      DEALLOCATE PREPARE fordsql;
                  select '',TRIM(@fmaxite),'' Mensaje;
                  if (@fmaxite = 0 || isnull(@fmaxite)) THEN
					select 'Orden de Retiro sin item/s' Mensaje;
                    leave SALIR;
				end if;
			END IF;
            
				   SET @ftexsql=CONCAT('SELECT idUnidad,OrdenTrabajo FROM ',TRIM(ptabretiro),' WHERE idRetiro=',TRIM(pidretiro),' INTO @fcoduni,@fcodord');
	 	     	   PREPARE fordsql FROM @ftexsql;
			       EXECUTE fordsql;
			       DEALLOCATE PREPARE fordsql;
				   select '',TRIM(@fcoduni),TRIM(@fcodord),'' Mensaje;
            
		
        SET fconite=0;
        WHILE fconite<=(@fmaxite-1) DO
						SET @ftexsql=CONCAT('SELECT idRepuesto FROM ',TRIM(ptabauxrep),' WHERE idRetiro=',TRIM(pidretiro),'  LIMIT ',(fconite),',1 INTO @fcodart');
		 	     	   PREPARE fbusart FROM @ftexsql;
				      EXECUTE fbusart;
				      DEALLOCATE PREPARE fbusart;
                     select 'buscar repuesto id',TRIM(@fcodart),'' Mensaje;
                     SET fconite=fconite+1;
					 SET @ftexsql=CONCAT('INSERT INTO aplicaciones (idUnidad,idRepuesto,idMovUnidad,DesTipoAplicacion,Aplicado,Observacion,FechaGrab,DesUsuGra) VALUES (',"'",CAST(@fcoduni AS CHAR),"','",
					 CAST(@fcodart AS CHAR),"','",CAST(@fcodord AS CHAR),"',3,0,'NULL','",CAST(ffecgra AS CHAR),"','",TRIM(pnomusu),"')");
  			     	   PREPARE fgraapl FROM @ftexsql;
				      EXECUTE fgraapl;
				      DEALLOCATE PREPARE fgraapl;
					select 'agregar repuesto entregado pero no aplicado' Mensaje;
                   /*IF @fcodart>1 THEN
					SET @ftexsql=CONCAT('SELECT BanStockRep FROM repuestos WHERE idRepuesto=',"'",CAST(@fcodart AS CHAR ),"'",' INTO @factstk');
 		     	   PREPARE fbuspar FROM @ftexsql;
			      EXECUTE fbuspar;
		   	   DEALLOCATE PREPARE fbuspar;
               select 'act.stock ',@factstk,'' Mensaje;*/
		      	/* ACTUALIZA STOCK */
			      /*IF @factstk=1 THEN*/
						/*SET @ftexsql=CONCAT('CALL sp_actualiza_stock_repuesto(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
							 '-',"','",'1',"','",TRIM(pnomusu),"')");
	 	   	  	   PREPARE fbuspar FROM @ftexsql;
			   	   EXECUTE fbuspar;
			      	DEALLOCATE PREPARE fbuspar;
                    select 'stock descontado' Mensaje;*/
				      /* GRABA FICHA DEL ARTICULO */
				      /*SET fdescom=CONCAT('RET Nº ',LPAD(@fnroret,10,'0'));
					   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'101',"','",CAST(@fnrouni AS CHAR),"','",
							 TRIM(fdescom),"','",'-',"','",'1',"','",'0',"','",'RETIRO DE REPUESTOS NO APLICADO AUN',"','",TRIM(pnomusu),
							 "')");
					   PREPARE fgrafar FROM @ftexsql;
					   EXECUTE fgrafar;
					   DEALLOCATE PREPARE fgrafar;
                       select 'ok ficha de repuesto no aplicado' Mensaje;*/
					   /* ACTUALIZA DetRetDep */
						/*SET @ftexsql=CONCAT('UPDATE lineasretirorepuestos SET BanActStock=1 WHERE idRetiro=',
							 "'",CAST(@fnroret AS CHAR),"'",' AND NroIteracion=',"'",CAST(fconite AS CHAR),"'");
						PREPARE fordact FROM @ftexsql;
						EXECUTE fordact;
						DEALLOCATE PREPARE fordact;
                        select 'ok set lineasretiro' Mensaje;*/
			END WHILE;
        
   		  /* ACTUALIZA retirorepuestos */
			SET @ftexsql=CONCAT('UPDATE retirorepuestos SET EstadoSolicitud=',"'",'3',"',",'FecRetRep=',"'",CAST(ffecgra AS CHAR),"',",'UsuEntRep=',"'",
				 TRIM(pnomusu),"'",' WHERE idRetiro=',"'",CAST(pidretiro AS CHAR),"'");
     	   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
	      DEALLOCATE PREPARE fordsql;
          select 'ok3' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupos_activar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grupos_activar`(
	IN `pidgrupo` VARCHAR(50)
)
    COMMENT 'Activar Grupo de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM grupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' INTO @fcansgru');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM grupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' INTO @festgru');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcansgru>0 AND @festgru=0)  THEN
				SET @ftexsql=CONCAT('UPDATE grupos SET Estado = 1 WHERE idGrupo = (',"'",TRIM(pidgrupo),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se activó nuevamente la grupo con Id =',TRIM(pidgrupo),'') Mensaje;
            ELSE 
				SELECT CONCAT('El Grupo con Id =',TRIM(pidgrupo),' ya está dado de ALTA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupos_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grupos_alta`(
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Alta Grupo de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
    
    /*Descripcion Iguales de grupo*/ 
     SET @ftexsql=CONCAT('SELECT COUNT(*) FROM grupos WHERE Descripcion=',"'",TRIM(pdescripcion),"'",' INTO @fnomigu');
			  	PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
		   IF @fnomigu = 1 THEN
                select 'nombres iguales' Mensaje;
                rollback;
    		END IF;
    
	/* REALIZA PROCESO SOBRE TABLA */
    
			SET @ftexsql=CONCAT('INSERT INTO grupos (Descripcion) VALUES (',"'",TRIM(pdescripcion),"')");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
	      SELECT @@identity INTO @fnrocat;
		   DEALLOCATE PREPARE fordsql;
			/* CREA SUB GRUPO "SIN DATOS" */
			SET @ftexsql=CONCAT('INSERT INTO subgrupos (idGrupo,idSubGrupo,Descripcion) VALUES (',"'",CAST(@fnrocat AS CHAR),"','",'1',"','",'SIN DATOS',"')");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'Grupo Creado' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupos_baja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grupos_baja`(
	IN `pidgrupo` VARCHAR(50)
)
    COMMENT 'Baja Grupo de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM grupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' INTO @fcansgru');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM grupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' INTO @festgru');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
				IF (@fcansgru>0 AND @festgru=1) THEN
					SET @ftexsql=CONCAT('UPDATE grupos SET Estado = 0 WHERE idGrupo = (',"'",TRIM(pidgrupo),"')");
					PREPARE fordsql FROM @ftexsql;
					EXECUTE fordsql;
					DEALLOCATE PREPARE fordsql;
					select 'Baja de Grupo ID: ',TRIM(pidgrupo),'' Mensaje;
				ELSE 
					SELECT CONCAT('El Grupo con Id =',TRIM(pidgrupo),' ya está dado de BAJA') Mensaje;
				END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupos_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grupos_borrar`(
	IN `pidgrupo` VARCHAR(5)
)
    COMMENT 'Borrar grupo de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' INTO @fcanscat');
		  	/*AND idSubGrupo',"'",'1',"'",'*/
            
            PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
            DEALLOCATE PREPARE fordsql;
           select 'cantidad de grupos',@fcanscat,'' Mensaje;
		   IF ISNULL(@fcanscat) OR @fcanscat=1 THEN
		      /* BOORO SUB GRUPO 1 */
				SET @ftexsql=CONCAT('DELETE FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' AND idSubgrupo=',"'",'1',"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
				/* BORRO GRUPO */
				SET @ftexsql=CONCAT('DELETE FROM grupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
            SELECT 'Grupo borrado con ID:',pidgrupo,'' Mensaje;
		   ELSE
           SELECT 'Borrar primero los subgrupos antes de borrar el grupo' Mensaje;
		   END IF;
		
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupos_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grupos_listar`(
)
    COMMENT 'Listar todas los grupos de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT * FROM grupos');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupos_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grupos_modificar`(
	IN `pidgrupo` VARCHAR(5),
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Modificar Grupo de Repuestos'
SALIR:BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
		SET @ftexsql=CONCAT('SELECT COUNT(*) FROM grupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' INTO @fcansgru');
		PREPARE fordsql FROM @ftexsql;
		EXECUTE fordsql;
        
        IF length(pdescripcion) = 0 THEN
			select 'Falta completar campo Descripción' Mensaje;
			LEAVE SALIR;
		END IF;
        
		IF @fcansgru>0 THEN
			SET @ftexsql=CONCAT('UPDATE grupos SET Descripcion=',"'",TRIM(pdescripcion),"'",' WHERE idGrupo=',"'",TRIM(pidgrupo),"'");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			SELECT 'Grupo Modificado';
		ELSE 
			SELECT 'No existe Grupo' Mensaje;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_grupo_dame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_grupo_dame`(
	IN `pidgrupo` VARCHAR(5)
)
    COMMENT 'Dame un grupo de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT * FROM grupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",'');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcarepuestos_activar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcarepuestos_activar`(
	IN `pidmarcarepuesto` VARCHAR(50)
)
    COMMENT 'Activar Marca de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM marcarepuestos WHERE idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"'",' INTO @fcansmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM marcarepuestos WHERE idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"'",' INTO @festmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcansmar>0 AND @festmar=0)  THEN
				SET @ftexsql=CONCAT('UPDATE marcarepuestos SET Estado = 1 WHERE idMarcaRepuesto = (',"'",TRIM(pidmarcarepuesto),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se activó nuevamente la marca de repuesto con Id =',TRIM(pidmarcarepuesto),'') Mensaje;
            ELSE 
				SELECT CONCAT('La marca de repuesto con Id =',TRIM(pidmarcarepuesto),' ya está dado de ALTA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcarepuestos_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcarepuestos_alta`(
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Alta Marca de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
    
			SET @ftexsql=CONCAT('INSERT INTO marcarepuestos (Descripcion) VALUES (',"'",TRIM(pdescripcion),"')");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
	      /*SELECT @@identity INTO @fnrocat;*/
		   DEALLOCATE PREPARE fordsql;
			Select 'Creada la nueva marca de repuestos' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcarepuestos_baja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcarepuestos_baja`(
	IN `pidmarcarepuesto` VARCHAR(50)
)
    COMMENT 'Dar de baja una Marca de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM marcarepuestos WHERE idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"'",' INTO @fcansmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM marcarepuestos WHERE idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"'",' INTO @festmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcansmar>0 AND @festmar=1)  THEN
				SET @ftexsql=CONCAT('UPDATE marcarepuestos SET Estado = 0 WHERE idMarcaRepuesto = (',"'",TRIM(pidmarcarepuesto),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se dio de baja la marca de repuesto con Id =',TRIM(pidmarcarepuesto),'') Mensaje;
            ELSE 
				SELECT CONCAT('La marca de Repuesto con Id =',TRIM(pidmarcarepuesto),' ya está dado de BAJA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcarepuestos_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcarepuestos_borrar`(
	IN `pidmarcarepuesto` VARCHAR(5)
)
    COMMENT 'Borrar marca de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   
				/* BORRO MARCA de repuestos */
				SET @ftexsql=CONCAT('DELETE FROM marcarepuestos WHERE idMarcaRepuesto=',"'",TRIM(pidMarcaRepuesto),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
		   
           SELECT 'Marca de Repuesto Eliminada';
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcarepuestos_dame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcarepuestos_dame`(
	IN `pidmarcarepuesto` VARCHAR(5)
)
    COMMENT 'Dame una marca de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY MARCA DE REPUESTOS */
			SET @ftexsql=CONCAT('SELECT * FROM marcarepuestos WHERE idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"'",'');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcarepuestos_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcarepuestos_listar`(
)
    COMMENT 'Listar todas las marcas de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT * FROM marcarepuestos');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcarepuestos_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcarepuestos_modificar`(
	IN `pidmarcarepuesto` VARCHAR(5),
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Modificar Marca de Repuestos'
SALIR:BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
		SET @ftexsql=CONCAT('SELECT COUNT(*) FROM marcarepuestos WHERE idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"'",' INTO @fcansmar');
		PREPARE fordsql FROM @ftexsql;
		EXECUTE fordsql;
        
        IF length(pdescripcion) = 0 THEN
			select 'Falta completar campo Descripción' Mensaje;
			LEAVE SALIR;
		END IF;
        
		IF @fcansmar>0 THEN
			SET @ftexsql=CONCAT('UPDATE marcarepuestos SET Descripcion=',"'",TRIM(pdescripcion),"'",' WHERE idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"'");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			SELECT 'Marca de Repuesto Modificada';
		ELSE 
			SELECT 'No existe Marca de Repuesto' Mensaje;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcaunidades_activar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcaunidades_activar`(
	IN `pidmarcaunidad` VARCHAR(50)
)
    COMMENT 'Activar Marca de Unidades'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM marcaunidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' INTO @fcansmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM marcaunidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' INTO @festmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcansmar>0 AND @festmar=0)  THEN
				SET @ftexsql=CONCAT('UPDATE marcaunidades SET Estado = 1 WHERE idMarcaUnidad = (',"'",TRIM(pidmarcaunidad),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se activó nuevamente la marca de unidad con Id =',TRIM(pidmarcaunidad),'') Mensaje;
            ELSE 
				SELECT CONCAT('La marca de unidad con Id =',TRIM(pidmarcaunidad),' ya está dado de ALTA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcaunidades_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcaunidades_alta`(
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Alta Marca de Repuestos'
BEGIN
	DECLARE fnroasi INT DEFAULT 0;
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
    
			SET @ftexsql=CONCAT('INSERT INTO marcaunidades (Descripcion) VALUES (',"'",TRIM(pdescripcion),"')");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
	      SELECT @@identity INTO @fnroasi;
		   DEALLOCATE PREPARE fordsql;
			Select 'Creada la nueva marca de unidades' Mensaje;
            
            /* CREA "SIN MODELO" PARA LA MARCA */
			SET @ftexsql=CONCAT('INSERT INTO modelounidades (idMarcaUnidad,idModeloUnidad,Descripcion) VALUES (',"'",CAST(@fnroasi AS CHAR),"','",'1',"','",'SIN MODELO',"')");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           SELECT 'se agregó "SIN MODELO" a marca de unidades'
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcaunidades_baja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcaunidades_baja`(
	IN `pidmarcaunidad` VARCHAR(50)
)
    COMMENT 'Dar de baja una Marca de Unidad'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM marcaunidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' INTO @fcansmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM marcaunidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' INTO @festmar');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcansmar>0 AND @festmar=1)  THEN
				SET @ftexsql=CONCAT('UPDATE marcaunidades SET Estado = 0 WHERE idMarcaUnidad = (',"'",TRIM(pidmarcaunidad),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se dio de baja la marca de unidad con Id =',TRIM(pidmarcaunidad),'') Mensaje;
            ELSE 
				SELECT CONCAT('La marca de Unidad con Id =',TRIM(pidmarcaunidad),' ya está dado de BAJA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcaunidades_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcaunidades_borrar`(
	IN `pidmarcaunidad` VARCHAR(5)
)
    COMMENT 'Borrar marca de unidades'
BEGIN
	DECLARE fnroasi,fcanmod INT DEFAULT 0;
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   
           /* VERIFICA MODELOS DE LA MARCA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM modelounidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' INTO @fcanmod');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			select 'busca' Mensaje;
		    IF @fcanmod=1 THEN
				/* BORRA "SIN MODELO" DE LA MARCA */
				SET @ftexsql=CONCAT('DELETE FROM modelounidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' AND idModeloUnidad=',"'",'1',"'");
			  	PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
			    DEALLOCATE PREPARE fordsql;
				select 'Borra sin modelo' Mensaje;
				/* BORRO MARCA de repuestos */
				SET @ftexsql=CONCAT('DELETE FROM marcaunidades WHERE idMarcaUnidad=',"'",TRIM(pidMarcaUnidad),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
		   
           SELECT 'Marca de Unidad Eliminada';
           
           END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcaunidades_dame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcaunidades_dame`(
	IN `pidmarcaunidad` VARCHAR(5)
)
    COMMENT 'Dame una marca de unidad'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY MARCA DE REPUESTOS */
			SET @ftexsql=CONCAT('SELECT * FROM marcaunidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",'');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcaunidades_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcaunidades_listar`(
)
    COMMENT 'Listar todas las marcas de unidades'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT * FROM marcaunidades');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_marcaunidades_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_marcaunidades_modificar`(
	IN `pidmarcaunidad` VARCHAR(5),
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Modificar Marca de Unidades'
SALIR:BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
		SET @ftexsql=CONCAT('SELECT COUNT(*) FROM marcaunidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' INTO @fcansmar');
		PREPARE fordsql FROM @ftexsql;
		EXECUTE fordsql;
        
        IF length(pdescripcion) = 0 THEN
			select 'Falta completar campo Descripción' Mensaje;
			LEAVE SALIR;
		END IF;
        
		IF @fcansmar>0 THEN
			SET @ftexsql=CONCAT('UPDATE marcaunidades SET Descripcion=',"'",TRIM(pdescripcion),"'",' WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			SELECT 'Marca de Unidades Modificada';
		ELSE 
			SELECT 'No existe Marca de Unidad' Mensaje;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modelounidades_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modelounidades_alta`(
	IN `pidmarcaunidad` VARCHAR(6),
	IN `pdesmodelo` VARCHAR(50)

)
    COMMENT 'Alta Modelo de Unidades'
BEGIN

	DECLARE fcodmod INTEGER DEFAULT 0;
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION

   BEGIN

      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;

   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */

   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;

	/* REALIZA PROCESO SOBRE TABLA */
			/* BUSCA ULTIMO COD. MODELO DE LA MARCA */
		   SET @ftexsql=CONCAT('SELECT MAX(idModeloUnidad) FROM modelounidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' INTO @fcodmod'); 
			PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
            select 'buscar idmax' Mensaje;
	  		IF ISNULL(@fcodmod) THEN
		  	   SET @fcodmod=1;
		    ELSE
				SET @fcodmod=@fcodmod+1;
			END IF;
			SET @ftexsql=CONCAT('INSERT INTO modelounidades (idMarcaUnidad,idModeloUnidad,Descripcion) VALUES (',"'",TRIM(pidmarcaunidad),"','",CAST(@fcodmod AS CHAR),"','",TRIM(pdesmodelo),"')");
		  	PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
			select 'se Agregó correctamente el modelo de la Marca de Unidad' Mensaje;
			/* DEVUELVE COD. ASIGNADO */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001) VALUES (',"'",CAST(@fcodmod AS CHAR),"')");
			PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modelounidades_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modelounidades_borrar`(
	IN `pidmarcaunidad` VARCHAR(6),
	IN `pidmodelounidad` VARCHAR(6)

)
    COMMENT 'Borrar Modelo de Unidades'
BEGIN

	DECLARE fcodmod INTEGER DEFAULT 0;
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION

   BEGIN

      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	    EXECUTE fordsql;
	    DEALLOCATE PREPARE fordsql;
        ROLLBACK;
		END;

		/* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */

		SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
		PREPARE fordsql FROM @ftexsql;
		EXECUTE fordsql;
		DEALLOCATE PREPARE fordsql;
		START TRANSACTION;

		/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('DELETE FROM modelounidades WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' AND idModeloUnidad=',"'",TRIM(pidmodelounidad),"'");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
            select 'Borrar modelo de marca de unidades' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_modelounidades_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_modelounidades_modificar`(
	IN `pidmarcaunidad` VARCHAR(6),
	IN `pidmodelounidad` VARCHAR(6),
	IN `pdesmodelo` VARCHAR(50)

)
    COMMENT 'Modificar Modelo de Unidades'
BEGIN

	DECLARE fcodmod INTEGER DEFAULT 0;
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION

   BEGIN

      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	    EXECUTE fordsql;
	    DEALLOCATE PREPARE fordsql;
        ROLLBACK;
		END;

		/* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */

		SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
		PREPARE fordsql FROM @ftexsql;
		EXECUTE fordsql;
		DEALLOCATE PREPARE fordsql;
		START TRANSACTION;

		/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('UPDATE modelounidades SET Descripcion=',"'",TRIM(pdesmodelo),"'",' WHERE idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"'",' AND idModeloUnidad=',"'",TRIM(pidmodelounidad),"'");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
            select 'se modificó la Descripcion de modelo de marcar de unidad' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_repuestos_activar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repuestos_activar`(
	IN `pidrepuesto` VARCHAR(50)
)
    COMMENT 'Activar Repuesto'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			/*SET @ftexsql=CONCAT('SELECT COUNT(*) FROM repuestos WHERE repuestos=',"'",TRIM(pidrepuesto),"'",' INTO @fcanrep');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;*/
            
            SET @ftexsql=CONCAT('SELECT Estado FROM repuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' INTO @festrep');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            select 'select Estado' Mensaje;
            
		    IF @festrep=0  THEN
				SET @ftexsql=CONCAT('UPDATE repuestos SET Estado = 1,FechaBaja=',"(",'NULL',"),",'DesUsuBaj=',"(",'NULL',"),",'DesMotBaj=',"(",'NULL',")",
                ' WHERE idRepuesto = (',"'",TRIM(pidrepuesto),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se activó nuevamente el repuesto con Id =',TRIM(pidrepuesto),'') Mensaje;
            ELSE 
				SELECT CONCAT('El grupo con Id =',TRIM(pidrepuesto),' ya está dado de ALTA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_repuestos_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repuestos_alta`(

	IN `pidgrupo` CHAR(5),
	IN `pidsubgrupo` CHAR(5),
	IN `pidmarcarepuesto` VARCHAR(6),
	IN `pdescripcion` VARCHAR(100),
	IN `punidadmedida` VARCHAR(30),
	IN `pcodigo` VARCHAR(20),
    IN `ppreciocompra` VARCHAR(30),
	IN `pstock` VARCHAR(5),
	IN `pstockminimo` VARCHAR(5),
	IN `pnomusu` VARCHAR(50),
    IN `pfoto` VARCHAR(100)
    
    
)
    COMMENT 'Alta de Repuesto'
BEGIN

   DECLARE fnroasi,fvaraux,ffoudep,fmaxdep,ffouref,ffouexi,fnomigu INT DEFAULT 0;
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    /*DECLARE ptabdep VARCHAR(30) default 'existdepositos';*/
   DECLARE fexidep DECIMAL;
	DECLARE ffechoy DATETIME;
	DECLARE ffecgra DATE;
	DECLARE ftabdep VARCHAR(50) DEFAULT '';
	DECLARE fcoment VARCHAR(254) DEFAULT '';
   DECLARE ftexsql,fordsql,fordbus,fregfic,fregart,fdeldep CHAR DEFAULT '';

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */

   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
   SET ffecgra=CURDATE();
	/* REALIZA PROCESO SOBRE TABLA */
			/* ASIGNA COD. DE BARRA */
            SET @ftexsql=CONCAT('SELECT COUNT(*) FROM repuestos WHERE Descripcion=',"'",TRIM(pdescripcion),"'",' INTO @fnomigu');
			  	PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
		   IF @fnomigu = 1 THEN
    			
                select 'nombres iguales' Mensaje;
                rollback;
    		END IF;
			

			/* GRABA repuesto */
			SET @ftexsql=CONCAT('INSERT INTO repuestos (idGrupo,idSubGrupo,idMarcaRepuesto,Descripcion,UnidadMedida,Codigo,PrecioCompra,Stock,StockMinimo,',
				'FechaGrab,DesUsuGra,Foto) VALUES (',"'",TRIM(pidgrupo),"','",TRIM(pidsubgrupo),"','",TRIM(pidmarcarepuesto),"','",TRIM(pdescripcion),"','",
				TRIM(punidadmedida),"','",TRIM(pcodigo),"','",TRIM(ppreciocompra),"','",TRIM(pstock),"','",TRIM(pstockminimo),"','",
				CAST(ffechoy AS CHAR),"','",TRIM(pnomusu),"','",TRIM(pfoto),"')");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
	      SELECT @@identity INTO @fnroasi;
		   DEALLOCATE PREPARE fordsql;
           select 'okk' Mensaje;
           
		   /* ASIGNA COD. DE BARRA */
		   IF STRCMP(TRIM(pcodigo),'codigo')=0 THEN
    			SET @ftexsql=CONCAT('UPDATE repuestos SET Codigo=',"'",CAST(@fnroasi AS CHAR),"'",' WHERE idRepuesto=',"'",CAST(@fnroasi AS CHAR),"'");
			  	PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
                select 'asigna codigo interno de barra igual a id Repuesto' Mensaje;
    		END IF;
           
			/* REGISTRA FICHA DEL REPUESTO */
		   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fnroasi AS CHAR),"','",'1',"','",TRIM(pstock),"','",'0',"','",
				 '',"','",'1',"','",'0',"','",'ALTA DEL REPUESTO',"','",TRIM(pnomusu),"')");
		   PREPARE fregfic FROM @ftexsql;
		   EXECUTE fregfic;
		   DEALLOCATE PREPARE fregfic;
           select 'Grabar Ficha del repuesto' Mensaje;
           /*
           	/* REGISTRA REPUESTOS EN TODOS LOS DEPOSITOS 
		   SET @ftexsql=CONCAT('SELECT MAX(idDeposito) FROM depositos WHERE idDeposito>',"'",'0',"'",' AND idDeposito<',"'",'9999',"'",' INTO @fmaxdep');
		   PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           
		   IF NOT ISNULL(@fmaxdep) AND @fmaxdep>0 THEN
				SET fvaraux=0;
				WHILE fvaraux<=@fmaxdep DO
				   SET @ftexsql=CONCAT('SELECT COUNT(*) FROM depositos INTO @ffoudep');
				   PREPARE fordbus FROM @ftexsql;
			   	EXECUTE fordbus;
				   DEALLOCATE PREPARE fordbus;
				   IF @ffoudep=14 THEN
				   	/*SET ftabdep=CONCAT('exidep',LPAD(TRIM(CAST(fvaraux AS CHAR)),3,'0'));
						SET @ftexsql=CONCAT('CALL ssp_regartdep(',"'",CAST(@fnroasi AS CHAR),"','",'1',"','",TRIM(pnomusu),"','",'0',"','",
							 TRIM(ftabdep),"','",TRIM(ptabaux),"')");*/
					   /*SET @ftexsql=CONCAT('CALL sp_grabar_repuesto_deposito(',"'",CAST(@fnroasi AS CHAR),"','",fvaraux,"','",TRIM(pnomusu),"','",'0',"','",
							 ptabdep,"')");
					   PREPARE fregart FROM @ftexsql;
					   EXECUTE fregart;
					   DEALLOCATE PREPARE fregart;
                       select 'INT= ',TRIM(fvaraux),'' Mensaje;
					END IF;
					SET fvaraux=fvaraux+1;
				END WHILE;
                select 'fin del while' Mensaje;
    		END IF;
            */
			/* DEVUELVE COD. ASIGNADO */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001) VALUES (',"'",CAST(@fnroasi AS CHAR),"')");
   	  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
          
          select 'se grabó correctamente el repuesto' Mensaje;
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_repuestos_baja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repuestos_baja`(

	IN `pidrepuesto` VARCHAR(8),
    IN `pnomusu` VARCHAR(50),
    IN `pmotbajusu` VARCHAR(254)
    
)
    COMMENT 'Baja de Repuesto'
BEGIN
DECLARE fnroasi,fvaraux,ffoudep,fmaxdep,ffouref,ffouexi INT DEFAULT 0;
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE fexidep DECIMAL;
	DECLARE ffechoy DATETIME;
	DECLARE ffecgra DATE;
	DECLARE fcoment VARCHAR(254) DEFAULT '';
    DECLARE festrep CHAR DEFAULT '';
   DECLARE ftexsql,fordsql,fordbus,fregfic,fregart,fdeldep,fbusrep CHAR DEFAULT '';

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */

   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
   SET ffecgra=CURDATE();
   /* Verifica estado de repuesto */
            SET @ftexsql=CONCAT('SELECT Estado FROM repuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' INTO @festrep');
			  	PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select 'estado:' Mensaje;
		IF @festrep = 1 THEN
			/* BUSCA SI HAY REFERENCIAS NO BORRABLES */
			/*SET @ftexsql=CONCAT('SELECT COUNT(*) FROM movimientorepuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' AND idOpeStock>',"'",'99',"'",' INTO @ffouref');
			PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'referencias no borrables',@ffouref,'' Mensaje;    */ 
			/* GRABA BAJA DEL ARTICULO */
			SET @ftexsql=CONCAT('UPDATE repuestos SET FechaBaja=',"'",CAST(ffechoy AS CHAR),"',"'DesUsuBaj=',"'",TRIM(pnomusu),"',",'DesMotBaj=',"'",
								TRIM(pmotbajusu),"',",'Estado = 0 WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'se dio de baja el repuesto correctamente';
           
           /* REGISTRA FICHA DEL REPUESTO */
		   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'2',"','",'0',"','",'0',"','",
				 '',"','",'1',"','",'0',"','",'BAJA DEL REPUESTO',"','",TRIM(pnomusu),"')");
		   PREPARE fregfic FROM @ftexsql;
		   EXECUTE fregfic;
		   DEALLOCATE PREPARE fregfic;
           select 'Grabar Ficha baja del repuesto' Mensaje;
		
        ELSE
			
			select 'El repuesto ya está dado de Baja' Mensaje;
        END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_repuestos_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repuestos_borrar`(

	IN `pidrepuesto` VARCHAR(8),
    IN `pnomusu` VARCHAR(50)
    
)
    COMMENT 'Borrar Repuesto'
BEGIN
DECLARE fnroasi,fvaraux,ffoudep,fmaxdep,ffouref,ffouexi INT DEFAULT 0;
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabdep VARCHAR(30) default 'existdepositos';
   DECLARE fexidep DECIMAL;
	DECLARE ffechoy DATETIME;
	DECLARE ffecgra DATE;
	DECLARE fcoment VARCHAR(254) DEFAULT '';
   DECLARE ftexsql,fordsql,fordbus,fregfic,fregart,fdelmov,fbusseg CHAR DEFAULT '';

   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */

   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
   SET ffecgra=CURDATE();
   
			/* BUSCA SI HAY REFERENCIAS NO BORRABLES */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM movimientorepuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' AND idOpeStock>',"'",'99',"'",' INTO @ffouref');
			PREPARE fbusseg FROM @ftexsql;
		   EXECUTE fbusseg;
		   DEALLOCATE PREPARE fbusseg;
           select 'referencias no borrables',@ffouref,'' Mensaje;
			/* BUSCA SI HAY EXISTENCIA EN DEPOSITOS */
		   /*SET @ftexsql=CONCAT('SELECT MAX(idDeposito) FROM depositos WHERE idDeposito<',"'",'9999',"'",' INTO @fmaxdep');
		   PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'max dep ',@fmaxdep,'';
		   IF NOT ISNULL(@fmaxdep) AND @fmaxdep>0 THEN
				SET fvaraux=0;
				SET ffouexi=0;
				WHILE fvaraux<@fmaxdep DO
				   SET @ftexsql=CONCAT('SELECT COUNT(*) FROM depositos WHERE idDeposito=',"'",CAST(fvaraux AS CHAR),"'",' INTO @ffoudep');
				   PREPARE fordbus FROM @ftexsql;
			   	EXECUTE fordbus;
				   DEALLOCATE PREPARE fordbus;
				   IF @ffoudep=1 THEN
				   /*	SET ftabdep=CONCAT('EXIDEP',LPAD(TRIM(CAST(fvaraux AS CHAR)),3,'0'));
						SET @ftexsql=CONCAT('SELECT Exidep FROM ',ptabdep,' WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' AND idDeposito=',"'",CAST(fvaraux AS CHAR),"'",' INTO @fexidep');
					   PREPARE fbusexi FROM @ftexsql;
						EXECUTE fbusexi;
					   DEALLOCATE PREPARE fbusexi;
                      
					   IF NOT ISNULL(@fexidep) AND @fexidep<>0 THEN
					      SET ffouexi=1;
					      SET fvaraux=@fmaxdep;
						END IF;
					END IF;
					SET fvaraux=fvaraux+1;
				END WHILE;
                select 'fin del primer while' Mensaje;
    		END IF;*/
			IF @ffouref=0 THEN
			   /* BORRA DE LA TABLA DE SEGUIMIENTO */
				SET @ftexsql=CONCAT('DELETE FROM movimientorepuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'");
				PREPARE fdelmov FROM @ftexsql;
			   EXECUTE fdelmov;
			   DEALLOCATE PREPARE fdelmov;
               select 'borrado de movimiento de repuestos' Mensaje;
			   
				/* BORRA REGISTRO EN DEPOSITOS */
				/*SET fvaraux=0;*/
					
					/*	SET @ftexsql=CONCAT('DELETE FROM ',ptabdep,' WHERE idRepuesto=',"'",TRIM(pidRepuesto),"'");
					   PREPARE fdeldep FROM @ftexsql;
						EXECUTE fdeldep;
					   DEALLOCATE PREPARE fdeldep;
					
                    select 'borrado completo de la tabla existdepositos' Mensaje;*/
			END IF;
			/* GRABA BORRADO DEL ARTICULO */
			SET @ftexsql=CONCAT('DELETE FROM repuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
            /* REGISTRA FICHA DEL REPUESTO */
		   /*SET fcoment=CONCAT('BORRADO EL REPUESTO ID');
		   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'7',"','",'0',"','",'0',"','",
				 '',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
		   PREPARE fregfic FROM @ftexsql;
		   EXECUTE fregfic;
		   DEALLOCATE PREPARE fregfic;
           select 'graba ficha de borrado' Mensaje;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_repuestos_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repuestos_listar`(
)
    COMMENT 'Listar todos los repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT * FROM repuestos');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_repuestos_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_repuestos_modificar`(
	IN `pidrepuesto` VARCHAR(8),
    IN `pidgrupo` CHAR(5),
	IN `pidsubgrupo` CHAR(5),
	IN `pidmarcarepuesto` VARCHAR(6),
	IN `pdescripcion` VARCHAR(100),
	IN `punidadmedida` VARCHAR(30),
	IN `pcodigo` VARCHAR(20),
    IN `pstock` VARCHAR(5),
	IN `pstockminimo` VARCHAR(5),
	IN `pestado` CHAR(1),
	IN `pnomusu` VARCHAR(50)

)
    COMMENT 'Modificar Repuesto'
BEGIN
   DECLARE fnroasi,fvaraux,ffoudep,fmaxdep,ffouref,ffouexi INT DEFAULT 0;
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE ptabdep VARCHAR(30) default 'existdepositos';
   DECLARE fexidep DECIMAL;
	DECLARE ffechoy DATETIME;
	DECLARE ffecgra DATE;
	DECLARE ftabdep VARCHAR(50) DEFAULT '';
	DECLARE fcoment VARCHAR(254) DEFAULT '';
   DECLARE ftexsql,fordsql,fordbus,fregfic,fregart,fdeldep CHAR DEFAULT '';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
   SET ffecgra=CURDATE();   
	/* REALIZA PROCESO SOBRE TABLA */
		IF pestado = 1 THEN
			   /* RECUPERA VALORES ANTERIORES */
				SET @ftexsql=CONCAT('SELECT Descripcion,UnidadMedida,Codigo,idMarcaRepuesto,
					  idGrupo,idSubGrupo,Stock,StockMinimo,Estado ',
					 'FROM repuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' INTO @fdesant,@fumeant,@fcodant,@fmarant,@fcatant,@fscatant,',
					 '@fstkant,@fstmant,@festant');
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
               select 'okokok' Mensaje;
			   /* GRABA MODIFICACION DEL ARTICULO */
				SET @ftexsql=CONCAT('UPDATE repuestos SET Descripcion=',"'",TRIM(pdescripcion),"',",'UnidadMedida=',"'",TRIM(punidadmedida),"',",'Codigo=',"'",
					 TRIM(pcodigo),"',",'idMarcaRepuesto=',"'",TRIM(pidmarcarepuesto),"',",'idGrupo=',"'",
                     TRIM(pidgrupo),"',",'idSubGrupo=',"'",TRIM(pidsubgrupo),"',",'Stock=',"'",TRIM(pstock),"',",'StockMinimo=',"'",
					 TRIM(pstockminimo),"',",'Estado=',"'",'1',"',",'FechaBaja=',"(",'NULL',"),",'DesUsuBaj=',"(",'NULL',"),",'DesMotBaj=',"(",'NULL',")",
					 ' WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'");      
               PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
               select 'modificado el repuesto' Mensaje;
               /* REGISTRA FICHA DEL ARTICULO */
			   IF STRCMP(TRIM(pdescripcion),TRIM(@fdesant))<>0 THEN
			      SET fcoment=CONCAT('DESCRIPCION - ANT:',TRIM(@fdesant),' ACT:',TRIM(pdescripcion));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de descripción de repuesto' Mensaje;
			   END IF;
               
               IF STRCMP(TRIM(punidadmedida),TRIM(@fumeant))<>0 THEN
			      SET fcoment=CONCAT('UNI. MED. - ANT:',TRIM(@fumeant),' ACT:',TRIM(punidadmedida));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de unidad de medida de repuesto' Mensaje;
			   END IF;
               
                IF (STRCMP(TRIM(pcodigo),TRIM(@fcodant))<>0 AND STRCMP(TRIM(pcodigo),'entidad')<>0) THEN
			      SET fcoment=CONCAT('COD. BARRA - ANT:',TRIM(@fcodant),' ACT:',TRIM(pcodigo));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de codigo interno de barra de repuesto' Mensaje;
			   END IF;
             
             IF STRCMP(TRIM(pidmarcarepuesto),TRIM(@fmarant))<>0 THEN
			      SET fcoment=CONCAT('MARCA - ANT:',TRIM(@fmarant),' ACT:',TRIM(pidmarcarepuesto));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de marca de repuesto' Mensaje;
			   END IF;
               
                IF STRCMP(TRIM(pidgrupo),TRIM(@fcatant))<>0 THEN
			      SET fcoment=CONCAT('GRUPO - ANT:',TRIM(@fcatant),' ACT:',TRIM(pidgrupo));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de grupo de repuesto' Mensaje;
			   END IF;
               
                  IF STRCMP(TRIM(pidsubgrupo),TRIM(@fscatant))<>0 THEN
			      SET fcoment=CONCAT('SUBGRUPO - ANT:',TRIM(@fscatant),' ACT:',TRIM(pidsubgrupo));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de subGrupo de repuesto' Mensaje;
			   END IF;
               
               IF STRCMP(TRIM(pstock),TRIM(@fstkant))<>0 THEN
			      SET fcoment=CONCAT('ACT. STOCK - ANT:',TRIM(@fstkant),' ACT:',TRIM(pstock));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",TRIM(pstock),"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de act. bandera de stock de repuesto' Mensaje;
			   END IF;
               
               IF STRCMP(TRIM(pstockminimo),TRIM(@fstmant))<>0 THEN
			      SET fcoment=CONCAT('STOCK MINIMO - ANT:',TRIM(@fstmant),' ACT:',TRIM(pstockminimo));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de stock minimo de repuesto' Mensaje;
			   END IF;
               
				IF STRCMP(TRIM(pestado),TRIM(@festant))<>0 THEN
			      SET fcoment=CONCAT('Estado - ANT:',TRIM(@festant),' ACT:',TRIM(pestado));
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
				   PREPARE fregfic FROM @ftexsql;
				   EXECUTE fregfic;
				   DEALLOCATE PREPARE fregfic;
                   select 'fichar cambio de estado de repuesto' Mensaje;
			   END IF;
		   /* ASIGNA COD. DE BARRA */
		   IF STRCMP(TRIM(pcodigo),'entidad')=0 THEN
				SET fcoment=CONCAT('COD. INT. ID:',TRIM(pidrepuesto));
                SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'3',"','",'0',"','",'0',"','",
					'',"','",'1',"','",'0',"','",fcoment,"','",TRIM(pnomusu),"')");
                    PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
    			SET @ftexsql=CONCAT('UPDATE repuestos SET Codigo=',"'",TRIM(pidrepuesto),"'",' WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'");
			  	PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql; 
                SELECT 'cambio de cod interno de barra por id' Mensaje; 
    		END IF;   
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subgrupos_activar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subgrupos_activar`(
	IN `pidgrupo` VARCHAR(5),
    IN `pidsubgrupo` VARCHAR(5)
)
    COMMENT 'Activar SubGrupo de Repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' AND idsubGrupo=',"'",TRIM(pidsubgrupo),"'",' INTO @fcansubcat');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado,Descripcion FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' AND idsubGrupo=',"'",TRIM(pidsubgrupo),"'",' INTO @festsubcat,@fdessubcat');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcansubcat>0 AND @festsubcat=0)  THEN
				SET @ftexsql=CONCAT('UPDATE subgrupos SET Estado = 1 WHERE idGrupo = (',"'",TRIM(pidgrupo),"') AND idsubGrupo = ('",TRIM(pidsubgrupo),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se activó nuevamente el Subgrupo con descripción =',TRIM(@fdessubcat),'') Mensaje;
            ELSE 
				SELECT CONCAT('El subgrupo con descripción =',TRIM(@fdessubcat),' ya está dado de ALTA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subgrupos_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subgrupos_alta`(
	IN `pidgrupo` VARCHAR(5),
    IN `pdescripcion` VARCHAR(50)

)
    COMMENT 'Alta Subgrupo de Repuesto'
BEGIN
	DECLARE fcodsgr INTEGER DEFAULT 0;
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ftexsql,fordsql CHAR DEFAULT '';
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	    EXECUTE fordsql;
	    DEALLOCATE PREPARE fordsql;
        ROLLBACK;
    END;

   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			/* BUSCA ULTIMO COD. SUG GRUPO ARTICULOS */

		   SET @ftexsql=CONCAT('SELECT MAX(idSubgrupo) FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' INTO @fcodsgr');
		   PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
	  		IF ISNULL(@fcodsgr) THEN
				SET @fcodsgr=1;
			ELSE
				SET @fcodsgr=@fcodsgr+1;
			END IF;

			/* GRABA SUB GRUPO */
			SET @ftexsql=CONCAT('INSERT INTO subgrupos (idGrupo,idSubgrupo,Descripcion) VALUES (',"'",TRIM(pidgrupo),"','",CAST(@fcodsgr AS CHAR),"','",TRIM(pdescripcion),"')");
		    PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			select 'SubGrupo creado' Mensaje;
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subgrupos_baja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subgrupos_baja`(
	IN `pidgrupo` VARCHAR(5),
    IN `pidsubgrupo` VARCHAR(5)
)
    COMMENT 'Dar de baja SubGrupo de Repuesto'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' AND idsubGrupo=',"'",TRIM(pidsubgrupo),"'",' INTO @fcansubcat');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado,Descripcion FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' AND idsubGrupo=',"'",TRIM(pidsubgrupo),"'",' INTO @festsubcat,@fdessubcat');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcansubcat>0 AND @festsubcat=1)  THEN
				SET @ftexsql=CONCAT('UPDATE subgrupos SET Estado = 0 WHERE idGrupo = (',"'",TRIM(pidgrupo),"') AND idsubGrupo = ('",TRIM(pidsubgrupo),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se dio de baja el subgrupo con descripción =',TRIM(@fdessubcat),'') Mensaje;
            ELSE 
				SELECT CONCAT('El subgrupo con descripción =',TRIM(@fdessubcat),' ya está dado de BAJA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subgrupos_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subgrupos_borrar`(
	IN `pidgrupo` VARCHAR(5),
    IN `pidsubgrupo` VARCHAR(5)
)
    COMMENT 'Borrar subgrupo de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   
				/* BORRO SUB Grupo */
				SET @ftexsql=CONCAT('DELETE FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"' AND idSubgrupo='",TRIM(pidsubgrupo),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
		   
           SELECT 'SubGrupo Eliminado';
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subgrupos_dame` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subgrupos_dame`(
	IN `pidgrupo` VARCHAR(5),
    IN `pidsubgrupo` VARCHAR(5)
)
    COMMENT 'Dame una subgrupo de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT * FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' AND idSubgrupo=',"'",TRIM(pidsubgrupo),"'",'');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subgrupos_listar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subgrupos_listar`(
)
    COMMENT 'Listar todos los grupos de repuestos'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   /* VERIFICO SI HAY SUB GRUPOS */
			SET @ftexsql=CONCAT('SELECT * FROM subgrupos');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_subgrupos_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_subgrupos_modificar`(
	IN `pidgrupo` VARCHAR(5),
    IN `pidsubgrupo` VARCHAR(5),
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Modificar SubGrupo de Repuestos'
SALIR:BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
		SET @ftexsql=CONCAT('SELECT COUNT(*) FROM subgrupos WHERE idGrupo=',"'",TRIM(pidgrupo),"'",' AND idSubgrupo=',"'",TRIM(pidsubgrupo),"'",' INTO @fcansubcat');
		PREPARE fordsql FROM @ftexsql;
		EXECUTE fordsql;
        
        IF length(pdescripcion) = 0 THEN
			select 'Falta completar campo Descripción' Mensaje;
			LEAVE SALIR;
		END IF;
        
		IF @fcansubcat>0 THEN
			SET @ftexsql=CONCAT('UPDATE subgrupos SET Descripcion=',"'",TRIM(pdescripcion),"'",' WHERE idGrupo = (',"'",TRIM(pidgrupo),"') AND idsubGrupo = ('",TRIM(pidsubgrupo),"')");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			SELECT 'Subgrupo modificado';
		ELSE 
			SELECT 'No existe subgrupo' Mensaje;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipocombustibles_activar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipocombustibles_activar`(
	IN `pidtipocomb` VARCHAR(5)
)
    COMMENT 'Activar Tipo de Combustible  de Unidades'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM tipocombustibles WHERE idTipoComb=',"'",TRIM(pidtipocomb),"'",' INTO @fcantipcomb');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            select 'count' Mensaje;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM tipocombustibles WHERE idTipoComb=',"'",TRIM(pidtipocomb),"'",' INTO @festtipcomb');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            select 'estado' Mensaje;
		    IF (@fcantipcomb>0 AND @festtipcomb=0)  THEN
				SET @ftexsql=CONCAT('UPDATE tipocombustibles SET Estado = 1 WHERE idTipoComb = (',"'",TRIM(pidtipocomb),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se activó nuevamente el tipo de combustible con id =',TRIM(pidtipocomb),'') Mensaje;
            ELSE 
				SELECT CONCAT('El tipo de combustible con id =',TRIM(pidtipocomb),' ya está dado de ALTA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipocombustibles_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipocombustibles_alta`(
    IN `pdescripcion` VARCHAR(50)

)
    COMMENT 'Alta tipo de combustibles de Unidades'
BEGIN
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ftexsql,fordsql CHAR DEFAULT '';
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	    EXECUTE fordsql;
	    DEALLOCATE PREPARE fordsql;
        ROLLBACK;
    END;

   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */

			/* GRABA Tipo de Combustible */
			SET @ftexsql=CONCAT('INSERT INTO tipocombustibles (Descripcion) VALUES (',"'",TRIM(pdescripcion),"')");
		    PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			select 'Se creó nuevo tipo de combustible' Mensaje;
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipocombustibles_baja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipocombustibles_baja`(
	IN `pidtipocomb` VARCHAR(50)
)
    COMMENT 'Dar de baja un tipo de combustible'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM tipocombustibles WHERE idTipoComb=',"'",TRIM(pidtipocomb),"'",' INTO @fcanscomb');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
            SET @ftexsql=CONCAT('SELECT Estado FROM tipocombustibles WHERE idTipoComb=',"'",TRIM(pidtipocomb),"'",' INTO @festcomb');
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
            deallocate prepare fordsql;
            
		    IF (@fcanscomb>0 AND @festcomb=1)  THEN
				SET @ftexsql=CONCAT('UPDATE tipocombustibles SET Estado = 0 WHERE idTipoComb = (',"'",TRIM(pidtipocomb),"')");
				PREPARE fordsql FROM @ftexsql;
				EXECUTE fordsql;
				DEALLOCATE PREPARE fordsql;
				select CONCAT('Se dio de baja el tipo de combustible con Id =',TRIM(pidtipocomb),'') Mensaje;
            ELSE 
				SELECT CONCAT('El tipo de combustible con Id =',TRIM(pidtipocomb),' ya está dado de BAJA') Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipocombustibles_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipocombustibles_borrar`(
	IN `pidtipocomb` VARCHAR(5)
)
    COMMENT 'Borrar tipo de combustible de unidad'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */	
		   
				/* BORRO MARCA de repuestos */
				SET @ftexsql=CONCAT('DELETE FROM tipocombustibles WHERE idTipoComb=',"'",TRIM(pidTipoComb),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
		   	DEALLOCATE PREPARE fordsql;
		   
           SELECT 'Tipo de Combustible Eliminada';
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipocombustibles_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipocombustibles_modificar`(
	IN `pidtipocomb` VARCHAR(5),
	IN `pdescripcion` VARCHAR(50)
)
    COMMENT 'Modificar Tipo de Combustibles de unidades'
SALIR:BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
		SET @ftexsql=CONCAT('SELECT COUNT(*) FROM tipocombustibles WHERE idTipoComb=',"'",TRIM(pidtipocomb),"'",' INTO @fcanscomb');
		PREPARE fordsql FROM @ftexsql;
		EXECUTE fordsql;
        
        IF length(pdescripcion) = 0 THEN
			select 'Falta completar campo Descripción' Mensaje;
			LEAVE SALIR;
		END IF;
        
		IF @fcanscomb>0 THEN
			SET @ftexsql=CONCAT('UPDATE tipocombustibles SET Descripcion=',"'",TRIM(pdescripcion),"'",' WHERE idTipoComb=',"'",TRIM(pidtipocomb),"'");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			SELECT 'tipo de combustible Modificado';
		ELSE 
			SELECT 'No existe Tipo de combustible' Mensaje;
		END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipounidades_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipounidades_alta`(
	IN `pdescripcion` VARCHAR(50),
    IN `pabreviatura` VARCHAR(6)
)
    COMMENT 'Alta Tipo de Unidades'
BEGIN
	DECLARE fcodtip INTEGER DEFAULT 0;
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
    
		/* BUSCA ULTIMO COD. TIPO DE UNIDAD */

		   SELECT MAX(idTipoUnidad) FROM tipounidades INTO @fcodtip;
	  		IF ISNULL(@fcodtip) THEN
		  	   SET @fcodtip=2;
		     ELSE
   		   SET @fcodtip=@fcodtip+1;
		   END IF;

			SET @ftexsql=CONCAT('INSERT INTO tipounidades (idTipoUnidad,Descripcion,Abreviatura) VALUES (',"'",TRIM(@fcodtip),"','",TRIM(pdescripcion),"','",TRIM(pabreviatura),"')");
		  	PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
            select 'se ingresó nuevo tipo de unidad y abreviatura' Mensaje;

			/* DEVUELVE COD. ASIGNADO */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001) VALUES (',"'",CAST(@fcodtip AS CHAR),"')");
			PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipounidades_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipounidades_borrar`(
	IN `pidtipounidad` VARCHAR(5)
    
)
    COMMENT 'Borrar un Tipo de Unidades'
BEGIN

   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
    
		/* Borra un tipo de unidad */
		  SET @ftexsql=CONCAT('DELETE FROM tipounidades WHERE idTipoUnidad=',"'",TRIM(pidtipounidad),"'");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'borra un tipo de unidad' Mensaje;

			/* DEVUELVE COD. ASIGNADO */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001) VALUES (',"'",TRIM(pidtipounidad),"')");
			PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_tipounidades_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipounidades_modificar`(
	IN `pidtipounidad` VARCHAR(5),
	IN `pdescripcion` VARCHAR(50),
    IN `pabreviatura` VARCHAR(6)
)
    COMMENT 'Modificar abreviatura  y Descripcion Tipo de Unidades'
BEGIN

   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
    
		/* BUSCA ULTIMO COD. TIPO DE UNIDAD */
		   SET @ftexsql=CONCAT('UPDATE tipounidades SET Descripcion=',"'",TRIM(pdescripcion),"',",'Abreviatura=',"'",TRIM(pabreviatura),"'",' WHERE idTipoUnidad=',"'",TRIM(pidtipounidad),"'");
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
			select 'se modificó el tipo de unidad' Mensaje;

			/* DEVUELVE COD. ASIGNADO */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001) VALUES (',"'",TRIM(pidtipounidad),"')");
			PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_alta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_alta`(
	IN `pdescripcion` VARCHAR(100),
	IN `pcodigoanterior` VARCHAR(8),
	IN `pcodigonuevo` VARCHAR(8),
	IN `pnrodominio` VARCHAR(7),
	IN `pañofabric` CHAR(4),
	IN `pidtipounidad` VARCHAR(5),
	IN `pidmarcaunidad` VARCHAR(6),
	IN `pidmodelounidad` VARCHAR(6),
	IN `pidtipocomb` CHAR(3),
	IN `pestado` CHAR(1),
	IN `pnomusu` VARCHAR(50),
	IN `pmotanu` VARCHAR(250)

)
    COMMENT 'Alta de una Unidad de Transporte'
BEGIN

	DECLARE fnroasi INT DEFAULT 0;
	DECLARE ffechoy DATETIME;
    DECLARE ftexsql,fordsql CHAR DEFAULT '';
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION

   BEGIN

      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;

   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;

   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
	/* REALIZA PROCESO SOBRE TABLA */

			SET @ftexsql=CONCAT('INSERT INTO unidades (Descripcion,CodigoAnterior,CodigoNuevo,NroDominio,AñoFabric,idTipoUnidad,idMarcaUnidad,idModeloUnidad,idTipoComb,FechaGrab,DesUsuGra) VALUES (',"'",
			TRIM(pdescripcion),"','",TRIM(pcodigoanterior),"','",TRIM(pcodigonuevo),"','",TRIM(pnrodominio),"','",TRIM(pañofabric),"','",TRIM(pidtipounidad),"','",TRIM(pidmarcaunidad),"','",
			TRIM(pidmodelounidad),"','",TRIM(pidtipocomb),"','",CAST(ffechoy AS CHAR),"','",TRIM(pnomusu),"')");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
			SELECT @@identity INTO @fnroasi;
			DEALLOCATE PREPARE fordsql;
			select ' se agregó la nueva unidad' Mensaje;
			/* DEVUELVE COD. ASIGNADO */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001) VALUES (',"'",CAST(@fnroasi AS CHAR),"')");
			PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
			
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_borrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_borrar`(
	IN `pidunidad` VARCHAR(6)

)
    COMMENT 'Borrar una Unidad de Transporte'
BEGIN

	DECLARE fnroasi INT DEFAULT 0;
	DECLARE ffechoy DATETIME;
    DECLARE ftexsql,fordsql CHAR DEFAULT '';
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION

   BEGIN

      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;

   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;

   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
	/* REALIZA PROCESO SOBRE TABLA */

			SET @ftexsql=CONCAT('DELETE FROM unidades WHERE idUnidad=',"'",TRIM(pidunidad),"'");
		  	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
		    DEALLOCATE PREPARE fordsql;
			select 'se borro correctamente segun el estado que corresponde' Mensaje;
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_unidad_modificar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_unidad_modificar`(
	IN `pidunidad` VARCHAR(6),
	IN `pdescripcion` VARCHAR(100),
	IN `pcodigoanterior` VARCHAR(8),
	IN `pcodigonuevo` VARCHAR(8),
	IN `pnrodominio` VARCHAR(7),
	IN `pañofabric` CHAR(4),
	IN `pidtipounidad` VARCHAR(5),
	IN `pidmarcaunidad` VARCHAR(6),
	IN `pidmodelounidad` VARCHAR(6),
	IN `pidtipocomb` CHAR(3),
	IN `pestado` CHAR(1),
	IN `pnomusu` VARCHAR(50),
	IN `pmotanu` VARCHAR(250)

)
    COMMENT 'Modificar de una Unidad de Transporte'
BEGIN

	DECLARE fnroasi INT DEFAULT 0;
	DECLARE ffechoy DATETIME;
    DECLARE ftexsql,fordsql CHAR DEFAULT '';
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION

   BEGIN

      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;

   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;

   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
	/* REALIZA PROCESO SOBRE TABLA */

			CASE pestado
			  WHEN '1' THEN
				  SET @ftexsql=CONCAT('UPDATE unidades SET Descripcion=',"'",TRIM(pdescripcion),"',",'CodigoAnterior=',"'",TRIM(pcodigoanterior),"',",'CodigoNuevo=',"'",TRIM(pcodigonuevo),"',",
	 			  		'NroDominio=',"'",TRIM(pnrodominio),"',",'AñoFabric=',"'",TRIM(pañofabric),"',",'idTipoUnidad=',"'",TRIM(pidtipounidad),"',",'idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"',",
					 	'idModeloUnidad=',"'",TRIM(pidmodelounidad),"',",'idTipoComb=',"'",TRIM(pidtipocomb),"',",'FechaBaja=',"(",'NULL',"),",'DesUsuBaj=',"(",'NULL',"),",'DesMotBaj=',"(",
						'NULL',")",' WHERE idUnidad=',"'",TRIM(pidunidad),"'");

			  WHEN '2' THEN
				  SET @ftexsql=CONCAT('UPDATE unidades SET Descripcion=',"'",TRIM(pdescripcion),"',",'CodigoAnterior=',"'",TRIM(pcodigoanterior),"',",'CodigoNuevo=',"'",TRIM(pcodigonuevo),"',",
	 			  		'NroDominio=',"'",TRIM(pnrodominio),"',",'AñoFabric=',"'",TRIM(pañofabric),"',",'idTipoUnidad=',"'",TRIM(pidtipounidad),"',",'idMarcaUnidad=',"'",TRIM(pidmarcaunidad),"',",
					 	'idModeloUnidad=',"'",TRIM(pidmodelounidad),"',",'idTipoComb=',"'",TRIM(pidtipocomb),"',",'Estado=',"'",'2',"',",'FechaBaja=',"(",'NULL',"),",'DesUsuBaj=',"(",
					 	'NULL',"),",'DesMotBaj=',"(",'NULL',")",' WHERE idUnidad=',"'",TRIM(pidunidad),"'");
			  
              WHEN '9' THEN
					   SET @ftexsql=CONCAT('UPDATE unidades SET Estado=',"'",'9',"',",'FechaBaja=',"'",CAST(ffechoy AS CHAR),"',",'DesUsuBaj=',"'",TRIM(pnomusu),"',",'DesMotBaj=',"'",
					   TRIM(pmotanu),"'",' WHERE idUnidad=',"'",TRIM(pidunidad),"'");
			END CASE;

		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
			select 'se modificó correctamente segun el estado que corresponde' Mensaje;
	COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zzzsp_actualiza_stock_deposito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zzzsp_actualiza_stock_deposito`(
	IN `pidrepuesto` VARCHAR(8),
	IN `piddeposito` CHAR(4),
	IN `pcantidadrepuesto` DECIMAL(10,1),
    IN `ptipope` CHAR(1),
	IN `ptagroll` INT,
	IN `pnomusu` VARCHAR(50)

)
    COMMENT 'Actualiza Stock del Depósito'
BEGIN
	DECLARE fnewexi DECIMAL;
	DECLARE ffechoy DATETIME;
	/*DECLARE fnomtab VARCHAR(50);*/
   DECLARE ftexsql,fordsql CHAR;
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxexist VARCHAR(30) default 'existdepositos';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
  	BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
  		PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
     	ROLLBACK;
   END;
   IF ptagroll=1 THEN
		START TRANSACTION;
	END IF;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',TRIM(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();
   /* ESTABLECE NOMBRE TABLA A ACTUALIZAR */
   /*SET fnomtab=CONCAT('exidep',LPAD(TRIM(pcodintdep),3,'0'));*/
   
   /* DETERMINA SI EL REPUESTO ESTA REGISTRADO EN DEPOSITO */
   SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(ptabauxexist),' WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' INTO @ffouart');
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   select 'count',@ffouart,' ' Mensaje;
   IF ISNULL(@ffouart) OR @ffouart=0 THEN
   	/* REGISTRA ARTICULO EN DEPOSITO */
	   SET @ftexsql=CONCAT('CALL sp_grabar_repuesto_deposito(',"'",TRIM(pcodintart),"','",TRIM(pcodintdep),"','",TRIM(pnomusu),"','",ptagroll,"','",TRIM(fnomtab),"')");
   	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
   	DEALLOCATE PREPARE fordsql;
   END IF;
   /* OBTIENE STOCK ACTUAL DEL REPUESTO */
   select 'fdsfdsfds' Mensaje;
   SET @ftexsql=CONCAT('SELECT Exidep FROM ',ptabauxexist,' WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' AND idDeposito=',"'",TRIM(piddeposito),"'",'  INTO @fexiact');
  	PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
  	DEALLOCATE PREPARE fordsql;
    select 'cantidad exist del repuest',@fexiact,'' Mensaje;
  	IF ISNULL(@fexiact) THEN
  	   SET @fexiact=0;
  	END IF;
	/* CALCULA NUEVA EXISTENCIA */
	SET fnewexi=0;
	CASE ptipope 
		WHEN '+' THEN
			SET fnewexi=@fexiact+pcantidadrepuesto;
		WHEN '-' THEN
			SET fnewexi=@fexiact-pcantidadrepuesto;
		WHEN 'R' THEN
			SET fnewexi=pcantidadrepuesto;
	END CASE;
	/* ACTUALIZA STOCK */
    select 'llego?' Mensaje;
   SET @ftexsql=CONCAT('UPDATE ',ptabauxexist,' SET Exidep=',"'",CAST(fnewexi AS CHAR),"'",' WHERE idRepuesto=',"'",TRIM(pidrepuesto),"' AND idDeposito='",TRIM(piddeposito),"'");
  	PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
  	DEALLOCATE PREPARE fordsql;
    select 'se actualizó el stock' Mensaje;
   IF ptagroll=1 THEN
		COMMIT;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zzzsp_actualiza_stock_repuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zzzsp_actualiza_stock_repuesto`(
	IN `pidrepuesto` VARCHAR(8),
	IN `pcantidadrepuesto` DECIMAL(10,1),
    IN `ptipope` CHAR(1),
	IN `ptagroll` INT,
	IN `pnomusu` VARCHAR(50)

)
    COMMENT 'Actualiza Stock del Repuesto'
BEGIN
	DECLARE fnewexi DECIMAL;
	DECLARE ffechoy DATETIME;
	/*DECLARE fnomtab VARCHAR(50);*/
   DECLARE ftexsql,fordsql CHAR;
    DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
  	BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
  		PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
     	ROLLBACK;
   END;
   IF ptagroll=1 THEN
		START TRANSACTION;
	END IF;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',TRIM(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffechoy=NOW();   

   /* OBTIENE STOCK ACTUAL DEL REPUESTO */
   
   SET @ftexsql=CONCAT('SELECT Stock FROM repuestos WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'",' INTO @fexiact');
  	PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
  	DEALLOCATE PREPARE fordsql;
    select 'cantidad exist del repuest',@fexiact,'' Mensaje;
  	IF ISNULL(@fexiact) THEN
  	   SET @fexiact=0;
  	END IF;
	/* CALCULA NUEVA EXISTENCIA */
	SET fnewexi=0;
	CASE ptipope 
		WHEN '+' THEN
			SET fnewexi=@fexiact+pcantidadrepuesto;
		WHEN '-' THEN
			SET fnewexi=@fexiact-pcantidadrepuesto;
		WHEN 'R' THEN
			SET fnewexi=pcantidadrepuesto;
	END CASE;
	/* ACTUALIZA STOCK */
   SET @ftexsql=CONCAT('UPDATE repuestos SET Stock=',"'",CAST(fnewexi AS CHAR),"'",' WHERE idRepuesto=',"'",TRIM(pidrepuesto),"'");
  	PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
  	DEALLOCATE PREPARE fordsql;
    select 'se actualizó el stock' Mensaje;
     select 'cantidad actualizada del repuesto',@fnewexi,'' Mensaje;
   IF ptagroll=1 THEN
		COMMIT;
   END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zzzsp_carrito_agregar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zzzsp_carrito_agregar`(
	IN `pidrepuesto` INT(4),
    IN `pdesrepuesto` VARCHAR(45),
	IN `pcantidadsolicitada` DECIMAL(10,2),
    IN `pidusuario` INT(8)
)
    COMMENT 'Alta un item en el carrito de retiros'
BEGIN
   DECLARE ftexsql,fordsql CHAR DEFAULT '';
   DECLARE pcarrito VARCHAR(40) default 'carritoretiros';
   DECLARE ptabaux VARCHAR(50) DEFAULT 'auxvalret';
    
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux)); 
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
	START TRANSACTION;
	/* REALIZA PROCESO SOBRE TABLA */
	/* ALTA ITEM CARRITO */
		   
		   SET @fnrousu=0;
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(pcarrito),' WHERE idRepuesto=',"'",pidrepuesto,"'",' INTO @fnrousu');
		  	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
           select 'ya existe y hay que actualizar' Mensaje;
           
           IF @fnrousu=0 THEN
				SET @ftexsql=CONCAT('INSERT INTO ',TRIM(pcarrito),' (idRepuesto,DesRepuesto,CantidadSolicitada,
                idUsuario) VALUES (',"'",
					 TRIM(pidrepuesto),"','",TRIM(pdesrepuesto),"','",TRIM(pcantidadsolicitada),"','",
					 TRIM(pidusuario),"')");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
               select 'ok nuevo item' Mensaje;
			else
				SET @ftexsql=CONCAT('UPDATE ',TRIM(pcarrito),' SET CantidadSolicitada = ',"'",
					 TRIM(pcantidadsolicitada),"' WHERE idRepuesto='",TRIM(pidrepuesto),"'");
			  	PREPARE fordsql FROM @ftexsql;
			   EXECUTE fordsql;
			   DEALLOCATE PREPARE fordsql;
				select 'ok actualizar cantidad solicitada item' Mensaje;
			END IF;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zzzsp_grabar_ingreso_repuesto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zzzsp_grabar_ingreso_repuesto`(
    IN `pordencompra` VARCHAR(8),
    IN `ptipocompra` CHAR(4),
	IN `pnroexpcompra` VARCHAR(20),
	IN `pidproveedor` VARCHAR(8),
	IN `pidcomprobante` CHAR(3),
	IN `pptoventacom` CHAR(4),
	IN `pnrocompro` VARCHAR(8),
	IN `pobservaciones` VARCHAR(250),
	IN `pnomusu` VARCHAR(50),
    IN `pidusuario` VARCHAR(8)
)
    COMMENT 'Graba/Anula Ingreso por Compra'
SALIR:BEGIN
   DECLARE fconite INTEGER;
   DECLARE ffecmov DATE;
   DECLARE ffecgra DATETIME;
   DECLARE fdescom VARCHAR(20);
   	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
    DECLARE ptabauxrep VARCHAR(30) default 'carritoingresos';
	DECLARE fordsql,fbuspar,fbusart,fgrastk,fgraart CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
   		/* PROCESO DE GRABACION */
			SET @ftexsql=CONCAT('SELECT Abreviatura,Letra FROM comprobantes WHERE idComprobante=',"'",TRIM(pidcomprobante),"'",' INTO @fabrcom,@fletcom');
		   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
  		   DEALLOCATE PREPARE fordsql;
           select 'comprobantes: ',@fabrcom,@fletcom,'' Mensaje;
   		/* GRABA INGRESO DE REPUESTOS*/
			SET @ftexsql=CONCAT('INSERT INTO ingresorepuestos (FechaRecepcion,idTipoCompra,OrdenCompra,NroExpCompra,idProveedor,idComprobante,AbrCompro,LetraComp,PtoVentaCom,NroCompro,',
				'Observaciones,EstadoSolicitud,FechaGrab,DesUsuGra) VALUES (',"'",CAST(ffecmov AS CHAR),"','",TRIM(ptipocompra),"','",TRIM(pordencompra),"','",TRIM(pnroexpcompra),"','",TRIM(pidproveedor),"','",
				TRIM(pidcomprobante),"','",@fabrcom,"','",@fletcom,"','",TRIM(pptoventacom),"','",TRIM(pnrocompro),"','",
				TRIM(pobservaciones),"','",'1',"','",CAST(ffecgra AS CHAR),"','",TRIM(pnomusu),"')");
     	   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
	      SELECT @@identity INTO @fnroing;
	      DEALLOCATE PREPARE fordsql;
	     select 'se grabó el ingreso por compra' Mensaje;
         
         /* PROCESA ARTICULOS DE LA LISTA */
			SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(ptabauxrep),' INTO @fmaxite');
	 	     	   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
			      DEALLOCATE PREPARE fordsql;
                  if (@fmaxite = 0 || isnull(@fmaxite)) THEN
					select 'CARRITO VACIO' Mensaje;
                    leave SALIR;
				end if;            
            
	      SET fconite=0;
	      WHILE fconite<=(@fmaxite-1) DO
				SET @ftexsql=CONCAT('SELECT idRepuesto,DesRepuesto,CantidadIngresada FROM ',TRIM(ptabauxrep),'   LIMIT ',(fconite),',1 INTO @fcodart,@fdesart,@fnrouni');
 	     	   PREPARE fbusart FROM @ftexsql;
		      EXECUTE fbusart;
		      DEALLOCATE PREPARE fbusart;
              select 'selecciona items del carrito ingreso',@fcodart,@fdesart,@fnrouni,'' Mensaje;
		      /* BUSCA PARAMETROS ARTICULO */
			  /* SET @ftexsql=CONCAT('SELECT BanStockRep FROM repuestos WHERE idRepuesto=',"'",CAST(@fcodart AS CHAR ),"'",' INTO @factstk');
	     	   PREPARE fbuspar FROM @ftexsql;
		      EXECUTE fbuspar;
	   	   DEALLOCATE PREPARE fbuspar;
           select 'Act. Stock',@factstk,'' Mensaje;*/
		      /* GRABA DETALLE DE INGRESO */
              SET fconite=fconite+1;
				SET @ftexsql=CONCAT('INSERT INTO lineasingresorepuestos (idIngreso,NroIteracion,idRepuesto,DesRepuesto,CantidadRecibida) VALUES (',"'",CAST(@fnroing AS CHAR),"','",
					 CAST(fconite AS CHAR),"','",CAST(@fcodart AS CHAR),"','",TRIM(@fdesart),"','",CAST(@fnrouni AS CHAR),"')");
	     	   PREPARE fgraart FROM @ftexsql;
		      EXECUTE fgraart;
		      DEALLOCATE PREPARE fgraart;
              select 'graba detalle de la linea de compra' Mensaje;
				
                /* ACTUALIZA STOCK */
		      SET fdescom=CONCAT('ING Nº ',LPAD(@fnroing,10,'0'));
		      /*IF @factstk=1 THEN*/
              select 'aaaaaaaaaa' Mensaje;
					SET @ftexsql=CONCAT('CALL sp_actualiza_stock_repuesto(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
						 '+',"','",'0',"','",TRIM(pnomusu),"')");
					   PREPARE fgrastk FROM @ftexsql;
					   EXECUTE fgrastk;
						DEALLOCATE PREPARE fgrastk;
						select 'actualiza el stock ' Mensaje;
		
						 /* GRABA FICHA DEL ARTICULO */
				   SET @ftexsql=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",CAST(@fcodart AS CHAR),"','",'100',"','",CAST(@fnrouni AS CHAR),"','",
						 TRIM(fdescom),"','",'+',"','",TRIM(pidproveedor),"','",CAST(@fnroing AS CHAR),"','",
						 'INGRESO POR COMPRA',"','",TRIM(pnomusu),"')");
				   PREPARE fgrafar FROM @ftexsql;
				   EXECUTE fgrafar;
				   DEALLOCATE PREPARE fgrafar;
                   select 'graba ficha repuesto' Mensaje;
                   
				   /* ACTUALIZA lineas de compra de repuestos */
					SET @ftexsql=CONCAT('UPDATE lineasingresorepuestos SET BanActStock=',"'",'1',"'",' WHERE idIngreso=',
						 "'",CAST(@fnroing AS CHAR),"'",' AND NroIteracion=',"'",CAST(fconite AS CHAR),"'");
					PREPARE fordact FROM @ftexsql;
					EXECUTE fordact;
					DEALLOCATE PREPARE fordact;
					select 'bandera SET 1' Mensaje;
        
					select 'ACTUALIZA una linea de compra de repuestos' Mensaje;
        
				/*end IF;*/
            
	      END WHILE;
          select 'fin while' Mensaje;
          
          /* DEVUELVE RESULTADO DE LA OPERACION */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002,valret003) VALUES (',"'",'1',"','",CAST(@fnroing AS CHAR),"','",
				 CAST(ffecmov AS CHAR),"')");
        	PREPARE fordsql FROM @ftexsql;
		    EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
            
            select 'tabaux' Mensaje;
            
            /*BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
			SET @ftexsql=CONCAT('DELETE FROM ',TRIM(ptabauxrep),' WHERE idUsuario=',TRIM(pidusuario),'');
			PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
				SELECT 'borrar datos del carrito por usuario' Mensaje;
	COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zzzsp_grabar_orden_retiro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zzzsp_grabar_orden_retiro`(
	IN `pnrointreg` BIGINT,
	IN `pnrointuni` VARCHAR(6),
	IN `punidental` CHAR(1),
	IN `pnroreging` VARCHAR(10),
	IN `pcodintsec` CHAR(5),
	IN `pageret` VARCHAR(6),
	IN `ptipope` CHAR(1),
	IN `pnomusu` VARCHAR(50),
	IN `pmotanu` VARCHAR(250),
	IN `ptabauxart` VARCHAR(50),
	IN `ptabaux` VARCHAR(50)
)
    COMMENT 'Graba Orden de Retiro de Depósito'
BEGIN
	DECLARE fconite INTEGER;
	DECLARE ffecmov DATE;
	DECLARE ffecgra DATETIME;
	DECLARE fdesemp,fdescom VARCHAR(100);
	DECLARE fordsql,fbusart,fbuspar,fgraart,fordact,fgrafar CHAR;
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
     	PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
      ROLLBACK;
   END;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordsql FROM @ftexsql;
   EXECUTE fordsql;
   DEALLOCATE PREPARE fordsql;
   /* ESTABLECE FECHA Y HORA ACTUAL */
   SET ffecmov=CURDATE();
   SET ffecgra=NOW();
   START TRANSACTION;
   CASE ptipope
		WHEN 'A' THEN
   		/* PROCESO DE ANULACION */
   		SET @ftexsql=CONCAT('SELECT tagestsol FROM encretdeps WHERE nrointreg=',"'",TRIM(pnrointreg),"'",' INTO @festsol');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
		   IF @festsol=1 OR @festsol=2 OR @festsol=3 THEN
		   	IF @festsol=3 THEN
					SET @ftexsql=CONCAT('SELECT MAX(nroiteped) FROM detretdeps WHERE nrointmov=',"'",CAST(pnrointreg AS CHAR),"'",' INTO @fmaxite');
	  			   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
	   		   DEALLOCATE PREPARE fordsql;
               
			      /* PROCESA ARTICULOS DE LA LISTA */
	   		   SET fconite=1;
               
			      WHILE fconite<=@fmaxite DO
						SET @ftexsql=CONCAT('SELECT codintart,cantsolic,tagsegstk,codintdep FROM detretdeps WHERE nrointmov=',"'",CAST(pnrointreg AS CHAR),"'",
							 ' AND
                             nroiteped=',"'",CAST(fconite AS CHAR),"'",' INTO @fcodart,@fnrouni,@factstk,@fcoddep');
						
                   PREPARE fbusart FROM @ftexsql;
				      EXECUTE fbusart;
				      DEALLOCATE PREPARE fbusart;
                      select 'ok' Mensaje;
				      IF @fcodart>1 AND @factstk=1 AND @fcoddep<9999 THEN
				      	/* ACTUALIZA STOCK */
							SET @ftexsql=CONCAT('CALL sp_actstkdep(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fcoddep AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
								 '+',"','",'1',"','",TRIM(pnomusu),"','",TRIM(ptabaux),"')");
		 	   	  	   PREPARE fbuspar FROM @ftexsql;
				   	   EXECUTE fbuspar;
		   		   	DEALLOCATE PREPARE fbuspar;
					      /* GRABA FICHA DEL ARTICULO */
					      SET fdescom=CONCAT('RET Nº ',LPAD(pnrointreg,10,'0'));
						   SET @ftexsql=CONCAT('CALL sp_grafichar(',"'",CAST(@fcodart AS CHAR),"','",'201',"','",CAST(@fnrouni AS CHAR),"','",'0',"','",
								 TRIM(fdescom),"','",CAST(@fcoddep AS CHAR),"','",'9999',"','",'+',"','",'1',"','",'0',"','",'ANULACION RETIRO DE ARTÏCULOS',
								 "','",TRIM(pnomusu),"','",TRIM(ptabaux),"')");
						   PREPARE fgrafar FROM @ftexsql;
					   	EXECUTE fgrafar;
						   DEALLOCATE PREPARE fgrafar;
				      END IF;
			      	SET fconite=fconite+1;
			      END WHILE;
		   	END IF;
            
	      	/* ACTUALIZA EncRetDep */
				SET @ftexsql=CONCAT('UPDATE encretdeps SET tagestsol=',"'",'9',"',",'fecanusol=',"'",CAST(ffecgra AS CHAR),"',",'usuanusol=',"'",
					 TRIM(pnomusu),"',",'desmotanu=',"'",TRIM(pmotanu),"'",' WHERE nrointreg=',"'",CAST(pnrointreg AS CHAR),"'");
	     	   PREPARE fordsql FROM @ftexsql;
		      EXECUTE fordsql;
	   	   DEALLOCATE PREPARE fordsql;
           select 'ok3' Mensaje;
		   END IF;
   	WHEN 'C' THEN
   		/* PROCESO DE CIERRE */
   		SET @ftexsql=CONCAT('SELECT desunidad FROM unidades WHERE nrointuni=',"'",TRIM(pnrointuni),"'",' INTO @fdesuni');
		   PREPARE fordsql FROM @ftexsql;
		  select 'aaaa' Mensaje;
           EXECUTE fordsql;
            if(@fordsql=true) then
				select 'okkk' Mensaje;
           end if;
		   DEALLOCATE PREPARE fordsql;
           
   		SET @ftexsql=CONCAT('SELECT desseccio FROM Secciones WHERE codintsec=',"'",TRIM(pcodintsec),"'",' INTO @fdessec');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'seccion no' Mensaje;
   		SET @ftexsql=CONCAT('SELECT apelliemp,nombreemp FROM agentes WHERE idAgente=',"'",TRIM(pageret),"'",' INTO @fapeemp,@fnomemp');
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
           select 'apellidoyynombre' Mensaje;
           /*VER ESTA PARTE */
		   IF NOT ISNULL(@fdesuni) AND NOT ISNULL(@fdessec) AND NOT ISNULL(@fapeemp) AND NOT ISNULL(@fnomemp) THEN
		      SET fdesemp=CONCAT(TRIM(@fapeemp),", ",TRIM(@fnomemp));
				SET @ftexsql=CONCAT('INSERT INTO encretdeps (nrointuni,tagunital,nrointmov,codintsec,descrisec,legempret,desempret,fecgrasol,',
				    'usugrasol,tagestsol) VALUES (',"'",TRIM(pnrointuni),"','",TRIM(punidental),"','",TRIM(pnroreging),"','",TRIM(pcodintsec),"','",
					 TRIM(@fdessec),"','",TRIM(pageret),"','",TRIM(fdesemp),"','",CAST(ffecgra AS CHAR),"','",TRIM(pnomusu),"','",'1',"')");
               PREPARE fordsql FROM @ftexsql;
		      EXECUTE fordsql;
		      SELECT @@identity INTO @fnroret;
		      DEALLOCATE PREPARE fordsql;
              select 'aaaaa' Mensaje;
		      IF NOT ISNULL(@fnroret) THEN
  					SET @ftexsql=CONCAT('SELECT COUNT(*) FROM ',TRIM(ptabauxart),' INTO @fmaxite');
	 	     	   PREPARE fordsql FROM @ftexsql;
			      EXECUTE fordsql;
			      DEALLOCATE PREPARE fordsql;
                  
                  select 'bbbb' Mensaje;
                  SET fconite=0;
			      WHILE fconite<=(@fmaxite-1) DO
	  					/*SET @ftexsql=CONCAT('SELECT product,name,qty FROM ',TRIM(ptabauxart),' WHERE nrointite=',"'",CAST(fconite AS CHAR),"'",
						    ' INTO @fcodart,@fdesart,@fnrouni');*/
						SET @ftexsql=CONCAT('SELECT product,name,qty,nrodepori FROM ',TRIM(ptabauxart),'  LIMIT ',(fconite),',1   INTO @fcodart,@fdesart,@fnrouni,@fcoddep');
		 	     	   PREPARE fbusart FROM @ftexsql;
				      EXECUTE fbusart;
				      DEALLOCATE PREPARE fbusart;
                     SET fconite=fconite+1;
							SET @ftexsql=CONCAT('INSERT INTO detretdeps (nrointmov,nroiteped,codintart,descriart,cantsolic,codintdep) VALUES (',"'",CAST(@fnroret AS CHAR),"','",
							 CAST(fconite AS CHAR),"','",CAST(@fcodart AS CHAR),"','",TRIM(@fdesart),"','",CAST(@fnrouni AS CHAR),"','",CAST(@fcoddep AS CHAR),"')");
  			     	   PREPARE fgraart FROM @ftexsql;
				      EXECUTE fgraart;
				      DEALLOCATE PREPARE fgraart;
                   select 'cccccccccccccccc' Mensaje;
                   
                   
                   IF @fcodart>1 THEN
					SET @ftexsql=CONCAT('SELECT tagsegstk FROM Articulos WHERE codintart=',"'",CAST(@fcodart AS CHAR ),"'",' INTO @factstk');
 		     	   PREPARE fbuspar FROM @ftexsql;
			      EXECUTE fbuspar;
		   	   DEALLOCATE PREPARE fbuspar;
               
		      	/* ACTUALIZA STOCK */
			      IF @factstk=1 THEN
						SET @ftexsql=CONCAT('CALL ssp_actstkdep(',"'",CAST(@fcodart AS CHAR),"','",CAST(@fcoddep AS CHAR),"','",CAST(@fnrouni AS CHAR),"','",
							 '-',"','",'1',"','",TRIM(pnomusu),"','",TRIM(ptabaux),"')");
	 	   	  	   PREPARE fbuspar FROM @ftexsql;
			   	   EXECUTE fbuspar;
			      	DEALLOCATE PREPARE fbuspar;
                    
				      /* GRABA FICHA DEL ARTICULO */
				      SET fdescom=CONCAT('RET Nº ',LPAD(@fnroret,10,'0'));
					   SET @ftexsql=CONCAT('CALL ssp_grafichar(',"'",CAST(@fcodart AS CHAR),"','",'101',"','",CAST(@fnrouni AS CHAR),"','",'0',"','",
							 TRIM(fdescom),"','",CAST(@fcoddep AS CHAR),"','",'9999',"','",'-',"','",'1',"','",'0',"','",'RETIRO DE ARTICULOS',"','",TRIM(pnomusu),
							 "','",TRIM(ptabaux),"')");
					   PREPARE fgrafar FROM @ftexsql;
					   EXECUTE fgrafar;
					   DEALLOCATE PREPARE fgrafar;
                       select 'ok' Mensaje;
					   /* ACTUALIZA DetRetDep */
						SET @ftexsql=CONCAT('UPDATE detretdeps SET tagsegstk=',"'",'1',"',",'codintdep=',"'",CAST(@fcoddep AS CHAR),"'",' WHERE nrointmov=',
							 "'",CAST(@fnroret AS CHAR),"'",' AND nroiteped=',"'",CAST(fconite AS CHAR),"'");
						PREPARE fordact FROM @ftexsql;
						EXECUTE fordact;
						DEALLOCATE PREPARE fordact;
			      END IF;
			   END IF;
                     
                     
                      
                      
			END WHILE;
				END IF;
                select 'La orden de cierre creada con éxito' Mensaje;
			END IF;
            
         /* DEVUELVE RESULTADO DE LA OPERACION */
			SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002,valret003) VALUES (',"'",'1',"','",CAST(@fnroret AS CHAR),"','",
				 CAST(ffecmov AS CHAR),"')");
        	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
	   	DEALLOCATE PREPARE fordsql;
         /*BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
			SET @ftexsql=CONCAT('TRUNCATE TABLE ',CONCAT(ptabauxart));
			PREPARE fordsql FROM @ftexsql;
			EXECUTE fordsql;
			DEALLOCATE PREPARE fordsql;
            
            
		WHEN 'U' THEN
   		/* PROCESO DE AUTORIZACION */
   		SET @ftexsql=CONCAT('UPDATE encretdeps SET fecautret=',"'",CAST(ffecgra AS CHAR),"',",'usuautret=',"'",TRIM(pnomusu),"',",'tagestsol=',"'",
				 '2',"'",' WHERE nrointreg=',"'",CAST(pnrointreg AS CHAR),"'");
	     	PREPARE fordsql FROM @ftexsql;
		   EXECUTE fordsql;
		   DEALLOCATE PREPARE fordsql;
		WHEN 'E' THEN
			
	      /* ACTUALIZA encretdep */
			SET @ftexsql=CONCAT('UPDATE encretdeps SET tagestsol=',"'",'3',"',",'fecretart=',"'",CAST(ffecgra AS CHAR),"',",'usuentart=',"'",
				 TRIM(pnomusu),"'",' WHERE nrointreg=',"'",CAST(pnrointreg AS CHAR),"'");
     	   PREPARE fordsql FROM @ftexsql;
	      EXECUTE fordsql;
	      DEALLOCATE PREPARE fordsql;
          select 'ok2' Mensaje;
   END CASE;
   COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zzzsp_grabar_repuesto_deposito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `zzzsp_grabar_repuesto_deposito`(
	IN `pidrepuesto` VARCHAR(8),
	IN `piddeposito` CHAR(4),
	IN `pnomusu` VARCHAR(50),
	IN `ptagroll` INT,
	IN `ptabdep` VARCHAR(50)
)
    COMMENT 'Registra Repuesto en Depósito'
BEGIN
   DECLARE ffecmov DATE;
   DECLARE fordpro,fordreg CHAR DEFAULT '';
	DECLARE ptabaux VARCHAR(30) DEFAULT 'auxvalret';
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
  	BEGIN
      /* DEVUELVE RESULTADO DE LA OPERACION */
		SET @ftexsql=CONCAT('INSERT INTO ',TRIM(ptabaux),' (valret001,valret002) VALUES (',"'",'9998',"','",'GRABACION CANCELADA POR EL MOTOR',"')");
  		PREPARE fordsql FROM @ftexsql;
	   EXECUTE fordsql;
	   DEALLOCATE PREPARE fordsql;
     	ROLLBACK;
   END;
   IF ptagroll=1 THEN
		START TRANSACTION;
	END IF;
   /* BORRA TABLA TEMPORAL DEVOLUCION DE RESULTADOS */
   SET @ftexord=CONCAT('TRUNCATE TABLE ',CONCAT(ptabaux));
   PREPARE fordpro FROM @ftexord;
   EXECUTE fordpro;
   DEALLOCATE PREPARE fordpro;
   /* DETERMINA FECHA ACTUAL */
   SET ffecmov=CURDATE();
	/* REGISTRA ARTICULO EN DEPOSITO */
   SET @ftexord=CONCAT('INSERT INTO ',TRIM(ptabdep),' (idRepuesto,idDeposito,ExiDep) VALUES (',"'",TRIM(pidrepuesto),"','",TRIM(piddeposito),"','",'0',"')");
   PREPARE fordpro FROM @ftexord;
   EXECUTE fordpro;
   DEALLOCATE PREPARE fordpro;
    
    /* REGISTRA FICHA DEL ARTICULO */
   SET @ftexord=CONCAT('CALL sp_grabar_ficha_repuesto(',"'",TRIM(pidrepuesto),"','",'4',"','",'0',"','",'0',"','",'',"','",TRIM(piddeposito),"','",
		 '9999',"','",'R',"','",'1',"','",'0',"','",'REGISTRACION EN EL DEPOSITO',"','",TRIM(pnomusu),"')");
   PREPARE fordreg FROM @ftexord;
   EXECUTE fordreg;
   DEALLOCATE PREPARE fordreg;

   IF ptagroll=1 THEN
		COMMIT;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17 18:32:39
