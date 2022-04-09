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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `book_title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `genre` tinyint NOT NULL,
  `form` enum('Fiction','Non-Fiction') NOT NULL,
  `class` enum('Paper','Electronic') DEFAULT NULL,
  `check_out_status` enum('In','Out') DEFAULT 'In',
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre` (`genre`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'War and Peace','Leo Tolstoy',10,'Fiction','Electronic','In','1870-03-03'),(2,'More Great Curries','Meera Sodha',12,'Non-Fiction','Electronic','Out','2018-12-13'),(3,'The Street Lawyer','John Grisham',11,'Fiction','Paper','In','2021-05-17'),(4,'Harry Potter and the Philosopher\'s Stone','JK Rowling',8,'Fiction','Paper','Out','2002-08-21'),(5,'Crime of the time','Francis Brown',11,'Fiction','Electronic','In','2018-06-27'),(6,'The fantastic new one ','JP Cooldog',11,'Fiction','Electronic','In','2022-03-27'),(7,'Romeo and Juliet','William Shakespeare',4,'Fiction','Paper','Out','1600-09-30'),(8,'The Shining','Stephen King',3,'Fiction','Electronic','In','1970-08-01'),(9,'Devices and Desires','P D James',11,'Fiction','Electronic','Out','2018-04-14');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
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
