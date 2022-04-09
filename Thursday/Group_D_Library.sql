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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `first_line` varchar(100) NOT NULL,
  `second_line` varchar(100) DEFAULT NULL,
  `town` varchar(35) NOT NULL,
  `postcode` varchar(8) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'10 Burley Road','Burley','Leeds','LS7 3WR','01131234567','John@email.com'),(2,'Second Street','The Alley','Middlesbrough','TS5 7LR','07882300921','superfoxy@gmail.com'),(5,'244 Burley Road','Burley','Leeds','LS4 2NZ','01423330330','Mabel@internet.com'),(9,'15 Kirkstall Street','Kirkstall','Leeds','LS9 4FT','01132345678','Jane@email.com'),(10,'70 Haugh Road','Wath','Rotherham','S63 4XY','017868904','johnny@email.com');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `book_title` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `genre` tinyint NOT NULL,
  `form` enum('Fiction','Non-Fiction') NOT NULL,
  `material` enum('Paper','Electronic') DEFAULT NULL,
  `check_out_status` enum('In','Out') DEFAULT 'In',
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre` (`genre`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`genre`) REFERENCES `genre_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'War and Peace','Leo Tolstoy',10,'Fiction','Electronic','In','1870-03-03'),(2,'More Great Curries','Meera Sodha',12,'Non-Fiction','Electronic','Out','2018-12-13'),(3,'The Street Lawyer','John Grisham',11,'Fiction','Paper','In','2021-05-17'),(4,'Harry Potter and the Philosopher\'s Stone','JK Rowling',8,'Fiction','Paper','Out','2002-08-21'),(5,'Crime of the time','Francis Brown',11,'Fiction','Electronic','In','2018-06-27'),(6,'The fantastic new one ','JP Cooldog',11,'Fiction','Electronic','In','2022-03-27'),(7,'Romeo and Juliet','William Shakespeare',4,'Fiction','Paper','Out','1600-09-30'),(8,'The Shining','Stephen King',3,'Fiction','Electronic','In','1970-08-01'),(9,'Devices and Desires','P D James',11,'Fiction','Electronic','Out','2018-04-14');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_type`
--

DROP TABLE IF EXISTS `genre_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_type` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `genre` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_type`
--

LOCK TABLES `genre_type` WRITE;
/*!40000 ALTER TABLE `genre_type` DISABLE KEYS */;
INSERT INTO `genre_type` VALUES (1,'fantasy'),(2,'sci-fi'),(3,'travel'),(4,'Romance'),(5,'Biography'),(6,'Poetry'),(7,'thriller'),(8,'adventure'),(9,'horror'),(10,'Historical Fiction'),(11,'Crime'),(12,'Cookery'),(13,'travel'),(14,'self-help'),(15,'young adult');
/*!40000 ALTER TABLE `genre_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_member`
--

DROP TABLE IF EXISTS `library_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_member` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  `address` smallint NOT NULL,
  `personal_details` smallint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address` (`address`),
  KEY `personal_details` (`personal_details`),
  CONSTRAINT `library_member_ibfk_1` FOREIGN KEY (`address`) REFERENCES `address` (`id`),
  CONSTRAINT `library_member_ibfk_2` FOREIGN KEY (`personal_details`) REFERENCES `personal_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_member`
--

LOCK TABLES `library_member` WRITE;
/*!40000 ALTER TABLE `library_member` DISABLE KEYS */;
INSERT INTO `library_member` VALUES (1,'Mabel','McTable',10,2),(2,'John','Smith',9,9),(3,'Jane','Green',10,10),(4,'Vanessa','LePenguin',5,1),(5,'Jim','Smith',5,3),(6,'Holly','Buck',2,7);
/*!40000 ALTER TABLE `library_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `person_id` smallint NOT NULL,
  `book_id` smallint NOT NULL,
  `loan_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `loan_status` enum('returned','not-returned') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `library_member` (`id`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,1,2,'2022-01-02','2022-01-20','returned'),(2,2,9,'2020-06-07','2020-06-28','returned'),(3,3,4,'2022-02-13','2022-02-28','not-returned'),(4,3,6,'2022-01-05','2022-02-05','returned'),(5,1,1,'2021-11-03','2021-12-03','returned'),(6,4,5,'2022-01-20','2022-02-20','not-returned'),(7,5,5,'2019-07-08','2019-08-08','returned'),(8,4,2,'2022-03-10','2022-03-31','not-returned'),(9,6,3,'2022-03-05','2022-03-26','not-returned');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_info` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `dob` date NOT NULL,
  `user_cat` enum('staff','child','adult') NOT NULL,
  `gender` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_info`
--

LOCK TABLES `personal_info` WRITE;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
INSERT INTO `personal_info` VALUES (1,'2002-03-27','adult','Male'),(2,'2016-05-22','child','female'),(3,'2013-10-12','child','Female'),(4,'1994-01-14','adult','male'),(7,'1985-05-16','child','female'),(8,'2000-01-25','adult','male'),(9,'1983-03-20','staff','female'),(10,'2015-06-05','child','male');
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-09 11:15:35
