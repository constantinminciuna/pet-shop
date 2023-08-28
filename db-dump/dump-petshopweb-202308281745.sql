-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: petshopweb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animale`
--

DROP TABLE IF EXISTS `animale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animale` (
  `matricola` int NOT NULL,
  `tipo_animale` varchar(255) DEFAULT NULL,
  `nome_animale` varchar(255) DEFAULT NULL,
  `data_acquisto` varchar(255) DEFAULT NULL,
  `prezzo` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`matricola`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `animale_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clienteshop` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animale`
--

LOCK TABLES `animale` WRITE;
/*!40000 ALTER TABLE `animale` DISABLE KEYS */;
INSERT INTO `animale` VALUES (192874,'Gatto','Tommy',NULL,40,NULL),(233344,'Gatto','','05/01/2022',45,3),(233345,'Pesce','','06/01/2022',10,3),(234245,'Cane','Leo','2023-08-28',50,7),(345432,'Gatto','Luna','01/03/2023',50,2),(345439,'Gatto','Luna','19/01/2022',50,1),(356777,'Criceto','','07/01/2022',15,4),(455555,'Criceto','Billy','03/01/2022',20,2),(456666,'Cane','Pluto','04/01/2022',100,2),(534523,'Cane','Billy',NULL,60,NULL),(546777,'Gatto','Stella','08/01/2022',65,1),(562345,'Pesce','Gigio',NULL,10,NULL);
/*!40000 ALTER TABLE `animale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `data_di_nascita` varchar(255) DEFAULT NULL,
  `cellulare` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ruolo` char(1) DEFAULT 'G',
  `stato` char(1) DEFAULT 'A',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (2,'Constantin','Minciuna','CoMi2002','constantin@betacom.it','2002-05-18','3884313099','qwerty02','M','A'),(3,'Francesco','Iannazzo','FrIa2023','francesco@betacom.it','2023-07-06','1231231234','francy','G','A'),(6,'Guido','Curradi','GuCu2023','guido@betacom.it','2023-08-24','1231231234','guido','G','A');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienteshop`
--

DROP TABLE IF EXISTS `clienteshop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienteshop` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `citta` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `data_di_nascita` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienteshop`
--

LOCK TABLES `clienteshop` WRITE;
/*!40000 ALTER TABLE `clienteshop` DISABLE KEYS */;
INSERT INTO `clienteshop` VALUES (1,'Giorgio','Rossi ','Bari','33467788','Piazza Italia  4',NULL,NULL,NULL,NULL),(2,'Marco','Rossi ','Milano ','33498756','via roma 34',NULL,NULL,NULL,NULL),(3,'Francesco','Bianchi','Roma','33500099','via milano 55',NULL,NULL,NULL,NULL),(4,'Pietro','Verdi','Torino','33356777','via cantore 3',NULL,NULL,NULL,NULL),(7,'Giorgio','Giorgi',NULL,NULL,NULL,'GiGi2023','giorgio','2023-08-17','giorgio@giorgi.it');
/*!40000 ALTER TABLE `clienteshop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'petshopweb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-28 17:45:16
