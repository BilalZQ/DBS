-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: surveydb
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answer_choices`
--

DROP TABLE IF EXISTS `answer_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) NOT NULL,
  `question_option_choice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ac_answer_id_idx` (`answer_id`),
  KEY `FK_ac_qoc_id_idx` (`question_option_choice`),
  CONSTRAINT `FK_ac_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ac_qoc_id` FOREIGN KEY (`question_option_choice`) REFERENCES `question_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `answer_numeric` double DEFAULT NULL,
  `answer_text` mediumtext,
  `answer_yn` tinyint(1) DEFAULT NULL,
  `answer_json` longtext,
  `unit_of_measure_id` int(11) DEFAULT NULL,
  `user_completed_survey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_answer_user_id_idx` (`user_id`),
  KEY `FK_answer_uom_idx` (`unit_of_measure_id`),
  KEY `FK_answer_to_survey_idx` (`user_completed_survey_id`),
  CONSTRAINT `FK_answer_to_survey` FOREIGN KEY (`user_completed_survey_id`) REFERENCES `user_completed_survey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_answer_uom` FOREIGN KEY (`unit_of_measure_id`) REFERENCES `unit_of_measures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_answer_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fertilizers`
--

DROP TABLE IF EXISTS `fertilizers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fertilizers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `nitrogen` double DEFAULT NULL,
  `phosphorus` double DEFAULT NULL,
  `potash` double DEFAULT NULL,
  `zinc` double DEFAULT NULL,
  `magnesium` double DEFAULT NULL,
  `boron` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `input_types`
--

DROP TABLE IF EXISTS `input_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `input_type_name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `option_choices`
--

DROP TABLE IF EXISTS `option_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_group_id` int(11) NOT NULL,
  `option_choice_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_choice_name_UNIQUE` (`option_choice_name`),
  KEY `FK_option_group_idx` (`option_group_id`),
  CONSTRAINT `FK_option_group` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `option_group_question`
--

DROP TABLE IF EXISTS `option_group_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_group_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ogq_question_id_idx` (`question_id`),
  KEY `FK_ogq_group_id_idx` (`option_group_id`),
  CONSTRAINT `FK_ogq_group_id` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ogq_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `option_groups`
--

DROP TABLE IF EXISTS `option_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_group_name_UNIQUE` (`option_group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_group_question_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qo_ogq_id_idx` (`option_group_question_id`),
  KEY `FK_qo_choice_id_idx` (`choice_id`),
  CONSTRAINT `FK_qo_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `option_choices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_qo_ogq_id` FOREIGN KEY (`option_group_question_id`) REFERENCES `option_group_question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `survey_id` int(11) NOT NULL,
  `survey_section_id` int(11) DEFAULT NULL,
  `input_type_id` int(11) NOT NULL,
  `question_title` varchar(25) NOT NULL,
  `question` varchar(255) NOT NULL,
  `question_desc` varchar(500) DEFAULT NULL,
  `question_detailrptb` varchar(45) DEFAULT NULL,
  `question_required_yn` tinyint(1) DEFAULT '0',
  `answer_required_yn` tinyint(1) DEFAULT '0',
  `allow_multi_option_answer_yn` tinyint(1) DEFAULT '0',
  `dependant_question_id` int(11) DEFAULT NULL,
  `dependant_question_option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parent_id_idx` (`parent_id`),
  KEY `FK_input_type_id` (`input_type_id`),
  KEY `FK_dependent_question_option_id` (`dependant_question_option_id`),
  KEY `FK_survey_id_idx` (`survey_id`),
  KEY `FK_survey_q_idx` (`survey_id`),
  KEY `FK_dependent_question_id` (`dependant_question_id`),
  KEY `FK_survey_section_idx` (`survey_section_id`),
  CONSTRAINT `FK_dependent_question_id` FOREIGN KEY (`dependant_question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dependent_question_option_id` FOREIGN KEY (`dependant_question_option_id`) REFERENCES `option_choices` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_input_type_id` FOREIGN KEY (`input_type_id`) REFERENCES `input_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `questions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_survey_q` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_survey_section` FOREIGN KEY (`survey_section_id`) REFERENCES `survey_sections` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `tehsil` varchar(45) NOT NULL,
  `schedule_date` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `valid_till` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_schedule_created_by_idx` (`created_by`),
  CONSTRAINT `FK_schedule_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_headers`
--

DROP TABLE IF EXISTS `survey_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_headers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_header` varchar(100) NOT NULL,
  `instructions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `survey_sections`
--

DROP TABLE IF EXISTS `survey_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `section_name` varchar(100) NOT NULL,
  `survey_section_required_yn` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_survey_id_section_idx` (`survey_id`),
  CONSTRAINT `FK_survey_id_section` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_header_id` int(11) NOT NULL,
  `survey_name` varchar(200) DEFAULT NULL,
  `survey_title` varchar(100) DEFAULT NULL,
  `survey_required_yn` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_surveys_header_idx` (`survey_header_id`),
  CONSTRAINT `FK_surveys_header` FOREIGN KEY (`survey_header_id`) REFERENCES `survey_headers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tehsils`
--

DROP TABLE IF EXISTS `tehsils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tehsils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_id` int(11) NOT NULL,
  `tehsil_name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `district_id` (`district_id`),
  CONSTRAINT `FK_districtID` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unit_of_measures`
--

DROP TABLE IF EXISTS `unit_of_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_of_measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_of_measure` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_completed_survey`
--

DROP TABLE IF EXISTS `user_completed_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_completed_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `tehsil_id` int(11) NOT NULL,
  `survey_start_at` datetime DEFAULT NULL,
  `survey_completed_at` datetime DEFAULT NULL,
  `survey_duration` int(20) DEFAULT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `ucs_updated_at` datetime DEFAULT NULL,
  `ucs_updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_surveyor_idx` (`user_id`),
  KEY `FK_survey_id_idx` (`survey_id`),
  KEY `FK_ucs_district_id_idx` (`district_id`),
  KEY `FK_ucs_tehsil_id_idx` (`tehsil_id`),
  KEY `FK_ucs_updated_by_idx` (`ucs_updated_by`),
  CONSTRAINT `FK_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_surveyor` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ucs_district_id` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ucs_tehsil_id` FOREIGN KEY (`tehsil_id`) REFERENCES `tehsils` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ucs_updated_by` FOREIGN KEY (`ucs_updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `password_hashed` varchar(191) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobile_no` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `user_type` enum('admin','surveyor') NOT NULL,
  `user_status` enum('active','inactive') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `password_hashed_UNIQUE` (`password_hashed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'surveydb'
--

--
-- Dumping routines for database 'surveydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-11 19:04:19
