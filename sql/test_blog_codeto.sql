-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: blog_codeto
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` mediumtext,
  `author` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,'  Bai mau 2   ','<p><strong>Noi dung mau 2</strong></p>\n<p><strong>ds<em>dd</em></strong><em>sdfs</em>dsdf sdfsdf</p>','  thanhdungit  ffff','0001-01-01 00:00:00','2018-03-06 03:03:53'),(3,' Noi dung ','<p class=\"story-body__introduction\" style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; font-weight: bold; line-height: 1.375; margin: 28px 0px 0px; padding: 0px; vertical-align: baseline;\">The UK would respond \"robustly\" to any evidence of Russian involvement in the collapse of former spy Sergei Skripal, Boris Johnson has said.</p>\n<p style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; line-height: 1.375; margin: 23px 0px 0px; padding: 0px; vertical-align: baseline;\">Mr Skripal, 66, and his daughter Yulia, in her 30s, are critically ill in hospital after being found unconscious in Salisbury, Wiltshire.</p>\n<p style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;\">The foreign secretary said he was not pointing fingers at this stage, but described Russia as \"a malign and disruptive force\".</p>\n<p style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;\">Russia has denied any involvement.</p>\n<p style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;\">Mr Skripal - a former Russian agent convicted of spying for Britain - and his daughter were found slumped on a bench outside a shopping centre on Sunday afternoon.</p>\n<p style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;\">Earlier they were seen walking through an alley leading from a Zizzi restaurant, which has now been \"secured\" by police.</p>\n<ul class=\"story-body__unordered-list\" style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; line-height: inherit; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline; list-style: none;\">\n<li class=\"story-body__list-item\" style=\"border: 0px; color: inherit; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-family: inherit; font-size: 1rem; font-weight: inherit; letter-spacing: inherit; line-height: 1.375; margin: 18px 0px 0px 20px; padding: 0px 0px 0px 4px; vertical-align: baseline; list-style: square outside;\"><a class=\"story-body__link\" style=\"border-width: 0px 0px 1px; border-image: initial; color: #222222; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-family: inherit; font-size: 1rem; font-weight: bold; letter-spacing: inherit; line-height: 1.375; margin: 0px; padding: 0px; vertical-align: baseline; text-decoration-line: none; -webkit-tap-highlight-color: rgba(17, 103, 168, 0.3); border-color: initial initial #dcdcdc initial; border-style: initial initial solid initial;\" href=\"http://www.bbc.co.uk/news/health-43300244\">How do you tell whether ex-spy was poisoned?</a></li>\n</ul>\n<p style=\"border: 0px; color: #404040; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-family: Helmet, Freesans, Helvetica, Arial, sans-serif; font-size: 1rem; line-height: 1.375; margin: 18px 0px 0px; padding: 0px; vertical-align: baseline;\">UK police are trying to identify what \"unknown substance\" harmed the pair.</p>',' lethanhdung ','2017-12-08 12:50:04','2018-03-06 21:24:15'),(4,'Noi dung','<p>aalsflak</p>','lethanhdung','2017-12-08 12:52:05',NULL),(5,'Noi dung','<p>aalsflak</p>','lethanhdung','2017-12-08 12:52:19',NULL),(6,'Bai viet moi cua toi','<p>Cai nay khong luu duonc utf8</p>\r\n<p>Cai nay khong luu duonc utf8</p>\r\n<p>Cai nay khong luu duonc utf8</p>\r\n<p>Cai nay khong luu duonc utf8</p>\r\n<p>Cai nay khong luu duonc utf8</p>','thanh content','2017-12-08 12:55:30',NULL),(9,'eeee','<p>khong co title</p>\r\n<p>khong co title<br />khong co title nao ca, xem co luu khong</p>','dddd','2017-12-08 13:10:34','2017-12-08 13:10:34'),(10,'bai moi nhat','<p><em>noi dung co chu in nghieng</em></p>\r\n<p><strong>dong sau in dau</strong></p>\r\n<p>dong nay in binh thuong<br /></p>\r\n<p>&nbsp;</p>','tacgia tac gia','2017-12-08 14:19:36','2017-12-08 14:19:36'),(11,'asdadf','<p>dfasdfasd</p>','adddd222222','2017-12-08 23:54:23','2017-12-08 23:54:23'),(12,'Noi dung','<p>adjf l</p>','aadfa fad','2018-02-11 15:43:42','2018-02-11 15:43:42'),(14,'Them bai moi','<p>aladkjsfla djl</p>','aadsfasd','2018-02-11 15:52:21','2018-02-11 15:52:21'),(15,'fdfasdfa','<p>adfasdfadf</p>','adfadsfasdf','2018-02-11 15:52:34','2018-02-11 15:52:34');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (83,'thanhdungvn@gmail.com','$2a$10$rUEJQzRN8YpXf01p8RHDFe.63bbvbqmBcNG0u9r/im0SLzB58Ytii','','',NULL,NULL),(84,'thanhdungvn@gmail.com','$2a$10$VXwPb9LLF/wSOLCgwih3DuCl/ieRZ/rIkSBAzYOfC8oPaN7f4s756','','',NULL,NULL),(85,'thanhdungvn@gmail.com','$2a$10$1YFiKgEFKo0o//calHZ3UObMI0ednSc36PHIiO8Q7mjxTfCV338SC','','',NULL,NULL),(86,'thanhdungvn@gmail.com','$2a$10$ppzw1BEAcvWlfuqpPONiJOKZuEA0uC6GQq0Unp0PpkyfxjpKtuQ1W','','',NULL,NULL),(87,'thanhdungvn@gmail.com','$2a$10$fxpcFLjUCLUyr8i.irqX1.C3pDkwDeMkBgV.yOr4fF5osZMt7hVVq','','',NULL,NULL),(88,'lethanhdung@gmail.com','$2a$10$gAPBFt6Mzdv7ppZgqPsPU.iqZ0vC50tZLZuoPBT7joit3g2MD2yl6','Alex ','Lee',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-07  1:07:53
