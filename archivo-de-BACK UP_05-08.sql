-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: veterinaria
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `calendariodevacunas`
--

DROP TABLE IF EXISTS `calendariodevacunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendariodevacunas` (
  `id_cdv` int NOT NULL AUTO_INCREMENT,
  `farmaco` varchar(100) NOT NULL,
  `dosis` float NOT NULL,
  `id_mascota` int NOT NULL,
  `id_hc` int NOT NULL,
  PRIMARY KEY (`id_cdv`),
  KEY `nombre_restriccion` (`id_mascota`),
  KEY `calendariodevacunas_ibfk_2` (`id_hc`),
  CONSTRAINT `calendariodevacunas_ibfk_2` FOREIGN KEY (`id_hc`) REFERENCES `historiaclinica` (`id_hc`),
  CONSTRAINT `nombre_restriccion` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendariodevacunas`
--

LOCK TABLES `calendariodevacunas` WRITE;
/*!40000 ALTER TABLE `calendariodevacunas` DISABLE KEYS */;
INSERT INTO `calendariodevacunas` VALUES (1,'Amoxicilina',1,1,1),(2,'Triple felina',0.5,2,3),(3,'Acolan',0.2,3,2),(4,'Ampolicina',15,4,1);
/*!40000 ALTER TABLE `calendariodevacunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `id_mascota` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `id_mascota` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Brenda','Barrese','37120625','1154896302',1),(2,'Genoveva','Ledesma','38590540','1168319388',2),(3,'Odd','Torres','96874210','51486595',3),(4,'Ignacio','Doe','40587495','42252465',5),(6,'Florencia','Bertoli','38789065','1125633985',9),(7,'guillermina','calabria','34564563','11235690085',11),(8,'matias','botero','32509876','1133662255',12),(9,'leonardo','seferino','39786098','1123567410',26),(10,'carlos','reconquista','12354608','1190863274',6),(11,'florencia','rotondo','97670534','1155228800',7),(12,'yesica','torillo','35453333','1180806974',NULL),(13,'naila','totomano','95609876','1155003517',28),(14,'carla','vega','41256098','1150983670',NULL),(15,'eucaris','gomez','34000999','1155330990',29),(16,'angel','seferino','30890777','119063332587',27);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_mascota`
--

DROP TABLE IF EXISTS `cliente_mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_mascota` (
  `id_cliente` int DEFAULT NULL,
  `id_mascota` int DEFAULT NULL,
  KEY `id_cliente` (`id_cliente`),
  KEY `id_mascota` (`id_mascota`),
  CONSTRAINT `cliente_mascota_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `cliente_mascota_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_mascota`
--

LOCK TABLES `cliente_mascota` WRITE;
/*!40000 ALTER TABLE `cliente_mascota` DISABLE KEYS */;
INSERT INTO `cliente_mascota` VALUES (4,5),(4,10),(6,9),(7,11),(8,12),(8,25),(9,26),(16,27),(13,28),(15,29),(15,30),(1,1),(2,2),(3,3),(10,6),(10,8),(11,7),(11,31),(11,33),(11,32),(12,35),(12,39),(14,40),(14,41),(14,42);
/*!40000 ALTER TABLE `cliente_mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `horario` time NOT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  `id_mascota` int DEFAULT NULL,
  `id_veterinario` int DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `id_mascota` (`id_mascota`),
  KEY `id_veterinario` (`id_veterinario`),
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (5,'09:00:00','Consulta de rutina',1,2,'2023-07-05'),(6,'10:30:00','Dolor abdominal',2,2,'2023-07-06'),(7,'14:15:00','Vacunación anual',3,2,'2023-07-07'),(8,'16:45:00','Corte de uñas',4,3,'2023-07-08'),(9,'11:00:00','Examen de sangre',1,1,'2023-07-09'),(10,'13:30:00','Cambio de vendajes',2,2,'2023-07-10'),(11,'15:45:00','Consulta de control',3,3,'2023-07-11'),(48,'15:45:00','Consulta de control',7,3,'2023-07-11'),(49,'09:30:00','Problemas respiratorios',8,2,'2023-07-12'),(52,'09:00:00','Consulta de rutina',1,2,'2023-07-05'),(53,'10:30:00','Dolor abdominal',2,2,'2023-07-06'),(54,'14:15:00','Vacunación anual',3,2,'2023-07-07'),(55,'16:45:00','Corte de uñas',4,3,'2023-07-08'),(56,'11:00:00','Examen de sangre',5,1,'2023-07-09'),(57,'13:30:00','Cambio de vendajes',6,2,'2023-07-10'),(58,'15:45:00','Consulta de control',7,3,'2023-07-11'),(59,'09:00:00','Consulta de rutina',1,2,'2023-07-05'),(60,'10:30:00','Dolor abdominal',2,2,'2023-07-06'),(61,'14:15:00','Vacunación anual',3,2,'2023-07-07'),(62,'16:45:00','Corte de uñas',4,3,'2023-07-08'),(63,'11:00:00','Examen de sangre',5,1,'2023-07-09'),(64,'13:30:00','Cambio de vendajes',6,2,'2023-07-10'),(65,'15:45:00','Consulta de control',7,3,'2023-07-11');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historiaclinica`
--

DROP TABLE IF EXISTS `historiaclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historiaclinica` (
  `id_hc` int NOT NULL AUTO_INCREMENT,
  `observaciones` text NOT NULL,
  `id_consulta` int NOT NULL,
  `id_veterinario` int NOT NULL,
  PRIMARY KEY (`id_hc`),
  KEY `id_consulta` (`id_consulta`),
  KEY `id_veterinario` (`id_veterinario`),
  CONSTRAINT `historiaclinica_ibfk_2` FOREIGN KEY (`id_veterinario`) REFERENCES `veterinario` (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historiaclinica`
--

LOCK TABLES `historiaclinica` WRITE;
/*!40000 ALTER TABLE `historiaclinica` DISABLE KEYS */;
INSERT INTO `historiaclinica` VALUES (1,'Estado sin cambios aparentes para el paciente',3,1),(2,'Revision post operatoria satisfactoria, el paciente evoluciona favorablemente a la protesis',1,3),(3,'Leve cuadro infeccioso por laceracion en pata delantera derecha provocada por trifulca en tejado',2,1),(4,'Radiografia de torax: Normal',4,4),(6,'El paciente ha perdido peso de forma considerable en las últimas semanas.',2,2),(7,'El paciente presenta dificultad para respirar y secreción nasal.',3,1),(8,'El paciente ha sufrido una fractura en una de sus extremidades.',4,3),(9,'El paciente presenta vómitos recurrentes y pérdida de pelo.',5,2),(10,'El paciente muestra comportamiento agresivo hacia otros animales.',6,1),(11,'El paciente presenta alergias cutáneas y picazón intensa.',7,4),(12,'El paciente ha sufrido una mordedura de otro animal en el parque.',8,3),(13,'El paciente muestra síntomas de infección de oído.',9,1),(14,'El paciente presenta diarrea persistente y deshidratación.',10,2),(15,'El paciente ha ingerido una sustancia tóxica y presenta vómitos.',11,3),(16,'El paciente ha sufrido un accidente y presenta heridas en varias partes del cuerpo.',12,1),(20,'sararararara',3,2),(21,'saralalalala',1,3),(22,'sarasa',2,2);
/*!40000 ALTER TABLE `historiaclinica` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_HistoriaClinica_AfterUpdate` AFTER UPDATE ON `historiaclinica` FOR EACH ROW BEGIN
    INSERT INTO Log_HistoriaClinica (historia_id, fecha_hora, responsable, accion_realizada, detalles)
    VALUES (NEW.id_hc, NOW(), USER(), 'actualizar', CONCAT('Se actualizó la historia clínica por el responsable ', USER(), ' a las ', NOW()));

    -- Insertar registro en caso de creación
    IF NEW.observaciones = 'creado' THEN
        INSERT INTO Log_HistoriaClinica (historia_id, fecha_hora, responsable, accion_realizada, detalles)
        VALUES (NEW.id_hc, NOW(), USER(), 'crear', CONCAT('Se creó la historia clínica por el responsable ', USER(), ' a las ', NOW()));
    END IF;

    -- Insertar registro en caso de eliminación
    IF NEW.observaciones = 'eliminado' THEN
        INSERT INTO Log_HistoriaClinica (historia_id, fecha_hora, responsable, accion_realizada, detalles)
        VALUES (NEW.id_hc, NOW(), USER(), 'eliminar', CONCAT('Se eliminó la historia clínica por el responsable ', USER(), ' a las ', NOW()));
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `intervencionquirurgica`
--

DROP TABLE IF EXISTS `intervencionquirurgica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intervencionquirurgica` (
  `id_iq` int NOT NULL AUTO_INCREMENT,
  `operacion` varchar(100) NOT NULL,
  `observaciones` varchar(1000) NOT NULL,
  `id_hc` int NOT NULL,
  `id_mascota` int NOT NULL,
  PRIMARY KEY (`id_iq`),
  KEY `id_hc` (`id_hc`),
  KEY `id_mascota` (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intervencionquirurgica`
--

LOCK TABLES `intervencionquirurgica` WRITE;
/*!40000 ALTER TABLE `intervencionquirurgica` DISABLE KEYS */;
INSERT INTO `intervencionquirurgica` VALUES (1,'exploratoria','Vias totalmente limpias',3,2),(2,'diagnostico limpio','sin operacionesal momento',4,4),(3,'Extraccion dental','Retiro de pieza dental',1,3),(4,'Clavo quirurgico','Aplicacion de clavo quirurgico en falta de articulacion normal',2,1);
/*!40000 ALTER TABLE `intervencionquirurgica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_historiaclinica`
--

DROP TABLE IF EXISTS `log_historiaclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_historiaclinica` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `historia_id` int DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `veterinario_id` int DEFAULT NULL,
  `accion_realizada` varchar(50) DEFAULT NULL,
  `detalles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_historiaclinica`
--

LOCK TABLES `log_historiaclinica` WRITE;
/*!40000 ALTER TABLE `log_historiaclinica` DISABLE KEYS */;
INSERT INTO `log_historiaclinica` VALUES (1,1,'2023-06-20 21:30:42',1,'actualizar','Se actualizó la historia clínica'),(5,2,'2023-11-21 10:30:00',1,NULL,'actualizado');
/*!40000 ALTER TABLE `log_historiaclinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_veterinario`
--

DROP TABLE IF EXISTS `log_veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_veterinario` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime DEFAULT NULL,
  `veterinario_id` int DEFAULT NULL,
  `accion_realizada` varchar(50) DEFAULT NULL,
  `detalles` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_veterinario`
--

LOCK TABLES `log_veterinario` WRITE;
/*!40000 ALTER TABLE `log_veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `especie` varchar(100) NOT NULL,
  `peso` int NOT NULL,
  `id_cliente` int NOT NULL,
  `sexo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `FK_Mascota_Cliente` (`id_cliente`),
  CONSTRAINT `FK_Mascota_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES (1,'Manuelita','Tortuga',5,1,'H'),(2,'Miti','Gato',4,2,'H'),(3,'Fido','Perro',11,4,'M'),(4,'Stich','Canario',3,3,'M'),(5,'toto','loro',1,4,'M'),(6,'tobby','Huron',3,6,'M'),(7,'Nafiri','Perro',10,7,'H'),(8,'Yummi','Gato',4,10,'H'),(9,'Darius','Perro',6,11,'M'),(10,'kung lao','Huron',3,15,'M'),(11,'Lux','Gato',8,12,'H'),(12,'Tristana','Loro',3,14,'H'),(25,'Lucario','Loro',1,5,'M'),(26,'Shinx','Perro',8,14,'M'),(27,'Leafon','Gato',5,10,'M'),(28,'Evee','Perro',9,8,'H'),(29,'Sasa','Gato',5,7,'H'),(30,'Luly','Huron',2,6,'H'),(31,'Ezreal','Gato',6,9,'M'),(32,'Vex','Gato',6,9,'H'),(33,'Sachi','Gato',5,9,'H'),(34,'Mufalso','Perro',12,13,'M'),(35,'Trafiti','perro',15,12,'M'),(36,'Trafiti','perro',15,12,'M'),(37,'Trafiti','perro',15,12,'M'),(38,'Trafiti','perro',15,12,'M'),(39,'Travarino','perro',10,12,'M'),(40,'Selpud','gato',5,14,'M'),(41,'Manga','huron',3,14,'H'),(42,'Uchija','tortuga',9,14,'H');
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `id_tratamiento` int NOT NULL AUTO_INCREMENT,
  `tratamiento` varchar(100) NOT NULL,
  `observaciones` varchar(1000) NOT NULL,
  `id_hc` int NOT NULL,
  `dosis` decimal(10,2) NOT NULL DEFAULT '1.00',
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_hc` (`id_hc`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (1,'Anti parasitario','Primera dosis aplicada. Segunda dentro de 15 dias',4,1.00),(2,'Amoxicilina','Infeccion menor',1,1.00),(3,'Anti inflamatorio','Inflamacion en articulacion posterior',3,1.00),(4,'Ambulatorio','Especificar segun caso',2,1.00),(5,'Azitromicina','sasasasasas',1,10.00),(6,'Azitromicina','sasasasasas',1,10.00),(7,'Dexametona','observaciones para Dexametona',2,5.00),(8,'Novibac KC','observaciones para Novibac KC',3,8.00),(9,'Novibac LEPTO','observaciones para Novibac LEPTO',4,7.00),(10,'Karsivan','observaciones para Karsivan',5,12.00),(11,'salix','observaciones para salix',6,9.00);
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `id_veterinario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `Apellido` varchar(1000) NOT NULL,
  `especialidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES (1,'Marcela','Di pretto',NULL),(2,'Juan Manuel','Ugarte',NULL),(3,'Domingo','Fausto',NULL),(4,'Mina','Alfaraz',NULL);
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_Veterinario_AfterInsert` AFTER INSERT ON `veterinario` FOR EACH ROW BEGIN
    INSERT INTO Log_Veterinario (fecha_hora, responsable, accion_realizada, detalles)
    VALUES (NOW(), USER(), 'crear', CONCAT('Se creó un nuevo veterinario por el responsable ', USER(), ' a las ', NOW()));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_Veterinario_AfterUpdate` AFTER UPDATE ON `veterinario` FOR EACH ROW BEGIN
    -- Verificar si se cambió el nombre del veterinario
    IF NEW.nombre != OLD.nombre THEN
        INSERT INTO Log_Veterinario (fecha_hora, responsable, accion_realizada, detalles)
        VALUES (NOW(), USER(), 'actualizar', CONCAT('Se cambió el nombre del veterinario de "', OLD.nombre, '" a "', NEW.nombre, '" por el responsable ', USER(), ' a las ', NOW()));
    END IF;

    -- Verificar si se cambió la especialidad del veterinario
    IF NEW.especialidad != OLD.especialidad THEN
        INSERT INTO Log_Veterinario (fecha_hora, responsable, accion_realizada, detalles)
        VALUES (NOW(), USER(), 'actualizar', CONCAT('Se cambió la especialidad del veterinario de "', OLD.especialidad, '" a "', NEW.especialidad, '" por el responsable ', USER(), ' a las ', NOW()));
    END IF;

    -- Agregar más IFs para otras columnas que desees rastrear en el log.

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_cliente_contacto`
--

DROP TABLE IF EXISTS `vista_cliente_contacto`;
/*!50001 DROP VIEW IF EXISTS `vista_cliente_contacto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_cliente_contacto` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_consulta_rutina`
--

DROP TABLE IF EXISTS `vista_consulta_rutina`;
/*!50001 DROP VIEW IF EXISTS `vista_consulta_rutina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consulta_rutina` AS SELECT 
 1 AS `id_consulta`,
 1 AS `id_mascota`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_intervencionquirurgica_limpia`
--

DROP TABLE IF EXISTS `vista_intervencionquirurgica_limpia`;
/*!50001 DROP VIEW IF EXISTS `vista_intervencionquirurgica_limpia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_intervencionquirurgica_limpia` AS SELECT 
 1 AS `id_iq`,
 1 AS `id_mascota`,
 1 AS `observaciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_intervencionquirurgica_limpio`
--

DROP TABLE IF EXISTS `vista_intervencionquirurgica_limpio`;
/*!50001 DROP VIEW IF EXISTS `vista_intervencionquirurgica_limpio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_intervencionquirurgica_limpio` AS SELECT 
 1 AS `id_iq`,
 1 AS `id_mascota`,
 1 AS `observaciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_mascota_hembra`
--

DROP TABLE IF EXISTS `vista_mascota_hembra`;
/*!50001 DROP VIEW IF EXISTS `vista_mascota_hembra`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_mascota_hembra` AS SELECT 
 1 AS `id_mascota`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_veterinario_nombre`
--

DROP TABLE IF EXISTS `vista_veterinario_nombre`;
/*!50001 DROP VIEW IF EXISTS `vista_veterinario_nombre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_veterinario_nombre` AS SELECT 
 1 AS `id_veterinario`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_idconsulta_nombres`
--

DROP TABLE IF EXISTS `vw_idconsulta_nombres`;
/*!50001 DROP VIEW IF EXISTS `vw_idconsulta_nombres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_idconsulta_nombres` AS SELECT 
 1 AS `id_consulta`,
 1 AS `nombre_cliente`,
 1 AS `nombre_mascota`,
 1 AS `nombre_veterinario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_idconsulta_nombres_2`
--

DROP TABLE IF EXISTS `vw_idconsulta_nombres_2`;
/*!50001 DROP VIEW IF EXISTS `vw_idconsulta_nombres_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_idconsulta_nombres_2` AS SELECT 
 1 AS `id_consulta`,
 1 AS `nombre_cliente`,
 1 AS `nombre_mascota`,
 1 AS `nombre_veterinario`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'veterinaria'
--

--
-- Dumping routines for database 'veterinaria'
--
/*!50003 DROP FUNCTION IF EXISTS `calcular_dosificacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_dosificacion`(id_mascota INT, id_tratamiento INT) RETURNS decimal(18,2)
    DETERMINISTIC
BEGIN
    DECLARE peso DECIMAL(18,2);
    DECLARE dosis DECIMAL(18,2);
    DECLARE promedio DECIMAL(18,2);
    DECLARE peso_mascota DECIMAL(18,2);
    DECLARE dosis_tratamiento DECIMAL(18,2) ;
    -- peso mascota
    SELECT m.peso INTO peso_mascota
    FROM mascota m
    WHERE m.id_mascota = id_mascota;

    -- dosis del tratamiento
    SELECT t.dosis INTO dosis_tratamiento
    FROM tratamiento t
    WHERE t.id_tratamiento = id_tratamiento;
    
    -- promedio
    SET promedio = (peso_mascota + dosis_tratamiento) / 2;

    RETURN promedio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `contar_consultas_mascota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `contar_consultas_mascota`(id_mascota INT, nombre_mascota VARCHAR(100)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_consultas INT;
    -- función logica
    IF id_mascota IS NOT NULL THEN
        SELECT COUNT(*) INTO total_consultas
        FROM consulta
        WHERE id_mascota = id_mascota;
    ELSE
        SELECT COUNT(*) INTO total_consultas
		FROM consulta c
		INNER JOIN mascota m ON  c.id_mascota=m.id_mascota
		WHERE c.id_mascota = nombre_mascota;
    END IF;
    RETURN total_consultas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarConsulta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarConsulta`(
    IN p_horario TIME,
    IN p_observaciones VARCHAR(1000),
    IN p_id_mascota INT,
    IN p_id_veterinario INT,
    IN p_fecha DATE,
    OUT p_id_consulta INT
)
BEGIN
    INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha)
    VALUES (p_horario, p_observaciones, p_id_mascota, p_id_veterinario, p_fecha);

    SET p_id_consulta = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdenarTabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarTabla`(

  IN tabla VARCHAR(25),

  IN campo VARCHAR(25),

  IN ordenamiento VARCHAR(5)

)
BEGIN

  SET @sql = CONCAT('SELECT * FROM ', tabla, ' ORDER BY ', campo, ' ', ordenamiento );



  PREPARE stmt FROM @sql;

  EXECUTE stmt;

  DEALLOCATE PREPARE stmt;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_cliente_contacto`
--

/*!50001 DROP VIEW IF EXISTS `vista_cliente_contacto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_cliente_contacto` AS select `cliente`.`id_cliente` AS `id_cliente`,`cliente`.`nombre` AS `nombre` from `cliente` where (`cliente`.`telefono` = 1168319388) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_consulta_rutina`
--

/*!50001 DROP VIEW IF EXISTS `vista_consulta_rutina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consulta_rutina` AS select `consulta`.`id_consulta` AS `id_consulta`,`consulta`.`id_mascota` AS `id_mascota` from `consulta` where (`consulta`.`observaciones` = 'control de rutina') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_intervencionquirurgica_limpia`
--

/*!50001 DROP VIEW IF EXISTS `vista_intervencionquirurgica_limpia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_intervencionquirurgica_limpia` AS select `intervencionquirurgica`.`id_iq` AS `id_iq`,`intervencionquirurgica`.`id_mascota` AS `id_mascota`,`intervencionquirurgica`.`observaciones` AS `observaciones` from `intervencionquirurgica` where (`intervencionquirurgica`.`observaciones` = 'diagnostico limpio') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_intervencionquirurgica_limpio`
--

/*!50001 DROP VIEW IF EXISTS `vista_intervencionquirurgica_limpio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_intervencionquirurgica_limpio` AS select `intervencionquirurgica`.`id_iq` AS `id_iq`,`intervencionquirurgica`.`id_mascota` AS `id_mascota`,`intervencionquirurgica`.`observaciones` AS `observaciones` from `intervencionquirurgica` where (`intervencionquirurgica`.`observaciones` like '%limpia%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_mascota_hembra`
--

/*!50001 DROP VIEW IF EXISTS `vista_mascota_hembra`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_mascota_hembra` AS select `mascota`.`id_mascota` AS `id_mascota`,`mascota`.`nombre` AS `nombre` from `mascota` where (`mascota`.`sexo` = 'H') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_veterinario_nombre`
--

/*!50001 DROP VIEW IF EXISTS `vista_veterinario_nombre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_veterinario_nombre` AS select `veterinario`.`id_veterinario` AS `id_veterinario`,`veterinario`.`nombre` AS `nombre` from `veterinario` where (`veterinario`.`Apellido` = 'Fausto') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_idconsulta_nombres`
--

/*!50001 DROP VIEW IF EXISTS `vw_idconsulta_nombres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_idconsulta_nombres` AS select `con`.`id_consulta` AS `id_consulta`,`c`.`nombre` AS `nombre_cliente`,`m`.`nombre` AS `nombre_mascota`,`v`.`nombre` AS `nombre_veterinario` from (((`cliente` `c` join `mascota` `m` on((`c`.`id_cliente` = `m`.`id_cliente`))) join `consulta` `con` on((`con`.`id_mascota` = `m`.`id_mascota`))) join `veterinario` `v` on((`v`.`id_veterinario` = `con`.`id_veterinario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_idconsulta_nombres_2`
--

/*!50001 DROP VIEW IF EXISTS `vw_idconsulta_nombres_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_idconsulta_nombres_2` AS select `con`.`id_consulta` AS `id_consulta`,`c`.`nombre` AS `nombre_cliente`,`m`.`nombre` AS `nombre_mascota`,`v`.`nombre` AS `nombre_veterinario` from (((`consulta` `con` join `mascota` `m` on((`m`.`id_mascota` = `con`.`id_mascota`))) join `cliente` `c` on((`m`.`id_cliente` = `c`.`id_cliente`))) join `veterinario` `v` on((`v`.`id_veterinario` = `con`.`id_veterinario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-05 17:01:51
