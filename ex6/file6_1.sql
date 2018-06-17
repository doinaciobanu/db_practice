# Create a new table -> big_expensive Which will store the biggest user expensive
# The data will be stored via trigger from expensive table
# ------------------------------------------------------------

CREATE TABLE `big_expenses` (
  `id` int(11) NOT NULL,
  `expenses_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `expenses_id` (`expenses_id`),
  CONSTRAINT `big_expenses_ibfk_1` FOREIGN KEY (`expenses_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DELIMITER //
CREATE TRIGGER newbigexpenses 
 AFTER INSERT ON expenses
   FOR EACH ROW
   BEGIN
      IF (SELECT MAX(amount) FROM expenses WHERE user_id = NEW.user_id) THEN
         INSERT INTO big_expenses (expenses_id) VALUES (NEW.id); 
     END IF;
   END
//
DELIMITER ;

