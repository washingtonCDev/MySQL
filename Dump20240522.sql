-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: redesocial
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gafanhotos_assiste_curso`
--

LOCK TABLES `gafanhotos_assiste_curso` WRITE;
/*!40000 ALTER TABLE `gafanhotos_assiste_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `gafanhotos_assiste_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_grupo`
--

DROP TABLE IF EXISTS `t_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_grupo` (
  `id_grupo` bigint NOT NULL,
  `id_criado_por` bigint NOT NULL,
  `id_atualizado_por` bigint NOT NULL,
  `titulo` varchar(75) NOT NULL,
  `sumario` tinytext NOT NULL,
  `status` varchar(45) NOT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  `profile` text NOT NULL,
  `conteudo` text,
  PRIMARY KEY (`id_grupo`),
  KEY `fk_t_usuario_t_grupo_criado_idx` (`id_criado_por`),
  KEY `fk_t_usuario_t_grupo_atualizado_idx` (`id_atualizado_por`),
  CONSTRAINT `fk_t_usuario_t_grupo_atualizado` FOREIGN KEY (`id_atualizado_por`) REFERENCES `t_usuario` (`id_usuario`),
  CONSTRAINT `fk_t_usuario_t_grupo_criado` FOREIGN KEY (`id_criado_por`) REFERENCES `t_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_grupo`
--

LOCK TABLES `t_grupo` WRITE;
/*!40000 ALTER TABLE `t_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_grupo_membro`
--

DROP TABLE IF EXISTS `t_grupo_membro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_grupo_membro` (
  `id_grupo_membro` bigint NOT NULL,
  `id_grupo` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `permissao` smallint NOT NULL,
  `status` smallint NOT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  `notas` text,
  PRIMARY KEY (`id_grupo_membro`),
  KEY `fk_t_grupo_t_grupo_membro_idx` (`id_grupo`),
  KEY `fk_t_usuario_t_grupo_membro_idx` (`id_usuario`),
  CONSTRAINT `fk_t_grupo_t_grupo_membro` FOREIGN KEY (`id_grupo`) REFERENCES `t_grupo` (`id_grupo`),
  CONSTRAINT `fk_t_usuario_t_grupo_membro` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_grupo_membro`
--

LOCK TABLES `t_grupo_membro` WRITE;
/*!40000 ALTER TABLE `t_grupo_membro` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_grupo_membro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_grupo_post`
--

DROP TABLE IF EXISTS `t_grupo_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_grupo_post` (
  `id_grupo_post` bigint NOT NULL,
  `id_grupo` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `mensagem` tinytext NOT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_grupo_post`),
  KEY `fk_t_grupo_t_grupo_post_idx` (`id_grupo`),
  KEY `fk_t_usuario_t_grupo_post_idx` (`id_usuario`),
  CONSTRAINT `fk_t_grupo_t_grupo_post` FOREIGN KEY (`id_grupo`) REFERENCES `t_grupo` (`id_grupo`),
  CONSTRAINT `fk_t_usuario_t_grupo_post` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_grupo_post`
--

LOCK TABLES `t_grupo_post` WRITE;
/*!40000 ALTER TABLE `t_grupo_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_grupo_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuario`
--

DROP TABLE IF EXISTS `t_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_usuario` (
  `id_usuario` bigint NOT NULL,
  `nome` varchar(60) NOT NULL,
  `apelido` varchar(50) DEFAULT NULL,
  `nascimento` datetime NOT NULL,
  `intro` tinytext,
  `profile` text,
  `email` varchar(45) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `senha_hash` varchar(45) NOT NULL,
  `dt_registrado` datetime DEFAULT NULL,
  `dt_ultimo_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `senha_hash_UNIQUE` (`senha_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuario`
--

LOCK TABLES `t_usuario` WRITE;
/*!40000 ALTER TABLE `t_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuario_amigo`
--

DROP TABLE IF EXISTS `t_usuario_amigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_usuario_amigo` (
  `id_usuario_1` bigint NOT NULL,
  `id_usuario_2` bigint NOT NULL,
  `status` smallint NOT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  `nota` text,
  PRIMARY KEY (`id_usuario_1`,`id_usuario_2`),
  KEY `fk_t_usuario_t_usuario_amigo_2_idx` (`id_usuario_2`),
  CONSTRAINT `fk_t_usuario_t_usuario_amigo_1` FOREIGN KEY (`id_usuario_1`) REFERENCES `t_usuario` (`id_usuario`),
  CONSTRAINT `fk_t_usuario_t_usuario_amigo_2` FOREIGN KEY (`id_usuario_2`) REFERENCES `t_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuario_amigo`
--

LOCK TABLES `t_usuario_amigo` WRITE;
/*!40000 ALTER TABLE `t_usuario_amigo` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_usuario_amigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_usuario_post`
--

DROP TABLE IF EXISTS `t_usuario_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_usuario_post` (
  `id_usuario_post` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  `mensagem` varchar(300) NOT NULL,
  `dt_criado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario_post`),
  KEY `fk_t_usuario_t_usuario_post_idx` (`id_usuario`),
  CONSTRAINT `fk_t_usuario_t_usuario_post` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_usuario_post`
--

LOCK TABLES `t_usuario_post` WRITE;
/*!40000 ALTER TABLE `t_usuario_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_usuario_post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 22:36:02
