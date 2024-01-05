CREATE DATABASE  IF NOT EXISTS `demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demo`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad` (
  `ad_id` int NOT NULL AUTO_INCREMENT,
  `ad_img` varchar(70) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,'../assets/img/img25.jpg'),(2,'../assets/img/img13.jpg'),(3,'../assets/img/img16.jpg'),(4,'../assets/img/img26.jpg'),(5,'../assets/img/img05.jpg'),(6,'../assets/img/img29.jpg'),(7,'../assets/img/img31.jpg'),(8,'../assets/img/img30.jpg');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `procer_id` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(45) DEFAULT NULL,
  `buy_count` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`procer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `count` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`count`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1001);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL,
  `manager_account` varchar(45) NOT NULL,
  `manager_password` varchar(45) NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'cyim','1234');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
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
  `sex` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `member_account` varchar(45) NOT NULL,
  `member_password` varchar(45) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'','',NULL,NULL,'cyim','1234'),(2,'劉安哲','男','aa93274405@gmail.com','0909557831','11144247','1234'),(4,'777','女','aaa93274405@gmail.com','090909099','11147147','1234');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `content` varchar(200) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,'劉安哲','2024-01-03','超讚'),(2,1,'超級瓜','2024-01-03','超棒棒');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `pro_id` int NOT NULL,
  `member_id` varchar(45) NOT NULL,
  `pro_count` int NOT NULL,
  `pay` varchar(45) NOT NULL,
  `local` varchar(100) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `our`
--

DROP TABLE IF EXISTS `our`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `our` (
  `our_id` int NOT NULL,
  `our_name` varchar(45) NOT NULL,
  `our_pic` varchar(50) NOT NULL,
  `note` varchar(300) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `ig` varchar(100) NOT NULL,
  PRIMARY KEY (`our_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `our`
--

LOCK TABLES `our` WRITE;
/*!40000 ALTER TABLE `our` DISABLE KEYS */;
INSERT INTO `our` VALUES (1,'劉安哲 | 11144247','../assets/img/liu.jpg','<h3>這次的專題<h3>','https://www.facebook.com/profile.php?id=100012368837883&locale=zh_TW','https://www.instagram.com/andrew00207/'),(2,'王盛峰 | 11144256','../assets/img/liu.jpg','<h3>這次的專題<h3>','https://www.facebook.com/profile.php?id=100012368837883&locale=zh_TW','https://www.instagram.com/andrew00207/'),(3,'阮宥華 | 11144206','../assets/img/liu.jpg','<h3>這次的專題<h3>','https://www.facebook.com/profile.php?id=100012368837883&locale=zh_TW','https://www.instagram.com/andrew00207/'),(4,'六六六 | 11144206','../assets/img/liu.jpg','<h3>這次的專題<h3>','https://www.facebook.com/profile.php?id=100012368837883&locale=zh_TW','https://www.instagram.com/andrew00207/');
/*!40000 ALTER TABLE `our` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `amount` int NOT NULL,
  `introduction` varchar(300) NOT NULL,
  `img01` varchar(100) NOT NULL,
  `img02` varchar(100) NOT NULL,
  `img03` varchar(100) NOT NULL,
  `img04` varchar(100) NOT NULL,
  `img05` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'../assets/img/img25.jpg','?小黃花配色花花手機掛繩?',600,999,'<p>全花系列700元</p><p>半花+伸縮系列600元</p><p>花花手機掛繩怎麼搭都好看</p> <p>無論是簡單的素T、牛仔元素、多巴胺風都能輕鬆駕馭</p> <p>是不可或缺的小配飾??</p> <p>純手工編織．顏色可自由混搭</p>','../assets/img/img24.jpg','../assets/img/img10.jpg','../assets/img/img07.jpg','../assets/img/img08.jpg','../assets/img/img09.jpg'),(2,'../assets/img/img13.jpg','?珍珠奶茶造型飲料提袋?',400,999,' <p>?400元</p><p>It’s tea time ?</p><p>禮拜日的下午，來杯珍珠奶茶吧</p> <p>想到台灣美食大家會想到什麼呢？</p><p>珍珠奶茶是一定要的吧！</p><p>珍珠奶茶披薩、珍珠奶茶冰、珍珠奶茶酥</p><p>現在來個珍珠奶茶杯套大家也不會覺得奇怪了</p><p>快來帶著珍珠奶茶造型杯套去買杯珍珠奶茶?</p><P>純手工編織?</p>','../assets/img/img14.jpg','../assets/img/img20.jpg','../assets/img/img21.jpg','../assets/img/img18.jpg','../assets/img/img13.jpg'),(3,'../assets/img/img16.jpg','?純色網格飲料提袋?',350,999,'<p>?350元</p><p>身為台灣人，我最喜歡的就是台灣的手搖飲料了</p><p>心情好，喝。心情壞，喝</p> <p>上班中，喝。剛下課，喝</p><p>吃中餐，喝。吃晚餐，喝</p><p>看電影，喝。發薪水，喝</p><p>天氣熱，喝。天氣冷，喝</p>   <p>無論何時都想喝飲料??</p><p>但往往飲料都沒辦法在短時間內喝完</p><p>這時就需要飲料提袋的幫忙啦！</p><p>這款真的 超～耐～用～</p><p>大部分飲料杯皆適用</p><p>純手工編織?</p>','../assets/img/img15.jpg','../assets/img/img16.jpg','../assets/img/img17.jpg','../assets/img/img27.jpg','../assets/img/img15.jpg'),(4,'../assets/img/img26.jpg','?祖母方格文青少女小廢包?',550,999,'<p>祖母方格的花紋真的百看不膩</p><p>喜歡粉紫色的姐妹們千萬不要錯過</p><p>這款取名叫小廢包但其實一點都不廢</p><p>實測可以裝一台手機+口紅+一串鑰匙都沒問題</p><p>還可以裝下各位的可愛?</p><p>快點加入小（微）廢包的行列吧</p><p>純手工編織?</p>','../assets/img/img28.jpg','../assets/img/img36.jpg','../assets/img/img37.jpg','../assets/img/img26.jpg','../assets/img/img28.jpg'),(5,'../assets/img/img05.jpg','?桔梗鏤空花花證件掛繩?',350,999,' <p>?350元<br>厭倦了工作/讀書 一塵不變的生活了嗎？<br>看膩了自己的證件掛繩了嗎？<br> 快換上花花證件掛繩來為生活增添一點新意<br>    ?此款實際會以兩邊各三朵花為主<br>（小編也覺得三朵花的比例會比較好看<br>可惜姐姐不願意再拆掉幫我重做一次<br>她說比例不好看的留給自己背<br>但織給大家的一定要是比例最好的?<br></p>','../assets/img/img06.jpg','../assets/img/img22.jpg','../assets/img/img23.jpg','../assets/img/img34.jpg','../assets/img/img12.jpg'),(6,'../assets/img/img29.jpg','⚽️男女通吃四股辮手機掛繩⚽️',700,999,' <p>花系列700元</p><p>半花+伸縮系列600元</p><p>全伸縮系列400元</p><p>男女都可用的編織掛繩來啦?</p><p>這款整條都可以伸縮</p> <p>短至證件掛繩長至手機掛繩</p> <p>一條掛繩男女朋友都可通用好划算！</p><p>純手工編織?</p>','../assets/img/img32pg.jpg','../assets/img/img33.jpg','../assets/img/img35.jpg','../assets/img/img32pg.jpg','../assets/img/img33.jpg'),(7,'../assets/img/img31.jpg','?雙色網格飲料提袋?',350,999,'<p>?350元</p> <p> 我最喜歡的就是手搖飲料了</p><p>無論何時都想喝飲料??</p><p>無論何時都想喝飲料??</p><p>但往往飲料都沒辦法在短時間內喝完</p> <p>這時就需要飲料提袋的幫忙啦！</p>p>這款真的 超～耐～用～</p><p>體積小不佔空間</p><p>大部分飲料杯皆適用</p><p>純手工編織，顏色可自由混搭</p>','../assets/img/img41.jpg','../assets/img/img42.jpg','../assets/img/img31.jpg','../assets/img/img41.jpg','../assets/img/img42.jpg'),(8,'../assets/img/img30.jpg','?純色鏤空俏皮小包?',890,999,'<p>?890元（內附束口袋）</p> <p>天啊！這個芥末黃真的好可愛</p><p>可以手提又可以側別 一包兩用超方便</p><p>裡面還附贈一個束口袋</p><p>防止大家擔心鏤空東西會掉出來</p> <p>大小適中百搭拜託大家一定要買一個( ´͈ ᵕ `͈ )◞♡</p>','../assets/img/img38.jpg','../assets/img/img39.jpg','../assets/img/img40.jpg','../assets/img/img38.jpg','../assets/img/img30.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
INSERT INTO `response` VALUES (1,'','','2023-12-31',''),(2,'','','2023-12-31',''),(3,'123','aa93274405@gmail.com','2023-12-31','789'),(4,'','','2024-01-01',''),(5,'','','2024-01-01',''),(6,'','','2024-01-01','');
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `good_id` int DEFAULT NULL,
  `member_id` varchar(45) DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-03 21:16:13
