CREATE DATABASE  IF NOT EXISTS `flightreservationsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flightreservationsystem`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: flightreservationsystem
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountID` varchar(20) NOT NULL,
  `loginDetails` varchar(50) DEFAULT NULL,
  `flightHistory` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`accountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlinecompany`
--

DROP TABLE IF EXISTS `airlinecompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlinecompany` (
  `TwoLetterID` varchar(2) NOT NULL,
  PRIMARY KEY (`TwoLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlinecompany`
--

LOCK TABLES `airlinecompany` WRITE;
/*!40000 ALTER TABLE `airlinecompany` DISABLE KEYS */;
INSERT INTO `airlinecompany` VALUES ('AA'),('AF'),('BA'),('DL'),('EK'),('LH'),('QF'),('SQ'),('UA');
/*!40000 ALTER TABLE `airlinecompany` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `ThreeLetterID` varchar(3) NOT NULL,
  PRIMARY KEY (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('AMD'),('AMS'),('ARN'),('ATL'),('AUH'),('BCN'),('BLR'),('BOM'),('BOS'),('BWI'),('CAN'),('CCU'),('CDG'),('CLT'),('COK'),('CPH'),('CTU'),('DCA'),('DEL'),('DEN'),('DFW'),('DMM'),('DOH'),('DTW'),('DUB'),('DXB'),('EWR'),('FCO'),('FLL'),('FRA'),('GOI'),('HEL'),('HKG'),('HNL'),('HYD'),('IAD'),('IAH'),('IST'),('JED'),('JFK'),('KMG'),('LAS'),('LAX'),('LGA'),('LHR'),('MAA'),('MAD'),('MCO'),('MDW'),('MIA'),('MSP'),('MUC'),('ORD'),('OSL'),('PDX'),('PEK'),('PHX'),('PNQ'),('PVG'),('RUH'),('SAN'),('SEA'),('SFO'),('SHA'),('SLC'),('SVO'),('SZX'),('TPA'),('XIY'),('ZRH');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `UserID` varchar(30) NOT NULL,
  `CustomerIdentifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('Customer1','Customer1'),('Customer12','Customer12');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrepresentative`
--

DROP TABLE IF EXISTS `customerrepresentative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerrepresentative` (
  `UserID` varchar(30) NOT NULL,
  `RepresentativeIdentifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `customerrepresentative_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrepresentative`
--

LOCK TABLES `customerrepresentative` WRITE;
/*!40000 ALTER TABLE `customerrepresentative` DISABLE KEYS */;
INSERT INTO `customerrepresentative` VALUES ('Rep1','Rep1');
/*!40000 ALTER TABLE `customerrepresentative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteadmin`
--

DROP TABLE IF EXISTS `siteadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siteadmin` (
  `UserID` varchar(30) NOT NULL,
  `AdminIdentifier` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `siteadmin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteadmin`
--

LOCK TABLES `siteadmin` WRITE;
/*!40000 ALTER TABLE `siteadmin` DISABLE KEYS */;
INSERT INTO `siteadmin` VALUES ('Admin1','Admin1');
/*!40000 ALTER TABLE `siteadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` varchar(30) NOT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Admin1','Admin1','SiteAdmin'),('Customer1','CustomerPassword','Customer'),('Customer12','CustomerPassword12','Customer'),('null','null','null'),('Rep1','Rep1','CustomerRepresentative');
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

-- Dump completed on 2023-12-01 21:55:54
