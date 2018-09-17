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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `FK_CT_category_id_idx` (`category_id`),
  CONSTRAINT `FK_CT_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `generated_by` int(11) NOT NULL,
  PRIMARY KEY (`hd_id`),
  KEY `FK_hd_holidayYear_idx` (`hy_id`),
  KEY `FK_hd_generated_by_idx` (`generated_by`),
  CONSTRAINT `FK_hd_generated_by` FOREIGN KEY (`generated_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_hd_holidayYear` FOREIGN KEY (`hy_id`) REFERENCES `holiday_year` (`hy_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday_year`
--

DROP TABLE IF EXISTS `holiday_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday_year` (
  `hy_id` int(11) NOT NULL AUTO_INCREMENT,
  `hy_name` varchar(45) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `year` year(4) NOT NULL,
  PRIMARY KEY (`hy_id`),
  UNIQUE KEY `year_UNIQUE` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presence`
--

DROP TABLE IF EXISTS `presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presence` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_date` date NOT NULL,
  `total_hours` double DEFAULT NULL,
  `leave_status` enum('full day','partial leave','no leave') DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `FK_presence_user_id_idx` (`user_id`),
  CONSTRAINT `FK_presence_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2188 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_details`
--

DROP TABLE IF EXISTS `project_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sector_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `project_model` enum('retainer','lump sum') DEFAULT NULL,
  `category_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pd_sector_idx` (`sector_id`),
  KEY `FK_pd_category_type_idx` (`category_type_id`),
  KEY `FK_pd_region_idx` (`region_id`),
  CONSTRAINT `FK_pd_category_type` FOREIGN KEY (`category_type_id`) REFERENCES `category_type_details` (`ctd_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pd_region` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pd_sector` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`sector_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timesheet_day_details`
--

DROP TABLE IF EXISTS `timesheet_day_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet_day_details` (
  `tdd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tdd_day` date NOT NULL,
  `workhours` double NOT NULL,
  `tsd_id` int(11) DEFAULT NULL,
  `holiday_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tdd_id`),
  KEY `FK_tdd_tsd_idx` (`tsd_id`),
  KEY `FK_tdd_holiday_id_idx` (`holiday_id`),
  CONSTRAINT `FK_tdd_holiday_id` FOREIGN KEY (`holiday_id`) REFERENCES `holiday_details` (`hd_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_tdd_tsd` FOREIGN KEY (`tsd_id`) REFERENCES `timesheet_details` (`tsd_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `timesheet_entry_type` enum('directly chargeable','indirectly chargeable','overhead') DEFAULT NULL,
  PRIMARY KEY (`tsd_id`),
  KEY `FK_td_timesheet_id_idx` (`tsd_timesheet_id`),
  KEY `FK_td_category_idx` (`tsd_category_id`),
  KEY `FK_td_category_type_idx` (`tsd_category_type_id`),
  CONSTRAINT `FK_td_category` FOREIGN KEY (`tsd_category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_td_category_type` FOREIGN KEY (`tsd_category_type_id`) REFERENCES `category_type_details` (`ctd_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_td_timesheet` FOREIGN KEY (`tsd_timesheet_id`) REFERENCES `timesheets` (`timesheet_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `tsmr_start_date` datetime NOT NULL,
  `tsmr_valid_till` datetime NOT NULL,
  PRIMARY KEY (`tsmr_id`),
  KEY `tsmr_created_by_idx` (`tsmr_generated_by`),
  CONSTRAINT `tsmr_created_by` FOREIGN KEY (`tsmr_generated_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheets` (
  `timesheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `timesheet_user` int(11) NOT NULL,
  `time_my` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `timesheet_status` enum('submitted','saved','accepted','rejected') DEFAULT NULL,
  `timesheet_status_update` datetime DEFAULT NULL,
  `timesheet_caller` int(11) NOT NULL,
  `tsmr_extension` datetime DEFAULT NULL,
  PRIMARY KEY (`timesheet_id`),
  KEY `FK_timesheets_user_idx` (`timesheet_user`),
  KEY `FK_timesheets_approver_idx` (`updated_by`),
  KEY `FK_timehsheets_caller_idx` (`timesheet_caller`),
  CONSTRAINT `FK_timehsheets_caller` FOREIGN KEY (`timesheet_caller`) REFERENCES `timesheet_mr` (`tsmr_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_timesheets_approver` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_timesheets_user` FOREIGN KEY (`timesheet_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `employee_id` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `region_id` int(11) NOT NULL,
  `user_primary_department` int(11) DEFAULT NULL,
  `user_primary_project` int(11) DEFAULT NULL,
  `user_status` enum('active','inactive') DEFAULT NULL,
  `join_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  KEY `FK_users_role_idx` (`role_id`),
  KEY `FK_users_supervisor_idx` (`supervisor`),
  KEY `FK_users_region_idx` (`region_id`),
  KEY `FK_user_primary_department_idx` (`user_primary_department`),
  KEY `FK_user_primary_project_idx` (`user_primary_project`),
  CONSTRAINT `FK_user_primary_department` FOREIGN KEY (`user_primary_department`) REFERENCES `category_type_details` (`ctd_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_user_primary_project` FOREIGN KEY (`user_primary_project`) REFERENCES `category_type_details` (`ctd_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_users_region` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_users_supervisor` FOREIGN KEY (`supervisor`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'mmp'
--

--
-- Dumping routines for database 'mmp'
--
/*!50003 DROP PROCEDURE IF EXISTS `ReportCategoryTotalHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportCategoryTotalHours`(IN category_id INT(11), startDate VARCHAR(10), endDate VARCHAR(10))
BEGIN
		SELECT ctd.ctd_name, SUM(tdd.workhours) AS totalHours
        FROM timesheet_day_details tdd
        INNER JOIN timesheet_details tsd ON tdd.tsd_id = tsd.tsd_id
        INNER JOIN category_type_details ctd ON tsd.tsd_category_type_id = ctd.ctd_id
        WHERE tsd.tsd_category_id = category_id
		AND (tdd.tdd_day between startDate AND endDate)
		GROUP BY ctd.ctd_name;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportCategoryUserWorkHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportCategoryUserWorkHours`(IN category_id INT(11), startDate VARCHAR(10), endDate VARCHAR(10))
BEGIN
		SELECT ctd.ctd_name, u.user_name, SUM(tdd.workhours) AS totalHours
        FROM timesheet_day_details tdd
        INNER JOIN timesheet_details tsd ON tdd.tsd_id = tsd.tsd_id
        INNER JOIN category_type_details ctd ON tsd.tsd_category_type_id = ctd.ctd_id
        INNER JOIN timesheets ts ON ts.timesheet_id = tsd.tsd_timesheet_id
        INNER JOIN users u ON ts.timesheet_user = u.user_id
        WHERE tsd.tsd_category_id = category_id
		AND (tdd.tdd_day between startDate AND endDate)
		ORDER BY tdd.tdd_day ASC;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportLeaves` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportLeaves`(IN userID INT(11), startDate VARCHAR(10), endDate VARCHAR(10))
BEGIN
		SELECT tdd.tdd_day, ctd.ctd_name, tdd.workhours
        FROM timesheet_day_details tdd
        INNER JOIN timesheet_details tsd ON tdd.tsd_id = tsd.tsd_id
        INNER JOIN category_type_details ctd ON tsd.tsd_category_type_id = ctd.ctd_id
        INNER JOIN timesheets ts ON ts.timesheet_id = tsd.tsd_timesheet_id
        WHERE tsd.tsd_category_id = (SELECT category_id
									 FROM categories
									 WHere category_name = "leaves")
		AND (tdd.tdd_day between startDate AND endDate)
        AND ts.timesheet_user = userID
		ORDER BY tdd.tdd_day ASC;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportLeavesTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportLeavesTotal`(IN userID INT(11), startDate VARCHAR(10), endDate VARCHAR(10))
BEGIN
		SELECT ctd.ctd_name, ctd_code, 7.5*(ld.no_of_leaves) As totalHoursAllowed, ld.encashable, ld.carry_forward, SUM(tdd.workhours) As totalHours
        FROM timesheet_day_details tdd
        INNER JOIN timesheet_details tsd ON tdd.tsd_id = tsd.tsd_id
        INNER JOIN category_type_details ctd ON tsd.tsd_category_type_id = ctd.ctd_id
        INNER JOIN timesheets ts ON ts.timesheet_id = tsd.tsd_timesheet_id
        INNER JOIN leave_details ld ON ctd.ctd_id = ld.category_type_id
        WHERE tsd.tsd_category_id = (SELECT category_id
									 FROM categories
									 WHere category_name = "leaves")
		AND (tdd.tdd_day between startDate AND endDate)
        AND ts.timesheet_user = userID
		GROUP BY ctd.ctd_name;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportSectorProjectTotalHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportSectorProjectTotalHours`(IN sectorID INT(11), startDate VARCHAR(10), endDate VARCHAR(10))
BEGIN
		SELECT ctd.ctd_name, SUM(tdd.workhours) AS totalHours
        FROM timesheet_day_details tdd
        INNER JOIN timesheet_details tsd ON tdd.tsd_id = tsd.tsd_id
        INNER JOIN category_type_details ctd ON tsd.tsd_category_type_id = ctd.ctd_id
        INNER JOIN project_details pd ON ctd.ctd_id = pd.category_type_id
        WHERE tsd.tsd_category_id = (SELECT category_id
									 FROM categories
									 WHere category_name = "projects")
		AND (tdd.tdd_day between startDate AND endDate)
        AND pd.sector_id = sectorID
		GROUP BY ctd.ctd_name;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportUsProjectTotalWorkHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportUsProjectTotalWorkHours`(IN userID INT(11), startDate VARCHAR(10), endDate VARCHAR(10))
BEGIN
		SELECT ctd.ctd_name, SUM(tdd.workhours) AS totalHours
        FROM timesheet_day_details tdd
        INNER JOIN timesheet_details tsd ON tdd.tsd_id = tsd.tsd_id
        INNER JOIN category_type_details ctd ON tsd.tsd_category_type_id = ctd.ctd_id
        INNER JOIN timesheets ts ON ts.timesheet_id = tsd.tsd_timesheet_id
        WHERE tsd.tsd_category_id = (SELECT category_id
									 FROM categories
									 WHere category_name = "projects")
		AND (tdd.tdd_day between startDate AND endDate)
        AND ts.timesheet_user = userID#(SELECT user_id FROM users WHERE user = userID)
		GROUP BY ctd.ctd_name;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReportUsProjectWorkHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReportUsProjectWorkHours`(IN userID INT(11), startDate VARCHAR(10), endDate VARCHAR(10))
BEGIN
		SELECT tdd.tdd_day, ctd.ctd_name, tdd.workhours
        FROM timesheet_day_details tdd
        INNER JOIN timesheet_details tsd ON tdd.tsd_id = tsd.tsd_id
        INNER JOIN category_type_details ctd ON tsd.tsd_category_type_id = ctd.ctd_id
        INNER JOIN timesheets ts ON ts.timesheet_id = tsd.tsd_timesheet_id
        WHERE tsd.tsd_category_id = (SELECT category_id
									 FROM categories
									 WHere category_name = "projects")
		AND (tdd.tdd_day between startDate AND endDate)
        AND ts.timesheet_user = userID#(SELECT user_id FROM users WHERE user = userID)
		ORDER BY tdd.tdd_day ASC;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-17 12:43:10
