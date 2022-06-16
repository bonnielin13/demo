CREATE DATABASE  IF NOT EXISTS `demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demo`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  `productid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'123','good','2'),(2,'123456','nice','5'),(3,'123456','nice','5'),(4,'666','ok','5'),(5,'cc','job','2'),(6,'vv','vv','1'),(7,'xx','xx','1');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `memberid` varchar(45) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `amount` varchar(45) DEFAULT NULL,
  `num` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`num`),
  UNIQUE KEY `num_UNIQUE` (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `count`
--

DROP TABLE IF EXISTS `count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `count` (
  `count` int NOT NULL,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `count`
--

LOCK TABLES `count` WRITE;
/*!40000 ALTER TABLE `count` DISABLE KEYS */;
INSERT INTO `count` VALUES (10);
/*!40000 ALTER TABLE `count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `memberid` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `first` varchar(45) DEFAULT NULL,
  `last` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`memberid`),
  UNIQUE KEY `memberid_UNIQUE` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('1','1','1','1'),('666','666','666','666'),('7','7','7','7'),('88','88','88','88'),('a','a','a','a'),('c','c','c','c'),('d','d','d','d');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `memberid` varchar(45) DEFAULT NULL,
  `id` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `ordernum` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ordernum`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('1','2','2022-06-08',5),('1','5','2022-05-30',7),('88','5','2022-06-03',11),('88','4','2022-06-25',12),('666','3','2022-09-08',14),('666','3','2022-10-05',15),('7','1','2022-05-30',17),('7','6','2022-06-27',19),('c','1','2022-06-14',20);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `src` varchar(200) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  `src1` varchar(200) DEFAULT NULL,
  `src2` varchar(200) DEFAULT NULL,
  `src3` varchar(200) DEFAULT NULL,
  `src4` varchar(200) DEFAULT NULL,
  `tax` varchar(45) DEFAULT NULL,
  `car1` varchar(45) DEFAULT NULL,
  `car2` varchar(45) DEFAULT NULL,
  `car3` varchar(45) DEFAULT NULL,
  `car4` varchar(45) DEFAULT NULL,
  `car5` varchar(45) DEFAULT NULL,
  `car6` varchar(45) DEFAULT NULL,
  `car7` varchar(45) DEFAULT NULL,
  `src5` varchar(45) DEFAULT NULL,
  `id1` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2022 Rolls-Royce Ghost 6.75 V12 SWB','2099萬','assets/images/list1.jpeg','Ghost的車身由四位工匠同步焊接，一氣呵成。配以100％全鋁鐳射焊接門，Ghost車身更輕盈卻更堅固，其硬度可達40,000Nm/deg。此外，Ghost車身採用的鋁製材料相較於鋼材具有更為卓越的聲阻表現，為車內靜謐性締造全新境界。勞斯萊斯為Ghost傾心締造了6.75升雙渦輪增壓V12汽油引擎，可輸出高達571匹馬力及86.7kgm的最大扭力。為實現車內靜謐性的極致精進，Ghost進氣系統採用更寬大的進氣口，以降低發動機雜訊，構建頂級靜謐聲場。Ghost的LED及鐳射頭燈照明範圍超600米，視野輔助系統（Vision assist）可全天候預警行駛前方可能穿過的行人及野生動物。預警輔助系統、全方位可視及全景俯視的四攝像頭全景監控系統、主動巡航控制系統、碰撞警報、交叉路口預警、車道偏離與變道預警、先進的高解析度抬頭顯示器、Wi-Fi熱點、自動泊車、最新一代導航和娛樂系統等不勝枚舉的頂尖配置皆匯於Ghost之中。','6','assets/images/list1.jpeg','assets/images/list2.jpeg','assets/images/list3.jpeg','assets/images/list4.jpeg','牌照稅 $ 111,700元 燃料稅 $ 14,910元','4門5人座','571hp@5000rpm 86.7kgm@1600rpm','8速自排','平均 6.6km/ltr 市區 3.71km/ltr 高速 8.14km/ltr','渦輪增壓, V型12缸, DOHC雙凸輪軸, 48氣門','6749cc','進口','assets/images/list5.jpeg','2'),(2,'2022 Ferrari Roma V8','1185萬','assets/images/list5.jpeg','Roma搭載了全新8速雙離合器變速箱。相較於之前所用的7速變速箱，該變速箱結構更為緊湊，並實現了6公斤的輕量化成果。在降低油耗與排放的同時，換擋更為迅速且流暢，讓新車在開放道路中帶來敏銳的反應，並在市區道路以及較為雍塞路況的駕駛情況下實現更為出色的駕乘舒適性。Roma的底盤採用了Ferrari為新一代車型自主研發的模組技術。其底盤與車身架構均經重新設計，配合了一系列全新的輕量化方案與先進的生產科技。其中，70%的零部件均為全新設計。Roma採用了前中置引擎配置，並達到2.37 kg/hp的馬力重量比的優異成績，有效提升其動態操控性能與反應速度。','3','assets/images/list5.jpeg','assets/images/list6.jpeg','assets/images/list7.jpeg','assets/images/list8.jpeg','牌照稅 $ 28,220元 燃料稅 $ 9,810元','2門2+2人座','650hp@6750rpm 81.6kgm@2500~4000rpm',' 雙離合器8速自手排','平均 7.6km/ltr 市區 5.35km/ltr 高速 9.91km/ltr','渦輪增壓, 水平對臥6缸, DOHC雙凸輪軸, 24氣門','3745cc','進口','assets/images/list9.jpeg','3'),(3,'2022 Audi R8 Coupe V10 Performance','1157萬','assets/images/list9.jpeg','「源自賽道 為速度而生」，以精湛卓越的賽車科技聞名的品牌旗艦超跑Audi R8 Coupe，深受國內性能車迷喜愛，而這次引進的R8 Coupe V10 performance性能表現再度進化，其搭載5.2升V10 缸內直噴中置引擎，經原廠工程團隊精心調校，動力數據提升至最大馬力620hp與最大扭力59.1kgm，搭配七速S-tronic雙離合器自手排變速箱及quattro 智慧型恆時四輪傳動系統，0-100km/h加速僅需3.1秒即可完成，極速高達331km/h，展現優異的性能表現；而結合R8 專屬設計的12.3 吋 Audi 全數位虛擬駕駛座艙與多樣化的專屬客製化配備選項，讓每位性能迷皆可恣意打造個人專屬風格，盡情享受熱血駕馭快感。','5','assets/images/list9.jpeg','assets/images/list10.jpeg','assets/images/list11.jpeg','assets/images/list12.jpeg','牌照稅 $ 46,170元 燃料稅 $ 12,180元','2門2人座','620hp@8000rpm 59.1kgm@6500rpm','雙離合器7速自手排','平均 7.4km/ltr 市區 4.88km/ltr 高速 10.47km/ltr','自然進氣, V型10缸, DOHC雙凸輪軸, 40氣門','5204cc','進口','assets/images/list13.jpeg','4'),(4,'2022 Bentley Continental GT Speed 6.0 W12','1680萬','assets/images/list13.jpeg','Continental GT提供3套音響選擇。除了標準音響，也可選配Bang & Olfsen音響（輸出功率1,500瓦/16支揚聲器/16聲道擴大器），這也是B&O首次在車上應用BeoSonic系統，提供更直覺化的單鍵操作方式，音響格柵照明搭配獨具特色的網狀押花，滿足視聽享受更適合追求時尚生活的車主；NAIM音響系統在前排安置2組主動式重低音喇叭，輸出功率2,200瓦、擁有18支揚聲器，盡享8種音效模式帶來的震撼感受，適合追求極致的音響愛好者。Continental GT Speed搭載品牌性能之巔W型排列12汽缸引擎，迸發出659匹最大馬力、91.8kgm最高扭力，藉由8速雙離合器變速箱將動力完整傳遞路面，0-100 km/h僅需3.6秒完成，極速可達335 km/h。在持續進化的Continental車型之中，樹立業界頂級豪華與極致性能的最佳Grand Tourer，讓洲際長征成為一種享受。','4','assets/images/list13.jpeg','assets/images/list14.jpeg','assets/images/list15.jpeg','assets/images/list16.jpeg','牌照稅 $ 69,690元 燃料稅 $ 13,080元',' 2門4人座',' 659hp@5000~6000rpm 91.8kgm@1500~5000rpm','8速雙離合器自手排','平均 7.1km/ltr 市區 3.83km/ltr 高速 8.90km/ltr','渦輪增壓, W型12缸, DOHC雙凸輪軸, 48氣門','5950cc','進口','assets/images/list17.jpeg','5'),(5,'2022 Porsche 911 Turbo S Coupe','1176萬 ','assets/images/list17.jpeg','911 Turbo S性能大幅提升，尤其反應在0 - 200km/h加速8.9秒的成績，較前一世代提升整整1秒。得益於進化的保時捷循跡管理（PTM）全時四輪驅動系統，可傳遞高達51.0kgm的扭力至前輪。新一代保時捷主動式懸載調整系統（PASM）具備更迅速與更精確的阻尼控制系統，提供更優異的側向穩定性、循跡性、穩定的轉向與轉向速度。911 Turbo S車頭進氣口更寬幅，並配備雙頭燈模組、LED矩陣頭燈與深色嵌件，強化頂級車型外觀識別度。全新設計的氣壓伸縮式前擾流板及加大的後尾翼，可增加15 %的下壓力；而充滿肌肉線條的尾翼結合進氣口，勾勒911 Turbo S圓滑的車身曲線，並包含具有Turbo風格的高亮澤黑色方形尾管。','6','assets/images/list17.jpeg','assets/images/list18.jpeg','assets/images/list19.jpeg','assets/images/list20.jpeg','牌照稅 $ 28,220元 燃料稅 $ 9,810元',' 2門2+2人座','650hp@6750rpm 81.6kgm@2500~4000rpm','雙離合器8速自手排','平均 7.6km/ltr 市區 5.35km/ltr 高速 9.91km/ltr','渦輪增壓, 水平對臥6缸, DOHC雙凸輪軸, 24氣門','3745cc','進口','assets/images/list21.jpeg','6'),(6,'2022 Aston Martin DB11 Volante 4.0 V8','1138萬','assets/images/list21.jpeg','駕馭Aston Martin車款最大樂趣，莫過於享受氣質車身與強勁性能帶來的濃烈反差，DB11 Volante繼承一貫鮮明品牌血統，搭載全新4.0升V8引擎，最大輸出可達馬力510hp、扭力68.8kgm，相較於DB11 V12，質量更輕且硬度更強，0-100km/h加速僅需4.0秒、極速為300km/h。與DB11相同，Volante版本採用針對品牌性格獨家調校之AMG引擎，並提供「GT」、「Sport」與「Sport+」等3種模式供駕駛選擇，以滿足不同路段之輸出調性，保持細膩靈活的操駕感受。DB11 V8 Volante擁有令人著迷的多樣面貌，除了頂篷可適時收放外，性能表現在「GT」模式下就像一部舒適的轎車，駕駛者能夠輕鬆操駕並與其對話，感受每一個溫文的反饋','3','assets/images/list21.jpeg','assets/images/list22.jpeg','assets/images/list23.jpeg','assets/images/list24.jpeg','牌照稅 $ 28,220元 燃料稅 $ 9,810元','2門2+2人座','510hp@6000rpm 68.8kgm@2000~5000rpm','8速手自排','平均 7.5km/ltr 市區 4.84km/ltr 高速 10.9km/ltr','渦輪增壓, V型8缸, DOHC雙凸輪軸, 32氣門',' 3982cc','進口','assets/images/list1.jpeg','1');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randad`
--

DROP TABLE IF EXISTS `randad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randad` (
  `ADID` int unsigned NOT NULL AUTO_INCREMENT,
  `file_path` varchar(45) NOT NULL,
  `ad_file` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  PRIMARY KEY (`ADID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randad`
--

LOCK TABLES `randad` WRITE;
/*!40000 ALTER TABLE `randad` DISABLE KEYS */;
INSERT INTO `randad` VALUES (1,'images','find3.jpeg','cart.jsp'),(2,'images','find2.jpg','top.jsp#here'),(3,'images','find.jpg','index.jsp');
/*!40000 ALTER TABLE `randad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 22:56:22
