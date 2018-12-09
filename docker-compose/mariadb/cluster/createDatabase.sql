CREATE DATABASE IF NOT EXISTS `test_db` default charset utf8 COLLATE utf8_general_ci;

use `test_db`;

DROP TABLE IF EXISTS `test_db`.`test_table1`;
CREATE TABLE `test_db`.`test_table1`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL, 
    `age` TINYINT UNSIGNED NOT NULL DEFAULT '0',
    PRIMARY KEY(`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

INSERT INTO `test_db`.`test_table1`(`name`,`age`) 
    values('xiao ming', 10),
          ('xiao hua', 11),
          ('xiao zhang', 12),
          ('xiao li', 13),
          ('xiao long', 11);