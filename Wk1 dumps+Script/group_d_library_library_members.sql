-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: group_d_library
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
-- Table structure for table `library_members`
--

DROP TABLE IF EXISTS `library_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_members` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `address` smallint NOT NULL,
  `personal_details` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`address`),
  KEY `personal_details` (`personal_details`),
  CONSTRAINT `library_members_ibfk_1` FOREIGN KEY (`address`) REFERENCES `address` (`id`),
  CONSTRAINT `library_members_ibfk_2` FOREIGN KEY (`personal_details`) REFERENCES `personal_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_members`
--

LOCK TABLES `library_members` WRITE;
/*!40000 ALTER TABLE `library_members` DISABLE KEYS */;
INSERT INTO `library_members` VALUES (1,'Mabel','McTable',10,2),(2,'John','Smith',9,9),(3,'Jane','Green',10,10),(4,'Vanessa','LePenguin',5,1),(7,'Mabel','McTable',10,2),(8,'John','Smith',9,9),(9,'Jane','Green',10,10),(10,'Vanessa','LePenguin',5,1),(13,'Mabel','McTable',10,2),(14,'John','Smith',9,9),(15,'Jane','Green',10,10),(16,'Vanessa','LePenguin',5,1),(19,'Jim','Smith',5,3),(20,'Holly','Buck',2,7);
/*!40000 ALTER TABLE `library_members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-28 21:39:03
