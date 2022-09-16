CREATE DATABASE  IF NOT EXISTS `partenon_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `partenon_db`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: partenon_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `museum`
--

DROP TABLE IF EXISTS `museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museum` (
  `museum_id` int unsigned NOT NULL AUTO_INCREMENT,
  `museum_name` varchar(45) NOT NULL,
  `user_id` int unsigned NOT NULL,
  `province` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `height` varchar(45) NOT NULL,
  PRIMARY KEY (`museum_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  CONSTRAINT `user_museum_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum`
--

LOCK TABLES `museum` WRITE;
/*!40000 ALTER TABLE `museum` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum_banner`
--

DROP TABLE IF EXISTS `museum_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museum_banner` (
  `museum_banner_id` int unsigned NOT NULL AUTO_INCREMENT,
  `museum_id` int unsigned NOT NULL,
  `museum_banner` mediumtext NOT NULL,
  PRIMARY KEY (`museum_banner_id`),
  UNIQUE KEY `museum_id_UNIQUE` (`museum_id`),
  CONSTRAINT `museum_banner_fk` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`museum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum_banner`
--

LOCK TABLES `museum_banner` WRITE;
/*!40000 ALTER TABLE `museum_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum_contact`
--

DROP TABLE IF EXISTS `museum_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museum_contact` (
  `museum_contact_id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('TWITTER','FACEBOOK','WSP','EMAIL','INSTAGRAM') NOT NULL,
  `museum_id` int unsigned NOT NULL,
  `museum_contact` varchar(45) NOT NULL,
  PRIMARY KEY (`museum_contact_id`),
  KEY `museum_contact_fk_idx` (`museum_id`),
  CONSTRAINT `museum_contact_fk` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`museum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum_contact`
--

LOCK TABLES `museum_contact` WRITE;
/*!40000 ALTER TABLE `museum_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum_description`
--

DROP TABLE IF EXISTS `museum_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museum_description` (
  `museum_description_id` int unsigned NOT NULL AUTO_INCREMENT,
  `museum_id` int unsigned NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`museum_description_id`),
  UNIQUE KEY `museum_id_UNIQUE` (`museum_id`),
  CONSTRAINT `museum_description_fk` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`museum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum_description`
--

LOCK TABLES `museum_description` WRITE;
/*!40000 ALTER TABLE `museum_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum_plan`
--

DROP TABLE IF EXISTS `museum_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `museum_plan` (
  `museum_plan_id` int unsigned NOT NULL AUTO_INCREMENT,
  `museum_id` int unsigned NOT NULL,
  `museum_building_plan` mediumtext NOT NULL,
  PRIMARY KEY (`museum_plan_id`),
  UNIQUE KEY `museum_id_UNIQUE` (`museum_id`),
  CONSTRAINT `museum_plan_fk` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`museum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum_plan`
--

LOCK TABLES `museum_plan` WRITE;
/*!40000 ALTER TABLE `museum_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opening_hours`
--

DROP TABLE IF EXISTS `opening_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opening_hours` (
  `opening_hours_id` int unsigned NOT NULL AUTO_INCREMENT,
  `museum_id` int unsigned NOT NULL,
  `monday` varchar(45) NOT NULL,
  `tuesday` varchar(45) NOT NULL,
  `wednesday` varchar(45) NOT NULL,
  `thursday` varchar(45) NOT NULL,
  `friday` varchar(45) NOT NULL,
  `saturday` varchar(45) NOT NULL,
  `sunday` varchar(45) NOT NULL,
  PRIMARY KEY (`opening_hours_id`),
  UNIQUE KEY `museum_id_UNIQUE` (`museum_id`),
  CONSTRAINT `museum_opening_hours_fk` FOREIGN KEY (`museum_id`) REFERENCES `museum` (`museum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opening_hours`
--

LOCK TABLES `opening_hours` WRITE;
/*!40000 ALTER TABLE `opening_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `opening_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16 18:15:33
