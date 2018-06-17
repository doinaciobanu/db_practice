# Alter table to set id auto-increment 
# ------------------------------------------------------------

SET foreign_key_checks = 0;
ALTER TABLE currency CHANGE COLUMN id id int AUTO_INCREMENT;
SET foreign_key_checks = 1;

SET foreign_key_checks = 0;
ALTER TABLE expenses CHANGE COLUMN id id int AUTO_INCREMENT;
SET foreign_key_checks = 1;

SET foreign_key_checks = 0;
ALTER TABLE categories CHANGE COLUMN id id int AUTO_INCREMENT;
SET foreign_key_checks = 1;