-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema codingdojo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema codingdojo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `codingdojo` DEFAULT CHARACTER SET latin1 ;
USE `codingdojo` ;

-- -----------------------------------------------------
-- Table `codingdojo`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codingdojo`.`students` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(60) NULL DEFAULT NULL,
  `last_name` VARCHAR(60) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `codingdojo`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codingdojo`.`courses` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(120) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `codingdojo`.`course_students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codingdojo`.`course_students` (
  `students_id` INT(11) NOT NULL,
  `courses_id` INT(11) NOT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`students_id`, `courses_id`),
  INDEX `fk_students_has_courses_courses1_idx` (`courses_id` ASC),
  INDEX `fk_students_has_courses_students_idx` (`students_id` ASC),
  CONSTRAINT `fk_students_has_courses_students`
    FOREIGN KEY (`students_id`)
    REFERENCES `codingdojo`.`students` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_students_has_courses_courses1`
    FOREIGN KEY (`courses_id`)
    REFERENCES `codingdojo`.`courses` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
