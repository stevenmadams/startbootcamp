-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bootcamp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bootcamp` ;

-- -----------------------------------------------------
-- Schema bootcamp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bootcamp` DEFAULT CHARACTER SET utf8 ;
USE `bootcamp` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `start_date` DATETIME NULL,
  `user_photo` VARCHAR(2083) NULL,
  `privelege` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource` ;

CREATE TABLE IF NOT EXISTS `resource` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `url` VARCHAR(2083) NULL,
  `video` VARCHAR(2083) NULL,
  `photo` VARCHAR(2083) NULL,
  `snippet` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_resource`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_resource` ;

CREATE TABLE IF NOT EXISTS `user_resource` (
  `user_id` INT NOT NULL,
  `resource_id` INT NOT NULL,
  `notes` TEXT(1000000) NULL,
  `completed` TINYINT(1) NULL DEFAULT 0,
  `rating` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`, `resource_id`),
  INDEX `resource_user_id_idx` (`resource_id` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `resource_user_id`
    FOREIGN KEY (`resource_id`)
    REFERENCES `resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource_tag` ;

CREATE TABLE IF NOT EXISTS `resource_tag` (
  `resource_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`resource_id`, `tag_id`),
  INDEX `resource_tag_idx` (`tag_id` ASC),
  CONSTRAINT `tag_resource`
    FOREIGN KEY (`resource_id`)
    REFERENCES `resource` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `resource_tag`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO app;
 DROP USER app;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'app' IDENTIFIED BY 'app';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'app';

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bootcamp`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (1, 'Denise', 'Palmer', 'dpalmer0', 'Xt3no7mq', 'dpalmer0@princeton.edu', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (2, 'Kathryn', 'Johnson', 'kjohnson1', 'mW7uE3p', 'kjohnson1@exblog.jp', '2016-11-18', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (3, 'Amanda', 'Price', 'aprice2', 'XYnUbO', 'aprice2@multiply.com', '2016-06-09', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (4, 'Rebecca', 'Campbell', 'rcampbell3', 'a4AETjCptv6', 'rcampbell3@wiley.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (5, 'Theresa', 'Armstrong', 'tarmstrong4', 'mslNiOC', 'tarmstrong4@java.com', '2016-06-08', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (6, 'Ashley', 'Stanley', 'astanley5', 'FC9w9JG', 'astanley5@homestead.com', '2016-07-08', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (7, 'Kathy', 'Lee', 'klee6', 'WUKeB0m', 'klee6@dyndns.org', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (8, 'Nancy', 'Henry', 'nhenry7', 'KJyn4fttAD8', 'nhenry7@ehow.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (9, 'Roy', 'Hunter', 'rhunter8', 'CyHfmt9AD', 'rhunter8@baidu.com', '2016-04-25', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (10, 'Matthew', 'Edwards', 'medwards9', 'p0zjSyqG0te', 'medwards9@vk.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (11, 'Joshua', 'Patterson', 'jpattersona', 'oRURrVeFndAK', 'jpattersona@discovery.com', '2015-12-27', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (12, 'Nicholas', 'Cox', 'ncoxb', 'wskXijkAf', 'ncoxb@sciencedaily.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (13, 'Norma', 'Kelly', 'nkellyc', '7h0RJNUml6T', 'nkellyc@shop-pro.jp', '2016-12-27', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (14, 'Keith', 'Gardner', 'kgardnerd', 'CjaT2ZQxSgwc', 'kgardnerd@washington.edu', '2016-07-23', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (15, 'Anna', 'Anderson', 'aandersone', 'vxXU94g', 'aandersone@sbwire.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (16, 'Randy', 'Williamson', 'rwilliamsonf', 'M8vEvBOl31w', 'rwilliamsonf@mit.edu', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (17, 'Alice', 'Brown', 'abrowng', '2eSeiPHl87r', 'abrowng@pinterest.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (18, 'Ralph', 'Spencer', 'rspencerh', 'VXUIKj6MKiY', 'rspencerh@foxnews.com', '2015-11-15', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (19, 'Norma', 'Hunter', 'nhunteri', 'D7p6WGJFBWj', 'nhunteri@parallels.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (20, 'Keith', 'Wallace', 'kwallacej', 'iZFWq4Ygm23t', 'kwallacej@umich.edu', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (21, 'Gerald', 'Chavez', 'gchavezk', 'vQz5oqy7', 'gchavezk@comsenz.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (22, 'Jimmy', 'Gonzales', 'jgonzalesl', 'zd9SEiu', 'jgonzalesl@bloglovin.com', '2016-05-27', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (23, 'Debra', 'Peterson', 'dpetersonm', 'VEcKie80L', 'dpetersonm@sitemeter.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (24, 'Margaret', 'Spencer', 'mspencern', 'uzicLEiu', 'mspencern@macromedia.com', '2016-05-24', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (25, 'Sarah', 'Nichols', 'snicholso', '9u2PpyaI', 'snicholso@seattletimes.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (26, 'Frank', 'Fox', 'ffoxp', 'pWNPiOzEaJS', 'ffoxp@wix.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (27, 'Janice', 'Smith', 'jsmithq', 'LGCh8Tat2urs', 'jsmithq@pagesperso-orange.fr', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (28, 'Anne', 'Robertson', 'arobertsonr', '3yjJosmg', 'arobertsonr@wunderground.com', '2015-12-06', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (29, 'Paula', 'Carpenter', 'pcarpenters', '9TOsoie6y', 'pcarpenters@desdev.cn', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (30, 'George', 'Matthews', 'gmatthewst', 'cvzNmABHW', 'gmatthewst@blog.com', '2016-09-19', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (31, 'Lillian', 'Reed', 'lreedu', '4Uxffwl3d', 'lreedu@seattletimes.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (32, 'Justin', 'Nguyen', 'jnguyenv', 'lsHvsbaG', 'jnguyenv@stumbleupon.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (33, 'Nancy', 'Greene', 'ngreenew', 'cFYpkcpa', 'ngreenew@abc.net.au', '2016-02-23', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (34, 'Kelly', 'George', 'kgeorgex', 'BUjExzRHYi', 'kgeorgex@aol.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (35, 'Martha', 'Fields', 'mfieldsy', 'GqNpWUJhdi', 'mfieldsy@yahoo.co.jp', '2016-04-29', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (36, 'Gerald', 'Montgomery', 'gmontgomeryz', 'w8g5PVzAwgW', 'gmontgomeryz@imageshack.us', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (37, 'Bonnie', 'Ryan', 'bryan10', '72NKMiad1', 'bryan10@php.net', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (38, 'Julie', 'Burton', 'jburton11', '2raD2rA8', 'jburton11@nytimes.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (39, 'Kathy', 'Bishop', 'kbishop12', '4HSlz0PamSF', 'kbishop12@princeton.edu', '2015-12-05', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (40, 'Shawn', 'Price', 'sprice13', 'a3DaeqH', 'sprice13@cargocollective.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (41, 'Rachel', 'Reyes', 'rreyes14', 'hof13TPb', 'rreyes14@wired.com', '2016-11-06', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (42, 'Rebecca', 'Lopez', 'rlopez15', 'Jy4xNt3wT5ZB', 'rlopez15@apache.org', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (43, 'Harold', 'Reed', 'hreed16', 'oINgTkVeV', 'hreed16@amazon.co.jp', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (44, 'Kathryn', 'George', 'kgeorge17', 'gCrIPAqx', 'kgeorge17@histats.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (45, 'Carolyn', 'Montgomery', 'cmontgomery18', 'LOvnXT', 'cmontgomery18@symantec.com', '2016-10-03', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (46, 'Kathleen', 'Carr', 'kcarr19', 'XJWilgeF4XgO', 'kcarr19@nationalgeographic.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (47, 'Wayne', 'Ramirez', 'wramirez1a', 'wIepcrXUZ', 'wramirez1a@bizjournals.com', '2016-07-16', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (48, 'Brenda', 'Webb', 'bwebb1b', 'inNYXIdkEi', 'bwebb1b@ustream.tv', '2016-12-17', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (49, 'Jennifer', 'Stephens', 'jstephens1c', 'h3ZZzt', 'jstephens1c@google.de', '2016-11-18', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (50, 'Ann', 'Collins', 'acollins1d', 'dFLt1Os9eUdE', 'acollins1d@ftc.gov', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (51, 'Linda', 'Fernandez', 'lfernandez1e', 'ZD1sYaxr', 'lfernandez1e@quantcast.com', '2016-08-12', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (52, 'Daniel', 'Griffin', 'dgriffin1f', 'Z8NYTN3', 'dgriffin1f@ted.com', '2016-07-29', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (53, 'Carol', 'Simpson', 'csimpson1g', 'YH260j405vRG', 'csimpson1g@goodreads.com', '2016-07-22', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (54, 'Annie', 'Harvey', 'aharvey1h', '4eQ7ac6JH4g', 'aharvey1h@weebly.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (55, 'Harry', 'Knight', 'hknight1i', 'cIE0UGxSuQTX', 'hknight1i@boston.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (56, 'Anthony', 'Dean', 'adean1j', '2Ro1z3PHP', 'adean1j@sogou.com', '2015-12-18', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (57, 'Joe', 'Greene', 'jgreene1k', 'sPORLjRYBf', 'jgreene1k@bandcamp.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (58, 'George', 'Morales', 'gmorales1l', 'btLXAAwcvY7q', 'gmorales1l@gov.uk', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (59, 'Roy', 'Andrews', 'randrews1m', 'TbGO7kSqNL', 'randrews1m@icq.com', '2016-02-22', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (60, 'Wanda', 'Weaver', 'wweaver1n', 'B1HSyKh', 'wweaver1n@omniture.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (61, 'Eugene', 'Cook', 'ecook1o', 'cQk2Exjh', 'ecook1o@usatoday.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (62, 'George', 'Turner', 'gturner1p', 'Pj77KQE0', 'gturner1p@is.gd', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (63, 'Lisa', 'Jacobs', 'ljacobs1q', '1azto1G', 'ljacobs1q@usnews.com', '2016-05-18', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (64, 'Frank', 'Marshall', 'fmarshall1r', 'hiAsiwI', 'fmarshall1r@hp.com', '2016-12-13', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (65, 'Judith', 'Lawrence', 'jlawrence1s', 'IBxPJPHigZ7K', 'jlawrence1s@yahoo.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (66, 'Lillian', 'Mccoy', 'lmccoy1t', 'ICDsVkE24', 'lmccoy1t@51.la', '2016-10-10', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (67, 'Matthew', 'Vasquez', 'mvasquez1u', 'ZsBSQTOdkt', 'mvasquez1u@booking.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (68, 'Samuel', 'Powell', 'spowell1v', 'jU9IexCR', 'spowell1v@nature.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (69, 'Laura', 'Rodriguez', 'lrodriguez1w', 'VkBN61aEi', 'lrodriguez1w@51.la', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (70, 'Gerald', 'Porter', 'gporter1x', '7gMl766', 'gporter1x@cdbaby.com', '2015-11-30', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (71, 'Anne', 'Gilbert', 'agilbert1y', 'rn2OEwqPdf5z', 'agilbert1y@mayoclinic.com', '2016-05-31', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (72, 'Craig', 'Walker', 'cwalker1z', 'QLDEjH0d8IW', 'cwalker1z@cafepress.com', '2016-09-15', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (73, 'Wayne', 'Wheeler', 'wwheeler20', 'A4BfjrOnr', 'wwheeler20@chicagotribune.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (74, 'Louise', 'Fuller', 'lfuller21', '3Gdwi95Rgw', 'lfuller21@last.fm', '2016-01-11', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (75, 'Charles', 'Baker', 'cbaker22', 'N9oLNmtmQ9hT', 'cbaker22@rambler.ru', '2016-07-06', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (76, 'Peter', 'Evans', 'pevans23', 'Ljp3QTAlHIO', 'pevans23@photobucket.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (77, 'Peter', 'Washington', 'pwashington24', 'Y8WpEx0O', 'pwashington24@odnoklassniki.ru', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (78, 'Adam', 'Castillo', 'acastillo25', 'QpdgjRE1giLf', 'acastillo25@bloglovin.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (79, 'Aaron', 'Morris', 'amorris26', 'A9rBoo', 'amorris26@marriott.com', '2016-03-03', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (80, 'Eugene', 'Hernandez', 'ehernandez27', 'fCkdYg8GTHz', 'ehernandez27@twitpic.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (81, 'Amy', 'Porter', 'aporter28', 'xXvBLH3L', 'aporter28@ucoz.ru', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (82, 'Evelyn', 'Harris', 'eharris29', '3QzdpXLB3', 'eharris29@google.it', '2016-10-12', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (83, 'Jimmy', 'Ward', 'jward2a', '3Bdnhkbs9', 'jward2a@cdbaby.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (84, 'James', 'Crawford', 'jcrawford2b', '1DmBBfK5Lk7o', 'jcrawford2b@geocities.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (85, 'Jesse', 'Henry', 'jhenry2c', 'K8rt4wWk4', 'jhenry2c@imageshack.us', '2016-10-26', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (86, 'Albert', 'White', 'awhite2d', 'Z5A4meAgz', 'awhite2d@elpais.com', '2016-06-25', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (87, 'Jane', 'Gordon', 'jgordon2e', '6v234bJB', 'jgordon2e@cpanel.net', '2016-04-18', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (88, 'Andrea', 'Henderson', 'ahenderson2f', 'HISVuBO7ddp', 'ahenderson2f@cnbc.com', '2016-11-24', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (89, 'Steve', 'Black', 'sblack2g', 'AxDhzzjxSzAq', 'sblack2g@livejournal.com', '2016-10-04', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (90, 'Kathleen', 'Parker', 'kparker2h', 'p6eXQndaV', 'kparker2h@live.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (91, 'Patricia', 'Collins', 'pcollins2i', 'mwtE1XwCW', 'pcollins2i@pagesperso-orange.fr', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (92, 'Katherine', 'Williamson', 'kwilliamson2j', 'y6W7bGnXsOxU', 'kwilliamson2j@comsenz.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (93, 'Joshua', 'Rivera', 'jrivera2k', 'gN5zYDyv', 'jrivera2k@kickstarter.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (94, 'Andrew', 'Riley', 'ariley2l', '8pdvIHHq', 'ariley2l@rakuten.co.jp', '2016-04-01', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (95, 'Catherine', 'Simpson', 'csimpson2m', '4BwFYO', 'csimpson2m@samsung.com', '2016-04-18', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (96, 'Charles', 'Gordon', 'cgordon2n', '7XCyf4bK', 'cgordon2n@github.com', '2016-04-30', NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (97, 'Philip', 'Tucker', 'ptucker2o', 'aChT5KaZ0HR0', 'ptucker2o@liveinternet.ru', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (98, 'Barbara', 'Alvarez', 'balvarez2p', '0SE0IxAk', 'balvarez2p@phpbb.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (99, 'Henry', 'Rivera', 'hrivera2q', '3SX53OKmDbJJ', 'hrivera2q@shareasale.com', NULL, NULL, NULL);
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`, `user_photo`, `privelege`) VALUES (100, 'David', 'Hamilton', 'dhamilton2r', 'gphXN3', 'dhamilton2r@alexa.com', NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `bootcamp`;
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (1, 'Hour of Code', 'The Hour of Code is a global movement reaching tens of millions of students in 180+ countries. Anyone, anywhere can organize an Hour of Code event. One-hour tutorials are available in over 45 languages. No experience needed. Ages 4 to 104.', 'https://hourofcode.com/us', '', 'http://dummyimage.com/112x140.png/ff4444/ffffff', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (2, 'Free Code Camp', 'Learn to code and help nonprofits. ', 'https://www.freecodecamp.com/', '', 'http://dummyimage.com/100x197.png/cc0000/ffffff', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (3, 'MIT OpenCourceWare', 'MIT OpenCourseWare (OCW) is a web-based publication of virtually all MIT course content. OCW is open and available to the world and is a permanent MIT activity.', 'https://www.codeschool.com/', '', 'http://dummyimage.com/219x178.png/5fa2dd/ffffff', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (4, 'Code School', 'Code School is an online learning destination for existing and aspiring developers that teaches through entertaining content. Each course is built around a creative theme and storyline so that it feels like you’re playing a game, not sitting in a classroom. We combine gaming mechanics with video instruction and in-browser coding challenges to make learning fun and memorable. With over 60 courses covering HTML/CSS, JavaScript, Ruby, Python, .NET, iOS, Git, databases, and more, Code School pairs experienced instructors with meticulously produced, high-quality content inspired by our community and network of members.', 'https://www.codeschool.com/', '', 'http://dummyimage.com/145x231.jpg/dddddd/000000', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (5, 'W3Schools', 'W3Schools is a web developers site, with tutorials and references on web development languages such as HTML, CSS, JavaScript, PHP, SQL, and Bootstrap, covering most aspects of web programming.', 'http://www.w3schools.com/default.asp', '', 'http://dummyimage.com/170x219.jpg/cc0000/ffffff', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (6, 'Khan Academy', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'https://www.khanacademy.org/computing/computer-programming', '', 'http://dummyimage.com/205x176.png/dddddd/000000', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (7, 'Bento', 'Teach yourself to code Everything you need to be a self-taught expert developer', 'https://bento.io/', '', 'http://dummyimage.com/214x170.png/5fa2dd/ffffff', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (8, 'Codecademy', 'Codecademy the best place for our team to learn, teach, and create the online learning experience of the future..', 'https://www.codecademy.com/', '', 'http://dummyimage.com/247x237.jpg/dddddd/000000', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (9, 'Coursea', 'Coursera is an education platform that partners with top universities and organizations worldwide, to offer courses online for anyone to take.', 'https://www.coursera.org/', '', 'http://dummyimage.com/144x226.png/5fa2dd/ffffff', NULL);
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`, `snippet`) VALUES (10, 'edX', 'Founded by Harvard University and MIT in 2012, edX is an online learning destination and MOOC provider, offering high-quality courses from the world’s best universities and institutions to learners everywhere.  With more than 90 global partners, we are proud to count the world’s leading universities, nonprofits, and institutions as our members. EdX university members top the QS World University Rankings® with our founders receiving the top honors, and edX partner institutions ranking highly on the full list.', 'https://www.edx.org/', '', 'http://dummyimage.com/224x209.bmp/5fa2dd/ffffff', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `bootcamp`;
INSERT INTO `user_resource` (`user_id`, `resource_id`, `notes`, `completed`, `rating`) VALUES (1, 1, 'This rocks', 0, 5);
INSERT INTO `user_resource` (`user_id`, `resource_id`, `notes`, `completed`, `rating`) VALUES (2, 3, 'Meh', 1, 3);
INSERT INTO `user_resource` (`user_id`, `resource_id`, `notes`, `completed`, `rating`) VALUES (3, 7, 'Changed my life', 1, 5);
INSERT INTO `user_resource` (`user_id`, `resource_id`, `notes`, `completed`, `rating`) VALUES (4, 10, 'amazing', 1, 5);
INSERT INTO `user_resource` (`user_id`, `resource_id`, `notes`, `completed`, `rating`) VALUES (5, 8, 'good', 1, 4);
INSERT INTO `user_resource` (`user_id`, `resource_id`, `notes`, `completed`, `rating`) VALUES (6, 10, 'almost done', 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `bootcamp`;
INSERT INTO `tag` (`id`, `name`) VALUES (1, 'Java');
INSERT INTO `tag` (`id`, `name`) VALUES (2, 'Ruby');
INSERT INTO `tag` (`id`, `name`) VALUES (3, 'HTML');
INSERT INTO `tag` (`id`, `name`) VALUES (4, 'CSS');
INSERT INTO `tag` (`id`, `name`) VALUES (5, 'JavaScript');
INSERT INTO `tag` (`id`, `name`) VALUES (6, 'Python');
INSERT INTO `tag` (`id`, `name`) VALUES (7, 'Swift');
INSERT INTO `tag` (`id`, `name`) VALUES (8, 'C++');
INSERT INTO `tag` (`id`, `name`) VALUES (9, 'C');
INSERT INTO `tag` (`id`, `name`) VALUES (10, 'PHP');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
