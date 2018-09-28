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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_option_id` int(11) NOT NULL,
  `answer_numeric` double DEFAULT NULL,
  `answer_text` mediumtext,
  `answer_yn` tinyint(1) DEFAULT NULL,
  `answer_json` longtext,
  `unit_of_measure_id` int(11) DEFAULT NULL,
  `user_completed_survey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_answer_user_id_idx` (`user_id`),
  KEY `FK_answer_option_id_idx` (`question_option_id`),
  KEY `FK_answer_uom_idx` (`unit_of_measure_id`),
  KEY `FK_answer_to_survey_idx` (`user_completed_survey_id`),
  CONSTRAINT `FK_answer_option_id` FOREIGN KEY (`question_option_id`) REFERENCES `question_options` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_answer_to_survey` FOREIGN KEY (`user_completed_survey_id`) REFERENCES `user_completed_surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_answer_uom` FOREIGN KEY (`unit_of_measure_id`) REFERENCES `unit_of_measures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_answer_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (2300,7,1,NULL,'',NULL,'',1,48),(2301,7,11,NULL,'jhcuyv',NULL,'',1,48),(2302,7,15,NULL,'hgcguc',NULL,'',1,48),(2303,7,16,NULL,'ucucyuviy',NULL,'',1,48),(2304,7,17,NULL,'jcgucjv',NULL,'',1,48),(2305,7,205,868,'',NULL,'',1,48),(2306,7,206,880,'',NULL,'',1,48),(2307,7,31,NULL,'',0,'',1,48),(2308,7,32,NULL,'hcuyfuc',NULL,'',1,48),(2309,7,33,NULL,'',1,'',1,48),(2310,7,35,NULL,'',1,'',1,48),(2311,7,38,NULL,'',0,'',1,48),(2312,7,40,NULL,'',0,'',1,48),(2313,7,42,NULL,'',0,'',1,48),(2314,7,44,NULL,'',0,'',1,48),(2315,7,45,NULL,'',1,'',1,48),(2316,7,286,NULL,'',NULL,'',1,48),(2317,7,207,6,'',NULL,'',1,48),(2318,7,208,2,'',NULL,'',1,48),(2319,7,209,3,'',NULL,'',1,48),(2320,7,210,7,'',NULL,'',1,48),(2321,7,780,NULL,'',1,'',1,48),(2322,7,182,NULL,'',1,'',1,48),(2323,7,186,NULL,'',NULL,'',1,48),(2324,7,192,NULL,'',NULL,'',1,48),(2325,7,195,NULL,'jgcjvjvhj',NULL,'',1,48),(2326,7,196,NULL,'',1,'',1,48),(2327,7,199,NULL,'',0,'',1,48),(2328,7,200,NULL,'',1,'',1,48),(2329,7,202,NULL,'',NULL,'[{\"image\":\"http://magcom-001-site5.etempurl.com/UploadedImages/image1_48.jpeg\"},{\"image\":\"http://magcom-001-site5.etempurl.com/UploadedImages/image2_48.jpeg\"},{\"image\":\"http://magcom-001-site5.etempurl.com/UploadedImages/image3_48.jpeg\"},{\"image\":\"http://magcom-001-site5.etempurl.com/UploadedImages/image4_48.jpeg\"}]',1,48),(2330,7,824,NULL,'04-09-2018',NULL,'',1,48),(2331,7,825,NULL,'4:53',NULL,'',1,48),(2332,7,826,NULL,'',NULL,'',1,48),(2333,7,828,NULL,'4:54',NULL,'',1,48),(2334,7,829,NULL,'4:58',NULL,'',1,48),(2335,7,830,NULL,'nvvgvjvk',NULL,'',1,48);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Bahawalpur'),(2,'Rahim Yar Khan'),(3,'Bahawalnagar'),(4,'Dera Ghazi Khan'),(5,'Muzaffargarh'),(6,'Layyah'),(7,'Rajanpur'),(8,'Multan'),(9,'Khanewal'),(10,'Vehari'),(11,'Lodhran'),(12,'Faisalabad'),(13,'Jhang'),(14,'Chiniot'),(15,'Toba Tek Singh'),(16,'Sahiwal'),(17,'Pakpattan'),(18,'Okara'),(19,'Lahore'),(20,'Sheikhupura'),(21,'Nankana Sahib'),(22,'Kasur'),(23,'Gujranwala'),(24,'Hafizabad'),(25,'Narowal'),(26,'Sialkot'),(27,'Mandi Bahauddin'),(28,'Gujrat'),(29,'Sargodha'),(30,'Khushab'),(31,'Bhakkar'),(32,'Mianwali'),(33,'Rawalpindi'),(34,'Attock'),(35,'Chakwal'),(36,'Jhelum');
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fertilizers`
--

LOCK TABLES `fertilizers` WRITE;
/*!40000 ALTER TABLE `fertilizers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fertilizers` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `input_types`
--

LOCK TABLES `input_types` WRITE;
/*!40000 ALTER TABLE `input_types` DISABLE KEYS */;
INSERT INTO `input_types` VALUES (1,'text'),(2,'checkbox'),(3,'multi_select'),(4,'dropdown'),(5,'nested_dropdown'),(6,'radio_buttons'),(7,'gridview'),(8,'nested_gridview'),(9,'image'),(10,'numeric'),(11,'double_dropdown');
/*!40000 ALTER TABLE `input_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_choices`
--

DROP TABLE IF EXISTS `option_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_choices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_group_id` int(11) NOT NULL,
  `option_choice_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_option_group_idx` (`option_group_id`),
  CONSTRAINT `FK_option_group` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_choices`
--

LOCK TABLES `option_choices` WRITE;
/*!40000 ALTER TABLE `option_choices` DISABLE KEYS */;
INSERT INTO `option_choices` VALUES (11,2,'PLANT & FRUIT DEVELOPMENT'),(12,2,'IRRIGATION AND WEEDS MANAGEMENT'),(13,2,'FERTILIZER APPLICATION & MANAGEMENT'),(14,2,'INTEGRATED PEST MANAGEMENT'),(15,2,'INTEGRATED DISEASE MANAGEMENT'),(16,2,'FRUIT HARVEST MANAGEMENT'),(17,2,'POST HARVEST MANAGEMENT'),(18,2,'PRUNING & CANOPY MANAGEMENT'),(19,2,'MARKETING'),(20,2,'CERTIFICATION'),(21,1,'Mango'),(22,1,'Kinnow'),(23,1,'Potato'),(24,1,'V1'),(25,1,'V2'),(26,1,'V3'),(27,1,'V4'),(28,1,'V5'),(29,1,'V6'),(30,1,'V7'),(31,3,'text'),(40,7,'Yes'),(41,7,'No'),(42,8,'HARVESTING TECHNOLOGY'),(43,8,'POST HARVEST TECHNOLOGY'),(44,8,'PRUNING OF MANGO TREES'),(45,9,'Production Technology'),(46,9,'Irrigation & Fertilizer'),(47,9,'Weeds and their control'),(48,9,'Insects and their control'),(49,9,'Diseases and their control'),(50,9,'Harvesting, post harvest, marketing & trans'),(51,9,'Global GAP and SPS'),(52,10,'Importance and production technology'),(53,10,'Use of irrigation and fertilizer'),(54,10,'Tunnel farming'),(58,13,'Banners'),(59,13,'Pamphlets'),(60,13,'Brochure'),(61,13,'Informative material'),(62,13,'Cards'),(63,13,'N/A'),(64,14,'Lectures'),(65,14,'Discussions'),(66,14,'Demonstration/Field visit'),(67,14,'Group Work'),(68,14,'Others'),(69,15,'image'),(70,11,'0-10'),(71,11,'1-30'),(72,11,'5-1000'),(73,16,'Project Area (Beneficiaries)'),(74,16,'Non Project Area'),(75,17,'Primary'),(76,17,'Middle'),(77,17,'Matric'),(78,17,'Intermediate'),(79,17,'Graduate'),(80,17,'Masters or above'),(81,18,'20-30'),(82,18,'31-40'),(83,18,'41-50'),(84,18,'Above 50'),(85,19,'grid'),(86,20,'Govt. Nursery'),(87,20,'Private Nursery'),(88,21,'Every year'),(89,21,'Once in two years'),(90,21,'Once in three years'),(91,21,'Once every four years'),(92,22,'Agriculture extension department'),(93,22,'Mango research institute Multan'),(94,22,'TV'),(95,22,'Radio'),(96,22,'News paper'),(97,22,'Zarat Nama'),(98,22,'Fertilizer marketing companies'),(99,22,'Fellow farmers'),(100,22,'Internet'),(101,22,'Private consultants / Service providers'),(102,8,'IRRIGATION AND WEEDS CONTROL'),(103,8,'FERTILIZER APPLICATION & MANAGEMENT '),(104,8,'INTEGRATED PEST MANAGEMENT '),(105,8,'INTEGRATED DISEASE MANAGEMENT'),(107,8,'CERTIFICATION '),(108,8,'MARKETING'),(109,10,'Weeds and their control'),(110,10,'Insects and their control'),(111,10,'Diseases and their control'),(112,10,'Harvesting, post harvesting, marketing & transportation'),(113,10,'Global GAP and SPS'),(114,23,'Fit'),(115,23,'Partially fit'),(116,23,'Marginally fit for used only mixed with canal water'),(117,24,'Flooding'),(118,24,'Furrow + basin'),(119,24,'Drip'),(120,25,'0'),(121,25,'1'),(122,25,'2'),(123,25,'3'),(124,25,'4'),(125,22,'Representatives of pesticides marketing companies'),(126,22,'Local pesticides sales agents'),(127,26,'Directly from the company sale point'),(128,26,'From the local pesticide shops/agent'),(132,27,'Fully Satisfied'),(133,27,'Partially Satisfied'),(134,27,'Not Satisfied'),(135,28,'Chemical'),(136,28,'Cultural'),(137,28,'Both'),(138,29,'Fodder'),(139,29,'Cereals'),(140,29,'Vegetables'),(141,29,'Fruit plants (Papaya, Falsa)'),(142,30,'Light pruning every year'),(143,30,'Pruned after every 2 years'),(144,30,'Pruned after every 3 years'),(145,30,'Pruned after every 4 or more years'),(146,30,'No pruning'),(147,31,'Sold to Contractor'),(148,31,'Direct marketing'),(149,32,'Sold at flowering stage'),(150,32,'Sold at early fruit development stage'),(151,32,'Sold at full fruit development stage'),(152,32,'Sold for longer periods'),(153,33,'Sold to processor/exporter at factory gate'),(154,33,'Fruit sold to contractor, processor, exporter at the farm gate after harvest per weight'),(155,33,'Supplied or sold to super stores'),(156,33,'Direct export from the orchard'),(157,34,'Size'),(158,34,'Shoulder development'),(159,34,'Hardness'),(160,34,'Brix level'),(161,35,'Scissors'),(162,35,'Harvesting ladders'),(163,35,'Back mounted Harvesting bags'),(164,35,'Local improvised bags (Jholi)'),(165,36,'Wooden crates:'),(166,36,'Plastic crates'),(167,36,'Card board boxes'),(168,36,'Others'),(169,37,'Calcium Carbide'),(170,37,'Ethylene Chamber'),(171,37,'Ethylene sache'),(172,38,'Radio'),(173,38,'TV'),(174,38,'Internet'),(175,38,'Fellow Farmers'),(176,38,'Local Trader / Commission Agents'),(177,38,'Agriculture Marketing Department'),(178,22,'OFWM'),(179,22,'Agriculture research department'),(180,38,'Processors / Exporters'),(181,39,'Market prices'),(182,39,'Weather'),(183,39,'Consideration of effect on the next crop'),(184,40,'Plastic buckets'),(185,40,'Wooden crates'),(186,40,'Palli'),(187,40,'Loose in open trolley'),(188,40,'Card board boxes'),(189,33,'Sold to the local commission agent'),(190,41,'Yes'),(191,41,'No'),(192,41,'N/A'),(193,16,'Project Area (Non Beneficiaries)'),(194,11,'Open Numeric'),(195,42,'Actual (Planned)'),(196,42,'Rescheduled/Makeup.');
/*!40000 ALTER TABLE `option_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_groups`
--

DROP TABLE IF EXISTS `option_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_groups`
--

LOCK TABLES `option_groups` WRITE;
/*!40000 ALTER TABLE `option_groups` DISABLE KEYS */;
INSERT INTO `option_groups` VALUES (1,'Product'),(2,'Kinnow-Module'),(3,'text'),(7,'boolean'),(8,'Mango-Module'),(9,'Potato-Module'),(10,'Vegetable-Module'),(11,'Numeric'),(13,'IEC-List'),(14,'training-tools'),(15,'image'),(16,'area'),(17,'Education'),(18,'respondent-age'),(19,'grid'),(20,'nursery-source'),(21,'manure'),(22,'info-sources'),(23,'tubewell-fitness'),(24,'irrigation-method'),(25,'irrigation-timing'),(26,'purchase'),(27,'satisfaction'),(28,'weed-measures'),(29,'intercropping'),(30,'pruning'),(31,'sale-mode'),(32,'contractor-sold'),(33,'direct-sold'),(34,'harvest-stage'),(35,'harvest-tools'),(36,'packing'),(37,'ripening'),(38,'market-info'),(39,'considerations'),(40,'kinnow-packing'),(41,'3choices'),(42,'training');
/*!40000 ALTER TABLE `option_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Mango'),(2,'Kinnow'),(3,'Potato'),(4,'V1'),(5,'V2'),(6,'V3'),(7,'V4'),(8,'V5'),(9,'V6'),(10,'V7');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_options`
--

DROP TABLE IF EXISTS `question_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_choice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_question_options_qid_idx` (`question_id`),
  KEY `FK_question_options_qcid_idx` (`option_choice_id`),
  CONSTRAINT `FK_question_options_qcid` FOREIGN KEY (`option_choice_id`) REFERENCES `option_choices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_question_options_qid` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_options`
--

LOCK TABLES `question_options` WRITE;
/*!40000 ALTER TABLE `question_options` DISABLE KEYS */;
INSERT INTO `question_options` VALUES (1,1,21),(2,1,22),(3,1,23),(4,1,24),(5,1,25),(6,1,26),(7,1,27),(8,1,28),(9,1,29),(10,1,30),(11,3,31),(15,6,31),(16,7,31),(17,8,31),(30,11,40),(31,11,41),(32,12,31),(33,13,40),(34,13,41),(35,14,40),(36,14,41),(37,15,40),(38,15,41),(39,16,40),(40,16,41),(41,17,40),(42,17,41),(43,18,40),(44,18,41),(45,19,40),(46,19,41),(182,35,40),(183,35,41),(184,36,58),(185,36,59),(186,36,60),(187,36,61),(188,36,62),(189,36,63),(190,37,64),(191,37,65),(192,37,66),(193,37,67),(194,37,68),(195,38,31),(196,39,40),(197,39,41),(198,40,40),(199,40,41),(200,41,40),(201,41,41),(202,42,69),(205,9,72),(206,10,72),(207,30,70),(208,31,71),(209,32,71),(210,33,71),(211,45,73),(212,45,74),(213,46,31),(214,47,31),(215,48,31),(216,49,75),(217,49,76),(218,49,77),(219,49,78),(220,49,79),(221,49,80),(222,50,81),(223,50,82),(224,50,83),(225,50,84),(227,53,40),(228,53,41),(229,54,40),(230,54,41),(231,55,85),(232,56,86),(233,56,87),(234,57,40),(235,57,41),(236,58,85),(237,59,40),(238,59,41),(241,61,88),(242,61,89),(243,61,90),(244,61,91),(245,62,40),(246,62,41),(247,63,88),(248,63,89),(249,63,90),(250,63,91),(251,64,92),(252,64,93),(253,64,94),(254,64,95),(255,64,96),(256,64,97),(257,64,98),(258,64,99),(259,64,100),(260,64,101),(261,66,40),(262,66,41),(263,67,40),(264,67,41),(265,68,40),(266,68,41),(267,69,40),(268,69,41),(274,70,41),(275,70,40),(276,71,114),(277,71,115),(278,71,116),(286,20,42),(287,20,43),(288,20,44),(289,20,102),(290,20,103),(291,20,104),(292,20,105),(294,20,107),(295,20,108),(296,21,11),(297,21,12),(298,21,13),(299,21,14),(300,21,15),(301,21,16),(302,21,17),(303,21,18),(304,21,19),(305,21,20),(306,22,45),(307,22,46),(308,22,47),(309,22,48),(310,22,49),(311,22,50),(312,22,51),(313,23,52),(314,23,53),(315,23,54),(316,23,109),(317,23,110),(318,23,111),(319,23,112),(320,23,113),(321,24,52),(322,24,53),(323,24,54),(324,24,109),(325,24,110),(326,24,111),(327,24,112),(328,24,113),(329,25,52),(330,25,53),(331,25,54),(332,25,109),(333,25,110),(334,25,111),(335,25,112),(336,25,113),(337,26,52),(338,26,53),(339,26,54),(340,26,109),(341,26,110),(342,26,111),(343,26,112),(344,26,113),(345,27,52),(346,27,53),(347,27,54),(348,27,109),(349,27,110),(350,27,111),(351,27,112),(352,27,113),(353,28,52),(354,28,53),(355,28,54),(356,28,109),(357,28,110),(358,28,111),(359,28,112),(360,28,113),(361,29,52),(362,29,53),(363,29,54),(364,29,109),(365,29,110),(366,29,111),(367,29,112),(368,29,113),(369,72,117),(370,72,118),(371,72,119),(372,74,120),(373,74,121),(374,74,122),(375,74,123),(376,74,124),(377,75,120),(378,75,121),(379,75,122),(380,75,123),(381,75,124),(382,76,120),(383,76,121),(384,76,122),(385,76,123),(386,76,124),(387,77,120),(388,77,121),(389,77,122),(390,77,123),(391,77,124),(392,78,120),(393,78,121),(394,78,122),(395,78,123),(396,78,124),(397,79,120),(398,79,121),(399,79,122),(400,79,123),(401,79,124),(402,80,120),(403,80,121),(404,80,122),(405,80,123),(406,80,124),(407,81,120),(408,81,121),(409,81,122),(410,81,123),(411,81,124),(412,82,120),(413,82,121),(414,82,122),(415,82,123),(416,82,124),(417,83,120),(418,83,121),(419,83,122),(420,83,123),(421,83,124),(422,84,120),(423,84,121),(424,84,122),(425,84,123),(426,84,124),(427,85,120),(428,85,121),(429,85,122),(430,85,123),(431,85,124),(432,86,92),(433,86,93),(434,86,94),(435,86,95),(436,86,96),(437,86,97),(438,86,98),(439,86,99),(440,86,100),(441,86,101),(442,87,85),(443,88,85),(466,89,92),(467,89,93),(468,89,94),(469,89,95),(470,89,96),(471,89,97),(472,89,98),(473,89,99),(474,89,100),(475,89,101),(476,89,125),(477,89,126),(478,90,127),(479,90,128),(480,91,132),(481,91,133),(482,91,134),(483,92,135),(484,92,136),(485,92,137),(486,93,92),(487,93,93),(488,93,94),(489,93,95),(490,93,96),(491,93,97),(492,93,98),(493,93,99),(494,93,100),(495,93,101),(496,93,125),(497,93,126),(498,94,85),(499,95,40),(500,95,41),(501,96,138),(502,96,139),(503,96,140),(504,96,141),(510,97,142),(511,97,143),(512,97,144),(513,97,145),(514,97,146),(515,98,147),(516,98,148),(517,99,149),(518,99,150),(519,99,151),(520,99,152),(522,101,153),(523,101,154),(524,101,155),(525,101,156),(526,102,157),(527,102,158),(528,102,159),(529,102,160),(530,103,161),(531,103,162),(532,103,163),(533,103,164),(534,104,85),(535,105,85),(536,106,165),(537,106,166),(538,106,167),(539,106,168),(540,107,169),(541,107,170),(542,107,171),(543,108,172),(544,108,173),(545,108,174),(546,108,175),(547,108,176),(548,108,177),(564,126,31),(565,127,73),(566,127,74),(567,128,31),(568,129,31),(569,130,31),(570,131,75),(571,131,76),(572,131,77),(573,131,78),(574,131,79),(575,131,80),(576,132,81),(577,132,82),(578,132,83),(579,132,84),(582,135,85),(583,139,86),(584,139,87),(585,136,40),(586,136,41),(587,137,40),(588,137,41),(589,140,40),(590,140,41),(591,141,85),(592,142,40),(593,142,41),(595,144,88),(596,144,89),(597,144,90),(598,144,91),(599,145,40),(600,145,41),(601,146,88),(602,146,89),(603,146,90),(604,146,91),(605,147,92),(606,147,94),(607,147,95),(608,147,96),(609,147,97),(610,147,98),(611,147,99),(612,147,100),(613,147,179),(614,149,40),(615,149,41),(616,150,40),(617,150,41),(618,151,40),(619,151,41),(620,152,40),(621,152,41),(622,153,40),(623,153,41),(624,154,114),(625,154,115),(626,154,116),(627,155,117),(628,155,118),(629,155,119),(630,157,120),(631,157,121),(632,157,122),(633,157,123),(634,157,124),(635,158,120),(636,158,121),(637,158,122),(638,158,123),(639,158,124),(640,159,120),(641,159,121),(642,159,122),(643,159,123),(644,159,124),(645,160,120),(646,160,121),(647,160,122),(648,160,123),(649,160,124),(650,162,120),(651,162,121),(652,162,122),(653,162,123),(654,162,124),(655,163,120),(656,163,121),(657,163,122),(658,163,123),(659,163,124),(660,164,120),(661,164,121),(662,164,122),(663,164,123),(664,164,124),(665,161,120),(666,161,121),(667,161,122),(668,161,123),(669,161,124),(670,165,120),(671,165,121),(672,165,122),(673,165,123),(674,165,124),(675,166,120),(676,166,121),(677,166,122),(678,166,123),(679,166,124),(680,167,120),(681,167,121),(682,167,122),(683,167,123),(684,167,124),(685,168,120),(686,168,121),(687,168,122),(688,168,123),(689,168,124),(690,169,92),(691,169,94),(692,169,95),(693,169,96),(694,169,97),(695,169,99),(696,169,100),(697,169,178),(698,170,85),(699,171,85),(700,172,135),(701,172,136),(702,172,137),(703,173,92),(704,173,94),(705,173,95),(706,173,96),(707,173,97),(708,173,99),(709,173,100),(711,173,125),(712,173,126),(713,173,179),(714,174,127),(715,174,128),(716,175,132),(717,175,133),(718,175,134),(719,176,40),(720,176,41),(721,177,138),(722,177,139),(723,177,140),(724,178,142),(725,178,143),(726,178,144),(727,178,145),(728,178,146),(729,179,147),(730,179,148),(731,180,149),(732,180,150),(733,180,151),(734,180,152),(736,183,153),(737,183,154),(738,183,155),(739,183,156),(740,183,189),(741,184,172),(742,184,173),(743,184,174),(744,184,175),(745,184,176),(746,184,177),(747,184,180),(748,185,161),(749,185,162),(750,185,163),(751,185,164),(755,191,31),(756,192,31),(757,193,181),(758,193,182),(759,193,183),(760,194,184),(761,194,185),(762,194,186),(763,194,187),(764,194,188),(778,210,31),(779,138,85),(780,34,192),(781,34,190),(782,34,191),(783,45,193),(784,51,194),(785,52,194),(786,133,194),(787,134,194),(788,143,194),(789,60,194),(790,100,194),(791,110,194),(792,111,194),(793,112,194),(794,113,194),(795,114,194),(796,115,194),(797,116,194),(798,118,194),(799,119,194),(800,120,194),(801,121,194),(802,122,194),(803,123,194),(804,124,194),(805,125,194),(806,127,193),(807,182,194),(808,187,194),(809,188,194),(810,189,194),(811,196,194),(812,197,194),(813,198,194),(814,199,194),(815,200,194),(816,201,194),(817,203,194),(818,204,194),(819,205,194),(820,206,194),(821,207,194),(822,208,194),(823,209,194),(824,211,31),(825,212,31),(826,213,195),(827,213,196),(828,214,31),(829,215,31),(830,216,31),(831,217,69),(832,218,69);
/*!40000 ALTER TABLE `question_options` ENABLE KEYS */;
UNLOCK TABLES;

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
  `option_group_id` int(11) DEFAULT NULL,
  `allow_multi_option_answer_yn` tinyint(1) DEFAULT '0',
  `dependant_question_id` int(11) DEFAULT NULL,
  `dependant_question_option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_parent_id_idx` (`parent_id`),
  KEY `FK_input_type_id` (`input_type_id`),
  KEY `FK_option_group_id` (`option_group_id`),
  KEY `FK_survey_id_idx` (`survey_id`),
  KEY `FK_survey_q_idx` (`survey_id`),
  KEY `FK_dependent_question_id` (`dependant_question_id`),
  KEY `FK_survey_section_idx` (`survey_section_id`),
  KEY `FK_dependent_question_choice_id_idx` (`dependant_question_option_id`),
  CONSTRAINT `FK_dependent_question_choice_id` FOREIGN KEY (`dependant_question_option_id`) REFERENCES `question_options` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_dependent_question_id` FOREIGN KEY (`dependant_question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_input_type_id` FOREIGN KEY (`input_type_id`) REFERENCES `input_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_option_group_id` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `questions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_survey_q` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_survey_section` FOREIGN KEY (`survey_section_id`) REFERENCES `survey_sections` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,213,1,2,4,'1.01','Product of Value Chain',NULL,NULL,1,1,1,1,NULL,NULL),(3,1,1,2,1,'1.02','Name / No of Cluster',NULL,NULL,1,1,3,NULL,NULL,NULL),(6,3,1,2,1,'1.03','UC',NULL,NULL,1,1,3,NULL,NULL,NULL),(7,6,1,2,1,'1.04','Mauza',NULL,NULL,1,1,3,NULL,NULL,NULL),(8,7,1,2,1,'1.05','Village',NULL,NULL,1,1,3,NULL,NULL,NULL),(9,8,1,2,10,'1.06','Area of cluster','(in acre)',NULL,1,1,11,NULL,NULL,NULL),(10,9,1,2,10,'1.07','Area of present farmers','(in acre)',NULL,1,1,11,NULL,NULL,NULL),(11,10,1,2,6,'1.08','Cluster Physical Verification',NULL,NULL,1,1,7,NULL,NULL,NULL),(12,11,1,3,1,'2.01','Name of Trainer',NULL,NULL,1,1,3,NULL,NULL,NULL),(13,12,1,3,6,'2.02','ToT Conducted',NULL,NULL,1,1,7,NULL,NULL,NULL),(14,44,1,3,6,'2.03.01','Recitation from Quran',NULL,NULL,1,1,7,NULL,NULL,NULL),(15,14,1,3,6,'2.03.02','Expected Module followed',NULL,NULL,1,1,7,NULL,NULL,NULL),(16,15,1,3,6,'2.03.03','Ecosystem analysis of selected product of value chain',NULL,NULL,1,1,7,NULL,NULL,NULL),(17,16,1,3,6,'2.03.04','Review of last training',NULL,NULL,1,1,7,NULL,NULL,NULL),(18,17,1,3,6,'2.03.05','Question/Answer session held',NULL,NULL,1,1,7,NULL,NULL,NULL),(19,18,1,3,6,'2.03.06','Summary of the day: (Proceeding Register)',NULL,NULL,1,1,7,NULL,NULL,NULL),(20,43,1,3,4,'2.03.07.01','For Mango',NULL,NULL,1,1,8,NULL,1,1),(21,43,1,3,4,'2.03.07.02','For Kinnow',NULL,NULL,1,1,2,NULL,1,2),(22,43,1,3,4,'2.03.07.03','For Potato',NULL,NULL,1,1,9,NULL,1,3),(23,43,1,3,4,'2.03.07.04','For V1',NULL,NULL,1,1,10,NULL,1,4),(24,43,1,3,4,'2.03.07.05','For V2',NULL,NULL,1,1,10,NULL,1,5),(25,43,1,3,4,'2.03.07.06','For V3',NULL,NULL,1,1,10,NULL,1,6),(26,43,1,3,4,'2.03.07.07','For V4',NULL,NULL,1,1,10,NULL,1,7),(27,43,1,3,4,'2.03.07.08','For V5',NULL,NULL,1,1,10,NULL,1,8),(28,43,1,3,4,'2.03.07.09','For V6',NULL,NULL,1,1,10,NULL,1,9),(29,43,1,3,4,'2.03.07.10','For V7',NULL,NULL,1,1,10,NULL,1,10),(30,43,1,3,10,'2.03.08','Total Modules covered till now in this cluster',NULL,NULL,1,1,11,NULL,NULL,NULL),(31,30,1,3,10,'2.04','Total registered participants in the cluster',NULL,NULL,1,1,11,NULL,NULL,NULL),(32,31,1,3,10,'2.05','Number of participants present in training event',NULL,NULL,1,1,11,NULL,NULL,NULL),(33,32,1,3,10,'2.06','Other/unregistered/proxy participants in training',NULL,NULL,1,1,11,NULL,NULL,NULL),(34,33,1,3,6,'2.07','Pre-test conducted if any',NULL,NULL,1,1,41,NULL,NULL,NULL),(35,34,1,3,6,'2.08','Training started on time',NULL,NULL,1,1,7,NULL,NULL,NULL),(36,215,1,3,3,'2.11','Any IEC material at site?',NULL,NULL,1,1,13,NULL,NULL,NULL),(37,36,1,3,3,'2.12','Tools adopted for effective training delivering mechanism?',NULL,NULL,1,1,14,NULL,NULL,NULL),(38,37,1,NULL,1,'3','Issues/Challenges/Recommendations','(direct observation of monitoring staff) (If any) (Max length of char = 1000)',NULL,1,1,3,0,NULL,NULL),(39,216,1,4,6,'5.01','Photos','(3 to 4 well tag good quality including a group photo clearly showing the banner)',NULL,1,1,7,NULL,NULL,NULL),(40,39,1,4,6,'5.02','Attendance Sheet','(Copy of the attendance sheet)',NULL,1,1,7,NULL,NULL,NULL),(41,40,1,4,6,'5.03','Contents/Agenda','(printed if available)',NULL,1,1,7,NULL,NULL,NULL),(42,41,1,5,9,'6','Pictorial View',NULL,NULL,1,1,15,NULL,NULL,NULL),(43,19,1,3,1,'2.03.07.0','Module at training day:',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(44,13,1,3,1,'2.03.00','Agenda of the day shared with participants:',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(45,NULL,2,NULL,6,'01','Area',NULL,NULL,1,1,16,NULL,NULL,NULL),(46,45,2,NULL,1,'02','Name of Respondent:',NULL,NULL,1,1,3,NULL,NULL,NULL),(47,46,2,NULL,1,'03','Contact Number of Respondent:',NULL,NULL,1,1,3,NULL,NULL,NULL),(48,47,2,NULL,1,'04','Village:',NULL,NULL,1,1,3,NULL,NULL,NULL),(49,48,2,NULL,4,'05','Education level of the respondent',NULL,NULL,1,1,17,NULL,NULL,NULL),(50,49,2,NULL,4,'06','Age of the respondent',NULL,NULL,1,1,18,NULL,NULL,NULL),(51,50,2,NULL,10,'07','Total Area of the farm','(Acres)',NULL,1,1,11,NULL,NULL,NULL),(52,51,2,NULL,10,'08','Total area under Mango','(Acres)',NULL,1,1,11,NULL,NULL,NULL),(53,52,2,NULL,6,'09','Is your orchard is registered with department of plant protection?',NULL,NULL,1,1,7,NULL,NULL,NULL),(54,53,2,NULL,6,'10','Is your orchard is certified?',NULL,NULL,1,1,7,NULL,NULL,NULL),(55,54,2,NULL,7,'11','Variety wise area','(Acres)',NULL,1,1,19,NULL,NULL,NULL),(56,55,2,NULL,4,'12','What was the source of nursery plant (specify)',NULL,NULL,1,1,20,NULL,NULL,NULL),(57,56,2,NULL,6,'13','Have you done the soil testing of your land?',NULL,NULL,1,1,7,NULL,NULL,NULL),(58,57,2,NULL,7,'14','At what time of the year do you apply fertilizer?',NULL,'fertilizers',1,1,19,NULL,NULL,NULL),(59,58,2,NULL,6,'15','Do you apply farm yard manure to your orchard',NULL,NULL,1,1,7,NULL,NULL,NULL),(60,59,2,NULL,10,'15.01','If yes Quantity applied','(Maunds)',NULL,1,1,11,NULL,59,237),(61,60,2,NULL,4,'15.02','Manure Applied',NULL,NULL,1,1,21,NULL,59,237),(62,59,2,NULL,6,'16','Do you practice green manuring in your orchard?',NULL,NULL,1,1,7,NULL,NULL,NULL),(63,62,2,NULL,4,'16.01','If yes >> Intervals',NULL,NULL,1,1,21,NULL,62,245),(64,62,2,NULL,3,'17','Sources of information on soil fertility management',NULL,NULL,1,1,22,1,NULL,NULL),(65,64,2,NULL,1,'18','What is the source of irrigation water for your orchard?',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(66,65,2,NULL,6,'18.01','Canal water only',NULL,NULL,1,1,7,NULL,NULL,NULL),(67,66,2,NULL,6,'18.03','Tube well water only',NULL,NULL,1,1,7,NULL,NULL,NULL),(68,67,2,NULL,6,'18.04','Canal + tube well water',NULL,NULL,1,1,7,NULL,NULL,NULL),(69,66,2,NULL,6,'18.02','Are you using tube well',NULL,NULL,1,1,7,NULL,NULL,NULL),(70,69,2,NULL,6,'18.04.01','Do you have a test report for tube well water used?',NULL,NULL,1,1,7,NULL,69,267),(71,70,2,NULL,4,'18.04.02','Is the tube well water fit for irrigation',NULL,NULL,1,1,23,NULL,69,267),(72,68,2,NULL,4,'19','Irrigation method used',NULL,NULL,1,1,24,NULL,NULL,NULL),(73,72,2,NULL,1,'20','What are irrigation timings in the year and stage in the plant life i.e. pre-flowering, post flowering, fruit development, fruit maturity, post-harvest',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(74,73,2,NULL,4,'20.01','January',NULL,NULL,1,1,25,NULL,NULL,NULL),(75,74,2,NULL,4,'20.02','February',NULL,NULL,1,1,25,NULL,NULL,NULL),(76,75,2,NULL,4,'20.03','March',NULL,NULL,1,1,25,NULL,NULL,NULL),(77,76,2,NULL,4,'20.04','April',NULL,NULL,1,1,25,NULL,NULL,NULL),(78,77,2,NULL,4,'20.05','May',NULL,NULL,1,1,25,NULL,NULL,NULL),(79,78,2,NULL,4,'20.06','June',NULL,NULL,1,1,25,NULL,NULL,NULL),(80,79,2,NULL,4,'20.07','July',NULL,NULL,1,1,25,NULL,NULL,NULL),(81,80,2,NULL,4,'20.08','August',NULL,NULL,1,1,25,NULL,NULL,NULL),(82,81,2,NULL,4,'20.09','September',NULL,NULL,1,1,25,NULL,NULL,NULL),(83,82,2,NULL,4,'20.10','October',NULL,NULL,1,1,25,NULL,NULL,NULL),(84,83,2,NULL,4,'20.11','November',NULL,NULL,1,1,25,NULL,NULL,NULL),(85,84,2,NULL,4,'20.12','December',NULL,NULL,1,1,25,NULL,NULL,NULL),(86,85,2,NULL,3,'21','Sources of information on irrigation management',NULL,NULL,1,1,22,NULL,NULL,NULL),(87,86,2,NULL,7,'22','In your experience, what pests occur in your orchard and what is the time of occurrence vis a vis plant life cycle and what management measures do you adopt to control the pests.',NULL,NULL,1,1,19,NULL,NULL,NULL),(88,87,2,NULL,7,'23','In your experience, what diseases occur in your orchard and what is the time of occurrence via plant life cycle and what management measures do you adopt to control the pests.',NULL,NULL,1,1,19,NULL,NULL,NULL),(89,88,2,NULL,3,'24','Sources of information regarding pest management',NULL,NULL,1,1,22,NULL,NULL,NULL),(90,89,2,NULL,4,'25','If chemical control measures adopted where from do you purchase the materials',NULL,NULL,1,1,26,NULL,NULL,NULL),(91,90,2,NULL,4,'26','Are you satisfied with the quality of the chemical materials purchased?',NULL,NULL,1,1,27,NULL,NULL,NULL),(92,91,2,NULL,4,'27','What measures do you apply for controlling weeds in your orchard?',NULL,NULL,1,1,28,NULL,NULL,NULL),(93,92,2,NULL,3,'28','Sources of information on weed control',NULL,NULL,1,1,22,NULL,NULL,NULL),(94,93,2,NULL,7,'29','What is the area of the orchard against defined ranges of plant population?',NULL,NULL,1,1,19,NULL,NULL,NULL),(95,94,2,NULL,6,'30','Are you practicing inter-cropping in your orchard?',NULL,NULL,1,1,7,NULL,NULL,NULL),(96,95,2,NULL,4,'30.01','If yes, what crops?',NULL,NULL,1,1,29,NULL,95,499),(97,95,2,NULL,4,'31','What is your routine for pruning of your orchard?',NULL,NULL,1,1,30,NULL,NULL,NULL),(98,97,2,NULL,3,'32','What is the mode of sale of orchard?',NULL,NULL,1,1,31,NULL,NULL,NULL),(99,98,2,NULL,4,'32.01','If sold to the contractor then ask',NULL,NULL,1,1,32,NULL,98,515),(100,99,2,NULL,10,'30.01.01','Number of Years',NULL,NULL,1,1,11,NULL,99,520),(101,98,2,NULL,3,'32.02','If it\'s direct marketing then ask',NULL,NULL,1,1,33,NULL,98,516),(102,98,2,NULL,3,'33','Harvesting stage: (Maturity indicator)',NULL,NULL,1,1,34,NULL,NULL,NULL),(103,102,2,NULL,3,'34','What tools and equipment you use for harvesting the fruit?',NULL,NULL,1,1,35,NULL,NULL,NULL),(104,103,2,NULL,7,'35','What is the harvest calendar for your orchard?',NULL,NULL,1,1,19,NULL,NULL,NULL),(105,104,2,NULL,7,'36','What were average yield/per acre from your orchard for the last years of each variety?',NULL,NULL,1,1,19,NULL,NULL,NULL),(106,105,2,NULL,3,'37','Type of packing material used',NULL,NULL,1,1,36,NULL,NULL,NULL),(107,106,2,NULL,3,'38','Ripening agent used',NULL,NULL,1,1,37,NULL,NULL,NULL),(108,107,2,NULL,3,'39','What are the sources of information on marketing of your mango produce',NULL,NULL,1,1,38,1,NULL,NULL),(109,108,2,NULL,1,'40','In your opinion what are the losses to fruit at:',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(110,109,2,NULL,10,'40.01','At pre harvest stage (Due to wind storm, etc.) Quality of percentage:',NULL,NULL,1,1,11,NULL,NULL,NULL),(111,110,2,NULL,10,'40.02.01','Harvesting stage: Percentage of quality:',NULL,NULL,1,1,11,NULL,NULL,NULL),(112,111,2,NULL,10,'40.02.02','Harvesting stage: Percentage of quantity:',NULL,NULL,1,1,11,NULL,NULL,NULL),(113,112,2,NULL,10,'40.03.01','Ripening stage: Percentage of quality:',NULL,NULL,1,1,11,NULL,NULL,NULL),(114,113,2,NULL,10,'40.03.02','Ripening stage: Percentage of quantity:',NULL,NULL,1,1,11,NULL,NULL,NULL),(115,114,2,NULL,10,'40.04.01','During transportation: Percentage of quality:',NULL,NULL,1,1,11,NULL,NULL,NULL),(116,115,2,NULL,10,'40.04.02','During transportation: Percentage of quantity:',NULL,NULL,1,1,11,NULL,NULL,NULL),(117,116,1,NULL,1,'41','Cost of production: (bearing orchard)',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(118,117,2,NULL,10,'41.01','Fertilizer (material + labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(119,118,2,NULL,10,'41.02','Irrigation (cost of water + labor) :','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(120,119,2,NULL,10,'41.03','Soil management (ploughing, inter-culture):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(121,120,2,NULL,10,'41.04','Orchard hygiene:','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(122,121,2,NULL,10,'41.05','Integrated Pest Management cost (material + labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(123,122,2,NULL,10,'41.06','Watch & ward (labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(124,123,2,NULL,10,'41.07','Harvesting cost (machinery + labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(125,124,2,NULL,10,'41.08','Total Cost:','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(126,125,2,NULL,1,'42','Any other notes:',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(127,NULL,3,NULL,6,'01','Area',NULL,NULL,1,1,16,NULL,NULL,NULL),(128,127,3,NULL,1,'02','Name of Respondent:',NULL,NULL,1,1,3,NULL,NULL,NULL),(129,128,3,NULL,1,'03','Contact Number of Respondent:',NULL,NULL,1,1,3,NULL,NULL,NULL),(130,129,3,NULL,1,'04','Village:',NULL,NULL,1,1,3,NULL,NULL,NULL),(131,130,3,NULL,4,'05','Education level of the respondent',NULL,NULL,1,1,17,NULL,NULL,NULL),(132,131,3,NULL,4,'06','Age of the respondent',NULL,NULL,1,1,18,NULL,NULL,NULL),(133,132,3,NULL,10,'07','Total Area of the farm','(Acres)',NULL,1,1,11,NULL,NULL,NULL),(134,133,3,NULL,10,'08','Total area under Kinnow','(Acres)',NULL,1,1,11,NULL,NULL,NULL),(135,134,3,NULL,7,'08.01','Variety Wise Area',NULL,NULL,1,1,19,NULL,NULL,NULL),(136,135,3,NULL,6,'09','Is your orchard is registered with department of plant protection?',NULL,NULL,1,1,7,NULL,NULL,NULL),(137,136,3,NULL,6,'10','Is your orchard is certified?',NULL,NULL,1,1,7,NULL,NULL,NULL),(138,137,3,NULL,7,'11','Age of the orchard',NULL,NULL,1,1,19,NULL,NULL,NULL),(139,138,3,NULL,4,'12','What was the source of nursery plant (specify)',NULL,NULL,1,1,20,NULL,NULL,NULL),(140,139,3,NULL,6,'13','Have you done the soil testing of your land?',NULL,NULL,1,1,7,NULL,NULL,NULL),(141,140,3,NULL,7,'14','At what time of the year do you apply fertilizer?',NULL,NULL,1,1,19,NULL,NULL,NULL),(142,141,3,NULL,6,'15','Do you apply farm yard manure to your orchard',NULL,NULL,1,1,7,NULL,NULL,NULL),(143,142,3,NULL,10,'15.01','If yes Quantity applied','(Maunds)',NULL,1,1,11,NULL,142,592),(144,143,3,NULL,4,'15.02','Manure Applied',NULL,NULL,1,1,21,NULL,142,592),(145,142,3,NULL,6,'16','Do you practice green manuring in your orchard?',NULL,NULL,1,1,7,NULL,NULL,NULL),(146,145,3,NULL,4,'16.01','If yes >> Intervals',NULL,NULL,1,1,21,NULL,145,599),(147,145,3,NULL,3,'17','Sources of information on soil fertility management',NULL,NULL,1,1,22,1,NULL,NULL),(148,147,3,NULL,1,'18','What is the source of irrigation water for your orchard?',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(149,148,3,NULL,6,'18.01','Canal water only',NULL,NULL,1,1,7,NULL,NULL,NULL),(150,149,3,NULL,6,'18.03','Tube well water only',NULL,NULL,1,1,7,NULL,NULL,NULL),(151,150,3,NULL,6,'18.04','Canal + tube well water',NULL,NULL,1,1,7,NULL,NULL,NULL),(152,149,3,NULL,6,'18.02','Are you using tube well',NULL,NULL,1,1,7,NULL,NULL,NULL),(153,152,3,NULL,6,'18.04.01','Do you have a test report for tube well water used?',NULL,NULL,1,1,7,NULL,152,620),(154,153,3,NULL,4,'18.04.02','Is the tube well water fit for irrigation',NULL,NULL,1,1,23,NULL,152,620),(155,151,3,NULL,4,'19','Irrigation method used',NULL,NULL,1,1,24,NULL,NULL,NULL),(156,155,3,NULL,1,'20','What are irrigation timings in the year and stage in the plant life i.e. pre-flowering, post flowering, fruit development, fruit maturity, post-harvest',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(157,156,3,NULL,4,'20.01','January',NULL,NULL,1,1,25,NULL,NULL,NULL),(158,157,3,NULL,4,'20.02','February',NULL,NULL,1,1,25,NULL,NULL,NULL),(159,158,3,NULL,4,'20.03','March',NULL,NULL,1,1,25,NULL,NULL,NULL),(160,159,3,NULL,4,'20.04','April',NULL,NULL,1,1,25,NULL,NULL,NULL),(161,160,3,NULL,4,'20.05','May',NULL,NULL,1,1,25,NULL,NULL,NULL),(162,161,3,NULL,4,'20.06','June',NULL,NULL,1,1,25,NULL,NULL,NULL),(163,162,3,NULL,4,'20.07','July',NULL,NULL,1,1,25,NULL,NULL,NULL),(164,163,3,NULL,4,'20.08','August',NULL,NULL,1,1,25,NULL,NULL,NULL),(165,164,3,NULL,4,'20.09','September',NULL,NULL,1,1,25,NULL,NULL,NULL),(166,165,3,NULL,4,'20.10','October',NULL,NULL,1,1,25,NULL,NULL,NULL),(167,166,3,NULL,4,'20.11','November',NULL,NULL,1,1,25,NULL,NULL,NULL),(168,167,3,NULL,4,'20.12','December',NULL,NULL,1,1,25,NULL,NULL,NULL),(169,168,3,NULL,3,'21','Sources of information on irrigation management',NULL,NULL,1,1,22,NULL,NULL,NULL),(170,169,3,NULL,7,'22','In your experience, what pests occur in your orchard and what is the time of occurrence vis a vis plant life cycle and what management measures do you adopt to control the pests.',NULL,NULL,1,1,19,NULL,NULL,NULL),(171,170,3,NULL,7,'23','In your experience, what diseases occur in your orchard and what is the time of occurrence via plant life cycle and what management measures do you adopt to control the pests.',NULL,NULL,1,1,19,NULL,NULL,NULL),(172,171,3,NULL,4,'24','What measures do you apply for controlling weeds in your orchard?',NULL,NULL,1,1,28,NULL,NULL,NULL),(173,172,3,NULL,3,'25','Sources of information regarding pest management',NULL,NULL,1,1,22,NULL,NULL,NULL),(174,173,3,NULL,4,'26','If chemical control measures adopted where from do you purchase the materials',NULL,NULL,1,1,26,NULL,NULL,NULL),(175,174,3,NULL,4,'27','Are you satisfied with the quality of the chemical materials purchased?',NULL,NULL,1,1,27,NULL,NULL,NULL),(176,175,3,NULL,6,'28','Are you practicing intercropping in your orchard?',NULL,NULL,1,1,7,NULL,NULL,NULL),(177,176,3,NULL,4,'28.01','Which crops?',NULL,NULL,1,1,29,NULL,176,719),(178,176,3,NULL,4,'29','What is your routine for pruning of your orchard?',NULL,NULL,1,1,30,NULL,NULL,NULL),(179,178,3,NULL,3,'30','What is the mode of sale of orchard?',NULL,NULL,1,1,31,NULL,NULL,NULL),(180,179,3,NULL,4,'30.01','If sold to the contractor then ask',NULL,NULL,1,1,32,NULL,179,729),(182,180,3,NULL,10,'30.01.01','Number of years',NULL,NULL,1,1,11,NULL,180,734),(183,180,3,NULL,4,'30.02','If its direct marketing then ask',NULL,NULL,1,1,33,NULL,179,730),(184,179,3,NULL,3,'31','What are the sources of information on marketing of your Kinnow produce',NULL,NULL,1,1,38,1,NULL,NULL),(185,184,3,NULL,3,'32','What tools and equipment you use for harvesting the fruit?',NULL,NULL,1,1,35,NULL,NULL,NULL),(186,185,3,NULL,1,'33','What were average yield/per acre from your orchard for the last years?',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(187,186,3,NULL,10,'33.01','Grade A:','(Maunds)',NULL,1,1,11,NULL,NULL,NULL),(188,187,3,NULL,10,'33.02','Grade B:','(Maunds)',NULL,1,1,11,NULL,NULL,NULL),(189,188,3,NULL,10,'33.03','Grade C:','(Maunds)',NULL,1,1,11,NULL,NULL,NULL),(190,189,3,NULL,1,'34','When did you harvest your orchard last year?',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(191,190,3,NULL,1,'34.01','Date start:',NULL,NULL,1,1,3,NULL,NULL,NULL),(192,191,3,NULL,1,'34.02','Date end:',NULL,NULL,1,1,3,NULL,NULL,NULL),(193,192,3,NULL,4,'35','What are various considerations for early or late harvest?',NULL,NULL,1,1,39,NULL,NULL,NULL),(194,193,3,NULL,4,'36','What packing material do you use for transportation of the produce to the sale point?',NULL,NULL,1,1,40,NULL,NULL,NULL),(195,194,3,NULL,1,'37','What prices did you get for your crop last year?',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(196,195,3,NULL,10,'37.01','Sold to contractor at flowering stage','(PKR/Acre)',NULL,1,1,11,NULL,NULL,NULL),(197,196,3,NULL,10,'37.02','Sold to contractor at early fruit development stage:','(PKR/Acre)',NULL,1,1,11,NULL,NULL,NULL),(198,197,3,NULL,10,'37.03','Sold to contractor at full fruit development stage:','(PKR/Acre)',NULL,1,1,11,NULL,NULL,NULL),(199,198,3,NULL,10,'37.04','Sold to contractor at full maturity stage:','(PKR/Acre)',NULL,1,1,11,NULL,NULL,NULL),(200,199,3,NULL,10,'37.05','Fruit sold to contractor, processor, exporter at the farm gate after harvesting according to weight of the produce:','(PKR/Acre)',NULL,1,1,11,NULL,NULL,NULL),(201,200,3,NULL,10,'37.06','Sold to processor/exporter at factory gate:','(PKR/Acre)',NULL,1,1,11,NULL,NULL,NULL),(202,201,3,NULL,1,'38','In your calculations, what are costs for the following items of expenditure in production of one acre of Kinnow',NULL,NULL,1,NULL,3,NULL,NULL,NULL),(203,202,3,NULL,10,'38.01','Fertilizers (cost of materials +labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(204,203,3,NULL,10,'38.02','Irrigation (cost of water and labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(205,204,3,NULL,10,'38.03','Soil management, ploughing, inter culture:','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(206,205,3,NULL,10,'38.04','Pest management (cost of materials +labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(207,206,3,NULL,10,'38.05','Watch & ward:','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(208,207,3,NULL,10,'38.06','Harvesting costs, machinery + labor):','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(209,208,3,NULL,10,'38.07','Total:','PKR/Acres',NULL,1,1,11,NULL,NULL,NULL),(210,209,3,NULL,1,'39','Any other notes:',NULL,NULL,1,1,3,NULL,NULL,NULL),(211,NULL,1,NULL,1,'0.01','Date of Visit:',NULL,NULL,1,1,3,NULL,NULL,NULL),(212,211,1,NULL,1,'0.02','Time of Visit:',NULL,NULL,1,1,3,NULL,NULL,NULL),(213,212,1,NULL,4,'0.03','Nature of Training:',NULL,NULL,1,1,42,NULL,NULL,NULL),(214,35,1,3,1,'2.09','Training Duration: (Time) From',NULL,NULL,1,1,3,NULL,NULL,NULL),(215,214,1,3,1,'2.10','Training Duration: (Time) To:',NULL,NULL,1,1,3,NULL,NULL,NULL),(216,38,1,NULL,1,'4','Detail about some positive outcome of Trainings in this cluster:',NULL,NULL,1,1,3,NULL,NULL,NULL),(217,126,2,NULL,9,'43','Pictorial View',NULL,NULL,1,1,15,NULL,NULL,NULL),(218,210,3,NULL,9,'40','Pictorial View',NULL,NULL,1,1,15,NULL,NULL,NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `survey_headers`
--

LOCK TABLES `survey_headers` WRITE;
/*!40000 ALTER TABLE `survey_headers` DISABLE KEYS */;
INSERT INTO `survey_headers` VALUES (1,'M&E',NULL),(2,'Baseline',NULL),(3,'Impact Assessment',NULL);
/*!40000 ALTER TABLE `survey_headers` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `survey_sections`
--

LOCK TABLES `survey_sections` WRITE;
/*!40000 ALTER TABLE `survey_sections` DISABLE KEYS */;
INSERT INTO `survey_sections` VALUES (2,1,'Cluster Detail:',1),(3,1,'Technical Detail:',1),(4,1,'Annexures:',1),(5,1,'Pictorial View:',1);
/*!40000 ALTER TABLE `survey_sections` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (1,1,'M and E','M and E',1),(2,2,'Mango value chain','Questionnaire for the base line survey of Mango value chain',1),(3,2,'Kinnow Value Chain','Questionnaire for baseline survey of Kinnow Value Chain',1);
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tehsils`
--

LOCK TABLES `tehsils` WRITE;
/*!40000 ALTER TABLE `tehsils` DISABLE KEYS */;
INSERT INTO `tehsils` VALUES (1,3,'Fortabbas'),(2,3,'Haroonabad'),(3,3,'Minchinabad'),(4,3,'Bahawalnagar'),(5,3,'Chishtian'),(6,1,'Ahmadpur East'),(7,1,'Bahawalpur'),(9,31,'Kallur Kot'),(10,31,'Darya Khan'),(11,14,'Chiniot'),(12,14,'Bhowana'),(13,4,'Dera Ghazi Khan'),(14,4,'Taunsa'),(15,12,'Faisalabad'),(16,12,'Jaranwala'),(17,12,'Summundri'),(18,23,'Gujranwala'),(19,28,'Gujrat'),(20,28,'Kharian'),(21,24,'Hafizabad'),(22,24,'Pindi Bhattian'),(23,13,'18 Hazari'),(24,13,'Jhang'),(25,22,'Chunian'),(26,22,'Kasur'),(27,22,'Pattoki'),(28,22,'Kot Radha Kishan'),(29,9,'Jahania'),(30,9,'Kabirwala'),(31,9,'Khanewal'),(32,9,'Mian Channu'),(33,30,'Khushab'),(34,30,'Quaidabad'),(35,19,'Lahore Cantt'),(36,19,'Lahore City'),(37,6,'Karor Lal Esan'),(38,6,'Layyah'),(39,11,'Dunyapur'),(40,11,'Lodhran'),(41,11,'Kahror Pacca'),(42,27,'Mandi Bahauddin'),(43,27,'Phalia'),(44,27,'Malakwal'),(45,32,'Piplan'),(46,32,'Mianwali'),(47,8,'Jalalpur Pirwala'),(48,8,'Multan'),(49,8,'Shujabad'),(50,5,'Alipur'),(51,5,'Jatoi'),(52,5,'Muzaffargarh'),(53,5,'Kot Addu'),(54,21,'Nankana Sahib'),(55,18,'Depalpur'),(56,18,'Okara'),(57,18,'Renala Khurd'),(58,17,'Arif Wala'),(59,17,'Pakpattan'),(60,2,'Khanpur'),(61,2,'Liaquatpur'),(62,2,'Sadiqabad'),(63,2,'Rahim Yar Khan'),(64,7,'Rajanpur'),(65,7,'Jampur'),(66,7,'Rojhan'),(67,16,'Chichawatni'),(68,16,'Sahiwal'),(69,29,'Sargodha'),(70,29,'Sillanwali'),(71,29,'Kot Momin'),(72,29,'Shahpur'),(73,29,'Bhalwal'),(74,20,'Ferozewala'),(75,20,'Safdarabad'),(76,20,'Muridke'),(77,15,'Gojra'),(78,15,'Kamalia'),(79,15,'Toba Tek Singh'),(80,10,'Burewala'),(81,10,'Mailsi'),(82,10,'Vehari'),(84,1,'Yazman'),(85,1,'Khairpur Tamewali'),(86,1,'Hasilpur'),(87,31,'Bhakkar'),(88,31,'Mankera'),(89,14,'Lalian'),(90,12,'Chak Jhumra'),(91,12,'Tandlianwala'),(92,23,'Kamoke'),(93,23,'Nowshera Virkan'),(94,23,'Wazirabad'),(95,13,'Shorkot'),(96,13,'Ahmedpur Sial'),(97,30,'Noorpur Thal'),(98,6,'Chaubara'),(99,21,'Sangla Hill'),(100,21,'Shahkot'),(101,25,'Narowal'),(102,25,'Shakargarh'),(103,29,'Sahiwal (Sargodha)'),(104,20,'Sheikhupura'),(105,20,'Sharqpur'),(106,26,'Pasrur'),(107,26,'Daska'),(108,26,'Sambrial'),(109,26,'Sialkot'),(114,32,'Essa Khail'),(117,33,'Gujjar Khan'),(118,33,'Kahuta'),(119,33,'Kallar Syedan'),(120,33,'Kotli Sattian'),(121,33,'Murree'),(122,33,'Rawalpindi'),(123,33,'Taxila'),(124,34,'Attock'),(125,34,'Fateh Jang'),(126,34,'Hassan Abdal'),(127,34,'Hazro'),(128,34,'Jand'),(129,34,'Pindi Gheb'),(130,35,'Chakwal'),(131,35,'Choa Saidan Shah'),(132,35,'Kallar Kahar'),(133,35,'Tala Gang'),(134,36,'Dina'),(135,36,'Jhelum'),(136,36,'Pind Dadan Khan'),(137,36,'Sohawa'),(138,35,'Lawa'),(139,4,'Vehova'),(140,19,'Model Town'),(141,19,'Raiwand'),(142,19,'Shalimar'),(143,25,'Zaffarwal');
/*!40000 ALTER TABLE `tehsils` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `unit_of_measures`
--

LOCK TABLES `unit_of_measures` WRITE;
/*!40000 ALTER TABLE `unit_of_measures` DISABLE KEYS */;
INSERT INTO `unit_of_measures` VALUES (1,'Acre');
/*!40000 ALTER TABLE `unit_of_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_completed_surveys`
--

DROP TABLE IF EXISTS `user_completed_surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_completed_surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `tehsil_id` int(11) NOT NULL,
  `respondent_name` varchar(100) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `survey_schedule_date` datetime NOT NULL,
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
  KEY `FK_ucs_product_id_idx` (`product_id`),
  CONSTRAINT `FK_survey_id` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_surveyor` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ucs_district_id` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_ucs_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ucs_tehsil_id` FOREIGN KEY (`tehsil_id`) REFERENCES `tehsils` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_completed_surveys`
--

LOCK TABLES `user_completed_surveys` WRITE;
/*!40000 ALTER TABLE `user_completed_surveys` DISABLE KEYS */;
INSERT INTO `user_completed_surveys` VALUES (48,7,1,1,34,124,'Stewie','0300-123789','2018-09-04 16:53:50','2018-09-04 16:53:50','2018-09-04 16:54:47',0,74.35555,31.539726,NULL,NULL);
/*!40000 ALTER TABLE `user_completed_surveys` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ahsan','ahsan786','ahsan.emfp@gmail.com',NULL,NULL,'surveyor','active','Tx5nKSzdfZKnAiWSqGUQJ15UB1G0RJEhIAJFvJOxL6DZyE4jneR2jMnvWqSk'),(2,'Zahid','zahid786','zahid.emfp@gmail.com',NULL,NULL,'surveyor','active','jttifSGvJnKyFbFas8JARqEmbc0HW5EDF3Yg9pKa5kJdMK0IG88MIpDfRVrC'),(3,'Aftab','aftab786','aftab.emfp@gmail.com',NULL,NULL,'surveyor','active','tp2SABj46PeMNlb3RxrrIWrUw1S5hYAfh3l3PHSTmQR2uh00huO9b9IVSg0e'),(4,'Attiq','attiq786','attiq.emfp@gmail.com',NULL,NULL,'surveyor','active','uvUwDKSJxGqnQIfpHLom0ZkjrhUcxkfAkfABP7ivC3d0AcJexacGzuKBU9qd'),(5,'Masood','masood786','masood.emfp@gmail.com',NULL,NULL,'surveyor','active','FTMLsAHK8wTiUfh7SqFOz8yJ6qSdiHDBODqkpJBcCon8eXn9EvTLFOZispXM'),(6,'Nauman','nauman786','nauman.emfp@gmail.com',NULL,NULL,'surveyor','active','zNgU3XqpON5hmJBvMF4bIHOt1NqCvR9nR2pQLjdhHa4z1gqjqAu89oh9rrzt'),(7,'ahsan ali','@hsan786','qa.emfp@gmail.com',NULL,NULL,'surveyor','active',NULL),(8,'bilal','JAvlGPq9JyTdtvBO6x2llnRI1+gxwIyPqCKAn3THIKk=','bilal@simsum.co',NULL,NULL,'admin','active',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2018-09-28 16:56:59
