CREATE DATABASE  IF NOT EXISTS `movie_ticket_reservation` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `movie_ticket_reservation`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movie_ticket_reservation
-- ------------------------------------------------------
-- Server version	5.7.40-log

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `movie_id_idx` (`movie_id`),
  CONSTRAINT `movie_id_bk` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `idCity_UNIQUE` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `released_year` int(11) DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'99',2009,140,7.3,NULL,NULL),(2,'1920',2008,130,6.4,NULL,NULL),(3,'1921',2018,140,4.5,NULL,NULL),(4,'1971',2007,120,8.1,NULL,NULL),(5,'16-Dec',2002,120,6.9,NULL,NULL),(6,'?: A Question Mark',2012,110,5.6,NULL,NULL),(7,'102 Not Out',2018,110,7.4,NULL,NULL),(8,'1920 London',2016,130,4.1,NULL,NULL),(9,'2 States',2014,140,6.9,NULL,NULL),(10,'22 Days',2018,120,6.1,NULL,NULL),(11,'23rd March 1931: Shaheed',2002,130,5.1,NULL,NULL),(12,'3 Bachelors',2012,120,3.3,NULL,NULL),(13,'3 Deewarein',2003,110,7.8,NULL,NULL),(14,'3 Storeys',2018,130,6.9,NULL,NULL),(15,'31st October',2015,140,5.8,NULL,NULL),(16,'36 China Town',2006,140,5.7,NULL,NULL),(17,'50 Lakh',2007,130,6.5,NULL,NULL),(18,'68 Pages',2007,140,6.2,NULL,NULL),(19,'7 Hours To Go',2016,140,5.7,NULL,NULL),(20,'7 Khoon Maaf',2011,120,6.1,NULL,NULL),(21,'72 Hours: Martyr Who Never Died',2019,130,5.3,NULL,NULL),(22,'8 x 10 Tasveer',2009,110,5.4,NULL,NULL),(23,'88 Antop Hill',2003,120,4.7,NULL,NULL),(24,'A Death in the Gunj',2016,110,7.5,NULL,NULL),(25,'A Flat',2010,110,4.5,NULL,NULL),(26,'A Flying Jatt',2016,120,3,NULL,NULL),(27,'A Gentleman',2017,120,6.2,NULL,NULL),(28,'A Scandall',2016,130,3.1,NULL,NULL),(29,'Aa Gaya Hero',2017,130,2.7,NULL,NULL),(30,'Aabra Ka Daabra',2004,140,2.4,NULL,NULL),(31,'Aagey Se Right',2009,120,5,NULL,NULL),(32,'Aaghaaz',2000,110,4.2,NULL,NULL),(33,'Aaj Ka Andha Kanoon',2003,130,3.1,NULL,NULL),(34,'Aaj Ka Ravan',2000,120,4.3,NULL,NULL),(35,'Aaja Nachle',2007,110,6.2,NULL,NULL),(36,'Aakrosh',2010,120,7,NULL,NULL),(37,'Aalaap',2012,130,5.4,NULL,NULL),(38,'Aamdani Atthanni Kharcha Rupaiya',2001,120,4.8,NULL,NULL),(39,'Aamir',2008,140,7.7,NULL,NULL),(40,'Aan: Men at Work',2004,110,5.7,NULL,NULL),(41,'Aanch',2003,140,5.6,NULL,NULL),(42,'Aankhen',2002,140,7.4,NULL,NULL),(43,'Aao Wish Karein',2009,130,5.1,NULL,NULL),(44,'Aap Ki Khatir',2006,110,3.6,NULL,NULL),(45,'Aap Mujhe Achche Lagne Lage',2002,110,3.1,NULL,NULL),(46,'Aapko Pehle Bhi Kahin Dekha Hai',2003,110,4.5,NULL,NULL),(47,'Aarakshan',2011,130,6.2,NULL,NULL),(48,'Aashayein',2010,130,7.1,NULL,NULL),(49,'Aashiq',2001,130,3.8,NULL,NULL),(50,'Aashiqui 2',2013,120,7,NULL,NULL),(51,'Aashiqui.in',2011,140,3.7,NULL,NULL),(52,'Aasma: The Sky Is the Limit',2009,140,3.8,NULL,NULL),(53,'Aatma',2013,130,3.8,NULL,NULL),(54,'Aazaan',2011,110,4.4,NULL,NULL),(55,'Ab Hoga Dharna Unlimited',2012,140,4,NULL,NULL),(56,'Ab Ke Baras',2002,120,3.3,NULL,NULL),(57,'Ab Tak Chhappan 2',2015,110,5.8,NULL,NULL),(58,'Ab Tumhare Hawale Watan Saathiyo',2004,120,4.6,NULL,NULL),(59,'Ab... Bas!',2004,130,3.2,NULL,NULL),(60,'Acid Factory',2009,110,5,NULL,NULL),(61,'Action Jackson',2014,110,3.3,NULL,NULL),(62,'Action Replayy',2010,140,4.2,NULL,NULL),(63,'Ada... A Way of Life',2010,110,3.6,NULL,NULL),(64,'Adharm',2006,120,5.3,NULL,NULL),(65,'Admissions Open',2010,120,3.3,NULL,NULL),(66,'Ae Dil Hai Mushkil',2016,140,5.8,NULL,NULL),(67,'Aetbaar',2004,140,4.6,NULL,NULL),(68,'Agent Vinod',2012,110,5.2,NULL,NULL),(69,'Agneepath',2012,120,6.9,NULL,NULL),(70,'Agyaat',2009,120,2.9,NULL,NULL),(71,'Ahista Ahista',2006,130,7,NULL,NULL),(72,'Airlift',2016,110,8,NULL,NULL),(73,'Aisa Kyon Hota Hai?',2006,140,3.9,NULL,NULL),(74,'Aisa Yeh Jahaan',2015,120,6.6,NULL,NULL),(75,'Aisaa Kyon',2003,120,3.7,NULL,NULL),(76,'Aisha',2010,130,5,NULL,NULL),(77,'Aitraaz',2004,110,6.6,NULL,NULL),(78,'Aiyaary',2018,140,5.3,NULL,NULL),(79,'Aiyyaa',2012,130,4.4,NULL,NULL),(80,'Ajab Gazabb Love',2012,140,4.2,NULL,NULL),(81,'Ajab Prem Ki Ghazab Kahani',2009,130,6.4,NULL,NULL),(82,'Ajab Singh Ki Gajab Kahani',2017,140,5.8,NULL,NULL),(83,'Ajji',2017,110,6.9,NULL,NULL),(84,'Ajnabee',2001,140,6.4,NULL,NULL),(85,'Akaash Vani',2013,140,6.3,NULL,NULL),(86,'Akhiyon Se Goli Maare',2002,130,5.1,NULL,NULL),(87,'Aks',2001,110,5.8,NULL,NULL),(88,'Aksar',2006,110,4.8,NULL,NULL),(89,'Aladin',2009,140,4.6,NULL,NULL),(90,'Albela',2001,120,3.7,NULL,NULL),(91,'Albert Pinto Ko Gussa Kyun Aata Hai?',2019,140,5.5,NULL,NULL),(92,'All Is Well',2015,130,3.8,NULL,NULL),(93,'All the Best: Fun Begins',2009,110,6.2,NULL,NULL),(94,'Allah Ke Banday',2010,140,6.1,NULL,NULL),(95,'Alone',2015,140,3.7,NULL,NULL),(96,'Always Kabhi Kabhi',2011,120,4,NULL,NULL),(97,'Amavas',2019,110,2.8,NULL,NULL),(98,'Amdavad Junction',2013,110,4.4,NULL,NULL),(99,'Amit Sahni Ki List',2014,120,5.4,NULL,NULL),(100,'Andaaz',2003,130,5.3,NULL,NULL),(101,'Andhadhun',2018,110,8.2,NULL,NULL),(102,'Angel',2011,130,6.3,NULL,NULL),(103,'Angry Indian Goddesses',2015,110,7,NULL,NULL),(104,'Angry Young Man',2014,130,5.2,NULL,NULL),(105,'Anjaam',2007,120,6.1,NULL,NULL),(106,'Anjaan',2005,120,2.5,NULL,NULL),(107,'Anjaana Anjaani',2010,110,5.8,NULL,NULL),(108,'Anjaane',2000,130,4.1,NULL,NULL),(109,'Ankahee',2006,120,4.1,NULL,NULL),(110,'Ankhon Dekhi',2013,120,8,NULL,NULL),(111,'Ankur Arora Murder Case',2013,130,6.5,NULL,NULL),(112,'Anna',2016,120,4.9,NULL,NULL),(113,'Annarth',2002,140,3.1,NULL,NULL),(114,'Anokha Moti',2000,140,6.9,NULL,NULL),(115,'Ansh: The Deadly Part',2002,110,6.3,NULL,NULL),(116,'Antardwand',2008,110,7.3,NULL,NULL),(117,'Anthony Kaun Hai?',2006,130,5.2,NULL,NULL),(119,'Anwar',2007,130,6.6,NULL,NULL),(120,'Apaharan',2005,130,7.4,NULL,NULL),(121,'Apna Asmaan',2007,140,6.2,NULL,NULL),(122,'Apna Sapna Money Money',2006,140,5.3,NULL,NULL),(123,'Apne',2007,110,6,NULL,NULL),(124,'Apradhi Kaun',2000,110,4.8,NULL,NULL),(125,'Arjun Patiala',2019,120,4.3,NULL,NULL),(126,'Arjun: The Warrior Prince',2012,110,6.8,NULL,NULL),(127,'Armaan',2003,140,5.2,NULL,NULL),(128,'Article 15',2019,130,8.2,NULL,NULL),(129,'Aryan: Unbreakable',2006,110,4.4,NULL,NULL),(130,'Asambhav',2004,120,3.4,NULL,NULL),(131,'Astitva',2000,120,7.3,NULL,NULL),(132,'Atithi Tum Kab Jaoge?',2010,120,6.4,NULL,NULL),(133,'Aurangzeb',2013,140,6.5,NULL,NULL),(134,'Awara Paagal Deewana',2002,120,6.2,NULL,NULL),(135,'Awarapan',2007,120,7.3,NULL,NULL),(136,'Azhar',2016,130,5.7,NULL,NULL),(137,'B.A. Pass',2012,120,6.4,NULL,NULL),(138,'Baa Baaa Black Sheep',2018,120,6.4,NULL,NULL),(139,'Baabarr',2009,120,5.1,NULL,NULL),(140,'Baabul',2006,120,5.4,NULL,NULL),(141,'Baaghi',2016,140,5.2,NULL,NULL),(142,'Baaghi 2',2018,130,4.8,NULL,NULL),(143,'Baaja',2001,130,6.1,NULL,NULL),(144,'Baap Ka Baap',2003,110,5,NULL,NULL),(145,'Baar Baar Dekho',2016,110,5.3,NULL,NULL),(146,'Baat Bann Gayi',2013,110,5.1,NULL,NULL),(147,'Baaz: A Bird in Danger',2003,120,3.2,NULL,NULL),(148,'Baazaar',2018,140,6.6,NULL,NULL),(149,'Babloo Happy Hai',2014,110,6.7,NULL,NULL),(151,'Babumoshai Bandookbaaz',2017,130,6.9,NULL,NULL),(152,'Baby',2015,120,8,NULL,NULL),(153,'Bachke Rehna Re Baba',2005,140,2.7,NULL,NULL),(154,'Bachna Ae Haseeno',2008,120,6.1,NULL,NULL),(155,'Badal',2000,130,4.9,NULL,NULL),(156,'Badhaai Ho',2018,110,8,NULL,NULL),(157,'Badhaai Ho Badhaai',2002,130,4.5,NULL,NULL),(158,'Badla',2019,140,7.8,NULL,NULL),(159,'Badlapur',2015,130,7.4,NULL,NULL),(160,'Badlapur Boys',2014,120,4.7,NULL,NULL),(161,'Badmashiyaan',2015,140,4.6,NULL,NULL),(162,'Badrinath Ki Dulhania',2017,140,6.1,NULL,NULL),(163,'Baghban',2003,130,7.4,NULL,NULL),(164,'Bajatey Raho',2013,120,5.3,NULL,NULL),(165,'Bajirao Mastani',2015,110,7.2,NULL,NULL),(167,'Bajrangi Bhaijaan',2015,120,8,NULL,NULL),(168,'Bala',2019,110,7.3,NULL,NULL),(169,'Balwinder Singh Famous Ho Gaya',2014,130,3.6,NULL,NULL),(170,'Banaras',2009,130,3.2,NULL,NULL),(171,'Band Baaja Baaraat',2010,130,7.2,NULL,NULL),(172,'Bandook',2013,130,5.9,NULL,NULL),(173,'Bangistan',2015,130,4.5,NULL,NULL),(174,'Banjo',2016,120,4.9,NULL,NULL),(175,'Bank Chor',2017,110,5.9,NULL,NULL),(176,'Bardaasht',2004,130,5.9,NULL,NULL),(177,'Barfi!',2012,130,8.1,NULL,NULL),(178,'Barkhaa',2015,140,5.1,NULL,NULL),(179,'Bas Ek Pal',2006,130,5.9,NULL,NULL),(180,'Bas Yaari Rakho',2000,140,6.5,NULL,NULL),(181,'Bas Yun Hi',2003,140,5.6,NULL,NULL),(182,'Basti',2003,110,7,NULL,NULL),(183,'Batla House',2019,120,7.2,NULL,NULL),(184,'Battalion 609',2019,130,2.8,NULL,NULL),(185,'Batti Gul Meter Chalu',2018,130,6,NULL,NULL),(186,'Bawandar',2000,110,7,NULL,NULL),(187,'Be-Lagaam',2002,140,2.9,NULL,NULL),(188,'Befikre',2016,130,3.9,NULL,NULL),(189,'Begum Jaan',2017,120,5.6,NULL,NULL),(190,'Behen Hogi Teri',2017,130,5.6,NULL,NULL),(191,'Beiimaan Love',2016,140,2.8,NULL,NULL),(192,'Bengal Tiger',2001,140,5.3,NULL,NULL),(193,'Bewafaa',2005,110,4.4,NULL,NULL),(194,'Bewakoofiyaan',2014,140,5.5,NULL,NULL),(195,'Beyond the Clouds',2017,140,7,NULL,NULL),(196,'Bezubaan Ishq',2015,110,4,NULL,NULL),(197,'Bhaag Johnny',2015,120,5.2,NULL,NULL),(198,'Bhaag Milkha Bhaag',2013,140,8.2,NULL,NULL),(199,'Bhagam Bhag',2006,140,6.5,NULL,NULL),(200,'Bhagmati',2005,120,6.1,NULL,NULL),(201,'Bhai Thakur',2000,120,3.2,NULL,NULL),(202,'Bhairav',2001,110,4.6,NULL,NULL),(203,'Bhanwarey',2017,110,6.8,NULL,NULL),(204,'Bharat',2019,140,4.9,NULL,NULL),(205,'Bhavesh Joshi Superhero',2018,140,7.6,NULL,NULL),(206,'Bheja Fry',2007,130,7.6,NULL,NULL),(207,'Bheja Fry 2',2011,140,4.7,NULL,NULL),(208,'Bhola in Bollywood',2004,140,6.3,NULL,NULL),(209,'Bhool Bhulaiyaa',2007,140,7.3,NULL,NULL),(210,'Bhoomi',2017,120,5.3,NULL,NULL),(211,'Bhoot',2003,120,6.5,NULL,NULL),(212,'Bhoot Returns',2012,140,2.5,NULL,NULL),(213,'Bhoothnath Returns',2014,110,6.6,NULL,NULL),(215,'Bhopal: A Prayer for Rain',2014,120,7.2,NULL,NULL),(216,'Bichhoo',2000,130,5,NULL,NULL),(217,'Big Brother',2007,110,3.8,NULL,NULL),(218,'Billa No. 786',2000,140,4.4,NULL,NULL),(219,'Billu',2009,140,6.2,NULL,NULL),(220,'Billu Ustaad',2018,120,6.9,NULL,NULL),(221,'Bin Bulaye Baraati',2011,110,3.8,NULL,NULL),(222,'Bioscopewala',2017,130,7.6,NULL,NULL),(223,'Bird Idol',2010,140,4.3,NULL,NULL),(224,'Bittoo Boss',2012,110,4.1,NULL,NULL),(225,'Black',2005,130,8.2,NULL,NULL),(227,'Black Friday',2004,110,8.5,NULL,NULL),(228,'Blackmail',2018,130,7.1,NULL,NULL),(229,'Blank',2019,110,6.2,NULL,NULL),(230,'Blood Money',2012,120,5,NULL,NULL),(231,'Bloody Isshq',2013,110,7.2,NULL,NULL),(232,'Blue',2009,110,3.7,NULL,NULL),(233,'Blue Oranges',2009,120,6.5,NULL,NULL),(234,'Bobby Jasoos',2014,130,5.5,NULL,NULL),(235,'Bodyguard',2011,120,4.7,NULL,NULL),(236,'Bol Bachchan',2012,130,5.5,NULL,NULL),(237,'Bollywood Diaries',2016,110,6,NULL,NULL),(238,'Bombairiya',2019,120,4.5,NULL,NULL),(239,'Bombay Talkies',2013,120,6.7,NULL,NULL),(240,'Bombay to Bangkok',2008,130,4.6,NULL,NULL),(241,'Bombay Velvet',2015,140,5.6,NULL,NULL),(242,'Boom',2003,130,2.3,NULL,NULL),(243,'Boss',2013,130,5.1,NULL,NULL),(244,'Boyss Toh Boyss Hain',2013,140,5.5,NULL,NULL),(245,'Break Ke Baad',2010,110,5.2,NULL,NULL),(246,'Brothers',2015,110,6.5,NULL,NULL),(247,'Bubble Gum',2011,130,7.3,NULL,NULL),(248,'Buddha in a Traffic Jam',2016,120,6.7,NULL,NULL),(249,'Buddha Mar Gaya',2007,120,2.6,NULL,NULL),(250,'Bulandi',2000,110,5.4,NULL,NULL),(251,'Bullet: Ek Dhamaka',2005,140,3.6,NULL,NULL),(252,'Bullett Raja',2013,110,5,NULL,NULL),(254,'Bumm Bumm Bole',2010,120,6.1,NULL,NULL),(255,'Bumper Draw',2015,120,4.8,NULL,NULL),(256,'Bunty Aur Babli',2005,110,6.2,NULL,NULL),(257,'Bypass Road',2019,130,5.4,NULL,NULL),(258,'C Kkompany',2008,140,5.4,NULL,NULL),(259,'Calapor',2013,120,4.5,NULL,NULL),(260,'Calcutta Mail',2003,140,5.7,NULL,NULL),(261,'Calendar Girls',2015,130,4.2,NULL,NULL),(262,'Cash',2007,130,3.4,NULL,NULL),(263,'Censor',2001,120,3.5,NULL,NULL),(264,'Chaar Din Ki Chandni',2012,140,4.1,NULL,NULL),(265,'Chaarfutiya Chhokare',2014,140,5.9,NULL,NULL),(266,'Chak De! India',2007,140,8.2,NULL,NULL),(268,'Chakravyuh',2012,110,6.8,NULL,NULL),(269,'Chal Chala Chal',2009,130,4.6,NULL,NULL),(270,'Chal Chalein',2009,140,6.3,NULL,NULL),(271,'Chal Mere Bhai',2000,120,4.7,NULL,NULL),(272,'Chal Pichchur Banate Hain',2012,120,6.1,NULL,NULL),(273,'Chalk n Duster',2016,140,6.5,NULL,NULL),(274,'Challo Driver',2012,130,5.9,NULL,NULL),(275,'Chalo Dilli',2011,140,6.8,NULL,NULL),(276,'Chalo Ishq Ladaaye',2002,110,4.4,NULL,NULL),(277,'Chalte Chalte',2003,110,6.6,NULL,NULL),(279,'Chamku',2008,110,4,NULL,NULL),(280,'Champion',2000,130,4.3,NULL,NULL),(281,'Chance Pe Dance',2010,130,4.7,NULL,NULL),(282,'Chanchal',2008,120,4,NULL,NULL),(283,'Chand Bujh Gaya',2005,120,6.8,NULL,NULL),(284,'Chand Ke Paar Chalo',2006,110,6.7,NULL,NULL),(285,'Chand Sa Roshan Chehra',2005,130,4.7,NULL,NULL),(286,'Chandni Bar',2001,130,7.6,NULL,NULL),(287,'Chargesheet',2011,110,6.3,NULL,NULL),(288,'Charlie Kay Chakkar Mein',2015,140,4.5,NULL,NULL),(289,'Chase',2010,140,4.9,NULL,NULL),(290,'Chashme Baddoor',2013,130,5.4,NULL,NULL),(291,'Chatur Singh Two Star',2011,120,1.7,NULL,NULL),(292,'Chauhar',2017,110,6.8,NULL,NULL),(293,'Chausar',2018,110,6.4,NULL,NULL),(294,'Cheeni Kum',2007,110,6.8,NULL,NULL),(295,'Chef',2017,120,5.7,NULL,NULL),(296,'Chehraa',2005,140,3.8,NULL,NULL),(297,'Chennai Express',2013,140,6,NULL,NULL),(298,'Chetna: The Excitement',2005,110,3.1,NULL,NULL),(299,'Chhichhore',2019,140,8.3,NULL,NULL),(300,'Chhodo Kal Ki Baatein',2012,140,6.9,NULL,NULL),(301,'Chhodon Naa Yaar',2007,120,4.6,NULL,NULL),(302,'Chhota Bheem And The Curse Of Damyaan',2012,110,5.7,NULL,NULL),(303,'Chhota Bheem and the Throne of Bali',2013,110,6.2,NULL,NULL),(304,'Chhupa Rustam: A Musical Thriller',2001,140,4.6,NULL,NULL),(305,'Chicken Curry Law',2019,110,5.3,NULL,NULL),(306,'Children of War',2014,110,6.7,NULL,NULL),(307,'Chinar Daastaan-E-Ishq',2015,110,6.8,NULL,NULL),(308,'Chingaari',2006,120,4.6,NULL,NULL),(309,'Chintu Ji',2009,110,6,NULL,NULL),(310,'Chittagong',2012,120,7.3,NULL,NULL),(311,'Chor Chor Super Chor',2013,120,6.5,NULL,NULL),(312,'Chor Machaaye Shor',2002,120,4.2,NULL,NULL),(313,'Chori Chori',2003,120,4.8,NULL,NULL),(314,'Chori Chori Chupke Chupke',2001,110,5.4,NULL,NULL),(315,'Chup Chup Ke',2006,130,6.8,NULL,NULL),(316,'Chupke Se',2003,130,5.4,NULL,NULL),(317,'Chura Liyaa Hai Tumne',2003,140,3.7,NULL,NULL),(318,'Click',2010,110,3.5,NULL,NULL),(319,'Cocktail',2012,130,6.3,NULL,NULL),(321,'Coffee Bloom',2015,120,5.9,NULL,NULL),(322,'Coffee House',2009,120,6.4,NULL,NULL),(323,'Commando 2',2017,130,5.3,NULL,NULL),(324,'Company',2002,130,7.9,NULL,NULL),(325,'Contract',2008,130,4,NULL,NULL),(326,'Corporate',2006,140,6.5,NULL,NULL),(327,'Court',2014,120,7.7,NULL,NULL),(328,'Crazy Cukkad Family',2015,130,5.1,NULL,NULL),(329,'Creature',2014,130,3.1,NULL,NULL),(330,'D',2005,120,6.8,NULL,NULL),(331,'Daas Dev',2018,120,5.1,NULL,NULL),(332,'Daawat-e-Ishq',2014,140,6.1,NULL,NULL),(333,'Dabangg',2010,120,6.2,NULL,NULL),(334,'Dabangg 2',2012,140,4.8,NULL,NULL),(335,'Dabangg 3',2019,120,3,NULL,NULL),(337,'Daddy',2017,140,6.4,NULL,NULL),(339,'Damadamm!',2011,130,4,NULL,NULL),(340,'Danav',2003,120,4.7,NULL,NULL),(341,'Dangal',2016,110,8.4,NULL,NULL),(342,'Dangerous Ishq',2012,110,3.9,NULL,NULL),(343,'Dansh',2018,130,8.3,NULL,NULL),(344,'Darling',2007,140,3.8,NULL,NULL),(345,'Darna Mana Hai',2003,130,6.3,NULL,NULL),(346,'Darna Zaroori Hai',2006,110,5.4,NULL,NULL),(347,'Darr @ the Mall',2014,110,4.9,NULL,NULL),(348,'Dassehra',2018,140,3.8,NULL,NULL),(349,'Dasvidaniya',2008,140,7.8,NULL,NULL),(350,'Dattak',2001,120,7.4,NULL,NULL),(351,'David',2013,130,6.2,NULL,NULL),(352,'Days of Tafree',2016,120,7.3,NULL,NULL),(353,'De Dana Dan',2009,130,5.5,NULL,NULL),(354,'De De Pyaar De',2019,130,6.6,NULL,NULL),(355,'De Taali',2008,110,4.1,NULL,NULL),(356,'Deadline: Sirf 24 Ghante',2006,120,6.3,NULL,NULL),(357,'Dear Dad',2016,130,6.3,NULL,NULL),(358,'Dear Maya',2017,110,5.8,NULL,NULL),(359,'Dedh Ishqiya',2014,120,7.1,NULL,NULL),(361,'Deewaanapan',2001,130,4.6,NULL,NULL),(362,'Deewane',2000,110,4.7,NULL,NULL),(363,'Deewane Huye Paagal',2005,130,5.3,NULL,NULL),(364,'Deewangee',2002,140,6.6,NULL,NULL),(365,'Dehraadun Diary',2013,140,5.6,NULL,NULL),(366,'Dekh Tamasha Dekh',2014,140,6.1,NULL,NULL),(367,'Delhi Belly',2011,140,7.6,NULL,NULL),(368,'Delhi Safari',2012,120,5.6,NULL,NULL),(369,'Delhi-6',2009,140,6.1,NULL,NULL),(370,'Delhii Heights',2007,110,4.2,NULL,NULL),(371,'Department',2012,130,3.1,NULL,NULL),(373,'Desi Boyz',2011,110,5.7,NULL,NULL),(374,'Desi Kattey',2014,110,4,NULL,NULL),(375,'Dev',2004,120,6.9,NULL,NULL),(376,'Dev.D',2009,110,8,NULL,NULL),(377,'Devaki',2005,140,4.2,NULL,NULL),(378,'Devdas',2002,120,7.6,NULL,NULL),(379,'Dhadak',2018,110,4.5,NULL,NULL),(380,'Dhadkan',2000,120,6.5,NULL,NULL),(381,'Dhamaal',2007,120,7.3,NULL,NULL),(382,'Dhara 302',2016,140,4.4,NULL,NULL),(383,'Dharam Sankat Mein',2015,140,6.3,NULL,NULL),(384,'Dhobi Ghat',2010,130,7,NULL,NULL),(385,'Dhokha',2007,130,6.2,NULL,NULL),(386,'Dhol',2007,140,6.3,NULL,NULL),(387,'Dhoom',2004,130,6.7,NULL,NULL),(388,'Dhoom 2',2006,130,6.5,NULL,NULL),(389,'Dhoom 3',2013,110,5.4,NULL,NULL),(390,'Dhoop',2003,140,7.2,NULL,NULL),(391,'Dil Bechara',2020,140,6.6,NULL,NULL),(392,'Dil Bechara Pyaar Ka Maara',2004,140,5.4,NULL,NULL),(393,'Dil Bole Hadippa!',2009,120,4.6,NULL,NULL),(394,'Dil Chahta Hai',2001,140,8.1,NULL,NULL),(395,'Dil Dhadakne Do',2015,110,6.9,NULL,NULL),(396,'Dil Diya Hai',2006,140,3.5,NULL,NULL),(397,'Dil Dosti Etc',2007,110,7,NULL,NULL),(398,'Dil Hai Tumhaara',2002,130,5.3,NULL,NULL),(399,'Dil Jo Bhi Kahey...',2005,110,4.6,NULL,NULL),(400,'Dil Jo Na Keh Saka',2017,120,5.3,NULL,NULL),(401,'Dil Juunglee',2018,120,3.7,NULL,NULL),(402,'Dil Ka Rishta',2003,110,4.8,NULL,NULL),(403,'Dil Kabaddi',2008,120,5.7,NULL,NULL),(404,'Dil Ne Phir Yaad Kiya',2001,110,3.3,NULL,NULL),(405,'Dil Pardesi Ho Gayaa',2003,120,4.8,NULL,NULL),(406,'Dil Toh Baccha Hai Ji',2011,120,5.8,NULL,NULL),(407,'Dil Toh Deewana Hai',2016,110,6.5,NULL,NULL),(408,'Dil Vil Pyar Vyar',2002,140,5.3,NULL,NULL),(410,'Dilwale',2015,120,5.1,NULL,NULL),(411,'Direct Ishq',2016,120,4,NULL,NULL),(412,'Dirty Politics',2015,130,2.5,NULL,NULL),(413,'Dishkiyaoon',2014,120,5.2,NULL,NULL),(414,'Dishoom',2016,130,5.1,NULL,NULL),(417,'Do Dilon Ke Khel Mein',2010,110,5.5,NULL,NULL),(418,'Do Dooni Chaar',2010,120,7.5,NULL,NULL),(419,'Do Knot Disturb',2009,130,3.6,NULL,NULL),(420,'Do Lafzon Ki Kahani',2016,140,6.5,NULL,NULL),(421,'Dobaara: See Your Evil',2017,130,3.7,NULL,NULL),(422,'Dobara',2004,110,3.2,NULL,NULL),(423,'Dolly Ki Doli',2015,140,4.5,NULL,NULL),(424,'Don',2006,110,7.2,NULL,NULL),(425,'Don 2',2011,130,7.1,NULL,NULL),(426,'Don Muthu Swami',2008,130,4.7,NULL,NULL),(427,'Dor',2006,120,7.9,NULL,NULL),(428,'Dosti: Friends Forever',2005,120,5.5,NULL,NULL),(429,'Double Dhamaal',2011,140,3.8,NULL,NULL),(430,'Dream Girl',2019,140,7,NULL,NULL),(431,'Drishyam',2015,110,8.2,NULL,NULL),(432,'Dulha Mil Gaya',2010,130,4.2,NULL,NULL),(433,'Dulhan Hum Le Jayenge',2000,130,5.1,NULL,NULL),(434,'Dum',2003,130,5.6,NULL,NULL),(435,'Dum Laga Ke Haisha',2016,110,7.3,NULL,NULL),(436,'Dum Maaro Dum',2011,110,6.2,NULL,NULL),(437,'Dus Kahaniyaan',2007,120,5.7,NULL,NULL),(438,'Ebn-E-Batuta',2014,130,4.3,NULL,NULL),(439,'Ehsaas: The Feeling',2001,120,5.6,NULL,NULL),(440,'Ek Ajnabee',2005,130,5.2,NULL,NULL),(441,'Ek Alag Mausam',2003,140,6.7,NULL,NULL),(442,'Ek Chalis Ki Last Local',2007,130,7.3,NULL,NULL),(443,'Ek Chhotisi Love Story',2002,120,2.9,NULL,NULL),(444,'Ek Din 24 Ghante',2003,110,3.9,NULL,NULL),(445,'Ek Haseena Thi Ek Deewana Tha',2017,140,2.5,NULL,NULL),(446,'Ek Hasina Thi',2004,120,7.5,NULL,NULL),(448,'Ek Khiladi Ek Haseena',2005,140,5.7,NULL,NULL),(449,'Ek Ladki Ko Dekha Toh Aisa Laga',2019,110,5.5,NULL,NULL),(450,'Ek Main Aur Ekk Tu',2012,140,5.7,NULL,NULL),(452,'Ek Paheli Leela',2015,120,3.7,NULL,NULL),(453,'Ek Se Badhkar Ek',2004,130,4.4,NULL,NULL),(454,'Ek Se Bure Do',2009,140,4.3,NULL,NULL),(455,'Ek Tha Tiger',2012,110,5.5,NULL,NULL),(456,'Ek Thi Daayan',2013,130,5.7,NULL,NULL),(457,'Ek Vivaah... Aisa Bhi',2008,140,5.2,NULL,NULL),(458,'Ekk Deewana Tha',2012,120,5.9,NULL,NULL),(459,'Ekkees Toppon Ki Salaami',2014,140,6,NULL,NULL),(460,'Eklavya: The Royal Guard',2007,140,6.1,NULL,NULL),(461,'Ekta',2019,120,8,NULL,NULL),(462,'Elaan',2005,120,4.4,NULL,NULL),(463,'Encounter: The Killing',2002,130,6.1,NULL,NULL),(464,'Enemmy',2013,140,4.9,NULL,NULL),(465,'English Vinglish',2012,130,7.8,NULL,NULL),(466,'Escape from Taliban',2003,120,4.3,NULL,NULL),(467,'F.A.L.T.U',2011,120,4.6,NULL,NULL),(468,'Family of Thakurganj',2019,130,8.4,NULL,NULL),(469,'Fan',2016,130,7,NULL,NULL),(470,'Fanaa',2006,130,7.2,NULL,NULL),(471,'Fareb',2005,130,4.1,NULL,NULL),(472,'Farz',2001,130,4.3,NULL,NULL),(473,'Fashion',2008,110,6.9,NULL,NULL),(474,'Fatso!',2012,140,5.7,NULL,NULL),(475,'Ferrari Ki Sawaari',2012,110,6.4,NULL,NULL),(476,'Fever',2016,140,4.7,NULL,NULL),(477,'Fida',2004,140,5.5,NULL,NULL),(478,'Film Star',2005,140,5.1,NULL,NULL),(479,'Filmistaan',2012,120,7.3,NULL,NULL),(480,'Final Solution',2004,110,8.5,NULL,NULL),(481,'Finding Fanny',2014,110,5.7,NULL,NULL),(482,'Firangi',2017,110,4.4,NULL,NULL),(483,'Fireflies',2013,110,6.2,NULL,NULL),(484,'Fitoor',2016,110,5.4,NULL,NULL),(485,'Fiza',2000,140,6.1,NULL,NULL),(486,'Flat 211',2017,120,5.1,NULL,NULL),(487,'Footpath',2003,130,5.3,NULL,NULL),(488,'Force',2011,130,6.5,NULL,NULL),(489,'Force 2',2016,120,6.2,NULL,NULL),(490,'Four Pillars of Basement',2015,130,4.6,NULL,NULL),(491,'Fox',2009,110,5.2,NULL,NULL),(492,'Fraud Saiyaan',2019,140,4.3,NULL,NULL),(493,'Freaky Ali',2016,130,4.9,NULL,NULL),(494,'Fredrick',2016,140,4.9,NULL,NULL),(495,'From Sydney with Love',2012,130,6.2,NULL,NULL),(496,'FryDay',2018,130,5.2,NULL,NULL),(497,'Fuddu',2016,110,5.4,NULL,NULL),(498,'Fugly',2014,120,4.7,NULL,NULL),(499,'Fukrey',2013,120,6.9,NULL,NULL),(500,'Fukrey Returns',2017,130,6.5,NULL,NULL),(501,'Future To Bright Hai Ji',2012,140,6.2,NULL,NULL),(502,'G Kutta Se',2017,140,8.3,NULL,NULL),(503,'Gabbar is Back',2015,140,7.1,NULL,NULL),(504,'Gadar: Ek Prem Katha',2001,140,7.2,NULL,NULL),(505,'Gaja Gamini',2000,110,5,NULL,NULL),(506,'Gali Gali Chor Hai',2012,110,5.1,NULL,NULL),(507,'Game',2011,140,5.2,NULL,NULL),(508,'Game Over',2017,110,7.1,NULL,NULL),(509,'Gandhi to Hitler',2011,110,2.5,NULL,NULL),(510,'Gandhi, My Father',2007,110,7.3,NULL,NULL),(511,'Gang',2000,120,6.1,NULL,NULL),(512,'Gang of Ghosts',2014,130,3.6,NULL,NULL),(513,'Gangaajal',2003,140,7.8,NULL,NULL),(514,'Gangoobai',2013,130,7.3,NULL,NULL),(515,'Gangotri',2007,120,5.8,NULL,NULL),(516,'Gangs of Wasseypur',2012,120,8.2,NULL,NULL),(517,'Gangster',2006,140,7.1,NULL,NULL),(518,'Garam Masala',2005,110,6.7,NULL,NULL),(519,'Gattu',2011,120,7.3,NULL,NULL),(520,'Gauri: The Unborn',2007,130,3.5,NULL,NULL),(521,'Gayab',2004,120,4.2,NULL,NULL),(522,'Genius',2018,140,5.3,NULL,NULL),(523,'Ghaath',2000,130,4.7,NULL,NULL),(524,'Ghaav: The Wound',2002,140,5.4,NULL,NULL),(525,'Ghajini',2008,120,7.3,NULL,NULL),(526,'Ghanchakkar',2013,140,5.8,NULL,NULL),(527,'Ghatothkach',2008,130,6.9,NULL,NULL),(528,'Ghayal Once Again',2016,120,6.3,NULL,NULL),(529,'Ghost',2019,110,5,NULL,NULL),(530,'Gippi',2013,110,5.6,NULL,NULL),(531,'Girlfriend',2004,130,3.2,NULL,NULL),(532,'Global Baba',2016,130,5.6,NULL,NULL),(533,'Go',2007,140,2.7,NULL,NULL),(534,'Go Goa Gone',2013,120,6.7,NULL,NULL),(535,'God Tussi Great Ho',2008,140,3.6,NULL,NULL),(536,'Gold',2018,110,7.3,NULL,NULL),(537,'Golmaal 3',2010,140,5.5,NULL,NULL),(538,'Golmaal Again',2017,120,5,NULL,NULL),(539,'Golmaal Returns',2008,110,5.1,NULL,NULL),(540,'Golmaal: Fun Unlimited',2006,110,7.4,NULL,NULL),(541,'Good Boy, Bad Boy',2007,110,3.8,NULL,NULL),(542,'Good Luck!',2008,120,3,NULL,NULL),(543,'Grahan',2001,110,5.1,NULL,NULL),(544,'Grand Masti',2013,130,4.4,NULL,NULL),(545,'Great Grand Masti',2016,140,3.6,NULL,NULL),(546,'Guddu Rangeela',2015,110,5.3,NULL,NULL),(547,'Guest Iin London',2017,130,5.4,NULL,NULL),(548,'Gulaab Gang',2014,140,6.1,NULL,NULL),(549,'Gulabi Gang',2012,130,7.5,NULL,NULL),(550,'Gully Boy',2019,120,8,NULL,NULL),(551,'Gunaah',2002,110,3.3,NULL,NULL),(552,'Gunday',2014,110,2.4,NULL,NULL),(553,'Gurgaon',2016,110,6.5,NULL,NULL),(555,'Guzaarish',2010,120,7.5,NULL,NULL),(556,'Haal-e-Dil',2008,130,3.4,NULL,NULL),(557,'Haan Maine Bhi Pyaar Kiya',2002,120,3.7,NULL,NULL),(558,'Haasil',2003,110,7.6,NULL,NULL),(559,'Hadh Kar Di Aapne',2000,140,5.3,NULL,NULL),(560,'Hadh: Life on the Edge of Death',2001,120,4,NULL,NULL),(561,'Hai Apna Dil Toh Awara',2016,120,6.1,NULL,NULL),(562,'Haider',2014,120,8.1,NULL,NULL),(563,'Half Girlfriend',2017,140,4.4,NULL,NULL),(564,'Halkaa',2018,120,7.2,NULL,NULL),(565,'Halla Bol',2008,140,6.1,NULL,NULL),(566,'Hamara Dil Aapke Paas Hai',2000,110,5.6,NULL,NULL),(567,'Hamari Adhuri Kahani',2015,120,6.7,NULL,NULL),(568,'Hamid',2018,130,7.8,NULL,NULL),(569,'Hanuman',2005,120,7.6,NULL,NULL),(570,'Happy Bhaag Jayegi',2016,130,6.5,NULL,NULL),(571,'Happy Ending',2014,130,5.4,NULL,NULL),(572,'Happy Husbands',2011,130,3.2,NULL,NULL),(573,'Happy New Year',2014,140,5,NULL,NULL),(574,'Happy Phirr Bhag Jayegi',2018,140,4.5,NULL,NULL),(575,'Haraamkhor',2015,130,6.4,NULL,NULL),(576,'Hari Puttar: A Comedy of Terrors',2008,110,1.9,NULL,NULL),(577,'Hari-Bhari',2000,120,5.7,NULL,NULL),(578,'Hasee Toh Phasee',2014,110,6.8,NULL,NULL),(579,'Haseena',2018,110,4.4,NULL,NULL),(580,'Hate Story',2012,140,5.3,NULL,NULL),(581,'Hate Story 2',2014,120,4.4,NULL,NULL),(582,'Hate Story 3',2015,140,4.5,NULL,NULL),(583,'Hattrick',2007,120,4.2,NULL,NULL),(584,'Hava Aney Dey',2004,140,6.2,NULL,NULL),(585,'Hawa',2003,120,3.3,NULL,NULL),(586,'Hawaa Hawaai',2014,130,7.4,NULL,NULL),(587,'Hawaizaada',2015,110,5.5,NULL,NULL),(588,'Hawas',2004,110,2.7,NULL,NULL),(590,'Hazaaron Khwaishein Aisi',2003,130,7.9,NULL,NULL),(591,'Heartless',2014,140,5.1,NULL,NULL),(592,'Helicopter Eela',2018,120,5.6,NULL,NULL),(593,'Hello',2008,120,3.3,NULL,NULL),(594,'Hello Darling',2010,130,2.7,NULL,NULL),(595,'Hello Zindagi',2010,140,6,NULL,NULL),(596,'Help',2010,110,4.3,NULL,NULL),(597,'Hera Pheri',2000,130,8.2,NULL,NULL),(598,'Hero',2015,120,3.5,NULL,NULL),(599,'Heroes',2008,130,5.5,NULL,NULL),(600,'Heroine',2012,110,5.1,NULL,NULL),(601,'Heropanti',2014,110,5.3,NULL,NULL),(602,'Hey Bro',2015,130,2.9,NULL,NULL),(603,'Hey Ram',2000,140,7.9,NULL,NULL),(604,'Heyy Babyy',2007,130,6,NULL,NULL),(605,'Hichki',2018,130,7.5,NULL,NULL),(606,'Hide & Seek',2010,120,4.2,NULL,NULL),(607,'High Jack',2018,140,5.4,NULL,NULL),(608,'Highway',2014,120,7.6,NULL,NULL),(609,'Himmatwala',2013,140,1.7,NULL,NULL),(610,'Hindi Medium',2017,110,7.9,NULL,NULL),(611,'Hisss',2010,130,2.9,NULL,NULL),(612,'Holiday',2006,120,4.3,NULL,NULL),(613,'Holiday: A Soldier Is Never Off Duty',2014,130,7.2,NULL,NULL),(614,'Honeymoon Travels Pvt. Ltd.',2007,140,6.1,NULL,NULL),(615,'Hope Aur Hum',2018,110,6.3,NULL,NULL),(616,'Horror Story',2013,110,4.2,NULL,NULL),(617,'Hostel',2011,140,5.2,NULL,NULL),(618,'Hotel Milan',2018,120,3.8,NULL,NULL),(619,'Housefull',2010,140,5.5,NULL,NULL),(620,'Housefull 2',2012,120,5.3,NULL,NULL),(621,'Housefull 3',2016,140,5,NULL,NULL),(622,'Housefull 4',2019,130,3.5,NULL,NULL),(623,'Hulchul',2004,120,7,NULL,NULL),(624,'Hum Chaar',2019,140,5.7,NULL,NULL),(625,'Hum Dum',2005,130,6.9,NULL,NULL),(626,'Hum Hai Raahi Car Ke',2013,120,3,NULL,NULL),(627,'Hum Hai Teen Khurafaati',2014,140,6.2,NULL,NULL),(628,'Hum Pyar Tumhi Se Kar Baithe',2002,130,5.7,NULL,NULL),(629,'Hum To Mohabbat Karega',2000,110,2.7,NULL,NULL),(630,'Hum Tum',2004,130,7,NULL,NULL),(631,'Hum Tum Aur Ghost',2010,110,4.7,NULL,NULL),(632,'Hum Tum Shabana',2011,110,3.6,NULL,NULL),(633,'Hum Tumhare Hain Sanam',2002,140,5.4,NULL,NULL),(634,'Hume Tumse Pyaar Kitna',2019,110,4.9,NULL,NULL),(635,'Humein Tumse Pyar Ho Gaya Chupke Chupke',2003,140,1.7,NULL,NULL),(636,'Humko Deewana Kar Gaye',2006,130,5.2,NULL,NULL),(637,'Humko Tumse Pyaar Hai',2006,140,4.8,NULL,NULL),(638,'Humne Jeena Seekh Liya',2007,110,6.9,NULL,NULL),(639,'Humpty Sharma Ki Dulhania',2014,110,6,NULL,NULL),(640,'Humraaz',2002,110,6.4,NULL,NULL),(641,'Humshakals',2014,120,1.8,NULL,NULL),(642,'Hungama',2003,110,7.5,NULL,NULL),(643,'Hunterrr',2015,140,7,NULL,NULL),(644,'Hyderabad Blues 2',2004,140,6.1,NULL,NULL),(645,'I Am',2010,120,6.8,NULL,NULL),(646,'I Am Kalam',2010,130,8,NULL,NULL),(647,'I Don\'t Luv U',2013,130,6,NULL,NULL),(648,'I Hate Luv Storys',2010,140,5.6,NULL,NULL),(650,'I Love NY',2015,120,3.4,NULL,NULL),(651,'I See You',2006,110,4.1,NULL,NULL),(652,'I, Me Aur Main',2013,140,4.6,NULL,NULL),(653,'Idiot Box',2010,110,4.5,NULL,NULL),(654,'Impatient Vivek',2011,120,2.1,NULL,NULL),(655,'India\'s Most Wanted',2019,120,4.5,NULL,NULL),(656,'Indian',2001,130,5.4,NULL,NULL),(657,'Indian Babu',2003,120,4.5,NULL,NULL),(658,'Indu Sarkar',2017,120,6,NULL,NULL),(659,'Inkaar',2013,110,6,NULL,NULL),(660,'Insaaf: The Justice',2004,110,3.9,NULL,NULL),(661,'Insan',2005,140,4.6,NULL,NULL),(662,'Inteha',2003,130,5.1,NULL,NULL),(663,'Inteqam: The Perfect Game',2004,120,5,NULL,NULL),(664,'Iqbal',2005,110,8.1,NULL,NULL),(665,'Irada',2017,130,6.3,NULL,NULL),(666,'Ishaqzaade',2012,130,6.5,NULL,NULL),(667,'Ishk Actually',2013,120,2.6,NULL,NULL),(668,'Ishkq in Paris',2013,130,3.8,NULL,NULL),(669,'Ishq Forever',2016,110,4,NULL,NULL),(670,'Ishq Hai Tumse',2004,130,3.1,NULL,NULL),(671,'Ishq Ke Parindey',2015,130,6.8,NULL,NULL),(672,'Ishq Tera',2018,130,5.5,NULL,NULL),(673,'Ishq Vishk',2003,140,6,NULL,NULL),(674,'Ishqedarriyaan',2015,140,4.8,NULL,NULL),(675,'Ishqeria',2018,140,4.1,NULL,NULL),(676,'Ishqiya',2010,120,7.3,NULL,NULL),(677,'Isi Life Mein...!',2010,130,5.4,NULL,NULL),(678,'Island City',2015,110,6.7,NULL,NULL),(679,'Issaq',2013,140,4.5,NULL,NULL),(681,'Ittefaq',2017,140,7.2,NULL,NULL),(682,'Jaal: The Trap',2003,110,4.1,NULL,NULL),(683,'Jaane Hoga Kya',2006,120,2.7,NULL,NULL),(684,'Jaane Kahan Se Aayi Hai',2010,140,3.8,NULL,NULL),(685,'Jaane Kyun De Yaaron',2018,110,4.8,NULL,NULL),(686,'Jaani Dushman: Ek Anokhi Kahani',2002,120,2.8,NULL,NULL),(687,'Jab Harry Met Sejal',2017,110,5.3,NULL,NULL),(688,'Jab Tak Hai Jaan',2012,140,6.7,NULL,NULL),(689,'Jab We Met',2007,120,7.9,NULL,NULL),(690,'Jabariya Jodi',2019,130,4.4,NULL,NULL),(691,'Jackpot',2013,110,2,NULL,NULL),(692,'Jagga Jasoos',2017,120,6.5,NULL,NULL),(693,'Jahan Jaaeyega Hamen Paaeyega',2007,130,3.9,NULL,NULL),(694,'Jai Gangaajal',2016,120,5.6,NULL,NULL),(695,'Jai Ho',2014,130,5.1,NULL,NULL),(696,'Jai Jawaan Jai Kisaan',2015,120,5.2,NULL,NULL),(697,'Jail',2009,130,6.2,NULL,NULL),(698,'Jajantaram Mamantaram',2003,120,5.8,NULL,NULL),(699,'Jal',2013,120,6.7,NULL,NULL),(700,'Jalebi',2018,120,6,NULL,NULL),(701,'Jallad No. 1',2000,120,4.7,NULL,NULL),(702,'Jalpari: The Desert Mermaid',2012,110,7.1,NULL,NULL),(703,'James',2005,120,3.7,NULL,NULL),(704,'Janasheen',2003,130,2.9,NULL,NULL),(705,'Jannat 2',2012,120,6.2,NULL,NULL),(706,'Jattu Engineer',2017,130,5.8,NULL,NULL),(707,'Jawaani Jaaneman',2020,110,6.6,NULL,NULL),(708,'Jayantabhai Ki Luv Story',2013,130,5.3,NULL,NULL),(709,'Jazbaa',2015,130,5.8,NULL,NULL),(710,'Jeena Hai Toh Thok Daal',2012,130,5.5,NULL,NULL),(711,'Jeena Isi Ka Naam Hai',2017,140,5.4,NULL,NULL),(712,'Jeena Sirf Merre Liye',2002,130,4.4,NULL,NULL),(713,'Jhalki',2019,140,7.2,NULL,NULL),(714,'Jhankaar Beats',2003,140,7.2,NULL,NULL),(715,'Jhoom Barabar Jhoom',2007,140,3.7,NULL,NULL),(716,'Jhootha Hi Sahi',2010,110,6.1,NULL,NULL),(717,'Jhootha Kahin Ka',2019,110,4.7,NULL,NULL),(718,'Jia aur Jia',2017,110,4.4,NULL,NULL),(719,'Jigariyaa',2014,140,4.9,NULL,NULL),(720,'Jigyaasa',2006,130,3.4,NULL,NULL),(721,'Jimmy',2008,140,1.6,NULL,NULL),(722,'Jis Desh Mein Ganga Rehta Hain',2000,130,4.9,NULL,NULL),(723,'Jism',2003,110,5.2,NULL,NULL),(724,'Jism 2',2012,140,3,NULL,NULL),(725,'Jo Bole So Nihaal',2005,130,3.6,NULL,NULL),(726,'Jo Hum Chahein',2011,130,4.5,NULL,NULL),(727,'Jodhaa Akbar',2008,110,7.6,NULL,NULL),(728,'Jodi Breakers',2012,110,3.5,NULL,NULL),(729,'Jodi Kya Banayi Wah Wah Ramji',2003,120,3.8,NULL,NULL),(730,'John Day',2013,140,5.6,NULL,NULL),(731,'Johnny Gaddaar',2007,110,7.8,NULL,NULL),(732,'Joker',2012,120,2.4,NULL,NULL),(733,'Jolly LLB',2013,110,7.5,NULL,NULL),(734,'Jolly LLB 2',2017,120,7.2,NULL,NULL),(735,'Joru Ka Ghulam',2000,140,5.1,NULL,NULL),(736,'Josh',2000,110,6.2,NULL,NULL),(737,'Judgementall Hai Kya',2019,120,5.9,NULL,NULL),(738,'Judwaa 2',2017,130,3.6,NULL,NULL),(739,'Jugni',2016,130,6.2,NULL,NULL),(740,'Julie',2004,140,4,NULL,NULL),(741,'Julie 2',2017,140,2.3,NULL,NULL),(742,'Jung',2000,120,4.2,NULL,NULL),(743,'Jungle',2000,130,6.1,NULL,NULL),(744,'Junglee',2019,130,5.6,NULL,NULL),(745,'Junooniyat',2016,140,4.2,NULL,NULL),(746,'Jurm',2005,140,5.4,NULL,NULL),(747,'Kaabil',2017,110,7.1,NULL,NULL),(748,'Kaafila',2007,120,3.3,NULL,NULL),(749,'Kaafiron Ki Namaaz',2013,120,7.1,NULL,NULL),(750,'Kaagaz Ke Fools',2015,140,3.9,NULL,NULL),(751,'Kaal',2005,110,4.6,NULL,NULL),(752,'Kaalakaandi',2018,130,6.3,NULL,NULL),(753,'Kaalo',2010,120,3.3,NULL,NULL),(754,'Kaante',2002,140,6.5,NULL,NULL),(755,'Kaash... Hamara Dil Pagal Na Hota',2003,130,3.6,NULL,NULL),(756,'Kaashi in Search of Ganga',2018,140,5.4,NULL,NULL),(757,'Kabhi Alvida Naa Kehna',2006,140,6.1,NULL,NULL),(758,'Kabhi Khushi Kabhie Gham...',2001,140,7.4,NULL,NULL),(759,'Kabhie Tum Kabhie Hum',2002,110,4.4,NULL,NULL),(760,'Kabir Singh',2019,140,7.1,NULL,NULL),(761,'Kabrastan',2000,140,3.1,NULL,NULL),(762,'Kabul Express',2006,110,6.8,NULL,NULL),(763,'Kadvi Hawa',2017,120,8.1,NULL,NULL),(764,'Kagaar: Life on the Edge',2003,140,5.7,NULL,NULL),(765,'Kahaani',2012,130,8.1,NULL,NULL),(766,'Kahaani 2',2016,110,6.6,NULL,NULL),(767,'Kahan Ho Tum',2003,110,3.9,NULL,NULL),(768,'Kahin Hai Mera Pyar',2014,110,5.7,NULL,NULL),(769,'Kaho Naa... Pyaar Hai',2000,110,6.9,NULL,NULL),(770,'Kaise Kahoon Ke... Pyaar Hai',2003,120,3.3,NULL,NULL),(771,'Kajarya',2013,130,6.6,NULL,NULL),(772,'Kajraare',2010,130,2.8,NULL,NULL),(773,'Kal Ho Naa Ho',2003,130,7.9,NULL,NULL),(774,'Kal Kissne Dekha',2009,140,3.6,NULL,NULL),(775,'Kalank',2019,110,3.6,NULL,NULL),(777,'Kamaal Dhamaal Malamaal',2012,140,4.1,NULL,NULL),(778,'Kambakkht Ishq',2009,110,3.9,NULL,NULL),(779,'Kaminey',2009,120,7.4,NULL,NULL),(780,'Kapoor & Sons',2016,120,7.7,NULL,NULL),(781,'Karam',2005,120,5.5,NULL,NULL),(782,'Karar: The Deal',2014,120,4.2,NULL,NULL),(783,'Karle Pyaar Karle',2014,130,2.7,NULL,NULL),(784,'Karobaar: The Business of Love',2000,120,4.4,NULL,NULL),(785,'Karthik Calling Karthik',2010,140,7.1,NULL,NULL),(786,'Karwaan',2018,110,7.6,NULL,NULL),(787,'Karz: The Burden of Truth',2002,120,3.9,NULL,NULL),(788,'Karzzzz',2008,120,2.1,NULL,NULL),(789,'Kasak',2005,130,4.5,NULL,NULL),(790,'Kasam',2001,110,2.9,NULL,NULL),(791,'Kasoor',2001,120,6,NULL,NULL),(792,'Kathor',2018,120,5.6,NULL,NULL),(793,'Katti Batti',2015,110,4.9,NULL,NULL),(794,'Kaun Hai Jo Sapno Mein Aaya',2004,110,5.1,NULL,NULL),(795,'Kaun Kitney Paani Mein',2015,120,6.1,NULL,NULL),(797,'Kedarnath',2018,130,6.9,NULL,NULL),(798,'Kehtaa Hai Dil Baar Baar',2002,130,4.7,NULL,NULL),(799,'Kesari',2019,120,7.4,NULL,NULL),(800,'Khajoor Pe Atke',2018,140,5.6,NULL,NULL),(801,'Khakee',2004,130,7.4,NULL,NULL),(802,'Khamoshh... Khauff Ki Raat',2005,140,3.3,NULL,NULL),(803,'Khamoshi',2019,130,3.5,NULL,NULL),(804,'Khandaani Shafakhana',2019,140,4,NULL,NULL),(805,'Khap',2011,140,5,NULL,NULL),(807,'Khatta Meetha',2010,110,5.7,NULL,NULL),(808,'Khauff',2000,140,4.4,NULL,NULL),(809,'Khel Toh Ab Shuru Hoga',2016,130,5.2,NULL,NULL),(810,'Khelein Hum Jee Jaan Sey',2010,120,5.8,NULL,NULL),(811,'Khichdi: The Movie',2010,130,7.2,NULL,NULL),(812,'Khiladi 420',2000,110,5.2,NULL,NULL),(813,'Khiladi 786',2012,110,4.3,NULL,NULL),(814,'Khoobsurat',2014,140,6.4,NULL,NULL),(815,'Khoya Khoya Chand',2007,130,6.3,NULL,NULL),(816,'Khuda Kasam',2010,140,3.2,NULL,NULL),(817,'Khushi',2003,140,4.4,NULL,NULL),(818,'Khwaabb',2014,110,5.5,NULL,NULL),(819,'Khwahish',2003,110,4.1,NULL,NULL),(820,'Ki & Ka',2016,140,5.8,NULL,NULL),(821,'Kick',2014,120,5.3,NULL,NULL),(822,'Kidnap',2008,130,4.6,NULL,NULL),(823,'Kill Dil',2014,130,4.3,NULL,NULL),(824,'Kis Kis Ki Kismat',2004,140,2.5,NULL,NULL),(825,'Kis Kisko Pyaar Karoon',2015,130,5.7,NULL,NULL),(826,'Kisaan',2009,130,5.3,NULL,NULL),(827,'Kismat',2004,110,3.7,NULL,NULL),(828,'Kismat Konnection',2008,140,5.2,NULL,NULL),(829,'Kismet Love Paisa Dilli',2012,120,4.2,NULL,NULL),(830,'Kisna: The Warrior Poet',2005,110,4.5,NULL,NULL),(831,'Kiss Kis Ko',2004,120,4.6,NULL,NULL),(832,'Kites',2010,110,6.1,NULL,NULL),(833,'Knock Out',2010,120,6,NULL,NULL),(834,'Koi Mere Dil Mein Hai',2005,120,4.7,NULL,NULL),(835,'Koi Mere Dil Se Poochhe',2002,140,3.5,NULL,NULL),(836,'Koi... Mil Gaya',2003,120,7.1,NULL,NULL),(837,'Koyelaanchal',2014,140,5.4,NULL,NULL),(838,'Kranti',2002,110,3.8,NULL,NULL),(839,'Krazzy 4',2008,110,4.2,NULL,NULL),(840,'Krishna Aur Kans',2012,130,6.5,NULL,NULL),(841,'Krishna Cottage',2004,130,5.2,NULL,NULL),(843,'Krrish',2006,120,6.4,NULL,NULL),(844,'Krrish 3',2013,110,5.2,NULL,NULL),(845,'Kucch Luv Jaisaa',2011,110,4.3,NULL,NULL),(846,'Kucch To Hai',2003,130,4.2,NULL,NULL),(847,'Kuch Khatti Kuch Meethi',2001,130,4.6,NULL,NULL),(848,'Kuch Kuch Locha Hai',2015,140,2.5,NULL,NULL),(849,'Kuch Naa Kaho',2003,140,5.4,NULL,NULL),(850,'Kuch Tum Kaho Kuch Hum Kahein',2002,120,5.6,NULL,NULL),(851,'Kuchh Bheege Alfaaz',2018,110,7.5,NULL,NULL),(852,'Kuchh Kariye',2010,130,4.1,NULL,NULL),(853,'Kuchh Meetha Ho Jaye',2005,130,3.4,NULL,NULL),(854,'Kuku Mathur Ki Jhand Ho Gayi',2014,110,5.3,NULL,NULL),(855,'Kunwara',2000,120,5.1,NULL,NULL),(856,'Kurbaan',2009,140,5.7,NULL,NULL),(857,'Kurukshetra',2000,130,6,NULL,NULL),(858,'Kushti',2010,140,4.3,NULL,NULL),(859,'Kya Dilli Kya Lahore',2014,120,7.4,NULL,NULL),(860,'Kya Kehna',2000,140,5.9,NULL,NULL),(861,'Kya Love Story Hai',2007,140,3.6,NULL,NULL),(862,'Kya Yehi Pyaar Hai',2002,130,3.9,NULL,NULL),(863,'Kyaa Dil Ne Kahaa',2002,140,3,NULL,NULL),(864,'Kyaa Kool Hai Hum',2005,140,6.1,NULL,NULL),(865,'Kyaa Kool Hain Hum 3',2016,110,1.9,NULL,NULL),(866,'Kyaa Super Kool Hain Hum',2012,140,4.9,NULL,NULL),(867,'Kyon?',2003,110,3.4,NULL,NULL),(868,'Kyun! Ho Gaya Na...',2004,140,4.2,NULL,NULL),(869,'Laal Kaptaan',2019,120,7.3,NULL,NULL),(870,'Laal Rang',2016,120,8,NULL,NULL),(871,'Laali Ki Shaadi Mein Laaddoo Deewana',2017,130,3.4,NULL,NULL),(872,'Lafangey Parindey',2010,110,5.2,NULL,NULL),(873,'Lagaan: Once Upon a Time in India',2001,140,8.1,NULL,NULL),(874,'Lage Raho Munna Bhai',2006,130,8,NULL,NULL),(875,'Lahore',2010,120,6.3,NULL,NULL),(876,'Laila Majnu',2018,120,7.8,NULL,NULL),(877,'Lajja',2001,110,6.7,NULL,NULL),(878,'Lakshmi',2014,130,7.9,NULL,NULL),(879,'Lakshya',2004,110,7.9,NULL,NULL),(880,'Lal Salaam',2002,110,6.7,NULL,NULL),(881,'Le Chal Apne Sang',2000,110,3.7,NULL,NULL),(882,'Lekar Hum Deewana Dil',2014,140,4.9,NULL,NULL),(883,'Let\'s Dance',2009,110,5.7,NULL,NULL),(884,'Let\'s Enjoy',2004,120,6.3,NULL,NULL),(885,'Life Ki Toh Lag Gayi',2012,110,5.3,NULL,NULL),(886,'Life Mein Kabhie Kabhiee',2007,110,5.8,NULL,NULL),(888,'Lipstick Under My Burkha',2016,130,6.8,NULL,NULL),(889,'Listen... Amaya',2013,120,6.6,NULL,NULL),(890,'LOC: Kargil',2003,120,5.2,NULL,NULL),(891,'Login',2012,120,6.1,NULL,NULL),(892,'Loins of Punjab Presents',2007,120,7,NULL,NULL),(893,'London Dreams',2009,120,5.3,NULL,NULL),(894,'Loot',2011,120,3.3,NULL,NULL),(895,'Lootcase',2020,120,7.6,NULL,NULL),(896,'Lootera',2013,130,7.3,NULL,NULL),(897,'Love Aaj Kal',2020,130,4.7,NULL,NULL),(898,'Love at Times Square',2003,130,3.8,NULL,NULL),(899,'Love Breakups Zindagi',2011,130,5.8,NULL,NULL),(900,'Love Exchange',2015,110,5.2,NULL,NULL),(901,'Love Games',2016,140,4.3,NULL,NULL),(902,'Love Ke Chakkar Mein',2006,140,4.2,NULL,NULL),(903,'Love Ke Funday',2016,110,6.6,NULL,NULL),(904,'Love Khichdi',2009,130,5.7,NULL,NULL),(905,'Love Per Square Foot',2018,130,7.2,NULL,NULL),(906,'Love Shagun',2016,120,4.4,NULL,NULL),(907,'Love Sonia',2018,140,7.4,NULL,NULL),(908,'Love Story 2050',2008,120,2.6,NULL,NULL),(909,'Love You Family',2017,140,4.2,NULL,NULL),(910,'Love You To Death',2012,130,5.3,NULL,NULL),(911,'LoveShhuda',2016,130,4.5,NULL,NULL),(912,'Luck',2009,140,4.8,NULL,NULL),(913,'Luck by Chance',2009,110,7.1,NULL,NULL),(914,'Luckhnowi Ishq',2015,120,7.1,NULL,NULL),(915,'Lucknow Central',2017,110,6.2,NULL,NULL),(916,'Lucky Kabootar',2014,120,5.1,NULL,NULL),(917,'Lucky: No Time for Love',2005,110,4.7,NULL,NULL),(918,'Luka Chuppi',2019,130,6.3,NULL,NULL),(919,'Lupt',2018,110,5.6,NULL,NULL),(920,'Luv Ka The End',2011,140,4.8,NULL,NULL),(921,'Luv Shuv Tey Chicken Khurana',2012,140,6.6,NULL,NULL),(922,'Luv U Alia',2015,130,5.3,NULL,NULL),(923,'Luv U Soniyo',2012,110,5.5,NULL,NULL),(924,'M Cream',2014,130,5.6,NULL,NULL),(925,'M.S. Dhoni: The Untold Story',2016,140,7.9,NULL,NULL),(927,'Maa Santoshi Maa',2003,140,8.9,NULL,NULL),(928,'Maa Tujhhe Salaam',2002,120,3.5,NULL,NULL),(929,'Maal road dilli',2018,120,5.7,NULL,NULL),(930,'Maatr',2017,120,4.5,NULL,NULL),(931,'Maazii',2013,140,5.8,NULL,NULL),(932,'Machhli Jal Ki Rani Hai',2014,110,2.3,NULL,NULL),(933,'Machine',2017,130,2.7,NULL,NULL),(934,'Madaari',2016,110,7.6,NULL,NULL),(935,'Made In China',2019,140,6.2,NULL,NULL),(936,'Madhoshi',2004,130,4.6,NULL,NULL),(937,'Madhubaala',2006,110,3.2,NULL,NULL),(938,'Madras Cafe',2013,110,7.7,NULL,NULL),(939,'Maharathi',2008,130,7.1,NULL,NULL),(940,'Main Aisa Hi Hoon',2005,120,4.8,NULL,NULL),(941,'Main Aur Charles',2015,140,6.3,NULL,NULL),(942,'Main Aur Mr. Riight',2014,120,5.2,NULL,NULL),(943,'Main Hoon Na',2004,140,7,NULL,NULL),(944,'Main Hoon Rajinikanth',2015,110,7.3,NULL,NULL),(945,'Main Krishna Hoon',2013,120,5.3,NULL,NULL),(946,'Main Prem Ki Diwani Hoon',2003,110,4,NULL,NULL),(947,'Main Tera Hero',2014,130,5.1,NULL,NULL),(948,'Maine Dil Tujhko Diya',2002,130,3.7,NULL,NULL),(949,'Malaal',2019,110,6,NULL,NULL),(950,'Malamaal Weekly',2006,120,7,NULL,NULL),(951,'Mallika',2010,130,4.6,NULL,NULL),(952,'Mangal Pandey: The Rising',2005,130,6.6,NULL,NULL),(953,'Manikarnika: The Queen of Jhansi',2019,120,6.4,NULL,NULL),(954,'Manjunath',2014,140,7.2,NULL,NULL),(955,'Manto',2018,130,7.4,NULL,NULL),(956,'Mantostaan',2017,140,6,NULL,NULL),(957,'Maqbool',2003,120,8.1,NULL,NULL),(958,'Mardaani',2014,110,7.3,NULL,NULL),(959,'Mardaani 2',2019,130,7.4,NULL,NULL),(960,'Marega Salaa',2009,120,4.9,NULL,NULL),(961,'Margarita with a Straw',2014,120,7.2,NULL,NULL),(962,'Marigold',2007,130,4.8,NULL,NULL),(963,'Marjaavaan',2019,140,3.6,NULL,NULL),(964,'Market',2003,130,3.5,NULL,NULL),(965,'Married 2 America',2012,120,4.2,NULL,NULL),(966,'Mary Kom',2014,130,6.8,NULL,NULL),(967,'Masaan',2015,120,8.2,NULL,NULL),(968,'Maseeha',2002,140,4.1,NULL,NULL),(969,'Mashooka',2005,140,5.3,NULL,NULL),(970,'Masti',2004,110,6.2,NULL,NULL),(971,'Masti Express',2011,110,5.1,NULL,NULL),(972,'Mastizaade',2016,120,2.4,NULL,NULL),(973,'Mastram',2013,130,4.8,NULL,NULL),(974,'Matru Ki Bijlee Ka Mandola',2013,140,5.6,NULL,NULL),(975,'Mausam',2011,120,4.7,NULL,NULL),(976,'Maximum',2012,130,4.7,NULL,NULL),(977,'Maya',2001,120,7,NULL,NULL),(978,'Mazaa Mazaa',2005,110,2.7,NULL,NULL),(979,'Meerabai Not Out',2008,140,3.9,NULL,NULL),(980,'Mehbooba',2008,110,3.5,NULL,NULL),(981,'Meinu Ek Ladki Chaahiye',2014,140,2.9,NULL,NULL),(982,'Mela',2000,120,3.8,NULL,NULL),(983,'Memories in March',2010,140,7.2,NULL,NULL),(984,'Men Not Allowed',2006,130,3.6,NULL,NULL),(985,'Mere Baap Pehle Aap',2008,120,5.4,NULL,NULL),(986,'Mere Brother Ki Dulhan',2011,130,5.8,NULL,NULL),(987,'Mere Dad Ki Maruti',2013,110,6.4,NULL,NULL),(988,'Mere Jeevan Saathi',2006,140,3.5,NULL,NULL),(989,'Mere Khwabon Mein Jo Aaye',2009,130,5.6,NULL,NULL),(990,'Mere Yaar Ki Shaadi Hai',2002,110,5.3,NULL,NULL),(991,'Meri Jung Ka Elaan',2000,130,4.8,NULL,NULL),(992,'Meri Padosan',2009,140,3.3,NULL,NULL),(993,'Meri Pyaari Bindu',2017,110,6,NULL,NULL),(995,'Mickey Virus',2013,130,6,NULL,NULL),(996,'Milan Talkies',2019,110,5,NULL,NULL),(997,'Milenge Milenge',2010,110,4.1,NULL,NULL),(998,'Milta Hai Chance By Chance',2011,140,6.2,NULL,NULL),(999,'Mirch',2010,120,6.5,NULL,NULL),(1000,'Mirza Juuliet',2017,120,4.1,NULL,NULL),(1001,'Miss India: The Mystery',2003,140,3.6,NULL,NULL),(1002,'Miss Lovely',2012,140,6.4,NULL,NULL),(1003,'Miss Tanakpur Haazir Ho',2015,130,5.4,NULL,NULL),(1004,'Missing',2018,140,5.8,NULL,NULL),(1005,'Mission Kashmir',2000,140,6.7,NULL,NULL),(1006,'Mission Mangal',2019,120,6.5,NULL,NULL),(1007,'Mitron',2018,110,6.9,NULL,NULL),(1008,'Mittal v/s Mittal',2010,130,4.2,NULL,NULL),(1009,'Mitti',2001,130,5.3,NULL,NULL),(1010,'Mohabbatein',2000,110,7.1,NULL,NULL),(1011,'Mohalla Assi',2015,140,6.8,NULL,NULL),(1012,'Mohenjo Daro',2016,130,5.7,NULL,NULL),(1013,'Mom',2017,130,7.3,NULL,NULL),(1014,'Money Hai Toh Honey Hai',2008,130,2.7,NULL,NULL),(1015,'Monica',2011,110,5.5,NULL,NULL),(1016,'Monsoon Shootout',2013,140,6.6,NULL,NULL),(1017,'Morning Raga',2004,120,6.7,NULL,NULL),(1018,'Motu Patlu: King Of Kings',2016,140,6.7,NULL,NULL),(1019,'MP3: Mera Pehla Pehla Pyaar',2007,140,7,NULL,NULL),(1020,'Mr Joe B. Carvalho',2014,110,3.6,NULL,NULL),(1021,'Mr Prime Minister',2005,120,5.2,NULL,NULL),(1022,'Mr Ya Miss',2005,130,3.6,NULL,NULL),(1023,'Mr. X',2015,110,3.8,NULL,NULL),(1024,'Mubarakan',2017,140,5.5,NULL,NULL),(1025,'Mudda: The Issue',2003,110,3.9,NULL,NULL),(1026,'Mujhe Kucch Kehna Hai',2001,140,5,NULL,NULL),(1027,'Mujhe Meri Biwi Se Bachaao',2001,110,4.2,NULL,NULL),(1028,'Mujhse Fraaandship Karoge',2011,120,6.9,NULL,NULL),(1029,'Mujhse Shaadi Karogi',2004,130,6.7,NULL,NULL),(1030,'Mukhbiir',2008,140,6.9,NULL,NULL),(1031,'Mulaqaat',2002,120,2.9,NULL,NULL),(1032,'Mulk',2018,120,6.9,NULL,NULL),(1033,'Mumbai Delhi Mumbai',2014,120,5.7,NULL,NULL),(1034,'Mumbai Godfather',2005,140,3.4,NULL,NULL),(1035,'Mumbai Mast Kallander',2011,130,5.4,NULL,NULL),(1036,'Mumbai Matinee',2003,120,5.2,NULL,NULL),(1037,'Mumbai Meri Jaan',2008,110,7.7,NULL,NULL),(1038,'Mumbai Mirror',2013,110,4.9,NULL,NULL),(1039,'Mumbai Salsa',2007,110,4.8,NULL,NULL),(1040,'Mumbai Se Aaya Mera Dost',2003,130,3.3,NULL,NULL),(1041,'Mumbai Xpress',2005,110,6.6,NULL,NULL),(1042,'Mumbhai Connection',2011,140,5.2,NULL,NULL),(1043,'Munna Bhai M.B.B.S.',2003,140,8.1,NULL,NULL),(1044,'Munna Michael',2017,110,3.3,NULL,NULL),(1045,'Murari the Mad Gentleman',2016,110,6.2,NULL,NULL),(1046,'Murder',2004,140,5.4,NULL,NULL),(1047,'Murder 2',2011,110,6.2,NULL,NULL),(1048,'Murder 3',2013,120,4.9,NULL,NULL),(1049,'Musafir',2004,110,5.5,NULL,NULL),(1050,'Muskaan',2004,120,4.4,NULL,NULL),(1051,'Muskurake Dekh Zara',2010,140,4.2,NULL,NULL),(1052,'My Birthday Song',2018,130,5.5,NULL,NULL),(1053,'My Brother... Nikhil',2005,120,7.2,NULL,NULL),(1054,'My Friend Ganesha 3',2010,110,4.4,NULL,NULL),(1055,'My Friend Pinto',2011,120,5.3,NULL,NULL),(1056,'My Name Is Khan',2010,120,8,NULL,NULL),(1057,'My Wife\'s Murder',2005,130,6.1,NULL,NULL),(1058,'Na Ghar Ke Na Ghaat Ke',2010,130,6.1,NULL,NULL),(1059,'Na Tum Jaano Na Hum',2002,130,5,NULL,NULL),(1060,'Naach',2004,130,4.2,NULL,NULL),(1061,'Naag Lok',2003,110,3.4,NULL,NULL),(1062,'Naam Gum Jaayega',2005,140,5.9,NULL,NULL),(1063,'Naam Shabana',2017,120,6.3,NULL,NULL),(1064,'Naina',2005,110,4.3,NULL,NULL),(1065,'Naksha',2006,110,3.3,NULL,NULL),(1066,'Nakshatra',2010,140,5,NULL,NULL),(1067,'Namaste England',2018,140,2.2,NULL,NULL),(1068,'Namastey London',2007,120,7.1,NULL,NULL),(1069,'Nanu Ki Jaanu',2018,110,5.9,NULL,NULL),(1070,'Naqaab',2007,130,5.4,NULL,NULL),(1071,'Nasha',2013,130,3.2,NULL,NULL),(1072,'Naughty @ 40',2011,130,2.5,NULL,NULL),(1073,'Nawabzaade',2018,120,4.4,NULL,NULL),(1074,'Nayee Padosan',2003,120,5.4,NULL,NULL),(1075,'Neal \'n\' Nikki',2005,120,3.2,NULL,NULL),(1076,'Neerja',2016,120,7.6,NULL,NULL),(1077,'Nehlle Pe Dehlla',2007,140,3.8,NULL,NULL),(1078,'Neighbours',2014,130,3.2,NULL,NULL),(1080,'New York',2009,110,6.8,NULL,NULL),(1081,'Newton',2017,130,7.7,NULL,NULL),(1082,'Nidaan',2000,120,6.1,NULL,NULL),(1083,'Nil Battey Sannata',2015,120,8.3,NULL,NULL),(1084,'Nirdosh',2018,130,3.9,NULL,NULL),(1085,'Nishabd',2007,110,5.4,NULL,NULL),(1086,'No Entry',2005,140,6.6,NULL,NULL),(1087,'No One Killed Jessica',2011,140,7.2,NULL,NULL),(1088,'No Problem',2010,110,4.3,NULL,NULL),(1089,'No Smoking',2007,120,7.3,NULL,NULL),(1090,'Noor',2017,140,3.9,NULL,NULL),(1091,'Not a Love Story',2011,110,5,NULL,NULL),(1092,'Notebook',2019,130,6.9,NULL,NULL),(1093,'O Teri',2014,140,3.3,NULL,NULL),(1095,'October',2018,110,7.5,NULL,NULL),(1096,'Officer',2001,120,4.2,NULL,NULL),(1097,'Ok Jaanu',2017,110,5.2,NULL,NULL),(1099,'Om',2003,130,3.7,NULL,NULL),(1100,'Om Jai Jagadish',2002,140,5.5,NULL,NULL),(1101,'Om Shanti Om',2007,130,6.7,NULL,NULL),(1102,'Omerta',2017,120,7.2,NULL,NULL),(1103,'Omkara',2006,120,8.1,NULL,NULL),(1104,'Once Upon A Time In Bihar',2015,130,6.7,NULL,NULL),(1105,'Once Upon a Time in Mumbaai',2010,120,7.4,NULL,NULL),(1106,'One 2 Ka 4',2001,130,5.4,NULL,NULL),(1107,'One by Two',2014,110,4.2,NULL,NULL),(1108,'One Day: Justice Delivered',2019,140,5,NULL,NULL),(1109,'One Night Out',2018,130,7,NULL,NULL),(1110,'One Night Stand',2016,130,3.1,NULL,NULL),(1111,'One Two Three',2008,120,5.3,NULL,NULL),(1112,'Oops!',2003,140,3.5,NULL,NULL),(1113,'Out of Control',2003,110,3.3,NULL,NULL),(1114,'Overtime',2012,110,4.8,NULL,NULL),(1115,'Oye Lucky! Lucky Oye!',2008,130,7.7,NULL,NULL),(1116,'P Se PM Tak',2015,140,3.9,NULL,NULL),(1117,'P Se Pyaar F Se Faraar',2019,110,6.8,NULL,NULL),(1118,'Paagalpan',2001,140,6.5,NULL,NULL),(1119,'Paan Singh Tomar',2012,120,8.2,NULL,NULL),(1120,'Paanch',2003,120,7.7,NULL,NULL),(1121,'Paap',2003,130,5.1,NULL,NULL),(1122,'Paapi - Ek Satya Katha',2013,140,3.8,NULL,NULL),(1123,'Paathshaala',2010,130,4.9,NULL,NULL),(1124,'Pad Man',2018,140,7.9,NULL,NULL),(1125,'Padmaavat',2018,110,7,NULL,NULL),(1126,'Padmashree Laloo Prasad Yadav',2005,110,2.4,NULL,NULL),(1127,'Pagalpanti',2019,120,3.2,NULL,NULL),(1128,'Page 3',2005,120,7.3,NULL,NULL),(1129,'Paheli',2005,130,6.5,NULL,NULL),(1130,'Paisa Vasool',2004,140,4.1,NULL,NULL),(1131,'Pal Pal Dil Ke Paas',2019,130,4.6,NULL,NULL),(1132,'Paltan',2018,120,5.3,NULL,NULL),(1133,'Panchlait',2017,130,8.4,NULL,NULL),(1134,'Panipat',2019,140,5.3,NULL,NULL),(1135,'Pankh',2010,140,3.7,NULL,NULL),(1136,'Papa the Great',2000,130,5.5,NULL,NULL),(1137,'Paranthe Wali Gali',2014,120,5,NULL,NULL),(1138,'Parched',2015,110,7.6,NULL,NULL),(1139,'Pareshaan Parinda',2018,130,4.8,NULL,NULL),(1141,'Parineeta',2005,140,7.2,NULL,NULL),(1142,'Parmanu: The Story Of Pokhran',2018,140,7.6,NULL,NULL),(1143,'Partner',2007,140,5.8,NULL,NULL),(1144,'Parwana',2003,140,2.2,NULL,NULL),(1145,'Pataakha',2018,110,7.2,NULL,NULL),(1146,'Patel Ki Punjabi Shaadi',2017,140,4.1,NULL,NULL),(1147,'Patiala House',2011,120,5.6,NULL,NULL),(1148,'Patth',2003,110,4.6,NULL,NULL),(1149,'Payback',2010,110,5.5,NULL,NULL),(1150,'Paying Guests',2009,120,4.2,NULL,NULL),(1151,'Pehchaan: The Face of Truth',2005,110,5.7,NULL,NULL),(1152,'Pehli Nazar Ka Pyaar',2008,140,4.4,NULL,NULL),(1153,'Phamous',2018,120,3.8,NULL,NULL),(1154,'Phantom',2015,120,5.9,NULL,NULL),(1155,'Phas Gaye Re Obama',2010,120,7.5,NULL,NULL),(1156,'Phata Poster Nikhla Hero',2013,110,4.8,NULL,NULL),(1157,'Phhir',2011,130,5,NULL,NULL),(1158,'Phillauri',2017,110,6.1,NULL,NULL),(1159,'Phir Bhi Dil Hai Hindustani',2000,140,6.2,NULL,NULL),(1160,'Phir Hera Pheri',2006,130,7,NULL,NULL),(1161,'Phir Kabhi',2008,110,6.8,NULL,NULL),(1162,'Phir Milenge',2004,110,6.1,NULL,NULL),(1163,'Phobia',2016,140,6.9,NULL,NULL),(1164,'Phoonk',2008,120,3.9,NULL,NULL),(1165,'Phoonk 2',2010,130,3.2,NULL,NULL),(1166,'Photograph',2019,110,6.9,NULL,NULL),(1167,'Pihu',2016,110,6.7,NULL,NULL),(1168,'Piku',2015,130,7.6,NULL,NULL),(1169,'Pinjar',2003,120,8,NULL,NULL),(1170,'Pink',2016,120,8.1,NULL,NULL),(1171,'Pitaah',2002,110,6.3,NULL,NULL),(1172,'Pizza',2014,130,6.2,NULL,NULL),(1173,'PK',2014,140,8.1,NULL,NULL),(1174,'PK Lele A Salesman',2018,130,5.5,NULL,NULL),(1175,'Plan',2004,120,4.1,NULL,NULL),(1176,'Players',2012,130,4.1,NULL,NULL),(1177,'PM Narendra Modi',2019,120,3.1,NULL,NULL),(1178,'Police Force: An Inside Story',2004,130,4.5,NULL,NULL),(1179,'Policegiri',2013,120,4.1,NULL,NULL),(1180,'Popcorn Khao! Mast Ho Jao',2004,140,4,NULL,NULL),(1181,'Poster Boys',2017,120,5.4,NULL,NULL),(1182,'Prague',2013,130,5.6,NULL,NULL),(1183,'Pranaam',2019,130,4.3,NULL,NULL),(1184,'Prassthanam',2019,140,5.9,NULL,NULL),(1185,'Prateeksha',2006,140,5.5,NULL,NULL),(1186,'Prem Kaa Game',2010,140,3.4,NULL,NULL),(1187,'Prem Ratan Dhan Payo',2015,140,4.4,NULL,NULL),(1188,'Purani Jeans',2014,110,6.3,NULL,NULL),(1189,'Pyaar Diwana Hota Hai',2002,120,3.9,NULL,NULL),(1190,'Pyaar Impossible!',2010,110,4.6,NULL,NULL),(1191,'Pyaar Ishq Aur Mohabbat',2001,110,4,NULL,NULL),(1192,'Pyaar Ka Punchnama',2011,140,7.6,NULL,NULL),(1193,'Pyaar Ka Punchnama 2',2015,110,7.2,NULL,NULL),(1194,'Pyaar Ke Side Effects',2006,110,6.7,NULL,NULL),(1195,'Pyaar Mein Twist',2005,120,6.1,NULL,NULL),(1196,'Pyaar Zindagi Hai',2001,120,6.5,NULL,NULL),(1197,'Pyaasa',2002,130,3.3,NULL,NULL),(1198,'Pyar Ki Dhun',2002,140,2.5,NULL,NULL),(1199,'Pyare Mohan',2006,120,3.3,NULL,NULL),(1200,'Qasam Se Qasam Se',2012,140,4,NULL,NULL),(1201,'Qayamat: City Under Threat',2003,130,4.7,NULL,NULL),(1202,'Queen',2013,140,8.2,NULL,NULL),(1203,'R... Rajkumar',2013,110,5.2,NULL,NULL),(1204,'Ra.One',2011,110,4.7,NULL,NULL),(1205,'Raabta',2017,130,5.1,NULL,NULL),(1206,'Raanjhanaa',2013,120,7.6,NULL,NULL),(1207,'Raavan',2010,120,5.4,NULL,NULL),(1208,'Raaz',2002,110,6.5,NULL,NULL),(1209,'Raaz 3: The Third Dimension',2012,110,4,NULL,NULL),(1210,'Raaz Reboot',2016,130,4.4,NULL,NULL),(1211,'Raaz: The Mystery Continues',2009,130,5.6,NULL,NULL),(1212,'Raazi',2018,140,7.8,NULL,NULL),(1213,'Rab Ne Bana Di Jodi',2008,130,7.2,NULL,NULL),(1214,'Rabba Main Kya Karoon',2013,130,4.3,NULL,NULL),(1215,'Race',2008,140,6.7,NULL,NULL),(1216,'Race 2',2013,140,5.4,NULL,NULL),(1217,'Race 3',2018,110,1.9,NULL,NULL),(1218,'Raees',2017,140,6.8,NULL,NULL),(1219,'Raghu More: Bachelor of Hearts',2003,140,4.5,NULL,NULL),(1220,'Raghu Romeo',2003,110,6.9,NULL,NULL),(1221,'Ragini MMS',2011,120,4.9,NULL,NULL),(1222,'Ragini MMS 2',2014,120,3.8,NULL,NULL),(1223,'Rahasya',2015,120,7.6,NULL,NULL),(1224,'Rahul',2001,130,5.4,NULL,NULL),(1225,'Raid',2018,120,7.4,NULL,NULL),(1226,'Raincoat',2004,110,7.6,NULL,NULL),(1227,'Raja Abroadiya',2018,130,4.3,NULL,NULL),(1228,'Raja Bhaiya',2003,120,3.7,NULL,NULL),(1229,'Raja Ko Rani Se Pyar Ho Gaya',2000,110,3.4,NULL,NULL),(1230,'Raja Natwarlal',2014,130,6.1,NULL,NULL),(1231,'Rajjo',2013,110,2.3,NULL,NULL),(1232,'Rajma Chawal',2018,140,5.8,NULL,NULL),(1233,'Raju Chacha',2000,120,5.1,NULL,NULL),(1234,'Rakht',2004,120,3.7,NULL,NULL),(1235,'Rakhtbeej',2012,120,3.1,NULL,NULL),(1236,'Rama Rama Kya Hai Dramaa?',2008,110,3.9,NULL,NULL),(1237,'Ramaa: The Saviour',2010,130,3.4,NULL,NULL),(1238,'Ramaiya Vastavaiya',2013,120,5.7,NULL,NULL),(1239,'Ramayana: The Epic',2010,140,5.9,NULL,NULL),(1240,'Ranchi Diaries',2017,110,7.3,NULL,NULL),(1241,'Rang De Basanti',2006,130,8.1,NULL,NULL),(1242,'Rangeela Raja',2019,110,2.3,NULL,NULL),(1243,'Rangoon',2017,120,5.6,NULL,NULL),(1244,'Rangrezz',2013,130,5.1,NULL,NULL),(1245,'Rann',2010,110,6.9,NULL,NULL),(1246,'Raqeeb',2007,110,4.2,NULL,NULL),(1247,'Rascals',2011,130,2.9,NULL,NULL),(1248,'Ready',2011,140,4.8,NULL,NULL),(1249,'Rebellious Flower',2016,140,6.8,NULL,NULL),(1250,'Red Alert: The War Within',2009,140,6.4,NULL,NULL),(1251,'Red Swastik',2007,120,2.8,NULL,NULL),(1252,'Red: The Dark Side',2007,130,3.3,NULL,NULL),(1253,'Refugee',2000,130,5.4,NULL,NULL),(1254,'Rehnaa Hai Terre Dil Mein',2001,140,7.6,NULL,NULL),(1255,'Revati',2005,130,5.1,NULL,NULL),(1256,'Revolver Rani',2014,140,4.5,NULL,NULL),(1257,'Ribbon',2017,130,6.9,NULL,NULL),(1258,'Right Yaaa Wrong',2010,120,6.4,NULL,NULL),(1259,'Risk',2007,140,6.6,NULL,NULL),(1260,'Riyasat',2014,110,6.4,NULL,NULL),(1261,'Road',2002,120,5.6,NULL,NULL),(1262,'Road to Sangam',2009,110,7.4,NULL,NULL),(1263,'Road, Movie',2009,120,6.8,NULL,NULL),(1264,'Roadside Romeo',2008,120,5.2,NULL,NULL),(1265,'Rock On 2',2016,110,5,NULL,NULL),(1266,'Rock On!!',2008,130,7.7,NULL,NULL),(1267,'Rockstar',2011,110,7.7,NULL,NULL),(1268,'Rocky',2006,140,3.9,NULL,NULL),(1269,'Rocky Handsome',2016,120,6.8,NULL,NULL),(1270,'Rog',2005,140,5.2,NULL,NULL),(1271,'Rok Sako To Rok Lo',2004,130,4.3,NULL,NULL),(1272,'Rokkk',2010,130,4.2,NULL,NULL),(1273,'Romeo Akbar Walter',2019,120,6.6,NULL,NULL),(1274,'Rough Book',2016,130,6.8,NULL,NULL),(1275,'Rowdy Rathore',2012,130,5.7,NULL,NULL),(1276,'Roy',2015,130,3.3,NULL,NULL),(1278,'Rudraksh',2004,140,2.7,NULL,NULL),(1279,'Rukh',2017,140,6.4,NULL,NULL),(1280,'Rules: Pyaar Ka Superhit Formula',2003,130,6.4,NULL,NULL),(1281,'Run',2004,110,4.8,NULL,NULL),(1282,'Rush',2012,140,3.7,NULL,NULL),(1283,'Rustom',2016,140,7.1,NULL,NULL),(1284,'Saala Khadoos',2016,110,7.6,NULL,NULL),(1285,'Saand Ki Aankh',2019,130,7.7,NULL,NULL),(1286,'Saanjh',2017,110,8.2,NULL,NULL),(1287,'Saas Bahu Aur Sensex',2008,140,5.1,NULL,NULL),(1288,'Saat Uchakkey',2016,120,5.7,NULL,NULL),(1290,'Saathiya',2002,130,6.8,NULL,NULL),(1291,'Saawan... The Love Season',2006,110,2.8,NULL,NULL),(1292,'Saawariya',2007,110,5.2,NULL,NULL),(1293,'Saaya',2003,140,5.8,NULL,NULL),(1294,'Sabki Bajegi Band',2015,140,3.5,NULL,NULL),(1295,'Sadda Adda',2012,110,7.1,NULL,NULL),(1296,'Sahi Dhandhe Galat Bande',2011,120,4.8,NULL,NULL),(1297,'Salaam Bacche',2007,120,5.8,NULL,NULL),(1298,'Salaam Namaste',2005,120,6.2,NULL,NULL),(1299,'Sallu ki Shaadi',2017,120,3.6,NULL,NULL),(1300,'Samay: When Time Strikes',2003,110,6.9,NULL,NULL),(1301,'Samrat & Co.',2014,120,6.2,NULL,NULL),(1302,'Sanam Re',2016,130,3.2,NULL,NULL),(1303,'Sanam Teri Kasam',2016,140,7.4,NULL,NULL),(1304,'Sanatta: The Silence',2003,120,7.4,NULL,NULL),(1305,'Sandhya',2003,130,5.8,NULL,NULL),(1306,'Sandwich',2006,120,5.4,NULL,NULL),(1307,'Sanju',2018,110,7.7,NULL,NULL),(1308,'Sankat City',2009,140,6.2,NULL,NULL),(1309,'Santa Banta Pvt Ltd',2016,110,2.8,NULL,NULL),(1310,'Sarbjit',2016,120,7.3,NULL,NULL),(1311,'Sarhad Paar',2006,130,3.9,NULL,NULL),(1312,'Sarkar',2005,130,7.6,NULL,NULL),(1313,'Sarkar 3',2017,130,4.9,NULL,NULL),(1314,'Sarkar Raj',2008,110,6.7,NULL,NULL),(1315,'Satrangee Parachute',2011,130,5.3,NULL,NULL),(1316,'Satta',2003,140,6.8,NULL,NULL),(1317,'Satya 2',2013,140,5.9,NULL,NULL),(1318,'Satyagraha',2013,110,5.9,NULL,NULL),(1319,'Satyameva Jayate',2018,120,5.7,NULL,NULL),(1320,'Say Yes to Love',2012,120,5.5,NULL,NULL),(1321,'Second Hand Husband',2015,110,3.8,NULL,NULL),(1322,'Secret Superstar',2017,140,7.8,NULL,NULL),(1323,'Section 375',2019,140,8.1,NULL,NULL),(1324,'Sehar',2005,140,7.7,NULL,NULL),(1325,'Setters',2019,110,5.3,NULL,NULL),(1327,'Shaadi Ka Laddoo',2004,120,5.1,NULL,NULL),(1328,'Shaadi Karke Phas Gaya Yaar',2006,140,4.1,NULL,NULL),(1329,'Shaadi Ke Side Effects',2014,130,5.6,NULL,NULL),(1330,'Shaadi Mein Zaroor Aana',2017,110,7.6,NULL,NULL),(1331,'Shaadi No. 1',2005,110,3.5,NULL,NULL),(1332,'Shaadi Se Pehle',2006,110,4.1,NULL,NULL),(1333,'Shaadi Teri Bajayenge Hum Band',2018,130,4.9,NULL,NULL),(1334,'Shaandaar',2015,120,3.5,NULL,NULL),(1335,'Shabd',2005,120,5.1,NULL,NULL),(1336,'Shabnam Mausi',2005,130,6.2,NULL,NULL),(1337,'Shabri',2011,140,5.6,NULL,NULL),(1338,'Shagird',2011,110,7.1,NULL,NULL),(1339,'Shaheed-E-Azam',2002,140,6.8,NULL,NULL),(1340,'Shahid',2012,130,8.2,NULL,NULL),(1341,'Shaitan',2011,120,7.2,NULL,NULL),(1342,'Shakal Pe Mat Ja',2011,130,4.9,NULL,NULL),(1343,'Shakalaka Boom Boom',2007,130,2.3,NULL,NULL),(1344,'Shamitabh',2015,130,6.8,NULL,NULL),(1345,'Shanghai',2012,140,7.2,NULL,NULL),(1346,'Sharafat Gayi Tel Lene',2015,140,4.9,NULL,NULL),(1347,'Shararat',2002,110,4.6,NULL,NULL),(1348,'Shart: The Challenge',2004,130,3.5,NULL,NULL),(1349,'Sheen',2004,140,6.2,NULL,NULL),(1350,'Sheesha',2005,140,3.4,NULL,NULL),(1351,'Shikaar',2004,110,4.9,NULL,NULL),(1352,'Shikari',2000,140,4.6,NULL,NULL),(1353,'Shikhar',2005,110,4.9,NULL,NULL),(1354,'Ship of Theseus',2012,110,8.1,NULL,NULL),(1355,'Shirdi Sai Baba',2001,110,4.8,NULL,NULL),(1356,'Shirin Farhad Ki Toh Nikal Padi',2012,120,4.2,NULL,NULL),(1357,'Shiva',2006,120,3.9,NULL,NULL),(1358,'Shivaay',2016,130,6.2,NULL,NULL),(1359,'Shootout at Lokhandwala',2007,140,7.1,NULL,NULL),(1360,'Shootout at Wadala',2013,120,5.9,NULL,NULL),(1361,'Shor in the City',2010,140,7.2,NULL,NULL),(1362,'Shorgul',2016,140,5.7,NULL,NULL),(1363,'Shortcut Romeo',2013,130,2.3,NULL,NULL),(1364,'Shortcut Safari',2016,110,6.4,NULL,NULL),(1365,'Showbiz',2007,110,3.6,NULL,NULL),(1366,'Shree',2013,140,6.3,NULL,NULL),(1367,'Shubh Mangal Savdhan',2017,120,6.9,NULL,NULL),(1368,'Shuddh Desi Romance',2013,110,6,NULL,NULL),(1369,'Shukriya: Till Death Do Us Apart',2004,120,5.1,NULL,NULL),(1370,'Siddharth',2013,120,7.3,NULL,NULL),(1371,'Sikandar',2009,120,6.4,NULL,NULL),(1372,'Silsiilay',2005,120,4,NULL,NULL),(1373,'Simmba',2018,140,5.6,NULL,NULL),(1374,'Simran',2017,130,5.1,NULL,NULL),(1375,'Singh Is Bliing',2015,110,5,NULL,NULL),(1376,'Singh Saab The Great',2013,130,5.6,NULL,NULL),(1377,'Singham',2019,120,5.5,NULL,NULL),(1378,'Singham Returns',2014,140,5.7,NULL,NULL),(1379,'Sitam',2005,130,2.6,NULL,NULL),(1380,'Sixteen',2013,140,6.3,NULL,NULL),(1381,'Snip!',2000,110,4.7,NULL,NULL),(1382,'Soch',2002,120,4.3,NULL,NULL),(1383,'Soch Lo',2010,110,6.5,NULL,NULL),(1384,'Socha Na Tha',2005,140,7.4,NULL,NULL),(1385,'Son Of Sardaar',2012,130,4,NULL,NULL),(1386,'Sonali Cable',2014,110,5.3,NULL,NULL),(1387,'Sonchiriya',2019,130,8.1,NULL,NULL),(1388,'Soni',2018,110,7.2,NULL,NULL),(1389,'Sons of Ram',2012,140,6.7,NULL,NULL),(1390,'Sonu Ke Titu Ki Sweety',2018,120,7.1,NULL,NULL),(1391,'Sooper Se Ooper',2013,110,4.3,NULL,NULL),(1392,'Soorma',2018,130,7.4,NULL,NULL),(1393,'Sorry Bhai!',2008,120,6.1,NULL,NULL),(1394,'Sorry Daddy',2015,120,4.7,NULL,NULL),(1395,'Souten: The Other Woman',2006,130,4.7,NULL,NULL),(1396,'Spark',2014,120,5.9,NULL,NULL),(1397,'Special 26',2013,120,8,NULL,NULL),(1398,'Speed',2007,120,2.9,NULL,NULL),(1399,'Sssshhh...',2003,110,4.4,NULL,NULL),(1400,'Ssukh',2005,110,5,NULL,NULL),(1401,'Stanley Ka Dabba',2011,140,7.8,NULL,NULL),(1402,'Station',2014,130,7.5,NULL,NULL),(1403,'Staying Alive',2012,110,5.6,NULL,NULL),(1404,'Stop!',2004,130,4.4,NULL,NULL),(1406,'Stree',2018,140,7.6,NULL,NULL),(1407,'Striker',2010,120,6.9,NULL,NULL),(1408,'Strings of Passion',2014,140,6.5,NULL,NULL),(1409,'Student of the Year',2012,120,5.3,NULL,NULL),(1410,'Student of the Year 2',2019,110,2.2,NULL,NULL),(1411,'Stumped',2003,120,2.6,NULL,NULL),(1412,'Style',2001,120,6.7,NULL,NULL),(1413,'Sui Dhaaga',2018,110,6.8,NULL,NULL),(1414,'Sulemani Keeda',2014,110,7.1,NULL,NULL),(1415,'Sultaan',2000,120,5.6,NULL,NULL),(1416,'Sultan',2016,120,7,NULL,NULL),(1417,'Summer 2007',2008,130,6.2,NULL,NULL),(1418,'Sunday',2008,140,5.3,NULL,NULL),(1419,'Sunglass',2013,130,5.4,NULL,NULL),(1420,'Suno Sasurjee',2004,140,2.5,NULL,NULL),(1421,'Supari',2003,130,4.3,NULL,NULL),(1422,'Super 30',2019,120,8,NULL,NULL),(1423,'Super Model',2013,140,1.9,NULL,NULL),(1424,'Super Nani',2014,120,4.6,NULL,NULL),(1425,'Superstar',2008,110,6,NULL,NULL),(1426,'Surya',2004,110,5.6,NULL,NULL),(1427,'Swades',2004,120,8.2,NULL,NULL),(1428,'Swami',2007,130,6.8,NULL,NULL),(1429,'Sweetiee Weds NRI',2017,140,3.4,NULL,NULL),(1430,'Ta Ra Rum Pum',2007,140,5.6,NULL,NULL),(1431,'Taarzan: The Wonder Car',2004,130,4.5,NULL,NULL),(1432,'Table No. 21',2013,110,7.2,NULL,NULL),(1433,'Tada',2003,140,4.7,NULL,NULL),(1434,'Taj Mahal: A Monument of Love',2003,110,6.7,NULL,NULL),(1435,'Taj Mahal: An Eternal Love Story',2005,120,5,NULL,NULL),(1436,'Take It Easy',2015,130,7.4,NULL,NULL),(1437,'Talaash: The Hunt Begins...',2003,120,4.7,NULL,NULL),(1438,'Talvar',2015,140,8.2,NULL,NULL),(1439,'Tamasha',2015,110,7.3,NULL,NULL),(1440,'Tamboo Mein Bamoo',2001,130,6.5,NULL,NULL),(1441,'Tango Charlie',2005,130,6,NULL,NULL),(1442,'Tanu Weds Manu',2011,110,6.8,NULL,NULL),(1443,'Tanu Weds Manu Returns',2015,120,7.6,NULL,NULL),(1444,'Tapish',2000,130,6,NULL,NULL),(1446,'Tarkieb',2000,140,5,NULL,NULL),(1447,'Tashan',2008,120,3.9,NULL,NULL),(1448,'Tathastu',2006,140,4.4,NULL,NULL),(1449,'Te3n',2016,130,7.3,NULL,NULL),(1450,'Teen Patti',2010,130,4.1,NULL,NULL),(1451,'Teen Thay Bhai',2011,120,4.2,NULL,NULL),(1452,'Tees Maar Khan',2010,140,2.6,NULL,NULL),(1453,'Teesri Aankh: The Hidden Camera',2006,110,2.6,NULL,NULL),(1454,'Tehzeeb',2003,140,5.9,NULL,NULL),(1455,'Tell Me O Kkhuda',2011,130,2.5,NULL,NULL),(1456,'Tera Intezaar',2017,110,1.8,NULL,NULL),(1457,'Tera Jadoo Chal Gayaa',2000,110,3,NULL,NULL),(1458,'Tera Kya Hoga Johnny',2009,130,6,NULL,NULL),(1459,'Tera Mera Saath Rahen',2001,140,4.9,NULL,NULL),(1460,'Teraa Surroor',2016,140,2.6,NULL,NULL),(1461,'Tere Bin Laden',2010,110,7.2,NULL,NULL),(1462,'Tere Bin Laden: Dead or Alive',2016,110,4.3,NULL,NULL),(1463,'Tere Liye',2001,110,5.3,NULL,NULL),(1464,'Tere Mere Phere',2011,140,5.3,NULL,NULL),(1465,'Tere Naal Love Ho Gaya',2012,130,5.8,NULL,NULL),(1466,'Teri Meri Kahaani',2012,140,4.7,NULL,NULL),(1467,'Tevar',2015,130,4,NULL,NULL),(1469,'Tezz',2012,110,3.9,NULL,NULL),(1470,'Thackeray',2019,130,5.2,NULL,NULL),(1471,'Thank You',2011,110,4.7,NULL,NULL),(1472,'Thanks Maa',2009,140,7.9,NULL,NULL),(1473,'That Girl in Yellow Boots',2010,120,6.7,NULL,NULL),(1474,'The Accidental Prime Minister',2019,140,6,NULL,NULL),(1476,'The Blue Umbrella',2005,140,7.4,NULL,NULL),(1477,'The Blueberry Hunt',2016,130,5.6,NULL,NULL),(1479,'The Dirty Picture',2011,120,6.6,NULL,NULL),(1480,'The Fakir of Venice',2009,110,5.1,NULL,NULL),(1481,'The Film',2005,110,6.4,NULL,NULL),(1482,'The Film Emotional Atyachar',2010,130,6,NULL,NULL),(1483,'The Final Exit',2017,120,6.2,NULL,NULL),(1484,'The Ghazi Attack',2017,130,7.6,NULL,NULL),(1485,'The Hero: Love Story of a Spy',2003,110,5.3,NULL,NULL),(1486,'The House Next Door',2017,140,6.8,NULL,NULL),(1487,'The Journey of Karma',2018,120,6.6,NULL,NULL),(1488,'The Legend of Bhagat Singh',2002,130,8.1,NULL,NULL),(1489,'The Lift Boy',2019,110,7.2,NULL,NULL),(1490,'The Lunchbox',2013,130,7.8,NULL,NULL),(1491,'The Past',2018,130,3.5,NULL,NULL),(1492,'The Prince of Light',2000,120,6.8,NULL,NULL),(1493,'The Revenge: Geeta Mera Naam',2000,130,2.9,NULL,NULL),(1494,'The Shaukeens',2014,140,4.9,NULL,NULL),(1495,'The Silent Heroes',2015,140,6.4,NULL,NULL),(1496,'The Sky Is Pink',2019,120,7.6,NULL,NULL),(1497,'The Stoneman Murders',2009,120,7.4,NULL,NULL),(1498,'The Tashkent Files',2019,130,7.8,NULL,NULL),(1499,'The Train',2011,130,4.4,NULL,NULL),(1500,'The Unsound',2013,140,4.6,NULL,NULL),(1501,'The Window',2018,140,7,NULL,NULL),(1502,'The Zoya Factor',2019,140,4.2,NULL,NULL),(1503,'Thoda Lutf Thoda Ishq',2015,110,4.1,NULL,NULL),(1504,'Thoda Pyaar Thoda Magic',2008,130,4.9,NULL,NULL),(1505,'Thoda Tum Badlo Thoda Hum',2004,140,4.6,NULL,NULL),(1506,'Thodi Life Thoda Magic',2008,140,3.9,NULL,NULL),(1507,'Thodi Thodi Si Manmaaniyan',2017,110,5.9,NULL,NULL),(1508,'Three: Love, Lies, Betrayal',2009,130,5.8,NULL,NULL),(1509,'Thugs of Hindostan',2018,110,4.1,NULL,NULL),(1510,'Tiger Zinda Hai',2017,120,5.9,NULL,NULL),(1511,'Time Out',2015,120,5.9,NULL,NULL),(1512,'Time Pass',2005,120,4.1,NULL,NULL),(1513,'Titli',2014,110,7.6,NULL,NULL),(1514,'Titoo MBA',2014,120,4.3,NULL,NULL),(1515,'Toh Baat Pakki!',2010,140,5.1,NULL,NULL),(1516,'Topless',2005,130,2.6,NULL,NULL),(1517,'Total Dhamaal',2019,110,4.2,NULL,NULL),(1518,'Total Siyapaa',2014,130,5,NULL,NULL),(1519,'Traffic',2016,140,6.7,NULL,NULL),(1520,'Traffic Signal',2007,110,6.5,NULL,NULL),(1521,'Trapped',2016,110,7.6,NULL,NULL),(1522,'Trump Card',2010,110,3,NULL,NULL),(1523,'Tu Bal Bramhachari Main Hoon Kanya Kunwari',2003,120,4.7,NULL,NULL),(1524,'Tubelight',2017,130,3.8,NULL,NULL),(1525,'Tujhe Meri Kasam',2003,130,6.4,NULL,NULL),(1526,'Tum Bin 2',2016,120,4.8,NULL,NULL),(1527,'Tum Mile',2009,140,5,NULL,NULL),(1528,'Tum Milo Toh Sahi',2010,120,5.6,NULL,NULL),(1529,'Tum Se Achcha Kaun Hai',2002,140,4.6,NULL,NULL),(1530,'Tumbbad',2018,120,8.3,NULL,NULL),(1531,'Tumhari Sulu',2017,140,7,NULL,NULL),(1532,'Tumko Na Bhool Paayenge',2002,110,5.6,NULL,NULL),(1533,'Tune Mera Dil Le Liyaa',2000,140,3.4,NULL,NULL),(1534,'Turning 30!!!',2011,140,5.1,NULL,NULL),(1535,'Tutak Tutak Tutiya',2016,130,5.5,NULL,NULL),(1536,'U Me Aur Hum',2008,110,5.9,NULL,NULL),(1537,'U R My Jaan',2011,110,5.8,NULL,NULL),(1538,'U, Bomsi n Me',2005,140,6.9,NULL,NULL),(1539,'U, Me Aur Ghar',2017,110,6.6,NULL,NULL),(1540,'Udaan',2010,130,8.1,NULL,NULL),(1541,'Udta Punjab',2016,140,7.8,NULL,NULL),(1542,'Ugly',2013,110,8,NULL,NULL),(1543,'Ugly Aur Pagli',2008,120,3.7,NULL,NULL),(1544,'Umar',2006,120,5.5,NULL,NULL),(1545,'Umrao Jaan',2006,130,5.5,NULL,NULL),(1546,'Umrika',2015,130,6.6,NULL,NULL),(1547,'Ungli',2014,140,5.7,NULL,NULL),(1548,'Union Leader',2017,120,7.3,NULL,NULL),(1549,'United Six',2011,120,3.9,NULL,NULL),(1550,'Uri: The Surgical Strike',2018,130,8.2,NULL,NULL),(1551,'Utt Pataang',2011,130,6,NULL,NULL),(1552,'Utthaan',2006,140,4.1,NULL,NULL),(1553,'Uvaa',2015,140,4.9,NULL,NULL),(1554,'Vaada',2005,110,5.6,NULL,NULL),(1555,'Vaah! Life Ho Toh Aisi!',2005,120,4.5,NULL,NULL),(1556,'Vaastu Shastra',2004,110,5,NULL,NULL),(1557,'Valentine Days',2003,140,1.9,NULL,NULL),(1558,'Valentine\'s Night',2012,120,2.3,NULL,NULL),(1559,'Veer',2010,140,4.5,NULL,NULL),(1560,'Veer Savarkar',2001,120,6.8,NULL,NULL),(1561,'Veer-Zaara',2004,120,7.8,NULL,NULL),(1562,'Veerappan',2016,110,5.3,NULL,NULL),(1563,'Veere Di Wedding',2018,140,3.2,NULL,NULL),(1564,'Veerey Ki Wedding',2018,110,2.8,NULL,NULL),(1565,'Via Darjeeling',2008,130,5.4,NULL,NULL),(1566,'Vicky Donor',2012,130,7.8,NULL,NULL),(1567,'Victory',2009,110,3.8,NULL,NULL),(1568,'Viruddh... Family Comes First',2005,130,7.1,NULL,NULL),(1569,'Vishwaroopam',2013,120,8.1,NULL,NULL),(1570,'Vivah',2006,110,6.6,NULL,NULL),(1571,'Vodka Diaries',2018,120,5.6,NULL,NULL),(1572,'W',2014,110,6.6,NULL,NULL),(1573,'Waah! Tera Kya Kehna',2002,120,3.7,NULL,NULL),(1574,'Wafaa',2008,140,3.7,NULL,NULL),(1575,'Wah Taj',2016,120,5.4,NULL,NULL),(1576,'Waiting',2015,110,7.2,NULL,NULL),(1577,'Wajah Tum Ho',2016,130,4.4,NULL,NULL),(1578,'Wajahh: A Reason to Kill',2004,130,4.3,NULL,NULL),(1579,'Wake Up India',2013,130,6.7,NULL,NULL),(1580,'Wake Up Sid',2009,120,7.6,NULL,NULL),(1581,'Wanted',2009,130,6.6,NULL,NULL),(1582,'Waqt: The Race Against Time',2005,140,6.8,NULL,NULL),(1583,'War',2019,120,6.5,NULL,NULL),(1584,'War Chhod Na Yaar',2013,140,5.4,NULL,NULL),(1585,'Warning',2013,110,4.6,NULL,NULL),(1586,'Wazir',2016,140,7.1,NULL,NULL),(1587,'We Are Family',2010,110,5.6,NULL,NULL),(1588,'Wedding Anniversary',2017,130,4.9,NULL,NULL),(1589,'Wedding Pullav',2015,120,3.8,NULL,NULL),(1590,'Welcome',2007,120,6.9,NULL,NULL),(1591,'Welcome 2 Karachi',2015,130,4.3,NULL,NULL),(1592,'Welcome Back',2015,140,4.2,NULL,NULL),(1593,'Welcome To New York',2018,130,1.6,NULL,NULL),(1594,'Welcome to Sajjanpur',2008,110,6.9,NULL,NULL),(1595,'What the Fish',2013,120,5,NULL,NULL),(1596,'What\'s Your Raashee?',2009,140,4.6,NULL,NULL),(1597,'When Obama Loved Osama',2018,140,4.9,NULL,NULL),(1598,'Why Cheat India',2019,130,6,NULL,NULL),(1599,'Woh',2013,130,7.1,NULL,NULL),(1600,'Woh Lamhe...',2006,120,6.4,NULL,NULL),(1601,'Woodstock Villa',2008,120,3.3,NULL,NULL),(1602,'Xcuse Me',2003,110,5.7,NULL,NULL),(1603,'Ya Rab',2014,120,5.9,NULL,NULL),(1604,'Yaara Silly Silly',2015,110,5.6,NULL,NULL),(1605,'Yaariyan',2014,130,2.7,NULL,NULL),(1606,'Yakeen',2005,110,5.1,NULL,NULL),(1607,'Yamla Pagla Deewana 2',2013,140,3.4,NULL,NULL),(1608,'Yatra',2006,130,6.4,NULL,NULL),(1609,'Yea Toh Two Much Ho Gayaa',2016,110,3.4,NULL,NULL),(1610,'Yeh Dil',2003,120,3.9,NULL,NULL),(1611,'Yeh Dil Aashiqanaa',2002,130,4.3,NULL,NULL),(1612,'Yeh Dooriyan',2011,140,4.7,NULL,NULL),(1613,'Yeh Faasley',2011,110,5.8,NULL,NULL),(1614,'Yeh Hai Bakrapur',2014,140,3.6,NULL,NULL),(1615,'Yeh Hai Jalwa',2002,140,4.7,NULL,NULL),(1616,'Yeh Jawaani Hai Deewani',2013,110,7.1,NULL,NULL),(1617,'Yeh Kaisi Mohabbat',2002,110,3.8,NULL,NULL),(1618,'Yeh Khula Aasmaan',2012,140,6.8,NULL,NULL),(1619,'Yeh Kya Ho Raha Hai?',2002,120,4.6,NULL,NULL),(1620,'Yeh Lamhe Judaai Ke',2004,140,3.7,NULL,NULL),(1621,'Yeh Mohabbat Hai',2002,130,5,NULL,NULL),(1622,'Yeh Raaste Hain Pyaar Ke',2001,130,4.1,NULL,NULL),(1623,'Yeh Saali Zindagi',2011,120,7.5,NULL,NULL),(1624,'Yeh Zindagi Ka Safar',2001,140,3,NULL,NULL),(1625,'Yehi Hai Zindagi',2005,120,5.4,NULL,NULL),(1626,'Youngistaan',2014,110,5.1,NULL,NULL),(1627,'Yuva',2004,110,7.4,NULL,NULL),(1628,'Yuvvraaj',2008,130,4.1,NULL,NULL),(1629,'Zameen',2003,130,5.3,NULL,NULL),(1630,'Zanjeer',2013,120,3.2,NULL,NULL),(1631,'Zed Plus',2014,120,6.4,NULL,NULL),(1632,'Zeher',2005,130,5.4,NULL,NULL),(1633,'Zero',2018,110,5.4,NULL,NULL),(1634,'Zid',2014,130,4.4,NULL,NULL),(1635,'Zila Ghaziabad',2013,130,3.6,NULL,NULL),(1636,'Zinda',2006,140,4.9,NULL,NULL),(1637,'Zindaggi Rocks',2006,110,4,NULL,NULL),(1638,'Zindagi Khoobsoorat Hai',2002,140,5.5,NULL,NULL),(1639,'Zindagi Na Milegi Dobara',2011,130,8.2,NULL,NULL),(1640,'Zindagi Tere Naam',2012,110,4.4,NULL,NULL),(1641,'Zindagi Zindabad',2000,110,5.7,NULL,NULL),(1642,'Zokkomon',2011,140,4,NULL,NULL),(1643,'Zoo',2018,120,5.7,NULL,NULL),(1644,'Zubaan',2015,120,6.1,NULL,NULL),(1645,'Zubeidaa',2001,110,6.2,NULL,NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `genre_id_fk_idx` (`genre_id`),
  CONSTRAINT `genre_id_fk` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  CONSTRAINT `movie_id_fk` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_reviews`
--

DROP TABLE IF EXISTS `movie_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_reviews` (
  `movie_id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  KEY `movie_id_idx` (`movie_id`),
  CONSTRAINT `movie_id_mr` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_reviews`
--

LOCK TABLES `movie_reviews` WRITE;
/*!40000 ALTER TABLE `movie_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_stars`
--

DROP TABLE IF EXISTS `movie_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_stars` (
  `movie_id` int(11) NOT NULL,
  `star_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`star_id`),
  KEY `star_id_idx` (`star_id`),
  CONSTRAINT `movie_id_ms` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `star_id` FOREIGN KEY (`star_id`) REFERENCES `stars` (`star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_stars`
--

LOCK TABLES `movie_stars` WRITE;
/*!40000 ALTER TABLE `movie_stars` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_stars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_theaters`
--

DROP TABLE IF EXISTS `movie_theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_theaters` (
  `total_sales` int(11) DEFAULT NULL,
  `movie_id` int(11) NOT NULL,
  `theater_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`theater_id`),
  KEY `theater_id_idx` (`theater_id`),
  CONSTRAINT `movie_id_mt` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `theater_id_mt` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_theaters`
--

LOCK TABLES `movie_theaters` WRITE;
/*!40000 ALTER TABLE `movie_theaters` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen_shows`
--

DROP TABLE IF EXISTS `screen_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_shows` (
  `screen_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `ticket_price` int(11) DEFAULT NULL,
  `ticket_sold` int(11) DEFAULT NULL,
  PRIMARY KEY (`screen_id`,`movie_id`,`show_id`),
  KEY `movie_id_ss_idx` (`movie_id`),
  KEY `show_time_fk_idx` (`show_id`),
  CONSTRAINT `movie_id_ss` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `screen_id_ss` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`screen_id`),
  CONSTRAINT `show_id_ss` FOREIGN KEY (`show_id`) REFERENCES `show_timings` (`show_timing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_shows`
--

LOCK TABLES `screen_shows` WRITE;
/*!40000 ALTER TABLE `screen_shows` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen_shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screens` (
  `screen_id` int(11) NOT NULL,
  `capacity` varchar(45) DEFAULT NULL,
  `theater_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`screen_id`),
  UNIQUE KEY `idScreens_UNIQUE` (`screen_id`),
  KEY `theater_id_sc_idx` (`theater_id`),
  CONSTRAINT `theater_id_sc` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_timings`
--

DROP TABLE IF EXISTS `show_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `show_timings` (
  `show_timing_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  PRIMARY KEY (`show_timing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_timings`
--

LOCK TABLES `show_timings` WRITE;
/*!40000 ALTER TABLE `show_timings` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stars`
--

DROP TABLE IF EXISTS `stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stars` (
  `star_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  PRIMARY KEY (`star_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stars`
--

LOCK TABLES `stars` WRITE;
/*!40000 ALTER TABLE `stars` DISABLE KEYS */;
/*!40000 ALTER TABLE `stars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theaters` (
  `theater_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `screens` int(11) DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`theater_id`),
  KEY `city_id_idx` (`city_id`),
  CONSTRAINT `city_id_fk` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet_mentions`
--

DROP TABLE IF EXISTS `tweet_mentions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_mentions` (
  `tweet_id` bigint(20) NOT NULL,
  `source_user` varchar(45) NOT NULL,
  `target_user` varchar(45) NOT NULL,
  KEY `tweet_id_idx` (`tweet_id`),
  CONSTRAINT `tweet_id` FOREIGN KEY (`tweet_id`) REFERENCES `twitter_tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_mentions`
--

LOCK TABLES `tweet_mentions` WRITE;
/*!40000 ALTER TABLE `tweet_mentions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweet_mentions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet_tags`
--

DROP TABLE IF EXISTS `tweet_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_tags` (
  `tweet_id` bigint(20) NOT NULL,
  `tag` varchar(45) DEFAULT NULL,
  KEY `tag` (`tweet_id`),
  CONSTRAINT `tag` FOREIGN KEY (`tweet_id`) REFERENCES `twitter_tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_tags`
--

LOCK TABLES `tweet_tags` WRITE;
/*!40000 ALTER TABLE `tweet_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweet_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet_url`
--

DROP TABLE IF EXISTS `tweet_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_url` (
  `tweet_id` bigint(20) NOT NULL,
  `tweet_url` varchar(100) NOT NULL,
  UNIQUE KEY `tweet_url_UNIQUE` (`tweet_url`),
  KEY `tweet_id_idx` (`tweet_id`),
  CONSTRAINT `tweet_id_url` FOREIGN KEY (`tweet_id`) REFERENCES `twitter_tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_url`
--

LOCK TABLES `tweet_url` WRITE;
/*!40000 ALTER TABLE `tweet_url` DISABLE KEYS */;
INSERT INTO `tweet_url` VALUES (1590744153830617088,'https://twitter.com/kremlila'),(1590744489563680768,'https://twitter.com/afaiksam'),(1590755663755771905,'https://twitter.com/Sahejpatil1'),(1590763497264394242,'https://twitter.com/oHeYbXXwkqUKf4V'),(1590764117258047488,'https://twitter.com/shind_haruaki'),(1590767014897135617,'https://twitter.com/BMXCinema');
/*!40000 ALTER TABLE `tweet_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_tweets`
--

DROP TABLE IF EXISTS `twitter_tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_tweets` (
  `tweet_id` bigint(20) NOT NULL,
  `twitter_handle` varchar(45) CHARACTER SET armscii8 DEFAULT NULL,
  `twitter_text` varchar(500) DEFAULT NULL,
  `profile_image_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4) ON UPDATE CURRENT_TIMESTAMP(4),
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tweet_id`),
  KEY `twitter_handle_idx` (`twitter_handle`),
  KEY `movie_id_tweets_idx` (`movie_id`),
  CONSTRAINT `movie_id_tweets` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_tweets`
--

LOCK TABLES `twitter_tweets` WRITE;
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
INSERT INTO `twitter_tweets` VALUES (1590744153830617088,'kremlila','Avengers End Game izlemeye gidiyorum mendillerim hazır , filmden sonra Iron Men editlerini izlemek için telefonum hazır.','https://pbs.twimg.com/profile_images/1589569054850809856/slToRWbd_normal.jpg','2022-11-10 21:32:15.0000',1),(1590744489563680768,'afaiksam','@g99s_ @NathouH @Dika10k End Game avengers','https://pbs.twimg.com/profile_images/1590753387544461312/NVWsdzMW_normal.jpg','2022-11-10 21:33:35.0000',1),(1590755663755771905,'Sahejpatil1','#AvengersEndGame day 1 was 53 creores\n#AvengersInfinityWar day 1 collection is 34 crores\n#SpiderManNoWayHome day 1 was 32 crore\n#DoctorStrangeInTheMultiverseOfMadness day 1 was 26 crore\n\nWhat was day 1 of #WakandaForever collection in india ???','https://pbs.twimg.com/profile_images/1589654976196116485/HLWnMNi6_normal.jpg','2022-11-10 22:17:59.0000',1),(1590763497264394242,'oHeYbXXwkqUKf4V','I LOVE marvel &amp; DC?????❤️\n #InfinityWar #Marvel #BlackPanther    #Thanos #IronMan #Hulk    #CaptainAmerica #WinterSoldier #TheBatman #Punisher #DrStrange #Spiderman #MoonKnight\n #Hawkeye #WakandaForever    #AvengersEndGame #Avengers #TheFalconandtheWintoldier https://t.co/SAVVOPgTyc','https://pbs.twimg.com/profile_images/1546947127028613120/aY1Oqrx8_normal.jpg','2022-11-10 22:49:07.0000',1),(1590764117258047488,'shind_haruaki','I LOVE marvel &amp; DC?????❤️\n #InfinityWar #Marvel #BlackPanther    #Thanos #IronMan #Hulk    #CaptainAmerica #WinterSoldier #TheBatman #Punisher #DrStrange #Spiderman #MoonKnight\n #Hawkeye #WakandaForever    #AvengersEndGame #Avengers #TheFalconandtheWintoldier https://t.co/SLnfxvbPrJ','https://pbs.twimg.com/profile_images/1546914963637567488/96olt_Nk_normal.jpg','2022-11-10 22:51:35.0000',1),(1590767014897135617,'BMXCinema','Tras el estreno de la secuela de #BlackPanther, así queda mi Top 5 de películas de #MarvelStudios:\n\n?1.  #AvengersInfinityWar \n?2. #CaptainAmericaWinterSoldier\n?3. #WakandaForever \n?4. #AvengersEndGame \n?5. #Eternals\n\n¿Cuá es el tuyo? https://t.co/smI3CqPilO','https://pbs.twimg.com/profile_images/1478476017299775488/izcHFhOM_normal.jpg','2022-11-10 23:03:06.0000',1);
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_user`
--

DROP TABLE IF EXISTS `twitter_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_user` (
  `twitter_handle` varchar(30) CHARACTER SET utf8 NOT NULL,
  `name` varchar(80) NOT NULL,
  `profile_image_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `followers_count` int(11) NOT NULL,
  `following_count` int(11) NOT NULL,
  PRIMARY KEY (`twitter_handle`),
  UNIQUE KEY `twitter_handle_UNIQUE` (`twitter_handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_user`
--

LOCK TABLES `twitter_user` WRITE;
/*!40000 ALTER TABLE `twitter_user` DISABLE KEYS */;
INSERT INTO `twitter_user` VALUES ('afaiksam','سام ☥','https://pbs.twimg.com/profile_images/1590753387544461312/NVWsdzMW_normal.jpg','sensationnel',353,227),('BMXCinema','BMX Cinema','https://pbs.twimg.com/profile_images/1478476017299775488/izcHFhOM_normal.jpg','¡¡ Luces, cámara y palomitas !! .?. ? . ?. \nBrújula MX | Contacto: brujulamex@gmail.com\n#BlackAdam, #CobraKai, #StrangerThings, #WakandaForever',5256,619),('kremlila','Habiş','https://pbs.twimg.com/profile_images/1589569054850809856/slToRWbd_normal.jpg','İCÜ ?\n\n-777-',1597,1485),('oHeYbXXwkqUKf4V','グミグルーヴ/GUME GROOVE','https://pbs.twimg.com/profile_images/1546947127028613120/aY1Oqrx8_normal.jpg','#Marvel #DC #MCU #DCEU #マーベル アメコミ YouTuber  UUUM アミューズ 電気グルーヴ DENKIGROOVE \n?裏垢 ㊙️裏アカウント \n\n31entertainment career',883,1400),('Sahejpatil1','sahej patil','https://pbs.twimg.com/profile_images/1589654976196116485/HLWnMNi6_normal.jpg','memes,review,roast,comedy,theatre reaction',1,42),('shind_haruaki','進藤晴秋/SINDOU HARUAKI','https://pbs.twimg.com/profile_images/1546914963637567488/96olt_Nk_normal.jpg','#Marvel #DC #MCU #DCEU #マーベル⊿ アメコミオタク アメコミ マーベルオタク DCオタク 乃木坂46 日向坂46    ?裏垢 ㊙️裏アカウント\n\n31entertainment career',1724,980);
/*!40000 ALTER TABLE `twitter_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'movie_ticket_reservation'
--

--
-- Dumping routines for database 'movie_ticket_reservation'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 13:24:46
