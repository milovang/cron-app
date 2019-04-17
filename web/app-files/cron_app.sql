-- MySQL dump 10.16  Distrib 10.1.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cron_app
-- ------------------------------------------------------
-- Server version	10.1.38-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `cron_job`
--

DROP TABLE IF EXISTS `cron_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `command` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `schedule` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_job`
--

LOCK TABLES `cron_job` WRITE;
/*!40000 ALTER TABLE `cron_job` DISABLE KEYS */;
INSERT INTO `cron_job` VALUES (9,'Testing command','app:test-command','*/1 * * * *','command to make file every minute',0),(10,'Script for creating directories','cron:shell:command --script /vagrant/cron-app/web/test-script.php','*/1 * * * *','Use this command with parameter [--script and path to your script]',0);
/*!40000 ALTER TABLE `cron_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_report`
--

DROP TABLE IF EXISTS `cron_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `run_at` datetime NOT NULL,
  `run_time` double NOT NULL,
  `exit_code` int(11) NOT NULL,
  `output` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6C6A7F5BE04EA9` (`job_id`),
  CONSTRAINT `FK_B6C6A7F5BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `cron_job` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_report`
--

LOCK TABLES `cron_report` WRITE;
/*!40000 ALTER TABLE `cron_report` DISABLE KEYS */;
INSERT INTO `cron_report` VALUES (21,10,'2019-04-17 18:17:03',0.66431403160095,0,'\nDone\n'),(22,10,'2019-04-17 18:18:02',0.60397386550903,0,'\nDone\n'),(23,10,'2019-04-17 18:19:02',0.79470705986023,0,'\nDone\n'),(24,10,'2019-04-17 18:20:01',0.58527803421021,0,'\nDone\n'),(25,10,'2019-04-17 18:21:02',0.55428791046143,0,'\nDone\n'),(26,10,'2019-04-17 18:22:01',0.5810022354126,0,'\nDone\n'),(27,10,'2019-04-17 18:23:02',0.59048891067505,0,'\nDone\n'),(28,10,'2019-04-17 18:24:02',0.62450885772705,0,'\nDone\n'),(29,10,'2019-04-17 18:25:01',0.60823702812195,0,'\nDone\n'),(30,10,'2019-04-17 18:26:02',0.65994501113892,0,'\nDone\n'),(31,10,'2019-04-17 18:27:01',0.67360997200012,0,'\nDone\n'),(32,10,'2019-04-17 18:28:02',0.59376406669617,0,'\nDone\n'),(33,10,'2019-04-17 18:29:03',0.59590315818787,1,''),(34,10,'2019-04-17 18:30:02',0.52717089653015,0,'\nDone\n'),(35,10,'2019-04-17 18:31:02',0.6548490524292,0,'\nDone\n'),(36,10,'2019-04-17 18:32:02',0.67019510269165,0,'\nDone\n'),(37,10,'2019-04-17 18:33:02',0.62233090400696,0,'\nDone\n');
/*!40000 ALTER TABLE `cron_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fos_user`
--

DROP TABLE IF EXISTS `fos_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_957A6479C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fos_user`
--

LOCK TABLES `fos_user` WRITE;
/*!40000 ALTER TABLE `fos_user` DISABLE KEYS */;
INSERT INTO `fos_user` VALUES (1,'admin','admin','admin@test.com','admin@test.com',1,NULL,'$2y$13$AUF7EfNKhp4AMFtj4GrXhetDS7POSiGsSHTDBD8JLa0HTZAZ6O8tC','2019-04-17 17:41:16',NULL,NULL,'a:1:{i:0;s:10:\"ROLE_ADMIN\";}');
/*!40000 ALTER TABLE `fos_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-17 18:43:58
