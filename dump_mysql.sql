# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.3.10-MariaDB-1:10.3.10+maria~bionic)
# Database: homestead
# Generation Time: 2019-05-19 23:16:19 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table plan_day_exercises
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plan_day_exercises`;

CREATE TABLE `plan_day_exercises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_day_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_day_exercises_plan_days1_idx` (`plan_day_id`),
  CONSTRAINT `fk_plan_day_exercises_plan_days1` FOREIGN KEY (`plan_day_id`) REFERENCES `plan_days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plan_day_exercises` WRITE;
/*!40000 ALTER TABLE `plan_day_exercises` DISABLE KEYS */;

INSERT INTO `plan_day_exercises` (`id`, `plan_day_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,1,'Excersice 2','2019-05-19 23:05:59','2019-05-19 23:05:59'),
	(2,1,'Excersice 1','2019-05-19 23:05:59','2019-05-19 23:05:59'),
	(3,2,'Excersice 2','2019-05-19 23:06:10','2019-05-19 23:06:10'),
	(4,2,'Excersice 1','2019-05-19 23:06:10','2019-05-19 23:06:10');

/*!40000 ALTER TABLE `plan_day_exercises` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plan_days
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plan_days`;

CREATE TABLE `plan_days` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_plan_days_plans_idx` (`plan_id`),
  CONSTRAINT `fk_plan_days_plans` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plan_days` WRITE;
/*!40000 ALTER TABLE `plan_days` DISABLE KEYS */;

INSERT INTO `plan_days` (`id`, `plan_id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,1,'Day 1','2019-05-19 23:05:59','2019-05-19 23:05:59'),
	(2,1,'Day 2','2019-05-19 23:06:10','2019-05-19 23:06:10');

/*!40000 ALTER TABLE `plan_days` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plans`;

CREATE TABLE `plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;

INSERT INTO `plans` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'Heavy Plan','2019-05-19 23:06:17','2019-05-19 23:06:17');

/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(150) NOT NULL DEFAULT '',
  `plan_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_plans1_idx` (`plan_id`),
  CONSTRAINT `fk_users_plans1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `plan_id`, `created_at`, `updated_at`)
VALUES
	(5,'Alex','Maramaldo','alexmaramaldo@gmail.com',1,'2019-05-19 23:15:59','2019-05-19 23:15:59');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
