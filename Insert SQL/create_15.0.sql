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
-- Temporary view structure for view `_max_movie_releases`
--

DROP TABLE IF EXISTS `_max_movie_releases`;
/*!50001 DROP VIEW IF EXISTS `_max_movie_releases`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `_max_movie_releases` AS SELECT 
 1 AS `top_actors`,
 1 AS `name`,
 1 AS `released_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `avg_rating_comedy`
--

DROP TABLE IF EXISTS `avg_rating_comedy`;
/*!50001 DROP VIEW IF EXISTS `avg_rating_comedy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `avg_rating_comedy` AS SELECT 
 1 AS `Average_Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `best_movie`
--

DROP TABLE IF EXISTS `best_movie`;
/*!50001 DROP VIEW IF EXISTS `best_movie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `best_movie` AS SELECT 
 1 AS `name`,
 1 AS `max(m.rating)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `screen_shows_id` int(11) DEFAULT NULL,
  `tickets_booked` int(11) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `screen_shows_fk_idx` (`screen_shows_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `screen_shows_fk` FOREIGN KEY (`screen_shows_id`) REFERENCES `screen_shows` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `idCity_UNIQUE` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `diff_ticket_prices`
--

DROP TABLE IF EXISTS `diff_ticket_prices`;
/*!50001 DROP VIEW IF EXISTS `diff_ticket_prices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `diff_ticket_prices` AS SELECT 
 1 AS `COUNT(ss.screen_id)`,
 1 AS `MAX(ss.ticket_price)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `drama_good_ratings_movies`
--

DROP TABLE IF EXISTS `drama_good_ratings_movies`;
/*!50001 DROP VIEW IF EXISTS `drama_good_ratings_movies`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `drama_good_ratings_movies` AS SELECT 
 1 AS `name`,
 1 AS `released_year`,
 1 AS `rating`,
 1 AS `genre`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `highest_positive_tweet_movie`
--

DROP TABLE IF EXISTS `highest_positive_tweet_movie`;
/*!50001 DROP VIEW IF EXISTS `highest_positive_tweet_movie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highest_positive_tweet_movie` AS SELECT 
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highest_rating_genre`
--

DROP TABLE IF EXISTS `highest_rating_genre`;
/*!50001 DROP VIEW IF EXISTS `highest_rating_genre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highest_rating_genre` AS SELECT 
 1 AS `genre`,
 1 AS `genre_id`,
 1 AS `MAX(m.rating)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highest_retweets_movie`
--

DROP TABLE IF EXISTS `highest_retweets_movie`;
/*!50001 DROP VIEW IF EXISTS `highest_retweets_movie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highest_retweets_movie` AS SELECT 
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `least_sales_theaters`
--

DROP TABLE IF EXISTS `least_sales_theaters`;
/*!50001 DROP VIEW IF EXISTS `least_sales_theaters`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `least_sales_theaters` AS SELECT 
 1 AS `name`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `least_tweets_movie`
--

DROP TABLE IF EXISTS `least_tweets_movie`;
/*!50001 DROP VIEW IF EXISTS `least_tweets_movie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `least_tweets_movie` AS SELECT 
 1 AS `name`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `maximum_bookings`
--

DROP TABLE IF EXISTS `maximum_bookings`;
/*!50001 DROP VIEW IF EXISTS `maximum_bookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `maximum_bookings` AS SELECT 
 1 AS `name`,
 1 AS `user_id`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `min_runtime`
--

DROP TABLE IF EXISTS `min_runtime`;
/*!50001 DROP VIEW IF EXISTS `min_runtime`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `min_runtime` AS SELECT 
 1 AS `NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_booked_date`
--

DROP TABLE IF EXISTS `most_booked_date`;
/*!50001 DROP VIEW IF EXISTS `most_booked_date`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_booked_date` AS SELECT 
 1 AS `created_at`,
 1 AS `tickets_booked`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_hit_by_priyanka`
--

DROP TABLE IF EXISTS `most_hit_by_priyanka`;
/*!50001 DROP VIEW IF EXISTS `most_hit_by_priyanka`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_hit_by_priyanka` AS SELECT 
 1 AS `name`,
 1 AS `released_year`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_mentions`
--

DROP TABLE IF EXISTS `most_mentions`;
/*!50001 DROP VIEW IF EXISTS `most_mentions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_mentions` AS SELECT 
 1 AS `name`,
 1 AS `all_mentions`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_negative_reviews`
--

DROP TABLE IF EXISTS `most_negative_reviews`;
/*!50001 DROP VIEW IF EXISTS `most_negative_reviews`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_negative_reviews` AS SELECT 
 1 AS `name`,
 1 AS `sentiment`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_tweet_tags_movie`
--

DROP TABLE IF EXISTS `most_tweet_tags_movie`;
/*!50001 DROP VIEW IF EXISTS `most_tweet_tags_movie`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_tweet_tags_movie` AS SELECT 
 1 AS `name`,
 1 AS `COUNT(tt.tag)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `most_tweets`
--

DROP TABLE IF EXISTS `most_tweets`;
/*!50001 DROP VIEW IF EXISTS `most_tweets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `most_tweets` AS SELECT 
 1 AS `name`,
 1 AS `tweet_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `released_year` int(11) DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `movie_actors`
--

DROP TABLE IF EXISTS `movie_actors`;
/*!50001 DROP VIEW IF EXISTS `movie_actors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movie_actors` AS SELECT 
 1 AS `actor`,
 1 AS `name`,
 1 AS `released_year`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `movie_max_bookings`
--

DROP TABLE IF EXISTS `movie_max_bookings`;
/*!50001 DROP VIEW IF EXISTS `movie_max_bookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movie_max_bookings` AS SELECT 
 1 AS `name`,
 1 AS `released_year`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `movie_max_screens`
--

DROP TABLE IF EXISTS `movie_max_screens`;
/*!50001 DROP VIEW IF EXISTS `movie_max_screens`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movie_max_screens` AS SELECT 
 1 AS `name`,
 1 AS `released_year`,
 1 AS `totalScreens`*/;
SET character_set_client = @saved_cs_client;

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
-- Table structure for table `screen_shows`
--

DROP TABLE IF EXISTS `screen_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `screen_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `show_timing_id` int(11) DEFAULT NULL,
  `ticket_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id_ss_idx` (`movie_id`),
  KEY `show_time_fk_idx` (`show_timing_id`),
  KEY `screen_id_ss` (`screen_id`),
  CONSTRAINT `movie_id_ss` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `screen_id_ss` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`screen_id`),
  CONSTRAINT `show_id_ss` FOREIGN KEY (`show_timing_id`) REFERENCES `show_timings` (`show_timing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screens` (
  `screen_id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `theater_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`screen_id`),
  UNIQUE KEY `idScreens_UNIQUE` (`screen_id`),
  KEY `theater_id_sc_idx` (`theater_id`),
  CONSTRAINT `theater_id_sc` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`theater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `screens_city`
--

DROP TABLE IF EXISTS `screens_city`;
/*!50001 DROP VIEW IF EXISTS `screens_city`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `screens_city` AS SELECT 
 1 AS `name`,
 1 AS `COUNT(s.screen_id)`*/;
SET character_set_client = @saved_cs_client;

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
  PRIMARY KEY (`show_timing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `srk`
--

DROP TABLE IF EXISTS `srk`;
/*!50001 DROP VIEW IF EXISTS `srk`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `srk` AS SELECT 
 1 AS `SRK`,
 1 AS `rating`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!50001 DROP VIEW IF EXISTS `theater`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `theater` AS SELECT 
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `theater_highest_sales`
--

DROP TABLE IF EXISTS `theater_highest_sales`;
/*!50001 DROP VIEW IF EXISTS `theater_highest_sales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `theater_highest_sales` AS SELECT 
 1 AS `name`,
 1 AS `MAX(s.ticket_price*b.tickets_booked)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theaters` (
  `theater_id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  `updated_at` timestamp(4) NULL DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`theater_id`),
  KEY `city_id_fk_idx` (`city_id`),
  CONSTRAINT `city_id_fk` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `top_hit_ajay`
--

DROP TABLE IF EXISTS `top_hit_ajay`;
/*!50001 DROP VIEW IF EXISTS `top_hit_ajay`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_hit_ajay` AS SELECT 
 1 AS `name`,
 1 AS `rating`,
 1 AS `movie_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_income`
--

DROP TABLE IF EXISTS `total_income`;
/*!50001 DROP VIEW IF EXISTS `total_income`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_income` AS SELECT 
 1 AS `totalSales`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_screens_mumbai`
--

DROP TABLE IF EXISTS `total_screens_mumbai`;
/*!50001 DROP VIEW IF EXISTS `total_screens_mumbai`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_screens_mumbai` AS SELECT 
 1 AS `name`,
 1 AS `COUNT(ts.screen_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_theaters_ahmedabad`
--

DROP TABLE IF EXISTS `total_theaters_ahmedabad`;
/*!50001 DROP VIEW IF EXISTS `total_theaters_ahmedabad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_theaters_ahmedabad` AS SELECT 
 1 AS `NoOfTheaters`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` char(32) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `booking_id_fk_idx` (`booking_id`),
  CONSTRAINT `booking_id_fk` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `source_fk_idx` (`source_user`),
  KEY `target_fk_idx` (`target_user`),
  CONSTRAINT `tweet_id` FOREIGN KEY (`tweet_id`) REFERENCES `twitter_tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tweet_tags`
--

DROP TABLE IF EXISTS `tweet_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_tags` (
  `tweet_id` bigint(20) NOT NULL,
  `tag` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  KEY `tag` (`tweet_id`),
  CONSTRAINT `tag` FOREIGN KEY (`tweet_id`) REFERENCES `twitter_tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `twitter_tweet_handle`
--

DROP TABLE IF EXISTS `twitter_tweet_handle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_tweet_handle` (
  `tweet_id` bigint(20) NOT NULL,
  `twitter_handle` varchar(45) DEFAULT NULL,
  KEY `twitter_handles__fk_idx` (`twitter_handle`),
  KEY `tweet_id_fks` (`tweet_id`),
  CONSTRAINT `tweet_id_fks` FOREIGN KEY (`tweet_id`) REFERENCES `twitter_tweets` (`tweet_id`),
  CONSTRAINT `twitter__handles_fk` FOREIGN KEY (`twitter_handle`) REFERENCES `twitter_user` (`twitter_handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_tweet_movie`
--

DROP TABLE IF EXISTS `twitter_tweet_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_tweet_movie` (
  `tweet_id` bigint(20) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  KEY `movie_id_tweet_idx` (`movie_id`),
  KEY `tweet_id_fk` (`tweet_id`),
  CONSTRAINT `movie_id_tweet` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `tweet_id_fk` FOREIGN KEY (`tweet_id`) REFERENCES `twitter_tweets` (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_tweets`
--

DROP TABLE IF EXISTS `twitter_tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_tweets` (
  `tweet_id` bigint(20) NOT NULL,
  `twitter_text` varchar(500) DEFAULT NULL,
  `profile_image_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` timestamp(4) NOT NULL DEFAULT CURRENT_TIMESTAMP(4) ON UPDATE CURRENT_TIMESTAMP(4),
  `likes` int(11) DEFAULT NULL,
  `retweet` int(11) DEFAULT NULL,
  `sentiment` decimal(20,0) DEFAULT NULL,
  PRIMARY KEY (`tweet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `twitter_user`
--

DROP TABLE IF EXISTS `twitter_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `twitter_user` (
  `twitter_handle` varchar(45) NOT NULL,
  `name` varchar(80) NOT NULL,
  `profile_image_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `followers_count` int(11) NOT NULL,
  `following_count` int(11) NOT NULL,
  `created_at` timestamp(4) NULL DEFAULT NULL,
  PRIMARY KEY (`twitter_handle`),
  UNIQUE KEY `twitter_handle_UNIQUE` (`twitter_handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_gender`
--

DROP TABLE IF EXISTS `user_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_gender` (
  `user_id` int(11) NOT NULL,
  `gender` varchar(45) DEFAULT NULL,
  KEY `user_id_gender_fk` (`user_id`),
  CONSTRAINT `user_id_gender_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `year_least_no_movies`
--

DROP TABLE IF EXISTS `year_least_no_movies`;
/*!50001 DROP VIEW IF EXISTS `year_least_no_movies`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `year_least_no_movies` AS SELECT 
 1 AS `released_year`,
 1 AS `movie_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'movie_ticket_reservation'
--

--
-- Dumping routines for database 'movie_ticket_reservation'
--

--
-- Final view structure for view `_max_movie_releases`
--

/*!50001 DROP VIEW IF EXISTS `_max_movie_releases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `_max_movie_releases` AS select count(`stars`.`star_id`) AS `top_actors`,`stars`.`name` AS `name`,`movie`.`released_year` AS `released_year` from ((`stars` join `movie_stars` on((`movie_stars`.`star_id` = `stars`.`star_id`))) join `movie` on(((`movie`.`movie_id` = `movie_stars`.`movie_id`) and (`movie`.`released_year` = 2016)))) group by `stars`.`star_id` order by `top_actors` desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `avg_rating_comedy`
--

/*!50001 DROP VIEW IF EXISTS `avg_rating_comedy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avg_rating_comedy` AS select avg(`m`.`rating`) AS `Average_Rating` from ((`movie` `m` join `movie_genre` `mg` on((`m`.`movie_id` = `mg`.`movie_id`))) join `genre` `g` on(((`g`.`genre_id` = `mg`.`genre_id`) and (`g`.`genre_id` = 5)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `best_movie`
--

/*!50001 DROP VIEW IF EXISTS `best_movie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `best_movie` AS select `m`.`name` AS `name`,max(`m`.`rating`) AS `max(m.rating)` from `movie` `m` where (`m`.`released_year` between 2015 and 2016) group by `m`.`name` order by `m`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `diff_ticket_prices`
--

/*!50001 DROP VIEW IF EXISTS `diff_ticket_prices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `diff_ticket_prices` AS select count(`ss`.`screen_id`) AS `COUNT(ss.screen_id)`,max(`ss`.`ticket_price`) AS `MAX(ss.ticket_price)` from `screen_shows` `ss` group by `ss`.`ticket_price` order by `ss`.`ticket_price` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `drama_good_ratings_movies`
--

/*!50001 DROP VIEW IF EXISTS `drama_good_ratings_movies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `drama_good_ratings_movies` AS select `m`.`name` AS `name`,`m`.`released_year` AS `released_year`,`m`.`rating` AS `rating`,`g`.`genre` AS `genre` from ((`movie` `m` join `movie_genre` `mg` on((`mg`.`movie_id` = `m`.`movie_id`))) join `genre` `g` on(((`g`.`genre_id` = `mg`.`genre_id`) and (`g`.`genre` = 'Drama') and (`m`.`released_year` = 2020)))) order by `m`.`rating` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_positive_tweet_movie`
--

/*!50001 DROP VIEW IF EXISTS `highest_positive_tweet_movie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_positive_tweet_movie` AS select `s`.`name` AS `name` from (`stars` `s` join `movie_stars` `ms` on(((`s`.`star_id` = `ms`.`star_id`) and (`ms`.`movie_id` = (select `m`.`movie_id` from ((`movie` `m` join `twitter_tweet_movie` `tm` on((`tm`.`movie_id` = `m`.`movie_id`))) join `twitter_tweets` `t` on((`t`.`tweet_id` = `tm`.`tweet_id`))) group by `m`.`name` order by sum(`t`.`sentiment`) limit 1))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_rating_genre`
--

/*!50001 DROP VIEW IF EXISTS `highest_rating_genre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_rating_genre` AS select `g`.`genre` AS `genre`,`g`.`genre_id` AS `genre_id`,max(`m`.`rating`) AS `MAX(m.rating)` from ((`movie_genre` `mg` join `genre` `g` on((`mg`.`genre_id` = `g`.`genre_id`))) join `movie` `m` on((`m`.`movie_id` = `mg`.`genre_id`))) group by `g`.`genre`,`g`.`genre_id` order by `m`.`rating` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_retweets_movie`
--

/*!50001 DROP VIEW IF EXISTS `highest_retweets_movie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_retweets_movie` AS select `s`.`name` AS `name` from (`stars` `s` join `movie_stars` `ms` on(((`s`.`star_id` = `ms`.`star_id`) and (`ms`.`movie_id` = (select `m`.`movie_id` from ((`movie` `m` join `twitter_tweet_movie` `tm` on((`tm`.`movie_id` = `m`.`movie_id`))) join `twitter_tweets` `t` on((`tm`.`tweet_id` = `t`.`tweet_id`))) order by `t`.`retweet` desc limit 1))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `least_sales_theaters`
--

/*!50001 DROP VIEW IF EXISTS `least_sales_theaters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `least_sales_theaters` AS select `t`.`name` AS `name`,sum(`tt`.`amount`) AS `total` from ((((`theaters` `t` join `screens` `s` on((`t`.`theater_id` = `s`.`screen_id`))) join `screen_shows` `ss` on((`ss`.`screen_id` = `s`.`screen_id`))) join `bookings` `b` on((`ss`.`id` = `b`.`screen_shows_id`))) join `transaction` `tt` on((`tt`.`booking_id` = `b`.`booking_id`))) group by `t`.`theater_id` order by `total` limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `least_tweets_movie`
--

/*!50001 DROP VIEW IF EXISTS `least_tweets_movie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `least_tweets_movie` AS select `m`.`name` AS `name`,count(`tm`.`movie_id`) AS `count` from ((`movie` `m` join `twitter_tweet_movie` `tm` on((`tm`.`movie_id` = `m`.`movie_id`))) join `twitter_tweets` `t` on((`t`.`tweet_id` = `tm`.`tweet_id`))) group by `m`.`movie_id` order by `count` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `maximum_bookings`
--

/*!50001 DROP VIEW IF EXISTS `maximum_bookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `maximum_bookings` AS select `u`.`name` AS `name`,`b`.`user_id` AS `user_id`,(sum(`b`.`tickets_booked`) * `s`.`ticket_price`) AS `total` from ((`bookings` `b` join `screen_shows` `s` on((`b`.`screen_shows_id` = `s`.`id`))) join `user` `u` on((`b`.`user_id` = `u`.`user_id`))) group by `b`.`user_id` order by `total` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `min_runtime`
--

/*!50001 DROP VIEW IF EXISTS `min_runtime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `min_runtime` AS select `n`.`name` AS `NAME` from `movie` `n` where (`n`.`runtime` = (select min(`m`.`runtime`) from `movie` `m`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_booked_date`
--

/*!50001 DROP VIEW IF EXISTS `most_booked_date`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_booked_date` AS select `b`.`created_at` AS `created_at`,`b`.`tickets_booked` AS `tickets_booked` from `bookings` `b` where (year(`b`.`created_at`) = 2020) group by `b`.`created_at` order by `b`.`tickets_booked` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_hit_by_priyanka`
--

/*!50001 DROP VIEW IF EXISTS `most_hit_by_priyanka`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_hit_by_priyanka` AS select `m`.`name` AS `name`,`m`.`released_year` AS `released_year`,`m`.`rating` AS `rating` from ((`stars` `s` join `movie_stars` `ms` on((`ms`.`star_id` = `s`.`star_id`))) join `movie` `m` on((`ms`.`movie_id` = `m`.`movie_id`))) where ((`s`.`name` like '%Priyanka Chopra Jonas%') and (`m`.`released_year` = 2013)) order by `m`.`rating` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_mentions`
--

/*!50001 DROP VIEW IF EXISTS `most_mentions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_mentions` AS select `m`.`name` AS `name`,count(distinct `tt`.`target_user`) AS `all_mentions` from (((`movie` `m` join `twitter_tweet_movie` `tm` on((`tm`.`movie_id` = `m`.`movie_id`))) join `twitter_tweets` `t` on((`tm`.`tweet_id` = `t`.`tweet_id`))) join `tweet_mentions` `tt` on((`t`.`tweet_id` = `tt`.`tweet_id`))) group by `m`.`name` order by `all_mentions` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_negative_reviews`
--

/*!50001 DROP VIEW IF EXISTS `most_negative_reviews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_negative_reviews` AS select `m`.`name` AS `name`,sum(`t`.`sentiment`) AS `sentiment` from ((`movie` `m` join `twitter_tweet_movie` `tm` on((`tm`.`movie_id` = `m`.`movie_id`))) join `twitter_tweets` `t` on((`tm`.`tweet_id` = `t`.`tweet_id`))) group by `m`.`name` order by sum(`t`.`sentiment`) limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_tweet_tags_movie`
--

/*!50001 DROP VIEW IF EXISTS `most_tweet_tags_movie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_tweet_tags_movie` AS select `m`.`name` AS `name`,count(`tt`.`tag`) AS `COUNT(tt.tag)` from (((`movie` `m` join `twitter_tweet_movie` `tm` on((`tm`.`movie_id` = `m`.`movie_id`))) join `twitter_tweets` `t` on((`tm`.`tweet_id` = `t`.`tweet_id`))) join `tweet_tags` `tt` on((`t`.`tweet_id` = `tt`.`tweet_id`))) group by `m`.`name` order by count(`tt`.`tag`) desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `most_tweets`
--

/*!50001 DROP VIEW IF EXISTS `most_tweets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `most_tweets` AS select `m`.`name` AS `name`,count(`t`.`tweet_id`) AS `tweet_count` from ((`movie` `m` join `twitter_tweet_movie` `tm` on((`tm`.`movie_id` = `m`.`movie_id`))) join `twitter_tweets` `t` on((`tm`.`tweet_id` = `t`.`tweet_id`))) group by `tm`.`movie_id` order by `tweet_count` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_actors`
--

/*!50001 DROP VIEW IF EXISTS `movie_actors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_actors` AS select `s`.`name` AS `actor`,`m`.`name` AS `name`,`m`.`released_year` AS `released_year` from ((`movie` `m` join `movie_stars` `ms` on(((`m`.`movie_id` = `ms`.`movie_id`) and (`m`.`released_year` between 2018 and 2021)))) join `stars` `s` on((`s`.`star_id` = `ms`.`star_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_max_bookings`
--

/*!50001 DROP VIEW IF EXISTS `movie_max_bookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_max_bookings` AS select `m`.`name` AS `name`,`m`.`released_year` AS `released_year`,(sum(`b`.`tickets_booked`) * `s`.`ticket_price`) AS `total` from ((`bookings` `b` join `screen_shows` `s` on((`b`.`screen_shows_id` = `s`.`id`))) join `movie` `m` on((`s`.`movie_id` = `m`.`movie_id`))) group by `m`.`movie_id` order by `total` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movie_max_screens`
--

/*!50001 DROP VIEW IF EXISTS `movie_max_screens`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movie_max_screens` AS select `m`.`name` AS `name`,`m`.`released_year` AS `released_year`,`s`.`screen_id` AS `totalScreens` from (`screen_shows` `s` join `movie` `m` on((`m`.`movie_id` = `s`.`movie_id`))) group by `m`.`movie_id` order by `totalScreens` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `screens_city`
--

/*!50001 DROP VIEW IF EXISTS `screens_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `screens_city` AS select `c`.`name` AS `name`,count(`s`.`screen_id`) AS `COUNT(s.screen_id)` from ((`city` `c` join `theaters` `t` on((`t`.`city_id` = `c`.`city_id`))) join `screens` `s` on((`s`.`theater_id` = `t`.`theater_id`))) group by `c`.`name` order by count(`s`.`screen_id`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `srk`
--

/*!50001 DROP VIEW IF EXISTS `srk`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `srk` AS select `m`.`name` AS `SRK`,`m`.`rating` AS `rating` from ((`movie_stars` `ms` join `stars` `s` on((`ms`.`star_id` = `s`.`star_id`))) join `movie` `m` on((`m`.`movie_id` = `ms`.`movie_id`))) where (`s`.`name` = 'Shah Rukh Khan') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `theater`
--

/*!50001 DROP VIEW IF EXISTS `theater`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `theater` AS select `t`.`name` AS `name` from (((`theaters` `t` join `screens` `s` on((`t`.`theater_id` = `s`.`theater_id`))) join `screen_shows` `ss` on((`ss`.`screen_id` = `s`.`screen_id`))) join `movie` `m` on((`m`.`movie_id` = `ss`.`movie_id`))) where (`m`.`released_year` = '2020') group by `t`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `theater_highest_sales`
--

/*!50001 DROP VIEW IF EXISTS `theater_highest_sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `theater_highest_sales` AS select `t`.`name` AS `name`,max((`s`.`ticket_price` * `b`.`tickets_booked`)) AS `MAX(s.ticket_price*b.tickets_booked)` from (((`theaters` `t` join `screens` `sc` on((`t`.`theater_id` = `sc`.`theater_id`))) join `screen_shows` `s` on((`sc`.`screen_id` = `s`.`screen_id`))) join `bookings` `b` on((`b`.`screen_shows_id` = `s`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_hit_ajay`
--

/*!50001 DROP VIEW IF EXISTS `top_hit_ajay`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_hit_ajay` AS select `m`.`name` AS `name`,`m`.`rating` AS `rating`,`m`.`movie_id` AS `movie_id` from (`movie` `m` join `movie_stars` `ma` on(((`ma`.`movie_id` = `m`.`movie_id`) and (`ma`.`star_id` = (select `s`.`star_id` from `stars` `s` where (`s`.`name` = 'Ajay Devgn')))))) order by `m`.`rating` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_income`
--

/*!50001 DROP VIEW IF EXISTS `total_income`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_income` AS select sum(`tt`.`amount`) AS `totalSales`,`t`.`name` AS `name` from ((((`transaction` `tt` join `bookings` `b` on((`tt`.`booking_id` = `b`.`booking_id`))) join `screen_shows` `ss` on((`b`.`screen_shows_id` = `ss`.`id`))) join `screens` `s` on((`s`.`screen_id` = `ss`.`screen_id`))) join `theaters` `t` on((`t`.`theater_id` = `s`.`theater_id`))) group by `t`.`theater_id` order by `totalSales` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_screens_mumbai`
--

/*!50001 DROP VIEW IF EXISTS `total_screens_mumbai`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_screens_mumbai` AS select `c`.`name` AS `name`,count(`ts`.`screen_id`) AS `COUNT(ts.screen_id)` from ((`theaters` `t` join `screens` `ts` on((`ts`.`theater_id` = `t`.`theater_id`))) join `city` `c` on(((`t`.`city_id` = `c`.`city_id`) and (`c`.`name` = 'Mumbai')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_theaters_ahmedabad`
--

/*!50001 DROP VIEW IF EXISTS `total_theaters_ahmedabad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_theaters_ahmedabad` AS select count(`t`.`theater_id`) AS `NoOfTheaters` from `theaters` `t` where (`t`.`city_id` = (select `c`.`city_id` from `city` `c` where (`c`.`name` = 'Ahmedabad'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `year_least_no_movies`
--

/*!50001 DROP VIEW IF EXISTS `year_least_no_movies`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `year_least_no_movies` AS select `m`.`released_year` AS `released_year`,count(`m`.`movie_id`) AS `movie_count` from `movie` `m` group by `m`.`released_year` order by `movie_count` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14 17:14:26
