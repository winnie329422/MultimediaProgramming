CREATE DATABASE  IF NOT EXISTS `esports` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `esports`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: esports
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(45) NOT NULL,
  `admin_pwd` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('root','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `member_mail` varchar(100) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `cart_quantity` int DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  `product_stock` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (218,'null','sw-1','Nintendo Switch 電光紅X電光藍',1,9600,20),(225,'a@gmail.com','Xbox-2','XBOX SERIES S',1,9480,20);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `member_name` varchar(45) DEFAULT NULL,
  `member_gender` varchar(45) DEFAULT NULL,
  `member_birth` date DEFAULT NULL,
  `member_phone` varchar(45) DEFAULT NULL,
  `member_address` varchar(100) DEFAULT NULL,
  `member_mail` varchar(100) DEFAULT NULL,
  `member_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (9,'藍悅娜','female','2000-10-01','0978127638','八德','dog@gmail.com','891001'),(10,'葉心茹','female','2001-01-27','878787877','內壢','cat@gmail.com','900127'),(11,'周寶琳','female','2001-03-21','0988888888','台北','152@gmail.com','900321'),(12,'1','female','2000-01-01','1','1','1@1','1111'),(13,'2','male','2000-02-02','2','2','2@2','2222'),(14,'aa','female','2021-06-16','a','a','a@gmail.com','a');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `mesnum` int NOT NULL AUTO_INCREMENT,
  `pnum` varchar(45) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `star` varchar(45) DEFAULT NULL,
  `wrdate` varchar(45) DEFAULT NULL,
  `mesname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mesnum`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (52,'ps5-2','水','star_four','2021-06-17','葉心茹'),(53,'ps5-1','讚','star_three','2021-06-17','葉心茹'),(54,'Xboxbox-2','呵呵','star_one','2021-06-17','葉心茹'),(56,'Xbox-1','喜歡喜歡','star_five','2021-06-17','aa'),(57,'Xbox-2','好玩','star_four','2021-06-17','aa');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order` int NOT NULL AUTO_INCREMENT,
  `cart_id` varchar(45) DEFAULT NULL,
  `member_mail` varchar(45) NOT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `cart_quantity` int DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  `product_stock` int DEFAULT NULL,
  `totalprice` int DEFAULT NULL,
  `sendname` varchar(45) NOT NULL,
  `sendphone` varchar(45) NOT NULL,
  `sendaddress` varchar(100) NOT NULL,
  `orderdate` date DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `card_id` bigint DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (113,'202','a@gmail.com','Xbox-2','XBOX SERIES S',1,9480,21,9480,'aa','a','a','2021-06-16','信用卡支付',12345678,40240,'17:35:07'),(114,'203','a@gmail.com','Xbox-1','XBOX SERIES X',2,15380,20,30760,'aa','a','a','2021-06-16','信用卡支付',12345678,40240,'17:35:07'),(115,'198','cat@gmail.com','ps5-2','PlayStation 5 數位版',2,12990,15,25980,'葉心茹','878787877','內壢','2021-06-16','貨到付款',12345678,59970,'17:36:53'),(116,'200','cat@gmail.com','ps5-1','PlayStation 5 光碟版',1,15990,15,15990,'葉心茹','878787877','內壢','2021-06-16','貨到付款',12345678,59970,'17:36:53'),(117,'204','cat@gmail.com','lite-3','Nintendo Switch Lite 藍色',3,6000,20,18000,'葉心茹','878787877','內壢','2021-06-16','貨到付款',12345678,59970,'17:36:53'),(118,'205','a@gmail.com','switch-1','Nintendo Switch Pro控制器',1,2100,22,2100,'aa','a','a','2021-06-16','貨到付款',12345678,2100,'18:35:32'),(119,'207','a@gmail.com','lite-2','Nintendo Switch Lite 珊瑚粉色',1,6000,22,6000,'aa','a','a','2021-06-16','信用卡支付',145678,6000,'20:30:26'),(120,'224','cat@gmail.com','Xboxbox-2','Xbox 無線控制器 天空藍',1,1690,20,1690,'葉心茹','878787877','內壢','2021-06-17','貨到付款',12345678,1690,'11:33:08');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` varchar(100) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` int DEFAULT NULL,
  `product_stock` int DEFAULT NULL,
  `product_intro` varchar(200) DEFAULT NULL,
  `product_host` varchar(45) DEFAULT NULL,
  `product_type` varchar(45) DEFAULT NULL,
  `product_sales` int DEFAULT NULL,
  `add` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('lite-1','Nintendo Switch Lite 黃色',6000,20,'手提模式專用，和控制器一體成形、細小輕巧、方便攜帶外出。需另外購買Joy-Con。','Switch','main',10,'v'),('lite-2','Nintendo Switch Lite 珊瑚粉色',6000,21,'手提模式專用，和控制器一體成形、細小輕巧、方便攜帶外出。需另外購買Joy-Con。','Switch','main',13,'v'),('lite-3','Nintendo Switch Lite 藍色',6000,17,'手提模式專用，和控制器一體成形、細小輕巧、方便攜帶外出。需另外購買Joy-Con。','Switch','main',14,'v'),('ps5-1','PlayStation 5 光碟版',15990,14,'利用客製化 CPU、GPU 和具備整合式 I/O 之 SSD 的強大效能， 改寫 PlayStation® 主機的功能極限。','PS5','main',12,'v'),('ps5-2','PlayStation 5 數位版',12990,13,'利用客製化 CPU、GPU 和具備整合式 I/O 之 SSD 的強大效能， 改寫 PlayStation® 主機的功能極限，較光碟版主機體積較小、重量較輕。','PS5','main',12,'v'),('psps-1','PlayStation 5 DualSense 無線控制器',2200,15,'搭配觸覺回饋與動態板機效果，讓玩家探索更深刻、更身歷其境的遊戲體驗。','PS5','other',23,'v'),('psps-2','PlayStation 5 無線耳機組',3100,10,'此耳機組為玩家而生，配備消噪麥克風以及易於使用的控制項。','PS5','other',25,'v'),('psps-3','PlayStation 5 (PS5) DualSense™ 充電座',1000,15,'不用連接PlayStation®5 主機，就可以為兩個 DualSense™ 無線控制器充電。','PS5','other',20,'v'),('sw-1','Nintendo Switch 電光紅X電光藍',9600,20,'可利用TV模式、桌上模式、手提模式，3種遊玩風格來玩。可利用付有的Joy-Con遊玩使用HD震動和動感IR照相機的遊戲。','Switch','main',31,'v'),('sw-2','Nintendo Switch 灰色',9600,22,'可利用TV模式、桌上模式、手提模式，3種遊玩風格來玩。可利用付有的Joy-Con遊玩使用HD震動和動感IR照相機的遊戲。','Switch','main',10,'v'),('switch-1','Nintendo Switch Pro控制器',2100,21,'握把型讓玩家更容易握著，也可長時間透過TV模式或是桌上模式來輕鬆玩遊戲的無線控制器。','Switch','other',10,'v'),('switch-2','Nintendo Switch便攜包',500,20,'可放5張遊戲卡及2條「Joy-Con腕帶」的收納位置。也可竪立主機當作支架使用。','Switch','other',8,'v'),('switch-3','Nintendo Switch Lite便攜包',490,21,'內有可放8張遊戲卡的收納位置。','Switch','other',11,'v'),('switch-4','方向盤2個組合',480,21,'安裝「Joy-Con」後，可以駕駛觸感來操作，最適合體驗《瑪利歐賽車8 豪華版》等競速遊戲。可安裝左右任何一個「Joy-Con」。','Switch','other',13,'v'),('Xbox-1','XBOX SERIES X',15380,18,'有史以來最快、最強大的 Xbox。技術功能和創新的 Xbox Velocity Architecture 所支援的新功能「快速恢復」，可讓玩家們在多個遊戲之間輕鬆切換，並且快速地從上次離開的地方繼續遊戲。','Xbox','main',28,'v'),('Xbox-2','XBOX SERIES S',9480,20,'有史以來外型最小的 Xbox 所帶來的新一代效能。硬體和軟體創新為遊戲的未來帶來令人驚奇的可能性。','Xbox','main',16,'v'),('Xboxbox-1','Xbox 無線控制器 磨砂黑',1690,20,'體驗 Xbox 無線控制器的現代化設計，採用雕刻的表面和精緻的幾何圖，有助於提高遊戲期間的舒適度。利用條紋握把和混合式方向鍵，保持專注。','Xbox','other',13,'v'),('Xboxbox-2','Xbox 無線控制器 天空藍',1690,19,'體驗 Xbox 無線控制器的現代化設計，採用雕刻的表面和精緻的幾何圖，有助於提高遊戲期間的舒適度。利用條紋握把和混合式方向鍵，保持專注。','Xbox','other',16,'v'),('Xboxbox-3','Xbox Elite 無線控制器 – 白色特別版',4299,21,'效能更佳且更舒適，有可替換的按板，還有高感應發射鍵鎖，並且可以無限制地在應用程式中自訂，它專為絕佳效能而設計。','Xbox','other',13,'v'),('Xboxbox-4','Xbox 充電式電池 + USB-C® 纜線',699,21,'搭配使用 Xbox 充電式電池 + USB-C 纜線，讓遊戲持續下去。在遊戲中或遊戲後充電，即使 Xbox 處於待命狀態。持久的充電式電池可在 4 小時內充滿電。告別拋棄式電池且不再經歷中斷的遊戲。','Xbox','other',12,'v');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-17 18:10:32
