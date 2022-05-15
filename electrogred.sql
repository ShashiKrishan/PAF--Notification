-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: electrogred
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `billId` varchar(20) NOT NULL,
  `accountId` varchar(20) DEFAULT NULL,
  `joinDate` varchar(14) DEFAULT NULL,
  `meterReadingBeforeDate` varchar(40) DEFAULT NULL,
  `meterReadingBefore` varchar(40) DEFAULT NULL,
  `meterReadingNowDate` varchar(40) DEFAULT NULL,
  `meterReadingNow` varchar(40) DEFAULT NULL,
  `noOfUntitsConsumed` varchar(40) DEFAULT NULL,
  `chargeforelectricityConsume` varchar(40) DEFAULT NULL,
  `adjustments` varchar(40) DEFAULT NULL,
  `totalAmountDue` double(6,2) DEFAULT NULL,
  `billDate` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`billId`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `users` (`accountId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('BIAN657567100000','AN159756','dfsf','159756769','sdfsdf','43242','5454354','gfdfg','cgfdg','ddfgv',5667.00,'432sdfs');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notificationId` varchar(20) NOT NULL,
  `accountId` varchar(20) DEFAULT NULL,
  `billId` varchar(20) DEFAULT NULL,
  `amountToBePaid` double(6,2) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `mobileNumber` varchar(50) DEFAULT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `massage` varchar(200) DEFAULT NULL,
  `dateNotify` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`notificationId`),
  KEY `accountId` (`accountId`),
  KEY `billId` (`billId`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `users` (`accountId`) ON DELETE CASCADE,
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('NI22042606260242','AN159756','BIAN657567100000',5456.50,'hetti%40gmail.com','0711995336','bill+not+paid','february+bill+not+paid+fgd','2022-04-26'),('NI220515120033533','AN159756','BIAN657567100000',3333.00,'shashikrishan1996%40gmail.com','0710788014','dadyyyy','dasd','dsad'),('NI220515125623523','AN159756','BIAN657567100000',6799.00,'rachiya@gmail.com','0701800975','bill pay','please pay the bill','2022-04-15');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentId` varchar(20) NOT NULL,
  `accountId` varchar(20) DEFAULT NULL,
  `billId` varchar(20) DEFAULT NULL,
  `payeeName` varchar(20) DEFAULT NULL,
  `paymentType` varchar(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `totalAmountBill` double(6,2) DEFAULT NULL,
  `amountToBePaid` double(6,2) DEFAULT NULL,
  `datePayment` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  KEY `accountId` (`accountId`),
  KEY `billId` (`billId`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `users` (`accountId`) ON DELETE CASCADE,
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`billId`) REFERENCES `bill` (`billId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('PI220425044847447','AN159756','BIAN657567100000','545','gdrg','gdgdfg',5555.00,3434.00,'dfgdg'),('PI220425045517417','AN159756','BIAN657567100000','545','gdrg','gdgdfg',5555.00,3434.00,'dfgdg'),('PI220425045520420','AN159756','BIAN657567100000','545','gdrg','gdgdfg',5555.00,3434.00,'dfgdg'),('PI220425045522422','AN159756','BIAN657567100000','545','gdrg','gdgdfg',5555.00,3434.00,'dfgdg');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `accountId` varchar(20) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `nic` varchar(50) DEFAULT NULL,
  `permanantAddress` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(50) DEFAULT NULL,
  `landNumber` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `userPassword` varchar(20) DEFAULT NULL,
  `areaoffice` varchar(20) DEFAULT NULL,
  `joinDate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('AN159756',1,'Rachitha','Lakshan','159756769','sdfsdf','43242','5454354','gfdfg','cgfdg','ddfgv','5667867'),('AN434354',0,'Thisara','Yashoda','434354534534','sdfsdf','43242','5454354','gfdfg','cgfdg','ddfgv','5667867'),('AN657567',0,'Gamage','Rathana','6575676576','sdfsdf','43242','5454354','gfdfg','cgfdg','ddfgv','5667867'),('AN897567',0,'Asanka','Mahanama','897567699','sdfsdf','43242','5454354','gfdfg','cgfdg','ddfgv','5667867'),('AN997567',0,'Hetti','Kanna','997567699','sdfsdf','43242','5454354','gfdfg','cgfdg','ddfgv','5667867');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 22:41:16
