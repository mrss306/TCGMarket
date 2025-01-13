CREATE DATABASE  IF NOT EXISTS `tcgmarket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tcgmarket`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tcgmarket
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `accessorio`
--

DROP TABLE IF EXISTS `accessorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessorio` (
  `produttore` varchar(45) NOT NULL,
  `tipologia` varchar(45) NOT NULL,
  `articolo` int NOT NULL,
  PRIMARY KEY (`articolo`),
  CONSTRAINT `articolo_acc` FOREIGN KEY (`articolo`) REFERENCES `articolo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessorio`
--

LOCK TABLES `accessorio` WRITE;
/*!40000 ALTER TABLE `accessorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articolo`
--

DROP TABLE IF EXISTS `articolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articolo` (
  `id` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `prezzo` float NOT NULL,
  `saldo` int NOT NULL,
  `data_di_uscita` date DEFAULT NULL,
  `descrizione` varchar(145) DEFAULT NULL,
  `quantita` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articolo`
--

LOCK TABLES `articolo` WRITE;
/*!40000 ALTER TABLE `articolo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carta`
--

DROP TABLE IF EXISTS `carta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carta` (
  `lingua` int DEFAULT NULL,
  `tcg` varchar(45) DEFAULT NULL,
  `set` varchar(45) DEFAULT NULL,
  `condizione` varchar(45) DEFAULT NULL,
  `articolo` int NOT NULL,
  PRIMARY KEY (`articolo`),
  CONSTRAINT `articolo_carta` FOREIGN KEY (`articolo`) REFERENCES `articolo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta`
--

LOCK TABLES `carta` WRITE;
/*!40000 ALTER TABLE `carta` DISABLE KEYS */;
/*!40000 ALTER TABLE `carta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenuto`
--

DROP TABLE IF EXISTS `contenuto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenuto` (
  `ordine` bigint NOT NULL,
  `articolo` int NOT NULL,
  `iva` int DEFAULT NULL,
  `prezzo_acquisto` float DEFAULT NULL,
  `nome_art` varchar(45) DEFAULT NULL,
  `num_art_acq` int DEFAULT NULL,
  PRIMARY KEY (`ordine`,`articolo`),
  KEY `articolo_idx` (`articolo`),
  CONSTRAINT `articolo_cnt` FOREIGN KEY (`articolo`) REFERENCES `articolo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ordine` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`numero_ordine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenuto`
--

LOCK TABLES `contenuto` WRITE;
/*!40000 ALTER TABLE `contenuto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenuto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatturazione`
--

DROP TABLE IF EXISTS `fatturazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatturazione` (
  `utente` int NOT NULL,
  `metodo_di_pagamento` int NOT NULL,
  PRIMARY KEY (`utente`,`metodo_di_pagamento`),
  KEY `metodo_di_pagamento_idx` (`metodo_di_pagamento`),
  CONSTRAINT `metodo_di_pagamento` FOREIGN KEY (`metodo_di_pagamento`) REFERENCES `metodo_di_pagamento` (`numero`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatturazione`
--

LOCK TABLES `fatturazione` WRITE;
/*!40000 ALTER TABLE `fatturazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatturazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foto` (
  `foto` blob NOT NULL,
  `id` int NOT NULL,
  `articolo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articolo_idx` (`articolo`),
  CONSTRAINT `articolo` FOREIGN KEY (`articolo`) REFERENCES `articolo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foto`
--

LOCK TABLES `foto` WRITE;
/*!40000 ALTER TABLE `foto` DISABLE KEYS */;
/*!40000 ALTER TABLE `foto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo`
--

DROP TABLE IF EXISTS `indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo` (
  `via` varchar(80) NOT NULL,
  `utente` int NOT NULL,
  `cap` int NOT NULL,
  `numero_civico` int NOT NULL,
  PRIMARY KEY (`via`,`cap`),
  KEY `numero_civico_idx` (`numero_civico`),
  KEY `cap_idx` (`cap`),
  KEY `utente_idx` (`utente`),
  KEY `via_idx` (`via`,`numero_civico`,`cap`),
  CONSTRAINT `utente_indr` FOREIGN KEY (`utente`) REFERENCES `utente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `via` FOREIGN KEY (`via`, `numero_civico`, `cap`) REFERENCES `indirizzo_spedizione` (`via`, `numero_civico`, `cap`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo`
--

LOCK TABLES `indirizzo` WRITE;
/*!40000 ALTER TABLE `indirizzo` DISABLE KEYS */;
/*!40000 ALTER TABLE `indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indirizzo_spedizione`
--

DROP TABLE IF EXISTS `indirizzo_spedizione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indirizzo_spedizione` (
  `via` varchar(80) NOT NULL,
  `numero_civico` int NOT NULL,
  `cap` int NOT NULL,
  `citta` varchar(45) DEFAULT NULL,
  `provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`via`,`numero_civico`,`cap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indirizzo_spedizione`
--

LOCK TABLES `indirizzo_spedizione` WRITE;
/*!40000 ALTER TABLE `indirizzo_spedizione` DISABLE KEYS */;
/*!40000 ALTER TABLE `indirizzo_spedizione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_di_pagamento`
--

DROP TABLE IF EXISTS `metodo_di_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_di_pagamento` (
  `tipo` int DEFAULT NULL,
  `titolare` varchar(45) DEFAULT NULL,
  `scadenza` date DEFAULT NULL,
  `predefinito` tinyint(1) DEFAULT NULL,
  `indirizzo_fatturazione` varchar(45) DEFAULT NULL,
  `numero` int NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_di_pagamento`
--

LOCK TABLES `metodo_di_pagamento` WRITE;
/*!40000 ALTER TABLE `metodo_di_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `metodo_di_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordine`
--

DROP TABLE IF EXISTS `ordine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordine` (
  `numero_ordine` bigint NOT NULL,
  `costo_totale` int NOT NULL,
  `indirizzo spedizione` varchar(100) DEFAULT NULL,
  `data_spedizione` date DEFAULT NULL,
  `metodo_di_pagamento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numero_ordine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordine`
--

LOCK TABLES `ordine` WRITE;
/*!40000 ALTER TABLE `ordine` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensione`
--

DROP TABLE IF EXISTS `recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensione` (
  `voto` int DEFAULT NULL,
  `testo recensione` varchar(500) DEFAULT NULL,
  `data_pubblicazione` date DEFAULT NULL,
  `utente` int NOT NULL,
  `articolo` varchar(45) NOT NULL,
  PRIMARY KEY (`utente`,`articolo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensione`
--

LOCK TABLES `recensione` WRITE;
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sealed`
--

DROP TABLE IF EXISTS `sealed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sealed` (
  `lingua` int DEFAULT NULL,
  `tcg` varchar(45) DEFAULT NULL,
  `tipologia` varchar(45) DEFAULT NULL,
  `articolo` int NOT NULL,
  PRIMARY KEY (`articolo`),
  CONSTRAINT `aritocolo_sealed` FOREIGN KEY (`articolo`) REFERENCES `articolo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sealed`
--

LOCK TABLES `sealed` WRITE;
/*!40000 ALTER TABLE `sealed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transazione`
--

DROP TABLE IF EXISTS `transazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transazione` (
  `utente` int NOT NULL,
  `ordine` bigint NOT NULL,
  `data_ordine` datetime NOT NULL,
  PRIMARY KEY (`utente`,`ordine`),
  KEY `ordine_idx` (`ordine`),
  CONSTRAINT `ordine_trs` FOREIGN KEY (`ordine`) REFERENCES `ordine` (`numero_ordine`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `utente_trs` FOREIGN KEY (`utente`) REFERENCES `utente` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transazione`
--

LOCK TABLES `transazione` WRITE;
/*!40000 ALTER TABLE `transazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `transazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `num_telefono` varchar(45) DEFAULT NULL,
  `paese_residenza` varchar(45) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-13 15:42:01
