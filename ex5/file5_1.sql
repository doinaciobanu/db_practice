# Dump of table currency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;

INSERT INTO `currency` (`id`, `name`)
VALUES
	(1,'euro'),
	(2,'dollar'),
	(3,'cad');

/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

# Alter table expenses
# ------------------------------------------------------------

ALTER TABLE expenses DROP COLUMN currency_id;
ALTER TABLE expenses ADD currency_id int not null AFTER `amount`;
ALTER TABLE expenses ADD FOREIGN KEY (currency_id )
REFERENCES currency(id) ON DELETE CASCADE;


