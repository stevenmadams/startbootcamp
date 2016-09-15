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
  PRIMARY KEY (`id`))
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
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resource_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resource_tag` ;

CREATE TABLE IF NOT EXISTS `resource_tag` (
  `resource_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `bootcamp`;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (1, 'Denise', 'Palmer', 'dpalmer0', 'Xt3no7mq', 'dpalmer0@princeton.edu', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (2, 'Kathryn', 'Johnson', 'kjohnson1', 'mW7uE3p', 'kjohnson1@exblog.jp', '2016-11-18');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (3, 'Amanda', 'Price', 'aprice2', 'XYnUbO', 'aprice2@multiply.com', '2016-06-09');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (4, 'Rebecca', 'Campbell', 'rcampbell3', 'a4AETjCptv6', 'rcampbell3@wiley.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (5, 'Theresa', 'Armstrong', 'tarmstrong4', 'mslNiOC', 'tarmstrong4@java.com', '2016-06-08');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (6, 'Ashley', 'Stanley', 'astanley5', 'FC9w9JG', 'astanley5@homestead.com', '2016-07-08');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (7, 'Kathy', 'Lee', 'klee6', 'WUKeB0m', 'klee6@dyndns.org', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (8, 'Nancy', 'Henry', 'nhenry7', 'KJyn4fttAD8', 'nhenry7@ehow.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (9, 'Roy', 'Hunter', 'rhunter8', 'CyHfmt9AD', 'rhunter8@baidu.com', '2016-04-25');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (10, 'Matthew', 'Edwards', 'medwards9', 'p0zjSyqG0te', 'medwards9@vk.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (11, 'Joshua', 'Patterson', 'jpattersona', 'oRURrVeFndAK', 'jpattersona@discovery.com', '2015-12-27');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (12, 'Nicholas', 'Cox', 'ncoxb', 'wskXijkAf', 'ncoxb@sciencedaily.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (13, 'Norma', 'Kelly', 'nkellyc', '7h0RJNUml6T', 'nkellyc@shop-pro.jp', '2016-12-27');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (14, 'Keith', 'Gardner', 'kgardnerd', 'CjaT2ZQxSgwc', 'kgardnerd@washington.edu', '2016-07-23');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (15, 'Anna', 'Anderson', 'aandersone', 'vxXU94g', 'aandersone@sbwire.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (16, 'Randy', 'Williamson', 'rwilliamsonf', 'M8vEvBOl31w', 'rwilliamsonf@mit.edu', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (17, 'Alice', 'Brown', 'abrowng', '2eSeiPHl87r', 'abrowng@pinterest.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (18, 'Ralph', 'Spencer', 'rspencerh', 'VXUIKj6MKiY', 'rspencerh@foxnews.com', '2015-11-15');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (19, 'Norma', 'Hunter', 'nhunteri', 'D7p6WGJFBWj', 'nhunteri@parallels.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (20, 'Keith', 'Wallace', 'kwallacej', 'iZFWq4Ygm23t', 'kwallacej@umich.edu', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (21, 'Gerald', 'Chavez', 'gchavezk', 'vQz5oqy7', 'gchavezk@comsenz.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (22, 'Jimmy', 'Gonzales', 'jgonzalesl', 'zd9SEiu', 'jgonzalesl@bloglovin.com', '2016-05-27');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (23, 'Debra', 'Peterson', 'dpetersonm', 'VEcKie80L', 'dpetersonm@sitemeter.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (24, 'Margaret', 'Spencer', 'mspencern', 'uzicLEiu', 'mspencern@macromedia.com', '2016-05-24');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (25, 'Sarah', 'Nichols', 'snicholso', '9u2PpyaI', 'snicholso@seattletimes.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (26, 'Frank', 'Fox', 'ffoxp', 'pWNPiOzEaJS', 'ffoxp@wix.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (27, 'Janice', 'Smith', 'jsmithq', 'LGCh8Tat2urs', 'jsmithq@pagesperso-orange.fr', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (28, 'Anne', 'Robertson', 'arobertsonr', '3yjJosmg', 'arobertsonr@wunderground.com', '2015-12-06');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (29, 'Paula', 'Carpenter', 'pcarpenters', '9TOsoie6y', 'pcarpenters@desdev.cn', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (30, 'George', 'Matthews', 'gmatthewst', 'cvzNmABHW', 'gmatthewst@blog.com', '2016-09-19');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (31, 'Lillian', 'Reed', 'lreedu', '4Uxffwl3d', 'lreedu@seattletimes.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (32, 'Justin', 'Nguyen', 'jnguyenv', 'lsHvsbaG', 'jnguyenv@stumbleupon.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (33, 'Nancy', 'Greene', 'ngreenew', 'cFYpkcpa', 'ngreenew@abc.net.au', '2016-02-23');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (34, 'Kelly', 'George', 'kgeorgex', 'BUjExzRHYi', 'kgeorgex@aol.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (35, 'Martha', 'Fields', 'mfieldsy', 'GqNpWUJhdi', 'mfieldsy@yahoo.co.jp', '2016-04-29');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (36, 'Gerald', 'Montgomery', 'gmontgomeryz', 'w8g5PVzAwgW', 'gmontgomeryz@imageshack.us', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (37, 'Bonnie', 'Ryan', 'bryan10', '72NKMiad1', 'bryan10@php.net', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (38, 'Julie', 'Burton', 'jburton11', '2raD2rA8', 'jburton11@nytimes.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (39, 'Kathy', 'Bishop', 'kbishop12', '4HSlz0PamSF', 'kbishop12@princeton.edu', '2015-12-05');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (40, 'Shawn', 'Price', 'sprice13', 'a3DaeqH', 'sprice13@cargocollective.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (41, 'Rachel', 'Reyes', 'rreyes14', 'hof13TPb', 'rreyes14@wired.com', '2016-11-06');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (42, 'Rebecca', 'Lopez', 'rlopez15', 'Jy4xNt3wT5ZB', 'rlopez15@apache.org', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (43, 'Harold', 'Reed', 'hreed16', 'oINgTkVeV', 'hreed16@amazon.co.jp', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (44, 'Kathryn', 'George', 'kgeorge17', 'gCrIPAqx', 'kgeorge17@histats.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (45, 'Carolyn', 'Montgomery', 'cmontgomery18', 'LOvnXT', 'cmontgomery18@symantec.com', '2016-10-03');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (46, 'Kathleen', 'Carr', 'kcarr19', 'XJWilgeF4XgO', 'kcarr19@nationalgeographic.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (47, 'Wayne', 'Ramirez', 'wramirez1a', 'wIepcrXUZ', 'wramirez1a@bizjournals.com', '2016-07-16');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (48, 'Brenda', 'Webb', 'bwebb1b', 'inNYXIdkEi', 'bwebb1b@ustream.tv', '2016-12-17');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (49, 'Jennifer', 'Stephens', 'jstephens1c', 'h3ZZzt', 'jstephens1c@google.de', '2016-11-18');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (50, 'Ann', 'Collins', 'acollins1d', 'dFLt1Os9eUdE', 'acollins1d@ftc.gov', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (51, 'Linda', 'Fernandez', 'lfernandez1e', 'ZD1sYaxr', 'lfernandez1e@quantcast.com', '2016-08-12');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (52, 'Daniel', 'Griffin', 'dgriffin1f', 'Z8NYTN3', 'dgriffin1f@ted.com', '2016-07-29');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (53, 'Carol', 'Simpson', 'csimpson1g', 'YH260j405vRG', 'csimpson1g@goodreads.com', '2016-07-22');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (54, 'Annie', 'Harvey', 'aharvey1h', '4eQ7ac6JH4g', 'aharvey1h@weebly.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (55, 'Harry', 'Knight', 'hknight1i', 'cIE0UGxSuQTX', 'hknight1i@boston.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (56, 'Anthony', 'Dean', 'adean1j', '2Ro1z3PHP', 'adean1j@sogou.com', '2015-12-18');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (57, 'Joe', 'Greene', 'jgreene1k', 'sPORLjRYBf', 'jgreene1k@bandcamp.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (58, 'George', 'Morales', 'gmorales1l', 'btLXAAwcvY7q', 'gmorales1l@gov.uk', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (59, 'Roy', 'Andrews', 'randrews1m', 'TbGO7kSqNL', 'randrews1m@icq.com', '2016-02-22');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (60, 'Wanda', 'Weaver', 'wweaver1n', 'B1HSyKh', 'wweaver1n@omniture.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (61, 'Eugene', 'Cook', 'ecook1o', 'cQk2Exjh', 'ecook1o@usatoday.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (62, 'George', 'Turner', 'gturner1p', 'Pj77KQE0', 'gturner1p@is.gd', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (63, 'Lisa', 'Jacobs', 'ljacobs1q', '1azto1G', 'ljacobs1q@usnews.com', '2016-05-18');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (64, 'Frank', 'Marshall', 'fmarshall1r', 'hiAsiwI', 'fmarshall1r@hp.com', '2016-12-13');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (65, 'Judith', 'Lawrence', 'jlawrence1s', 'IBxPJPHigZ7K', 'jlawrence1s@yahoo.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (66, 'Lillian', 'Mccoy', 'lmccoy1t', 'ICDsVkE24', 'lmccoy1t@51.la', '2016-10-10');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (67, 'Matthew', 'Vasquez', 'mvasquez1u', 'ZsBSQTOdkt', 'mvasquez1u@booking.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (68, 'Samuel', 'Powell', 'spowell1v', 'jU9IexCR', 'spowell1v@nature.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (69, 'Laura', 'Rodriguez', 'lrodriguez1w', 'VkBN61aEi', 'lrodriguez1w@51.la', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (70, 'Gerald', 'Porter', 'gporter1x', '7gMl766', 'gporter1x@cdbaby.com', '2015-11-30');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (71, 'Anne', 'Gilbert', 'agilbert1y', 'rn2OEwqPdf5z', 'agilbert1y@mayoclinic.com', '2016-05-31');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (72, 'Craig', 'Walker', 'cwalker1z', 'QLDEjH0d8IW', 'cwalker1z@cafepress.com', '2016-09-15');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (73, 'Wayne', 'Wheeler', 'wwheeler20', 'A4BfjrOnr', 'wwheeler20@chicagotribune.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (74, 'Louise', 'Fuller', 'lfuller21', '3Gdwi95Rgw', 'lfuller21@last.fm', '2016-01-11');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (75, 'Charles', 'Baker', 'cbaker22', 'N9oLNmtmQ9hT', 'cbaker22@rambler.ru', '2016-07-06');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (76, 'Peter', 'Evans', 'pevans23', 'Ljp3QTAlHIO', 'pevans23@photobucket.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (77, 'Peter', 'Washington', 'pwashington24', 'Y8WpEx0O', 'pwashington24@odnoklassniki.ru', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (78, 'Adam', 'Castillo', 'acastillo25', 'QpdgjRE1giLf', 'acastillo25@bloglovin.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (79, 'Aaron', 'Morris', 'amorris26', 'A9rBoo', 'amorris26@marriott.com', '2016-03-03');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (80, 'Eugene', 'Hernandez', 'ehernandez27', 'fCkdYg8GTHz', 'ehernandez27@twitpic.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (81, 'Amy', 'Porter', 'aporter28', 'xXvBLH3L', 'aporter28@ucoz.ru', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (82, 'Evelyn', 'Harris', 'eharris29', '3QzdpXLB3', 'eharris29@google.it', '2016-10-12');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (83, 'Jimmy', 'Ward', 'jward2a', '3Bdnhkbs9', 'jward2a@cdbaby.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (84, 'James', 'Crawford', 'jcrawford2b', '1DmBBfK5Lk7o', 'jcrawford2b@geocities.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (85, 'Jesse', 'Henry', 'jhenry2c', 'K8rt4wWk4', 'jhenry2c@imageshack.us', '2016-10-26');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (86, 'Albert', 'White', 'awhite2d', 'Z5A4meAgz', 'awhite2d@elpais.com', '2016-06-25');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (87, 'Jane', 'Gordon', 'jgordon2e', '6v234bJB', 'jgordon2e@cpanel.net', '2016-04-18');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (88, 'Andrea', 'Henderson', 'ahenderson2f', 'HISVuBO7ddp', 'ahenderson2f@cnbc.com', '2016-11-24');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (89, 'Steve', 'Black', 'sblack2g', 'AxDhzzjxSzAq', 'sblack2g@livejournal.com', '2016-10-04');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (90, 'Kathleen', 'Parker', 'kparker2h', 'p6eXQndaV', 'kparker2h@live.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (91, 'Patricia', 'Collins', 'pcollins2i', 'mwtE1XwCW', 'pcollins2i@pagesperso-orange.fr', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (92, 'Katherine', 'Williamson', 'kwilliamson2j', 'y6W7bGnXsOxU', 'kwilliamson2j@comsenz.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (93, 'Joshua', 'Rivera', 'jrivera2k', 'gN5zYDyv', 'jrivera2k@kickstarter.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (94, 'Andrew', 'Riley', 'ariley2l', '8pdvIHHq', 'ariley2l@rakuten.co.jp', '2016-04-01');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (95, 'Catherine', 'Simpson', 'csimpson2m', '4BwFYO', 'csimpson2m@samsung.com', '2016-04-18');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (96, 'Charles', 'Gordon', 'cgordon2n', '7XCyf4bK', 'cgordon2n@github.com', '2016-04-30');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (97, 'Philip', 'Tucker', 'ptucker2o', 'aChT5KaZ0HR0', 'ptucker2o@liveinternet.ru', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (98, 'Barbara', 'Alvarez', 'balvarez2p', '0SE0IxAk', 'balvarez2p@phpbb.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (99, 'Henry', 'Rivera', 'hrivera2q', '3SX53OKmDbJJ', 'hrivera2q@shareasale.com', '');
INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `start_date`) VALUES (100, 'David', 'Hamilton', 'dhamilton2r', 'gphXN3', 'dhamilton2r@alexa.com', '');

COMMIT;


-- -----------------------------------------------------
-- Data for table `resource`
-- -----------------------------------------------------
START TRANSACTION;
USE `bootcamp`;
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (1, 'Veribet', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.\n\nIn hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.\n\nAliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'https://sfgate.com/donec/ut/dolor/morbi/vel/lectus/in.js?justo=lacinia&lacinia=erat&eget=vestibulum&tincidunt=sed&eget=magna&tempus=at&vel=nunc&pede=commodo&morbi=placerat&porttitor=praesent&lorem=blandit&id=nam&ligula=nulla&suspendisse=integer&ornare=pede&consequat=justo&lectus=lacinia&in=eget&est=tincidunt&risus=eget&auctor=tempus&sed=vel&tristique=pede&in=morbi&tempus=porttitor&sit=lorem&amet=id&sem=ligula&fusce=suspendisse&consequat=ornare&nulla=consequat&nisl=lectus&nunc=in&nisl=est&duis=risus&bibendum=auctor&felis=sed&sed=tristique&interdum=in&venenatis=tempus&turpis=sit&enim=amet&blandit=sem&mi=fusce&in=consequat&porttitor=nulla&pede=nisl&justo=nunc&eu=nisl&massa=duis&donec=bibendum&dapibus=felis&duis=sed&at=interdum', '', 'http://dummyimage.com/112x140.png/ff4444/ffffff');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (2, 'Ronstring', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.\n\nMaecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 'http://sbwire.com/duis/mattis/egestas.png?felis=nulla&fusce=sed&posuere=accumsan&felis=felis&sed=ut&lacus=at&morbi=dolor&sem=quis&mauris=odio&laoreet=consequat&ut=varius&rhoncus=integer&aliquet=ac&pulvinar=leo', '', 'http://dummyimage.com/100x197.png/cc0000/ffffff');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (3, 'Bytecard', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.\n\nNulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'https://bbb.org/tincidunt/eu.js?justo=phasellus&in=id&hac=sapien&habitasse=in&platea=sapien&dictumst=iaculis&etiam=congue&faucibus=vivamus&cursus=metus&urna=arcu&ut=adipiscing&tellus=molestie', '', 'http://dummyimage.com/219x178.png/5fa2dd/ffffff');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (4, 'Viva', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'http://cargocollective.com/nec/molestie/sed/justo/pellentesque/viverra/pede.json?sollicitudin=in&vitae=sapien&consectetuer=iaculis', '', 'http://dummyimage.com/145x231.jpg/dddddd/000000');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (5, 'Y-Solowarm', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'http://netvibes.com/in/felis/donec/semper/sapien/a/libero.html?nisl=lacus&nunc=at&rhoncus=velit&dui=vivamus&vel=vel&sem=nulla&sed=eget&sagittis=eros&nam=elementum&congue=pellentesque&risus=quisque&semper=porta&porta=volutpat&volutpat=erat&quam=quisque&pede=erat&lobortis=eros&ligula=viverra&sit=eget&amet=congue&eleifend=eget&pede=semper&libero=rutrum&quis=nulla&orci=nunc&nullam=purus&molestie=phasellus&nibh=in&in=felis&lectus=donec&pellentesque=semper&at=sapien&nulla=a&suspendisse=libero&potenti=nam&cras=dui&in=proin&purus=leo&eu=odio&magna=porttitor&vulputate=id&luctus=consequat&cum=in&sociis=consequat&natoque=ut&penatibus=nulla&et=sed&magnis=accumsan&dis=felis&parturient=ut&montes=at&nascetur=dolor&ridiculus=quis&mus=odio&vivamus=consequat&vestibulum=varius&sagittis=integer&sapien=ac&cum=leo&sociis=pellentesque&natoque=ultrices&penatibus=mattis&et=odio&magnis=donec&dis=vitae&parturient=nisi&montes=nam&nascetur=ultrices&ridiculus=libero&mus=non&etiam=mattis&vel=pulvinar&augue=nulla&vestibulum=pede', '', 'http://dummyimage.com/170x219.jpg/cc0000/ffffff');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (6, 'Bitchip', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 'https://stumbleupon.com/vehicula/condimentum/curabitur.json?id=dictumst&turpis=etiam&integer=faucibus&aliquet=cursus&massa=urna&id=ut&lobortis=tellus&convallis=nulla&tortor=ut&risus=erat&dapibus=id&augue=mauris&vel=vulputate&accumsan=elementum&tellus=nullam&nisi=varius&eu=nulla&orci=facilisi&mauris=cras&lacinia=non', '', 'http://dummyimage.com/205x176.png/dddddd/000000');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (7, 'Treeflex', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.\n\nQuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'http://mail.ru/ac/lobortis/vel/dapibus/at/diam.png?diam=nunc&vitae=proin&quam=at&suspendisse=turpis&potenti=a&nullam=pede&porttitor=posuere&lacus=nonummy&at=integer&turpis=non&donec=velit&posuere=donec&metus=diam&vitae=neque&ipsum=vestibulum&aliquam=eget&non=vulputate&mauris=ut&morbi=ultrices&non=vel&lectus=augue&aliquam=vestibulum&sit=ante&amet=ipsum&diam=primis&in=in&magna=faucibus&bibendum=orci&imperdiet=luctus&nullam=et&orci=ultrices&pede=posuere&venenatis=cubilia&non=curae&sodales=donec&sed=pharetra&tincidunt=magna&eu=vestibulum&felis=aliquet&fusce=ultrices&posuere=erat&felis=tortor&sed=sollicitudin&lacus=mi&morbi=sit&sem=amet&mauris=lobortis&laoreet=sapien&ut=sapien&rhoncus=non&aliquet=mi&pulvinar=integer&sed=ac&nisl=neque&nunc=duis&rhoncus=bibendum&dui=morbi&vel=non&sem=quam&sed=nec&sagittis=dui&nam=luctus&congue=rutrum&risus=nulla&semper=tellus&porta=in&volutpat=sagittis&quam=dui&pede=vel&lobortis=nisl&ligula=duis&sit=ac&amet=nibh&eleifend=fusce&pede=lacus&libero=purus&quis=aliquet&orci=at&nullam=feugiat&molestie=non&nibh=pretium&in=quis&lectus=lectus&pellentesque=suspendisse&at=potenti&nulla=in&suspendisse=eleifend&potenti=quam&cras=a&in=odio&purus=in&eu=hac&magna=habitasse&vulputate=platea&luctus=dictumst', '', 'http://dummyimage.com/214x170.png/5fa2dd/ffffff');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (8, 'Latlux', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 'http://statcounter.com/orci/mauris/lacinia/sapien/quis/libero.png?pede=lorem&ac=vitae&diam=mattis&cras=nibh&pellentesque=ligula&volutpat=nec&dui=sem&maecenas=duis&tristique=aliquam&est=convallis&et=nunc&tempus=proin&semper=at&est=turpis', '', 'http://dummyimage.com/247x237.jpg/dddddd/000000');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (9, 'Matsoft', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.\n\nProin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 'https://sciencedirect.com/odio.json?vestibulum=vel&sit=accumsan&amet=tellus&cursus=nisi&id=eu&turpis=orci&integer=mauris&aliquet=lacinia&massa=sapien&id=quis&lobortis=libero&convallis=nullam&tortor=sit&risus=amet&dapibus=turpis&augue=elementum&vel=ligula&accumsan=vehicula&tellus=consequat&nisi=morbi&eu=a&orci=ipsum&mauris=integer&lacinia=a&sapien=nibh&quis=in&libero=quis&nullam=justo&sit=maecenas&amet=rhoncus&turpis=aliquam&elementum=lacus&ligula=morbi&vehicula=quis&consequat=tortor&morbi=id&a=nulla&ipsum=ultrices&integer=aliquet&a=maecenas&nibh=leo&in=odio&quis=condimentum&justo=id&maecenas=luctus&rhoncus=nec&aliquam=molestie&lacus=sed&morbi=justo&quis=pellentesque&tortor=viverra&id=pede&nulla=ac&ultrices=diam', '', 'http://dummyimage.com/144x226.png/5fa2dd/ffffff');
INSERT INTO `resource` (`id`, `name`, `description`, `url`, `video`, `photo`) VALUES (10, 'Aerified', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 'http://earthlink.net/sed.jpg?sit=tortor&amet=quis&sapien=turpis&dignissim=sed&vestibulum=ante&vestibulum=vivamus&ante=tortor&ipsum=duis&primis=mattis&in=egestas&faucibus=metus&orci=aenean&luctus=fermentum&et=donec&ultrices=ut&posuere=mauris&cubilia=eget&curae=massa&nulla=tempor&dapibus=convallis&dolor=nulla&vel=neque&est=libero&donec=convallis&odio=eget&justo=eleifend&sollicitudin=luctus&ut=ultricies&suscipit=eu&a=nibh&feugiat=quisque&et=id&eros=justo&vestibulum=sit&ac=amet&est=sapien&lacinia=dignissim&nisi=vestibulum&venenatis=vestibulum&tristique=ante&fusce=ipsum&congue=primis&diam=in&id=faucibus&ornare=orci&imperdiet=luctus&sapien=et&urna=ultrices&pretium=posuere&nisl=cubilia&ut=curae&volutpat=nulla&sapien=dapibus&arcu=dolor&sed=vel&augue=est&aliquam=donec&erat=odio&volutpat=justo&in=sollicitudin&congue=ut&etiam=suscipit&justo=a&etiam=feugiat&pretium=et&iaculis=eros&justo=vestibulum&in=ac&hac=est', '', 'http://dummyimage.com/224x209.bmp/5fa2dd/ffffff');

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

