-- MySQL Script generated by MySQL Workbench
-- 08/31/15 16:27:21
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `blog` ;

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`users` ;

CREATE TABLE IF NOT EXISTS `blog`.`users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `username` VARCHAR(50) NOT NULL COMMENT '',
  `password` VARCHAR(100) NOT NULL COMMENT '',
  `first_name` VARCHAR(50) NOT NULL COMMENT '',
  `last_name` VARCHAR(50) NOT NULL COMMENT '',
  `email` VARCHAR(50) NOT NULL COMMENT '',
  `last_login` INT(10) UNSIGNED NULL COMMENT '',
  `login_hash` VARCHAR(100) NULL COMMENT '',
  `created_at` INT(10) UNSIGNED NOT NULL COMMENT '',
  `modified_at` INT(10) UNSIGNED NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `blog`.`users` (`username` ASC)  COMMENT '';

CREATE UNIQUE INDEX `email_UNIQUE` ON `blog`.`users` (`email` ASC)  COMMENT '';


-- -----------------------------------------------------
-- Table `blog`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`posts` ;

CREATE TABLE IF NOT EXISTS `blog`.`posts` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `author_id` INT(11) UNSIGNED NOT NULL COMMENT '',
  `title` VARCHAR(100) NOT NULL COMMENT '',
  `content` TEXT NOT NULL COMMENT '',
  `image` VARCHAR(100) NULL COMMENT '',
  `created_at` INT(10) UNSIGNED NOT NULL COMMENT '',
  `modified_at` INT(10) UNSIGNED NULL COMMENT '',
  `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  CONSTRAINT `fk_posts_users`
    FOREIGN KEY (`author_id`)
    REFERENCES `blog`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_posts_users_idx` ON `blog`.`posts` (`author_id` ASC)  COMMENT '';


-- -----------------------------------------------------
-- Table `blog`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog`.`comments` ;

CREATE TABLE IF NOT EXISTS `blog`.`comments` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '',
  `author_id` INT(11) UNSIGNED NOT NULL COMMENT '',
  `post_id` INT(11) UNSIGNED NOT NULL COMMENT '',
  `content` TEXT NOT NULL COMMENT '',
  `created_at` INT(10) UNSIGNED NOT NULL COMMENT '',
  `modified_at` INT(10) UNSIGNED NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`author_id`)
    REFERENCES `blog`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`post_id`)
    REFERENCES `blog`.`posts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_comments_users1_idx` ON `blog`.`comments` (`author_id` ASC)  COMMENT '';

CREATE INDEX `fk_comments_posts1_idx` ON `blog`.`comments` (`post_id` ASC)  COMMENT '';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
