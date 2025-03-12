CREATE DATABASE  IF NOT EXISTS `clubs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clubs`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: clubs
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget` (
  `amount` double NOT NULL,
  `year` int NOT NULL,
  `club_id` int NOT NULL,
  PRIMARY KEY (`club_id`,`year`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget`
--

LOCK TABLES `budget` WRITE;
/*!40000 ALTER TABLE `budget` DISABLE KEYS */;
INSERT INTO `budget` VALUES (5000,2024,1),(5100,2025,1),(3000,2024,2),(2110,2024,3),(1500,2024,4),(9000,2024,5),(13300,2024,6),(2880,2024,7),(1500,2024,8),(6000,2024,9),(3000,2024,10),(18000,2024,11),(2500,2024,12),(3840,2024,13);
/*!40000 ALTER TABLE `budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campus_location`
--

DROP TABLE IF EXISTS `campus_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus_location` (
  `location_id` int NOT NULL,
  `building` varchar(64) NOT NULL,
  `room_number` int NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `unique_room` (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus_location`
--

LOCK TABLES `campus_location` WRITE;
/*!40000 ALTER TABLE `campus_location` DISABLE KEYS */;
INSERT INTO `campus_location` VALUES (10,'Curry Student Center',1),(11,'Curry Student Center',10),(12,'Curry Student Center',333),(1,'Dodge Hall',101),(6,'Forsyth Building',302),(8,'International Village',402),(2,'Richards Hall',102),(4,'Ryder Hall',202),(9,'Sculpture Park',1),(3,'Shillman Hall',201),(7,'Snell Engineering',401),(5,'Snell Library',301),(13,'West Village F',20),(14,'West Village G',106),(15,'West Village G',108),(16,'West Village H',116);
/*!40000 ALTER TABLE `campus_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Cultural','Events focused on cultural exchange and celebration',0),(2,'Technology','Events related to innovation, programming, and technology',0),(3,'Design','Workshops and talks related to design, creativity, and prototyping',0),(4,'Fundraising','Events dedicated to fundraising and supporting charitable causes',0),(5,'Professional','Dedicated to careers, industry, and networking',0),(6,'Artistic','Arts, music, film, and other media',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_clubs`
--

DROP TABLE IF EXISTS `categories_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_clubs` (
  `club_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`club_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `categories_clubs_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `categories_clubs_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_clubs`
--

LOCK TABLES `categories_clubs` WRITE;
/*!40000 ALTER TABLE `categories_clubs` DISABLE KEYS */;
INSERT INTO `categories_clubs` VALUES (1,1),(6,1),(9,1),(10,1),(12,1),(2,2),(5,2),(3,3),(4,4),(9,5),(13,5),(7,6),(11,6);
/*!40000 ALTER TABLE `categories_clubs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_category_count_insert` AFTER INSERT ON `categories_clubs` FOR EACH ROW begin
	update categories
		set count = count + 1
        where category_id = new.category_id;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_category_count_delete` AFTER DELETE ON `categories_clubs` FOR EACH ROW begin
	update categories
		set count = count - 1
        where category_id = old.category_id;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `club_announcements`
--

DROP TABLE IF EXISTS `club_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club_announcements` (
  `club_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` varchar(300) NOT NULL,
  `posted_time` timestamp NOT NULL,
  PRIMARY KEY (`club_id`,`posted_time`),
  CONSTRAINT `club_announcements_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_announcements`
--

LOCK TABLES `club_announcements` WRITE;
/*!40000 ALTER TABLE `club_announcements` DISABLE KEYS */;
INSERT INTO `club_announcements` VALUES (1,'Cultural Night','A celebration of Taiwanese culture with performances and food. Don\'t miss it!','2024-11-15 23:00:00'),(1,'Taiwanese Film Screening','Watch classic Taiwanese films and enjoy some Taiwanese snacks!','2024-12-01 19:00:00'),(2,'Hackathon','We are organizing a hackathon! Register now and join us for a weekend of coding!','2024-11-10 20:30:00'),(2,'Tech Talk - Artificial Intelligence','Join us for a talk on AI and its future in the tech world.','2024-12-05 14:00:00'),(3,'Design Challenge','Participate in the annual design challenge and win amazing prizes!','2024-11-20 19:00:00'),(3,'Product Design Workshop','Learn the art of product design from professionals!','2024-12-03 16:00:00'),(4,'Annual Charity Gala','Save the date for our annual charity gala to raise funds for community service.','2024-11-16 00:00:00'),(4,'Fundraising Goal','Our goal is to raise $5000 this semester. Help us reach it!','2024-11-18 14:30:00'),(5,'Testing Meetup','Join us for a fun and informative testing tools session and meet like-minded people!','2024-11-22 22:45:00'),(5,'Software Testing Webinar','A free online webinar on modern software testing practices and tools.','2024-12-08 19:00:00'),(8,'Improv Auditions','Auditions are open for anyone interested in joining No Jokes! No experience necessary.','2024-10-12 18:00:00'),(8,'Holiday Comedy Show','Laugh your way into the holiday season with No Jokes Improv!','2024-12-10 00:00:00'),(9,'Entrepreneurship Workshop','Learn from successful Black business owners in this interactive workshop.','2024-11-18 21:00:00'),(13,'Careers in Economics Panel','Hear from female leaders in economics about their career journeys.','2024-11-29 17:00:00');
/*!40000 ALTER TABLE `club_announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clubs` (
  `club_id` int NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(300) NOT NULL,
  `contact_email` varchar(64) NOT NULL,
  PRIMARY KEY (`club_id`),
  UNIQUE KEY `contact_email` (`contact_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubs`
--

LOCK TABLES `clubs` WRITE;
/*!40000 ALTER TABLE `clubs` DISABLE KEYS */;
INSERT INTO `clubs` VALUES (1,'Taiwanese American Student Association','to promote Taiwanese culture','neu.tasa@northeastern.edu'),(2,'Generate','An engineering and SWE club','neu.generate@northeastern.edu'),(3,'Scout','Design club','neu.scout@northeastern.edu'),(4,'Sigma Kappa','Kappa Omega chapter','neu.sk@northeastern.edu'),(5,'Testing Club','A club focused on software testing and quality assurance','neu.testing@northeastern.edu'),(6,'Korean American Student Association','to promote Korean culture','neu.kasa@northeastern.edu'),(7,'Spectrum Literary Arts Magazine','Spectrum Magazine is Northeastern University\'s longest lasting literary arts magazine, established in 1957.','spectrum.magazine@gmail.com'),(8,'No Jokes','No Jokes is an improv troupe that serves as an outlet for people wanting to do comedic improv.','nojokesimprov@gmail.com'),(9,'Black Business Student Association','A group for Black business students','bbsa.northeastern@gmail.com'),(10,'Hong Kong Student Association','HKSA promotes Hong Kong culture at Northeastern.','hksa.neu@gmail.com'),(11,'Northeastern Television','NUTV is your source for campus news, sports, and entertainment programming!','nutv.neu@gmail.com'),(12,'Latin American Student Association','We are a group for Latino/a students at Northeastern!','northeasternlaso@gmail.com'),(13,'Women in Economics','We run programs and connect women Economics students!','wienortheastern@icloud.com');
/*!40000 ALTER TABLE `clubs` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `new_budget_club_insert` AFTER INSERT ON `clubs` FOR EACH ROW begin
    insert into budget
		values (0, year(curdate()), new.club_id);
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `event_date` date NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'TASA Night Market','A celebration of Taiwanese culture with performances and food.','2025-02-22'),(2,'Tech Talk','Guest speakers discuss the future of engineering and technology.','2024-12-05'),(3,'Design Workshop','Hands-on workshop on design principles and prototyping.','2025-01-12'),(4,'Fundraiser','Annual fundraiser to support club activities and community service.','2024-12-20'),(5,'Testing Club Meetup','A casual meetup to discuss testing tools and best practices.','2024-11-25'),(6,'KASA General Meeting','Weekly meeting','2024-11-18'),(7,'Spectrum Magazine Release Party','Promoting the upcoming release of our 2024 fall edition by giving our free hot cocoa!!','2024-12-03'),(8,'No Jokes Improv Show','Please join us in Afterhours for an hour long improv comedy show!','2024-11-25'),(9,'Boston Symposium on Economics','Join us for a discussion featuring guest speaker Joe Biden.','2025-01-25'),(10,'Lunar New Year Gala','Ring in the Lunar New Year with a night of performances, cultural booths, and traditional cuisine, hosted by the Taiwanese American Student Association.','2025-02-10'),(11,'Build-a-Bot Challenge','Generate invites you to design and assemble your own robot in teams. Prizes awarded to the most innovative designs!','2025-03-15'),(12,'Design Campfire','Join Scout for an informal evening of sharing design experiences and roasting marshmallows','2025-01-20'),(13,'Spring Cleaning Day','Sigma Kappa leads a campus-wide effort to collect donations and clean up shared spaces. All supplies provided.','2025-04-05'),(14,'Bug Bash Competition','Test your debugging prowess in a fast-paced challenge hosted by the Testing Club. Top scorers will win exclusive swag!','2024-12-10'),(15,'K-Drama Night','KASA is hosting a screening of a fan-favorite Korean drama.','2025-02-17'),(16,'Write & Shine','Join Spectrum for a morning of writing prompts, creativity exercises, and free coffee. Open to writers of all levels.','2025-03-08'),(17,'Improv Jam','No Jokes invites you to jump into the action with a night of audience-participation improv games. No experience needed!','2025-01-18'),(18,'Business Over Brunch','The BBSA hosts a networking brunch featuring Black entrepreneurs sharing their stories and career insights.','2025-02-25'),(19,'Hong Kong Carnival','Experience the vibrant atmosphere of a Hong Kong-style carnival with games, food stalls, and cultural performances, organized by HKSA.','2025-03-22'),(20,'NUTV Oscars','Celebrate the best of NUTV’s student-created films at a glamorous awards ceremony. Dress code: formal.','2025-04-12'),(21,'Salsa Under the Stars','Dance the night away with LASO to live Latin music under an open sky. No dance partner required!','2025-01-27'),(22,'Economics Speed Networking','Meet professionals in the field during this high-energy Women in Economics networking session.','2025-02-12'),(23,'Mooncake Night','Celebrate the Mid-Autumn Festival as we share mooncakes, stories, and cultural traditions.','2024-11-30'),(24,'Breaking the Glass Ceiling','A Women in Economics panel featuring female leaders discussing their journeys in the male-dominated finance industry.','2025-03-05'),(25,'Spectrum Story Lab','A workshop where writers can brainstorm and develop ideas in a collaborative setting. Free pizza included!','2025-01-15'),(26,'Innovate for Impact','An expo showcasing student projects focused on making a difference in underserved communities.','2025-02-28'),(27,'Mastering Selenium','Learn to automate software testing with a hands-on Selenium tutorial led by the Testing Club.','2024-12-17'),(28,'Improv & Chill','Relax and enjoy a casual evening of comedy as No Jokes performs their best sketches and games.','2024-12-01');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts_table`
--

DROP TABLE IF EXISTS `hosts_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosts_table` (
  `member_id` int NOT NULL,
  `event_id` int NOT NULL,
  `club_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`event_id`,`club_id`),
  KEY `event_id` (`event_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `hosts_table_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `student` (`member_id`),
  CONSTRAINT `hosts_table_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `hosts_table_ibfk_3` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts_table`
--

LOCK TABLES `hosts_table` WRITE;
/*!40000 ALTER TABLE `hosts_table` DISABLE KEYS */;
INSERT INTO `hosts_table` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(10,2,2),(11,2,2),(12,2,2),(15,3,3),(16,3,3),(17,3,3),(18,3,3),(19,3,3),(21,4,4),(22,4,4),(24,5,5),(25,5,5),(31,6,6),(32,6,6),(37,7,7),(38,7,7),(42,8,8),(43,8,8),(9,9,13),(5,10,1),(6,10,1),(7,10,1),(13,11,2),(14,11,2),(20,12,3),(23,13,4),(26,14,5),(27,14,5),(28,14,5),(29,14,5),(33,15,6),(34,15,6),(35,15,6),(39,16,7),(40,16,7),(44,17,8),(45,17,8),(46,17,8),(1,18,9),(49,18,9),(50,18,9),(3,19,10),(4,19,10),(6,20,11),(7,20,11),(8,21,12),(10,22,13),(5,23,10),(8,23,1),(9,23,1),(36,23,6),(11,24,13),(12,24,13),(13,24,13),(41,25,7),(2,26,9),(30,27,5),(47,28,8),(48,28,8);
/*!40000 ALTER TABLE `hosts_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_reservations`
--

DROP TABLE IF EXISTS `room_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_reservations` (
  `room_reservation_id` int NOT NULL,
  `event_id` int NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`room_reservation_id`),
  KEY `event_id` (`event_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `room_reservations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `room_reservations_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `campus_location` (`location_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_reservations`
--

LOCK TABLES `room_reservations` WRITE;
/*!40000 ALTER TABLE `room_reservations` DISABLE KEYS */;
INSERT INTO `room_reservations` VALUES (1,1,'2024-02-22 23:00:00','2024-02-23 03:00:00',1),(2,2,'2024-12-05 14:00:00','2024-12-05 17:00:00',2),(3,3,'2025-01-12 19:00:00','2025-01-12 22:00:00',3),(4,4,'2024-12-20 13:00:00','2024-12-20 23:00:00',4),(5,5,'2024-11-25 15:00:00','2024-11-25 17:00:00',5),(6,6,'2024-11-19 01:00:00','2024-11-19 03:00:00',15),(7,7,'2024-12-03 16:30:00','2024-12-03 18:30:00',9),(8,8,'2024-11-26 01:00:00','2024-11-26 03:00:00',16),(9,9,'2025-01-25 20:00:00','2025-01-25 23:00:00',8),(10,10,'2025-02-10 23:00:00','2025-02-11 03:00:00',10),(11,11,'2025-03-15 13:00:00','2025-03-15 21:30:00',7),(12,12,'2025-01-20 22:00:00','2025-01-21 01:00:00',6),(13,13,'2025-04-05 13:00:00','2025-04-05 17:00:00',4),(14,14,'2024-12-10 19:30:00','2024-12-10 21:00:00',14),(15,15,'2025-02-17 23:00:00','2025-02-18 02:30:00',15),(16,16,'2025-03-08 14:00:00','2025-03-08 17:00:00',9),(17,17,'2025-01-18 23:00:00','2025-01-19 02:00:00',16),(18,18,'2025-02-25 16:00:00','2025-02-25 19:30:00',14),(19,19,'2025-03-22 19:30:00','2025-03-22 23:30:00',1),(20,20,'2025-04-12 23:00:00','2025-04-13 02:00:00',11),(21,21,'2025-01-28 01:00:00','2025-01-28 04:00:00',12),(22,22,'2025-02-12 14:30:00','2025-02-12 16:30:00',7),(23,23,'2024-11-30 23:00:00','2024-12-01 02:00:00',15),(24,24,'2025-03-05 18:00:00','2025-03-05 20:30:00',13),(25,25,'2025-01-15 21:30:00','2025-01-15 23:30:00',9),(26,26,'2025-02-28 17:00:00','2025-02-28 22:00:00',14),(27,27,'2024-12-17 15:00:00','2024-12-17 17:00:00',5),(28,28,'2024-12-02 00:00:00','2024-12-02 02:00:00',16);
/*!40000 ALTER TABLE `room_reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_overlapping_reservations` BEFORE INSERT ON `room_reservations` FOR EACH ROW begin
    IF EXISTS (
        SELECT 1 
        FROM room_reservations 
        WHERE location_id = NEW.location_id
          AND NEW.start_time < end_time
          AND NEW.end_time > start_time
    ) then
		signal sqlstate '45000'
			set message_text = 'Error: Reservation overlaps with an existing reservation';
		end if;
    end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `member_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `grad_month` enum('January','February','March','April','May','June','July','August','September','October','November','December') DEFAULT NULL,
  `grad_year` int NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'John','Doe','john.doe@northeastern.edu','May',2025),(2,'Jane','Smith','jane.smith@northeastern.edu','December',2024),(3,'Mark','Johnson','mark.johnson@northeastern.edu','May',2024),(4,'Emily','Davis','emily.davis@northeastern.edu','August',2026),(5,'William','Miller','william.miller@northeastern.edu','May',2025),(6,'Ava','Gross','ava.gross@northeastern.edu','May',2025),(7,'Marc','Mendez','mendez.m@northeastern.edu','December',2024),(8,'Chandler','Colon','colon.c@northeastern.edu','May',2026),(9,'Sadie','Snider','snider.s@northeastern.edu','May',2027),(10,'Liam','Walker','liam.walker@northeastern.edu','May',2026),(11,'Olivia','Clark','olivia.clark@northeastern.edu','December',2025),(12,'Ethan','Martinez','ethan.martinez@northeastern.edu','August',2024),(13,'Sophia','Hernandez','sophia.hernandez@northeastern.edu','May',2027),(14,'Noah','Brown','noah.brown@northeastern.edu','May',2025),(15,'Mia','Lee','mia.lee@northeastern.edu','May',2024),(16,'Alexander','Kim','alex.kim@northeastern.edu','December',2026),(17,'Emma','Garcia','emma.garcia@northeastern.edu','May',2025),(18,'Benjamin','Rodriguez','benjamin.rod@northeastern.edu','May',2026),(19,'Isabella','Cruz','isabella.cruz@northeastern.edu','August',2025),(20,'James','Perez','james.perez@northeastern.edu','May',2027),(21,'Charlotte','Gonzalez','charlotte.gonzalez@northeastern.edu','June',2024),(22,'Henry','Rivera','henry.rivera@northeastern.edu','December',2026),(23,'Amelia','Nguyen','amelia.nguyen@northeastern.edu','May',2024),(24,'Elijah','Flores','elijah.flores@northeastern.edu','May',2025),(25,'Avery','Torres','avery.torres@northeastern.edu','May',2026),(26,'Logan','Ramirez','logan.ramirez@northeastern.edu','August',2027),(27,'Harper','Sanders','harper.sanders@northeastern.edu','May',2025),(28,'Lucas','Brooks','lucas.brooks@northeastern.edu','May',2024),(29,'Abigail','Morris','abigail.morris@northeastern.edu','December',2025),(30,'Daniel','Evans','daniel.evans@northeastern.edu','May',2026),(31,'Ella','Peterson','ella.peterson@northeastern.edu','May',2024),(32,'David','Bailey','david.bailey@northeastern.edu','August',2025),(33,'Grace','Jenkins','grace.jenkins@northeastern.edu','May',2027),(34,'Michael','Scott','michael.scott@northeastern.edu','December',2026),(35,'Lily','White','lily.white@northeastern.edu','May',2024),(36,'Matthew','Adams','matthew.adams@northeastern.edu','May',2026),(37,'Chloe','Cooper','chloe.cooper@northeastern.edu','August',2027),(38,'Joseph','Bell','joseph.bell@northeastern.edu','May',2025),(39,'Zoey','Ward','zoey.ward@northeastern.edu','May',2024),(40,'Andrew','Phillips','andrew.phillips@northeastern.edu','December',2026),(41,'Hannah','Watson','hannah.watson@northeastern.edu','May',2025),(42,'Ryan','Green','ryan.green@northeastern.edu','May',2026),(43,'Ella','Collins','ella.collins@northeastern.edu','August',2025),(44,'Samuel','Cook','samuel.cook@northeastern.edu','May',2027),(45,'Aubrey','Powell','aubrey.powell@northeastern.edu','May',2024),(46,'Carter','Parker','carter.parker@northeastern.edu','May',2026),(47,'Scarlett','Long','scarlett.long@northeastern.edu','December',2025),(48,'Owen','Reed','owen.reed@northeastern.edu','May',2024),(49,'Ariana','Hughes','ariana.hughes@northeastern.edu','August',2025),(50,'Jack','Gray','jack.gray@northeastern.edu','May',2027);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treasurer`
--

DROP TABLE IF EXISTS `treasurer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treasurer` (
  `member_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `club_id` int NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `club_id` (`club_id`),
  CONSTRAINT `treasurer_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `student` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `treasurer_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treasurer`
--

LOCK TABLES `treasurer` WRITE;
/*!40000 ALTER TABLE `treasurer` DISABLE KEYS */;
INSERT INTO `treasurer` VALUES (1,'2024-08-01','2025-08-01',1),(2,'2024-09-01','2025-09-01',2),(3,'2024-06-01','2025-06-01',3),(4,'2024-07-01','2025-07-01',4),(5,'2024-05-01','2025-05-01',5),(9,'2024-01-01','2024-12-31',6),(14,'2024-09-01','2025-08-31',7),(15,'2024-09-01','2025-08-31',8),(20,'2024-04-10','2024-12-31',9),(27,'2024-01-01','2024-12-31',10),(29,'2024-01-01','2024-12-31',11),(30,'2024-09-01','2025-08-31',12),(40,'2024-05-01','2025-04-30',13);
/*!40000 ALTER TABLE `treasurer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'clubs'
--

--
-- Dumping routines for database 'clubs'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddEventAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddEventAttendance`(
    c_member_id INT,
    c_event_id INT,
    c_club_id INT
)
BEGIN
    INSERT INTO hosts_table (member_id, event_id, club_id)
    VALUES (c_member_id, c_event_id, c_club_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateCategories`(
    cat_name VARCHAR(64),
    cat_description VARCHAR(500)
)
BEGIN
    INSERT INTO categories (name, description, count)
    VALUES (cat_name, cat_description, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateClub`(c_club_id INT, c_name VARCHAR(64), c_description VARCHAR(300),c_contact_email VARCHAR(64))
BEGIN
		INSERT INTO clubs (club_id, name, description, contact_email)
		VALUES (c_club_id, c_name, c_description, c_contact_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateClubAnnouncement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateClubAnnouncement`(
    c_club_id INT, 
    c_title VARCHAR(50), 
    c_message VARCHAR(300), 
    c_posted_time TIMESTAMP
)
BEGIN
    INSERT INTO club_announcements (club_id, title, message, posted_time)
    VALUES (c_club_id, c_title, c_message, c_posted_time);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateEvent`(
    c_event_id INT,
    c_title VARCHAR(50),
    c_description VARCHAR(300),
    c_event_date DATE
)
BEGIN
    INSERT INTO events (event_id, title, description, event_date)
    VALUES (c_event_id, c_title, c_description, c_event_date);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateRoomReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateRoomReservation`(c_room_reservation_id INT, c_event_id INT, c_start_time TIMESTAMP,
    c_end_time TIMESTAMP,
    c_location_id INT
)
BEGIN
    INSERT INTO room_reservations (room_reservation_id, event_id, start_time, end_time)
    VALUES (c_room_reservation_id, c_event_id, c_start_time, c_end_time, c_location_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateStudent`(c_member_id INT, c_first_name VARCHAR(50),c_last_name VARCHAR(50),
    c_email VARCHAR(50), c_grad_month ENUM('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
    c_grad_year INT)
BEGIN
		INSERT INTO student (member_id, first_name, last_name, email, grad_month, grad_year)
		VALUES (c_member_id, c_first_name, c_last_name, c_email, c_grad_month, c_grad_year);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteClub`(
    c_club_id INT)
BEGIN
		DELETE FROM clubs
		WHERE club_id = c_club_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEvent`(c_event_id INT)
BEGIN
    DELETE FROM events WHERE event_id = c_event_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteEventAttendance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteEventAttendance`(
    c_member_id INT,
    c_event_id INT,
    c_club_id INT
)
BEGIN
    DELETE FROM hosts_table where member_id = c_member_id and event_id = c_event_id and club_id = c_club_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteReservation`(
    c_room_reservation_id INT -- Input parameter for the reservation ID
)
BEGIN
    DELETE FROM room_reservations
    WHERE room_reservation_id = c_room_reservation_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteStudent`(c_member_id INT)
BEGIN
    DELETE FROM student WHERE member_id = c_member_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCategoryCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCategoryCount`(input_category_name VARCHAR(255))
BEGIN
    SELECT count AS category_count
    FROM categories
    WHERE name = input_category_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetClubsBudget` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetClubsBudget`(target_year INT)
BEGIN
    SELECT 
        clubs.name,
        budget.amount AS budget_amount,
        budget.year AS budget_year
    FROM clubs 
    LEFT JOIN budget ON clubs.club_id = budget.club_id
    WHERE budget.year = target_year
    ORDER BY budget.amount DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEventsByClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEventsByClub`(club_id INT)
BEGIN
    SELECT 
		clubs.name,
        events.title AS event_title,
        events.event_date,
        events.description AS event_description
    FROM events
    JOIN hosts_table ON events.event_id = hosts_table.event_id
	JOIN clubs ON hosts_table.club_id = clubs.club_id
    WHERE hosts_table.club_id = club_id
    ORDER BY events.event_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_announcements_for_club` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_announcements_for_club`(club_id int)
begin
    select name as club_name, title, message, posted_time from club_announcements
        join clubs on club_announcements.club_id = clubs.club_id
        where clubs.club_id = club_id
-- 			using(club_id)
		order by posted_time desc;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_clubs_in_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clubs_in_category`(category_name varchar(64))
begin
    select clubs.* from clubs
		join categories_clubs
			using(club_id)
		join categories
			using(category_id)
		where categories.name = category_name;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_events_by_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_events_by_date`(start_date timestamp, end_date timestamp)
begin
    if start_date is null then
		select * from events as e
			join room_reservations
				using(event_id)
			where
				e.event_date <= end_date;
    elseif end_date is null then
		select * from events as e
			join room_reservations
				using(event_id)
			where
				e.event_date >= start_date;
	else
		select * from events as e
			join room_reservations
				using(event_id)
			where
				e.event_date >= start_date and
				e.event_date <= end_date;
	end if;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_events_by_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_events_by_location`(building varchar(64), room_number int)
begin
	if room_number is null then
		select * from events
			join room_reservations
				using(event_id)
			join campus_location as loc
				using(location_id)
			where
				loc.building = building;
	else
		select * from events
			join room_reservations
				using(event_id)
			join campus_location as loc
				using(location_id)
			where
				loc.building = building and
				loc.room_number = room_number;
	end if;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_event_attendees` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_event_attendees`(event_id int)
begin
    select first_name, last_name from student
		join hosts_table
			using(member_id)
		join events
			using(event_id)
		where events.event_id = event_id;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_treasurer_budget` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_treasurer_budget`(club_id_input int)
begin
    select 
		student.first_name as treasurer_first_name, 
        student.last_name as treasurer_last_name, 
		treasurer.*,
        budget.amount, budget.year, clubs.name
        from treasurer
		join student on treasurer.member_id = student.member_id
		join clubs
			using(club_id)
		join budget
			using(club_id)
		where clubs.club_id = (
			select club_id from clubs
				where club_id = club_id_input
		);
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadBudget` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadBudget`()
BEGIN
    SELECT * FROM budget;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadCategory`()
begin
		select * from categories;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadClubAnnouncements` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadClubAnnouncements`()
BEGIN
    SELECT club_announcements.*,
	clubs.name
	FROM club_announcements
    JOIN clubs on club_announcements.club_id = clubs.club_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadClubs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadClubs`()
BEGIN
		SELECT * FROM clubs;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadEvents`()
BEGIN
    SELECT * FROM events;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadReservations` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadReservations`()
BEGIN
    SELECT rr.*, e.title, loc.building, loc.room_number
		FROM room_reservations as rr
		join events as e
			using (event_id)
		join campus_location as loc
			using (location_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReadStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadStudents`()
BEGIN
		SELECT * FROM student;
		END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_campus_location` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `read_campus_location`()
BEGIN
    SELECT * FROM campus_location;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `replace_treasurer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `replace_treasurer`(new_member_id INT, new_start_date DATE, new_end_date DATE, new_club_id INT)
begin
    DELETE FROM treasurer WHERE club_id = new_club_id;
	INSERT INTO treasurer (member_id, start_date, end_date, club_id)
    VALUES (new_member_id, new_start_date, new_end_date, new_club_id);
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_num_clubs_in_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_num_clubs_in_category`(category_name VARCHAR(64))
BEGIN 
	DECLARE my_error CONDITION FOR SQLSTATE '45000';
    DECLARE category_name_valid INT;
    DECLARE num_clubs_count INT DEFAULT 0;
    
    SELECT COUNT(categories.name) INTO category_name_valid
		FROM categories
        WHERE categories.name = category_name;
        
	IF category_name_valid = 0 THEN
		SIGNAL my_error SET MESSAGE_TEXT = 'category name not found';
    ELSE
    
		SELECT COUNT(categories.category_id) INTO num_clubs_count
			FROM categories
			JOIN categories_clubs on categories.category_id = categories_clubs.category_id
			WHERE categories.name = category_name;
			
		UPDATE categories 
			SET categories.count = num_clubs_count
			WHERE categories.name = category_name;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBudget` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBudget`(
    c_club_id INT,
    c_year INT,
    c_amount DOUBLE
)
BEGIN
    UPDATE budget
    SET amount = c_amount
    WHERE club_id = c_club_id AND year = c_year;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateClub`(
    c_club_id INT, 
    c_name VARCHAR(64), 
    c_description VARCHAR(300), 
    c_contact_email VARCHAR(64)
)
BEGIN
		UPDATE clubs
		SET 
        name = c_name, 
        description = c_description, 
        contact_email = c_contact_email
		WHERE club_id = c_club_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateEvent`(c_event_id INT, c_title VARCHAR(50), c_description VARCHAR(300), c_event_date DATE
)
BEGIN
    UPDATE events
    SET title = c_title,
        description = c_description,
        event_date = c_event_date
    WHERE event_id = c_event_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateReservation`(
    c_room_reservation_id INT, 
    c_event_id INT,
    c_start_time TIMESTAMP,
    c_end_time TIMESTAMP,
    c_location_id INT
)
BEGIN
    UPDATE room_reservations
    SET event_id = c_event_id,
        start_time = c_start_time,
        end_time = c_end_time,
        location_id = c_location_id
    WHERE room_reservation_id = c_room_reservation_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStudent`(c_member_id INT,c_first_name VARCHAR(50), c_last_name VARCHAR(50), 
	c_email VARCHAR(50),c_grad_month 
    ENUM('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'), 
    c_grad_year INT)
BEGIN
    UPDATE student
    SET first_name = c_first_name, last_name = c_last_name, email = c_email, 
        grad_month = c_grad_month, grad_year = c_grad_year
    WHERE member_id = c_member_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_all_categories_num_clubs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_all_categories_num_clubs`()
BEGIN 
	DECLARE current_category_name VARCHAR(64);
    DECLARE row_not_found TINYINT DEFAULT FALSE;
    
	DECLARE cursor_clubs CURSOR FOR SELECT categories.name FROM categories;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;
        
	OPEN cursor_clubs;
    
    WHILE row_not_found = FALSE DO
		FETCH cursor_clubs INTO current_category_name;
        CALL set_num_clubs_in_category(current_category_name);
	END WHILE;
	CLOSE cursor_clubs;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-04 16:34:01
