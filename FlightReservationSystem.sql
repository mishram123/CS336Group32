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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `AircraftID` varchar(10) NOT NULL,
  `seats` int DEFAULT NULL,
  `operation_days` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES ('A001',150,'Monday,Wednesday,Friday'),('A002',200,'Tuesday,Thursday,Saturday,Sunday'),('A003',180,'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday'),('A004',160,'Monday,Thursday,Saturday'),('A005',190,'Tuesday,Friday,Sunday'),('A006',170,'Monday,Tuesday,Thursday,Saturday,Sunday'),('A007',220,'Wednesday,Saturday,Sunday'),('A008',140,'Tuesday,Wednesday,Friday,Saturday'),('A009',210,'Monday,Wednesday,Saturday,Sunday'),('A010',180,'Tuesday,Thursday,Sunday'),('A011',160,'Monday,Wednesday,Friday,Saturday'),('A012',190,'Tuesday,Thursday,Sunday'),('A013',180,'Monday,Wednesday,Saturday,Sunday'),('A014',170,'Tuesday,Thursday,Friday,Sunday'),('A015',200,'Monday,Wednesday,Friday,Sunday');
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airlineairportassociatedwith`
--

DROP TABLE IF EXISTS `airlineairportassociatedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airlineairportassociatedwith` (
  `ThreeLetterID` varchar(3) NOT NULL,
  `TwoLetterID` varchar(2) NOT NULL,
  PRIMARY KEY (`ThreeLetterID`,`TwoLetterID`),
  KEY `TwoLetterID` (`TwoLetterID`),
  CONSTRAINT `airlineairportassociatedwith_ibfk_1` FOREIGN KEY (`ThreeLetterID`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `airlineairportassociatedwith_ibfk_2` FOREIGN KEY (`TwoLetterID`) REFERENCES `airlinecompany` (`TwoLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airlineairportassociatedwith`
--

LOCK TABLES `airlineairportassociatedwith` WRITE;
/*!40000 ALTER TABLE `airlineairportassociatedwith` DISABLE KEYS */;
INSERT INTO `airlineairportassociatedwith` VALUES ('DFW','AA'),('JFK','AA'),('LHR','BA'),('ATL','DL'),('LAX','DL'),('DXB','EK'),('EWR','UA'),('ORD','UA'),('PEK','UA'),('SFO','UA');
/*!40000 ALTER TABLE `airlineairportassociatedwith` ENABLE KEYS */;
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
-- Table structure for table `departurearrival`
--

DROP TABLE IF EXISTS `departurearrival`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departurearrival` (
  `flightNumber` varchar(5) NOT NULL,
  `DepartureThreeLetterID` varchar(3) NOT NULL,
  `ArrivalThreeLetterID` varchar(3) NOT NULL,
  PRIMARY KEY (`flightNumber`,`DepartureThreeLetterID`,`ArrivalThreeLetterID`),
  KEY `DepartureThreeLetterID` (`DepartureThreeLetterID`),
  KEY `ArrivalThreeLetterID` (`ArrivalThreeLetterID`),
  CONSTRAINT `departurearrival_ibfk_1` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `departurearrival_ibfk_2` FOREIGN KEY (`DepartureThreeLetterID`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `departurearrival_ibfk_3` FOREIGN KEY (`ArrivalThreeLetterID`) REFERENCES `airport` (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departurearrival`
--

LOCK TABLES `departurearrival` WRITE;
/*!40000 ALTER TABLE `departurearrival` DISABLE KEYS */;
/*!40000 ALTER TABLE `departurearrival` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domesticflight`
--

DROP TABLE IF EXISTS `domesticflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domesticflight` (
  `flightNumber` varchar(5) NOT NULL,
  `AircraftID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`flightNumber`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `domesticflight_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`),
  CONSTRAINT `domesticflight_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domesticflight`
--

LOCK TABLES `domesticflight` WRITE;
/*!40000 ALTER TABLE `domesticflight` DISABLE KEYS */;
/*!40000 ALTER TABLE `domesticflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightservices`
--

DROP TABLE IF EXISTS `flightservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightservices` (
  `flightNumber` varchar(5) NOT NULL,
  `AircraftID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`flightNumber`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `flightservices_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightservices`
--

LOCK TABLES `flightservices` WRITE;
/*!40000 ALTER TABLE `flightservices` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internationalflight`
--

DROP TABLE IF EXISTS `internationalflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internationalflight` (
  `flightNumber` varchar(5) NOT NULL,
  `AircraftID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`flightNumber`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `internationalflight_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`),
  CONSTRAINT `internationalflight_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internationalflight`
--

LOCK TABLES `internationalflight` WRITE;
/*!40000 ALTER TABLE `internationalflight` DISABLE KEYS */;
/*!40000 ALTER TABLE `internationalflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `onewayticket`
--

DROP TABLE IF EXISTS `onewayticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onewayticket` (
  `TicketNumber` varchar(10) NOT NULL,
  `DepartureFlightNumber` varchar(5) NOT NULL,
  PRIMARY KEY (`TicketNumber`),
  KEY `DepartureFlightNumber` (`DepartureFlightNumber`),
  CONSTRAINT `onewayticket_ibfk_1` FOREIGN KEY (`TicketNumber`) REFERENCES `ticket` (`TicketNumber`),
  CONSTRAINT `onewayticket_ibfk_2` FOREIGN KEY (`DepartureFlightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `onewayticket`
--

LOCK TABLES `onewayticket` WRITE;
/*!40000 ALTER TABLE `onewayticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `onewayticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operates`
--

DROP TABLE IF EXISTS `operates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operates` (
  `TwoLetterID` varchar(2) NOT NULL,
  `flightNumber` varchar(5) NOT NULL,
  PRIMARY KEY (`TwoLetterID`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  CONSTRAINT `operates_ibfk_1` FOREIGN KEY (`TwoLetterID`) REFERENCES `airlinecompany` (`TwoLetterID`),
  CONSTRAINT `operates_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operates`
--

LOCK TABLES `operates` WRITE;
/*!40000 ALTER TABLE `operates` DISABLE KEYS */;
/*!40000 ALTER TABLE `operates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owns`
--

DROP TABLE IF EXISTS `owns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owns` (
  `TwoLetterID` varchar(2) NOT NULL,
  `AircraftID` varchar(10) NOT NULL,
  PRIMARY KEY (`TwoLetterID`,`AircraftID`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`TwoLetterID`) REFERENCES `airlinecompany` (`TwoLetterID`),
  CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owns`
--

LOCK TABLES `owns` WRITE;
/*!40000 ALTER TABLE `owns` DISABLE KEYS */;
INSERT INTO `owns` VALUES ('AA','A001'),('AF','A002'),('BA','A003'),('DL','A004'),('EK','A005'),('LH','A006'),('QF','A007'),('SQ','A008'),('UA','A009'),('AA','A010'),('AF','A011'),('BA','A012'),('DL','A013'),('EK','A014'),('LH','A015');
/*!40000 ALTER TABLE `owns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roundtripticket`
--

DROP TABLE IF EXISTS `roundtripticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roundtripticket` (
  `TicketNumber` varchar(10) NOT NULL,
  `DepartureFlightNumber` varchar(5) NOT NULL,
  `ReturnFlightNumber` varchar(5) NOT NULL,
  PRIMARY KEY (`TicketNumber`),
  KEY `DepartureFlightNumber` (`DepartureFlightNumber`),
  KEY `ReturnFlightNumber` (`ReturnFlightNumber`),
  CONSTRAINT `roundtripticket_ibfk_1` FOREIGN KEY (`TicketNumber`) REFERENCES `ticket` (`TicketNumber`),
  CONSTRAINT `roundtripticket_ibfk_2` FOREIGN KEY (`DepartureFlightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `roundtripticket_ibfk_3` FOREIGN KEY (`ReturnFlightNumber`) REFERENCES `flightservices` (`flightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roundtripticket`
--

LOCK TABLES `roundtripticket` WRITE;
/*!40000 ALTER TABLE `roundtripticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `roundtripticket` ENABLE KEYS */;
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
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketNumber` varchar(10) NOT NULL,
  `seatNumber` varchar(3) DEFAULT NULL,
  `total_fare` float DEFAULT NULL,
  `bookingFee` float DEFAULT NULL,
  `purchaseDateTime` datetime DEFAULT NULL,
  `Passenger_Name` varchar(50) DEFAULT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `isEconomy` tinyint(1) DEFAULT NULL,
  `changeCancelFee` float DEFAULT NULL,
  PRIMARY KEY (`TicketNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketflightassociatedwith`
--

DROP TABLE IF EXISTS `ticketflightassociatedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticketflightassociatedwith` (
  `TicketNumber` varchar(10) NOT NULL,
  `flightNumber` varchar(5) NOT NULL,
  `fromAirport` varchar(3) DEFAULT NULL,
  `toAirport` varchar(3) DEFAULT NULL,
  `departureDate` date DEFAULT NULL,
  `departureTime` time DEFAULT NULL,
  PRIMARY KEY (`TicketNumber`,`flightNumber`),
  KEY `flightNumber` (`flightNumber`),
  KEY `fromAirport` (`fromAirport`),
  KEY `toAirport` (`toAirport`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_1` FOREIGN KEY (`TicketNumber`) REFERENCES `ticket` (`TicketNumber`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_2` FOREIGN KEY (`flightNumber`) REFERENCES `flightservices` (`flightNumber`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_3` FOREIGN KEY (`fromAirport`) REFERENCES `airport` (`ThreeLetterID`),
  CONSTRAINT `ticketflightassociatedwith_ibfk_4` FOREIGN KEY (`toAirport`) REFERENCES `airport` (`ThreeLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketflightassociatedwith`
--

LOCK TABLES `ticketflightassociatedwith` WRITE;
/*!40000 ALTER TABLE `ticketflightassociatedwith` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticketflightassociatedwith` ENABLE KEYS */;
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

-- Dump completed on 2023-12-04 14:59:43
