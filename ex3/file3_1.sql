# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`)
VALUES
	(1,'mortgage'),
	(2,'taxes'),
	(3,'rent'),
	(4,'food'),
	(5,'utilities'),
	(6,'transportation'),
	(7,'clothing'),
	(8,'medical'),
	(9,'personal'),
	(10,'savings');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table expenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `expenses`;

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` enum('$','Euro') DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;

INSERT INTO `expenses` (`id`, `category_id`, `amount`, `currency`, `date`, `user_id`)
VALUES
	(1,4,2345.78,'$','2018-06-19 00:00:00',1),
	(2,8,200.89,'Euro','2018-09-23 00:00:00',4),
	(3,2,12357.8,'$','2018-09-12 00:00:00',6),
	(4,5,10000.2,'$','2018-01-01 00:00:00',2),
	(5,1,50000,'$','2018-02-24 00:00:00',7),
	(6,6,13245,'Euro','2018-05-29 00:00:00',8),
	(7,7,70000,'Euro','2018-06-23 00:00:00',4),
	(8,9,678,'Euro','2018-03-03 00:00:00',8),
	(9,3,90,'$','2018-03-02 00:00:00',9),
	(10,1,12,'$','2018-04-09 00:00:00',10),
	(11,3,200,'Euro','2018-01-17 00:00:00',2),
	(12,4,5000,'$','2018-04-07 00:00:00',3),
	(13,5,500,'Euro','2017-02-09 00:00:00',5),
	(14,1,7098,'Euro','2017-09-09 00:00:00',8),
	(15,3,23435.8,'$','2018-04-28 00:00:00',1),
	(16,7,450,'$','2018-05-04 00:00:00',2),
	(17,8,230.5,'Euro','2018-02-09 00:00:00',5),
	(18,9,299.99,'$','2018-03-09 00:00:00',4),
	(19,10,1000,'Euro','2018-01-20 00:00:00',9),
	(20,3,290,'$','2018-06-06 00:00:00',10);

/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;
