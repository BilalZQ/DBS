-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mmp
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_type_details`
--

DROP TABLE IF EXISTS `category_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_type_details` (
  `ctd_id` int(11) NOT NULL AUTO_INCREMENT,
  `ctd_name` varchar(45) NOT NULL,
  `ctd_code` varchar(45) NOT NULL,
  `category_id` int(11) NOT NULL,
  `ctd_created_at` datetime DEFAULT NULL,
  `ctd_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ctd_id`),
  UNIQUE KEY `ctd_code_UNIQUE` (`ctd_code`),
  KEY `FK_CT_category_id_idx` (`category_id`),
  CONSTRAINT `FK_CT_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_type_details`
--

LOCK TABLES `category_type_details` WRITE;
/*!40000 ALTER TABLE `category_type_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday_details`
--

DROP TABLE IF EXISTS `holiday_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_details` (
  `hd_id` int(11) NOT NULL AUTO_INCREMENT,
  `hd_name` varchar(45) NOT NULL,
  `hd_from` date NOT NULL,
  `hd_to` date NOT NULL,
  `hy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hd_id`),
  KEY `FK_hd_holidayYear_idx` (`hy_id`),
  CONSTRAINT `FK_hd_holidayYear` FOREIGN KEY (`hy_id`) REFERENCES `holiday_year` (`hy_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday_details`
--

LOCK TABLES `holiday_details` WRITE;
/*!40000 ALTER TABLE `holiday_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `holiday_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday_year`
--

DROP TABLE IF EXISTS `holiday_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_year` (
  `hy_id` int(11) NOT NULL AUTO_INCREMENT,
  `hy_name` varchar(45) NOT NULL,
  `generated_by` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`hy_id`),
  UNIQUE KEY `year_UNIQUE` (`year`),
  KEY `FK_hy_created_by_idx` (`generated_by`),
  CONSTRAINT `FK_hy_created_by` FOREIGN KEY (`generated_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday_year`
--

LOCK TABLES `holiday_year` WRITE;
/*!40000 ALTER TABLE `holiday_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `holiday_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_details`
--

DROP TABLE IF EXISTS `leave_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_of_leaves` int(11) NOT NULL,
  `encashable` enum('Yes','No') DEFAULT NULL,
  `carry_forward` enum('Yes','No') DEFAULT NULL,
  `category_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ld_category_type_idx` (`category_type_id`),
  CONSTRAINT `FK_ld_category_type` FOREIGN KEY (`category_type_id`) REFERENCES `category_type_details` (`ctd_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_details`
--

LOCK TABLES `leave_details` WRITE;
/*!40000 ALTER TABLE `leave_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_details`
--

DROP TABLE IF EXISTS `project_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_details` (
  `id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `project_model` enum('retainer','lump sum') DEFAULT NULL,
  `category_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pd_sector_idx` (`sector_id`),
  KEY `FK_pd_category_type_idx` (`category_type_id`),
  CONSTRAINT `FK_pd_category_type` FOREIGN KEY (`category_type_id`) REFERENCES `category_type_details` (`ctd_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pd_sector` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`sector_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_details`
--

LOCK TABLES `project_details` WRITE;
/*!40000 ALTER TABLE `project_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(45) NOT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_name_UNIQUE` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectors` (
  `sector_id` int(11) NOT NULL AUTO_INCREMENT,
  `sector_name` varchar(45) NOT NULL,
  PRIMARY KEY (`sector_id`),
  UNIQUE KEY `sector_name_UNIQUE` (`sector_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet_day_details`
--

DROP TABLE IF EXISTS `timesheet_day_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet_day_details` (
  `tdd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tdd_day` date NOT NULL,
  `workhours` double DEFAULT NULL,
  `tsd_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tdd_id`),
  KEY `FK_tdd_tsd_idx` (`tsd_id`),
  CONSTRAINT `FK_tdd_tsd` FOREIGN KEY (`tsd_id`) REFERENCES `timesheet_details` (`tsd_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet_day_details`
--

LOCK TABLES `timesheet_day_details` WRITE;
/*!40000 ALTER TABLE `timesheet_day_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheet_day_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet_details`
--

DROP TABLE IF EXISTS `timesheet_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet_details` (
  `tsd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsd_timesheet_id` int(11) NOT NULL,
  `tsd_category_id` int(11) NOT NULL,
  `tsd_category_type_id` int(11) NOT NULL,
  `timesheet_entry_type` enum('directly chargeable','indirectly chargeable','overhead') NOT NULL,
  PRIMARY KEY (`tsd_id`),
  KEY `FK_td_timesheet_id_idx` (`tsd_timesheet_id`),
  KEY `FK_td_category_idx` (`tsd_category_id`),
  KEY `FK_td_category_type_idx` (`tsd_category_type_id`),
  CONSTRAINT `FK_td_category` FOREIGN KEY (`tsd_category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_td_category_type` FOREIGN KEY (`tsd_category_type_id`) REFERENCES `category_type_details` (`ctd_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_td_timesheet` FOREIGN KEY (`tsd_timesheet_id`) REFERENCES `timesheets` (`timesheet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet_details`
--

LOCK TABLES `timesheet_details` WRITE;
/*!40000 ALTER TABLE `timesheet_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheet_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet_mr`
--

DROP TABLE IF EXISTS `timesheet_mr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet_mr` (
  `tsmr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tsmr_generated_by` int(11) DEFAULT NULL,
  `days` int(4) NOT NULL,
  `tsmr_created_at` datetime DEFAULT NULL,
  `tsmr_valid_till` datetime DEFAULT NULL,
  PRIMARY KEY (`tsmr_id`),
  KEY `tsmr_created_by_idx` (`tsmr_generated_by`),
  CONSTRAINT `tsmr_created_by` FOREIGN KEY (`tsmr_generated_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet_mr`
--

LOCK TABLES `timesheet_mr` WRITE;
/*!40000 ALTER TABLE `timesheet_mr` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheet_mr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheets` (
  `timesheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `timesheet_user` int(11) NOT NULL,
  `total_hours` double DEFAULT NULL,
  `time_my` date DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `timesheet_status` enum('submitted','saved','accepted','rejected') DEFAULT NULL,
  `timesheet_status_update` datetime DEFAULT NULL,
  `timesheet_caller` int(11) NOT NULL,
  PRIMARY KEY (`timesheet_id`),
  KEY `FK_timesheets_user_idx` (`timesheet_user`),
  KEY `FK_timesheets_approver_idx` (`approved_by`),
  KEY `FK_timehsheets_caller_idx` (`timesheet_caller`),
  CONSTRAINT `FK_timehsheets_caller` FOREIGN KEY (`timesheet_caller`) REFERENCES `timesheet_mr` (`tsmr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_timesheets_approver` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_timesheets_user` FOREIGN KEY (`timesheet_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `FK_users_role_idx` (`role_id`),
  KEY `FK_users_supervisor_idx` (`supervisor`),
  KEY `FK_users_region_idx` (`region_id`),
  CONSTRAINT `FK_users_region` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users_supervisor` FOREIGN KEY (`supervisor`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mmp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-09 17:13:05
