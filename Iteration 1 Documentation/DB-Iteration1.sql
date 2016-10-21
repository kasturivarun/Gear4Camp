-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: gear4camp
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `user_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `date` varchar(45) DEFAULT NULL,
  `is_available` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1',
  `rent_cost` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_link` varchar(1000) NOT NULL,
  `user_email` varchar(100) DEFAULT 'gear@gmail.com',
  PRIMARY KEY (`ad_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Cycle','This is a good cycle',NULL,'1',20,3,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRkjH7oQNdYar8g5JHSYfuo3EFxTiX8Gy0-4yet2htbks5Sv7E_hDcuIUM','gear@gmail.com'),(2,'Skiing Gear','This includes all the gear for skiing',NULL,'1',100,4,'http://biasedcut.files.wordpress.com/2009/10/ski-gear.png?w=600&h=709','gear@gmail.com'),(2,'Surfing gear','This includes everything for surfing',NULL,'1',80,7,'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQ2Xp54IZcuJNWwWxlGQynv1m0WbX4XZHsHk2wM06LVyFymfjWcyQ','gear@gmail.com'),(1,'Jet skiing','New 2014 STX-15F In Stock Now! Available in Black - Boasting the most powerful engine in its class, a composite hull that offers sporty handling, plenty of rider-friendly features, and serious value, the Jet Ski STX-15F will have you looking for reasons to get out on the water more. It\'s the perfect personal watercraft to complement all your summer fun. Please call 877-412-3408 for current offers, pricing, and packages on this unit and other Kawasaki Jet Skis for sale.',NULL,'1',200,8,'http://cdn.boats.net/product/bn-images/boats/kawasaki/2013_jetski_ultra_lx_white.jpg','gear@gmail.com'),(1,'Camp tent','Waterproof 3 Person Single Layers Dome Camping Tent with 2 Doors in Orange Color',NULL,'1',100,9,'https://i.ytimg.com/vi/4rtSg4VuzzA/maxresdefault.jpg','gear@gmail.com'),(4,'Camping gear','With our service, you can find the most popular phrases for keyword \"Outdoor Hiking Equipment\". It is also recommended that you pay attention to the image. Use all the information found here for your site, blog, or to create an advertising campaign. The information on this page will be updated so be sure to go again.',NULL,'1',100,10,'http://previews.123rf.com/images/tab1962/tab19621506/tab1962150600088/41926722-High-angled-view-of-organized-hiking-gear-for-climbing-placed-on-rustic-wooden-boards--Stock-Photo.jpg','gear@gmail.com'),(1,'Go pro','new gopro',NULL,'1',30,12,'https://gopro.com/help/resource/1441303255000/GoPro_Support_Images/Support_2Photo_box_2.jpg','gear@gmail.com'),(1,'Climbing Stuff','Traveling internationally with climbing gear in tow is quite a commitment. A standard sport rack will easily fill a large backpack and weigh in near airline limits. You want to cut out unnecessary items, but your gear is ultimately what will keep you safe so be careful not to scrimp too much. Below we have a list of everything we brought with us for climbing in Thailand.',NULL,'1',20,13,'http://www.rollglobal.org/wp-content/uploads/2010/03/gear.jpg','kasturivarun@gmail.com');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('varun','kasturi',1,'kasturivarun@gmail.com','123456','dallas','tx','usa','12345','12345','1234567890'),('Henry','Dinh',2,'henry@gmail.com','123456','Dallas','Texas','USA',NULL,'75252','7894561230'),('Sneha','Bangar',4,'sneha@gmail.com','123456','Dallas','Texas','USA',NULL,'75252','7891234560'),('kainan','xu',5,'kainan@gmail.com','123456','dallas','Texas','USA',NULL,'12345','1234567890');
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

-- Dump completed on 2016-09-24 16:39:44
