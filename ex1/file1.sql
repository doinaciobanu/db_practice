# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.27)
# Database: userinfo
# Generation Time: 2018-06-07 03:26:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;

INSERT INTO `country` (`id`, `name`, `code`)
VALUES
	(1,'Canada','CAD'),
	(2,'United States','USA'),
	(3,'Moldova','MDA'),
	(4,'Rominia','ROM'),
	(5,'Italy','ITA'),
	(6,'France','FRA'),
	(7,'Mexico','MEX'),
	(8,'Japan','JPN'),
	(9,'China','CHN'),
	(10,'Russia','RUS');

/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;

INSERT INTO `language` (`id`, `name`)
VALUES
	(1,'Romanian'),
	(2,'English'),
	(3,'French'),
	(4,'Chinese'),
	(5,'Russian'),
	(6,'Portughese'),
	(7,'Italian'),
	(8,'Japanese'),
	(9,'Spanish'),
	(10,'German');

/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profesions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profesions`;

CREATE TABLE `profesions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `profesions` WRITE;
/*!40000 ALTER TABLE `profesions` DISABLE KEYS */;

INSERT INTO `profesions` (`id`, `name`)
VALUES
	(1,'Computer Sience'),
	(2,'Doctor'),
	(3,'Accountant'),
	(4,'Manager'),
	(5,'Actor'),
	(6,'Singer'),
	(7,'Model'),
	(8,'QA'),
	(9,'Architect'),
	(10,'Cashier');

/*!40000 ALTER TABLE `profesions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table salary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salary`;

CREATE TABLE `salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;

INSERT INTO `salary` (`id`, `amount`)
VALUES
	(1,20000.00),
	(2,346582.78),
	(3,170000.00),
	(4,75000.00),
	(5,120000.00),
	(6,234000.00),
	(7,45000.00),
	(8,500000.00),
	(9,1250000.00),
	(10,567099.00);

/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_lang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_lang`;

CREATE TABLE `user_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `user_lang_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_lang_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_lang` WRITE;
/*!40000 ALTER TABLE `user_lang` DISABLE KEYS */;

INSERT INTO `user_lang` (`id`, `user_id`, `language_id`)
VALUES
	(1,1,3),
	(2,1,6),
	(3,2,5),
	(4,2,9),
	(5,2,8),
	(6,3,2),
	(7,3,9),
	(8,4,6),
	(9,5,1),
	(10,5,3),
	(11,6,6),
	(12,7,7),
	(13,7,1),
	(14,8,10),
	(15,8,4),
	(16,9,5),
	(17,9,2),
	(18,9,3),
	(19,10,10),
	(20,10,7);

/*!40000 ALTER TABLE `user_lang` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `profesion_id` int(11) DEFAULT NULL,
  `salary_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `profesion_id` (`profesion_id`),
  KEY `salary_id` (`salary_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`profesion_id`) REFERENCES `profesions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `sex`, `age`, `country_id`, `profesion_id`, `salary_id`)
VALUES
	(1,'Igor','Ciobanu','M',28,3,1,5),
	(2,'Inga','Velescu','F',29,4,2,8),
	(3,'Doina','Ciobanu','F',28,6,5,9),
	(4,'Natalia','Ciobanu','F',33,3,7,8),
	(5,'Sergiu','Ciobanu','M',32,5,2,10),
	(6,'Andrei','Luchian','M',29,4,2,6),
	(7,'Aliona','Botnari','F',33,7,3,3),
	(8,'Dima','Grigoriev','M',30,6,2,1),
	(9,'Ion','Moga','M',27,1,10,4),
	(10,'Elena','Moga','F',30,8,6,2);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
