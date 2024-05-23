-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cadastro
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `country_code` char(3) COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `population` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'São Paulo','BRA','São Paulo',12300000),(2,'Rio de Janeiro','BRA','Rio de Janeiro',6748000),(3,'Salvador','BRA','Bahia',2886698),(4,'Fortaleza','BRA','Ceará',2686612),(5,'Belo Horizonte','BRA','Minas Gerais',2513451),(6,'Brasília','BRA','Distrito Federal',3055149),(7,'Curitiba','BRA','Paraná',1963726),(8,'Manaus','BRA','Amazonas',2182763),(9,'Recife','BRA','Pernambuco',1653461),(10,'Porto Alegre','BRA','Rio Grande do Sul',1484941),(11,'Goiânia','BRA','Goiás',1536097),(12,'Belém','BRA','Pará',1499641),(13,'Guarulhos','BRA','São Paulo',1379182),(14,'Campinas','BRA','São Paulo',1213792),(15,'São Luís','BRA','Maranhão',1108975),(16,'São Gonçalo','BRA','Rio de Janeiro',1091737),(17,'Maceió','BRA','Alagoas',1029129),(18,'Duque de Caxias','BRA','Rio de Janeiro',924624),(19,'Natal','BRA','Rio Grande do Norte',884122),(20,'Teresina','BRA','Piauí',864845),(21,'Campo Grande','BRA','Mato Grosso do Sul',906092),(22,'São Bernardo do Campo','BRA','São Paulo',844483),(23,'João Pessoa','BRA','Paraíba',817511),(24,'Nova Iguaçu','BRA','Rio de Janeiro',821128),(25,'Santo André','BRA','São Paulo',721368),(26,'Porto','POR','Porto',998000),(27,'Austin','EUA','Texas',14000000),(28,'Toronto','CAN','Ontário',3000000);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `idcurso` int NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descrição` text,
  `carga` int unsigned DEFAULT NULL,
  `totalaulas` int DEFAULT NULL,
  `ano` year DEFAULT '2016',
  PRIMARY KEY (`idcurso`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'HTML5','CURSOS DE HTML5',40,37,2014),(2,'ALGORITMOS','LOGICA DE PROGRAMAÇÃO',20,15,2014),(3,'PHOTOSHOP','DICAS DE PHOTOSHOP CC',10,8,2014),(4,'PHP','CURSO DE PHP PARA INICIANTES',40,20,2015),(6,'MYSQL','BANCO DE DADOS MYSQL',30,15,2016),(7,'WORD','CURSO COMPLETO DE WORD',40,30,2016),(8,'SAPATEADO','DANÇAS RÍTMICAS',40,30,2018),(9,'COZINHA ÁRABE','APRENDA A FAZER KIBE',40,30,2018),(10,'YOUTUBERS','GERAR POLEMICA E GANHAR INSCRITOS',5,2,2018);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafanhotos`
--

DROP TABLE IF EXISTS `gafanhotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafanhotos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `prof` varchar(20) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  `profissao` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cursopreferido` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cursopreferido` (`cursopreferido`),
  CONSTRAINT `gafanhotos_ibfk_1` FOREIGN KEY (`cursopreferido`) REFERENCES `cursos` (`idcurso`),
  CONSTRAINT `gafanhotos_ibfk_2` FOREIGN KEY (`cursopreferido`) REFERENCES `cursos` (`idcurso`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafanhotos`
--

LOCK TABLES `gafanhotos` WRITE;
/*!40000 ALTER TABLE `gafanhotos` DISABLE KEYS */;
INSERT INTO `gafanhotos` VALUES (1,'Matheus','Izidro','2003-02-16','M',75.89,1.79,'Brasil','Programador',6),(2,'Ana','Izidro','2000-07-10','F',62.50,1.65,'Brasil','programador ',2),(3,'João','Izidro','1995-05-23','M',80.20,1.75,'Brasil','programador',3),(4,'Maria','Izidro','1998-12-30','F',55.30,1.60,'Brasil','engenheiro',3),(5,'Pedro','Izidro','2001-09-18','M',70.00,1.80,'Brasil','professor',2),(6,'Bia','Izidro','2000-07-10','F',61.50,1.64,'Brasil','auxiliar de contabilidade',8),(7,'Johnes','Izidro','1995-05-23','M',88.20,1.72,'Brasil','medico',7),(8,'Marta','Izidro','1998-12-30','F',52.30,1.63,'Brasil','gerente de finanças',6),(9,'Jorge','Izidro','2001-09-18','M',73.00,1.87,'Brasil','gerente de rh',9),(10,'Bianca','Izidro','2000-02-12','F',49.90,1.55,'Brasil','comprador de peças',4),(11,'Marcones','izidro','2004-05-10','M',110.00,1.00,'Brasil','lenhador',NULL);
/*!40000 ALTER TABLE `gafanhotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gafanhotos_assiste_curso`
--

DROP TABLE IF EXISTS `gafanhotos_assiste_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gafanhotos_assiste_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` date DEFAULT NULL,
  `idgafanhoto` int DEFAULT NULL,
  `idcurso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idgafanhoto` (`idgafanhoto`),
  KEY `idcurso` (`idcurso`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafanhotos_assiste_curso`
--

LOCK TABLES `gafanhotos_assiste_curso` WRITE;
/*!40000 ALTER TABLE `gafanhotos_assiste_curso` DISABLE KEYS */;
INSERT INTO `gafanhotos_assiste_curso` VALUES (1,'2014-03-01',1,2),(2,'2014-01-01',3,1),(3,'2015-02-04',2,2),(4,'2015-11-24',4,9);
/*!40000 ALTER TABLE `gafanhotos_assiste_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meus_lanches`
--

DROP TABLE IF EXISTS `meus_lanches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meus_lanches` (
  `idlanche` int NOT NULL,
  `empresa` varchar(30) DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `data` date DEFAULT NULL,
  `nota` int DEFAULT NULL,
  `comentarios` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idlanche`),
  UNIQUE KEY `idlanche` (`idlanche`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meus_lanches`
--

LOCK TABLES `meus_lanches` WRITE;
/*!40000 ALTER TABLE `meus_lanches` DISABLE KEYS */;
/*!40000 ALTER TABLE `meus_lanches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `profissao` varchar(20) NOT NULL DEFAULT 'desempregado',
  `nascimento` date DEFAULT NULL,
  `sexo` enum('m','f') DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `altura` decimal(3,2) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'brasil',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
INSERT INTO `pessoas` VALUES (1,'Jorge ','','1984-01-02','m',74.50,1.80,'brasil'),(2,'Elias','','1984-01-02','m',78.50,1.80,'brasil'),(3,'Johnson','','1984-12-30','f',55.50,1.55,'brasil'),(4,'João','','1983-12-30','m',59.50,1.85,'brasil'),(5,'Joel','','1983-12-30','m',59.50,1.85,'brasil'),(6,'João Silva','','1983-12-30','m',59.50,1.85,'brasil'),(7,'mario','','1983-12-30','m',87.50,1.75,'portugal'),(8,'João','','1983-12-30','m',59.50,1.85,'brasil'),(9,'mariano','','1983-12-30','m',87.50,1.75,'portugal');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 22:46:39
