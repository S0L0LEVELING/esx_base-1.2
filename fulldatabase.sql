-- --------------------------------------------------------
-- Host:                         45.146.5.230
-- Server versie:                10.4.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versie:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Databasestructuur van middelveenv2 wordt geschreven
CREATE DATABASE IF NOT EXISTS `middelveenv2` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `middelveenv2`;

-- Structuur van  tabel middelveenv2.addon_account wordt geschreven
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.addon_account: ~11 rows (ongeveer)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('caution', 'Caution', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concessionnaire', 1),
	('society_customcardealer', 'customcardealer', 1),
	('society_kmar', 'Kmar', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mécano', 1),
	('society_police', 'Police', 1),
	('society_rea', 'Real estate agent', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.addon_account_data wordt geschreven
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.addon_account_data: ~70 rows (ongeveer)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 1000000, NULL),
	(2, 'society_cardealer', 1000000, NULL),
	(3, 'society_customcardealer', 1000000, NULL),
	(4, 'society_mafia', 0, NULL),
	(5, 'society_mechanic', 917688, NULL),
	(6, 'society_police', 81410, NULL),
	(7, 'society_rea', 0, NULL),
	(8, 'society_realestateagent', 65000, NULL),
	(9, 'society_taxi', 1000000, NULL),
	(10, 'caution', 0, '1884df4db1128ba239a00566272091bc6e4b8404'),
	(11, 'caution', 0, 'fd34328d7be3ef9fdf87a783b33da39ed661be53'),
	(12, 'caution', 0, '657e2d16859a7e5655c7a00cc0395177479a38e3'),
	(13, 'caution', 0, 'e90064e044b389ea7862e96828f837d36e8ad1d3'),
	(14, 'caution', 0, '55b0011ecda01bd93f78795346c7413d6f00f6c4'),
	(15, 'caution', 0, 'fe98f8dc9deb20e673a8785f29745d90ed1db052'),
	(16, 'caution', 0, '34251b7753bc09a5c92563c49ed1ad00ca29b745'),
	(17, 'caution', 0, '3a0b9a8c554c8c4a07dd10b5842b05b99e9483cf'),
	(18, 'caution', 0, '893ffc926e30d183fb9d6b3240942e09bca081a3'),
	(19, 'caution', 0, '854812e40063a2bcbbf10c29bc55296a87904f13'),
	(20, 'caution', 0, 'f76c1500479ad81ea2e626f607078f8dbac39e0b'),
	(21, 'caution', 0, '7d50b4537dbb98ac290c5dc1f56bc59963a7e0e8'),
	(22, 'caution', 0, '28f047a408daa3b2181761b8fd94a329f69117b3'),
	(23, 'caution', 0, '25a4e03167c4b6bf2200414395f8ad5600af312f'),
	(24, 'caution', 0, '468d8e859dd395e754354ed19318802f51777054'),
	(25, 'caution', 0, '8a249fe36729c5f2fe0377983d6cbd74d6590c79'),
	(26, 'caution', 0, '623ca025b6fc4a2c376e80fb01c060f6f151d266'),
	(27, 'caution', 0, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9'),
	(28, 'caution', 0, '007117365c4f37221a92273f2be3ae3673b8a749'),
	(29, 'caution', 0, 'b13b12c162404f3ac4bd2a36470118f23c755794'),
	(30, 'caution', 0, 'cd4b446d0873d0d2943bc3bace3c55692e953516'),
	(31, 'caution', 0, 'eac2237361a2521cc32ec30782792e44f2db57a8'),
	(32, 'caution', 0, '46cf32dd881d4ce580c67d1d9d10ba1413e019ab'),
	(33, 'caution', 0, '3157a97dab0f65d1f3dea42b965f26db876b9e43'),
	(34, 'caution', 0, '65824048d1d2a80583facb81b7531e3b478a2217'),
	(35, 'caution', 0, 'b0f52bbad39871f886445279437163b33ecaaa81'),
	(36, 'caution', 0, 'ac90d3decdf0304869352296bd3eda2e234bb869'),
	(37, 'caution', 0, '2fb1cf5b013a97b2ec1de6d1bcf7db6cc91cd2a0'),
	(38, 'caution', 0, '34d8f26cc32ab8703bf28c4dd0d508859b818d13'),
	(39, 'caution', 0, '8caaf012e059c13c6e1ede05366effed2a5764de'),
	(40, 'caution', 2000, '87b22c3823eca7892d62ccfd05086dac866d510c'),
	(41, 'caution', 0, 'f94244739561f92f070a19968cf31b38eccb1cea'),
	(42, 'caution', 0, 'd997b95b329a56b97fc059f6a5ed81984d7a8fda'),
	(43, 'caution', 0, '9382c0e2d6eae4ad9f7306ce8161e478b1918ac2'),
	(44, 'caution', 0, 'f59633ec0b5a12870dfd85222c1a912cdf4cb86a'),
	(45, 'caution', 0, '1f674e9d75b5acedf835f213c7e0517bf9007baf'),
	(46, 'caution', 0, 'bf04013a1acd21ba814044b5488df8e9a23a0d7e'),
	(47, 'caution', 0, 'e2e331d86c0520b9b05d571f1a8649d4f49ee482'),
	(48, 'caution', 0, '256d9580ffe173c783db26d766b9a3709e8e1555'),
	(49, 'caution', 0, '205b962c66eceb698b15a993af871fd623cc6064'),
	(50, 'caution', 0, '2683c433d7e16ff109754323d6a8f3f3581b68e1'),
	(51, 'caution', 0, 'fa90eb9f929b3d5c9b8d9600b6b0ed9aeabcb4a2'),
	(52, 'caution', 0, 'b28c27f38441e9fecacf05250de37e42bd447c3b'),
	(53, 'caution', 0, 'a26f419014de3c0f1dc60e310b4e363bcaf060d3'),
	(54, 'caution', 0, '477b4d85cdf07dcd8fae87cb4a2ffc33805e1e51'),
	(55, 'caution', 0, 'baeab599a7148a331c131954de1a6605000bd165'),
	(56, 'caution', 0, '4c7e20b18547c074831ecbcd119a349dc9057f9e'),
	(57, 'caution', 0, '1c58571e499884bf0801c5b5d85d3cfc0e71357d'),
	(58, 'caution', 0, 'c0cd8109c04899c9a7dc9177531bead5cbd72bd4'),
	(59, 'caution', 0, 'e25c35dcdc4fd27dfbe6471c91f10ebbef81f717'),
	(60, 'caution', 0, '8c001bcdd122e455f5f4e750b4db42fdf5d99871'),
	(61, 'society_kmar', 0, NULL),
	(62, 'caution', 0, 'dd1a8cca0456c1d12d5437142c3b6bca16e8bd26'),
	(63, 'caution', 0, '303519e413d2d8d09edbacdeb32832e9f6a87973'),
	(64, 'caution', 0, 'c9c13e5ed18c956773dd0c4dc28c02070020fe3d'),
	(65, 'caution', 0, 'ea3f576a5548386eff8e48025ed5f5c026c89f16'),
	(66, 'caution', 2000, 'bba5a10878001eaf23160ade255dbc1d4bae03b7'),
	(67, 'caution', 0, 'd1491d84201f9f3677b8a564300dc0d906188f74'),
	(68, 'caution', 0, '6ca9ccc89c4036628cb292e614c8e4927ab29fa5'),
	(69, 'caution', 0, '22db920bcbca0829b4c3e00ba379f2d8fe7aaff3'),
	(70, 'caution', 0, 'b8be3d071f442fa70ef75b6ee2497ebf3100a42d');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.addon_inventory wordt geschreven
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.addon_inventory: ~8 rows (ongeveer)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Concesionnaire', 1),
	('society_customcardealer', 'customcardealer', 1),
	('society_kmar', 'kmar', 1),
	('society_mafia', 'Mafia', 1),
	('society_mechanic', 'Mécano', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.addon_inventory_items wordt geschreven
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.addon_inventory_items: ~19 rows (ongeveer)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
	(1, 'society_kmar', 'bread', 9450, NULL),
	(2, 'society_kmar', 'nightstick', 20002, NULL),
	(3, 'society_kmar', 'pistol', 0, NULL),
	(4, 'society_kmar', 'pistol_ammo', 9999830, NULL),
	(5, 'society_kmar', 'smg_ammo', 0, NULL),
	(6, 'society_kmar', 'rifle_ammo', 999910, NULL),
	(7, 'society_kmar', 'carbinerifle', 1000, NULL),
	(8, 'society_kmar', 'flashlight', 0, NULL),
	(9, 'society_kmar', 'stungun', 10000, NULL),
	(10, 'society_kmar', 'combatpistol', 9999, NULL),
	(11, 'society_kmar', 'coke_pooch', 0, NULL),
	(12, 'society_kmar', 'lightarmor', 9961, NULL),
	(13, 'society_kmar', 'heavyarmor', 5000, NULL),
	(14, 'society_kmar', 'rugzak', 2065, NULL),
	(15, 'society_kmar', 'water', 9850, NULL),
	(16, 'society_kmar', 'demper', 298, NULL),
	(17, 'society_kmar', 'specialcarbine', 999, NULL),
	(18, 'society_kmar', 'smg_mk2', 0, NULL),
	(19, 'society_kmar', 'sniperrifle', 0, NULL);
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.aircrafts wordt geschreven
CREATE TABLE IF NOT EXISTS `aircrafts` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.aircrafts: ~27 rows (ongeveer)
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` (`name`, `model`, `price`, `category`) VALUES
	('Alpha Z1', 'alphaz1', 1121000, 'plane'),
	('Besra', 'besra', 1000000, 'plane'),
	('Buzzard', 'buzzard2', 500000, 'heli'),
	('Cuban 800', 'cuban800', 240000, 'plane'),
	('Dodo', 'dodo', 500000, 'plane'),
	('Duster', 'duster', 175000, 'plane'),
	('Frogger', 'frogger', 800000, 'heli'),
	('Havok', 'havok', 250000, 'heli'),
	('Howard NX25', 'howard', 975000, 'plane'),
	('Luxor', 'luxor', 1500000, 'plane'),
	('Luxor Deluxe ', 'luxor2', 1750000, 'plane'),
	('Mammatus', 'mammatus', 300000, 'plane'),
	('Maverick', 'maverick', 750000, 'heli'),
	('Ultra Light', 'microlight', 50000, 'plane'),
	('Nimbus', 'nimbus', 900000, 'plane'),
	('Rogue', 'rogue', 1000000, 'plane'),
	('Sea Breeze', 'seabreeze', 850000, 'plane'),
	('Sea Sparrow', 'seasparrow', 815000, 'heli'),
	('Shamal', 'shamal', 1150000, 'plane'),
	('Mallard', 'stunt', 250000, 'plane'),
	('SuperVolito', 'supervolito', 1000000, 'heli'),
	('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
	('Swift', 'swift', 1000000, 'heli'),
	('Swift Deluxe', 'swift2', 1250000, 'heli'),
	('Velum', 'velum2', 450000, 'plane'),
	('Vestra', 'vestra', 950000, 'plane'),
	('Volatus', 'volatus', 1250000, 'heli');
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.aircraft_categories wordt geschreven
CREATE TABLE IF NOT EXISTS `aircraft_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.aircraft_categories: ~2 rows (ongeveer)
/*!40000 ALTER TABLE `aircraft_categories` DISABLE KEYS */;
INSERT INTO `aircraft_categories` (`name`, `label`) VALUES
	('heli', 'Helicopters'),
	('plane', 'Planes');
/*!40000 ALTER TABLE `aircraft_categories` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.bank_transfer wordt geschreven
CREATE TABLE IF NOT EXISTS `bank_transfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.bank_transfer: ~6 rows (ongeveer)
/*!40000 ALTER TABLE `bank_transfer` DISABLE KEYS */;
INSERT INTO `bank_transfer` (`id`, `type`, `identifier`, `price`, `name`, `time`) VALUES
	(22, 1, '3157a97dab0f65d1f3dea42b965f26db876b9e43', '800', 'Sjoerd Boshert', '2022-03-03 21:13:44'),
	(23, 2, 'd1491d84201f9f3677b8a564300dc0d906188f74', '800', 'Matthijs S        ', '2022-03-03 21:13:44'),
	(24, 1, 'f76c1500479ad81ea2e626f607078f8dbac39e0b', '15000', 'Miguel Galindo', '2022-03-05 13:49:36'),
	(25, 2, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '15000', 'Jordy Galindo', '2022-03-05 13:49:36'),
	(26, 1, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '15000', 'Jordy Galindo', '2022-03-05 14:13:02'),
	(27, 2, 'f76c1500479ad81ea2e626f607078f8dbac39e0b', '15000', 'Miguel Galindo', '2022-03-05 14:13:02');
/*!40000 ALTER TABLE `bank_transfer` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.billing wordt geschreven
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.billing: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.cardealer_vehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.cardealer_vehicles: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
INSERT INTO `cardealer_vehicles` (`id`, `vehicle`, `price`) VALUES
	(1, '', 0);
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.ck_helpdesk_system wordt geschreven
CREATE TABLE IF NOT EXISTS `ck_helpdesk_system` (
  `user` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `joined` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpen data van tabel middelveenv2.ck_helpdesk_system: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `ck_helpdesk_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `ck_helpdesk_system` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.ck_verzekeringen wordt geschreven
CREATE TABLE IF NOT EXISTS `ck_verzekeringen` (
  `identifier` varchar(60) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `days` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.ck_verzekeringen: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `ck_verzekeringen` DISABLE KEYS */;
/*!40000 ALTER TABLE `ck_verzekeringen` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.communityservice wordt geschreven
CREATE TABLE IF NOT EXISTS `communityservice` (
  `identifier` varchar(100) NOT NULL,
  `actions_remaining` int(10) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.communityservice: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `communityservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `communityservice` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.customcardealer_vehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `customcardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.customcardealer_vehicles: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `customcardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `customcardealer_vehicles` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.customvehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `customvehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.customvehicles: ~256 rows (ongeveer)
/*!40000 ALTER TABLE `customvehicles` DISABLE KEYS */;
INSERT INTO `customvehicles` (`name`, `model`, `price`, `category`) VALUES
	('Audi A4 TFSI', 'aaq4', 48225, 'custom'),
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Volkswagen Amarok V6', 'amarok', 34000, 'custom'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Audi Quattro', 'audquattros', 41235, 'custom'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Renault Clio', 'clio', 12023, 'custom'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Corvette Z06', 'corvettec5z06', 101995, 'custom'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('Honda Civic', 'fk8', 33120, 'custom'),
	('FMJ', 'fmj', 185000, 'super'),
	('Mitsubishi GP FTO', 'fto', 15370, 'custom'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Golf GTI 7', 'golfgti7', 52000, 'custom'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Honda CR Vtec', 'honcrx91', 23710, 'custom'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Lexus IS350', 'is350mod', 33891, 'custom'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jeep Rubicon', 'jeep2012', 39000, 'custom'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Volvo S60', 's60pole', 44880, 'custom'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Subaru WRX', 'subwrx', 46000, 'custom'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Chevrolet Tahoe', 'tahoe', 39614, 'custom'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Audi TT RS', 'ttrs', 94630, 'custom'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('BMW M40i', 'z419', 81158, 'custom'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `customvehicles` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.customvehicle_categories wordt geschreven
CREATE TABLE IF NOT EXISTS `customvehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.customvehicle_categories: ~11 rows (ongeveer)
/*!40000 ALTER TABLE `customvehicle_categories` DISABLE KEYS */;
INSERT INTO `customvehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motors'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `customvehicle_categories` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.custom_rented_vehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `custom_rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.custom_rented_vehicles: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `custom_rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_rented_vehicles` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.datastore wordt geschreven
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.datastore: ~5 rows (ongeveer)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'Ambulance', 1),
	('society_kmar', 'kmar', 1),
	('society_mafia', 'Mafia', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.datastore_data wordt geschreven
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.datastore_data: ~5 rows (ongeveer)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_ambulance', NULL, '{}'),
	(2, 'society_mafia', NULL, '{}'),
	(3, 'society_police', NULL, '{"weapons":[{"count":12,"name":"WEAPON_PISTOL"},{"count":1,"name":"WEAPON_NIGHTSTICK"}]}'),
	(4, 'society_taxi', NULL, '{}'),
	(5, 'society_kmar', NULL, '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.dpkeybinds wordt geschreven
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.dpkeybinds: ~60 rows (ongeveer)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
	('steam:110000118914341', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000114b41068', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013fa55f2f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001045ca62c', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013e856ea8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010bcb0644', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001379d6402', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010aaf3541', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000135e9b28f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011214f32e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000119423098', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011537636e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011be2e02e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011498091a', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014c10869c', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000117d7882d', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001419c9d42', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013f570e6d', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000143a74ca8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000138889d05', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000133836cfc', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000115bb5beb', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013d3d2d84', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001421ec4c5', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010996a965', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000134c4eed4', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000110f6ae38', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013e002db4', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013db9b060', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001185cb64c', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013c9a29cd', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011ad9b754', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000116ac9c53', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001162030ce', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001187119b8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001467ae61e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010be93b62', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014b09541f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014b042920', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014baed8dc', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014bb6e858', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000148bd20aa', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001325127f2', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000116612043', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013f6203af', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000104587838', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011786aee4', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000136c4cc66', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001177b40f0', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010b0dd40f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000148be3ca8', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013f9872cc', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000014256954e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010c475e72', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000011c7a6d8b', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000010f8308a7', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:1100001340b814a', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013fff1288', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000145fc8485', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000145fc8485', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.fine_types wordt geschreven
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.fine_types: ~60 rows (ongeveer)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Onnodig claxoneren', 150, 0),
	(2, 'Rijden over een doorgetrokken streep', 240, 0),
	(3, 'Tegen het verkeer in rijden', 950, 0),
	(4, 'Poging moord ambtenaar in functie', 500, 0),
	(6, 'Fout parkeren', 750, 0),
	(7, 'Verkeerd voorsorteren', 130, 0),
	(8, 'Rijden met een WOK status ', 350, 0),
	(9, 'Door rood rijden', 250, 0),
	(10, 'Rijden zonder rijbewijs', 2500, 0),
	(11, 'Snelheid overtreding < 10km', 150, 0),
	(12, 'Snelheid overtreding 10 - 20km', 400, 0),
	(13, 'Snelheid overtreding 20 - 50km', 750, 0),
	(14, 'Snelheid overtreding > 50km', 1000, 0),
	(15, 'Openbare dronkenschap', 350, 1),
	(16, 'Wanordelijk gedrag', 500, 1),
	(17, 'Hulpdiensten hinderen', 350, 1),
	(18, 'Belediging ambtenaar in functie', 600, 1),
	(19, 'Bedreiging', 1000, 1),
	(20, 'Illegaal wapen bezit', 15000, 2),
	(21, 'Illegaal drugs bezit', 5000, 2),
	(22, 'Drugshandel', 7500, 3),
	(23, 'Geluidsoverlast openbare ruimte', 150, 1),
	(24, 'Straatartiest zonder vergunning/ontheffing', 200, 1),
	(25, 'Stilstaan op een kruispunt', 150, 0),
	(26, 'Weg belemmeren', 250, 0),
	(27, 'Wegschade aanbrengen', 250, 0),
	(28, 'Stilstaan in een tunnel', 420, 0),
	(29, 'Stilstaan op een overweg', 500, 0),
	(30, 'Stilstaan dat gevaar/hinder oplevert', 750, 0),
	(31, 'Stalking', 500, 1),
	(32, 'Stilstaan op Trottoir', 500, 4),
	(33, 'Stilstaan op zodanige wijze dat gevaar/hinder veroorzaakt kan worden', 750, 4),
	(34, 'Stilstaan in/op een Tunnel, kruispunt,  fietsstrook of overweg', 500, 4),
	(35, 'Parkeren op kruispunt', 1500, 4),
	(36, 'Voertuig dubbel parkeren', 500, 4),
	(37, 'Op een groenstrook parkeren', 1750, 4),
	(38, 'Ophouden op een wijze die onnodig overlast of hinder veroorzaakt', 1500, 4),
	(39, 'Verboden drankgebruik (onder de 18)', 120, 4),
	(40, 'Natuurlijke behoefte doen in bebouwde kom ', 150, 4),
	(41, 'Slaapplaats zonder ontheffing/vergunning buiten bestemde tereinen', 1500, 4),
	(42, 'Geluidshinder/overlast zonder ontheffing of vergunning', 1500, 4),
	(43, 'Voertuigwrak parkeren op de weg', 500, 4),
	(44, 'Belediging AIF', 425, 4),
	(45, 'gevaarlijk rijgedrag', 500, 0),
	(46, 'Moord ambtenaar in functie', 10000, 0),
	(47, 'Plegen bankoverval', 5000, 0),
	(48, 'Plegen winkeloverval', 2000, 0),
	(49, 'Plegen juwelieroverval', 4000, 0),
	(50, 'Overval van een burger', 1000, 0),
	(51, 'Gijzeling 1 persoon', 2000, 0),
	(52, 'Gijzeling meerdere personen', 5000, 0),
	(53, 'Illegaal munitiebezit', 1000, 0),
	(54, 'Illegaal steekwapenbezit', 500, 0),
	(55, 'Mishandeling burger', 2500, 0),
	(56, 'Mishandeling Ambtenaar in functie', 5000, 0),
	(57, 'Voertuigdiefstal', 1500, 0),
	(58, 'Rijden zonder rijbewijs', 2500, 0),
	(59, 'Vluchten politie', 500, 0),
	(60, 'Witwassen van geld', 2500, 0),
	(61, 'Illegaal drugsbezit', 5000, 0);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.insto_accounts wordt geschreven
CREATE TABLE IF NOT EXISTS `insto_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `surname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpen data van tabel middelveenv2.insto_accounts: ~3 rows (ongeveer)
/*!40000 ALTER TABLE `insto_accounts` DISABLE KEYS */;
INSERT INTO `insto_accounts` (`id`, `forename`, `surname`, `username`, `password`, `avatar_url`) VALUES
	(57, 'Roy', 'De jong', 'Roy Dj', 'Bloemen10', 'https://image.flaticon.com/icons/png/512/149/149071.png'),
	(58, 'Kees', 'De Jong', 'Kees De Jong', 'KeesDeJong', 'https://pbs.twimg.com/profile_images/1429885416036044808/UpNaTR66_400x400.jpg'),
	(59, 'Miguel', 'Galindo', 'Miguel', 'Monster06', 'https://image.flaticon.com/icons/png/512/149/149071.png');
/*!40000 ALTER TABLE `insto_accounts` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.insto_instas wordt geschreven
CREATE TABLE IF NOT EXISTS `insto_instas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_insto_instas_insto_accounts` (`authorId`),
  CONSTRAINT `FK_insto_instas_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel middelveenv2.insto_instas: ~4 rows (ongeveer)
/*!40000 ALTER TABLE `insto_instas` DISABLE KEYS */;
INSERT INTO `insto_instas` (`id`, `authorId`, `realUser`, `message`, `image`, `filters`, `time`, `likes`) VALUES
	(213, 57, 'eac2237361a2521cc32ec30782792e44f2db57a8', '#slang', 'https://media.discordapp.net/attachments/936578696255512596/949043681816629288/screenshot.jpeg', '', '2022-03-03 21:41:01', 0),
	(214, 57, 'eac2237361a2521cc32ec30782792e44f2db57a8', '9990386 Bel me :)', 'https://media.discordapp.net/attachments/936578696255512596/949044062281932810/screenshot.jpeg', '', '2022-03-03 21:42:34', 0),
	(215, 57, 'eac2237361a2521cc32ec30782792e44f2db57a8', 'LOL', 'https://media.discordapp.net/attachments/936578696255512596/949044690752241724/screenshot.jpeg', '', '2022-03-03 21:44:55', 0),
	(216, 59, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', 'lekker sporten', 'https://media.discordapp.net/attachments/936578696255512596/949370565649653830/screenshot.jpeg', '', '2022-03-04 19:19:54', 0);
/*!40000 ALTER TABLE `insto_instas` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.insto_likes wordt geschreven
CREATE TABLE IF NOT EXISTS `insto_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insto_likes_insto_accounts` (`authorId`),
  KEY `FK_insto_likes_insto_instas` (`inapId`),
  CONSTRAINT `FK_insto_likes_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`),
  CONSTRAINT `FK_insto_likes_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `insto_instas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpen data van tabel middelveenv2.insto_likes: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `insto_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `insto_likes` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.insto_story wordt geschreven
CREATE TABLE IF NOT EXISTS `insto_story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stories` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isRead` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_insto_story_insto_accounts` (`authorId`) USING BTREE,
  CONSTRAINT `FK_insto_story_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel middelveenv2.insto_story: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `insto_story` DISABLE KEYS */;
INSERT INTO `insto_story` (`id`, `authorId`, `realUser`, `stories`, `isRead`, `time`, `likes`) VALUES
	(225, 59, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '[{"image":"https://media.discordapp.net/attachments/936578696255512596/949370529075298334/screenshot.jpeg","time":1646414435101,"isRead":false}]', 'false', '2022-03-04 19:19:35', 0);
/*!40000 ALTER TABLE `insto_story` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.items wordt geschreven
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.items: ~183 rows (ongeveer)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('advancedrifle', 'CTAR-21', -1, 0, 1),
	('alive_chicken', 'Poulet vivant', 1, 0, 1),
	('appistol', 'Colt SCAMP', -1, 0, 1),
	('assaultrifle', 'AK 47', -1, 0, 1),
	('assaultrifle_mk2', 'assaultrifle_mk2', -1, 0, 1),
	('assaultshotgun', 'UTAS UTS-15', -1, 0, 1),
	('assaultsmg', 'Magpul PDR', -1, 0, 1),
	('autoshotgun', 'AA-12', -1, 0, 1),
	('ball', 'ball', -1, 0, 1),
	('ball_ammo', 'ball_ammo', 100, 0, 1),
	('bandage', 'Bandage', 2, 0, 1),
	('bat', 'Baseball Bat', -1, 0, 1),
	('battleaxe', 'Battle Axe', -1, 0, 1),
	('bird_crap_ammo', 'bird_crap_ammo', 100, 0, 1),
	('blowpipe', 'Chalumeaux', 2, 0, 1),
	('bottle', 'Bottle', -1, 0, 1),
	('bread', 'Brood', 1, 0, 1),
	('bullpuprifle', 'Type 86-S', -1, 0, 1),
	('bullpuprifle_mk2', 'bullpuprifle_mk2', -1, 0, 1),
	('bullpupshotgun', 'Kel-Tec KSG', -1, 0, 1),
	('bzgas', 'bz gas', -1, 0, 1),
	('carbinerifle', 'M4A1', -1, 0, 1),
	('carbinerifle_mk2', 'carbinerifle_mk2', -1, 0, 1),
	('carokit', 'Kit carosserie', 3, 0, 1),
	('carotool', 'outils carosserie', 2, 0, 1),
	('clothe', 'Vêtement', 1, 0, 1),
	('coca_leaf', 'Coke Bladeren', 1, 0, 1),
	('coke', 'Coke', 40, 0, 1),
	('coke_pooch', 'Coke Zakjes', 5, 0, 1),
	('combatmg', 'M249E1', -1, 0, 1),
	('combatmg_mk2', 'combatmg_mk2', -1, 0, 1),
	('combatpdw', 'SIG Sauer MPX', -1, 0, 1),
	('combatpistol', 'Glock 19', -1, 0, 1),
	('compactlauncher', 'M79 GL', -1, 0, 1),
	('compactrifle', 'Micro Draco AK Pistol', -1, 0, 1),
	('copper', 'Cuivre', 1, 0, 1),
	('crowbar', 'Crow Bar', -1, 0, 1),
	('cutted_wood', 'Bois coupé', 1, 0, 1),
	('dagger', 'Dagger', -1, 0, 1),
	('dbshotgun', 'Zabala short-barreled side-by-side shotgun', -1, 0, 1),
	('demper', 'Demper', -1, 0, 1),
	('diamond', 'Diamant', 1, 0, 1),
	('dia_box', 'Diamond Box', 2, 0, 1),
	('digiscanner', 'digiscanner', -1, 0, 1),
	('doubleaction', 'doubleaction', -1, 0, 1),
	('enemy_laser_ammo', 'enemy_laser_ammo', 100, 0, 1),
	('essence', 'Essence', 1, 0, 1),
	('fabric', 'Tissu', 1, 0, 1),
	('fireextinguisher', 'Fire Extinguisher', -1, 0, 1),
	('fireextinguisher_ammo', 'fireextinguisher_ammo', 100, 0, 1),
	('firework', 'Firework', -1, 0, 1),
	('fish', 'Vis', 1, 0, 1),
	('fishbait', 'Fish Bait', 30, 0, 1),
	('fishingrod', 'Fishing Rod', 2, 0, 1),
	('fixkit', 'Kit réparation', 3, 0, 1),
	('fixtool', 'outils réparation', 2, 0, 1),
	('flare', 'Flare', -1, 0, 1),
	('flaregun', 'Flare Gun', -1, 0, 1),
	('flare_ammo', 'Flares', 100, 0, 1),
	('flashlight', 'Flashlight', -1, 0, 1),
	('garbagebag', 'garbagebag', -1, 0, 1),
	('gazbottle', 'bouteille de gaz', 2, 0, 1),
	('gold', 'Goud', 1, 0, 1),
	('gold_bar', 'Gold Bar', 2, 0, 1),
	('golfclub', 'Golf Club', -1, 0, 1),
	('grenade', 'grenade', -1, 0, 1),
	('grenadelauncher', 'Milkor MGL', -1, 0, 1),
	('grenadelauncher_ammo', 'grenadelauncher_ammo', 100, 0, 1),
	('grenadelauncher_smoke_ammo', 'grenadelauncher_smoke_ammo', 100, 0, 1),
	('gusenberg', 'M1928A1 Thompson SMG', -1, 0, 1),
	('gzgas_ammo', 'gzgas_ammo', 100, 0, 1),
	('hammer', 'Hammer', -1, 0, 1),
	('handcuffs', 'handcuffs', -1, 0, 1),
	('hatchet', 'hatchet', -1, 0, 1),
	('heavyarmor', 'Zware Armor', 1, 0, 1),
	('heavypistol', 'EWB 1911', -1, 0, 1),
	('heavyshotgun', 'Saiga-12K', -1, 0, 1),
	('heavysniper', 'M107', -1, 0, 1),
	('heavysniper_mk2', 'heavysniper_mk2', -1, 0, 1),
	('heroin', 'Heroin', 80, 0, 1),
	('hominglauncher', 'SA-7 Grail', -1, 0, 1),
	('hydrochloric_acid', 'HydroChloric Acid', 15, 0, 1),
	('id_card', 'ID Card', 1, 0, 1),
	('iron', 'Fer', 1, 0, 1),
	('jewels', 'Jewels', 1, 0, 1),
	('knife', 'Knife', -1, 0, 1),
	('knuckle', 'Knuckledusters', -1, 0, 1),
	('laptop_h', 'Hacker Laptop', 1, 0, 1),
	('largescope', 'Large Scope', -1, 0, 1),
	('lightarmor', 'Lichte Armor', 1, 0, 1),
	('lockpick', 'Lockpick', 1, 0, 1),
	('lsa', 'LSA', 100, 0, 1),
	('lsd', 'LSD', 100, 0, 1),
	('machete', 'machete', -1, 0, 1),
	('machinepistol', 'TEC-9', -1, 0, 1),
	('marksmanpistol', 'Thompson-Center Contender G2', -1, 0, 1),
	('marksmanrifle', 'M39 EMR', -1, 0, 1),
	('marksmanrifle_mk2', 'marksmanrifle_mk2', -1, 0, 1),
	('medikit', 'Medikit', 2, 0, 1),
	('mediumarmor', 'Medium Armor', 1, 0, 1),
	('mediumscope', 'Medium Scope', -1, 0, 1),
	('meth', 'Meth', 30, 0, 1),
	('mg', 'PKP Pecheneg', -1, 0, 1),
	('mg_ammo', 'MG Ammo', 100, 0, 1),
	('microsmg', 'Micro SMG', -1, 0, 1),
	('minigun', 'minigun', -1, 0, 1),
	('minigun_ammo', 'Minigun Ammo', 100, 0, 1),
	('minismg', 'Skorpion Vz. 61', -1, 0, 1),
	('molotov', 'Molotov Cocktail', -1, 0, 1),
	('molotov_ammo', 'molotov_ammo', 100, 0, 1),
	('MountedScope', 'Scope Pistols MK2', -1, 0, 1),
	('musket', 'Brown Bess', -1, 0, 1),
	('nightstick', 'ASP Baton', -1, 0, 1),
	('nightvision', 'Night Vision', -1, 0, 1),
	('packaged_chicken', 'Poulet en barquette', 1, 0, 1),
	('packaged_plank', 'Paquet de planches', 1, 0, 1),
	('parachute', 'parachute', -1, 0, 1),
	('petrol', 'Pétrole', 1, 0, 1),
	('petrolcan', 'Petrol Can', -1, 0, 1),
	('petrol_raffin', 'Pétrole Raffiné', 1, 0, 1),
	('phone', 'Telefoon', 1, 0, 1),
	('pipebomb', 'pipe bomb', -1, 0, 1),
	('pistol', 'Colt M1911', -1, 0, 1),
	('pistol50', 'Desert Eagle', -1, 0, 1),
	('pistol_ammo', 'Pistol Ammo', -1, 0, 1),
	('pistol_mk2', 'Sig Sauer P226', -1, 0, 1),
	('plane_rocket_ammo', 'plane_rocket_ammo', 100, 0, 1),
	('player_laser_ammo', 'player_laser_ammo', 100, 0, 1),
	('poolcue', 'pool cue', -1, 0, 1),
	('poppyresin', 'Poppy Resin', 160, 0, 1),
	('proxmine', 'Proxmine Mine', -1, 0, 1),
	('pumpshotgun', 'Remington 870', -1, 0, 1),
	('pumpshotgun_mk2', 'pumpshotgun_mk2', -1, 0, 1),
	('railgun', 'railgun', -1, 0, 1),
	('receipt', 'W.C receipt', 100, 0, 1),
	('remotesniper', 'Remote Sniper', -1, 0, 1),
	('revolver', 'Taurus Raging Bull', -1, 0, 1),
	('revolver_mk2', 'revolver_mk2', -1, 0, 1),
	('riflescope', 'Scope Rifles', -1, 0, 1),
	('rifle_ammo', 'Rifle Ammo', 100, 0, 1),
	('rpg', 'RPG-7', -1, 0, 1),
	('rpg_ammo', 'RPG Ammo', 100, 0, 1),
	('rugzak', 'Rugzak', -400, 0, 1),
	('sawnoffshotgun', 'Mossberg 500', -1, 0, 1),
	('shark', 'Shark', -1, 0, 1),
	('shotgun_ammo', 'Shotgun Ammo', 100, 0, 1),
	('slaughtered_chicken', 'Poulet abattu', 1, 0, 1),
	('smg', 'MP5A3', -1, 0, 1),
	('smg_ammo', 'SMG Ammo', 100, 0, 1),
	('smg_mk2', 'smg_mk2', -1, 0, 1),
	('smokegrenade', 'smoke grenade', -1, 0, 1),
	('smokegrenade_ammo', 'smokegrenade_ammo', 100, 0, 1),
	('sniperrifle', 'PSG-1', -1, 0, 1),
	('sniper_ammo', 'Sniper Ammo', 100, 0, 1),
	('sniper_remote_ammo', 'Sniper Remote Ammo', 100, 0, 1),
	('snowball', 'Snow Ball', -1, 0, 1),
	('snspistol', 'H&K P7', -1, 0, 1),
	('snspistol_mk2', 'snspistol_mk2', -1, 0, 1),
	('sodium_hydroxide', 'Sodium Hydroxide', 15, 0, 1),
	('space_rocket_ammo', 'space_rocket_ammo', 100, 0, 1),
	('specialcarbine', 'H&K G36C', -1, 0, 1),
	('specialcarbine_mk2', 'specialcarbine_mk2', -1, 0, 1),
	('stickybomb', 'sticky bomb', -1, 0, 1),
	('stickybomb_ammo', 'stickybomb_ammo', 100, 0, 1),
	('stinger', 'stinger', -1, 0, 1),
	('stinger_ammo', 'stinger_ammo', 100, 0, 1),
	('stone', 'Pierre', 1, 0, 1),
	('stungun', 'X26 Taser', -1, 0, 1),
	('stungun_ammo', 'Stungun Ammo', 100, 0, 1),
	('sulfuric_acid', 'Sulfuric Acid', 15, 0, 1),
	('switchblade', 'Switchblade', -1, 0, 1),
	('tank_ammo', 'tank_ammo', 100, 0, 1),
	('thermal_charge', 'Thermal Charge', 1, 0, 1),
	('thionyl_chloride', 'Thionyl Chloride', 100, 0, 1),
	('turtle', 'Sea Turtle', 3, 0, 1),
	('turtlebait', 'Turtle Bait', 10, 0, 1),
	('vintagepistol', 'FN Model 1910', -1, 0, 1),
	('washed_stone', 'Pierre Lavée', 1, 0, 1),
	('water', 'Water', 1, 0, 1),
	('weaponflashlight', 'flashlight Weapons', -1, 0, 1),
	('weed_pooch', 'Zakje Wiet', 1, 0, 1),
	('weed_seed', 'Zaadje Wiet', 1, 0, 1),
	('wood', 'Bois', 1, 0, 1),
	('wool', 'Laine', 1, 0, 1),
	('wrench', 'wrench', -1, 0, 1),
	('zakjes', 'Zakjes', 1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.jobs wordt geschreven
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.jobs: ~25 rows (ongeveer)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Ambulance', 1),
	('cardealer', 'Cardealer', 1),
	('customcardealer', 'customcardealer', 1),
	('fisherman', 'Visser', 0),
	('fueler', 'Raffineur', 0),
	('garbage', 'Vuilnisman', 0),
	('kmar', 'Kmar', 1),
	('lumberjack', 'Houthakker', 0),
	('mafia', '💸 Bratva Nostra', 1),
	('mechanic', 'ANWB', 1),
	('miner', 'Miner', 0),
	('offambulance', 'Ambulance', 1),
	('offmechanic', 'ANWB', 1),
	('offpolice', 'Politie', 1),
	('offtaxi', 'Taxi', 1),
	('police', 'Politie', 1),
	('rea', 'Real estate agent', 1),
	('realestateagent', 'Makelaar', 1),
	('reporter', 'Journaliste', 0),
	('slaughterer', 'Abatteur', 0),
	('tailor', 'Couturier', 0),
	('taxi', 'Taxi', 0),
	('trucker', 'Trucker', 0),
	('unemployed', 'Unemployed', 0),
	('windowcleaner', 'Windowcleaner', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.job_grades wordt geschreven
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.job_grades: ~96 rows (ongeveer)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 380, '{}', '{}'),
	(2, 'ambulance', 0, 'ambulance', 'OP - In Opleiding', 718, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(3, 'ambulance', 1, 'doctor', 'OP', 758, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(4, 'ambulance', 2, 'chief_doctor', 'Broeder', 822, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(5, 'ambulance', 3, 'doctor', 'Verpleegkundige', 862, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(10, 'lumberjack', 0, 'employee', 'Intérimaire', 220, '{}', '{}'),
	(11, 'fisherman', 0, 'employee', 'Intérimaire', 220, '{}', '{}'),
	(12, 'fueler', 0, 'employee', 'Intérimaire', 220, '{}', '{}'),
	(13, 'reporter', 0, 'employee', 'Intérimaire', 220, '{}', '{}'),
	(14, 'tailor', 0, 'employee', 'Intérimaire', 220, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(15, 'miner', 0, 'employee', 'Intérimaire', 220, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(16, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(17, 'mafia', 0, 'Peaky', 'Lid', 0, '{}', '{}'),
	(18, 'mafia', 2, 'Bratva', 'Lid', 0, '{}', '{}'),
	(19, 'mafia', 3, 'Humble', 'Lid', 0, '{}', '{}'),
	(20, 'mafia', 4, 'Gang Naam', 'Lid', 0, '{}', '{}'),
	(21, 'mafia', 5, 'Gang Naam', 'Lid', 0, '{}', '{}'),
	(22, 'mafia', 6, 'Gang Naam', 'Lid', 0, '{}', '{}'),
	(23, 'mechanic', 0, 'recrue', 'Stagiair', 515, '{}', '{}'),
	(24, 'mechanic', 1, 'novice', 'Monteur I.O', 609, '{}', '{}'),
	(25, 'mechanic', 2, 'experimente', 'Monteur', 644, '{}', '{}'),
	(26, 'mechanic', 4, 'chief', 'Autotechnicus I.O ', 689, '{}', '{}'),
	(28, 'police', 0, 'recruit', 'Aspirant', 654, '{}', '{}'),
	(29, 'police', 1, 'officer', 'Surveillant', 684, '{}', '{}'),
	(30, 'police', 2, 'sergeant', 'Agent', 729, '{}', '{}'),
	(31, 'police', 3, 'lieutenant', 'Hoofd Agent', 774, '{}', '{}'),
	(32, 'police', 9, 'boss', 'EHC', 1052, '{}', '{}'),
	(33, 'realestateagent', 0, 'location', 'Asst. Makelaar', 617, '{}', '{}'),
	(34, 'realestateagent', 1, 'location', 'Makelaar', 726, '{}', '{}'),
	(35, 'realestateagent', 2, 'boss', 'Baas', 890, '{}', '{}'),
	(37, 'taxi', 0, 'recrue', 'Recrue', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(42, 'trucker', 0, 'employe', 'Medewerker', 220, '{}', '{}'),
	(43, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(44, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(45, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(46, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
	(47, 'windowcleaner', 0, 'cleaner', 'Cleaner', 100, '{}', '{}'),
	(48, 'garbage', 0, 'employee', 'Employee', 750, '{"tshirt_1":59,"torso_1":89,"arms":31,"pants_1":36,"glasses_1":19,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":2,"glasses_2":0,"torso_2":1,"shoes":35,"hair_1":0,"skin":0,"sex":0,"glasses_1":19,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":5}', '{"tshirt_1":36,"torso_1":0,"arms":68,"pants_1":30,"glasses_1":15,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":0,"face":27,"glasses_2":0,"torso_2":11,"shoes":26,"hair_1":5,"skin":0,"sex":1,"glasses_1":15,"pants_2":2,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":19}'),
	(49, 'customcardealer', 0, 'experienced', 'Verkoper', 653, '{}', '{}'),
	(50, 'customcardealer', 1, 'boss', 'Teamleider', 744, '{}', '{}'),
	(52, 'police', 4, 'sergeant', 'Brigadier', 817, '{}', '{}'),
	(55, 'police', 5, 'sergeant', 'Inspecteur', 865, '{}', '{}'),
	(56, 'police', 6, 'sergeant', 'Hoofd Inspecteur', 927, '{}', '{}'),
	(57, 'police', 7, 'boss', 'Commissaris', 966, '{}', '{}'),
	(58, 'police', 8, 'boss', 'HC', 994, '{}', '{}'),
	(60, 'customcardealer', 2, 'boss', 'Baas', 898, '{}', '{}'),
	(62, 'ambulance', 4, 'doctor', 'Geneeskundige', 928, '{}', '{}'),
	(63, 'ambulance', 5, 'boss', 'Hoofd Geneeskundige', 1004, '{}', '{}'),
	(72, 'mechanic', 3, 'experimente', 'Hoofd Monteur', 747, '{}', '{}'),
	(73, 'mechanic', 5, 'chief', 'Autotechnicus', 801, '{}', '{}'),
	(74, 'mechanic', 6, 'chief', 'Teamleider', 868, '{}', '{}'),
	(75, 'mechanic', 7, 'boss', 'Directeur', 985, '{}', '{}'),
	(88, 'offpolice', 0, 'off', 'Uit dienst', 400, '{}', '{}'),
	(89, 'offambulance', 0, 'off', 'Uit dienst', 400, '{}', '{}'),
	(90, 'offmechanic', 0, 'off', 'Uit dienst', 400, '{}', '{}'),
	(91, 'offpolice', 1, 'off', 'Uit dienst', 400, '{}', '{}'),
	(96, 'offpolice', 2, 'off', 'Uit dienst', 400, '{}', '{}'),
	(97, 'offpolice', 3, 'off', 'Uit dienst', 400, '{}', '{}'),
	(98, 'offpolice', 4, 'off', 'Uit dienst', 400, '{}', '{}'),
	(99, 'offpolice', 5, 'off', 'Uit dienst', 400, '{}', '{}'),
	(100, 'offpolice', 6, 'off', 'Uit dienst', 400, '{}', '{}'),
	(101, 'offpolice', 7, 'off', 'Uit dienst', 400, '{}', '{}'),
	(102, 'offpolice', 8, 'off', 'Uit dienst', 400, '{}', '{}'),
	(103, 'offpolice', 9, 'off', 'Uit dienst', 400, '{}', '{}'),
	(104, 'offambulance', 1, 'off', 'Uit dienst', 400, '{}', '{}'),
	(105, 'offambulance', 2, 'off', 'Uit dienst', 400, '{}', '{}'),
	(106, 'offambulance', 3, 'off', 'Uit dienst', 400, '{}', '{}'),
	(107, 'offambulance', 4, 'off', 'Uit dienst', 400, '{}', '{}'),
	(108, 'offambulance', 5, 'off', 'Uit dienst', 400, '{}', '{}'),
	(109, 'offambulance', 6, 'off', 'Uit dienst', 400, '{}', '{}'),
	(110, 'offambulance', 7, 'off', 'Uit dienst', 400, '{}', '{}'),
	(111, 'offmechanic', 1, 'off', 'Uit dienst', 400, '{}', '{}'),
	(112, 'offmechanic', 2, 'off', 'Uit dienst', 400, '{}', '{}'),
	(113, 'offmechanic', 3, 'off', 'Uit dienst', 400, '{}', '{}'),
	(114, 'offmechanic', 4, 'off', 'Uit dienst', 400, '{}', '{}'),
	(115, 'offmechanic', 5, 'off', 'Uit dienst', 400, '{}', '{}'),
	(116, 'offmechanic', 6, 'off', 'Uit dienst', 400, '{}', '{}'),
	(117, 'offmechanic', 7, 'off', 'Uit dienst', 400, '{}', '{}'),
	(118, 'kmar', 0, 'vklasse', '4e Klasse', 500, '{}', '{}'),
	(119, 'kmar', 1, 'dklasse', '3e Klasse', 500, '{}', '{}'),
	(120, 'kmar', 2, 'tklasse', '2e Klasse', 500, '{}', '{}'),
	(121, 'kmar', 3, 'eklasse', '1e Klasse', 500, '{}', '{}'),
	(122, 'kmar', 4, 'wachtmeester', 'Wachtmeester', 500, '{}', '{}'),
	(123, 'kmar', 5, 'ewachtmeester', 'Wachtmeester 1e Klas', 500, '{}', '{}'),
	(124, 'kmar', 6, 'owachtmeester', 'Opper wachtmeester', 500, '{}', '{}'),
	(125, 'kmar', 7, 'aofficier', 'Adjudant onderofficier', 500, '{}', '{}'),
	(126, 'kmar', 8, 'kornet', 'Kornet', 500, '{}', '{}'),
	(127, 'kmar', 9, 'tluitenant', '2e Luitenant', 500, '{}', '{}'),
	(128, 'kmar', 10, 'eluitenant', '1e Luitenant', 500, '{}', '{}'),
	(129, 'kmar', 11, 'kapitein', 'Kapitein', 500, '{}', '{}'),
	(130, 'kmar', 12, 'majoor', 'Majoor', 500, '{}', '{}'),
	(131, 'kmar', 13, 'lkolonel', 'Luitenant Kolonel', 500, '{}', '{}'),
	(132, 'kmar', 14, 'kolonel', 'Kolonel', 500, '{}', '{}'),
	(133, 'kmar', 15, 'brigadegenraal', 'Brigadegeneraal', 500, '{}', '{}'),
	(134, 'kmar', 16, 'gmajoor', 'Generaal majoor', 500, '{}', '{}'),
	(135, 'kmar', 17, 'luitenant', 'Luitenant generaal', 500, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.licenses wordt geschreven
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.licenses: ~6 rows (ongeveer)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft', 'Vliegbrevet'),
	('boat', 'Vaarbweijs'),
	('dmv', 'Theorie'),
	('drive', 'Autorijbewijs'),
	('drive_bike', 'Motor rijbewijs'),
	('drive_truck', 'Vrachtwagen Rijbewijs');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.loaf_bought_houses wordt geschreven
CREATE TABLE IF NOT EXISTS `loaf_bought_houses` (
  `houseid` int(9) NOT NULL,
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.loaf_bought_houses: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `loaf_bought_houses` DISABLE KEYS */;
INSERT INTO `loaf_bought_houses` (`houseid`, `owner`) VALUES
	(331, 'cd4b446d0873d0d2943bc3bace3c55692e953516');
/*!40000 ALTER TABLE `loaf_bought_houses` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.loaf_houses wordt geschreven
CREATE TABLE IF NOT EXISTS `loaf_houses` (
  `id` int(8) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `property_type` varchar(25) DEFAULT NULL,
  `shell_type` varchar(40) DEFAULT NULL,
  `entrance` longtext DEFAULT NULL,
  `garage_entrance` longtext DEFAULT NULL,
  `garage_exit` longtext DEFAULT NULL,
  `shell_id` int(5) DEFAULT NULL,
  `price` int(9) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.loaf_houses: ~330 rows (ongeveer)
/*!40000 ALTER TABLE `loaf_houses` DISABLE KEYS */;
INSERT INTO `loaf_houses` (`id`, `label`, `property_type`, `shell_type`, `entrance`, `garage_entrance`, `garage_exit`, `shell_id`, `price`) VALUES
	(1, 'Eclipse towers 1', 'apartment', 'HighEndApartment', '{"z":85.69999694824219,"y":312.9100036621094,"x":-777.2899780273438,"h":175.0}', '{"z":85.70210266113281,"y":307.93585205078127,"x":-790.3209838867188}', '{"z":85.27999877929688,"y":332.30999755859377,"x":-800.5499877929688,"h":180.0}', NULL, 0),
	(2, 'Eclipse towers 2', 'apartment', 'HighEndApartment', '{"z":85.69999694824219,"y":312.9100036621094,"x":-775.0700073242188,"h":175.0}', '{"z":85.70210266113281,"y":307.93585205078127,"x":-790.3209838867188}', '{"z":85.27999877929688,"y":332.30999755859377,"x":-800.5499877929688,"h":180.0}', NULL, 0),
	(3, 'Eclipse towers 3', 'apartment', 'HighEndApartment', '{"z":85.69999694824219,"y":312.9100036621094,"x":-772.75,"h":175.0}', '{"z":85.70210266113281,"y":307.93585205078127,"x":-790.3209838867188}', '{"z":85.27999877929688,"y":332.30999755859377,"x":-800.5499877929688,"h":180.0}', NULL, 0),
	(4, 'Eclipse towers 4', 'apartment', 'HighEndApartment', '{"z":85.69999694824219,"y":312.9100036621094,"x":-770.469970703125,"h":175.0}', '{"z":85.70210266113281,"y":307.93585205078127,"x":-790.3209838867188}', '{"z":85.27999877929688,"y":332.30999755859377,"x":-800.5499877929688,"h":180.0}', NULL, 0),
	(5, 'Rockford Hills 2835', 'house', 'HighEndHouse', '{"z":92.12418365478516,"y":422.1172180175781,"x":-824.6912231445313,"h":4.62664127349853}', '{"z":91.55997467041016,"y":421.8330078125,"x":-812.2012939453125}', '{"z":91.16476440429688,"y":424.8085632324219,"x":-805.76806640625,"h":358.1205139160156}', NULL, 0),
	(6, 'Rockford Hills', 'house', 'MidTierHouse', '{"z":100.19689178466797,"y":430.98797607421877,"x":-762.0980224609375,"h":20.41704750061035}', '{"z":99.87000274658203,"y":435.5,"x":-759.27001953125}', '{"z":99.33226013183594,"y":439.4993591308594,"x":-756.37158203125,"h":32.0273551940918}', NULL, 0),
	(7, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":100.17911529541016,"y":459.03790283203127,"x":-784.3112182617188,"h":214.1674041748047}', '{"z":100.18000030517578,"y":467.69000244140627,"x":-771.5999755859375}', '{"z":100.04393768310547,"y":465.86376953125,"x":-766.138671875,"h":221.4723358154297}', NULL, 0),
	(8, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":106.90912628173828,"y":449.08349609375,"x":-717.9176025390625,"h":33.66155242919922}', '{"z":106.9000015258789,"y":441.0899963378906,"x":-734.4400024414063}', '{"z":106.45419311523438,"y":443.0745544433594,"x":-737.6014404296875,"h":22.5447940826416}', NULL, 0),
	(9, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":109.38545989990235,"y":490.09130859375,"x":-721.677490234375,"h":207.96739196777345}', '{"z":109.27999877929688,"y":501.239990234375,"x":717.8099975585938}', '{"z":108.78099822998047,"y":498.7490539550781,"x":-714.3937377929688,"h":205.49346923828126}', NULL, 0),
	(10, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":113.52600860595703,"y":511.6913757324219,"x":-678.9090576171875,"h":195.7241668701172}', '{"z":110.29000091552735,"y":507.04998779296877,"x":-684.6300048828125}', '{"z":109.88667297363281,"y":503.4945373535156,"x":-688.291259765625,"h":22.49526596069336}', NULL, 0),
	(11, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":114.13648986816406,"y":471.8700866699219,"x":-667.1611938476563,"h":12.57331562042236}', '{}', '{}', NULL, 0),
	(12, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":109.68778991699219,"y":519.7014770507813,"x":-640.84423828125,"h":191.8369598388672}', '{"z":109.69000244140625,"y":523.0999755859375,"x":-630.4199829101563}', '{"z":109.23080444335938,"y":518.7260131835938,"x":-632.1475830078125,"h":190.06854248046876}', NULL, 0),
	(13, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":108.85733795166016,"y":489.1974182128906,"x":-622.8087768554688,"h":10.02187061309814}', '{"z":108.77999877929688,"y":490.1780090332031,"x":-618.02001953125}', '{"z":107.72460174560547,"y":493.49322509765627,"x":-615.183349609375,"h":9.01824474334716}', NULL, 0),
	(14, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":107.75515747070313,"y":530.1558837890625,"x":-595.4383544921875,"h":189.6404266357422}', '{"z":108.19999694824219,"y":530.510009765625,"x":-593.260009765625}', '{"z":107.4308853149414,"y":529.0723266601563,"x":-586.5182495117188,"h":227.30792236328126}', NULL, 0),
	(15, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":108.90293884277344,"y":491.8498840332031,"x":-580.4532470703125,"h":15.84965991973877}', '{"z":106.95999908447266,"y":429.5400085449219,"x":-577.739990234375}', '{"z":106.05406188964844,"y":496.98516845703127,"x":-575.2432861328125,"h":9.68049526214599}', NULL, 0),
	(16, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":112.9415512084961,"y":517.4584350585938,"x":-526.9786987304688,"h":43.37550354003906}', '{"z":112.44000244140625,"y":522.9099731445313,"x":-526.3699951171875}', '{"z":111.63211822509766,"y":526.8306884765625,"x":-527.3204956054688,"h":45.06386566162109}', NULL, 0),
	(17, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":110.70709228515625,"y":540.9243774414063,"x":-554.58203125,"h":152.4475555419922}', '{"z":110.58000183105469,"y":548.9600219726563,"x":-545.6400146484375}', '{"z":109.98294067382813,"y":544.2171630859375,"x":-543.8478393554688,"h":279.5569152832031}', NULL, 0),
	(18, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":103.19364166259766,"y":477.494140625,"x":-537.0078735351563,"h":59.31776428222656}', '{"z":103.1500015258789,"y":479.8999938964844,"x":-536.8900146484375}', '{"z":102.57349395751953,"y":484.1575927734375,"x":-537.2759399414063,"h":49.00045394897461}', NULL, 0),
	(19, 'West Vinewood', 'house', 'MidTierHouse', '{"z":101.80531311035156,"y":402.84576416015627,"x":-560.9957275390625,"h":32.41534423828125}', '{"z":100.66000366210938,"y":397.8699951171875,"x":-571.1799926757813}', '{"z":100.24240112304688,"y":400.2047424316406,"x":-576.3189697265625,"h":23.08262062072754}', NULL, 0),
	(20, 'West Vinewood', 'house', 'MidTierHouse', '{"z":101.8824691772461,"y":393.3641052246094,"x":-595.6107788085938,"h":7.71977138519287}', '{"z":101.88999938964844,"y":394.760009765625,"x":-600.219970703125}', '{"z":101.18163299560547,"y":398.99713134765627,"x":-604.3967895507813,"h":6.40079164505004}', NULL, 0),
	(21, 'West Vinewood', 'house', 'MidTierHouse', '{"z":101.62678527832031,"y":398.5717468261719,"x":-615.31884765625,"h":0.24803513288497}', '{"z":101.2300033569336,"y":399.20001220703127,"x":-625.0599975585938}', '{"z":100.6873550415039,"y":401.8924865722656,"x":-628.7133178710938,"h":324.10357666015627}', NULL, 0),
	(22, 'West Vinewood 3565', 'house', 'HighEndHouse', '{"z":97.80772399902344,"y":433.2578430175781,"x":-516.9315185546875,"h":131.0645294189453}', '{"z":97.70999908447266,"y":430.94000244140627,"x":-514.97998046875}', '{"z":96.76660919189453,"y":426.10430908203127,"x":-513.6546020507813,"h":194.28480529785157}', NULL, 0),
	(23, 'West Vinewood 3567', 'house', 'MidTierHouse', '{"z":103.12187957763672,"y":412.8357849121094,"x":-476.546630859375,"h":202.74456787109376}', '{"z":99.23999786376953,"y":409.69000244140627,"x":-485.92999267578127}', '{"z":98.58686065673828,"y":408.5997009277344,"x":-491.9060974121094,"h":206.40489196777345}', NULL, 0),
	(24, 'West Vinewood 3550', 'house', 'HighEndHouse', '{"z":104.7471923828125,"y":329.2476501464844,"x":-469.41839599609377,"h":246.6416473388672}', '{"z":104.1500015258789,"y":350.3399963378906,"x":-471.0}', '{"z":103.42559814453125,"y":354.339599609375,"x":-473.5289306640625,"h":338.01373291015627}', NULL, 0),
	(25, 'West Vinewood 3552', 'house', 'HighEndHouse', '{"z":105.43827819824219,"y":343.67352294921877,"x":-444.28289794921877,"h":0.29297676682472}', '{"z":105.83999633789063,"y":342.67999267578127,"x":-436.8800048828125}', '{"z":105.4883041381836,"y":344.41961669921877,"x":-432.97174072265627,"h":317.7217712402344}', NULL, 0),
	(26, 'West Vinewood 3554', 'house', 'HighEndHouse', '{"z":108.90744018554688,"y":341.3977355957031,"x":-409.4959411621094,"h":275.26788330078127}', '{"z":108.72000122070313,"y":339.989990234375,"x":-396.07000732421877}', '{"z":108.29840087890625,"y":338.2376403808594,"x":-398.6346130371094,"h":358.752685546875}', NULL, 0),
	(27, 'West Vinewood 3556', 'house', 'MidTierHouse', '{"z":109.94267272949219,"y":343.7440185546875,"x":-371.8013610839844,"h":4.46719408035278}', '{"z":109.30000305175781,"y":344.2699890136719,"x":-37821.0}', '{"z":108.76036071777344,"y":347.0999755859375,"x":-381.0218200683594,"h":9.56131649017334}', NULL, 0),
	(28, 'West Vinewood 3558', 'house', 'MidTierHouse', '{"z":110.01712799072266,"y":370.1221008300781,"x":-328.2601013183594,"h":20.45827674865722}', '{"z":110.0199966430664,"y":368.010009765625,"x":-342.7900085449219}', '{"z":109.58145904541016,"y":368.4814453125,"x":-347.96893310546877,"h":28.66666793823242}', NULL, 0),
	(29, 'West Vinewood 3560', 'house', 'HighEndHouse', '{"z":112.09540557861328,"y":379.9143371582031,"x":-297.7347717285156,"h":18.66468429565429}', '{"z":110.33999633789063,"y":377.2200012207031,"x":-300.57000732421877}', '{"z":109.91675567626953,"y":379.0832214355469,"x":-305.09637451171877,"h":15.11612796783447}', NULL, 0),
	(30, 'West Vinewood 3562', 'house', 'HighEndHouse', '{"z":112.42778778076172,"y":381.63482666015627,"x":-239.5455322265625,"h":94.41919708251953}', '{"z":110.0199966430664,"y":394.8500061035156,"x":-255.4199981689453}', '{"z":109.55803680419922,"y":397.2712707519531,"x":-259.77178955078127,"h":338.3894348144531}', NULL, 0),
	(31, 'West Vinewood 3564', 'house', 'HighEndHouse', '{"z":111.10847473144531,"y":400.5246887207031,"x":-214.26976013183595,"h":10.06319999694824}', '{"z":110.91000366210938,"y":406.5299987792969,"x":-198.05999755859376}', '{"z":109.9417953491211,"y":410.77056884765627,"x":-201.89199829101563,"h":348.6280517578125}', NULL, 0),
	(32, 'West Vinewood', 'house', 'HighEndHouse', '{"z":110.30886840820313,"y":431.8569030761719,"x":-305.268798828125,"h":12.99416732788086}', '{"z":109.87000274658203,"y":429.7699890136719,"x":-315.95001220703127}', '{"z":109.08302307128906,"y":433.4432373046875,"x":-319.5901794433594,"h":26.07535362243652}', NULL, 0),
	(33, 'West Vinewood 3569', 'house', 'HighEndHouse', '{"z":112.34143829345703,"y":427.3237609863281,"x":-400.62506103515627,"h":245.42820739746095}', '{"z":112.33999633789063,"y":430.1499938964844,"x":-397.3599853515625}', '{"z":111.9189224243164,"y":433.8038330078125,"x":-393.6448059082031,"h":213.03001403808595}', NULL, 0),
	(34, 'Vinewood Hills 2848', 'house', 'MidTierHouse', '{"z":120.83665466308594,"y":594.42431640625,"x":-519.8760986328125,"h":284.29296875}', '{"z":120.81999969482422,"y":578.3499755859375,"x":-516.8900146484375}', '{"z":120.52325439453125,"y":575.5513305664063,"x":-519.0488891601563,"h":281.4464416503906}', NULL, 0),
	(35, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":128.68338012695313,"y":585.9111938476563,"x":-474.7575378417969,"h":81.07723999023438}', '{"z":127.77999877929688,"y":596.4500122070313,"x":-475.1600036621094}', '{"z":126.97510528564453,"y":599.2903442382813,"x":-479.485595703125,"h":102.73505401611328}', NULL, 0),
	(36, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":120.59142303466797,"y":552.4281005859375,"x":-500.62335205078127,"h":341.6211853027344}', '{"z":120.30000305175781,"y":547.3200073242188,"x":-484.7099914550781}', '{"z":119.47684478759766,"y":548.5300903320313,"x":-481.2503967285156,"h":306.4339599609375}', NULL, 0),
	(37, 'Vinewood Hills 3587', 'house', 'HighEndHouse', '{"z":121.45775604248047,"y":537.3895263671875,"x":-459.1504211425781,"h":4.83178234100341}', '{"z":121.45999908447266,"y":538.4000244140625,"x":-467.5899963378906}', '{"z":120.3150863647461,"y":542.801025390625,"x":-469.8074951171875,"h":357.9757995605469}', NULL, 0),
	(38, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":125.06004333496094,"y":568.705078125,"x":-418.2966613769531,"h":154.67123413085938}', '{"z":124.5999984741211,"y":567.010009765625,"x":-407.05999755859377}', '{"z":124.15399932861328,"y":562.6309204101563,"x":-406.1848449707031,"h":153.4224395751953}', NULL, 0),
	(39, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":120.41268157958985,"y":504.3610534667969,"x":-386.79510498046877,"h":333.27734375}', '{"z":120.19999694824219,"y":513.1199951171875,"x":-397.8299865722656}', '{"z":119.84329986572266,"y":516.9520263671875,"x":-399.2094421386719,"h":357.8377990722656}', NULL, 0),
	(40, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":123.85079956054688,"y":548.3048095703125,"x":-378.0352783203125,"h":230.34490966796876}', '{"z":121.41999816894531,"y":527.3300170898438,"x":-380.5799865722656}', '{"z":120.81716918945313,"y":524.50732421875,"x":-380.2103576660156,"h":161.0746612548828}', NULL, 0),
	(41, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":128.76805114746095,"y":488.267578125,"x":-230.3320770263672,"h":8.74572277069091}', '{"z":126.43000030517578,"y":492.70001220703127,"x":-241.38999938964845}', '{"z":125.15540313720703,"y":494.65069580078127,"x":-245.8665771484375,"h":42.18659973144531}', NULL, 0),
	(42, 'Vinewood Hills 3655', 'house', 'MidTierHouse', '{"z":137.42062377929688,"y":502.70068359375,"x":-174.62835693359376,"h":85.59220886230469}', '{"z":134.77999877929688,"y":501.3999938964844,"x":-185.66000366210938}', '{"z":133.9856414794922,"y":501.5920715332031,"x":-189.6533660888672,"h":73.0036849975586}', NULL, 0),
	(43, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":143.47877502441407,"y":502.08441162109377,"x":-109.87773132324219,"h":343.81683349609377}', '{"z":143.35000610351563,"y":506.739990234375,"x":-120.68000030517578}', '{"z":142.53125,"y":509.24603271484377,"x":-124.6445541381836,"h":45.14446258544922}', NULL, 0),
	(44, 'Vinewood Hills 3659', 'house', 'MidTierHouse', '{"z":144.69032287597657,"y":490.51861572265627,"x":-66.46829223632813,"h":337.1742858886719}', '{"z":144.63999938964845,"y":491.82000732421877,"x":-72.0999984741211}', '{"z":144.09165954589845,"y":494.85906982421877,"x":-74.34037017822266,"h":341.16314697265627}', NULL, 0),
	(45, 'Vinewood Hills 3661', 'house', 'MidTierHouse', '{"z":145.8632354736328,"y":468.2079772949219,"x":-7.80351877212524,"h":331.3907470703125}', '{"z":145.44000244140626,"y":468.2900085449219,"x":-2.23000001907348}', '{"z":145.43551635742188,"y":468.3180236816406,"x":1.12851190567016,"h":40.59896850585937}', NULL, 0),
	(46, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":148.09593200683595,"y":468.72747802734377,"x":43.06358337402344,"h":166.74818420410157}', '{"z":146.92999267578126,"y":469.42999267578127,"x":52.84999847412109}', '{"z":146.3737335205078,"y":467.83819580078127,"x":55.95301055908203,"h":240.33261108398438}', NULL, 0),
	(47, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":147.03138732910157,"y":450.0095520019531,"x":57.83123779296875,"h":343.5178527832031}', '{"z":146.8000030517578,"y":453.0299987792969,"x":63.45999908447265}', '{"z":146.38531494140626,"y":456.6253356933594,"x":64.6644515991211,"h":343.7241516113281}', NULL, 0),
	(48, 'Vinewood Hills 3666', 'house', 'HighEndHouse', '{"z":148.20166015625,"y":486.1900329589844,"x":79.86883544921875,"h":207.6055450439453}', '{"z":147.9499969482422,"y":488.6199951171875,"x":85.73999786376953}', '{"z":147.8008575439453,"y":488.82623291015627,"x":91.22130584716797,"h":111.21385192871094}', NULL, 0),
	(49, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":204.51690673828126,"y":588.9895629882813,"x":-126.40572357177735,"h":10.40840816497802}', '{"z":203.89999389648438,"y":593.52001953125,"x":-139.55999755859376}', '{"z":203.263916015625,"y":596.6345825195313,"x":-145.40834045410157,"h":39.44569778442383}', NULL, 0),
	(50, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":197.8230743408203,"y":591.5560302734375,"x":-188.95718383789063,"h":265.4315185546875}', '{"z":197.6300048828125,"y":590.1300048828125,"x":-174.89999389648438}', '{"z":197.20675659179688,"y":591.0772705078125,"x":-178.2861785888672,"h":0.53850299119949}', NULL, 0),
	(51, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":199.6612091064453,"y":618.1753540039063,"x":-189.44508361816407,"h":178.87049865722657}', '{"z":197.91000366210938,"y":620.8800048828125,"x":-193.75}', '{"z":195.6473388671875,"y":612.2955932617188,"x":-199.50428771972657,"h":174.92555236816407}', NULL, 0),
	(52, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":190.53631591796876,"y":588.41748046875,"x":-232.59939575195313,"h":357.8913269042969}', '{"z":190.02000427246095,"y":589.4400024414063,"x":-228.22000122070313}', '{"z":189.892822265625,"y":592.8263549804688,"x":-223.78366088867188,"h":307.9690856933594}', NULL, 0),
	(53, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":181.57562255859376,"y":600.955810546875,"x":-293.4847106933594,"h":359.650146484375}', '{"z":181.67999267578126,"y":600.3599853515625,"x":-277.0899963378906}', '{"z":181.35711669921876,"y":602.587890625,"x":-274.2582092285156,"h":10.28161334991455}', NULL, 0),
	(54, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":176.13121032714845,"y":643.3370361328125,"x":-307.89459228515627,"h":127.80802154541016}', '{"z":175.69000244140626,"y":635.47998046875,"x":-299.5799865722656}', '{"z":175.27194213867188,"y":630.1107177734375,"x":-303.38995361328127,"h":111.338134765625}', NULL, 0),
	(55, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":172.7842254638672,"y":668.701171875,"x":-339.89178466796877,"h":260.9383544921875}', '{"z":169.25999450683595,"y":665.0499877929688,"x":-342.44000244140627}', '{"z":169.03041076660157,"y":663.5482788085938,"x":-345.1656494140625,"h":169.10304260253907}', NULL, 0),
	(56, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":163.83026123046876,"y":665.03662109375,"x":-400.08349609375,"h":0.64100456237792}', '{"z":163.0800018310547,"y":668.3900146484375,"x":-398.0799865722656}', '{"z":162.66993713378907,"y":673.334716796875,"x":-393.6924743652344,"h":298.3226318359375}', NULL, 0),
	(57, 'Vinewood Hills 3661', 'house', 'HighEndHouse', '{"z":147.37379455566407,"y":467.7676086425781,"x":107.11430358886719,"h":5.34692764282226}', '{}', '{}', NULL, 0),
	(58, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":189.9457244873047,"y":672.4967651367188,"x":232.04405212402345,"h":45.3698501586914}', '{"z":189.72000122070313,"y":679.4199829101563,"x":231.7100067138672}', '{"z":189.05770874023438,"y":680.7720947265625,"x":227.99737548828126,"h":111.80120086669922}', NULL, 0),
	(59, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":187.625,"y":620.5756225585938,"x":215.84848022460938,"h":77.4828872680664}', '{"z":187.47000122070313,"y":611.719970703125,"x":213.38999938964845}', '{"z":186.38720703125,"y":608.7314453125,"x":210.49569702148438,"h":144.77088928222657}', NULL, 0),
	(60, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":183.95948791503907,"y":566.209716796875,"x":128.2017822265625,"h":352.80078125}', '{"z":183.89999389648438,"y":565.3699951171875,"x":130.11000061035157}', '{"z":183.02798461914063,"y":567.723876953125,"x":131.18869018554688,"h":48.93721389770508}', NULL, 0),
	(61, 'Vinewood Hills 3651', 'house', 'HighEndHouse', '{"z":111.82411193847656,"y":474.9256896972656,"x":-312.0432434082031,"h":116.8899917602539}', '{"z":113.44999694824219,"y":480.1499938964844,"x":-311.80999755859377}', '{"z":112.1845932006836,"y":478.1653137207031,"x":-315.5742492675781,"h":130.95359802246095}', NULL, 0),
	(62, 'Vinewood Hills 3581', 'house', 'HighEndHouse', '{"z":116.64736938476563,"y":458.2274169921875,"x":-355.5041809082031,"h":311.6555480957031}', '{"z":112.48999786376953,"y":469.7200012207031,"x":-355.1700134277344}', '{"z":112.29483032226563,"y":475.57476806640627,"x":-351.9239196777344,"h":327.83416748046877}', NULL, 0),
	(63, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":137.97384643554688,"y":628.15771484375,"x":-522.9285278320313,"h":284.889404296875}', '{"z":137.74000549316407,"y":642.2100219726563,"x":-526.2899780273438}', '{"z":137.6140594482422,"y":645.7457275390625,"x":-524.9781494140625,"h":316.85552978515627}', NULL, 0),
	(64, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":144.3866424560547,"y":648.0258178710938,"x":-476.8226318359375,"h":15.67922782897949}', '{"z":144.19000244140626,"y":637.0399780273438,"x":-460.510009765625}', '{"z":143.6857452392578,"y":642.8452758789063,"x":-463.6016845703125,"h":45.29421997070312}', NULL, 0),
	(65, 'Vinewood Hills 4585', 'house', 'MidTierHouse', '{"z":153.04966735839845,"y":709.0202026367188,"x":-533.34912109375,"h":190.62185668945313}', '{"z":153.3300018310547,"y":712.0800170898438,"x":-526.0}', '{"z":151.8572998046875,"y":710.8991088867188,"x":-521.8511352539063,"h":143.94137573242188}', NULL, 0),
	(66, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":163.03097534179688,"y":738.6018676757813,"x":-495.5677795410156,"h":339.3555908203125}', '{"z":162.8300018310547,"y":751.3699951171875,"x":-491.3699951171875}', '{"z":162.328125,"y":749.9617309570313,"x":-493.01446533203127,"h":242.28256225585938}', NULL, 0),
	(67, 'Vinewood Hills 4587', 'house', 'MidTierHouse', '{"z":184.34225463867188,"y":796.0052490234375,"x":-494.1968078613281,"h":59.77312850952148}', '{"z":180.5399932861328,"y":796.0999755859375,"x":-489.17999267578127}', '{"z":180.32723999023438,"y":798.4463500976563,"x":-483.50335693359377,"h":300.612060546875}', NULL, 0),
	(68, 'Vinewood Hills 4589', 'house', 'MidTierHouse', '{"z":211.45388793945313,"y":851.6234741210938,"x":-597.0947875976563,"h":42.68436050415039}', '{"z":213.1199951171875,"y":861.6699829101563,"x":-606.72998046875}', '{"z":213.043701171875,"y":866.6630249023438,"x":-609.3010864257813,"h":341.7922058105469}', NULL, 0),
	(69, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":229.24916076660157,"y":886.7740478515625,"x":-658.5360107421875,"h":5.12790012359619}', '{"z":230.25,"y":905.6599731445313,"x":-668.8300170898438}', '{"z":229.64390563964845,"y":909.1073608398438,"x":-669.7658081054688,"h":313.6775207519531}', NULL, 0),
	(70, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":215.03025817871095,"y":808.3043212890625,"x":-747.1924438476563,"h":294.67913818359377}', '{"z":213.4499969482422,"y":821.4000244140625,"x":-750.9500122070313}', '{"z":212.8697052001953,"y":818.8294677734375,"x":-748.564697265625,"h":223.34007263183595}', NULL, 0),
	(71, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":198.99119567871095,"y":803.2949829101563,"x":-655.216064453125,"h":3.61312985420227}', '{"z":198.99000549316407,"y":803.1699829101563,"x":-658.719970703125}', '{"z":198.9322052001953,"y":811.9794311523438,"x":-659.6381225585938,"h":302.66131591796877}', NULL, 0),
	(72, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":191.5249786376953,"y":807.6312255859375,"x":-599.8582763671875,"h":189.291748046875}', '{"z":190.7899932861328,"y":808.719970703125,"x":-591.1400146484375}', '{"z":190.35572814941407,"y":806.516357421875,"x":-595.6296997070313,"h":153.92762756347657}', NULL, 0),
	(73, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":189.11053466796876,"y":780.7254028320313,"x":-595.6527709960938,"h":299.1868591308594}', '{"z":188.57000732421876,"y":784.22998046875,"x":-595.1900024414063}', '{"z":187.8938751220703,"y":782.4580078125,"x":-589.67236328125,"h":302.2381591796875}', NULL, 0),
	(74, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":162.209716796875,"y":712.652099609375,"x":-708.914306640625,"h":290.370361328125}', '{"z":158.0,"y":706.5900268554688,"x":-699.469970703125}', '{"z":156.8950653076172,"y":706.0005493164063,"x":-696.4105834960938,"h":263.2815246582031}', NULL, 0),
	(75, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":155.17523193359376,"y":647.641845703125,"x":-700.7185668945313,"h":4.35675287246704}', '{"z":155.17999267578126,"y":647.989990234375,"x":-706.6699829101563}', '{"z":154.6751251220703,"y":656.3225708007813,"x":-712.0446166992188,"h":336.53765869140627}', NULL, 0),
	(76, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":143.64202880859376,"y":596.4752807617188,"x":-686.1856079101563,"h":42.25830078125}', '{"z":143.69000244140626,"y":599.530029296875,"x":-684.9500122070313}', '{"z":143.1036376953125,"y":603.6033935546875,"x":-683.822265625,"h":102.03397369384766}', NULL, 0),
	(77, 'Vinewood Hills 2864', 'house', 'MidTierHouse', '{"z":141.93048095703126,"y":589.0186767578125,"x":-704.1815795898438,"h":359.5744934082031}', '{"z":141.8800048828125,"y":589.8200073242188,"x":-719.52001953125}', '{"z":141.3277587890625,"y":592.2261352539063,"x":-722.3330688476563,"h":60.94639587402344}', NULL, 0),
	(78, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":142.16055297851563,"y":594.0266723632813,"x":-732.75390625,"h":327.04193115234377}', '{"z":142.42999267578126,"y":602.0599975585938,"x":-746.5}', '{"z":141.4617462158203,"y":602.9434204101563,"x":-742.3720703125,"h":10.09961223602295}', NULL, 0),
	(79, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":142.85003662109376,"y":620.2849731445313,"x":-753.4515380859375,"h":287.7265319824219}', '{"z":142.77000427246095,"y":623.3099975585938,"x":-754.0900268554688}', '{"z":142.03411865234376,"y":627.6134033203125,"x":-753.0994873046875,"h":352.5406494140625}', NULL, 0),
	(80, 'Vinewood Hills 2870', 'house', 'MidTierHouse', '{"z":145.69744873046876,"y":650.4619140625,"x":-765.7537231445313,"h":296.11175537109377}', '{"z":145.5,"y":661.3699951171875,"x":-768.4400024414063}', '{"z":143.32896423339845,"y":667.4559936523438,"x":-762.7510986328125,"h":257.5060119628906}', NULL, 0),
	(81, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":148.10964965820313,"y":696.6828002929688,"x":-819.4202270507813,"h":23.00586128234863}', '{"z":147.1999969482422,"y":699.8599853515625,"x":-809.760009765625}', '{"z":146.529052734375,"y":704.5653076171875,"x":-806.8367309570313,"h":20.01300811767578}', NULL, 0),
	(82, 'Vinewood Hills 2874', 'house', 'MidTierHouse', '{"z":148.78749084472657,"y":695.6946411132813,"x":-852.9891357421875,"h":2.59911203384399}', '{"z":148.99000549316407,"y":695.6900024414063,"x":-861.6900024414063}', '{"z":148.53500366210938,"y":699.3119506835938,"x":-863.6773681640625,"h":308.9383239746094}', NULL, 0),
	(83, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":151.27102661132813,"y":699.4579467773438,"x":-884.84423828125,"h":91.47652435302735}', '{}', '{}', NULL, 0),
	(84, 'Vinewood Hills 2878', 'house', 'MidTierHouse', '{"z":151.4355010986328,"y":693.7802124023438,"x":-908.706787109375,"h":356.5345153808594}', '{"z":151.42999267578126,"y":694.0900268554688,"x":-911.8900146484375}', '{"z":150.93824768066407,"y":696.3919677734375,"x":-913.8741455078125,"h":299.00274658203127}', NULL, 0),
	(85, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":153.46669006347657,"y":691.2679443359375,"x":-931.5460815429688,"h":357.6163635253906}', '{"z":153.5800018310547,"y":682.9500122070313,"x":-951.280029296875}', '{"z":153.07537841796876,"y":688.7467651367188,"x":-951.983642578125,"h":2.70963811874389}', NULL, 0),
	(86, 'Vinewood Hills 2888', 'house', 'MidTierHouse', '{"z":167.31649780273438,"y":761.4634399414063,"x":-1056.060791015625,"h":274.78131103515627}', '{"z":167.75,"y":764.7100219726563,"x":-1055.8900146484376}', '{"z":167.08511352539063,"y":771.4337158203125,"x":-1052.7225341796876,"h":281.05621337890627}', NULL, 0),
	(87, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":173.04983520507813,"y":816.69140625,"x":-999.3283081054688,"h":223.0433807373047}', '{"z":172.3699951171875,"y":817.7100219726563,"x":-1018.8800048828125}', '{"z":171.4612579345703,"y":810.5211181640625,"x":-1022.7098999023438,"h":193.72018432617188}', NULL, 0),
	(88, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":167.25628662109376,"y":797.6550903320313,"x":-1100.6512451171876,"h":188.42929077148438}', '{"z":165.5,"y":799.4299926757813,"x":-1104.949951171875}', '{"z":164.5665740966797,"y":794.0767822265625,"x":-1107.324462890625,"h":182.5882568359375}', NULL, 0),
	(89, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":155.60675048828126,"y":726.79931640625,"x":-1165.60595703125,"h":320.07489013671877}', '{"z":155.5,"y":735.72998046875,"x":-1159.8800048828126}', '{"z":154.90066528320313,"y":742.8958129882813,"x":-1158.7442626953126,"h":351.7752685546875}', NULL, 0),
	(90, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":147.4234161376953,"y":693.4228515625,"x":-1197.0078125,"h":60.65163803100586}', '{"z":147.35000610351563,"y":688.8099975585938,"x":-1199.3699951171876}', '{"z":146.35568237304688,"y":688.6353149414063,"x":-1202.187255859375,"h":117.24707794189453}', NULL, 0),
	(91, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":144.53399658203126,"y":665.4270629882813,"x":-1218.738525390625,"h":43.77450561523437}', '{"z":144.3800048828125,"y":663.52001953125,"x":-1220.5799560546876}', '{"z":143.35403442382813,"y":663.2596435546875,"x":-1223.5916748046876,"h":85.94404602050781}', NULL, 0),
	(92, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":142.81259155273438,"y":674.1940307617188,"x":-1241.4114990234376,"h":177.20718383789063}', '{"z":142.82000732421876,"y":666.8400268554688,"x":-1254.949951171875}', '{"z":142.1800079345703,"y":664.323974609375,"x":-1249.023681640625,"h":225.07797241210938}', NULL, 0),
	(93, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":141.50140380859376,"y":650.0518188476563,"x":-1291.793701171875,"h":195.08702087402345}', '{"z":139.9499969482422,"y":653.1300048828125,"x":-1286.0699462890626}', '{"z":139.27308654785157,"y":648.7283325195313,"x":-1285.8291015625,"h":200.0537872314453}', NULL, 0),
	(94, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":143.1870880126953,"y":630.0101928710938,"x":-1277.552001953125,"h":121.2787857055664}', '{"z":139.22999572753907,"y":625.4500122070313,"x":-1282.800048828125}', '{"z":138.29515075683595,"y":626.3050537109375,"x":-1287.716796875,"h":41.56099700927734}', NULL, 0),
	(95, 'Vinewood Hills 2117', 'house', 'HighEndHouse', '{"z":88.28108215332031,"y":457.0746154785156,"x":-866.5945434570313,"h":191.5210723876953}', '{"z":88.19999694824219,"y":459.79998779296877,"x":-863.7000122070313}', '{"z":87.3110580444336,"y":463.5835266113281,"x":-861.1791381835938,"h":276.91204833984377}', NULL, 0),
	(96, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":87.59687042236328,"y":466.8159484863281,"x":-842.864990234375,"h":95.96250915527344}', '{"z":88.02999877929688,"y":463.0199890136719,"x":-842.9299926757813}', '{"z":87.19110107421875,"y":459.9128723144531,"x":-846.1090698242188,"h":95.07601928710938}', NULL, 0),
	(97, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":90.8170394897461,"y":508.69268798828127,"x":-848.5433349609375,"h":12.87237739562988}', '{"z":90.62000274658203,"y":521.9000244140625,"x":-850.5900268554688}', '{"z":90.19901275634766,"y":520.7938842773438,"x":-845.5105590820313,"h":104.18309020996094}', NULL, 0),
	(98, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":92.44284057617188,"y":518.0487670898438,"x":-884.2854614257813,"h":287.3041687011719}', '{"z":91.01000213623047,"y":501.20001220703127,"x":-877.3200073242188}', '{"z":89.46944427490235,"y":500.01690673828127,"x":-871.1494750976563,"h":277.2984619140625}', NULL, 0),
	(99, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":96.61945343017578,"y":562.6541137695313,"x":-873.5067138671875,"h":128.35154724121095}', '{"z":92.55999755859375,"y":544.6400146484375,"x":-873.75}', '{"z":91.65591430664063,"y":540.7569580078125,"x":-873.7597045898438,"h":80.58822631835938}', NULL, 0),
	(100, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":100.20511627197266,"y":545.3629760742188,"x":-907.2726440429688,"h":311.9051208496094}', '{"z":95.66000366210938,"y":550.260009765625,"x":-910.0}', '{"z":95.8364028930664,"y":554.1357421875,"x":-909.6098022460938,"h":312.60552978515627}', NULL, 0),
	(101, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":101.1907958984375,"y":588.097900390625,"x":-904.609375,"h":156.5037384033203}', '{"z":101.0,"y":589.25,"x":-907.7100219726563}', '{"z":100.5002212524414,"y":587.4989013671875,"x":-912.5993041992188,"h":148.3674774169922}', NULL, 0),
	(102, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":99.90556335449219,"y":561.9064331054688,"x":-924.4780883789063,"h":330.0459289550781}', '{"z":100.1500015258789,"y":566.77001953125,"x":-932.2000122070313}', '{"z":99.46568298339844,"y":569.9195556640625,"x":-933.019775390625,"h":288.8238220214844}', NULL, 0),
	(103, 'Vinewood Hills 2140', 'house', 'HighEndHouse', '{"z":106.29905700683594,"y":607.0507202148438,"x":-958.2511596679688,"h":157.5397186279297}', '{"z":101.0,"y":597.4000244140625,"x":-942.8099975585938}', '{"z":100.583251953125,"y":593.9080200195313,"x":-941.3612060546875,"h":164.04443359375}', NULL, 0),
	(104, 'Vinewood Hills 2141', 'house', 'MidTierHouse', '{"z":101.49585723876953,"y":567.9280395507813,"x":-947.7191162109375,"h":294.48858642578127}', '{"z":101.23999786376953,"y":575.9600219726563,"x":-954.8499755859375}', '{"z":100.56985473632813,"y":579.947998046875,"x":-954.8192138671875,"h":277.4819030761719}', NULL, 0),
	(105, 'Vinewood Hills 2139', 'house', 'MidTierHouse', '{"z":103.14936065673828,"y":581.8231201171875,"x":-974.4014892578125,"h":349.68646240234377}', '{"z":102.43000030517578,"y":583.8699951171875,"x":-983.9199829101563}', '{"z":101.89521026611328,"y":586.5089111328125,"x":-986.5538330078125,"h":346.22259521484377}', NULL, 0),
	(106, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":103.42910766601563,"y":586.9097290039063,"x":-1022.6172485351563,"h":0.6752061843872}', '{"z":103.41000366210938,"y":588.489990234375,"x":-1033.780029296875}', '{"z":102.81794738769531,"y":590.3495483398438,"x":-1036.6024169921876,"h":4.8596863746643}', NULL, 0),
	(107, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":104.45465087890625,"y":594.1712036132813,"x":-1107.6539306640626,"h":209.42413330078126}', '{"z":103.05999755859375,"y":601.0399780273438,"x":-1099.1500244140626}', '{"z":102.64278411865235,"y":598.81103515625,"x":-1095.6473388671876,"h":208.39305114746095}', NULL, 0),
	(108, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":103.63337707519531,"y":548.3685302734375,"x":-1090.220703125,"h":117.03562927246094}', '{"z":102.68000030517578,"y":549.6900024414063,"x":-1102.449951171875}', '{"z":102.19348907470703,"y":550.4656372070313,"x":-1105.957275390625,"h":28.83890533447265}', NULL, 0),
	(109, 'Vinewood Hills', 'house', 'MidTierHouse', '{"z":102.57243347167969,"y":548.5076293945313,"x":-1125.396240234375,"h":15.68816375732421}', '{"z":102.5,"y":548.8599853515625,"x":-1130.8399658203126}', '{"z":101.63323974609375,"y":550.5538940429688,"x":-1134.4610595703126,"h":15.82338905334472}', NULL, 0),
	(110, 'Vinewood Hills 2130', 'house', 'MidTierHouse', '{"z":100.33943939208985,"y":563.882568359375,"x":-1193.0806884765626,"h":186.0301513671875}', '{"z":100.05999755859375,"y":560.8300170898438,"x":-1207.02001953125}', '{"z":98.95537567138672,"y":557.5271606445313,"x":-1208.7305908203126,"h":187.834228515625}', NULL, 0),
	(111, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":95.85784912109375,"y":506.6513366699219,"x":-1217.8099365234376,"h":176.28294372558595}', '{"z":93.26000213623047,"y":492.8299865722656,"x":-1233.6800537109376}', '{"z":92.6242446899414,"y":484.1591796875,"x":-1239.8802490234376,"h":170.18218994140626}', NULL, 0),
	(112, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":130.2090301513672,"y":642.6749267578125,"x":-1896.27880859375,"h":136.03713989257813}', '{"z":130.0,"y":631.0900268554688,"x":-1887.4200439453126}', '{"z":129.57968139648438,"y":624.3355712890625,"x":-1887.4068603515626,"h":138.7244873046875}', NULL, 0),
	(113, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":122.53632354736328,"y":630.7896118164063,"x":-1974.285400390625,"h":246.62167358398438}', '{"z":122.54000091552735,"y":627.4299926757813,"x":-1976.22998046875}', '{"z":121.14989471435547,"y":620.1986694335938,"x":-1967.763916015625,"h":209.865478515625}', NULL, 0),
	(114, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":122.2848892211914,"y":595.4198608398438,"x":-1929.16015625,"h":71.6827621459961}', '{"z":119.60961151123047,"y":583.0812377929688,"x":-1935.3758544921876}', '{"z":118.18846893310547,"y":584.3822021484375,"x":-1946.369140625,"h":78.7241439819336}', NULL, 0),
	(115, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":117.90339660644531,"y":591.0855712890625,"x":-1995.4644775390626,"h":265.6559143066406}', '{"z":117.9000015258789,"y":602.3800048828125,"x":-1992.8599853515626}', '{"z":117.51199340820313,"y":606.2167358398438,"x":-1988.4603271484376,"h":259.29388427734377}', NULL, 0),
	(116, 'Vinewood Hills', 'house', 'HighEndHouse', '{"z":114.82850646972656,"y":551.2427978515625,"x":-1937.841796875,"h":70.32351684570313}', '{"z":114.83000183105469,"y":555.0599975585938,"x":-1938.56005859375}', '{"z":114.74412536621094,"y":560.8661499023438,"x":-1940.187744140625,"h":55.95174407958984}', NULL, 0),
	(117, 'Banham Canyon', 'house', 'MidTierHouse', '{"z":107.17178344726563,"y":499.6259765625,"x":-2014.627197265625,"h":255.70758056640626}', '{"z":107.16999816894531,"y":489.95001220703127,"x":-2014.93994140625}', '{"z":106.54067993164063,"y":482.1314392089844,"x":-2012.2801513671876,"h":263.64508056640627}', NULL, 0),
	(118, 'Pacific Bluffs', 'house', 'HighEndHouse', '{"z":103.01590728759766,"y":445.06207275390627,"x":-2011.0640869140626,"h":287.1094970703125}', '{"z":102.68000030517578,"y":451.3500061035156,"x":-2011.8399658203126}', '{"z":102.23957824707031,"y":454.4834899902344,"x":-2009.845947265625,"h":279.6809997558594}', NULL, 0),
	(120, 'Richman', 'house', 'HighEndHouse', '{"z":96.5078353881836,"y":387.4611511230469,"x":-1940.7066650390626,"h":188.98190307617188}', '{"z":96.51000213623047,"y":385.0199890136719,"x":-1938.6099853515626}', '{"z":96.08573150634766,"y":385.505859375,"x":-1941.4698486328126,"h":100.6134033203125}', NULL, 0),
	(121, 'Pacific Bluffs', 'house', 'HighEndHouse', '{"z":94.8144302368164,"y":367.40765380859377,"x":-2008.9393310546876,"h":266.26239013671877}', '{"z":94.4800033569336,"y":382.05999755859377,"x":-2003.949951171875}', '{"z":94.062255859375,"y":378.1319885253906,"x":-2001.0267333984376,"h":182.42645263671876}', NULL, 0),
	(122, 'Richman', 'house', 'HighEndHouse', '{"z":89.11470794677735,"y":310.5067138671875,"x":-1861.14306640625,"h":106.83516693115235}', '{"z":88.72000122070313,"y":321.989990234375,"x":-1859.9200439453126}', '{"z":88.26782989501953,"y":325.7066955566406,"x":-1857.9412841796876,"h":14.0647554397583}', NULL, 0),
	(123, 'Richman', 'house', 'HighEndHouse', '{"z":89.5672607421875,"y":333.18218994140627,"x":-1807.9136962890626,"h":25.94384002685547}', '{"z":88.55000305175781,"y":343.1700134277344,"x":-1791.1700439453126}', '{"z":88.13374328613281,"y":347.0701904296875,"x":-1792.5447998046876,"h":65.2410659790039}', NULL, 0),
	(124, 'Richman', 'house', 'HighEndHouse', '{"z":89.72516632080078,"y":379.2779846191406,"x":-1733.17919921875,"h":34.12229537963867}', '{"z":89.7300033569336,"y":369.4469909667969,"x":-1746.8900146484376}', '{"z":89.29949188232422,"y":366.5640869140625,"x":-1749.223876953125,"h":118.8613052368164}', NULL, 0),
	(125, 'Richman', 'house', 'HighEndHouse', '{"z":89.34829711914063,"y":385.89031982421877,"x":-1672.999755859375,"h":352.4485778808594}', '{"z":89.44000244140625,"y":385.4800109863281,"x":-1662.6600341796876}', '{"z":88.8737564086914,"y":388.7537536621094,"x":-1665.040771484375,"h":7.40593433380126}', NULL, 0),
	(126, 'Richman', 'house', 'HighEndHouse', '{"z":91.96465301513672,"y":300.68603515625,"x":-1995.4373779296876,"h":201.7718505859375}', '{"z":91.76000213623047,"y":291.54998779296877,"x":-1998.2099609375}', '{"z":91.3433609008789,"y":295.03057861328127,"x":-1996.463134765625,"h":240.16607666015626}', NULL, 0),
	(127, 'Richman', 'house', 'HighEndHouse', '{"z":89.28721618652344,"y":298.333740234375,"x":-1922.65087890625,"h":100.27232360839844}', '{"z":89.06999969482422,"y":287.8900146484375,"x":-1920.4300537109376}', '{"z":88.65155029296875,"y":283.71160888671877,"x":-1921.0272216796876,"h":150.92372131347657}', NULL, 0),
	(128, 'Richman', 'house', 'HighEndHouse', '{"z":87.81212615966797,"y":246.12942504882813,"x":-1970.3382568359376,"h":309.9149475097656}', '{"z":87.22000122070313,"y":255.89999389648438,"x":-1980.4300537109376}', '{"z":86.7927474975586,"y":259.43218994140627,"x":-1980.26708984375,"h":289.7918701171875}', NULL, 0),
	(129, 'Richman', 'house', 'HighEndHouse', '{"z":86.80287170410156,"y":211.8539276123047,"x":-1961.096435546875,"h":299.1628112792969}', '{"z":86.41999816894531,"y":202.9199981689453,"x":-1953.050048828125}', '{"z":85.67898559570313,"y":201.5238800048828,"x":-1949.1351318359376,"h":287.76531982421877}', NULL, 0),
	(130, 'Richman', 'house', 'HighEndHouse', '{"z":86.45288848876953,"y":252.85443115234376,"x":-1905.72412109375,"h":125.58631134033203}', '{"z":86.25,"y":242.69000244140626,"x":-1900.5899658203126}', '{"z":85.82991027832031,"y":237.58529663085938,"x":-1899.9774169921876,"h":114.90129089355469}', NULL, 0),
	(131, 'Richman', 'house', 'MidTierHouse', '{"z":84.65274047851563,"y":162.71925354003907,"x":-1931.73779296875,"h":287.416259765625}', '{"z":84.6500015258789,"y":176.36000061035157,"x":-1937.5999755859376}', '{"z":84.21104431152344,"y":181.67877197265626,"x":-1937.4283447265626,"h":310.0942077636719}', NULL, 0),
	(132, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":54.82489013671875,"y":-1604.4053955078126,"x":1286.61328125,"h":19.91433143615722}', '{}', '{}', NULL, 0),
	(133, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":53.76609802246094,"y":-1591.0621337890626,"x":1230.598388671875,"h":216.4945831298828}', '{"z":52.11000061035156,"y":-1600.6600341796876,"x":1226.93994140625}', '{"z":51.37370300292969,"y":-1604.4183349609376,"x":1226.91455078125,"h":209.66549682617188}', NULL, 0),
	(134, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":53.28230667114258,"y":-1626.7275390625,"x":1245.399169921875,"h":28.42891311645507}', '{"z":51.9900016784668,"y":-1632.06005859375,"x":1236.25}', '{"z":51.40226364135742,"y":-1629.2457275390626,"x":1235.745361328125,"h":31.85044479370117}', NULL, 0),
	(135, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":50.73651123046875,"y":-1606.671875,"x":1210.334228515625,"h":208.8142547607422}', '{}', '{}', NULL, 0),
	(136, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":48.64599609375,"y":-1644.2056884765626,"x":1214.40576171875,"h":33.13109970092773}', '{}', '{}', NULL, 0),
	(137, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":45.2214469909668,"y":-1622.31591796875,"x":1193.4368896484376,"h":125.2806625366211}', '{}', '{}', NULL, 0),
	(138, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":43.02640533447265,"y":-1656.4188232421876,"x":1193.54638671875,"h":30.48399353027343}', '{}', '{}', NULL, 0),
	(139, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":60.49118423461914,"y":-1690.64501953125,"x":1354.8349609375,"h":264.2290344238281}', '{}', '{}', NULL, 0),
	(140, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":65.63410186767578,"y":-1721.416748046875,"x":1365.4884033203126,"h":13.31084251403808}', '{}', '{}', NULL, 0),
	(141, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":58.22527313232422,"y":-1698.84716796875,"x":1316.9342041015626,"h":188.52821350097657}', '{}', '{}', NULL, 0),
	(142, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":54.70003509521484,"y":-1733.063232421875,"x":1314.510009765625,"h":294.3609313964844}', '{}', '{}', NULL, 0),
	(143, 'El Burro Heights', 'house', 'MidTierHouse', '{"z":55.47491836547851,"y":-1710.7877197265626,"x":1289.276123046875,"h":203.06790161132813}', '{"z":55.13000106811523,"y":-1699.4599609375,"x":1301.7900390625}', '{"z":54.69834899902344,"y":-1704.810791015625,"x":1301.520263671875,"h":199.02020263671876}', NULL, 0),
	(144, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":54.27178955078125,"y":-1739.7996826171876,"x":1294.9986572265626,"h":295.3100891113281}', '{}', '{}', NULL, 0),
	(145, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":49.65826797485351,"y":-1761.644287109375,"x":1259.13623046875,"h":22.4341869354248}', '{}', '{}', NULL, 0),
	(146, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":52.03196716308594,"y":-1734.360595703125,"x":1250.7862548828126,"h":208.4020538330078}', '{}', '{}', NULL, 0),
	(147, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":51.80760955810547,"y":-1526.580810546875,"x":1315.768310546875,"h":193.80841064453126}', '{}', '{}', NULL, 0),
	(148, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":54.05154037475586,"y":-1553.0438232421876,"x":1327.4493408203126,"h":49.85231018066406}', '{"z":53.31000137329101,"y":-1551.5899658203126,"x":1337.6400146484376}', '{"z":52.3019790649414,"y":-1548.371826171875,"x":1336.085693359375,"h":43.25474166870117}', NULL, 0),
	(149, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":54.58156585693359,"y":-1524.2496337890626,"x":1338.2021484375,"h":160.32200622558595}', '{}', '{}', NULL, 0),
	(150, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":56.3426284790039,"y":-1556.201416015625,"x":1360.6536865234376,"h":11.80193901062011}', '{}', '{}', NULL, 0),
	(151, 'El Burro Heights', 'house', 'LowTierHouse', '{"z":58.43571472167969,"y":-1514.86279296875,"x":1379.0386962890626,"h":210.75796508789063}', '{}', '{}', NULL, 0),
	(152, 'Grove St', 'house', 'LowTierHouse', '{"z":26.19351768493652,"y":-1847.2677001953126,"x":-34.03563690185547,"h":215.6648712158203}', '{"z":25.93000030517578,"y":-1853.510009765625,"x":-31.86000061035156}', '{"z":25.31134033203125,"y":-1853.782958984375,"x":-29.7868423461914,"h":321.483642578125}', NULL, 0),
	(153, 'Grove St', 'house', 'LowTierHouse', '{"z":25.40867233276367,"y":-1858.7166748046876,"x":-20.66693687438965,"h":35.48291397094726}', '{"z":25.01000022888183,"y":-1853.8699951171876,"x":-26.43000030517578}', '{"z":24.65997505187988,"y":-1852.4320068359376,"x":-22.40226745605468,"h":319.6583251953125}', NULL, 0),
	(154, 'Grove St', 'house', 'LowTierHouse', '{"z":24.60173416137695,"y":-1844.418701171875,"x":21.01337814331054,"h":51.06908416748047}', '{"z":24.52000045776367,"y":-1842.2900390625,"x":10.03999996185302}', '{"z":23.91640281677246,"y":-1845.7950439453126,"x":10.21389579772949,"h":139.32449340820313}', NULL, 0),
	(155, 'Grove St', 'house', 'LowTierHouse', '{"z":24.15101623535156,"y":-1872.109375,"x":-4.89317226409912,"h":42.95938110351562}', '{"z":23.82999992370605,"y":-1879.1400146484376,"x":-5.53000020980835}', '{"z":23.2237606048584,"y":-1882.100830078125,"x":-3.17619752883911,"h":317.36676025390627}', NULL, 0),
	(156, 'Grove St', 'house', 'LowTierHouse', '{"z":23.69726753234863,"y":-1884.2237548828126,"x":5.05426836013793,"h":47.0819206237793}', '{"z":23.21999931335449,"y":-1885.3199462890626,"x":12.75}', '{"z":22.73039245605468,"y":-1883.2550048828126,"x":14.80654716491699,"h":321.8065185546875}', NULL, 0),
	(157, 'Grove St', 'house', 'LowTierHouse', '{"z":23.27830123901367,"y":-1864.2603759765626,"x":45.98279571533203,"h":134.1800994873047}', '{"z":22.82999992370605,"y":-1851.1800537109376,"x":46.20999908447265}', '{"z":22.41028213500976,"y":-1851.7877197265626,"x":43.17029571533203,"h":135.27975463867188}', NULL, 0),
	(158, 'Grove St', 'house', 'LowTierHouse', '{"z":22.96587753295898,"y":-1896.662353515625,"x":23.28914451599121,"h":317.3734130859375}', '{"z":22.2800006866455,"y":-1894.8800048828126,"x":31.61000061035156}', '{"z":21.77918624877929,"y":-1893.064453125,"x":34.00611114501953,"h":324.8353271484375}', NULL, 0),
	(159, 'Grove St', 'house', 'LowTierHouse', '{"z":21.9534969329834,"y":-1911.737548828125,"x":39.17494583129883,"h":230.4430389404297}', '{"z":21.79000091552734,"y":-1924.719970703125,"x":36.45000076293945}', '{"z":21.26265144348144,"y":-1923.626220703125,"x":39.66069412231445,"h":321.0577087402344}', NULL, 0),
	(160, 'Grove St', 'house', 'LowTierHouse', '{"z":21.91106605529785,"y":-1922.634033203125,"x":56.71088409423828,"h":325.2152099609375}', '{"z":21.46999931335449,"y":-1921.8699951171876,"x":64.66000366210938}', '{"z":20.87320518493652,"y":-1921.173095703125,"x":68.45836639404297,"h":318.908935546875}', NULL, 0),
	(161, 'Grove St', 'house', 'LowTierHouse', '{"z":21.36911964416504,"y":-1938.99853515625,"x":72.29421997070313,"h":311.2370300292969}', '{}', '{}', NULL, 0),
	(162, 'Grove St', 'house', 'LowTierHouse', '{"z":21.17413330078125,"y":-1948.2615966796876,"x":76.2444076538086,"h":226.14768981933595}', '{}', '{}', NULL, 0),
	(163, 'Grove St', 'house', 'LowTierHouse', '{"z":21.12167358398437,"y":-1959.4940185546876,"x":85.89409637451172,"h":45.80747985839844}', '{}', '{}', NULL, 0),
	(164, 'Grove St', 'house', 'LowTierHouse', '{"z":21.33417510986328,"y":-1961.010009765625,"x":114.35620880126953,"h":26.43036842346191}', '{}', '{}', NULL, 0),
	(165, 'Grove St', 'house', 'LowTierHouse', '{"z":21.38241577148437,"y":-1929.8228759765626,"x":126.8143310546875,"h":25.87756538391113}', '{}', '{}', NULL, 0),
	(166, 'Grove St', 'house', 'LowTierHouse', '{"z":21.32342529296875,"y":-1920.9901123046876,"x":118.23268127441406,"h":44.94057464599609}', '{}', '{}', NULL, 0),
	(167, 'Grove St', 'house', 'LowTierHouse', '{"z":21.40742301940918,"y":-1912.2362060546876,"x":100.98261260986328,"h":152.20318603515626}', '{}', '{}', NULL, 0),
	(168, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":24.31877708435058,"y":-1885.3551025390626,"x":103.94599151611328,"h":326.98065185546877}', '{}', '{}', NULL, 0),
	(169, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":23.92822647094726,"y":-1887.8868408203126,"x":115.36309814453125,"h":57.1137466430664}', '{}', '{}', NULL, 0),
	(170, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":23.6741943359375,"y":-1896.9144287109376,"x":127.86907958984375,"h":70.01441955566406}', '{}', '{}', NULL, 0),
	(171, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":23.53166389465332,"y":-1904.412109375,"x":148.8683624267578,"h":332.807861328125}', '{}', '{}', NULL, 0),
	(172, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":25.23478507995605,"y":-1853.3743896484376,"x":130.433349609375,"h":150.67715454101563}', '{}', '{}', NULL, 0),
	(173, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":24.59133148193359,"y":-1864.73583984375,"x":150.00303649902345,"h":159.65516662597657}', '{}', '{}', NULL, 0),
	(174, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":24.40022468566894,"y":-1871.42724609375,"x":171.49269104003907,"h":66.13739013671875}', '{}', '{}', NULL, 0),
	(175, 'Covenant Ave', 'house', 'LowTierHouse', '{"z":25.05675506591797,"y":-1883.214599609375,"x":192.24940490722657,"h":150.63162231445313}', '{}', '{}', NULL, 0),
	(176, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.66316413879394,"y":-1670.88427734375,"x":252.8459930419922,"h":145.34738159179688}', '{}', '{}', NULL, 0),
	(177, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.69961357116699,"y":-1687.8841552734376,"x":240.7113800048828,"h":232.43984985351563}', '{}', '{}', NULL, 0),
	(178, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.69480895996093,"y":-1702.8446044921876,"x":222.8008270263672,"h":216.3441162109375}', '{}', '{}', NULL, 0),
	(179, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.67777824401855,"y":-1717.6793212890626,"x":216.67367553710938,"h":309.4984436035156}', '{}', '{}', NULL, 0),
	(180, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.66364097595215,"y":-1725.775146484375,"x":197.8286895751953,"h":313.64288330078127}', '{}', '{}', NULL, 0),
	(181, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.66879844665527,"y":-1730.6229248046876,"x":250.2527618408203,"h":53.4530029296875}', '{}', '{}', NULL, 0),
	(182, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.65412712097168,"y":-1722.701416015625,"x":257.5016784667969,"h":143.30477905273438}', '{}', '{}', NULL, 0),
	(183, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.66879844665527,"y":-1712.7335205078126,"x":269.65386962890627,"h":125.54312896728516}', '{}', '{}', NULL, 0),
	(184, 'Brouge Ave', 'house', 'LowTierHouse', '{"z":29.64791107177734,"y":-1694.8441162109376,"x":282.076416015625,"h":47.61360931396484}', '{}', '{}', NULL, 0),
	(185, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":29.73052406311035,"y":-1740.93408203125,"x":332.9872741699219,"h":136.69189453125}', '{}', '{}', NULL, 0),
	(186, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":29.63790321350097,"y":-1759.8359375,"x":320.5990295410156,"h":237.2515869140625}', '{}', '{}', NULL, 0),
	(187, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":29.10107803344726,"y":-1775.6004638671876,"x":304.5207824707031,"h":218.9559326171875}', '{}', '{}', NULL, 0),
	(188, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":28.43865776062011,"y":-1783.7691650390626,"x":300.15203857421877,"h":139.6058807373047}', '{}', '{}', NULL, 0),
	(189, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":28.08905982971191,"y":-1792.5743408203126,"x":288.7334899902344,"h":310.154052734375}', '{}', '{}', NULL, 0),
	(190, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":27.51093864440918,"y":-1853.9154052734376,"x":320.3028259277344,"h":49.17214584350586}', '{}', '{}', NULL, 0),
	(191, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":27.74809837341308,"y":-1845.7034912109376,"x":329.1720886230469,"h":31.93804550170898}', '{}', '{}', NULL, 0),
	(192, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":28.89409446716308,"y":-1820.9500732421876,"x":348.8236083984375,"h":318.5861511230469}', '{}', '{}', NULL, 0),
	(193, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":29.71032905578613,"y":-1751.321044921875,"x":405.7392883300781,"h":137.33497619628907}', '{}', '{}', NULL, 0),
	(194, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":29.60769844055175,"y":-1735.5234375,"x":419.09197998046877,"h":138.6533966064453}', '{}', '{}', NULL, 0),
	(195, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":29.60146522521972,"y":-1725.4888916015626,"x":431.12603759765627,"h":130.66041564941407}', '{}', '{}', NULL, 0),
	(196, 'Roy Lowenstein Blvd', 'house', 'LowTierHouse', '{"z":29.70932006835937,"y":-1707.4189453125,"x":443.39678955078127,"h":51.67283630371094}', '{}', '{}', NULL, 0),
	(197, 'Jamestown St', 'house', 'LowTierHouse', '{"z":29.78924369812011,"y":-1697.3052978515626,"x":500.5444030761719,"h":146.02418518066407}', '{}', '{}', NULL, 0),
	(198, 'Jamestown St', 'house', 'LowTierHouse', '{"z":29.7068862915039,"y":-1714.102294921875,"x":489.7503967285156,"h":279.5868225097656}', '{}', '{}', NULL, 0),
	(199, 'Jamestown St', 'house', 'LowTierHouse', '{"z":29.15102577209472,"y":-1735.695068359375,"x":479.5137939453125,"h":156.9102020263672}', '{}', '{}', NULL, 0),
	(200, 'Jamestown St', 'house', 'LowTierHouse', '{"z":29.09262657165527,"y":-1757.656005859375,"x":474.531005859375,"h":257.82635498046877}', '{}', '{}', NULL, 0),
	(201, 'Jamestown St', 'house', 'LowTierHouse', '{"z":29.07084465026855,"y":-1775.37158203125,"x":472.044921875,"h":264.8395080566406}', '{}', '{}', NULL, 0),
	(202, 'Jamestown St', 'house', 'LowTierHouse', '{"z":28.91397285461425,"y":-1780.7666015625,"x":514.1661376953125,"h":87.40253448486328}', '{}', '{}', NULL, 0),
	(203, 'Jamestown St', 'house', 'LowTierHouse', '{"z":28.91946411132812,"y":-1790.604736328125,"x":512.4553833007813,"h":91.37440490722656}', '{}', '{}', NULL, 0),
	(204, 'Jamestown St', 'house', 'LowTierHouse', '{"z":28.86970329284668,"y":-1823.2305908203126,"x":495.35040283203127,"h":318.530029296875}', '{}', '{}', NULL, 0),
	(205, 'Mirror Park', 'house', 'MidTierHouse', '{"z":74.48545837402344,"y":-593.3530883789063,"x":1386.1041259765626,"h":42.13819122314453}', '{"z":74.33999633789063,"y":-597.989990234375,"x":1383.22998046875}', '{"z":73.91642761230469,"y":-600.945556640625,"x":1384.095703125,"h":52.6559944152832}', NULL, 0),
	(206, 'Mirror Park', 'house', 'MidTierHouse', '{"z":74.49651336669922,"y":-569.6776123046875,"x":1388.6883544921876,"h":116.33405303955078}', '{"z":74.33999633789063,"y":-574.2000122070313,"x":1391.77001953125}', '{"z":73.91712188720703,"y":-575.5125122070313,"x":1393.2435302734376,"h":115.33541870117188}', NULL, 0),
	(207, 'Mirror Park', 'house', 'MidTierHouse', '{"z":74.68565368652344,"y":-555.63232421875,"x":1373.234130859375,"h":68.26704406738281}', '{"z":74.33999633789063,"y":-553.4199829101563,"x":1365.9200439453126}', '{"z":73.91607666015625,"y":-551.442138671875,"x":1364.4161376953126,"h":159.3549346923828}', NULL, 0),
	(208, 'Mirror Park', 'house', 'MidTierHouse', '{"z":73.89163970947266,"y":-546.8251342773438,"x":1348.252197265625,"h":153.74267578125}', '{"z":73.80999755859375,"y":-548.5499877929688,"x":1353.530029296875}', '{"z":73.36082458496094,"y":-548.0214233398438,"x":1355.744873046875,"h":156.09707641601563}', NULL, 0),
	(209, 'Mirror Park', 'house', 'MidTierHouse', '{"z":72.4408187866211,"y":-535.9702758789063,"x":1328.6737060546876,"h":73.83157348632813}', '{"z":72.12000274658203,"y":-532.5,"x":1320.8800048828126}', '{"z":71.69562530517578,"y":-531.6590576171875,"x":1319.3978271484376,"h":159.9442138671875}', NULL, 0),
	(210, 'Mirror Park', 'house', 'MidTierHouse', '{"z":71.46064758300781,"y":-527.4805297851563,"x":1303.114013671875,"h":160.47244262695313}', '{"z":71.30999755859375,"y":-528.75,"x":1308.780029296875}', '{"z":70.89122772216797,"y":-528.6475219726563,"x":1310.51171875,"h":161.67344665527345}', NULL, 0),
	(211, 'Mirror Park', 'house', 'MidTierHouse', '{"z":69.34904479980469,"y":-515.5263061523438,"x":1251.0286865234376,"h":260.00616455078127}', '{"z":68.98999786376953,"y":-519.6699829101563,"x":1248.72998046875}', '{"z":68.5582275390625,"y":-521.915283203125,"x":1249.3428955078126,"h":256.73248291015627}', NULL, 0),
	(212, 'Mirror Park', 'house', 'MidTierHouse', '{"z":69.90686798095703,"y":-494.2336730957031,"x":1251.5303955078126,"h":255.82321166992188}', '{"z":69.4800033569336,"y":-489.8800048828125,"x":1252.1500244140626}', '{"z":69.02633666992188,"y":-491.2781982421875,"x":1255.0111083984376,"h":256.0137939453125}', NULL, 0),
	(213, 'Mirror Park', 'house', 'MidTierHouse', '{"z":70.18878173828125,"y":-480.1005554199219,"x":1259.670166015625,"h":296.09234619140627}', '{}', '{}', NULL, 0),
	(214, 'Mirror Park', 'house', 'MidTierHouse', '{"z":70.51708221435547,"y":-458.1187744140625,"x":1265.80029296875,"h":256.7271728515625}', '{}', '{}', NULL, 0),
	(215, 'Mirror Park', 'house', 'LowTierHouse', '{"z":70.0147476196289,"y":-429.9127502441406,"x":1262.4405517578126,"h":294.053955078125}', '{}', '{}', NULL, 0),
	(216, 'Mirror Park', 'house', 'LowTierHouse', '{"z":68.94824981689453,"y":-391.284912109375,"x":1114.4361572265626,"h":63.45989227294922}', '{}', '{}', NULL, 0),
	(217, 'Mirror Park', 'house', 'MidTierHouse', '{"z":68.23126983642578,"y":-378.3990478515625,"x":1060.61083984375,"h":226.62094116210938}', '{"z":67.94999694824219,"y":-385.6300048828125,"x":1058.56005859375}', '{"z":67.42228698730469,"y":-386.3349304199219,"x":1056.2574462890626,"h":222.5182342529297}', NULL, 0),
	(218, 'Mirror Park', 'house', 'MidTierHouse', '{"z":65.94927978515625,"y":-409.19476318359377,"x":1029.43603515625,"h":223.01438903808595}', '{"z":65.94999694824219,"y":-415.3500061035156,"x":1021.6500244140625}', '{"z":65.51556396484375,"y":-416.6789245605469,"x":1020.9817504882813,"h":218.78985595703126}', NULL, 0),
	(219, 'Mirror Park', 'house', 'MidTierHouse', '{"z":65.34942626953125,"y":-423.36883544921877,"x":1010.56884765625,"h":303.60101318359377}', '{"z":64.94999694824219,"y":-419.3800048828125,"x":1010.8699951171875}', '{"z":64.52511596679688,"y":-417.1915588378906,"x":1010.87109375,"h":217.7447509765625}', NULL, 0),
	(220, 'Mirror Park', 'house', 'MidTierHouse', '{"z":63.89068984985351,"y":-433.39453125,"x":987.8107299804688,"h":217.45947265625}', '{"z":63.75,"y":-439.69000244140627,"x":989.0}', '{"z":63.33205795288086,"y":-436.3970947265625,"x":990.141357421875,"h":302.52703857421877}', NULL, 0),
	(221, 'Mirror Park', 'house', 'MidTierHouse', '{"z":62.78955459594726,"y":-451.773193359375,"x":967.1205444335938,"h":216.89183044433595}', '{"z":62.4000015258789,"y":-448.7099914550781,"x":974.4500122070313}', '{"z":62.03082656860351,"y":-452.2149353027344,"x":974.9400634765625,"h":214.53494262695313}', NULL, 0),
	(222, 'Mirror Park', 'house', 'MidTierHouse', '{"z":61.5541763305664,"y":-463.0904235839844,"x":944.4696044921875,"h":130.42681884765626}', '{"z":61.25,"y":-464.82000732421877,"x":937.3699951171875}', '{"z":60.82744598388672,"y":-467.38116455078127,"x":941.3099975585938,"h":212.83021545410157}', NULL, 0),
	(223, 'Mirror Park', 'house', 'MidTierHouse', '{"z":61.0837173461914,"y":-477.7550964355469,"x":921.8822021484375,"h":200.72264099121095}', '{"z":60.70000076293945,"y":-476.3399963378906,"x":928.9299926757813}', '{"z":60.31496810913086,"y":-478.69488525390627,"x":932.360595703125,"h":205.0800018310547}', NULL, 0),
	(224, 'Mirror Park', 'house', 'MidTierHouse', '{"z":59.43621063232422,"y":-489.3719177246094,"x":906.3218994140625,"h":202.3684844970703}', '{"z":59.02999877929687,"y":-487.260009765625,"x":911.5}', '{"z":58.61484146118164,"y":-484.82244873046877,"x":912.5211181640625,"h":202.33706665039063}', NULL, 0),
	(225, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.09061431884765,"y":-498.0171203613281,"x":878.3426513671875,"h":229.7005157470703}', '{"z":57.5,"y":-504.95001220703127,"x":874.739990234375}', '{"z":57.0623664855957,"y":-506.9837951660156,"x":874.7440185546875,"h":228.622802734375}', NULL, 0),
	(226, 'Mirror Park', 'house', 'MidTierHouse', '{"z":57.32960891723633,"y":-509.4406433105469,"x":862.0200805664063,"h":228.6515655517578}', '{"z":57.33000183105469,"y":-518.3599853515625,"x":857.2100219726563}', '{"z":56.90425491333008,"y":-520.0088500976563,"x":856.8684692382813,"h":228.1289520263672}', NULL, 0),
	(227, 'Mirror Park', 'house', 'MidTierHouse', '{"z":57.9255142211914,"y":-532.5986938476563,"x":850.4318237304688,"h":264.1422119140625}', '{"z":57.33000183105469,"y":-540.3800048828125,"x":847.97998046875}', '{"z":56.90425491333008,"y":-541.8486328125,"x":848.989501953125,"h":266.7472839355469}', NULL, 0),
	(228, 'Mirror Park', 'house', 'MidTierHouse', '{"z":57.83386993408203,"y":-563.16796875,"x":844.1064453125,"h":191.45668029785157}', '{"z":57.70999908447265,"y":-569.7999877929688,"x":842.77001953125}', '{"z":57.28670120239258,"y":-567.0082397460938,"x":845.323486328125,"h":279.87799072265627}', NULL, 0),
	(229, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.1564826965332,"y":-583.2857055664063,"x":861.7129516601563,"h":0.18454177677631}', '{"z":58.27000045776367,"y":-591.4099731445313,"x":866.989990234375}', '{"z":57.76268768310547,"y":-591.3212280273438,"x":870.53076171875,"h":315.3277587890625}', NULL, 0),
	(230, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.4450798034668,"y":-608.29736328125,"x":886.8667602539063,"h":314.6175231933594}', '{"z":58.22000122070312,"y":-603.2999877929688,"x":872.4600219726563}', '{"z":57.78927230834961,"y":-600.1536865234375,"x":872.5509643554688,"h":315.95843505859377}', NULL, 0),
	(231, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.45333862304687,"y":-615.5178833007813,"x":902.9114990234375,"h":232.0413818359375}', '{"z":58.04999923706055,"y":-630.0599975585938,"x":910.4000244140625}', '{"z":57.62858581542969,"y":-628.7191162109375,"x":914.4142456054688,"h":317.9146728515625}', NULL, 0),
	(232, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.24250030517578,"y":-639.5946044921875,"x":928.838134765625,"h":319.8390808105469}', '{"z":57.86000061035156,"y":-645.1300048828125,"x":915.1099853515625}', '{"z":57.44149017333984,"y":-641.5383911132813,"x":915.8829345703125,"h":321.4208679199219}', NULL, 0),
	(233, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.42866516113281,"y":-653.916748046875,"x":943.8919067382813,"h":214.19473266601563}', '{"z":58.0099983215332,"y":-658.5999755859375,"x":947.3699951171875}', '{"z":57.58880233764648,"y":-655.1421508789063,"x":948.7430419921875,"h":308.1189270019531}', NULL, 0),
	(234, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.4498176574707,"y":-669.8275756835938,"x":960.1845092773438,"h":297.10980224609377}', '{"z":58.0099983215332,"y":-664.72998046875,"x":957.5999755859375}', '{"z":57.59005737304687,"y":-664.2979125976563,"x":954.4535522460938,"h":296.82763671875}', NULL, 0),
	(235, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.48196411132812,"y":-701.15234375,"x":970.776611328125,"h":354.53643798828127}', '{"z":57.93999862670898,"y":-689.6699829101563,"x":971.260009765625}', '{"z":57.29449844360351,"y":-686.1038818359375,"x":972.62060546875,"h":308.7461853027344}', NULL, 0),
	(236, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.22066879272461,"y":-716.3807983398438,"x":979.2301635742188,"h":312.40472412109377}', '{"z":57.84000015258789,"y":-712.8599853515625,"x":975.8200073242188}', '{"z":57.29814147949219,"y":-711.0579833984375,"x":979.0717163085938,"h":314.74212646484377}', NULL, 0),
	(237, 'Mirror Park', 'house', 'MidTierHouse', '{"z":57.81573486328125,"y":-729.5269775390625,"x":996.942626953125,"h":309.34625244140627}', '{"z":57.45999908447265,"y":-732.75,"x":1003.3499755859375}', '{"z":57.14817810058594,"y":-732.5526123046875,"x":1006.000244140625,"h":312.83990478515627}', NULL, 0),
	(238, 'Mirror Park', 'house', 'MidTierHouse', '{"z":60.7979621887207,"y":-725.3837280273438,"x":1229.006103515625,"h":95.42861938476563}', '{"z":60.63000106811523,"y":-723.4299926757813,"x":1222.800048828125}', '{"z":60.121337890625,"y":-726.5948486328125,"x":1224.9617919921876,"h":174.73281860351563}', NULL, 0),
	(239, 'Mirror Park', 'house', 'LowTierHouse', '{"z":60.806884765625,"y":-696.9312133789063,"x":1222.6524658203126,"h":96.45559692382813}', '{"z":60.66999816894531,"y":-705.2899780273438,"x":1228.25}', '{"z":60.27123260498047,"y":-704.0695190429688,"x":1225.042236328125,"h":97.42949676513672}', NULL, 0),
	(240, 'Mirror Park', 'house', 'LowTierHouse', '{"z":63.49313735961914,"y":-668.795654296875,"x":1221.396240234375,"h":8.54034900665283}', '{"z":63.11999893188476,"y":-662.9400024414063,"x":1220.260009765625}', '{"z":62.50221633911133,"y":-665.0547485351563,"x":1217.7581787109376,"h":104.04373168945313}', NULL, 0),
	(241, 'Mirror Park', 'house', 'LowTierHouse', '{"z":66.4386215209961,"y":-620.2816772460938,"x":1207.1829833984376,"h":88.80595397949219}', '{"z":66.08999633789063,"y":-610.3200073242188,"x":1206.1400146484376}', '{"z":64.44534301757813,"y":-612.7633666992188,"x":1199.534423828125,"h":94.67853546142578}', NULL, 0),
	(242, 'Mirror Park', 'house', 'MidTierHouse', '{"z":68.06355285644531,"y":-598.5269165039063,"x":1203.589111328125,"h":177.13340759277345}', '{"z":64.0,"y":-597.8499755859375,"x":1192.1300048828126}', '{"z":63.56413269042969,"y":-595.3629150390625,"x":1189.023193359375,"h":49.06902694702148}', NULL, 0),
	(243, 'Mirror Park', 'house', 'MidTierHouse', '{"z":69.13909149169922,"y":-575.6649780273438,"x":1200.9609375,"h":130.75257873535157}', '{"z":64.30000305175781,"y":-575.1199951171875,"x":1189.5400390625}', '{"z":63.88483810424805,"y":-571.7817993164063,"x":1186.699462890625,"h":46.25042724609375}', NULL, 0),
	(244, 'Mirror Park', 'house', 'LowTierHouse', '{"z":69.61516571044922,"y":-557.7220458984375,"x":1204.890869140625,"h":90.43846130371094}', '{"z":64.63999938964844,"y":-555.9600219726563,"x":1190.8199462890626}', '{"z":64.14945983886719,"y":-552.6810913085938,"x":1188.6219482421876,"h":83.22273254394531}', NULL, 0),
	(245, 'Mirror Park', 'house', 'LowTierHouse', '{"z":69.65739440917969,"y":-566.2078247070313,"x":1241.6707763671876,"h":317.245361328125}', '{"z":69.48999786376953,"y":-576.0700073242188,"x":1238.989990234375}', '{"z":68.9351806640625,"y":-578.1381225585938,"x":1243.687255859375,"h":267.40142822265627}', NULL, 0),
	(246, 'Mirror Park', 'house', 'LowTierHouse', '{"z":69.78267669677735,"y":-601.7012329101563,"x":1240.6134033203126,"h":268.60272216796877}', '{"z":69.29000091552735,"y":-588.02001953125,"x":1237.969970703125}', '{"z":68.89421844482422,"y":-585.5547485351563,"x":1238.1793212890626,"h":269.54742431640627}', NULL, 0),
	(247, 'Mirror Park', 'house', 'MidTierHouse', '{"z":67.92141723632813,"y":-648.160888671875,"x":1265.5328369140626,"h":25.54984855651855}', '{"z":67.77999877929688,"y":-658.1599731445313,"x":1267.3699951171876}', '{"z":67.32815551757813,"y":-659.6751708984375,"x":1269.05078125,"h":292.1380615234375}', NULL, 0),
	(248, 'Mirror Park', 'house', 'LowTierHouse', '{"z":69.78267669677735,"y":-601.7012329101563,"x":1240.6134033203126,"h":268.60272216796877}', '{"z":69.29000091552735,"y":-588.02001953125,"x":1237.969970703125}', '{"z":68.89421844482422,"y":-585.5547485351563,"x":1238.1793212890626,"h":269.54742431640627}', NULL, 0),
	(249, 'Mirror Park', 'house', 'LowTierHouse', '{"z":66.03160858154297,"y":-683.5060424804688,"x":1271.0595703125,"h":357.7197570800781}', '{"z":65.76000213623047,"y":-675.469970703125,"x":1268.3399658203126}', '{"z":65.39582824707031,"y":-672.873046875,"x":1271.096923828125,"h":276.8221740722656}', NULL, 0),
	(250, 'Mirror Park', 'house', 'LowTierHouse', '{"z":64.90904235839844,"y":-702.8208618164063,"x":1264.744140625,"h":239.035888671875}', '{"z":64.51000213623047,"y":-712.1500244140625,"x":1260.9000244140626}', '{"z":64.0858154296875,"y":-712.491455078125,"x":1258.868408203125,"h":240.06326293945313}', NULL, 0),
	(251, 'Mirror Park', 'house', 'MidTierHouse', '{"z":71.73223114013672,"y":-574.0226440429688,"x":1301.087890625,"h":342.8035888671875}', '{"z":71.62999725341797,"y":-573.1300048828125,"x":1295.4100341796876}', '{"z":71.20775604248047,"y":-574.2630615234375,"x":1293.718505859375,"h":345.11572265625}', NULL, 0),
	(252, 'Mirror Park', 'house', 'MidTierHouse', '{"z":73.24634552001953,"y":-582.9796752929688,"x":1323.4853515625,"h":336.77545166015627}', '{"z":73.16999816894531,"y":-581.3099975585938,"x":1318.1300048828126}', '{"z":72.6517105102539,"y":-582.3547973632813,"x":1315.9188232421876,"h":333.5659484863281}', NULL, 0),
	(253, 'Mirror Park', 'house', 'MidTierHouse', '{"z":74.7008056640625,"y":-597.4318237304688,"x":1341.4786376953126,"h":201.78684997558595}', '{"z":74.3499984741211,"y":-608.239990234375,"x":1343.4000244140626}', '{"z":73.93729400634766,"y":-605.36279296875,"x":1347.8944091796876,"h":325.78057861328127}', NULL, 0),
	(254, 'Mirror Park', 'house', 'MidTierHouse', '{"z":74.71101379394531,"y":-606.345947265625,"x":1367.364501953125,"h":355.7523193359375}', '{"z":74.33999633789063,"y":-607.1699829101563,"x":1361.6300048828126}', '{"z":73.91687774658203,"y":-609.042724609375,"x":1359.9639892578126,"h":357.2781677246094}', NULL, 0),
	(255, 'Mirror Park', 'house', 'MidTierHouse', '{"z":67.55513763427735,"y":-411.2454833984375,"x":1100.8525390625,"h":87.45039367675781}', '{"z":67.16000366210938,"y":-417.1400146484375,"x":1100.9300537109376}', '{"z":66.73178100585938,"y":-418.6922607421875,"x":1102.1422119140626,"h":83.56587219238281}', NULL, 0),
	(256, 'Mirror Park', 'house', 'LowTierHouse', '{"z":67.79055786132813,"y":-438.72967529296877,"x":1099.52978515625,"h":353.86572265625}', '{"z":67.38999938964844,"y":-427.8900146484375,"x":1102.6400146484376}', '{"z":66.94535064697266,"y":-429.3373718261719,"x":1099.3629150390626,"h":77.5945053100586}', NULL, 0),
	(257, 'Mirror Park', 'house', 'LowTierHouse', '{"z":67.31938934326172,"y":-464.66046142578127,"x":1098.4854736328126,"h":163.6213836669922}', '{"z":66.94000244140625,"y":-471.7099914550781,"x":1097.8699951171876}', '{"z":66.51252746582031,"y":-472.8499450683594,"x":1097.160400390625,"h":76.23743438720703}', NULL, 0),
	(258, 'Mirror Park', 'house', 'LowTierHouse', '{"z":65.66038513183594,"y":-484.3045654296875,"x":1090.2791748046876,"h":77.92469024658203}', '{"z":65.04000091552735,"y":-493.44000244140627,"x":1089.280029296875}', '{"z":64.08970642089844,"y":-494.51324462890627,"x":1086.0550537109376,"h":77.30615997314453}', NULL, 0),
	(259, 'Mirror Park', 'house', 'MidTierHouse', '{"z":66.25748443603516,"y":-448.7771911621094,"x":1056.287109375,"h":348.541015625}', '{"z":65.97000122070313,"y":-444.95001220703127,"x":1052.969970703125}', '{"z":65.5450210571289,"y":-444.1549987792969,"x":1055.8521728515626,"h":259.3957824707031}', NULL, 0),
	(260, 'Mirror Park', 'house', 'MidTierHouse', '{"z":63.89892196655273,"y":-470.67791748046877,"x":1052.15234375,"h":256.7045593261719}', '{"z":64.16999816894531,"y":-480.0799865722656,"x":1048.8399658203126}', '{"z":63.50180053710937,"y":-482.10205078125,"x":1051.401123046875,"h":256.9593811035156}', NULL, 0),
	(261, 'Mirror Park', 'house', 'MidTierHouse', '{"z":64.07965087890625,"y":-497.80615234375,"x":1046.440673828125,"h":1.81441915035247}', '{"z":63.91999816894531,"y":-488.8500061035156,"x":1044.68994140625}', '{"z":63.50321960449219,"y":-486.64013671875,"x":1047.93359375,"h":257.93511962890627}', NULL, 0),
	(262, 'Mirror Park', 'house', 'MidTierHouse', '{"z":60.83395004272461,"y":-511.34002685546877,"x":1006.0881958007813,"h":122.42899322509766}', '{"z":60.68999862670898,"y":-511.8599853515625,"x":999.239990234375}', '{"z":60.27356338500976,"y":-513.5979614257813,"x":1002.773193359375,"h":203.95738220214845}', NULL, 0),
	(263, 'Mirror Park', 'house', 'MidTierHouse', '{"z":60.69060516357422,"y":-526.013427734375,"x":988.0708618164063,"h":209.68170166015626}', '{"z":60.11000061035156,"y":-529.25,"x":981.4199829101563}', '{"z":59.6755485534668,"y":-533.1985473632813,"x":981.904296875,"h":212.49481201171876}', NULL, 0),
	(264, 'Mirror Park', 'house', 'MidTierHouse', '{"z":59.72737121582031,"y":-541.8592529296875,"x":965.1793823242188,"h":212.73765563964845}', '{"z":59.36000061035156,"y":-547.3400268554688,"x":956.8699951171875}', '{"z":58.9335708618164,"y":-550.3588256835938,"x":956.8628540039063,"h":214.49168395996095}', NULL, 0),
	(265, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.36636352539062,"y":-569.9577026367188,"x":919.8704223632813,"h":207.48721313476563}', '{"z":57.95999908447265,"y":-566.8099975585938,"x":924.4199829101563}', '{"z":57.54704284667969,"y":-565.0993041992188,"x":925.4384155273438,"h":206.09259033203126}', NULL, 0),
	(266, 'Mirror Park', 'house', 'MidTierHouse', '{"z":58.50665664672851,"y":-540.6093139648438,"x":893.195556640625,"h":112.73605346679688}', '{"z":58.13999938964844,"y":-547.489990234375,"x":894.989990234375}', '{"z":57.68486022949219,"y":-551.0223388671875,"x":891.4198608398438,"h":115.19793701171875}', NULL, 0),
	(267, 'Mirror Park', 'house', 'LowTierHouse', '{"z":59.78902053833008,"y":-526.05517578125,"x":924.36669921875,"h":25.09321212768554}', '{"z":59.22000122070312,"y":-526.4199829101563,"x":918.6900024414063}', '{"z":58.31371688842773,"y":-522.7523803710938,"x":915.7350463867188,"h":25.83473968505859}', NULL, 0),
	(268, 'Mirror Park', 'house', 'MidTierHouse', '{"z":60.62552642822265,"y":-518.8377075195313,"x":946.1273193359375,"h":304.44915771484377}', '{"z":60.2400016784668,"y":-515.77001953125,"x":951.9600219726563}', '{"z":59.80125045776367,"y":-511.7509765625,"x":947.8646850585938,"h":29.66032981872558}', NULL, 0),
	(269, 'Mirror Park', 'house', 'MidTierHouse', '{"z":62.14089202880859,"y":-502.28436279296877,"x":970.2765502929688,"h":76.63558959960938}', '{"z":61.72999954223633,"y":-506.0899963378906,"x":964.8900146484375}', '{"z":61.00373077392578,"y":-501.6112365722656,"x":960.7433471679688,"h":36.09455108642578}', NULL, 0),
	(270, 'Mirror Park', 'house', 'LowTierHouse', '{"z":64.50298309326172,"y":-469.15936279296877,"x":1014.6639404296875,"h":33.66580581665039}', '{"z":63.9000015258789,"y":-463.8500061035156,"x":1019.6400146484375}', '{"z":63.50415802001953,"y":-461.78204345703127,"x":1020.2657470703125,"h":39.28477478027344}', NULL, 0),
	(271, 'Mirror Park', 'house', 'MidTierHouse', '{"z":60.59447860717773,"y":-572.5715942382813,"x":1009.9872436523438,"h":248.32418823242188}', '{"z":60.20000076293945,"y":-564.9199829101563,"x":1009.719970703125}', '{"z":59.77783584594726,"y":-562.7015380859375,"x":1007.2276611328125,"h":263.7851867675781}', NULL, 0),
	(272, 'Mirror Park', 'house', 'LowTierHouse', '{"z":59.63859558105469,"y":-594.05615234375,"x":999.5454711914063,"h":264.0552673339844}', '{"z":59.13000106811523,"y":-586.8900146484375,"x":1004.3099975585938}', '{"z":58.67665863037109,"y":-588.962890625,"x":1007.3701171875,"h":260.34466552734377}', NULL, 0),
	(273, 'Mirror Park', 'house', 'MidTierHouse', '{"z":59.23585891723633,"y":-627.5283813476563,"x":980.1898803710938,"h":36.98876571655273}', '{"z":58.88000106811523,"y":-619.9299926757813,"x":978.9199829101563}', '{"z":58.42132568359375,"y":-618.1639404296875,"x":975.841064453125,"h":127.93251037597656}', NULL, 0),
	(274, 'Vespucci Canals', 'apartment', 'MidTierApartment', '{"z":3.98667120933532,"y":-902.0909423828125,"x":-1111.397705078125,"h":123.7196044921875}', '{"z":3.74000000953674,"y":-894.1900024414063,"x":-1093.949951171875}', '{"z":3.16287016868591,"y":-890.9591674804688,"x":-1091.744384765625,"h":303.58111572265627}', NULL, 0),
	(275, 'Vespucci Canals', 'apartment', 'MidTierApartment', '{"z":7.79686641693115,"y":-895.5901489257813,"x":-1116.135986328125,"h":122.6746597290039}', '{"z":3.74000000953674,"y":-894.1900024414063,"x":-1093.949951171875}', '{"z":3.16287016868591,"y":-890.9591674804688,"x":-1091.744384765625,"h":303.58111572265627}', NULL, 0),
	(276, 'Vespucci Canals', 'apartment', 'MidTierApartment', '{"z":7.79621124267578,"y":-902.137451171875,"x":-1111.5574951171876,"h":120.36539459228516}', '{"z":3.74000000953674,"y":-894.1900024414063,"x":-1093.949951171875}', '{"z":3.16287016868591,"y":-890.9591674804688,"x":-1091.744384765625,"h":303.58111572265627}', NULL, 0),
	(277, 'Vespucci Canals', 'apartment', 'MidTierApartment', '{"z":11.79673194885253,"y":-895.5684814453125,"x":-1116.1439208984376,"h":122.90914916992188}', '{"z":3.74000000953674,"y":-894.1900024414063,"x":-1093.949951171875}', '{"z":3.16287016868591,"y":-890.9591674804688,"x":-1091.744384765625,"h":303.58111572265627}', NULL, 0),
	(278, 'Vespucci Canals', 'apartment', 'MidTierApartment', '{"z":11.79673194885253,"y":-902.1243896484375,"x":-1111.56494140625,"h":136.6566162109375}', '{"z":3.74000000953674,"y":-894.1900024414063,"x":-1093.949951171875}', '{"z":3.16287016868591,"y":-890.9591674804688,"x":-1091.744384765625,"h":303.58111572265627}', NULL, 0),
	(279, 'Banham Canyon', 'house', 'MidTierHouse', '{"z":14.11848926544189,"y":221.15420532226563,"x":-3089.26953125,"h":325.748779296875}', '{"z":14.07999992370605,"y":217.33999633789063,"x":-3083.830078125}', '{"z":13.58226871490478,"y":221.54261779785157,"x":-3082.957763671875,"h":319.4140625}', NULL, 0),
	(280, 'Banham Canyon', 'house', 'MidTierHouse', '{"z":8.3810396194458,"y":315.2729187011719,"x":-3111.767333984375,"h":344.3497619628906}', '{"z":8.38000011444091,"y":309.5199890136719,"x":-3100.840087890625}', '{"z":7.8867654800415,"y":306.5009460449219,"x":-3096.51513671875,"h":251.16775512695313}', NULL, 0),
	(281, 'Banham Canyon', 'house', 'HighEndHouse', '{"z":7.54179716110229,"y":349.2503662109375,"x":-3093.632080078125,"h":266.58477783203127}', '{"z":7.46999979019165,"y":339.45001220703127,"x":-3094.10009765625}', '{"z":7.00361061096191,"y":341.179931640625,"x":-3090.042724609375,"h":257.9915771484375}', NULL, 0),
	(282, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.72954559326172,"y":6190.99755859375,"x":-374.5080871582031,"h":226.27130126953126}', '{"z":31.48999977111816,"y":6186.56982421875,"x":-378.45001220703127}', '{"z":31.06849098205566,"y":6187.97705078125,"x":-382.2209777832031,"h":224.43292236328126}', NULL, 0),
	(283, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.84227752685547,"y":6207.431640625,"x":-356.92840576171877,"h":222.25115966796876}', '{"z":31.57999992370605,"y":6201.4599609375,"x":-364.25}', '{"z":31.07146835327148,"y":6200.97412109375,"x":-368.2246398925781,"h":224.27354431152345}', NULL, 0),
	(284, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.88407325744629,"y":6225.3125,"x":-347.436767578125,"h":221.168212890625}', '{"z":31.48999977111816,"y":6225.81982421875,"x":-360.07000732421877}', '{"z":31.0672607421875,"y":6222.85498046875,"x":-355.1251220703125,"h":224.22999572753907}', NULL, 0),
	(285, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.90001487731933,"y":6260.61328125,"x":-360.1927795410156,"h":315.6338195800781}', '{"z":31.29000091552734,"y":6269.75,"x":-353.989990234375}', '{"z":30.51454734802246,"y":6272.6376953125,"x":-358.6426086425781,"h":42.11267852783203}', NULL, 0),
	(286, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":28.94124221801757,"y":6314.1220703125,"x":-407.3320617675781,"h":219.01210021972657}', '{"z":28.71999931335449,"y":6315.4599609375,"x":-398.17999267578127}', '{"z":28.56399917602539,"y":6311.4443359375,"x":-395.7855529785156,"h":219.82550048828126}', NULL, 0),
	(287, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":30.06829071044922,"y":6272.21435546875,"x":-437.7491149902344,"h":334.44403076171877}', '{"z":30.07999992370605,"y":6268.4599609375,"x":-435.0}', '{"z":29.83817100524902,"y":6266.06103515625,"x":-432.33404541015627,"h":253.768798828125}', NULL, 0),
	(288, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":30.04790306091308,"y":6260.1640625,"x":-448.12445068359377,"h":159.21751403808595}', '{"z":30.07999992370605,"y":6259.31982421875,"x":-438.0}', '{"z":29.53700256347656,"y":6260.9873046875,"x":-433.9537353515625,"h":250.55282592773438}', NULL, 0),
	(289, 'Paleto Bay', 'house', 'MidTierHouse', '{"z":29.5528392791748,"y":6197.341796875,"x":-454.89263916015627,"h":269.96014404296877}', '{"z":29.54999923706054,"y":6205.64990234375,"x":-442.95001220703127}', '{"z":29.13521766662597,"y":6204.4619140625,"x":-440.3912353515625,"h":272.4337463378906}', NULL, 0),
	(290, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.8511905670166,"y":6252.73876953125,"x":-379.9483337402344,"h":316.84979248046877}', '{"z":31.47999954223632,"y":6259.89990234375,"x":-379.42999267578127}', '{"z":30.6700382232666,"y":6265.02099609375,"x":-381.1551208496094,"h":18.54775619506836}', NULL, 0),
	(291, 'Paleto Bay', 'house', 'ShitTier', '{"z":13.63469409942627,"y":6266.2568359375,"x":-480.8642883300781,"h":154.31263732910157}', '{"z":13.10999965667724,"y":6258.0498046875,"x":-480.4100036621094}', '{"z":12.5607271194458,"y":6260.3916015625,"x":-482.8931884765625,"h":68.06089782714844}', NULL, 0),
	(292, 'Paleto Bay', 'house', 'ShitTier', '{"z":13.10937213897705,"y":6336.9765625,"x":-453.25579833984377,"h":35.60090255737305}', '{"z":12.71000003814697,"y":6337.33984375,"x":-441.4100036621094}', '{"z":12.29792785644531,"y":6341.859375,"x":-441.7236633300781,"h":37.42391204833984}', NULL, 0),
	(293, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":32.822265625,"y":6596.6240234375,"x":31.17176628112793,"h":225.9159698486328}', '{"z":32.41999816894531,"y":6602.18017578125,"x":40.93000030517578}', '{"z":31.58900642395019,"y":6602.26416015625,"x":45.79463958740234,"h":227.3492431640625}', NULL, 0),
	(294, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":33.07080078125,"y":6578.38720703125,"x":11.44983959197998,"h":226.00604248046876}', '{"z":32.47000122070312,"y":6590.72998046875,"x":12.61999988555908}', '{"z":32.04850387573242,"y":6586.02197265625,"x":13.52583694458007,"h":225.16415405273438}', NULL, 0),
	(295, 'Paleto Bay', 'house', 'MidTierHouse', '{"z":33.24037933349609,"y":6557.31884765625,"x":-15.1904878616333,"h":313.79205322265627}', '{"z":31.90999984741211,"y":6567.3701171875,"x":-13.72999954223632}', '{"z":31.5361328125,"y":6563.72607421875,"x":-11.44640159606933,"h":223.4473114013672}', NULL, 0),
	(296, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":32.17551803588867,"y":6582.2607421875,"x":-44.37858200073242,"h":55.32732391357422}', '{"z":31.15999984741211,"y":6583.5400390625,"x":-35.2400016784668}', '{"z":30.25188446044922,"y":6590.615234375,"x":-38.79665756225586,"h":37.06056976318359}', NULL, 0),
	(297, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.86078453063965,"y":6597.26611328125,"x":-26.50492095947265,"h":40.24917602539062}', '{"z":31.46999931335449,"y":6593.93994140625,"x":-7.84999990463256}', '{"z":30.77453422546386,"y":6598.919921875,"x":-9.20368862152099,"h":36.84420394897461}', NULL, 0),
	(298, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":32.07962417602539,"y":6612.67041015625,"x":1.65059745311737,"h":20.89154815673828}', '{"z":31.46999931335449,"y":6616.68017578125,"x":-6.32000017166137}', '{"z":30.63224220275879,"y":6619.81787109375,"x":-7.15806818008422,"h":64.18952178955078}', NULL, 0),
	(299, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.08753585815429,"y":6637.38427734375,"x":-41.70633697509765,"h":218.96961975097657}', '{"z":30.04000091552734,"y":6629.2001953125,"x":-50.70999908447265}', '{"z":29.24417495727539,"y":6620.8740234375,"x":-51.10778427124023,"h":177.26512145996095}', NULL, 0),
	(300, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.69872093200683,"y":6654.21044921875,"x":-9.62784099578857,"h":203.81793212890626}', '{"z":31.14999961853027,"y":6650.93017578125,"x":-16.1200008392334}', '{"z":30.69754981994629,"y":6645.87744140625,"x":-16.68351173400879,"h":207.81268310546876}', NULL, 0),
	(301, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":32.19039154052734,"y":6662.89208984375,"x":35.26117324829101,"h":162.7807159423828}', '{"z":31.6200008392334,"y":6666.81005859375,"x":23.81999969482422}', '{"z":30.82856559753418,"y":6661.13330078125,"x":21.94662857055664,"h":181.18104553222657}', NULL, 0),
	(302, 'Paleto Bay', 'house', 'MidTierHouse', '{"z":32.88723373413086,"y":6327.01953125,"x":-302.3924865722656,"h":43.71878433227539}', '{"z":32.5099983215332,"y":6333.97021484375,"x":-293.7900085449219}', '{"z":31.90774154663086,"y":6338.54541015625,"x":-293.6368713378906,"h":48.71078872680664}', NULL, 0),
	(303, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":32.60078048706055,"y":6350.76025390625,"x":-280.48883056640627,"h":42.25722122192383}', '{"z":32.4900016784668,"y":6355.60009765625,"x":-271.489990234375}', '{"z":31.69480323791504,"y":6358.6201171875,"x":-272.2560119628906,"h":48.60461044311523}', NULL, 0),
	(304, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.84554100036621,"y":6370.12158203125,"x":-247.6116180419922,"h":50.87023544311523}', '{"z":31.48999977111816,"y":6356.8798828125,"x":-249.50999450683595}', '{"z":31.05517196655273,"y":6359.80908203125,"x":-254.59434509277345,"h":44.7349624633789}', NULL, 0),
	(305, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.75924110412597,"y":6377.671875,"x":-227.28067016601563,"h":43.24435806274414}', '{"z":31.54000091552734,"y":6380.75,"x":-221.10000610351563}', '{"z":30.89849853515625,"y":6382.9560546875,"x":-220.22879028320313,"h":39.91216659545898}', NULL, 0),
	(306, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":33.0850830078125,"y":6396.18701171875,"x":-213.61749267578126,"h":46.53827667236328}', '{"z":31.86000061035156,"y":6403.06005859375,"x":-206.42999267578126}', '{"z":31.43106842041015,"y":6405.17333984375,"x":-205.28016662597657,"h":43.31070709228515}', NULL, 0),
	(307, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":32.29675674438476,"y":6409.61962890625,"x":-188.81634521484376,"h":41.73315048217773}', '{"z":31.90999984741211,"y":6412.66015625,"x":-184.9600067138672}', '{"z":31.44463157653808,"y":6417.62744140625,"x":-187.4303436279297,"h":44.99435806274414}', NULL, 0),
	(308, 'Paleto Bay', 'house', 'MidTierHouse', '{"z":31.19742965698242,"y":6445.5615234375,"x":-229.61968994140626,"h":146.52374267578126}', '{"z":31.20000076293945,"y":6434.5498046875,"x":-218.89999389648438}', '{"z":30.77842712402343,"y":6434.26904296875,"x":-222.21365356445313,"h":228.6267547607422}', NULL, 0),
	(309, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.46059799194336,"y":6414.4375,"x":-245.9532928466797,"h":132.58998107910157}', '{"z":31.14999961853027,"y":6408.66015625,"x":-254.2899932861328}', '{"z":30.73729133605957,"y":6408.21630859375,"x":-249.87738037109376,"h":220.4934539794922}', NULL, 0),
	(310, 'Paleto Bay', 'house', 'LowTierHouse', '{"z":31.50495338439941,"y":6400.84716796875,"x":-272.5166015625,"h":205.12957763671876}', '{"z":30.88999938964843,"y":6405.02001953125,"x":-267.2099914550781}', '{"z":30.51751899719238,"y":6402.92578125,"x":-263.17767333984377,"h":228.01548767089845}', NULL, 0),
	(311, 'Grapeseed', 'house', 'LowTierHouse', '{"z":42.007568359375,"y":4776.2275390625,"x":1662.2340087890626,"h":276.61358642578127}', '{"z":42.0099983215332,"y":4769.16015625,"x":1658.8199462890626}', '{"z":41.58428192138672,"y":4767.50341796875,"x":1661.3848876953126,"h":278.44049072265627}', NULL, 0),
	(312, 'Grapeseed', 'house', 'LowTierHouse', '{"z":42.00860595703125,"y":4739.60498046875,"x":1664.112060546875,"h":290.5732421875}', '{"z":41.88000106811523,"y":4750.490234375,"x":1666.72998046875}', '{"z":41.45738983154297,"y":4751.1181640625,"x":1669.3619384765626,"h":288.620849609375}', NULL, 0),
	(313, 'Grapeseed', 'house', 'LowTierHouse', '{"z":43.06550216674805,"y":4689.42236328125,"x":1682.7689208984376,"h":265.9393005371094}', '{"z":43.06000137329101,"y":4682.89013671875,"x":1679.1400146484376}', '{"z":42.62877655029297,"y":4681.56298828125,"x":1682.8314208984376,"h":268.35357666015627}', NULL, 0),
	(314, 'Grapeseed', 'house', 'LowTierHouse', '{"z":43.37156295776367,"y":4658.26953125,"x":1673.9361572265626,"h":273.2532043457031}', '{"z":43.36999893188476,"y":4663.3701171875,"x":1679.2099609375}', '{"z":42.93961334228515,"y":4662.8876953125,"x":1683.6885986328126,"h":281.7972106933594}', NULL, 0),
	(315, 'Grapeseed', 'house', 'LowTierHouse', '{"z":43.65578842163086,"y":4677.2880859375,"x":1719.0665283203126,"h":89.80249786376953}', '{"z":43.33000183105469,"y":4668.81982421875,"x":1723.1800537109376}', '{"z":42.49169540405273,"y":4668.560546875,"x":1718.493896484375,"h":89.7790298461914}', NULL, 0),
	(316, 'Grapeseed', 'house', 'LowTierHouse', '{"z":43.87550735473633,"y":4642.42724609375,"x":1725.2503662109376,"h":117.98478698730469}', '{"z":43.31000137329101,"y":4633.8701171875,"x":1729.3499755859376}', '{"z":42.87882995605469,"y":4631.541015625,"x":1727.10595703125,"h":115.9770736694336}', NULL, 0),
	(317, 'Sandy Shores', 'house', 'Trailer', '{"z":32.90989685058594,"y":3804.908935546875,"x":1932.743408203125,"h":119.75730895996094}', '{"z":32.4000015258789,"y":3795.280029296875,"x":1924.699951171875}', '{"z":31.78619956970215,"y":3801.246337890625,"x":1917.719970703125,"h":51.72378158569336}', NULL, 0),
	(318, 'Sandy Shores', 'house', 'ShitTier', '{"z":32.43997955322265,"y":3824.566650390625,"x":1925.097412109375,"h":209.8936309814453}', '{"z":32.25,"y":3817.830078125,"x":1921.3599853515626}', '{"z":31.64066123962402,"y":3813.431884765625,"x":1921.2239990234376,"h":136.32733154296876}', NULL, 0),
	(319, 'Sandy Shores', 'house', 'LowTierHouse', '{"z":32.77882766723633,"y":3810.51953125,"x":1880.7177734375,"h":301.8507385253906}', '{"z":32.77999877929687,"y":3809.1298828125,"x":1891.5999755859376}', '{"z":31.90828895568847,"y":3806.303466796875,"x":1896.9320068359376,"h":232.00399780273438}', NULL, 0),
	(320, 'Sandy Shores', 'house', 'ShitTier', '{"z":32.87789154052734,"y":3773.3076171875,"x":1899.87158203125,"h":209.33392333984376}', '{"z":32.58000183105469,"y":3765.27001953125,"x":1901.22998046875}', '{"z":32.01531982421875,"y":3762.164306640625,"x":1900.1539306640626,"h":145.4524688720703}', NULL, 0),
	(321, 'Sandy Shores', 'house', 'ShitTier', '{"z":33.58538818359375,"y":3778.030029296875,"x":1843.5111083984376,"h":122.58019256591797}', '{"z":33.02999877929687,"y":3773.139892578125,"x":1851.989990234375}', '{"z":32.58739471435547,"y":3766.56103515625,"x":1848.5562744140626,"h":115.96964263916016}', NULL, 0),
	(322, 'Sandy Shores', 'house', 'Trailer', '{"z":34.35445785522461,"y":3854.248046875,"x":1813.397705078125,"h":27.40764617919922}', '{"z":33.88999938964844,"y":3862.77001953125,"x":1809.8399658203126}', '{"z":33.19288635253906,"y":3870.52099609375,"x":1815.27783203125,"h":329.7602233886719}', NULL, 0),
	(323, 'Sandy Shores', 'house', 'Trailer', '{"z":34.2974739074707,"y":3868.535888671875,"x":1832.6356201171876,"h":113.53884887695313}', '{"z":33.56999969482422,"y":3858.2099609375,"x":1832.280029296875}', '{"z":32.95957946777344,"y":3860.25439453125,"x":1829.172119140625,"h":23.49186897277832}', NULL, 0),
	(324, 'Sandy Shores', 'house', 'Trailer', '{"z":34.52312469482422,"y":3799.964111328125,"x":1777.48388671875,"h":118.3106689453125}', '{"z":33.88000106811523,"y":3793.659912109375,"x":1769.780029296875}', '{"z":33.13840103149414,"y":3787.63720703125,"x":1768.1968994140626,"h":203.6053924560547}', NULL, 0),
	(325, 'Sandy Shores', 'house', 'ShitTier', '{"z":34.83491897583008,"y":3783.5751953125,"x":1748.7967529296876,"h":122.90608978271485}', '{"z":34.09000015258789,"y":3779.1201171875,"x":1739.9000244140626}', '{"z":33.56843948364258,"y":3783.11767578125,"x":1735.580322265625,"h":62.90425491333008}', NULL, 0),
	(326, 'Sandy Shores', 'house', 'ShitTier', '{"z":35.11812210083008,"y":3808.718505859375,"x":1733.632080078125,"h":35.89934539794922}', '{"z":34.7400016784668,"y":3813.2900390625,"x":1739.68994140625}', '{"z":33.92266845703125,"y":3814.97021484375,"x":1738.1480712890626,"h":113.43453216552735}', NULL, 0),
	(327, 'Sandy Shores', 'house', 'Trailer', '{"z":34.90155029296875,"y":3866.96142578125,"x":1700.1043701171876,"h":313.551025390625}', '{"z":34.91264343261719,"y":3877.169189453125,"x":1704.301025390625}', '{"z":34.44557189941406,"y":3880.5791015625,"x":1702.8675537109376,"h":97.05036926269531}', NULL, 0),
	(328, 'wow so cool', 'house', 'MidTierHouse', '{"z":182.77310180664063,"y":561.9524536132813,"x":84.97805786132813,"h":2.86038160324096}', '{"z":182.56317138671876,"y":564.3849487304688,"x":93.85758209228516}', '{"z":182.37464904785157,"y":566.717041015625,"x":97.16175079345703,"h":52.21257019042969}', NULL, 0),
	(329, 'wow so cool!', 'house', 'MidTierHouse', '{"z":123.83126831054688,"y":526.9732666015625,"x":-1405.6473388671876,"h":93.7567367553711}', '{"z":122.9290771484375,"y":536.0631103515625,"x":-1405.9786376953126}', '{"z":121.8184814453125,"y":538.4742431640625,"x":-1412.757568359375,"h":103.07698059082031}', NULL, 0),
	(330, 'house:)', 'house', 'HighEndHouse', '{"z":102.92810821533203,"y":449.5943908691406,"x":-1942.90234375,"h":104.05770111083985}', '{"z":102.54470825195313,"y":458.9972839355469,"x":-1937.5758056640626}', '{"z":102.08419799804688,"y":461.1951599121094,"x":-1943.6541748046876,"h":86.04161834716797}', NULL, 0),
	(331, 'Huis', 'house', 'Warenhuizen', '{"z":19.8883991241455,"y":-1638.0120849609376,"x":-539.8812866210938,"h":250.984375}', '[]', '[]', 1, 1);
/*!40000 ALTER TABLE `loaf_houses` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.loaf_housing wordt geschreven
CREATE TABLE IF NOT EXISTS `loaf_housing` (
  `identifier` varchar(255) NOT NULL,
  `housedata` longtext DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.loaf_housing: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `loaf_housing` DISABLE KEYS */;
INSERT INTO `loaf_housing` (`identifier`, `housedata`) VALUES
	('cd4b446d0873d0d2943bc3bace3c55692e953516', '{"331":{"id":331,"furniture":[{"price":225,"storage":{"items":{"weed_seed":{"amount":160,"item":"weed_seed","label":"Zaadje Wiet"},"weed_pooch":{"amount":1009,"item":"weed_pooch","label":"Zakje Wiet"}},"cash":0,"weapons":[],"black_money":0},"label":"Safe 1","offset":{"h":0.0,"z":-2.4097900390625,"y":4.528564453125,"x":-9.29998779296875},"item":"prop_ld_int_safe_01"},{"price":300,"storage":{"items":[],"cash":24900,"weapons":[],"black_money":4000},"label":"Locker","offset":{"h":177.99951171875,"z":-1.8385009765625,"y":-3.9344482421875,"x":-2.55743408203125},"item":"p_cs_locker_01_s"},{"price":300,"storage":{"items":[],"cash":132200,"weapons":[],"black_money":0},"label":"Locker","offset":{"x":0.12481689453125,"z":-1.8597412109375,"y":-3.7840576171875,"h":178.9989776611328},"item":"p_cs_locker_01_s"},{"price":300,"storage":{"items":[],"cash":85760,"weapons":[],"black_money":0},"label":"Locker","offset":{"h":181.99969482421876,"z":-1.8497314453125,"y":-3.937255859375,"x":2.544921875},"item":"p_cs_locker_01_s"},{"price":300,"storage":{"items":[],"cash":0,"weapons":[],"black_money":0},"label":"Locker","offset":{"x":-2.5535888671875,"z":-1.8497314453125,"y":4.1890869140625,"h":0.0},"item":"p_cs_locker_01_s"},{"price":300,"storage":{"items":[],"cash":0,"weapons":[],"black_money":0},"label":"Locker","offset":{"h":0.0,"z":-1.8497314453125,"y":4.1956787109375,"x":2.512451171875},"item":"p_cs_locker_01_s"},{"price":300,"storage":{"items":[],"cash":0,"weapons":[],"black_money":0},"label":"Locker","offset":{"x":-0.14202880859375,"z":-1.8497314453125,"y":4.0467529296875,"h":0.0},"item":"p_cs_locker_01_s"},{"price":100,"offset":{"x":2.66815185546875,"z":-0.0079345703125,"y":-3.9879150390625,"h":0.0},"item":"prop_fib_plant_01","label":"Plant 4"},{"price":100,"offset":{"h":180.99899291992188,"z":0.1822509765625,"y":-3.865234375,"x":-2.56646728515625},"item":"prop_mr_rasberryclean","label":"Rasberry"},{"price":50,"offset":{"h":0.0,"z":0.12255859375,"y":-3.7442626953125,"x":2.37579345703125},"item":"prop_amb_beer_bottle","label":"Beer 3"},{"price":75,"offset":{"x":0.124755859375,"z":-0.0279541015625,"y":-3.8665771484375,"h":180.99899291992188},"item":"p_cs_laptop_02","label":"Laptop 2"},{"price":100,"offset":{"h":182.9992218017578,"z":0.6519775390625,"y":-4.369384765625,"x":0.13214111328125},"item":"prop_dart_bd_cab_01","label":"Dart"},{"price":100,"offset":{"x":-2.261474609375,"z":0.8621826171875,"y":-4.368408203125,"h":179.9993896484375},"item":"v_ilev_ra_doorsafe","label":"Painting"}],"shell":{"id":1,"category":"Warenhuizen"}}}');
/*!40000 ALTER TABLE `loaf_housing` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.loaf_keys wordt geschreven
CREATE TABLE IF NOT EXISTS `loaf_keys` (
  `unique_id` varchar(15) NOT NULL,
  `key_id` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `key_data` longtext DEFAULT NULL,
  PRIMARY KEY (`unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.loaf_keys: ~5 rows (ongeveer)
/*!40000 ALTER TABLE `loaf_keys` DISABLE KEYS */;
INSERT INTO `loaf_keys` (`unique_id`, `key_id`, `identifier`, `key_data`) VALUES
	('6FW789XR3vxz7B8', 'house_331', '854812e40063a2bcbbf10c29bc55296a87904f13', '{"name":"Huisesleutel (Huis) (331)","unique_id":"6FW789XR3vxz7B8","key_id":"house_331","eventname":"loaf_housing:usedKey","eventtype":"server"}'),
	('7Rgdf6CUHgS64yb', 'house_331', '8a249fe36729c5f2fe0377983d6cbd74d6590c79', '{"name":"Huisesleutel (Huis) (331)","unique_id":"7Rgdf6CUHgS64yb","key_id":"house_331","eventname":"loaf_housing:usedKey","eventtype":"server"}'),
	('94NtM89V31d722b', 'house_331', 'fd34328d7be3ef9fdf87a783b33da39ed661be53', '{"name":"Huisesleutel (Huis) (331)","unique_id":"94NtM89V31d722b","key_id":"house_331","eventname":"loaf_housing:usedKey","eventtype":"server"}'),
	('D7J50Cb8Hns533K', 'house_331', 'c0cd8109c04899c9a7dc9177531bead5cbd72bd4', '{"eventtype":"server","key_id":"house_331","unique_id":"D7J50Cb8Hns533K","name":"Huisesleutel (Huis) (331)","eventname":"loaf_housing:usedKey"}'),
	('ycC3nLLx3T9172B', 'house_331', 'cd4b446d0873d0d2943bc3bace3c55692e953516', '{"eventtype":"server","key_id":"house_331","unique_id":"ycC3nLLx3T9172B","name":"Huisesleutel (Huis) (331)","eventname":"loaf_housing:usedKey"}');
/*!40000 ALTER TABLE `loaf_keys` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.loaf_last_login wordt geschreven
CREATE TABLE IF NOT EXISTS `loaf_last_login` (
  `identifier` varchar(255) NOT NULL,
  `login_time` int(255) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.loaf_last_login: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `loaf_last_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaf_last_login` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.m3_uber_points wordt geschreven
CREATE TABLE IF NOT EXISTS `m3_uber_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.m3_uber_points: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `m3_uber_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `m3_uber_points` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.mn_policejob_aangiftes wordt geschreven
CREATE TABLE IF NOT EXISTS `mn_policejob_aangiftes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Steamnaam` varchar(50) DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `Titel` varchar(50) DEFAULT NULL,
  `aangevernaam` varchar(50) DEFAULT NULL,
  `info` varchar(300) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.mn_policejob_aangiftes: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `mn_policejob_aangiftes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_policejob_aangiftes` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.mn_policejob_bossmenu_kluis wordt geschreven
CREATE TABLE IF NOT EXISTS `mn_policejob_bossmenu_kluis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.mn_policejob_bossmenu_kluis: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `mn_policejob_bossmenu_kluis` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_policejob_bossmenu_kluis` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.mn_policejob_bossmenu_personeel wordt geschreven
CREATE TABLE IF NOT EXISTS `mn_policejob_bossmenu_personeel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `voornaam` varchar(50) NOT NULL DEFAULT '0',
  `achternaam` varchar(50) NOT NULL DEFAULT '0',
  `job` varchar(50) NOT NULL DEFAULT '0',
  `grade` varchar(50) NOT NULL DEFAULT '0',
  `profilepic` longtext DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.mn_policejob_bossmenu_personeel: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `mn_policejob_bossmenu_personeel` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_policejob_bossmenu_personeel` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.mn_policejob_inbeslagnamevoertuigen wordt geschreven
CREATE TABLE IF NOT EXISTS `mn_policejob_inbeslagnamevoertuigen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '0',
  `vehicle` longtext NOT NULL,
  `plate` varchar(50) NOT NULL DEFAULT '',
  `reden` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.mn_policejob_inbeslagnamevoertuigen: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `mn_policejob_inbeslagnamevoertuigen` DISABLE KEYS */;
/*!40000 ALTER TABLE `mn_policejob_inbeslagnamevoertuigen` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.mn_policejob_opslag wordt geschreven
CREATE TABLE IF NOT EXISTS `mn_policejob_opslag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opslag` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.mn_policejob_opslag: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `mn_policejob_opslag` DISABLE KEYS */;
INSERT INTO `mn_policejob_opslag` (`id`, `opslag`) VALUES
	(1, '[]');
/*!40000 ALTER TABLE `mn_policejob_opslag` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.owned_vehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `damages` longtext DEFAULT NULL,
  `garage` varchar(255) NOT NULL DEFAULT 'square',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.owned_vehicles: ~33 rows (ongeveer)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`, `damages`, `garage`) VALUES
	('ea3f576a5548386eff8e48025ed5f5c026c89f16', '01 TEF 7', '{"modOrnaments":-1,"modVanityPlate":-1,"modArchCover":-1,"modShifterLeavers":-1,"modDashboard":-1,"neonEnabled":[false,false,false,false],"modRightFender":-1,"modSeats":-1,"fuelLevel":59.3,"modRoof":-1,"plateIndex":0,"extras":{"2":false,"1":false},"modXenon":false,"modFrontBumper":-1,"wheels":5,"modHood":-1,"modArmor":-1,"wheelColor":5,"modTrimA":-1,"windowTint":-1,"modTransmission":-1,"bodyHealth":987.0,"modAPlate":-1,"modStruts":-1,"modTrunk":-1,"modSpoilers":-1,"modDoorSpeaker":-1,"modFrame":-1,"modTrimB":-1,"modGrille":-1,"engineHealth":831.0,"tyreSmokeColor":[255,255,255],"color1":112,"modAerials":-1,"color2":112,"modAirFilter":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"tankHealth":999.0,"modSpeakers":-1,"modBackWheels":-1,"modRearBumper":-1,"modSmokeEnabled":false,"modPlateHolder":-1,"modEngine":-1,"modHorns":-1,"modFrontWheels":-1,"modTurbo":false,"neonColor":[255,0,255],"modWindows":-1,"xenonColor":255,"modBrakes":-1,"modSideSkirt":-1,"model":-1837978521,"modLivery":0,"modSuspension":-1,"modFender":-1,"dirtLevel":11.4,"pearlescentColor":8,"modTank":-1,"modExhaust":-1,"plate":"01 TEF 7","modHydrolic":-1,"modDial":-1}', 'car', '', 1, '{"engine_health":831.0,"body_health":987.0,"burst_tires":{"2":false,"3":false,"0":false,"1":false},"wheel_rotation":{"2":0.0,"3":-0.0,"0":-0.01144552789628,"1":-0.0},"damaged_windows":{"6":true,"7":true,"10":true,"11":true,"8":true,"9":true,"12":true,"13":true,"0":false,"1":false,"2":true,"3":true,"4":true,"5":true},"broken_doors":{"0":false,"1":false,"2":false,"3":false,"4":false},"dirt_level":11.38447380065918}', 'square'),
	('303519e413d2d8d09edbacdeb32832e9f6a87973', '03 VON 2', '{"modTrimB":-1,"modWindows":-1,"modRightFender":-1,"wheels":6,"modTurbo":1,"fuelLevel":62.8,"plateIndex":0,"windowTint":1,"modTransmission":2,"modSpeakers":-1,"color2":0,"modStruts":-1,"modSteeringWheel":-1,"modSmokeEnabled":false,"modSpoilers":-1,"modAerials":-1,"modSideSkirt":-1,"color1":0,"modSuspension":-1,"modVanityPlate":-1,"neonColor":[255,0,255],"model":788045382,"modEngine":3,"bodyHealth":926.3,"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"modFrame":-1,"modSeats":-1,"engineHealth":870.6,"modBrakes":2,"wheelColor":156,"modAPlate":-1,"modLivery":0,"modAirFilter":-1,"modPlateHolder":-1,"modXenon":false,"tankHealth":990.2,"modTrimA":-1,"modOrnaments":-1,"modBackWheels":-1,"modDial":-1,"modFender":-1,"plate":"03 VON 2","modExhaust":-1,"modDashboard":-1,"modEngineBlock":-1,"pearlescentColor":0,"modHydrolic":-1,"modTank":-1,"modHood":-1,"modHorns":-1,"neonEnabled":[false,false,false,false],"dirtLevel":15.0,"modFrontWheels":-1,"modArchCover":-1,"modTrunk":-1,"xenonColor":255,"modRearBumper":-1,"modRoof":-1,"modDoorSpeaker":-1,"extras":[],"modGrille":-1,"modArmor":-1,"modFrontBumper":-1}', 'car', '', 1, '{"engine_health":870.5999755859375,"burst_tires":{"0":false,"1":false},"damaged_windows":{"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true,"11":true,"12":true,"10":true,"9":true,"13":true,"8":true,"7":true},"dirt_level":15.0,"wheel_rotation":{"0":0.0,"1":0.0},"body_health":926.2999877929688,"broken_doors":{"0":false,"1":false}}', 'square'),
	('b13b12c162404f3ac4bd2a36470118f23c755794', '07 JTF 7', '{"plate":"07 JTF 7","model":86520421}', 'car', '', 0, NULL, 'square'),
	('c9c13e5ed18c956773dd0c4dc28c02070020fe3d', '16 EPG 5', '{"modTrimB":-1,"modSpeakers":-1,"modRightFender":-1,"wheels":7,"modTurbo":1,"fuelLevel":51.3,"plateIndex":3,"modSeats":-1,"modTrunk":-1,"dirtLevel":15.0,"color2":147,"modTransmission":2,"modDashboard":-1,"modSmokeEnabled":1,"modAPlate":-1,"modWindows":-1,"modSideSkirt":-1,"modFrontWheels":0,"modSuspension":3,"modBackWheels":-1,"neonEnabled":[false,false,false,false],"modStruts":-1,"modEngine":3,"bodyHealth":925.5,"modShifterLeavers":-1,"tyreSmokeColor":[255,215,0],"modFrame":-1,"modDial":-1,"modHood":-1,"modBrakes":2,"modHydrolic":-1,"engineHealth":925.9,"modArmor":-1,"modAirFilter":-1,"model":1078682497,"modXenon":false,"tankHealth":998.9,"modTrimA":-1,"modSpoilers":0,"modArchCover":-1,"wheelColor":158,"modFender":-1,"plate":"16 EPG 5","modExhaust":1,"neonColor":[255,0,255],"modEngineBlock":-1,"pearlescentColor":0,"modGrille":-1,"modTank":-1,"modOrnaments":-1,"modHorns":0,"windowTint":1,"modVanityPlate":-1,"modPlateHolder":-1,"modFrontBumper":-1,"modSteeringWheel":-1,"xenonColor":255,"modRearBumper":-1,"modRoof":3,"modDoorSpeaker":-1,"extras":[],"modLivery":-1,"color1":103,"modAerials":-1}', 'car', '', 1, '{"engine_health":925.9345703125,"burst_tires":{"2":false,"1":false,"0":false,"3":false},"damaged_windows":{"6":true,"5":true,"4":true,"3":true,"2":true,"1":false,"0":false,"11":true,"12":true,"10":true,"13":true,"9":true,"8":true,"7":true},"dirt_level":15.0,"broken_doors":{"4":false,"3":false,"2":false,"1":false,"0":false},"body_health":925.5,"wheel_rotation":{"2":9.528358191346342e-7,"1":0.02416360750794,"0":9.528358191346342e-7,"3":9.528358191346342e-7}}', 'square'),
	('65824048d1d2a80583facb81b7531e3b478a2217', '16 TTO 3', '{"plate":"16 TTO 3","model":-1842748181}', 'car', '', 0, NULL, 'square'),
	('cd4b446d0873d0d2943bc3bace3c55692e953516', '18 EDX 3', '{"modFender":-1,"modHorns":-1,"modBrakes":-1,"color1":1,"windowTint":-1,"modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"modTransmission":-1,"plate":"18 EDX 3","modFrontBumper":-1,"modWindows":-1,"bodyHealth":976.7,"modStruts":-1,"wheels":6,"modRightFender":-1,"modAirFilter":-1,"modSpeakers":-1,"modSteeringWheel":-1,"modTrimB":-1,"wheelColor":156,"plateIndex":0,"modSpoilers":-1,"modHydrolic":-1,"modTank":-1,"modPlateHolder":-1,"modExhaust":-1,"dirtLevel":15.0,"modLivery":-1,"modSmokeEnabled":false,"xenonColor":255,"modFrame":-1,"tyreSmokeColor":[255,255,255],"modGrille":-1,"modAerials":-1,"modRoof":-1,"engineHealth":931.0,"pearlescentColor":5,"fuelLevel":85.3,"modDoorSpeaker":-1,"tankHealth":989.2,"modShifterLeavers":-1,"modAPlate":-1,"color2":38,"modSideSkirt":-1,"modHood":-1,"modTrimA":-1,"extras":[],"model":86520421,"modRearBumper":-1,"modOrnaments":-1,"modTrunk":-1,"modVanityPlate":-1,"modSeats":-1,"neonEnabled":[false,false,false,false],"modArchCover":-1,"modSuspension":-1,"modBackWheels":-1,"neonColor":[255,0,255],"modDial":-1,"modXenon":false,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 1, '{"damaged_windows":{"0":true,"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"12":true,"13":true,"10":true,"11":true,"9":true,"8":true},"wheel_rotation":{"0":0.0,"1":-0.00000100000011},"burst_tires":{"0":false,"1":false},"body_health":976.6629638671875,"dirt_level":15.0,"engine_health":930.990966796875,"broken_doors":{"0":false,"1":false}}', 'Stadion'),
	('d997b95b329a56b97fc059f6a5ed81984d7a8fda', '19 AJO 6', '{"neonEnabled":[false,false,false,false],"modHood":-1,"modGrille":-1,"modTurbo":false,"modArchCover":-1,"engineHealth":1000.0,"plateIndex":3,"plate":"19 AJO 6","modDoorSpeaker":-1,"modSeats":-1,"modWindows":-1,"modXenon":false,"modFrame":-1,"modPlateHolder":-1,"modTrimA":-1,"modAPlate":-1,"modSteeringWheel":-1,"modExhaust":-1,"tankHealth":1000.0,"modSideSkirt":-1,"modTransmission":-1,"modFrontBumper":-1,"modAirFilter":-1,"modFender":-1,"modSuspension":-1,"modSpeakers":-1,"neonColor":[255,0,255],"modTank":-1,"wheelColor":27,"modTrimB":-1,"modHydrolic":-1,"modRearBumper":-1,"wheels":6,"modDial":-1,"modRightFender":-1,"xenonColor":255,"color1":150,"modShifterLeavers":-1,"modSpoilers":-1,"modEngineBlock":-1,"modHorns":-1,"modStruts":-1,"modArmor":-1,"modVanityPlate":-1,"modBackWheels":-1,"bodyHealth":1000.0,"modDashboard":-1,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"modBrakes":-1,"model":-114291515,"modTrunk":-1,"modLivery":-1,"modSmokeEnabled":false,"extras":[],"modEngine":-1,"modFrontWheels":-1,"windowTint":1,"color2":150,"pearlescentColor":143,"modRoof":-1,"fuelLevel":59.9,"dirtLevel":7.8,"modAerials":-1}', 'car', '', 0, '{"body_health":1000.0,"broken_doors":{"0":false,"1":false},"dirt_level":7.77274894714355,"engine_health":1000.0,"burst_tires":{"0":false,"1":false},"damaged_windows":{"4":true,"3":true,"6":true,"5":true,"0":true,"2":true,"1":true,"10":true,"11":true,"12":true,"8":true,"7":true,"13":true,"9":true},"wheel_rotation":{"0":0.0,"1":0.0}}', 'UWV'),
	('468d8e859dd395e754354ed19318802f51777054', '22 NEL 1', '{"modSmokeEnabled":false,"modHood":-1,"modBrakes":-1,"color2":38,"tyreSmokeColor":[255,255,255],"modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"color1":1,"plate":"22 NEL 1","modFrontBumper":-1,"modTurbo":false,"bodyHealth":997.0,"modStruts":-1,"wheels":6,"modTransmission":-1,"modAirFilter":-1,"modSpeakers":-1,"windowTint":-1,"modTrimB":-1,"wheelColor":156,"plateIndex":0,"neonEnabled":[false,false,false,false],"tankHealth":998.5,"modHorns":-1,"modRoof":-1,"modExhaust":-1,"dirtLevel":15.0,"modLivery":-1,"modSteeringWheel":-1,"xenonColor":255,"modFrame":-1,"modTrunk":-1,"modGrille":-1,"modAerials":-1,"modFender":-1,"engineHealth":990.4,"pearlescentColor":5,"fuelLevel":59.8,"modDoorSpeaker":-1,"modSuspension":-1,"modWindows":-1,"modSpoilers":-1,"modVanityPlate":-1,"modSideSkirt":-1,"modPlateHolder":-1,"modSeats":-1,"extras":[],"model":390201602,"modRearBumper":-1,"modOrnaments":-1,"modAPlate":-1,"modHydrolic":-1,"modRightFender":-1,"modShifterLeavers":-1,"modArchCover":-1,"modXenon":false,"modBackWheels":-1,"neonColor":[255,0,255],"modDial":-1,"modTrimA":-1,"modEngineBlock":-1,"modDashboard":-1,"modTank":-1}', 'car', '', 0, '{"body_health":997.0,"burst_tires":{"0":false,"1":false},"wheel_rotation":{"0":0.0,"1":-0.0},"broken_doors":{"0":false,"1":false},"dirt_level":15.0,"damaged_windows":{"0":true,"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"12":true,"13":true,"10":true,"11":true,"9":true,"8":true},"engine_health":990.3999633789063}', 'square'),
	('6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '26 VMR 4', '{"modTank":-1,"modSpoilers":-1,"modBrakes":-1,"color2":4,"modHydrolic":-1,"modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"plateIndex":0,"plate":"26 VMR 4","modFrontBumper":-1,"modTrunk":-1,"bodyHealth":1000.0,"modStruts":-1,"wheels":1,"modTransmission":-1,"modAirFilter":-1,"modSpeakers":-1,"extras":{"1":false},"modTrimB":-1,"wheelColor":156,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modDial":-1,"modHorns":-1,"modPlateHolder":-1,"modExhaust":-1,"dirtLevel":13.9,"windowTint":-1,"modRoof":-1,"xenonColor":255,"modFrame":-1,"modAPlate":-1,"modGrille":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"engineHealth":1000.0,"pearlescentColor":5,"fuelLevel":27.3,"modDoorSpeaker":-1,"modTrimA":-1,"modWindows":-1,"modShifterLeavers":-1,"modSeats":-1,"modSideSkirt":-1,"modSuspension":-1,"modFender":-1,"modXenon":false,"model":699456151,"modRearBumper":-1,"modOrnaments":-1,"modRightFender":-1,"modVanityPlate":-1,"modHood":-1,"modLivery":-1,"modArchCover":-1,"tankHealth":1000.0,"modBackWheels":-1,"neonColor":[255,0,255],"modSmokeEnabled":false,"color1":0,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 1, '{"body_health":1000.0,"burst_tires":{"0":false,"1":false,"2":false,"3":false},"engine_health":1000.0,"broken_doors":{"0":true,"1":false,"2":false,"3":false,"4":false,"5":false,"6":false},"dirt_level":13.88290977478027,"damaged_windows":{"0":true,"1":false,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"12":true,"13":true,"10":true,"11":true,"9":true,"8":true},"wheel_rotation":{"0":0.0,"1":-0.0,"2":0.0,"3":-0.0}}', 'Bank'),
	('1f674e9d75b5acedf835f213c7e0517bf9007baf', '34 ZWA 8', '{"neonEnabled":[false,false,false,false],"modFrontBumper":-1,"modGrille":-1,"modTurbo":false,"modArchCover":-1,"engineHealth":653.0,"tyreSmokeColor":[255,255,255],"plate":"34 ZWA 8","modShifterLeavers":-1,"modHorns":-1,"modHydrolic":-1,"modXenon":false,"modWindows":-1,"windowTint":-1,"modTrimA":-1,"modAPlate":-1,"modFrontWheels":-1,"modTrunk":-1,"tankHealth":998.3,"modAerials":-1,"modTransmission":-1,"modEngine":-1,"wheelColor":156,"modFender":-1,"modSuspension":-1,"dirtLevel":9.7,"plateIndex":0,"modTank":-1,"modDoorSpeaker":-1,"modDial":-1,"modAirFilter":-1,"modRearBumper":-1,"wheels":1,"modVanityPlate":-1,"modRightFender":-1,"fuelLevel":59.9,"neonColor":[255,0,255],"modHood":-1,"modSpoilers":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"modSeats":-1,"modArmor":-1,"modStruts":-1,"modBackWheels":-1,"bodyHealth":982.7,"modDashboard":-1,"modOrnaments":-1,"color1":1,"modBrakes":-1,"model":-1205801634,"modSpeakers":-1,"modLivery":-1,"modSmokeEnabled":false,"modTrimB":-1,"xenonColor":255,"extras":[],"modPlateHolder":-1,"color2":0,"pearlescentColor":6,"modRoof":-1,"modFrame":-1,"modExhaust":-1,"modSideSkirt":-1}', 'car', '', 1, '{"body_health":982.7445678710938,"broken_doors":{"4":false,"3":false,"0":false,"2":false,"1":false},"dirt_level":9.73870658874511,"engine_health":652.9915771484375,"burst_tires":{"0":false,"3":false,"2":false,"1":false},"damaged_windows":{"4":true,"3":true,"6":true,"12":true,"0":false,"2":true,"13":true,"10":true,"11":true,"1":false,"8":true,"7":true,"5":true,"9":true},"wheel_rotation":{"0":-0.01983804628252,"3":-0.0,"2":0.0,"1":-0.0}}', 'square'),
	('6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '35 JQH 1', '{"modTank":-1,"modSpoilers":-1,"modBrakes":-1,"color2":34,"modHydrolic":-1,"modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"plateIndex":0,"plate":"35 JQH 1","modFrontBumper":-1,"modTrunk":-1,"bodyHealth":948.7,"modStruts":-1,"wheels":6,"modTransmission":-1,"modAirFilter":-1,"modSpeakers":-1,"extras":[],"modTrimB":-1,"wheelColor":156,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modDial":-1,"modHorns":-1,"modPlateHolder":-1,"modExhaust":-1,"dirtLevel":15.0,"windowTint":-1,"modRoof":-1,"xenonColor":255,"modFrame":-1,"modAPlate":-1,"modGrille":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"engineHealth":882.2,"pearlescentColor":138,"fuelLevel":64.4,"modDoorSpeaker":-1,"modTrimA":-1,"modWindows":-1,"modShifterLeavers":-1,"modSeats":-1,"modSideSkirt":-1,"modSuspension":-1,"modFender":-1,"modXenon":false,"model":741090084,"modRearBumper":-1,"modOrnaments":-1,"modRightFender":-1,"modVanityPlate":-1,"modHood":-1,"modLivery":-1,"modArchCover":-1,"tankHealth":972.8,"modBackWheels":-1,"neonColor":[255,0,255],"modSmokeEnabled":false,"color1":30,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 0, '{"body_health":948.7382202148438,"burst_tires":{"0":false,"1":false},"engine_health":882.1776733398438,"broken_doors":{"0":false,"1":false},"dirt_level":15.0,"damaged_windows":{"0":true,"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"12":true,"13":true,"10":true,"11":true,"9":true,"8":true},"wheel_rotation":{"0":0.0,"1":-0.0}}', 'DWNMRijschool'),
	('f76c1500479ad81ea2e626f607078f8dbac39e0b', '35 RHW 3', '{"model":86520421,"plate":"35 RHW 3"}', 'car', '', 0, NULL, 'square'),
	('f76c1500479ad81ea2e626f607078f8dbac39e0b', '36 OKN 6', '{"modTrunk":-1,"modPlateHolder":-1,"modBrakes":-1,"color2":4,"tyreSmokeColor":[255,255,255],"modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"modShifterLeavers":-1,"plate":"36 OKN 6","modFrontBumper":-1,"modSpoilers":-1,"bodyHealth":1000.0,"modStruts":-1,"wheels":1,"modRightFender":-1,"modAirFilter":-1,"modSpeakers":-1,"modLivery":-1,"modTrimB":-1,"wheelColor":156,"plateIndex":1,"neonEnabled":[false,false,false,false],"modTank":-1,"modSuspension":-1,"modRoof":-1,"modExhaust":-1,"dirtLevel":6.5,"windowTint":-1,"modAPlate":-1,"xenonColor":255,"modFrame":-1,"modHorns":-1,"modGrille":-1,"modAerials":-1,"modSteeringWheel":-1,"engineHealth":1000.0,"pearlescentColor":5,"fuelLevel":68.4,"modDoorSpeaker":-1,"modSeats":-1,"modWindows":-1,"modTransmission":-1,"modDial":-1,"modSideSkirt":-1,"modXenon":false,"color1":0,"extras":{"1":false},"model":699456151,"modRearBumper":-1,"modOrnaments":-1,"modBackWheels":-1,"modVanityPlate":-1,"modHydrolic":-1,"tankHealth":1000.0,"modArchCover":-1,"modTrimA":-1,"modHood":-1,"neonColor":[255,0,255],"modSmokeEnabled":false,"modFender":-1,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 1, '{"burst_tires":{"0":false,"1":false,"2":false,"3":false},"engine_health":1000.0,"damaged_windows":{"0":false,"1":false,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"8":true,"9":true,"10":true,"11":true,"13":true,"12":true},"broken_doors":{"0":false,"1":false,"2":false,"3":false,"4":false,"5":false,"6":false},"dirt_level":6.5210165977478,"body_health":1000.0,"wheel_rotation":{"0":0.0,"1":-0.0,"2":0.0,"3":-0.0}}', 'Haven'),
	('6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '39 CGL 8', '{"modRightFender":-1,"modVanityPlate":-1,"modBrakes":-1,"color2":112,"modSmokeEnabled":false,"modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"color1":112,"plate":"39 CGL 8","modFrontBumper":-1,"modWindows":-1,"bodyHealth":989.0,"modStruts":-1,"wheels":5,"modFender":-1,"modAirFilter":-1,"modSpeakers":-1,"modTank":-1,"modTrimB":-1,"wheelColor":5,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modTransmission":-1,"modHorns":-1,"modPlateHolder":-1,"modExhaust":-1,"dirtLevel":15.0,"modLivery":2,"modRoof":-1,"xenonColor":255,"modFrame":-1,"plateIndex":0,"modGrille":-1,"modAerials":-1,"extras":{"2":false,"1":false},"engineHealth":876.2,"pearlescentColor":8,"fuelLevel":43.7,"modDoorSpeaker":-1,"tankHealth":998.9,"modShifterLeavers":-1,"windowTint":-1,"modAPlate":-1,"modSideSkirt":-1,"modTrimA":-1,"tyreSmokeColor":[255,255,255],"modXenon":false,"model":-1837978521,"modRearBumper":-1,"modOrnaments":-1,"modBackWheels":-1,"modHydrolic":-1,"modTrunk":-1,"modSeats":-1,"modArchCover":-1,"modSpoilers":-1,"modHood":-1,"neonColor":[255,0,255],"modDial":-1,"modSuspension":-1,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 1, '{"damaged_windows":{"0":false,"1":false,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"12":true,"13":true,"10":true,"11":true,"9":true,"8":true},"burst_tires":{"0":false,"1":false,"2":false,"3":false},"engine_health":876.1802978515625,"body_health":989.0195922851563,"dirt_level":15.0,"broken_doors":{"0":false,"1":false,"2":false,"3":false,"4":false},"wheel_rotation":{"0":0.0,"1":-0.0,"2":0.0,"3":-0.0}}', 'SandySuper'),
	('bba5a10878001eaf23160ade255dbc1d4bae03b7', '47 ARR 3', '{"xenonColor":255,"modVanityPlate":-1,"modArchCover":-1,"modShifterLeavers":-1,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modSuspension":-1,"windowTint":-1,"fuelLevel":43.5,"tankHealth":999.9,"modAPlate":-1,"extras":{"1":false},"modXenon":false,"modFrontBumper":-1,"wheels":1,"modEngine":-1,"plateIndex":3,"modLivery":-1,"modTrimA":-1,"tyreSmokeColor":[255,255,255],"wheelColor":156,"neonColor":[255,0,255],"modDashboard":-1,"modBrakes":-1,"modTrunk":-1,"modSeats":-1,"modDoorSpeaker":-1,"modFrame":-1,"modTrimB":-1,"modGrille":-1,"engineHealth":991.8,"modOrnaments":-1,"modPlateHolder":-1,"bodyHealth":999.2,"color1":0,"modAirFilter":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"modSpeakers":-1,"modStruts":-1,"modTurbo":false,"dirtLevel":15.0,"modFrontWheels":-1,"model":699456151,"modBackWheels":-1,"modHorns":-1,"modArmor":-1,"modTransmission":-1,"modAerials":-1,"modWindows":-1,"modSmokeEnabled":false,"modRightFender":-1,"modHood":-1,"modSideSkirt":-1,"color2":4,"modRoof":-1,"modFender":-1,"modTank":-1,"pearlescentColor":5,"modRearBumper":-1,"modExhaust":-1,"plate":"47 ARR 3","modHydrolic":-1,"modDial":-1}', 'car', '', 0, '{"engine_health":991.771240234375,"body_health":999.1771240234375,"burst_tires":{"2":false,"3":false,"0":false,"1":false},"wheel_rotation":{"2":0.0,"3":-0.0,"0":0.0,"1":-0.0},"damaged_windows":{"6":true,"7":true,"8":true,"9":true,"13":true,"10":true,"11":true,"12":true,"0":false,"1":false,"2":true,"3":true,"4":true,"5":true},"broken_doors":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"dirt_level":15.0}', 'SandySuper'),
	('3157a97dab0f65d1f3dea42b965f26db876b9e43', '48 HGV 4', '{"bodyHealth":1000.0,"modVanityPlate":-1,"modArchCover":-1,"modShifterLeavers":-1,"modDashboard":-1,"neonEnabled":[false,false,false,false],"modRightFender":-1,"engineHealth":1000.0,"fuelLevel":65.0,"modAirFilter":-1,"modHorns":-1,"extras":{"1":false,"2":false,"3":false,"4":false,"5":false},"tyreSmokeColor":[255,255,255],"modFrontBumper":-1,"wheels":0,"modEngine":3,"modArmor":-1,"color2":8,"modTrimA":-1,"modSpoilers":0,"modSuspension":3,"modOrnaments":-1,"plateIndex":1,"xenonColor":255,"modTrunk":-1,"modXenon":false,"modDoorSpeaker":-1,"modFrame":0,"modTrimB":-1,"modGrille":-1,"modFrontWheels":-1,"modBackWheels":-1,"modLivery":-1,"modTurbo":1,"color1":8,"modSeats":0,"modEngineBlock":-1,"modSteeringWheel":6,"modSpeakers":-1,"modPlateHolder":-1,"windowTint":-1,"modBrakes":2,"tankHealth":1000.0,"modStruts":-1,"modTank":-1,"dirtLevel":12.2,"wheelColor":156,"modTransmission":2,"neonColor":[255,255,255],"modWindows":-1,"modRearBumper":-1,"modAPlate":-1,"model":-2018557295,"modSideSkirt":0,"modHood":-1,"modRoof":-1,"modFender":-1,"modAerials":-1,"pearlescentColor":134,"modSmokeEnabled":false,"modExhaust":1,"plate":"48 HGV 4","modHydrolic":-1,"modDial":2}', 'car', '', 1, '{"body_health":1000.0,"wheel_rotation":{"2":0.0,"3":-0.0,"0":0.0,"1":-0.0},"burst_tires":{"2":false,"3":false,"0":false,"1":false},"engine_health":1000.0,"damaged_windows":{"6":true,"7":true,"10":true,"11":true,"8":true,"9":true,"13":true,"12":true,"0":false,"1":false,"2":false,"3":false,"4":true,"5":true},"broken_doors":{"6":false,"0":false,"1":false,"2":false,"3":false,"4":false,"5":false},"dirt_level":12.20340061187744}', 'UWV'),
	('303519e413d2d8d09edbacdeb32832e9f6a87973', '50 IEW 9', '{"modHorns":-1,"color1":15,"modBrakes":2,"color2":8,"tankHealth":1000.0,"modArmor":-1,"modFrontWheels":-1,"modEngine":3,"modPlateHolder":-1,"modTrunk":-1,"modFrontBumper":-1,"modDial":-1,"bodyHealth":999.8,"modStruts":-1,"wheels":0,"modTransmission":2,"modAirFilter":-1,"modSpeakers":-1,"modHydrolic":-1,"modTrimB":-1,"wheelColor":156,"plateIndex":3,"modSpoilers":0,"modLivery":-1,"modSteeringWheel":-1,"modRoof":-1,"modExhaust":-1,"dirtLevel":2.2,"windowTint":1,"modXenon":false,"xenonColor":255,"modFrame":-1,"modHood":-1,"modGrille":-1,"modAerials":-1,"modSeats":-1,"engineHealth":997.5,"pearlescentColor":134,"fuelLevel":79.6,"modDoorSpeaker":-1,"tyreSmokeColor":[255,255,255],"modShifterLeavers":-1,"plate":"50 IEW 9","modFender":-1,"modSideSkirt":-1,"modTurbo":1,"modRightFender":-1,"extras":{"1":false,"2":true,"3":false,"4":false,"5":false},"model":-2018557295,"modRearBumper":-1,"modOrnaments":-1,"modWindows":-1,"modVanityPlate":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modArchCover":-1,"modTrimA":-1,"modBackWheels":-1,"neonColor":[255,0,255],"modSmokeEnabled":false,"modSuspension":2,"modEngineBlock":-1,"modDashboard":-1,"modTank":-1}', 'car', '', 1, '{"engine_health":997.5,"wheel_rotation":{"0":0.0,"1":-0.0,"2":0.0,"3":-0.0},"burst_tires":{"0":false,"1":false,"2":false,"3":false},"broken_doors":{"0":false,"1":false,"2":false,"3":false,"4":false,"5":false,"6":false},"dirt_level":2.19403147697448,"body_health":999.75,"damaged_windows":{"0":false,"1":false,"2":false,"3":false,"4":true,"5":true,"6":true,"7":true,"8":true,"13":true,"10":true,"11":true,"12":true,"9":true}}', 'Strand2'),
	('6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '50 OPP 0', '{"modTank":-1,"modSpoilers":-1,"modBrakes":-1,"color2":1,"modHydrolic":-1,"modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"plateIndex":0,"plate":"50 OPP 0","modFrontBumper":-1,"modTrunk":-1,"bodyHealth":972.6,"modStruts":-1,"wheels":1,"modTransmission":-1,"modAirFilter":-1,"modSpeakers":-1,"extras":{"8":true,"9":false,"2":true,"3":true,"4":true,"5":true,"1":false},"modTrimB":-1,"wheelColor":156,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modDial":-1,"modHorns":-1,"modPlateHolder":-1,"modExhaust":-1,"dirtLevel":15.0,"windowTint":-1,"modRoof":-1,"xenonColor":255,"modFrame":-1,"modAPlate":-1,"modGrille":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"engineHealth":365.0,"pearlescentColor":1,"fuelLevel":20.9,"modDoorSpeaker":-1,"modTrimA":-1,"modWindows":-1,"modShifterLeavers":-1,"modSeats":-1,"modSideSkirt":-1,"modSuspension":-1,"modFender":-1,"modXenon":false,"model":1475773103,"modRearBumper":-1,"modOrnaments":-1,"modRightFender":-1,"modVanityPlate":-1,"modHood":-1,"modLivery":-1,"modArchCover":-1,"tankHealth":750.0,"modBackWheels":-1,"neonColor":[255,0,255],"modSmokeEnabled":false,"color1":105,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 1, '{"body_health":972.5850830078125,"burst_tires":{"0":false,"1":false,"2":false,"3":false},"engine_health":365.0,"broken_doors":{"0":false,"1":false,"2":false,"3":false,"4":false,"5":false,"6":false},"dirt_level":15.0,"damaged_windows":{"0":false,"1":false,"2":false,"3":false,"4":true,"5":true,"6":true,"7":true,"12":true,"13":true,"10":true,"11":true,"9":true,"8":true},"wheel_rotation":{"0":0.0,"1":-0.0,"2":0.0,"3":0.00336109404452}}', 'BenzinePompPolato'),
	('ac90d3decdf0304869352296bd3eda2e234bb869', '54 UDT 6', '{"modTrimB":-1,"modLivery":5,"neonColor":[153,0,153],"wheels":1,"modTurbo":1,"fuelLevel":50.5,"modDial":6,"wheelColor":88,"modTransmission":2,"modSpeakers":-1,"color2":25,"modBrakes":2,"modDashboard":-1,"modSmokeEnabled":1,"modSpoilers":-1,"modSeats":-1,"modSideSkirt":-1,"modWindows":-1,"modSuspension":-1,"modBackWheels":-1,"modHydrolic":4,"model":-1361687965,"modEngine":3,"bodyHealth":1000.0,"modShifterLeavers":-1,"tyreSmokeColor":[153,0,153],"modArmor":-1,"color1":142,"modFrame":-1,"windowTint":1,"modOrnaments":17,"modSteeringWheel":0,"modStruts":-1,"modAirFilter":0,"modAPlate":-1,"modXenon":1,"tankHealth":1000.0,"modTrimA":-1,"modRightFender":1,"modArchCover":-1,"dirtLevel":0.1,"modFender":-1,"plate":"54 UDT 6","modExhaust":0,"plateIndex":2,"modEngineBlock":3,"pearlescentColor":120,"modVanityPlate":12,"modTank":0,"modTrunk":5,"modHorns":5,"modPlateHolder":9,"neonEnabled":[1,1,1,1],"modFrontWheels":-1,"engineHealth":1000.0,"modHood":1,"xenonColor":255,"modRearBumper":0,"modRoof":-1,"modDoorSpeaker":-1,"extras":{"2":false,"1":false,"3":true},"modGrille":-1,"modFrontBumper":0,"modAerials":-1}', 'car', '', 1, '{"engine_health":1000.0,"burst_tires":{"2":false,"1":false,"0":false,"3":false},"damaged_windows":{"6":true,"5":true,"4":true,"3":true,"2":true,"1":false,"0":false,"11":true,"12":true,"10":true,"9":true,"13":true,"8":true,"7":true},"dirt_level":0.09345384687185,"body_health":1000.0,"wheel_rotation":{"2":0.0,"1":-0.0,"0":0.0,"3":-0.0},"broken_doors":{"4":false,"3":false,"2":false,"1":false,"0":false}}', 'square'),
	('a26f419014de3c0f1dc60e310b4e363bcaf060d3', '57 MFW 6', '{"neonEnabled":[false,false,false,false],"windowTint":-1,"modShifterLeavers":-1,"modTurbo":false,"modArchCover":-1,"engineHealth":911.7,"modHydrolic":-1,"plate":"57 MFW 6","modSpeakers":-1,"modHorns":-1,"xenonColor":255,"modXenon":false,"modFrontWheels":-1,"modDashboard":-1,"modTrimA":-1,"modAPlate":-1,"modSteeringWheel":-1,"modSeats":-1,"tankHealth":998.9,"modPlateHolder":-1,"modTransmission":-1,"modStruts":-1,"wheelColor":156,"modFender":-1,"modExhaust":-1,"dirtLevel":15.0,"neonColor":[255,0,255],"modTank":-1,"modHood":-1,"modDial":-1,"model":1475773103,"extras":{"4":true,"3":true,"5":true,"8":true,"1":true,"2":true,"9":false},"wheels":1,"modGrille":-1,"modRightFender":-1,"modAirFilter":-1,"modFrontBumper":-1,"color1":0,"modSpoilers":-1,"modEngineBlock":-1,"modSideSkirt":-1,"modRearBumper":-1,"modArmor":-1,"modVanityPlate":-1,"modBackWheels":-1,"bodyHealth":993.5,"modWindows":-1,"modOrnaments":-1,"fuelLevel":43.0,"modBrakes":-1,"modDoorSpeaker":-1,"modTrimB":-1,"modLivery":-1,"modSmokeEnabled":false,"modSuspension":-1,"plateIndex":0,"tyreSmokeColor":[255,255,255],"modTrunk":-1,"color2":1,"pearlescentColor":1,"modRoof":-1,"modFrame":-1,"modEngine":-1,"modAerials":-1}', 'car', '', 1, '{"body_health":993.4713745117188,"broken_doors":{"4":false,"3":false,"6":false,"5":false,"0":false,"2":false,"1":false},"dirt_level":15.0,"engine_health":911.6915283203125,"burst_tires":{"0":false,"3":false,"2":false,"1":false},"damaged_windows":{"4":true,"10":true,"6":true,"5":true,"0":false,"2":true,"1":false,"13":true,"11":true,"12":true,"8":true,"7":true,"3":false,"9":true},"wheel_rotation":{"0":-0.00389700732193,"3":-0.0,"2":-0.00537411542609,"1":-0.0}}', 'square'),
	('f76c1500479ad81ea2e626f607078f8dbac39e0b', '61 NRB 3', '{"color2":112,"modHood":-1,"modBrakes":-1,"color1":112,"plate":"61 NRB 3","modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"modAPlate":-1,"modTrunk":-1,"modFrontBumper":-1,"modHydrolic":-1,"bodyHealth":997.5,"modStruts":-1,"wheels":5,"modHorns":-1,"modAirFilter":-1,"modSpeakers":-1,"modTransmission":-1,"modTrimB":-1,"wheelColor":5,"plateIndex":0,"neonEnabled":[false,false,false,false],"modFender":-1,"modTrimA":-1,"modPlateHolder":-1,"modExhaust":-1,"dirtLevel":15.0,"modLivery":1,"modRoof":-1,"xenonColor":255,"modFrame":-1,"modSteeringWheel":-1,"modGrille":-1,"modAerials":-1,"modSmokeEnabled":false,"engineHealth":967.1,"pearlescentColor":8,"fuelLevel":62.4,"modDoorSpeaker":-1,"tankHealth":999.5,"modShifterLeavers":-1,"modRightFender":-1,"modSuspension":-1,"modSideSkirt":-1,"windowTint":-1,"modSeats":-1,"extras":{"2":false,"1":true},"model":-1837978521,"modRearBumper":-1,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1,"modXenon":false,"modWindows":-1,"modArchCover":-1,"modTank":-1,"modBackWheels":-1,"neonColor":[255,0,255],"modDial":-1,"modSpoilers":-1,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 1, '{"damaged_windows":{"0":false,"1":false,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true},"wheel_rotation":{"0":0.0,"1":-0.0,"2":0.0,"3":-0.0},"engine_health":967.0693359375,"broken_doors":{"0":false,"1":false,"2":false,"3":false,"4":false},"dirt_level":15.0,"burst_tires":{"0":false,"1":false,"2":false,"3":false},"body_health":997.5}', 'square'),
	('fd34328d7be3ef9fdf87a783b33da39ed661be53', '64 NXI 4', '{"plate":"64 NXI 4","model":86520421}', 'car', '', 0, NULL, 'square'),
	('8a249fe36729c5f2fe0377983d6cbd74d6590c79', '69 JQM 8', '{"modTrimB":-1,"modOrnaments":-1,"neonColor":[255,0,255],"wheels":6,"modTurbo":1,"fuelLevel":60.6,"modDial":-1,"modRightFender":-1,"modTrunk":-1,"dirtLevel":15.0,"color2":2,"modWindows":-1,"modPlateHolder":-1,"modSmokeEnabled":false,"modAPlate":-1,"neonEnabled":[false,false,false,false],"modSideSkirt":-1,"modVanityPlate":-1,"modSuspension":-1,"modGrille":-1,"modFrontWheels":-1,"model":86520421,"modEngine":3,"modSeats":-1,"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"modFrame":-1,"modArmor":-1,"modArchCover":-1,"windowTint":1,"color1":19,"modDashboard":-1,"modSpeakers":-1,"modAirFilter":-1,"plateIndex":0,"modXenon":false,"tankHealth":995.2,"modTrimA":-1,"bodyHealth":984.3,"modBackWheels":-1,"modHood":-1,"modFender":-1,"plate":"69 JQM 8","modExhaust":-1,"modStruts":-1,"modEngineBlock":-1,"pearlescentColor":5,"engineHealth":969.2,"modTank":-1,"wheelColor":156,"modHorns":-1,"modSteeringWheel":-1,"modSpoilers":-1,"modTransmission":2,"modHydrolic":-1,"modBrakes":2,"xenonColor":255,"modRearBumper":-1,"modRoof":-1,"modDoorSpeaker":-1,"extras":[],"modLivery":1,"modFrontBumper":-1,"modAerials":-1}', 'car', '', 1, '{"engine_health":969.15625,"burst_tires":{"0":false,"1":false},"damaged_windows":{"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true,"11":true,"12":true,"10":true,"13":true,"9":true,"8":true,"7":true},"dirt_level":15.0,"body_health":984.3092041015625,"broken_doors":{"0":false,"1":false},"wheel_rotation":{"0":0.0,"1":-0.00000100000011}}', 'BenzinePompPolato'),
	('b13b12c162404f3ac4bd2a36470118f23c755794', '76 HRE 9', '{"modTrimB":-1,"modVanityPlate":-1,"modRightFender":-1,"wheels":6,"modTurbo":false,"fuelLevel":15.7,"plateIndex":0,"modFender":-1,"modTransmission":-1,"modSpeakers":-1,"color2":88,"modStruts":-1,"modDashboard":-1,"modSmokeEnabled":false,"modSpoilers":-1,"dirtLevel":7.2,"modSideSkirt":-1,"color1":88,"modSuspension":-1,"modSteeringWheel":-1,"modAerials":-1,"model":1672195559,"modEngine":-1,"modSeats":-1,"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"modFrame":-1,"modBrakes":-1,"modOrnaments":-1,"windowTint":-1,"modHydrolic":-1,"modPlateHolder":-1,"modDial":-1,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"modXenon":false,"tankHealth":995.0,"modTrimA":-1,"pearlescentColor":88,"modBackWheels":-1,"modWindows":-1,"wheelColor":156,"plate":"76 HRE 9","modExhaust":-1,"modFrontWheels":-1,"modEngineBlock":-1,"modHood":-1,"bodyHealth":912.2,"modTank":-1,"engineHealth":329.5,"modHorns":-1,"modAPlate":-1,"neonColor":[255,0,255],"modLivery":-1,"modArmor":-1,"modArchCover":-1,"xenonColor":255,"modRearBumper":-1,"modRoof":-1,"modDoorSpeaker":-1,"extras":{"1":true,"4":true,"9":true},"modGrille":-1,"modTrunk":-1,"modFrontBumper":-1}', 'car', '', 0, '{"engine_health":329.5240173339844,"burst_tires":{"0":false,"1":false},"damaged_windows":{"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true,"11":true,"12":true,"10":true,"13":true,"9":true,"8":true,"7":true},"dirt_level":7.19676733016967,"body_health":912.2318115234375,"broken_doors":{"0":false,"1":false},"wheel_rotation":{"0":0.0,"1":0.0}}', 'square'),
	('893ffc926e30d183fb9d6b3240942e09bca081a3', '76 JQG 0', '{"model":-1361687965,"plate":"76 JQG 0"}', 'car', '', 0, NULL, 'square'),
	('87b22c3823eca7892d62ccfd05086dac866d510c', '76 OXU 3', '{"neonEnabled":[false,false,false,false],"color1":105,"modShifterLeavers":-1,"modTurbo":false,"modSteeringWheel":-1,"engineHealth":865.8,"modEngine":-1,"plate":"76 OXU 3","modHorns":-1,"modSeats":-1,"modDoorSpeaker":-1,"modXenon":false,"modAerials":-1,"wheelColor":156,"modTrimA":-1,"tyreSmokeColor":[255,255,255],"modArchCover":-1,"modWindows":-1,"modHydrolic":-1,"modTrimB":-1,"modTransmission":-1,"modAirFilter":-1,"modFrontBumper":-1,"modFender":-1,"modRearBumper":-1,"dirtLevel":15.0,"plateIndex":0,"modTank":-1,"modExhaust":-1,"modPlateHolder":-1,"extras":{"4":true,"3":true,"5":true,"8":true,"9":false,"2":true,"1":true},"modGrille":-1,"wheels":1,"tankHealth":998.6,"modRightFender":-1,"modDial":-1,"modTrunk":-1,"modAPlate":-1,"modSpoilers":-1,"modEngineBlock":-1,"modSuspension":-1,"modHood":-1,"modArmor":-1,"modStruts":-1,"modBackWheels":-1,"bodyHealth":985.5,"modDashboard":-1,"modOrnaments":-1,"modFrontWheels":-1,"modBrakes":-1,"model":1475773103,"modSpeakers":-1,"modLivery":-1,"modSmokeEnabled":false,"neonColor":[255,0,255],"modVanityPlate":-1,"xenonColor":255,"windowTint":-1,"color2":1,"pearlescentColor":1,"modRoof":-1,"fuelLevel":40.5,"modFrame":-1,"modSideSkirt":-1}', 'car', '', 0, '{"wheel_rotation":{"0":0.0,"3":-0.0,"2":0.0,"1":-0.0},"broken_doors":{"4":false,"3":false,"6":false,"5":false,"0":false,"2":false,"1":false},"dirt_level":15.0,"engine_health":865.7667236328125,"burst_tires":{"0":false,"3":false,"2":false,"1":false},"damaged_windows":{"4":true,"10":true,"11":true,"5":true,"0":true,"2":false,"13":true,"12":true,"1":false,"3":false,"8":true,"7":true,"6":true,"9":true},"body_health":985.485107421875}', 'BenzinePompPolato'),
	('b0f52bbad39871f886445279437163b33ecaaa81', '81 SUT 1', '{"color2":0,"modFrontBumper":-1,"modBrakes":-1,"modFender":-1,"neonColor":[255,0,255],"modLivery":0,"modFrontWheels":-1,"plateIndex":3,"modTrimA":-1,"wheelColor":156,"color1":0,"windowTint":-1,"modXenon":false,"wheels":6,"modTurbo":false,"engineHealth":364.7,"modArmor":-1,"modFrame":-1,"modDial":-1,"modSpeakers":-1,"modTransmission":-1,"modHorns":-1,"xenonColor":255,"modRoof":-1,"modRearBumper":-1,"modHood":-1,"modVanityPlate":-1,"modTank":-1,"plate":"81 SUT 1","fuelLevel":58.1,"dirtLevel":15.0,"modTrunk":-1,"model":788045382,"modStruts":-1,"modDoorSpeaker":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"pearlescentColor":0,"modShifterLeavers":-1,"modSuspension":-1,"modEngine":-1,"modSeats":-1,"modSmokeEnabled":false,"modGrille":-1,"modWindows":-1,"modOrnaments":-1,"modRightFender":-1,"modAirFilter":-1,"modAPlate":-1,"tankHealth":948.9,"modBackWheels":-1,"modTrimB":-1,"modPlateHolder":-1,"neonEnabled":[false,false,false,false],"tyreSmokeColor":[255,255,255],"modArchCover":-1,"modSpoilers":-1,"modHydrolic":-1,"modAerials":-1,"bodyHealth":837.4,"modExhaust":-1,"modDashboard":-1,"extras":[]}', 'car', '', 0, '{"body_health":837.43212890625,"engine_health":364.65869140625,"damaged_windows":{"9":true,"11":true,"1":true,"0":true,"3":true,"2":true,"5":true,"4":true,"7":true,"6":true,"10":true,"8":true,"12":true,"13":true},"wheel_rotation":{"1":0.0,"0":0.0},"burst_tires":{"1":false,"0":false},"dirt_level":15.0,"broken_doors":{"1":false,"0":false}}', 'DWNMRijschool'),
	('c0cd8109c04899c9a7dc9177531bead5cbd72bd4', '88 WEE 2', '{"plate":"88 WEE 2","model":86520421}', 'car', '', 0, NULL, 'square'),
	('d1491d84201f9f3677b8a564300dc0d906188f74', '89 DPZ 0', '{"modStruts":-1,"modVanityPlate":-1,"modArchCover":-1,"modShifterLeavers":-1,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modLivery":-1,"modTurbo":false,"fuelLevel":96.3,"modHood":-1,"plateIndex":4,"modPlateHolder":-1,"modXenon":false,"modFrontBumper":-1,"wheels":6,"modEngine":-1,"modArmor":-1,"modBackWheels":-1,"modTrimA":-1,"modFrontWheels":-1,"modRearBumper":-1,"modOrnaments":-1,"modAirFilter":-1,"modSpeakers":-1,"modTrunk":-1,"color2":34,"modDoorSpeaker":-1,"modFrame":-1,"modTrimB":-1,"modGrille":-1,"engineHealth":1000.0,"modAerials":-1,"tyreSmokeColor":[255,255,255],"modSeats":-1,"color1":34,"modBrakes":-1,"modAPlate":-1,"modSteeringWheel":-1,"wheelColor":0,"xenonColor":255,"modSuspension":-1,"tankHealth":1000.0,"dirtLevel":15.0,"modTransmission":-1,"modDashboard":-1,"modHorns":-1,"plate":"89 DPZ 0","modTank":-1,"neonColor":[255,0,255],"modWindows":-1,"modSmokeEnabled":false,"model":-1453280962,"bodyHealth":1000.0,"modSideSkirt":-1,"windowTint":-1,"modRoof":-1,"modFender":-1,"modEngineBlock":-1,"pearlescentColor":34,"extras":[],"modExhaust":-1,"modRightFender":-1,"modHydrolic":-1,"modDial":-1}', 'car', '', 1, '{"body_health":1000.0,"wheel_rotation":{"0":0.0,"1":0.0},"burst_tires":{"0":false,"1":false},"engine_health":1000.0,"damaged_windows":{"6":true,"7":true,"10":true,"11":true,"12":true,"8":true,"9":true,"13":true,"0":true,"1":true,"2":true,"3":true,"4":true,"5":true},"broken_doors":{"0":false,"1":false},"dirt_level":15.0}', 'square'),
	('854812e40063a2bcbbf10c29bc55296a87904f13', '89 RGU 2', '{"wheelColor":156,"modVanityPlate":-1,"modStruts":-1,"modShifterLeavers":-1,"modDashboard":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modRoof":-1,"fuelLevel":81.7,"bodyHealth":903.0,"modXenon":false,"extras":[],"tyreSmokeColor":[255,255,255],"modFrontBumper":-1,"wheels":6,"modEngine":-1,"modArmor":-1,"model":-1523428744,"modTrimA":-1,"engineHealth":848.0,"modSpoilers":-1,"modSmokeEnabled":false,"plate":"89 RGU 2","modSpeakers":-1,"modTrunk":-1,"modPlateHolder":-1,"modDoorSpeaker":-1,"windowTint":-1,"modTrimB":-1,"modGrille":-1,"modFrontWheels":-1,"modOrnaments":-1,"modAirFilter":-1,"modHorns":-1,"color1":33,"modLivery":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"tankHealth":976.0,"color2":5,"modBrakes":-1,"modRearBumper":-1,"modFrame":-1,"modHood":-1,"modTurbo":false,"dirtLevel":15.0,"plateIndex":0,"modBackWheels":-1,"neonColor":[255,0,255],"modWindows":-1,"xenonColor":255,"modTank":-1,"modTransmission":-1,"modSideSkirt":-1,"modAerials":-1,"modSuspension":-1,"modFender":-1,"modSeats":-1,"pearlescentColor":39,"modArchCover":-1,"modExhaust":-1,"modRightFender":-1,"modHydrolic":-1,"modDial":-1}', 'car', '', 1, '{"damaged_windows":{"6":true,"7":true,"8":true,"9":true,"13":true,"12":true,"10":true,"11":true,"0":true,"1":true,"2":true,"3":true,"4":true,"5":true},"wheel_rotation":{"0":0.0,"1":-9.999999974752428e-7},"burst_tires":{"0":false,"1":false},"body_health":903.0,"engine_health":848.0,"broken_doors":{"0":false,"1":false},"dirt_level":15.0}', 'Stadion'),
	('8c001bcdd122e455f5f4e750b4db42fdf5d99871', '95 CNW 9', '{"modTrimB":-1,"modVanityPlate":-1,"neonColor":[255,0,255],"wheels":6,"modTurbo":false,"fuelLevel":67.0,"modDial":-1,"modTrunk":-1,"modTransmission":-1,"dirtLevel":8.8,"color2":26,"model":1491277511,"modDashboard":-1,"modSmokeEnabled":false,"modSpoilers":-1,"modFrontWheels":-1,"modSideSkirt":-1,"modWindows":-1,"modSuspension":-1,"bodyHealth":1000.0,"modAPlate":-1,"modStruts":-1,"modEngine":-1,"modSeats":-1,"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"modFrame":-1,"modPlateHolder":-1,"color1":0,"modBrakes":-1,"modOrnaments":-1,"modArmor":-1,"modSpeakers":-1,"modAirFilter":-1,"windowTint":-1,"modXenon":false,"tankHealth":1000.0,"modTrimA":-1,"modBackWheels":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"wheelColor":33,"plate":"95 CNW 9","modExhaust":-1,"modHood":-1,"modEngineBlock":-1,"pearlescentColor":27,"modGrille":-1,"modTank":-1,"modAerials":-1,"modHorns":-1,"modHydrolic":-1,"modFender":-1,"modSteeringWheel":-1,"plateIndex":0,"modRightFender":-1,"xenonColor":255,"modRearBumper":-1,"modRoof":-1,"modDoorSpeaker":-1,"extras":[],"modLivery":-1,"engineHealth":1000.0,"modFrontBumper":-1}', 'car', '', 1, '{"engine_health":1000.0,"burst_tires":{"0":false,"1":false},"damaged_windows":{"6":true,"5":true,"4":true,"3":true,"2":true,"1":true,"0":true,"11":true,"12":true,"10":true,"13":true,"9":true,"8":true,"7":true},"dirt_level":8.76699161529541,"body_health":1000.0,"wheel_rotation":{"0":0.0,"1":-0.0},"broken_doors":{"0":false,"1":false}}', 'square'),
	('f76c1500479ad81ea2e626f607078f8dbac39e0b', '95 NVO 6', '{"color2":1,"modHood":-1,"modBrakes":-1,"color1":12,"plate":"95 NVO 6","modArmor":-1,"modFrontWheels":-1,"modEngine":-1,"modAPlate":-1,"modTrunk":-1,"modFrontBumper":-1,"modHydrolic":-1,"bodyHealth":994.5,"modStruts":-1,"wheels":1,"modHorns":-1,"modAirFilter":-1,"modSpeakers":-1,"modTransmission":-1,"modTrimB":-1,"wheelColor":156,"plateIndex":0,"neonEnabled":[false,false,false,false],"modFender":-1,"modTrimA":-1,"modPlateHolder":-1,"modExhaust":-1,"dirtLevel":15.0,"modLivery":-1,"modRoof":-1,"xenonColor":255,"modFrame":-1,"modSteeringWheel":-1,"modGrille":-1,"modAerials":-1,"modSmokeEnabled":false,"engineHealth":823.2,"pearlescentColor":1,"fuelLevel":64.6,"modDoorSpeaker":-1,"tankHealth":997.2,"modShifterLeavers":-1,"modRightFender":-1,"modSuspension":-1,"modSideSkirt":-1,"windowTint":-1,"modSeats":-1,"extras":{"8":true,"9":false,"2":true,"3":true,"4":true,"5":true,"1":true},"model":1475773103,"modRearBumper":-1,"modOrnaments":-1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1,"modXenon":false,"modWindows":-1,"modArchCover":-1,"modTank":-1,"modBackWheels":-1,"neonColor":[255,0,255],"modDial":-1,"modSpoilers":-1,"modEngineBlock":-1,"modDashboard":-1,"modTurbo":false}', 'car', '', 1, '{"damaged_windows":{"0":false,"1":false,"2":false,"3":false,"4":true,"5":true,"6":true,"7":true,"8":true,"9":true,"10":true,"11":true,"12":true,"13":true},"wheel_rotation":{"0":0.0,"1":-0.0,"2":0.0,"3":-0.0},"engine_health":823.17578125,"broken_doors":{"0":false,"1":false,"2":false,"3":false,"4":false,"5":false,"6":false},"dirt_level":15.0,"burst_tires":{"0":false,"1":false,"2":false,"3":false},"body_health":994.4743041992188}', 'BenzinePompPolato'),
	('623ca025b6fc4a2c376e80fb01c060f6f151d266', '95 RSN 8', '{"plate":"95 RSN 8","model":1753414259}', 'car', '', 0, NULL, 'square');
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_app_chat wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dumpen data van tabel middelveenv2.phone_app_chat: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_blockednumber wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_blockednumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `hex` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.phone_blockednumber: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `phone_blockednumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_blockednumber` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_calls wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- Dumpen data van tabel middelveenv2.phone_calls: ~34 rows (ongeveer)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
INSERT INTO `phone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
	(122, '2058532', '2089294', 1, '2022-03-03 13:17:46', 0),
	(123, '2089294', '2058532', 0, '2022-03-03 13:17:46', 0),
	(124, '2089294', '2058532', 1, '2022-03-03 14:22:08', 1),
	(125, '2058532', '2089294', 0, '2022-03-03 14:22:08', 1),
	(126, '2058532', '2089294', 1, '2022-03-03 14:22:36', 0),
	(127, '2089294', '2058532', 0, '2022-03-03 14:22:36', 0),
	(128, '2089294', '2058532', 1, '2022-03-03 14:22:45', 1),
	(129, '2058532', '2089294', 0, '2022-03-03 14:22:45', 1),
	(130, '2089294', '2058532', 1, '2022-03-03 14:22:55', 1),
	(131, '2058532', '2089294', 0, '2022-03-03 14:22:55', 1),
	(132, '2058532', '2089294', 1, '2022-03-03 14:23:12', 0),
	(133, '2089294', '2058532', 0, '2022-03-03 14:23:12', 0),
	(134, '2058532', '2089294', 1, '2022-03-03 14:23:31', 1),
	(135, '2089294', '2058532', 0, '2022-03-03 14:23:31', 1),
	(136, '2089294', '2058532', 1, '2022-03-03 14:27:57', 0),
	(137, '2058532', '2089294', 0, '2022-03-03 14:27:57', 0),
	(138, '5963073', '5519500', 1, '2022-03-03 21:36:09', 0),
	(139, '5519500', '5963073', 0, '2022-03-03 21:36:09', 0),
	(140, '9990386', '5519500', 1, '2022-03-03 21:36:19', 0),
	(141, '5519500', '9990386', 0, '2022-03-03 21:36:19', 0),
	(142, '9903594', '4742492', 1, '2022-03-04 19:36:52', 1),
	(143, '4742492', '9903594', 0, '2022-03-04 19:36:52', 1),
	(144, '2089294', '2058532', 1, '2022-03-04 21:42:06', 1),
	(145, '2058532', '2089294', 0, '2022-03-04 21:42:06', 1),
	(146, '2089294', '2058532', 1, '2022-03-04 21:42:20', 0),
	(147, '2058532', '2089294', 0, '2022-03-04 21:42:20', 0),
	(148, '2058532', '2089294', 1, '2022-03-04 21:45:48', 1),
	(149, '2089294', '2058532', 0, '2022-03-04 21:45:48', 1),
	(150, '2058532', '2089294', 1, '2022-03-05 12:31:12', 1),
	(151, '2089294', '2058532', 0, '2022-03-05 12:31:12', 1),
	(152, '2089294', '2058532', 1, '2022-03-05 12:35:47', 1),
	(153, '2058532', '2089294', 0, '2022-03-05 12:35:47', 1),
	(154, '2089294', '2058532', 1, '2022-03-05 12:42:37', 0),
	(155, '2058532', '2089294', 0, '2022-03-05 12:42:37', 0);
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_ch_reddit wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_ch_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpen data van tabel middelveenv2.phone_ch_reddit: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `phone_ch_reddit` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_ch_reddit` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_gallery wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex` varchar(255) NOT NULL,
  `image` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.phone_gallery: ~2 rows (ongeveer)
/*!40000 ALTER TABLE `phone_gallery` DISABLE KEYS */;
INSERT INTO `phone_gallery` (`id`, `hex`, `image`, `time`) VALUES
	(110, 'f76c1500479ad81ea2e626f607078f8dbac39e0b', 'https://media.discordapp.net/attachments/936578696255512596/948924939883393074/screenshot.jpeg', '2022-03-03 13:48:57'),
	(111, 'f76c1500479ad81ea2e626f607078f8dbac39e0b', 'https://media.discordapp.net/attachments/936578696255512596/949370006897041408/screenshot.jpeg', '2022-03-04 19:17:30');
/*!40000 ALTER TABLE `phone_gallery` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_gps wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_gps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex` varchar(255) NOT NULL,
  `nott` longtext DEFAULT NULL,
  `gps` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.phone_gps: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `phone_gps` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_gps` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_messages wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- Dumpen data van tabel middelveenv2.phone_messages: 98 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
INSERT INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
	(106, 'police', '2571044', 'Hallo!', '2022-02-23 21:54:58', 1, 1),
	(107, 'police', '2571044', 'Hallo', '2022-02-23 21:55:28', 1, 1),
	(108, 'ambulance', '2571044', 'Hallo!', '2022-02-23 21:58:31', 1, 1),
	(109, 'ambulance', '2571044', 'Hoe gaat het', '2022-02-23 21:58:38', 1, 1),
	(110, 'ambulance', '2571044', 'Hallo', '2022-02-23 22:01:01', 1, 1),
	(111, 'ambulance', '2571044', 'Hallo', '2022-02-23 22:03:18', 1, 1),
	(112, 'ambulance', '2571044', 'hfdbyhf', '2022-02-23 22:03:55', 1, 1),
	(113, 'ambulance', '2571044', 'Hallo', '2022-02-23 22:11:42', 1, 1),
	(114, 'mechanic', '2571044', 'Hallo!', '2022-02-24 20:59:51', 1, 1),
	(115, 'mechanic', '2571044', 'Hallo!', '2022-02-24 21:07:03', 1, 1),
	(116, 'ambulance', '2571044', 'Test', '2022-02-24 21:08:03', 1, 1),
	(117, 'police', '2571044', 'Hallo', '2022-02-24 21:08:25', 1, 1),
	(118, 'police', '2571044', 'Hallo', '2022-02-24 21:11:03', 1, 1),
	(119, 'ambulance', '2571044', '#2571044 : test', '2022-02-24 21:11:12', 1, 0),
	(120, 'ambulance', '2571044', 'test', '2022-02-24 21:11:12', 1, 1),
	(121, 'mechanic', '2571044', '#2571044 : Test', '2022-02-24 21:11:24', 1, 0),
	(122, 'mechanic', '2571044', 'Test', '2022-02-24 21:11:24', 1, 1),
	(123, 'police', '2571044', 'Hallo', '2022-02-24 21:25:03', 1, 1),
	(124, 'police', '2571044', '#2571044 : Hallo!', '2022-02-24 21:31:17', 1, 0),
	(125, 'police', '2571044', 'Hallo!', '2022-02-24 21:31:17', 1, 1),
	(126, 'mechanic', '6532989', '#5963073 : Kan er iemand van de anwb deze kant op komen om dit voertuig mee te nemen mvg politie', '2022-03-02 20:14:22', 1, 0),
	(127, 'mechanic', '4742492', '#5963073 : Kan er iemand van de anwb deze kant op komen om dit voertuig mee te nemen mvg politie', '2022-03-02 20:14:22', 1, 0),
	(128, 'mechanic', '5963073', 'Kan er iemand van de anwb deze kant op komen om dit voertuig mee te nemen mvg politie', '2022-03-02 20:14:22', 1, 1),
	(129, 'mechanic', '6532989', '#5963073 : GPS: 35.313293457031, -1368.9265136719', '2022-03-02 20:14:24', 1, 0),
	(130, 'mechanic', '4742492', '#5963073 : GPS: 35.313293457031, -1368.9265136719', '2022-03-02 20:14:24', 1, 0),
	(131, 'mechanic', '5963073', 'GPS: 35.313293457031, -1368.9265136719', '2022-03-02 20:14:24', 1, 1),
	(132, 'police', '9990386', '#6187194 : Medische aandacht vereist: bewusteloze burger! 1366.666015625, 192.74264526367', '2022-03-02 21:36:05', 1, 0),
	(133, 'police', '6919433', '#6187194 : Medische aandacht vereist: bewusteloze burger! 1366.666015625, 192.74264526367', '2022-03-02 21:36:05', 1, 0),
	(134, 'police', '7321533', '#6187194 : Medische aandacht vereist: bewusteloze burger! 1366.666015625, 192.74264526367', '2022-03-02 21:36:05', 1, 0),
	(135, 'police', '3849304', '#6187194 : Medische aandacht vereist: bewusteloze burger! 1366.666015625, 192.74264526367', '2022-03-02 21:36:05', 1, 0),
	(136, '2058532', '2089294', 'FAKA G:smiling_face_with_heart_eyes:', '2022-03-03 12:23:19', 1, 0),
	(137, '2089294', '2058532', 'FAKA G:smiling_face_with_heart_eyes:', '2022-03-03 12:23:19', 1, 1),
	(138, '2058532', '2089294', 'https://media.discordapp.net/attachments/936578696255512596/948924939883393074/screenshot.jpeg', '2022-03-03 13:49:11', 1, 0),
	(139, '2089294', '2058532', 'https://media.discordapp.net/attachments/936578696255512596/948924939883393074/screenshot.jpeg', '2022-03-03 13:49:11', 1, 1),
	(140, '2058532', '2089294', 'VIES KLOTZAK:pile_of_poo:', '2022-03-03 14:21:51', 1, 0),
	(141, '2089294', '2058532', 'VIES KLOTZAK:pile_of_poo:', '2022-03-03 14:21:51', 1, 1),
	(142, 'police', '3849304', '#7933746 : Medische aandacht vereist: bewusteloze burger! 305.42788696289, -380.60360717773', '2022-03-03 15:11:15', 1, 0),
	(143, 'police', '5418151', '#7933746 : Medische aandacht vereist: bewusteloze burger! 305.42788696289, -380.60360717773', '2022-03-03 15:11:15', 1, 0),
	(144, 'police', '5963073', '#7933746 : Medische aandacht vereist: bewusteloze burger! 305.42788696289, -380.60360717773', '2022-03-03 15:11:15', 1, 0),
	(145, 'police', '9990386', '#9903594 : Medische aandacht vereist: bewusteloze burger! 1656.9445800781, 1296.1318359375', '2022-03-03 20:45:37', 1, 0),
	(146, 'police', '5418151', '#9903594 : Medische aandacht vereist: bewusteloze burger! 1656.9445800781, 1296.1318359375', '2022-03-03 20:45:37', 1, 0),
	(147, 'police', '5963073', '#9903594 : Medische aandacht vereist: bewusteloze burger! 1656.9445800781, 1296.1318359375', '2022-03-03 20:45:37', 1, 0),
	(148, 'police', '7321533', '#9903594 : Medische aandacht vereist: bewusteloze burger! 1656.9445800781, 1296.1318359375', '2022-03-03 20:45:37', 1, 0),
	(149, 'police', '9990386', '#2089294 : Medische aandacht vereist: bewusteloze burger! 178.2409362793, -1376.6727294922', '2022-03-03 21:01:22', 1, 0),
	(150, 'police', '5418151', '#2089294 : Medische aandacht vereist: bewusteloze burger! 178.2409362793, -1376.6727294922', '2022-03-03 21:01:22', 1, 0),
	(151, 'police', '5963073', '#2089294 : Medische aandacht vereist: bewusteloze burger! 178.2409362793, -1376.6727294922', '2022-03-03 21:01:22', 1, 0),
	(152, 'police', '7321533', '#2089294 : Medische aandacht vereist: bewusteloze burger! 178.2409362793, -1376.6727294922', '2022-03-03 21:01:22', 1, 0),
	(153, 'ambulance', '5105865', '#2089294 : Medische aandacht vereist: bewusteloze burger! 178.2409362793, -1376.6727294922', '2022-03-03 21:01:22', 1, 0),
	(154, 'police', '9990386', '#5519500 : thijs is een lieve ginger', '2022-03-03 21:35:42', 1, 0),
	(155, 'police', '5963073', '#5519500 : thijs is een lieve ginger', '2022-03-03 21:35:42', 1, 0),
	(156, 'police', '7321533', '#5519500 : thijs is een lieve ginger', '2022-03-03 21:35:42', 1, 0),
	(157, 'police', '5519500', 'thijs is een lieve ginger', '2022-03-03 21:35:42', 1, 1),
	(158, '9990386', '5519500', 'Hallo', '2022-03-03 21:36:03', 1, 0),
	(159, '5519500', '9990386', 'Hallo', '2022-03-03 21:36:03', 1, 1),
	(160, 'police', '3849304', '#2089294 : Medische aandacht vereist: bewusteloze burger! 250.00256347656, 487.77951049805', '2022-03-04 12:30:21', 1, 0),
	(161, 'police', '3632598', '#2089294 : Medische aandacht vereist: bewusteloze burger! 250.00256347656, 487.77951049805', '2022-03-04 12:30:21', 1, 0),
	(162, '9903594', '4742492', '.', '2022-03-04 19:36:39', 1, 0),
	(163, '4742492', '9903594', '.', '2022-03-04 19:36:39', 1, 1),
	(164, '4742492', '9903594', 'Dikzuiger', '2022-03-04 19:36:51', 1, 0),
	(165, '9903594', '4742492', 'Dikzuiger', '2022-03-04 19:36:51', 1, 1),
	(166, 'mechanic', '4287109', '#2058532 : GPS: -29.995244979858, -985.31463623047', '2022-03-04 20:19:03', 1, 0),
	(167, 'mechanic', '9903594', '#2058532 : GPS: -29.995244979858, -985.31463623047', '2022-03-04 20:19:03', 1, 0),
	(168, 'mechanic', '2058532', 'GPS: -29.995244979858, -985.31463623047', '2022-03-04 20:19:03', 1, 1),
	(169, 'mechanic', '4287109', '#2058532 : hele auto total los door agent en heb nu hulp nodig', '2022-03-04 20:19:21', 1, 0),
	(170, 'mechanic', '9903594', '#2058532 : hele auto total los door agent en heb nu hulp nodig', '2022-03-04 20:19:21', 1, 0),
	(171, 'mechanic', '2058532', 'hele auto total los door agent en heb nu hulp nodig', '2022-03-04 20:19:21', 1, 1),
	(172, '2058532', '2089294', 'https://media.discordapp.net/attachments/936578696255512596/949393124168437850/screenshot.jpeg', '2022-03-04 20:49:20', 1, 0),
	(173, '2089294', '2058532', 'https://media.discordapp.net/attachments/936578696255512596/949393124168437850/screenshot.jpeg', '2022-03-04 20:49:20', 1, 1),
	(174, '2089294', '2058532', 'GPS: 0.0, 0.0', '2022-03-04 21:41:49', 1, 0),
	(175, '2058532', '2089294', 'GPS: 0.0, 0.0', '2022-03-04 21:41:49', 1, 1),
	(176, '2058532', '2089294', 'wat is er', '2022-03-04 21:42:16', 1, 0),
	(177, '2089294', '2058532', 'wat is er', '2022-03-04 21:42:16', 1, 1),
	(178, '2089294', '2058532', 'ben ge unbanned', '2022-03-04 21:42:36', 1, 0),
	(179, '2058532', '2089294', 'ben ge unbanned', '2022-03-04 21:42:36', 1, 1),
	(180, '2058532', '2089294', 'nice', '2022-03-04 21:42:45', 1, 0),
	(181, '2089294', '2058532', 'nice', '2022-03-04 21:42:45', 1, 1),
	(182, '2089294', '2058532', 'ik ga nu die suv kopen', '2022-03-04 21:43:31', 1, 0),
	(183, '2058532', '2089294', 'ik ga nu die suv kopen', '2022-03-04 21:43:31', 1, 1),
	(184, '2058532', '2089294', 'lekker ik ga 2300 coke verpakken', '2022-03-04 21:44:01', 1, 0),
	(185, '2089294', '2058532', 'lekker ik ga 2300 coke verpakken', '2022-03-04 21:44:01', 1, 1),
	(186, '2089294', '2058532', 'isg', '2022-03-04 21:44:18', 1, 0),
	(187, '2058532', '2089294', 'isg', '2022-03-04 21:44:18', 1, 1),
	(188, '2058532', '2089294', 'zorg dat hij gaat rijden dan rij ik hem aan:beaming_face_with_smiling_eyes:', '2022-03-05 12:33:31', 1, 0),
	(189, '2089294', '2058532', 'zorg dat hij gaat rijden dan rij ik hem aan:beaming_face_with_smiling_eyes:', '2022-03-05 12:33:31', 1, 1),
	(190, '2089294', '2058532', 'isg', '2022-03-05 12:33:46', 1, 0),
	(191, '2058532', '2089294', 'isg', '2022-03-05 12:33:46', 1, 1),
	(192, '2058532', '2089294', 'stuur gps', '2022-03-05 12:36:25', 1, 0),
	(193, '2089294', '2058532', 'stuur gps', '2022-03-05 12:36:25', 1, 1),
	(194, '2089294', '2058532', 'GPS: 125.88333129883, -1309.1909179688', '2022-03-05 12:36:34', 1, 0),
	(195, '2058532', '2089294', 'GPS: 125.88333129883, -1309.1909179688', '2022-03-05 12:36:34', 1, 1),
	(196, '2058532', '2089294', 'wat', '2022-03-05 12:42:45', 1, 0),
	(197, '2089294', '2058532', 'wat', '2022-03-05 12:42:45', 1, 1),
	(198, '2089294', '2058532', 'kom oortje', '2022-03-05 12:43:00', 1, 0),
	(199, '2058532', '2089294', 'kom oortje', '2022-03-05 12:43:00', 1, 1),
	(200, '2089294', '2058532', 'ik ga plukken', '2022-03-05 12:43:08', 1, 0),
	(201, '2058532', '2089294', 'ik ga plukken', '2022-03-05 12:43:08', 1, 1),
	(202, '2058532', '2089294', 'dadelijl', '2022-03-05 12:43:09', 1, 0),
	(203, '2089294', '2058532', 'dadelijl', '2022-03-05 12:43:09', 1, 1);
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_news wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex` varchar(50) DEFAULT NULL,
  `haber` longtext DEFAULT NULL,
  `baslik` longtext DEFAULT NULL,
  `resim` longtext DEFAULT NULL,
  `video` longtext DEFAULT NULL,
  `zaman` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpen data van tabel middelveenv2.phone_news: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `phone_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_news` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_reddit wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) DEFAULT NULL,
  `reditsage` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpen data van tabel middelveenv2.phone_reddit: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `phone_reddit` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_reddit` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_settings wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex` varchar(255) NOT NULL,
  `app` longtext NOT NULL,
  `crypto` longtext NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.phone_settings: ~60 rows (ongeveer)
/*!40000 ALTER TABLE `phone_settings` DISABLE KEYS */;
INSERT INTO `phone_settings` (`id`, `hex`, `app`, `crypto`) VALUES
	(26, '1884df4db1128ba239a00566272091bc6e4b8404', '[{"name":{"inMenuApps":false,"routeName":"twitter.splash","active":false,"name":"Twitter","icons":"static/img/icons_app/twitter.png"}},{"name":{"inMenuApps":true,"routeName":"bankb","active":false,"name":"Bank","icons":"static/img/icons_app/banco.png"}},{"name":{"inMenuApps":true,"routeName":"tchat","active":true,"name":"Dark Chat","icons":"static/img/icons_app/tchat.png"}},{"name":{"inMenuApps":true,"routeName":"yellowpages","active":false,"name":"Yellow Pages","icons":"static/img/icons/yellow.png"}},{"name":{"inMenuApps":true,"routeName":"faturaslash","active":false,"name":"Bills","icons":"static/img/icons/logo.png"}},{"name":{"inMenuApps":true,"routeName":"haberlerslplash","active":false,"name":"News","icons":"static/img/2048/haber.png"}},{"name":{"inMenuApps":true,"routeName":"you","active":false,"name":"YouTube","icons":"static/img/youtubeicon.png"}},{"name":{"inMenuApps":true,"routeName":"instagramslash","active":false,"name":"Instagram","icons":"static/img/icons/instagram.png"}},{"name":{"inMenuApps":true,"routeName":"reddit","active":false,"name":"Reddit","icons":"static/img/icons_app/reddit.png"}},{"name":{"inMenuApps":false,"routeName":"marketslsh","active":false,"name":"Market","icons":"static/img/icons_app/market.png"}},{"name":{"inMenuApps":false,"routeName":"vale","active":false,"name":"Vale","icons":"static/img/icons_app/vale.png"}},{"name":{"inMenuApps":false,"routeName":"uberb","active":false,"name":"Uber","icons":"static/img/icons_app/uber.png"}},{"name":{"inMenuApps":false,"routeName":"wan","active":false,"name":"Wanted","icons":"static/img/icons_app/wanted.png"}},{"name":{"inMenuApps":true,"routeName":"tetris","active":false,"name":"Tetris","icons":"static/img/icons_app/games.png"}},{"name":{"inMenuApps":true,"routeName":"gps","active":false,"name":"GPS","icons":"static/img/icons/maps.png"}},{"name":{"inMenuApps":true,"routeName":"borsaa","active":false,"name":"Borsa","icons":"static/img/icons/stocks.png"}},{"name":{"inMenuApps":true,"routeName":"radio","active":false,"name":"Radio","icons":"static/img/icons/music.png"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(27, 'fd34328d7be3ef9fdf87a783b33da39ed661be53', '[{"name":{"icons":"static/img/icons_app/twitter.png","routeName":"twitter.splash","name":"Twitter","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/banco.png","routeName":"bankb","name":"Bank","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons_app/tchat.png","routeName":"tchat","name":"Dark Chat","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons/yellow.png","routeName":"yellowpages","name":"Yellow Pages","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons/logo.png","routeName":"faturaslash","name":"Bills","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/2048/haber.png","routeName":"haberlerslplash","name":"News","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/youtubeicon.png","routeName":"you","name":"YouTube","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons/instagram.png","routeName":"instagramslash","name":"Instagram","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons_app/reddit.png","routeName":"reddit","name":"Reddit","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons_app/market.png","routeName":"marketslsh","name":"Market","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/vale.png","routeName":"vale","name":"Vale","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/uber.png","routeName":"uberb","name":"Uber","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/wanted.png","routeName":"wan","name":"Wanted","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/games.png","routeName":"tetris","name":"Tetris","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons/maps.png","routeName":"gps","name":"GPS","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons/stocks.png","routeName":"borsaa","name":"Borsa","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons/music.png","routeName":"radio","name":"Radio","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(28, '657e2d16859a7e5655c7a00cc0395177479a38e3', '[{"name":{"icons":"static/img/icons_app/twitter.png","name":"Twitter","inMenuApps":false,"routeName":"twitter.splash","active":false}},{"name":{"icons":"static/img/icons_app/banco.png","name":"Bank","inMenuApps":true,"routeName":"bankb","active":false}},{"name":{"icons":"static/img/icons_app/tchat.png","name":"Dark Chat","inMenuApps":true,"routeName":"tchat","active":false}},{"name":{"icons":"static/img/icons/yellow.png","name":"Yellow Pages","inMenuApps":true,"routeName":"yellowpages","active":false}},{"name":{"icons":"static/img/icons/logo.png","name":"Bills","inMenuApps":true,"routeName":"faturaslash","active":false}},{"name":{"icons":"static/img/2048/haber.png","name":"News","inMenuApps":true,"routeName":"haberlerslplash","active":false}},{"name":{"icons":"static/img/youtubeicon.png","name":"YouTube","inMenuApps":true,"routeName":"you","active":false}},{"name":{"icons":"static/img/icons/instagram.png","name":"Instagram","inMenuApps":true,"routeName":"instagramslash","active":false}},{"name":{"icons":"static/img/icons_app/reddit.png","name":"Reddit","inMenuApps":true,"routeName":"reddit","active":false}},{"name":{"icons":"static/img/icons_app/market.png","name":"Market","inMenuApps":false,"routeName":"marketslsh","active":false}},{"name":{"icons":"static/img/icons_app/vale.png","name":"Vale","inMenuApps":false,"routeName":"vale","active":false}},{"name":{"icons":"static/img/icons_app/uber.png","name":"Uber","inMenuApps":false,"routeName":"uberb","active":false}},{"name":{"icons":"static/img/icons_app/wanted.png","name":"Wanted","inMenuApps":false,"routeName":"wan","active":false}},{"name":{"icons":"static/img/icons_app/games.png","name":"Tetris","inMenuApps":true,"routeName":"tetris","active":false}},{"name":{"icons":"static/img/icons/maps.png","name":"GPS","inMenuApps":true,"routeName":"gps","active":false}},{"name":{"icons":"static/img/icons/stocks.png","name":"Borsa","inMenuApps":true,"routeName":"borsaa","active":false}},{"name":{"icons":"static/img/icons/music.png","name":"Radio","inMenuApps":true,"routeName":"radio","active":false}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(29, 'e90064e044b389ea7862e96828f837d36e8ad1d3', '[{"name":{"active":false,"icons":"static/img/icons_app/twitter.png","name":"Twitter","routeName":"twitter.splash","inMenuApps":false}},{"name":{"active":false,"icons":"static/img/icons_app/banco.png","name":"Bank","routeName":"bankb","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons_app/tchat.png","name":"Dark Chat","routeName":"tchat","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons/yellow.png","name":"Yellow Pages","routeName":"yellowpages","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons/logo.png","name":"Bills","routeName":"faturaslash","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/2048/haber.png","name":"News","routeName":"haberlerslplash","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/youtubeicon.png","name":"YouTube","routeName":"you","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons/instagram.png","name":"Instagram","routeName":"instagramslash","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons_app/reddit.png","name":"Reddit","routeName":"reddit","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons_app/market.png","name":"Market","routeName":"marketslsh","inMenuApps":false}},{"name":{"active":false,"icons":"static/img/icons_app/vale.png","name":"Vale","routeName":"vale","inMenuApps":false}},{"name":{"active":false,"icons":"static/img/icons_app/uber.png","name":"Uber","routeName":"uberb","inMenuApps":false}},{"name":{"active":false,"icons":"static/img/icons_app/wanted.png","name":"Wanted","routeName":"wan","inMenuApps":false}},{"name":{"active":false,"icons":"static/img/icons_app/games.png","name":"Tetris","routeName":"tetris","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons/maps.png","name":"GPS","routeName":"gps","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons/stocks.png","name":"Borsa","routeName":"borsaa","inMenuApps":true}},{"name":{"active":false,"icons":"static/img/icons/music.png","name":"Radio","routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(30, '55b0011ecda01bd93f78795346c7413d6f00f6c4', '[{"name":{"icons":"static/img/icons_app/twitter.png","name":"Twitter","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"icons":"static/img/icons_app/banco.png","name":"Bank","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"icons":"static/img/icons_app/tchat.png","name":"Dark Chat","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"icons":"static/img/icons/yellow.png","name":"Yellow Pages","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"icons":"static/img/icons/logo.png","name":"Bills","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"icons":"static/img/2048/haber.png","name":"News","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"icons":"static/img/youtubeicon.png","name":"YouTube","active":false,"routeName":"you","inMenuApps":true}},{"name":{"icons":"static/img/icons/instagram.png","name":"Instagram","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"icons":"static/img/icons_app/reddit.png","name":"Reddit","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"icons":"static/img/icons_app/market.png","name":"Market","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"icons":"static/img/icons_app/vale.png","name":"Vale","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"icons":"static/img/icons_app/uber.png","name":"Uber","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"icons":"static/img/icons_app/wanted.png","name":"Wanted","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"icons":"static/img/icons_app/games.png","name":"Tetris","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"icons":"static/img/icons/maps.png","name":"GPS","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"icons":"static/img/icons/stocks.png","name":"Borsa","active":true,"routeName":"borsaa","inMenuApps":true}},{"name":{"icons":"static/img/icons/music.png","name":"Radio","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(31, 'fe98f8dc9deb20e673a8785f29745d90ed1db052', '[{"name":{"inMenuApps":false,"active":false,"name":"Twitter","icons":"static/img/icons_app/twitter.png","routeName":"twitter.splash"}},{"name":{"inMenuApps":true,"active":false,"name":"Bank","icons":"static/img/icons_app/banco.png","routeName":"bankb"}},{"name":{"inMenuApps":true,"active":false,"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","routeName":"tchat"}},{"name":{"inMenuApps":true,"active":false,"name":"Yellow Pages","icons":"static/img/icons/yellow.png","routeName":"yellowpages"}},{"name":{"inMenuApps":true,"active":false,"name":"Bills","icons":"static/img/icons/logo.png","routeName":"faturaslash"}},{"name":{"inMenuApps":true,"active":false,"name":"News","icons":"static/img/2048/haber.png","routeName":"haberlerslplash"}},{"name":{"inMenuApps":true,"active":false,"name":"YouTube","icons":"static/img/youtubeicon.png","routeName":"you"}},{"name":{"inMenuApps":true,"active":false,"name":"Instagram","icons":"static/img/icons/instagram.png","routeName":"instagramslash"}},{"name":{"inMenuApps":true,"active":false,"name":"Reddit","icons":"static/img/icons_app/reddit.png","routeName":"reddit"}},{"name":{"inMenuApps":false,"active":false,"name":"Market","icons":"static/img/icons_app/market.png","routeName":"marketslsh"}},{"name":{"inMenuApps":false,"active":false,"name":"Vale","icons":"static/img/icons_app/vale.png","routeName":"vale"}},{"name":{"inMenuApps":false,"active":false,"name":"Uber","icons":"static/img/icons_app/uber.png","routeName":"uberb"}},{"name":{"inMenuApps":false,"active":false,"name":"Wanted","icons":"static/img/icons_app/wanted.png","routeName":"wan"}},{"name":{"inMenuApps":true,"active":false,"name":"Tetris","icons":"static/img/icons_app/games.png","routeName":"tetris"}},{"name":{"inMenuApps":true,"active":false,"name":"GPS","icons":"static/img/icons/maps.png","routeName":"gps"}},{"name":{"inMenuApps":true,"active":false,"name":"Borsa","icons":"static/img/icons/stocks.png","routeName":"borsaa"}},{"name":{"inMenuApps":true,"active":false,"name":"Radio","icons":"static/img/icons/music.png","routeName":"radio"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(32, '34251b7753bc09a5c92563c49ed1ad00ca29b745', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(33, '3a0b9a8c554c8c4a07dd10b5842b05b99e9483cf', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(34, '893ffc926e30d183fb9d6b3240942e09bca081a3', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(35, '854812e40063a2bcbbf10c29bc55296a87904f13', '[{"name":{"routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","inMenuApps":false,"name":"Twitter","active":true}},{"name":{"routeName":"bankb","icons":"static/img/icons_app/banco.png","inMenuApps":true,"name":"Bank","active":true}},{"name":{"routeName":"tchat","icons":"static/img/icons_app/tchat.png","inMenuApps":true,"name":"Dark Chat","active":true}},{"name":{"routeName":"yellowpages","icons":"static/img/icons/yellow.png","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"routeName":"faturaslash","icons":"static/img/icons/logo.png","inMenuApps":true,"name":"Bills","active":true}},{"name":{"routeName":"haberlerslplash","icons":"static/img/2048/haber.png","inMenuApps":true,"name":"News","active":false}},{"name":{"routeName":"you","icons":"static/img/youtubeicon.png","inMenuApps":true,"name":"YouTube","active":true}},{"name":{"routeName":"instagramslash","icons":"static/img/icons/instagram.png","inMenuApps":true,"name":"Instagram","active":true}},{"name":{"routeName":"reddit","icons":"static/img/icons_app/reddit.png","inMenuApps":true,"name":"Reddit","active":true}},{"name":{"routeName":"marketslsh","icons":"static/img/icons_app/market.png","inMenuApps":false,"name":"Market","active":false}},{"name":{"routeName":"vale","icons":"static/img/icons_app/vale.png","inMenuApps":false,"name":"Vale","active":false}},{"name":{"routeName":"uberb","icons":"static/img/icons_app/uber.png","inMenuApps":false,"name":"Uber","active":false}},{"name":{"routeName":"wan","icons":"static/img/icons_app/wanted.png","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"routeName":"tetris","icons":"static/img/icons_app/games.png","inMenuApps":true,"name":"Tetris","active":true}},{"name":{"routeName":"gps","icons":"static/img/icons/maps.png","inMenuApps":true,"name":"GPS","active":true}},{"name":{"routeName":"borsaa","icons":"static/img/icons/stocks.png","inMenuApps":true,"name":"Borsa","active":true}},{"name":{"routeName":"radio","icons":"static/img/icons/music.png","inMenuApps":true,"name":"Radio","active":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(36, 'f76c1500479ad81ea2e626f607078f8dbac39e0b', '[{"name":{"routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","inMenuApps":false,"name":"Twitter","active":true}},{"name":{"routeName":"bankb","icons":"static/img/icons_app/banco.png","inMenuApps":true,"name":"Bank","active":true}},{"name":{"routeName":"tchat","icons":"static/img/icons_app/tchat.png","inMenuApps":true,"name":"Dark Chat","active":true}},{"name":{"routeName":"yellowpages","icons":"static/img/icons/yellow.png","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"routeName":"faturaslash","icons":"static/img/icons/logo.png","inMenuApps":true,"name":"Bills","active":false}},{"name":{"routeName":"haberlerslplash","icons":"static/img/2048/haber.png","inMenuApps":true,"name":"News","active":false}},{"name":{"routeName":"you","icons":"static/img/youtubeicon.png","inMenuApps":true,"name":"YouTube","active":false}},{"name":{"routeName":"instagramslash","icons":"static/img/icons/instagram.png","inMenuApps":true,"name":"Instagram","active":false}},{"name":{"routeName":"reddit","icons":"static/img/icons_app/reddit.png","inMenuApps":true,"name":"Reddit","active":false}},{"name":{"routeName":"marketslsh","icons":"static/img/icons_app/market.png","inMenuApps":false,"name":"Market","active":false}},{"name":{"routeName":"vale","icons":"static/img/icons_app/vale.png","inMenuApps":false,"name":"Vale","active":false}},{"name":{"routeName":"uberb","icons":"static/img/icons_app/uber.png","inMenuApps":false,"name":"Uber","active":false}},{"name":{"routeName":"wan","icons":"static/img/icons_app/wanted.png","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"routeName":"tetris","icons":"static/img/icons_app/games.png","inMenuApps":true,"name":"Tetris","active":false}},{"name":{"routeName":"gps","icons":"static/img/icons/maps.png","inMenuApps":true,"name":"GPS","active":false}},{"name":{"routeName":"borsaa","icons":"static/img/icons/stocks.png","inMenuApps":true,"name":"Borsa","active":false}},{"name":{"routeName":"radio","icons":"static/img/icons/music.png","inMenuApps":true,"name":"Radio","active":false}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(37, '7d50b4537dbb98ac290c5dc1f56bc59963a7e0e8', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(38, '28f047a408daa3b2181761b8fd94a329f69117b3', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(39, '25a4e03167c4b6bf2200414395f8ad5600af312f', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(40, '468d8e859dd395e754354ed19318802f51777054', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(41, '8a249fe36729c5f2fe0377983d6cbd74d6590c79', '[{"name":{"icons":"static/img/icons_app/twitter.png","routeName":"twitter.splash","inMenuApps":false,"name":"Twitter","active":true}},{"name":{"icons":"static/img/icons_app/banco.png","routeName":"bankb","inMenuApps":true,"name":"Bank","active":true}},{"name":{"icons":"static/img/icons_app/tchat.png","routeName":"tchat","inMenuApps":true,"name":"Dark Chat","active":true}},{"name":{"icons":"static/img/icons/yellow.png","routeName":"yellowpages","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"icons":"static/img/icons/logo.png","routeName":"faturaslash","inMenuApps":true,"name":"Bills","active":true}},{"name":{"icons":"static/img/2048/haber.png","routeName":"haberlerslplash","inMenuApps":true,"name":"News","active":false}},{"name":{"icons":"static/img/youtubeicon.png","routeName":"you","inMenuApps":true,"name":"YouTube","active":true}},{"name":{"icons":"static/img/icons/instagram.png","routeName":"instagramslash","inMenuApps":true,"name":"Instagram","active":true}},{"name":{"icons":"static/img/icons_app/reddit.png","routeName":"reddit","inMenuApps":true,"name":"Reddit","active":true}},{"name":{"icons":"static/img/icons_app/market.png","routeName":"marketslsh","inMenuApps":false,"name":"Market","active":false}},{"name":{"icons":"static/img/icons_app/vale.png","routeName":"vale","inMenuApps":false,"name":"Vale","active":false}},{"name":{"icons":"static/img/icons_app/uber.png","routeName":"uberb","inMenuApps":false,"name":"Uber","active":false}},{"name":{"icons":"static/img/icons_app/wanted.png","routeName":"wan","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"icons":"static/img/icons_app/games.png","routeName":"tetris","inMenuApps":true,"name":"Tetris","active":true}},{"name":{"icons":"static/img/icons/maps.png","routeName":"gps","inMenuApps":true,"name":"GPS","active":true}},{"name":{"icons":"static/img/icons/stocks.png","routeName":"borsaa","inMenuApps":true,"name":"Borsa","active":true}},{"name":{"icons":"static/img/icons/music.png","routeName":"radio","inMenuApps":true,"name":"Radio","active":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(42, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '[{"name":{"routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","inMenuApps":false,"name":"Twitter","active":true}},{"name":{"routeName":"bankb","icons":"static/img/icons_app/banco.png","inMenuApps":true,"name":"Bank","active":true}},{"name":{"routeName":"tchat","icons":"static/img/icons_app/tchat.png","inMenuApps":true,"name":"Dark Chat","active":true}},{"name":{"routeName":"yellowpages","icons":"static/img/icons/yellow.png","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"routeName":"faturaslash","icons":"static/img/icons/logo.png","inMenuApps":true,"name":"Bills","active":true}},{"name":{"routeName":"haberlerslplash","icons":"static/img/2048/haber.png","inMenuApps":true,"name":"News","active":false}},{"name":{"routeName":"you","icons":"static/img/youtubeicon.png","inMenuApps":true,"name":"YouTube","active":true}},{"name":{"routeName":"instagramslash","icons":"static/img/icons/instagram.png","inMenuApps":true,"name":"Instagram","active":true}},{"name":{"routeName":"reddit","icons":"static/img/icons_app/reddit.png","inMenuApps":true,"name":"Reddit","active":true}},{"name":{"routeName":"marketslsh","icons":"static/img/icons_app/market.png","inMenuApps":false,"name":"Market","active":false}},{"name":{"routeName":"vale","icons":"static/img/icons_app/vale.png","inMenuApps":false,"name":"Vale","active":false}},{"name":{"routeName":"uberb","icons":"static/img/icons_app/uber.png","inMenuApps":false,"name":"Uber","active":false}},{"name":{"routeName":"wan","icons":"static/img/icons_app/wanted.png","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"routeName":"tetris","icons":"static/img/icons_app/games.png","inMenuApps":true,"name":"Tetris","active":true}},{"name":{"routeName":"gps","icons":"static/img/icons/maps.png","inMenuApps":true,"name":"GPS","active":true}},{"name":{"routeName":"borsaa","icons":"static/img/icons/stocks.png","inMenuApps":true,"name":"Borsa","active":true}},{"name":{"routeName":"radio","icons":"static/img/icons/music.png","inMenuApps":true,"name":"Radio","active":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(43, '007117365c4f37221a92273f2be3ae3673b8a749', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(44, 'b13b12c162404f3ac4bd2a36470118f23c755794', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(45, '623ca025b6fc4a2c376e80fb01c060f6f151d266', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(46, 'cd4b446d0873d0d2943bc3bace3c55692e953516', '[{"name":{"active":true,"inMenuApps":false,"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png"}},{"name":{"active":false,"inMenuApps":true,"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png"}},{"name":{"active":true,"inMenuApps":true,"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png"}},{"name":{"active":true,"inMenuApps":true,"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(47, '46cf32dd881d4ce580c67d1d9d10ba1413e019ab', '[{"name":{"name":"Twitter","icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false}},{"name":{"name":"Bank","icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true}},{"name":{"name":"Dark Chat","icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true}},{"name":{"name":"Yellow Pages","icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true}},{"name":{"name":"Bills","icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true}},{"name":{"name":"News","icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true}},{"name":{"name":"YouTube","icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true}},{"name":{"name":"Instagram","icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true}},{"name":{"name":"Reddit","icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true}},{"name":{"name":"Market","icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false}},{"name":{"name":"Vale","icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false}},{"name":{"name":"Uber","icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false}},{"name":{"name":"Wanted","icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false}},{"name":{"name":"Tetris","icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true}},{"name":{"name":"GPS","icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true}},{"name":{"name":"Borsa","icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true}},{"name":{"name":"Radio","icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(48, 'eac2237361a2521cc32ec30782792e44f2db57a8', '[{"name":{"active":true,"inMenuApps":false,"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png"}},{"name":{"active":false,"inMenuApps":true,"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png"}},{"name":{"active":true,"inMenuApps":true,"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png"}},{"name":{"active":true,"inMenuApps":true,"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(49, '3157a97dab0f65d1f3dea42b965f26db876b9e43', '[{"name":{"active":false,"inMenuApps":false,"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png"}},{"name":{"active":false,"inMenuApps":true,"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png"}},{"name":{"active":false,"inMenuApps":true,"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png"}},{"name":{"active":false,"inMenuApps":true,"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(50, '65824048d1d2a80583facb81b7531e3b478a2217', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(51, 'b0f52bbad39871f886445279437163b33ecaaa81', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(52, 'ac90d3decdf0304869352296bd3eda2e234bb869', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(53, '2fb1cf5b013a97b2ec1de6d1bcf7db6cc91cd2a0', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(54, '34d8f26cc32ab8703bf28c4dd0d508859b818d13', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":true,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":true,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":true,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":true,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":true,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":true,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":true,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(55, '8caaf012e059c13c6e1ede05366effed2a5764de', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(56, '87b22c3823eca7892d62ccfd05086dac866d510c', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(57, 'f94244739561f92f070a19968cf31b38eccb1cea', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(58, 'd997b95b329a56b97fc059f6a5ed81984d7a8fda', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(59, '9382c0e2d6eae4ad9f7306ce8161e478b1918ac2', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":true,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":true,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":true,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(60, 'f59633ec0b5a12870dfd85222c1a912cdf4cb86a', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":true,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(61, '1f674e9d75b5acedf835f213c7e0517bf9007baf', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(62, 'bf04013a1acd21ba814044b5488df8e9a23a0d7e', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(63, 'e2e331d86c0520b9b05d571f1a8649d4f49ee482', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(64, '256d9580ffe173c783db26d766b9a3709e8e1555', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(65, '2683c433d7e16ff109754323d6a8f3f3581b68e1', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(66, '205b962c66eceb698b15a993af871fd623cc6064', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(67, 'fa90eb9f929b3d5c9b8d9600b6b0ed9aeabcb4a2', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(68, 'b28c27f38441e9fecacf05250de37e42bd447c3b', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(69, 'a26f419014de3c0f1dc60e310b4e363bcaf060d3', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(70, '477b4d85cdf07dcd8fae87cb4a2ffc33805e1e51', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(71, 'baeab599a7148a331c131954de1a6605000bd165', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(72, '4c7e20b18547c074831ecbcd119a349dc9057f9e', '[{"name":{"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","active":false,"inMenuApps":false}},{"name":{"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png","active":false,"inMenuApps":true}},{"name":{"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png","active":false,"inMenuApps":true}},{"name":{"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png","active":false,"inMenuApps":true}},{"name":{"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png","active":false,"inMenuApps":true}},{"name":{"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png","active":false,"inMenuApps":true}},{"name":{"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png","active":false,"inMenuApps":true}},{"name":{"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png","active":false,"inMenuApps":true}},{"name":{"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png","active":false,"inMenuApps":true}},{"name":{"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png","active":false,"inMenuApps":false}},{"name":{"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png","active":false,"inMenuApps":false}},{"name":{"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png","active":false,"inMenuApps":false}},{"name":{"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png","active":false,"inMenuApps":false}},{"name":{"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png","active":false,"inMenuApps":true}},{"name":{"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png","active":false,"inMenuApps":true}},{"name":{"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png","active":false,"inMenuApps":true}},{"name":{"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png","active":false,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(73, '1c58571e499884bf0801c5b5d85d3cfc0e71357d', '[{"name":{"icons":"static/img/icons_app/twitter.png","inMenuApps":false,"routeName":"twitter.splash","active":false,"name":"Twitter"}},{"name":{"icons":"static/img/icons_app/banco.png","inMenuApps":true,"routeName":"bankb","active":true,"name":"Bank"}},{"name":{"icons":"static/img/icons_app/tchat.png","inMenuApps":true,"routeName":"tchat","active":true,"name":"Dark Chat"}},{"name":{"icons":"static/img/icons/yellow.png","inMenuApps":true,"routeName":"yellowpages","active":false,"name":"Yellow Pages"}},{"name":{"icons":"static/img/icons/logo.png","inMenuApps":true,"routeName":"faturaslash","active":true,"name":"Bills"}},{"name":{"icons":"static/img/2048/haber.png","inMenuApps":true,"routeName":"haberlerslplash","active":false,"name":"News"}},{"name":{"icons":"static/img/youtubeicon.png","inMenuApps":true,"routeName":"you","active":true,"name":"YouTube"}},{"name":{"icons":"static/img/icons/instagram.png","inMenuApps":true,"routeName":"instagramslash","active":false,"name":"Instagram"}},{"name":{"icons":"static/img/icons_app/reddit.png","inMenuApps":true,"routeName":"reddit","active":false,"name":"Reddit"}},{"name":{"icons":"static/img/icons_app/market.png","inMenuApps":false,"routeName":"marketslsh","active":false,"name":"Market"}},{"name":{"icons":"static/img/icons_app/vale.png","inMenuApps":false,"routeName":"vale","active":false,"name":"Vale"}},{"name":{"icons":"static/img/icons_app/uber.png","inMenuApps":false,"routeName":"uberb","active":false,"name":"Uber"}},{"name":{"icons":"static/img/icons_app/wanted.png","inMenuApps":false,"routeName":"wan","active":false,"name":"Wanted"}},{"name":{"icons":"static/img/icons_app/games.png","inMenuApps":true,"routeName":"tetris","active":true,"name":"Tetris"}},{"name":{"icons":"static/img/icons/maps.png","inMenuApps":true,"routeName":"gps","active":false,"name":"GPS"}},{"name":{"icons":"static/img/icons/stocks.png","inMenuApps":true,"routeName":"borsaa","active":false,"name":"Borsa"}},{"name":{"icons":"static/img/icons/music.png","inMenuApps":true,"routeName":"radio","active":false,"name":"Radio"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(74, 'c0cd8109c04899c9a7dc9177531bead5cbd72bd4', '[{"name":{"routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","inMenuApps":false,"name":"Twitter","active":false}},{"name":{"routeName":"bankb","icons":"static/img/icons_app/banco.png","inMenuApps":true,"name":"Bank","active":false}},{"name":{"routeName":"tchat","icons":"static/img/icons_app/tchat.png","inMenuApps":true,"name":"Dark Chat","active":false}},{"name":{"routeName":"yellowpages","icons":"static/img/icons/yellow.png","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"routeName":"faturaslash","icons":"static/img/icons/logo.png","inMenuApps":true,"name":"Bills","active":false}},{"name":{"routeName":"haberlerslplash","icons":"static/img/2048/haber.png","inMenuApps":true,"name":"News","active":false}},{"name":{"routeName":"you","icons":"static/img/youtubeicon.png","inMenuApps":true,"name":"YouTube","active":false}},{"name":{"routeName":"instagramslash","icons":"static/img/icons/instagram.png","inMenuApps":true,"name":"Instagram","active":false}},{"name":{"routeName":"reddit","icons":"static/img/icons_app/reddit.png","inMenuApps":true,"name":"Reddit","active":false}},{"name":{"routeName":"marketslsh","icons":"static/img/icons_app/market.png","inMenuApps":false,"name":"Market","active":false}},{"name":{"routeName":"vale","icons":"static/img/icons_app/vale.png","inMenuApps":false,"name":"Vale","active":false}},{"name":{"routeName":"uberb","icons":"static/img/icons_app/uber.png","inMenuApps":false,"name":"Uber","active":false}},{"name":{"routeName":"wan","icons":"static/img/icons_app/wanted.png","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"routeName":"tetris","icons":"static/img/icons_app/games.png","inMenuApps":true,"name":"Tetris","active":false}},{"name":{"routeName":"gps","icons":"static/img/icons/maps.png","inMenuApps":true,"name":"GPS","active":false}},{"name":{"routeName":"borsaa","icons":"static/img/icons/stocks.png","inMenuApps":true,"name":"Borsa","active":false}},{"name":{"routeName":"radio","icons":"static/img/icons/music.png","inMenuApps":true,"name":"Radio","active":false}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(75, 'e25c35dcdc4fd27dfbe6471c91f10ebbef81f717', '[{"name":{"routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","inMenuApps":false,"name":"Twitter","active":false}},{"name":{"routeName":"bankb","icons":"static/img/icons_app/banco.png","inMenuApps":true,"name":"Bank","active":false}},{"name":{"routeName":"tchat","icons":"static/img/icons_app/tchat.png","inMenuApps":true,"name":"Dark Chat","active":false}},{"name":{"routeName":"yellowpages","icons":"static/img/icons/yellow.png","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"routeName":"faturaslash","icons":"static/img/icons/logo.png","inMenuApps":true,"name":"Bills","active":false}},{"name":{"routeName":"haberlerslplash","icons":"static/img/2048/haber.png","inMenuApps":true,"name":"News","active":false}},{"name":{"routeName":"you","icons":"static/img/youtubeicon.png","inMenuApps":true,"name":"YouTube","active":false}},{"name":{"routeName":"instagramslash","icons":"static/img/icons/instagram.png","inMenuApps":true,"name":"Instagram","active":false}},{"name":{"routeName":"reddit","icons":"static/img/icons_app/reddit.png","inMenuApps":true,"name":"Reddit","active":false}},{"name":{"routeName":"marketslsh","icons":"static/img/icons_app/market.png","inMenuApps":false,"name":"Market","active":false}},{"name":{"routeName":"vale","icons":"static/img/icons_app/vale.png","inMenuApps":false,"name":"Vale","active":false}},{"name":{"routeName":"uberb","icons":"static/img/icons_app/uber.png","inMenuApps":false,"name":"Uber","active":false}},{"name":{"routeName":"wan","icons":"static/img/icons_app/wanted.png","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"routeName":"tetris","icons":"static/img/icons_app/games.png","inMenuApps":true,"name":"Tetris","active":false}},{"name":{"routeName":"gps","icons":"static/img/icons/maps.png","inMenuApps":true,"name":"GPS","active":false}},{"name":{"routeName":"borsaa","icons":"static/img/icons/stocks.png","inMenuApps":true,"name":"Borsa","active":false}},{"name":{"routeName":"radio","icons":"static/img/icons/music.png","inMenuApps":true,"name":"Radio","active":false}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(76, '8c001bcdd122e455f5f4e750b4db42fdf5d99871', '[{"name":{"routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png","inMenuApps":false,"name":"Twitter","active":false}},{"name":{"routeName":"bankb","icons":"static/img/icons_app/banco.png","inMenuApps":true,"name":"Bank","active":false}},{"name":{"routeName":"tchat","icons":"static/img/icons_app/tchat.png","inMenuApps":true,"name":"Dark Chat","active":false}},{"name":{"routeName":"yellowpages","icons":"static/img/icons/yellow.png","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"routeName":"faturaslash","icons":"static/img/icons/logo.png","inMenuApps":true,"name":"Bills","active":false}},{"name":{"routeName":"haberlerslplash","icons":"static/img/2048/haber.png","inMenuApps":true,"name":"News","active":false}},{"name":{"routeName":"you","icons":"static/img/youtubeicon.png","inMenuApps":true,"name":"YouTube","active":false}},{"name":{"routeName":"instagramslash","icons":"static/img/icons/instagram.png","inMenuApps":true,"name":"Instagram","active":false}},{"name":{"routeName":"reddit","icons":"static/img/icons_app/reddit.png","inMenuApps":true,"name":"Reddit","active":false}},{"name":{"routeName":"marketslsh","icons":"static/img/icons_app/market.png","inMenuApps":false,"name":"Market","active":false}},{"name":{"routeName":"vale","icons":"static/img/icons_app/vale.png","inMenuApps":false,"name":"Vale","active":false}},{"name":{"routeName":"uberb","icons":"static/img/icons_app/uber.png","inMenuApps":false,"name":"Uber","active":false}},{"name":{"routeName":"wan","icons":"static/img/icons_app/wanted.png","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"routeName":"tetris","icons":"static/img/icons_app/games.png","inMenuApps":true,"name":"Tetris","active":false}},{"name":{"routeName":"gps","icons":"static/img/icons/maps.png","inMenuApps":true,"name":"GPS","active":false}},{"name":{"routeName":"borsaa","icons":"static/img/icons/stocks.png","inMenuApps":true,"name":"Borsa","active":false}},{"name":{"routeName":"radio","icons":"static/img/icons/music.png","inMenuApps":true,"name":"Radio","active":false}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(77, 'dd1a8cca0456c1d12d5437142c3b6bca16e8bd26', '[{"name":{"icons":"static/img/icons_app/twitter.png","routeName":"twitter.splash","inMenuApps":false,"active":false,"name":"Twitter"}},{"name":{"icons":"static/img/icons_app/banco.png","routeName":"bankb","inMenuApps":true,"active":false,"name":"Bank"}},{"name":{"icons":"static/img/icons_app/tchat.png","routeName":"tchat","inMenuApps":true,"active":false,"name":"Dark Chat"}},{"name":{"icons":"static/img/icons/yellow.png","routeName":"yellowpages","inMenuApps":true,"active":false,"name":"Yellow Pages"}},{"name":{"icons":"static/img/icons/logo.png","routeName":"faturaslash","inMenuApps":true,"active":false,"name":"Bills"}},{"name":{"icons":"static/img/2048/haber.png","routeName":"haberlerslplash","inMenuApps":true,"active":false,"name":"News"}},{"name":{"icons":"static/img/youtubeicon.png","routeName":"you","inMenuApps":true,"active":false,"name":"YouTube"}},{"name":{"icons":"static/img/icons/instagram.png","routeName":"instagramslash","inMenuApps":true,"active":false,"name":"Instagram"}},{"name":{"icons":"static/img/icons_app/reddit.png","routeName":"reddit","inMenuApps":true,"active":false,"name":"Reddit"}},{"name":{"icons":"static/img/icons_app/market.png","routeName":"marketslsh","inMenuApps":false,"active":false,"name":"Market"}},{"name":{"icons":"static/img/icons_app/vale.png","routeName":"vale","inMenuApps":false,"active":false,"name":"Vale"}},{"name":{"icons":"static/img/icons_app/uber.png","routeName":"uberb","inMenuApps":false,"active":false,"name":"Uber"}},{"name":{"icons":"static/img/icons_app/wanted.png","routeName":"wan","inMenuApps":false,"active":false,"name":"Wanted"}},{"name":{"icons":"static/img/icons_app/games.png","routeName":"tetris","inMenuApps":true,"active":false,"name":"Tetris"}},{"name":{"icons":"static/img/icons/maps.png","routeName":"gps","inMenuApps":true,"active":false,"name":"GPS"}},{"name":{"icons":"static/img/icons/stocks.png","routeName":"borsaa","inMenuApps":true,"active":false,"name":"Borsa"}},{"name":{"icons":"static/img/icons/music.png","routeName":"radio","inMenuApps":true,"active":false,"name":"Radio"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(78, '303519e413d2d8d09edbacdeb32832e9f6a87973', '[{"name":{"icons":"static/img/icons_app/twitter.png","name":"Twitter","routeName":"twitter.splash","active":true,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/banco.png","name":"Bank","routeName":"bankb","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons_app/tchat.png","name":"Dark Chat","routeName":"tchat","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons/yellow.png","name":"Yellow Pages","routeName":"yellowpages","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/icons/logo.png","name":"Bills","routeName":"faturaslash","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/2048/haber.png","name":"News","routeName":"haberlerslplash","active":false,"inMenuApps":true}},{"name":{"icons":"static/img/youtubeicon.png","name":"YouTube","routeName":"you","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons/instagram.png","name":"Instagram","routeName":"instagramslash","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons_app/reddit.png","name":"Reddit","routeName":"reddit","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons_app/market.png","name":"Market","routeName":"marketslsh","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/vale.png","name":"Vale","routeName":"vale","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/uber.png","name":"Uber","routeName":"uberb","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/wanted.png","name":"Wanted","routeName":"wan","active":false,"inMenuApps":false}},{"name":{"icons":"static/img/icons_app/games.png","name":"Tetris","routeName":"tetris","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons/maps.png","name":"GPS","routeName":"gps","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons/stocks.png","name":"Borsa","routeName":"borsaa","active":true,"inMenuApps":true}},{"name":{"icons":"static/img/icons/music.png","name":"Radio","routeName":"radio","active":true,"inMenuApps":true}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(79, 'c9c13e5ed18c956773dd0c4dc28c02070020fe3d', '[{"name":{"icons":"static/img/icons_app/twitter.png","routeName":"twitter.splash","inMenuApps":false,"active":false,"name":"Twitter"}},{"name":{"icons":"static/img/icons_app/banco.png","routeName":"bankb","inMenuApps":true,"active":false,"name":"Bank"}},{"name":{"icons":"static/img/icons_app/tchat.png","routeName":"tchat","inMenuApps":true,"active":false,"name":"Dark Chat"}},{"name":{"icons":"static/img/icons/yellow.png","routeName":"yellowpages","inMenuApps":true,"active":false,"name":"Yellow Pages"}},{"name":{"icons":"static/img/icons/logo.png","routeName":"faturaslash","inMenuApps":true,"active":false,"name":"Bills"}},{"name":{"icons":"static/img/2048/haber.png","routeName":"haberlerslplash","inMenuApps":true,"active":false,"name":"News"}},{"name":{"icons":"static/img/youtubeicon.png","routeName":"you","inMenuApps":true,"active":false,"name":"YouTube"}},{"name":{"icons":"static/img/icons/instagram.png","routeName":"instagramslash","inMenuApps":true,"active":false,"name":"Instagram"}},{"name":{"icons":"static/img/icons_app/reddit.png","routeName":"reddit","inMenuApps":true,"active":false,"name":"Reddit"}},{"name":{"icons":"static/img/icons_app/market.png","routeName":"marketslsh","inMenuApps":false,"active":false,"name":"Market"}},{"name":{"icons":"static/img/icons_app/vale.png","routeName":"vale","inMenuApps":false,"active":false,"name":"Vale"}},{"name":{"icons":"static/img/icons_app/uber.png","routeName":"uberb","inMenuApps":false,"active":false,"name":"Uber"}},{"name":{"icons":"static/img/icons_app/wanted.png","routeName":"wan","inMenuApps":false,"active":false,"name":"Wanted"}},{"name":{"icons":"static/img/icons_app/games.png","routeName":"tetris","inMenuApps":true,"active":false,"name":"Tetris"}},{"name":{"icons":"static/img/icons/maps.png","routeName":"gps","inMenuApps":true,"active":false,"name":"GPS"}},{"name":{"icons":"static/img/icons/stocks.png","routeName":"borsaa","inMenuApps":true,"active":false,"name":"Borsa"}},{"name":{"icons":"static/img/icons/music.png","routeName":"radio","inMenuApps":true,"active":false,"name":"Radio"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(80, 'ea3f576a5548386eff8e48025ed5f5c026c89f16', '[{"name":{"active":false,"inMenuApps":false,"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png"}},{"name":{"active":false,"inMenuApps":true,"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png"}},{"name":{"active":false,"inMenuApps":true,"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png"}},{"name":{"active":false,"inMenuApps":true,"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(81, 'bba5a10878001eaf23160ade255dbc1d4bae03b7', '[{"name":{"active":false,"inMenuApps":false,"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png"}},{"name":{"active":false,"inMenuApps":true,"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png"}},{"name":{"active":false,"inMenuApps":true,"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png"}},{"name":{"active":false,"inMenuApps":true,"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(82, 'd1491d84201f9f3677b8a564300dc0d906188f74', '[{"name":{"active":true,"inMenuApps":false,"name":"Twitter","routeName":"twitter.splash","icons":"static/img/icons_app/twitter.png"}},{"name":{"active":true,"inMenuApps":true,"name":"Bank","routeName":"bankb","icons":"static/img/icons_app/banco.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Dark Chat","routeName":"tchat","icons":"static/img/icons_app/tchat.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Yellow Pages","routeName":"yellowpages","icons":"static/img/icons/yellow.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Bills","routeName":"faturaslash","icons":"static/img/icons/logo.png"}},{"name":{"active":false,"inMenuApps":true,"name":"News","routeName":"haberlerslplash","icons":"static/img/2048/haber.png"}},{"name":{"active":false,"inMenuApps":true,"name":"YouTube","routeName":"you","icons":"static/img/youtubeicon.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Instagram","routeName":"instagramslash","icons":"static/img/icons/instagram.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Reddit","routeName":"reddit","icons":"static/img/icons_app/reddit.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Market","routeName":"marketslsh","icons":"static/img/icons_app/market.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Vale","routeName":"vale","icons":"static/img/icons_app/vale.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Uber","routeName":"uberb","icons":"static/img/icons_app/uber.png"}},{"name":{"active":false,"inMenuApps":false,"name":"Wanted","routeName":"wan","icons":"static/img/icons_app/wanted.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Tetris","routeName":"tetris","icons":"static/img/icons_app/games.png"}},{"name":{"active":false,"inMenuApps":true,"name":"GPS","routeName":"gps","icons":"static/img/icons/maps.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Borsa","routeName":"borsaa","icons":"static/img/icons/stocks.png"}},{"name":{"active":false,"inMenuApps":true,"name":"Radio","routeName":"radio","icons":"static/img/icons/music.png"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(83, '6ca9ccc89c4036628cb292e614c8e4927ab29fa5', '[{"name":{"icons":"static/img/icons_app/twitter.png","routeName":"twitter.splash","inMenuApps":false,"name":"Twitter","active":false}},{"name":{"icons":"static/img/icons_app/banco.png","routeName":"bankb","inMenuApps":true,"name":"Bank","active":false}},{"name":{"icons":"static/img/icons_app/tchat.png","routeName":"tchat","inMenuApps":true,"name":"Dark Chat","active":false}},{"name":{"icons":"static/img/icons/yellow.png","routeName":"yellowpages","inMenuApps":true,"name":"Yellow Pages","active":false}},{"name":{"icons":"static/img/icons/logo.png","routeName":"faturaslash","inMenuApps":true,"name":"Bills","active":false}},{"name":{"icons":"static/img/2048/haber.png","routeName":"haberlerslplash","inMenuApps":true,"name":"News","active":false}},{"name":{"icons":"static/img/youtubeicon.png","routeName":"you","inMenuApps":true,"name":"YouTube","active":false}},{"name":{"icons":"static/img/icons/instagram.png","routeName":"instagramslash","inMenuApps":true,"name":"Instagram","active":false}},{"name":{"icons":"static/img/icons_app/reddit.png","routeName":"reddit","inMenuApps":true,"name":"Reddit","active":false}},{"name":{"icons":"static/img/icons_app/market.png","routeName":"marketslsh","inMenuApps":false,"name":"Market","active":false}},{"name":{"icons":"static/img/icons_app/vale.png","routeName":"vale","inMenuApps":false,"name":"Vale","active":false}},{"name":{"icons":"static/img/icons_app/uber.png","routeName":"uberb","inMenuApps":false,"name":"Uber","active":false}},{"name":{"icons":"static/img/icons_app/wanted.png","routeName":"wan","inMenuApps":false,"name":"Wanted","active":false}},{"name":{"icons":"static/img/icons_app/games.png","routeName":"tetris","inMenuApps":true,"name":"Tetris","active":false}},{"name":{"icons":"static/img/icons/maps.png","routeName":"gps","inMenuApps":true,"name":"GPS","active":false}},{"name":{"icons":"static/img/icons/stocks.png","routeName":"borsaa","inMenuApps":true,"name":"Borsa","active":false}},{"name":{"icons":"static/img/icons/music.png","routeName":"radio","inMenuApps":true,"name":"Radio","active":false}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(84, '22db920bcbca0829b4c3e00ba379f2d8fe7aaff3', '[{"name":{"icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false,"name":"Twitter"}},{"name":{"icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true,"name":"Bank"}},{"name":{"icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true,"name":"Dark Chat"}},{"name":{"icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true,"name":"Yellow Pages"}},{"name":{"icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true,"name":"Bills"}},{"name":{"icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true,"name":"News"}},{"name":{"icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true,"name":"YouTube"}},{"name":{"icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true,"name":"Instagram"}},{"name":{"icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true,"name":"Reddit"}},{"name":{"icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false,"name":"Market"}},{"name":{"icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false,"name":"Vale"}},{"name":{"icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false,"name":"Uber"}},{"name":{"icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false,"name":"Wanted"}},{"name":{"icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true,"name":"Tetris"}},{"name":{"icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true,"name":"GPS"}},{"name":{"icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true,"name":"Borsa"}},{"name":{"icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true,"name":"Radio"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}'),
	(85, 'b8be3d071f442fa70ef75b6ee2497ebf3100a42d', '[{"name":{"icons":"static/img/icons_app/twitter.png","active":false,"routeName":"twitter.splash","inMenuApps":false,"name":"Twitter"}},{"name":{"icons":"static/img/icons_app/banco.png","active":false,"routeName":"bankb","inMenuApps":true,"name":"Bank"}},{"name":{"icons":"static/img/icons_app/tchat.png","active":false,"routeName":"tchat","inMenuApps":true,"name":"Dark Chat"}},{"name":{"icons":"static/img/icons/yellow.png","active":false,"routeName":"yellowpages","inMenuApps":true,"name":"Yellow Pages"}},{"name":{"icons":"static/img/icons/logo.png","active":false,"routeName":"faturaslash","inMenuApps":true,"name":"Bills"}},{"name":{"icons":"static/img/2048/haber.png","active":false,"routeName":"haberlerslplash","inMenuApps":true,"name":"News"}},{"name":{"icons":"static/img/youtubeicon.png","active":false,"routeName":"you","inMenuApps":true,"name":"YouTube"}},{"name":{"icons":"static/img/icons/instagram.png","active":false,"routeName":"instagramslash","inMenuApps":true,"name":"Instagram"}},{"name":{"icons":"static/img/icons_app/reddit.png","active":false,"routeName":"reddit","inMenuApps":true,"name":"Reddit"}},{"name":{"icons":"static/img/icons_app/market.png","active":false,"routeName":"marketslsh","inMenuApps":false,"name":"Market"}},{"name":{"icons":"static/img/icons_app/vale.png","active":false,"routeName":"vale","inMenuApps":false,"name":"Vale"}},{"name":{"icons":"static/img/icons_app/uber.png","active":false,"routeName":"uberb","inMenuApps":false,"name":"Uber"}},{"name":{"icons":"static/img/icons_app/wanted.png","active":false,"routeName":"wan","inMenuApps":false,"name":"Wanted"}},{"name":{"icons":"static/img/icons_app/games.png","active":false,"routeName":"tetris","inMenuApps":true,"name":"Tetris"}},{"name":{"icons":"static/img/icons/maps.png","active":false,"routeName":"gps","inMenuApps":true,"name":"GPS"}},{"name":{"icons":"static/img/icons/stocks.png","active":false,"routeName":"borsaa","inMenuApps":true,"name":"Borsa"}},{"name":{"icons":"static/img/icons/music.png","active":false,"routeName":"radio","inMenuApps":true,"name":"Radio"}}]', '{"bitcoin":0,"ethereum":0,"tehther":0,"polkadot":0,"xrp":0,"cordano":0,"chainlink":0,"litecoin":0,"bitcoin-cash":0,"stellar":0,"usd-coin":0,"uniswap":0,"wrapped-bitcoin":0,"aave":0,"bitcoin-sv":0,"eos":0,"monero":0,"tezos":0,"nem":0}');
/*!40000 ALTER TABLE `phone_settings` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_shops wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(255) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.phone_shops: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `phone_shops` DISABLE KEYS */;
INSERT INTO `phone_shops` (`id`, `store`, `item`, `price`, `label`) VALUES
	(18, 'https://img.pngio.com/sim-card-png-clipart-sim-cards-png-1483_1162.png', 'sim', 50, 'SIM CARD');
/*!40000 ALTER TABLE `phone_shops` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.phone_users_contacts wordt geschreven
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  `avatar` varchar(255) NOT NULL DEFAULT 'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumpen data van tabel middelveenv2.phone_users_contacts: 4 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
INSERT INTO `phone_users_contacts` (`id`, `identifier`, `number`, `display`, `avatar`) VALUES
	(7, 'f76c1500479ad81ea2e626f607078f8dbac39e0b', '2089294', 'Miguel G. :clown_face:', 'https://media.discordapp.net/attachments/936578696255512596/948924507454853130/screenshot.jpeg'),
	(8, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '2058532', 'Jordy .C', 'https://media.discordapp.net/attachments/936578696255512596/948924738703613992/screenshot.jpeg'),
	(9, '303519e413d2d8d09edbacdeb32832e9f6a87973', '4742492', 'Nick (bolle)', 'https://image.flaticon.com/icons/png/512/194/194938.png'),
	(10, 'd997b95b329a56b97fc059f6a5ed81984d7a8fda', '9903594', 'Mees Cockzuiger', 'https://image.flaticon.com/icons/png/512/194/194938.png');
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.rented_vehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.rented_vehicles: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.society_moneywash wordt geschreven
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.society_moneywash: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.stadus_skills wordt geschreven
CREATE TABLE IF NOT EXISTS `stadus_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `stamina` varchar(255) NOT NULL,
  `strength` varchar(255) NOT NULL,
  `driving` varchar(255) DEFAULT NULL,
  `shooting` varchar(255) DEFAULT NULL,
  `fishing` varchar(255) DEFAULT NULL,
  `drugs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel middelveenv2.stadus_skills: ~60 rows (ongeveer)
/*!40000 ALTER TABLE `stadus_skills` DISABLE KEYS */;
INSERT INTO `stadus_skills` (`id`, `identifier`, `stamina`, `strength`, `driving`, `shooting`, `fishing`, `drugs`) VALUES
	(45, '1884df4db1128ba239a00566272091bc6e4b8404', '0', '0', '0', '0', '0', '0'),
	(46, 'fd34328d7be3ef9fdf87a783b33da39ed661be53', '0', '0', '1.0836334228515625', '0', '0', '0'),
	(47, '657e2d16859a7e5655c7a00cc0395177479a38e3', '5.622467041015625', '6.3516845703125', '0', '0', '0', '0'),
	(48, 'e90064e044b389ea7862e96828f837d36e8ad1d3', '0', '0', '0', '0', '0', '0'),
	(49, '55b0011ecda01bd93f78795346c7413d6f00f6c4', '0', '0', '0.0547332763671875', '0', '0', '0'),
	(50, 'fe98f8dc9deb20e673a8785f29745d90ed1db052', '0', '0', '0', '0', '0', '0'),
	(51, '34251b7753bc09a5c92563c49ed1ad00ca29b745', '0', '0', '0', '0', '0', '0'),
	(52, '3a0b9a8c554c8c4a07dd10b5842b05b99e9483cf', '0', '0', '0', '0', '0', '0'),
	(53, '893ffc926e30d183fb9d6b3240942e09bca081a3', '22.571044921875', '19.776611328125', '0.129608154296875', '0', '0', '0'),
	(54, '854812e40063a2bcbbf10c29bc55296a87904f13', '0', '0', '0.4639434814453125', '0', '0', '0'),
	(55, 'f76c1500479ad81ea2e626f607078f8dbac39e0b', '10.3021240234375', '8.238433837890625', '0.92755126953125', '0', '0', '0'),
	(56, '7d50b4537dbb98ac290c5dc1f56bc59963a7e0e8', '0', '0', '0.0643768310546875', '0', '0', '0'),
	(57, '28f047a408daa3b2181761b8fd94a329f69117b3', '0', '0', '0.22552490234375', '0', '0', '0'),
	(58, '25a4e03167c4b6bf2200414395f8ad5600af312f', '10.45611572265625', '12.680755615234375', '0.3243560791015625', '0', '0', '0'),
	(59, '468d8e859dd395e754354ed19318802f51777054', '0', '0', '0.19751739501953125', '0', '0', '0'),
	(60, '8a249fe36729c5f2fe0377983d6cbd74d6590c79', '0', '0', '0.9386520385742188', '0', '0', '0'),
	(61, '623ca025b6fc4a2c376e80fb01c060f6f151d266', '0', '0', '0.25159454345703125', '0', '0', '0'),
	(62, '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '4.14471435546875', '4.000762939453125', '2.3153839111328125', '0', '0', '0'),
	(63, '007117365c4f37221a92273f2be3ae3673b8a749', '0', '0', '0.21230316162109375', '0', '0', '0'),
	(64, 'b13b12c162404f3ac4bd2a36470118f23c755794', '0', '0', '0', '0', '0', '0'),
	(65, 'cd4b446d0873d0d2943bc3bace3c55692e953516', '9.8079833984375', '7.593109130859375', '1.7758865356445312', '0', '0', '0'),
	(66, 'eac2237361a2521cc32ec30782792e44f2db57a8', '4.905548095703125', '4.619384765625', '0.620697021484375', '0', '0', '0'),
	(67, '46cf32dd881d4ce580c67d1d9d10ba1413e019ab', '10.609039306640625', '11.418182373046875', '0.22772216796875', '0', '0', '0'),
	(68, '3157a97dab0f65d1f3dea42b965f26db876b9e43', '0', '0', '0.7041244506835938', '0', '0', '0'),
	(69, '65824048d1d2a80583facb81b7531e3b478a2217', '0', '0', '0.098388671875', '0', '0', '0'),
	(70, 'b0f52bbad39871f886445279437163b33ecaaa81', '0', '0', '0.19599151611328125', '0', '0', '0'),
	(71, 'ac90d3decdf0304869352296bd3eda2e234bb869', '0', '0', '0.0520782470703125', '0', '0', '0'),
	(72, '2fb1cf5b013a97b2ec1de6d1bcf7db6cc91cd2a0', '0', '0', '0', '0', '0', '0'),
	(73, '34d8f26cc32ab8703bf28c4dd0d508859b818d13', '0', '0', '0', '0', '0', '0'),
	(74, '8caaf012e059c13c6e1ede05366effed2a5764de', '0', '0', '0', '0', '0', '0'),
	(75, '87b22c3823eca7892d62ccfd05086dac866d510c', '0', '0', '0', '0', '0', '0'),
	(76, 'f94244739561f92f070a19968cf31b38eccb1cea', '0', '0', '0.0436553955078125', '0', '0', '0'),
	(77, 'd997b95b329a56b97fc059f6a5ed81984d7a8fda', '0', '0', '0', '0', '0', '0'),
	(78, '9382c0e2d6eae4ad9f7306ce8161e478b1918ac2', '0', '0', '0', '0', '0', '0'),
	(79, 'f59633ec0b5a12870dfd85222c1a912cdf4cb86a', '0', '0', '0', '0', '0', '0'),
	(80, '1f674e9d75b5acedf835f213c7e0517bf9007baf', '0', '0', '0', '0', '0', '0'),
	(81, 'bf04013a1acd21ba814044b5488df8e9a23a0d7e', '0', '0', '0', '0', '0', '0'),
	(82, 'e2e331d86c0520b9b05d571f1a8649d4f49ee482', '0', '0', '0', '0', '0', '0'),
	(83, '256d9580ffe173c783db26d766b9a3709e8e1555', '0', '0', '0', '0', '0', '0'),
	(84, '205b962c66eceb698b15a993af871fd623cc6064', '0', '0', '0', '0', '0', '0'),
	(85, '2683c433d7e16ff109754323d6a8f3f3581b68e1', '0', '0', '0', '0', '0', '0'),
	(86, 'fa90eb9f929b3d5c9b8d9600b6b0ed9aeabcb4a2', '0', '0', '0', '0', '0', '0'),
	(87, 'b28c27f38441e9fecacf05250de37e42bd447c3b', '0', '0', '0', '0', '0', '0'),
	(88, 'a26f419014de3c0f1dc60e310b4e363bcaf060d3', '0', '0', '0', '0', '0', '0'),
	(89, '477b4d85cdf07dcd8fae87cb4a2ffc33805e1e51', '0', '0', '0', '0', '0', '0'),
	(90, 'baeab599a7148a331c131954de1a6605000bd165', '0', '0', '0', '0', '0', '0'),
	(91, '4c7e20b18547c074831ecbcd119a349dc9057f9e', '0', '0', '0', '0', '0', '0'),
	(92, '1c58571e499884bf0801c5b5d85d3cfc0e71357d', '0', '0', '0.05712127685546875', '0', '0', '0'),
	(93, 'c0cd8109c04899c9a7dc9177531bead5cbd72bd4', '0', '0', '0.20670318603515625', '0', '0', '0'),
	(94, 'e25c35dcdc4fd27dfbe6471c91f10ebbef81f717', '0', '0', '0', '0', '0', '0'),
	(95, '8c001bcdd122e455f5f4e750b4db42fdf5d99871', '1.766143798828125', '0.7200927734375', '0.28264617919921875', '0', '0', '0'),
	(96, 'dd1a8cca0456c1d12d5437142c3b6bca16e8bd26', '0', '0', '0', '0', '0', '0'),
	(97, '303519e413d2d8d09edbacdeb32832e9f6a87973', '31.36944580078125', '30.078369140625', '0.684783935546875', '0', '0', '0'),
	(98, 'c9c13e5ed18c956773dd0c4dc28c02070020fe3d', '2.418670654296875', '2.429412841796875', '0.26788330078125', '0', '0', '0'),
	(99, 'ea3f576a5548386eff8e48025ed5f5c026c89f16', '0', '0', '0', '0', '0', '0'),
	(100, 'bba5a10878001eaf23160ade255dbc1d4bae03b7', '0', '0', '0.318756103515625', '0', '0', '0'),
	(101, 'd1491d84201f9f3677b8a564300dc0d906188f74', '0', '0', '0', '0', '0', '0'),
	(102, '6ca9ccc89c4036628cb292e614c8e4927ab29fa5', '1.211639404296875', '1.667236328125', '0.0546112060546875', '0', '0', '0'),
	(103, '22db920bcbca0829b4c3e00ba379f2d8fe7aaff3', '0', '0', '0', '0', '0', '0'),
	(104, 'b8be3d071f442fa70ef75b6ee2497ebf3100a42d', '0', '0', '0.1234893798828125', '0', '0', '0');
/*!40000 ALTER TABLE `stadus_skills` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.trunk_inventory wordt geschreven
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.trunk_inventory: ~22 rows (ongeveer)
/*!40000 ALTER TABLE `trunk_inventory` DISABLE KEYS */;
INSERT INTO `trunk_inventory` (`id`, `plate`, `data`, `owned`) VALUES
	(1, '96 TST 8', '{}', 0),
	(2, '96 LFL 6', '{}', 0),
	(3, 'WORK485 ', '{}', 0),
	(4, '76 OXU 3', '{}', 1),
	(5, '61 NRB 3', '{"coffre":[]}', 1),
	(6, '81 SUT 1', '{}', 1),
	(8, '39 CGL 8', '{}', 1),
	(9, '65XJU048', '{}', 0),
	(10, '05JBI289', '{}', 0),
	(11, '57 MFW 6', '{}', 1),
	(12, '20YAA285', '{}', 0),
	(13, '29ZSX840', '{}', 0),
	(14, '26 VMR 4', '{"coffre":[{"name":"coca_leaf","count":11},{"name":"phone","count":1},{"name":"water","count":4},{"name":"bread","count":4}],"black_money":[{"amount":0}]}', 0),
	(17, '95 NVO 6', '{"coffre":[{"name":"coke_pooch","count":861}],"black_money":[{"amount":0}]}', 0),
	(19, '46ATB535', '{}', 0),
	(24, '47 ARR 3', '{"coffre":[{"name":"coca_leaf","count":320},{"name":"petrol","count":201},{"name":"petrol_raffin","count":500}]}', 1),
	(25, '89 DPZ 0', '{}', 1),
	(27, '03AUK607', '{}', 0),
	(29, '16 EPG 5', '{"black_money":[{"amount":0}],"coffre":[]}', 1),
	(30, '50 IEW 9', '{}', 1),
	(31, '50 OPP 0', '{"coffre":[{"name":"coca_leaf","count":1417}]}', 1),
	(34, '36 OKN 6', '{"coffre":[{"name":"coke_pooch","count":1150}],"black_money":[{"amount":8000}]}', 1);
/*!40000 ALTER TABLE `trunk_inventory` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.twitter_accounts wordt geschreven
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpen data van tabel middelveenv2.twitter_accounts: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.twitter_likes wordt geschreven
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpen data van tabel middelveenv2.twitter_likes: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.twitter_tweets wordt geschreven
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel middelveenv2.twitter_tweets: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.users wordt geschreven
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `status` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `loaf_furniture` longtext DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `is_dead` tinyint(1) DEFAULT 0,
  `phone_number` varchar(10) DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `citizenid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `fingerprint` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.users: ~59 rows (ongeveer)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `status`, `tattoos`, `loaf_furniture`, `jail`, `is_dead`, `phone_number`, `avatar_url`, `skin`, `citizenid`, `fingerprint`) VALUES
	('007117365c4f37221a92273f2be3ae3673b8a749', '{"bank":28979,"black_money":0,"money":0}', 'user', '{"stungun":1,"lightarmor":4,"flashlight":1,"combatpistol":1,"phone":1,"pistol_ammo":149,"nightstick":1}', 'police', 3, '[]', '{"heading":283.2,"x":476.5,"y":-1065.2,"z":28.8}', 'Ron De ', 'Pest', '24 03 2000', 'm', '198', '[{"name":"hunger","val":631750,"percent":63.175},{"name":"thirst","val":705400,"percent":70.54}]', NULL, NULL, 0, 0, '6919433', NULL, '{"decals_1":0,"hair_1":19,"beard_2":10,"age_2":10,"makeup_4":0,"arms":1,"helmet_2":0,"hair_2":0,"beard_3":55,"bags_2":1,"shoes_2":0,"beard_1":11,"shoes_1":7,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"lipstick_3":0,"glasses_2":0,"skin":4,"glasses_1":-1,"eyebrows_2":0,"sex":0,"bproof_1":0,"ears_2":0,"hair_color_1":3,"eyebrows_4":0,"eyebrows_3":0,"bags_1":23,"pants_2":1,"age_1":0,"lipstick_2":0,"pants_1":4,"makeup_3":0,"torso_1":49,"ears_1":-1,"beard_4":0,"bproof_2":0,"helmet_1":-1,"torso_2":0,"chain_1":0,"mask_2":0,"eyebrows_1":0,"makeup_1":0,"mask_1":17,"chain_2":0,"tshirt_2":0,"tshirt_1":15}', 'MNRP 54136', 'MNRP 99015'),
	('1c58571e499884bf0801c5b5d85d3cfc0e71357d', '{"black_money":0,"money":15375,"bank":1519}', 'user', '{"phone":1}', 'garbage', 0, '[]', '{"x":-302.8,"y":-1507.3,"z":28.4,"heading":97.7}', 'Jelle', 'Van Beek', '30-05-1990', 'm', '180', '[{"name":"hunger","val":692250,"percent":69.22500000000001},{"name":"thirst","val":753800,"percent":75.38}]', NULL, NULL, 0, 1, '8136993', NULL, '{"decals_1":9,"hair_1":2,"pants_1":0,"age_2":0,"makeup_4":0,"arms":11,"glasses_1":5,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":0,"shoes_1":2,"face":4,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":24,"mask_1":3,"beard_2":0,"skin":1,"glasses_2":6,"eyebrows_2":0,"torso_1":42,"bproof_1":0,"eyebrows_4":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"chain_2":0,"helmet_1":12,"lipstick_2":0,"eyebrows_1":0,"makeup_3":0,"tshirt_2":0,"ears_1":2,"shoes_2":0,"bproof_2":0,"pants_2":4,"torso_2":0,"chain_1":0,"mask_2":0,"lipstick_3":0,"makeup_1":0,"helmet_2":2,"sex":0,"ears_2":2,"tshirt_1":0}', NULL, NULL),
	('1f674e9d75b5acedf835f213c7e0517bf9007baf', '{"money":10000,"bank":660,"black_money":0}', 'user', '[]', 'reporter', 0, '[]', '{"z":45.8,"y":2588.1,"x":1779.6,"heading":186.2}', 'Amine', 'Appelmoes', '25/09/2000', 'm', '200', '[{"name":"hunger","percent":86.15,"val":861500},{"name":"thirst","percent":88.92,"val":889200}]', NULL, NULL, 8, 0, '9143341', NULL, '{"decals_1":0,"hair_1":12,"pants_1":3,"age_2":0,"makeup_4":0,"arms":0,"glasses_1":-1,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"beard_1":0,"shoes_1":12,"tshirt_1":0,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"eyebrows_1":0,"lipstick_4":0,"skin":0,"age_1":0,"eyebrows_2":0,"helmet_2":0,"bproof_1":0,"torso_1":82,"hair_color_1":0,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"chain_2":0,"sex":0,"lipstick_2":0,"face":0,"makeup_3":0,"ears_2":0,"ears_1":-1,"mask_1":0,"bproof_2":0,"pants_2":0,"torso_2":8,"chain_1":0,"mask_2":0,"beard_4":0,"makeup_1":0,"glasses_2":0,"beard_2":0,"tshirt_2":0,"helmet_1":-1}', NULL, NULL),
	('205b962c66eceb698b15a993af871fd623cc6064', '{"money":0,"bank":39060,"black_money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":31.2,"y":-955.3,"x":-269.4,"heading":205.8}', '', '', '', '', '', '[]', NULL, NULL, 0, 0, '6023773', NULL, NULL, NULL, NULL),
	('22db920bcbca0829b4c3e00ba379f2d8fe7aaff3', '{"black_money":0,"money":0,"bank":25000}', 'user', '[]', 'unemployed', 0, '[]', '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}', '', '', '', '', '', '[{"name":"hunger","val":998650,"percent":99.86500000000001},{"name":"thirst","val":998920,"percent":99.892}]', NULL, NULL, 0, 0, '6251739', NULL, NULL, NULL, NULL),
	('256d9580ffe173c783db26d766b9a3709e8e1555', '{"money":0,"bank":25380,"black_money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":29.1,"y":-1002.4,"x":-43.8,"heading":341.5}', 'Ali', 'Malik', '02-02-02', 'm', '175', '[{"name":"hunger","percent":98.22999999999999,"val":982300},{"name":"thirst","percent":98.584,"val":985840}]', NULL, NULL, 0, 0, '4670806', NULL, '{"decals_1":0,"hair_1":0,"pants_1":37,"age_2":0,"makeup_4":0,"arms":0,"glasses_1":1,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"mask_1":0,"shoes_1":25,"tshirt_1":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"chain_2":0,"tshirt_2":0,"skin":3,"beard_2":10,"eyebrows_2":0,"eyebrows_1":0,"bproof_1":0,"helmet_2":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"eyebrows_4":0,"sex":0,"lipstick_2":0,"face":1,"makeup_3":0,"glasses_2":0,"ears_1":23,"ears_2":0,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":0,"mask_2":0,"lipstick_3":0,"makeup_1":0,"beard_4":0,"beard_1":9,"torso_1":53,"helmet_1":2}', NULL, NULL),
	('25a4e03167c4b6bf2200414395f8ad5600af312f', '{"bank":55475,"black_money":0,"money":0}', 'user', '{"rugzak":5,"nightstick":1,"bread":15,"water":15,"lightarmor":5,"flashlight":1,"pistol_ammo":149,"phone":1,"stungun":1,"combatpistol":1}', 'police', 9, '[]', '{"heading":150.0,"x":1180.9,"y":538.6,"z":259.6}', 'Robert', 'Hendrinks', '17-08-2000', 'm', '187', '[{"name":"hunger","val":753700,"percent":75.37},{"name":"thirst","val":964960,"percent":96.49600000000001}]', NULL, NULL, 0, 0, '3849304', NULL, '{"beard_1":4,"arms":4,"lipstick_3":0,"bags_1":0,"bproof_2":0,"helmet_1":9,"hair_2":0,"skin":4,"mask_1":31,"hair_1":19,"face":0,"hair_color_2":0,"beard_2":10,"chain_2":0,"tshirt_2":0,"ears_1":-1,"eyebrows_4":0,"makeup_1":0,"mask_2":0,"hair_color_1":0,"beard_4":0,"eyebrows_3":0,"sex":0,"chain_1":0,"eyebrows_1":0,"makeup_2":0,"shoes_2":3,"decals_1":0,"pants_2":1,"age_2":0,"decals_2":0,"makeup_4":0,"ears_2":0,"lipstick_2":0,"pants_1":24,"glasses_1":3,"torso_2":7,"age_1":0,"lipstick_4":0,"tshirt_1":22,"makeup_3":0,"shoes_1":20,"helmet_2":0,"glasses_2":0,"eyebrows_2":0,"bproof_1":0,"beard_3":0,"torso_1":25,"lipstick_1":0,"bags_2":0}', 'MNRP 19542', 'MNRP 57956'),
	('2683c433d7e16ff109754323d6a8f3f3581b68e1', '{"money":0,"bank":24970,"black_money":0}', 'user', '[]', 'garbage', 0, '[]', '{"z":28.2,"y":-983.1,"x":-235.2,"heading":357.6}', 'Ronny', 'Terpstra', '20-04-2002', 'm', '155', '[{"name":"hunger","percent":99.41499999999999,"val":994150},{"name":"thirst","percent":99.532,"val":995320}]', NULL, NULL, 0, 0, '6427246', NULL, '{"decals_1":0,"hair_1":1,"pants_1":0,"age_2":1,"makeup_4":0,"eyebrows_1":0,"helmet_2":0,"hair_2":2,"beard_3":1,"bags_2":0,"shoes_2":0,"mask_1":0,"shoes_1":0,"tshirt_1":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"age_1":1,"sex":5,"skin":1,"beard_4":2,"eyebrows_2":1,"glasses_1":-1,"bproof_1":0,"beard_2":1,"hair_color_1":1,"eyebrows_4":0,"eyebrows_3":1,"bags_1":0,"lipstick_3":0,"helmet_1":-1,"lipstick_2":0,"makeup_3":0,"chain_2":0,"glasses_2":0,"ears_1":-1,"beard_1":1,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":0,"mask_2":0,"arms":0,"makeup_1":0,"face":0,"torso_1":0,"ears_2":0,"tshirt_2":0}', NULL, NULL),
	('28f047a408daa3b2181761b8fd94a329f69117b3', '{"bank":46500,"black_money":0,"money":-6000}', 'user', '[]', 'garbage', 0, '[]', '{"x":-1450.8,"y":1980.4,"z":69.5,"heading":208.8}', 'Quintus ', 'Dix', '04-05-2004', 'm', '180', '[{"name":"hunger","percent":88.915,"val":889150},{"name":"thirst","percent":91.132,"val":911320}]', NULL, NULL, 0, 0, '5799926', NULL, '{"beard_1":0,"arms":17,"makeup_2":0,"bags_1":0,"bproof_2":0,"sex":0,"hair_2":0,"torso_1":108,"mask_1":0,"hair_1":47,"face":0,"hair_color_2":0,"eyebrows_2":0,"chain_2":0,"tshirt_2":1,"ears_1":-1,"eyebrows_4":0,"makeup_1":0,"mask_2":0,"hair_color_1":10,"pants_2":0,"eyebrows_3":0,"beard_4":0,"ears_2":0,"eyebrows_1":0,"age_2":0,"beard_3":0,"decals_1":0,"torso_2":5,"shoes_2":3,"decals_2":0,"makeup_4":0,"glasses_2":0,"lipstick_4":0,"pants_1":24,"glasses_1":-1,"helmet_1":-1,"age_1":0,"lipstick_3":0,"tshirt_1":24,"makeup_3":0,"beard_2":0,"chain_1":0,"lipstick_2":0,"skin":0,"bproof_1":0,"shoes_1":28,"helmet_2":0,"lipstick_1":0,"bags_2":0}', 'MNRP 17933', 'MNRP 39531'),
	('2fb1cf5b013a97b2ec1de6d1bcf7db6cc91cd2a0', '{"money":2125,"bank":28477,"black_money":0}', 'user', '[]', 'garbage', 0, '[]', '{"z":28.7,"y":-1036.6,"x":271.4,"heading":92.1}', 'Jasper ', 'Shelby ', '10-10-1990', 'm', '188', '[{"name":"hunger","percent":79.17999999999999,"val":791800},{"name":"thirst","percent":83.344,"val":833440}]', NULL, NULL, 0, 0, '8093048', NULL, '{"decals_1":0,"hair_1":21,"beard_2":0,"age_2":0,"makeup_4":0,"arms":0,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":14,"mask_1":17,"shoes_1":1,"tshirt_1":0,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"chain_2":0,"pants_1":2,"skin":0,"face":0,"eyebrows_2":0,"glasses_2":0,"bproof_1":0,"age_1":0,"hair_color_1":0,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"pants_2":0,"glasses_1":5,"lipstick_2":0,"lipstick_4":0,"makeup_3":0,"ears_2":0,"ears_1":-1,"sex":0,"bproof_2":0,"helmet_1":-1,"torso_2":3,"chain_1":0,"mask_2":0,"eyebrows_1":0,"makeup_1":0,"beard_4":0,"beard_1":0,"tshirt_2":0,"torso_1":2}', NULL, NULL),
	('303519e413d2d8d09edbacdeb32832e9f6a87973', '{"black_money":0,"money":756,"bank":18486}', 'user', '{"bread":6,"phone":1,"water":6,"coca_leaf":10}', 'mechanic', 6, '[]', '{"x":-3130.9,"y":1126.4,"z":20.6,"heading":338.8}', 'Mees', 'Cock', '8/10/2000 ', 'm', '200', '[{"name":"hunger","val":580200,"percent":58.02},{"name":"thirst","val":684160,"percent":68.416}]', NULL, NULL, 0, 0, '9903594', NULL, '{"lipstick_4":0,"lipstick_3":0,"hair_color_2":0,"lipstick_2":0,"shoes_2":0,"makeup_4":0,"bags_1":0,"torso_1":171,"lipstick_1":0,"tshirt_2":0,"makeup_3":0,"age_1":0,"eyebrows_2":0,"pants_2":0,"helmet_2":0,"ears_1":-1,"beard_3":0,"decals_2":0,"bproof_2":0,"bags_2":0,"bproof_1":0,"glasses_1":-1,"helmet_1":50,"pants_1":10,"hair_2":0,"torso_2":0,"sex":0,"decals_1":0,"beard_1":0,"shoes_1":2,"skin":0,"eyebrows_1":0,"mask_1":17,"beard_4":0,"eyebrows_3":0,"age_2":0,"tshirt_1":0,"beard_2":0,"eyebrows_4":0,"makeup_2":0,"glasses_2":0,"hair_1":2,"chain_2":0,"face":0,"makeup_1":0,"chain_1":0,"mask_2":0,"hair_color_1":11,"ears_2":0,"arms":1}', NULL, NULL),
	('3157a97dab0f65d1f3dea42b965f26db876b9e43', '{"bank":61311,"black_money":0,"money":0}', 'user', '{"rugzak":10,"nightstick":1,"bread":11,"water":12,"lightarmor":5,"flashlight":1,"pistol_ammo":150,"phone":1,"stungun":1,"combatpistol":1}', 'police', 2, '[]', '{"heading":34.9,"x":127.3,"y":6571.3,"z":31.1}', 'Matthijs', 'S        ', '22-06-1998', 'm', '190', '[{"name":"hunger","val":359450,"percent":35.945},{"name":"thirst","val":387560,"percent":38.756}]', NULL, NULL, 0, 0, '7321533', NULL, '{"beard_1":4,"arms":30,"makeup_2":0,"bags_1":0,"bproof_2":0,"sex":0,"hair_2":0,"shoes_1":7,"mask_1":141,"hair_1":73,"face":0,"hair_color_2":0,"age_2":0,"lipstick_4":0,"tshirt_2":0,"glasses_2":5,"eyebrows_4":0,"makeup_1":0,"mask_2":0,"hair_color_1":61,"pants_2":5,"eyebrows_3":0,"beard_2":10,"lipstick_2":0,"eyebrows_1":0,"lipstick_3":0,"ears_2":0,"decals_1":0,"eyebrows_2":10,"helmet_2":0,"decals_2":0,"makeup_4":0,"ears_1":-1,"chain_2":0,"pants_1":4,"glasses_1":10,"helmet_1":9,"age_1":0,"bproof_1":0,"beard_3":0,"makeup_3":0,"skin":4,"beard_4":0,"chain_1":0,"torso_1":100,"shoes_2":3,"torso_2":0,"tshirt_1":15,"lipstick_1":0,"bags_2":0}', 'MNRP 57345', 'MNRP 32717'),
	('34251b7753bc09a5c92563c49ed1ad00ca29b745', '{"money":25000,"bank":380,"black_money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":25.8,"y":-1099.6,"x":-46.5,"heading":71.9}', 'Jeroen', 'Van Oostdonk', '2000-02-20', 'm', '180', '[{"name":"hunger","percent":95.41,"val":954100},{"name":"thirst","percent":96.328,"val":963280}]', NULL, NULL, 0, 0, '7164154', NULL, '{"beard_1":3,"arms":19,"lipstick_3":0,"bags_1":0,"bproof_2":0,"sex":0,"hair_2":0,"shoes_1":7,"mask_1":0,"hair_1":10,"face":34,"hair_color_2":0,"beard_2":10,"lipstick_4":0,"tshirt_2":0,"glasses_2":4,"eyebrows_4":0,"makeup_1":0,"mask_2":0,"hair_color_1":3,"beard_4":0,"eyebrows_3":0,"chain_2":0,"ears_2":0,"eyebrows_1":0,"age_2":0,"pants_2":0,"decals_1":0,"decals_2":0,"shoes_2":6,"helmet_2":0,"makeup_4":0,"skin":4,"chain_1":0,"pants_1":4,"glasses_1":3,"makeup_2":0,"age_1":0,"helmet_1":-1,"tshirt_1":15,"makeup_3":0,"eyebrows_2":0,"torso_1":234,"torso_2":2,"lipstick_2":0,"bproof_1":0,"beard_3":0,"ears_1":-1,"lipstick_1":0,"bags_2":0}', 'MNRP 18003', 'MNRP 72946'),
	('34d8f26cc32ab8703bf28c4dd0d508859b818d13', '{"black_money":0,"bank":26217,"money":1904}', 'user', '{"stungun":1,"flashlight":1,"nightstick":1,"bread":20,"combatpistol":1,"phone":1,"pistol_ammo":147,"water":20}', 'police', 1, '[]', '{"heading":266.2,"z":26.8,"y":-991.3,"x":468.5}', 'Martin', 'Borsato', '08-05-1985', 'm', '196', '[{"percent":71.495,"val":714950,"name":"hunger"},{"percent":77.196,"val":771960,"name":"thirst"}]', NULL, NULL, 0, 0, '8602264', NULL, '{"decals_1":0,"hair_1":57,"beard_2":10,"age_2":0,"makeup_4":0,"eyebrows_1":0,"glasses_1":15,"hair_2":0,"beard_3":3,"bags_2":14,"shoes_2":0,"beard_1":10,"shoes_1":25,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"tshirt_1":16,"arms":0,"skin":2,"lipstick_3":0,"eyebrows_2":0,"pants_1":38,"bproof_1":13,"mask_1":17,"hair_color_1":3,"eyebrows_4":0,"eyebrows_3":0,"bags_1":23,"chain_2":0,"pants_2":0,"lipstick_2":0,"age_1":0,"sex":0,"glasses_2":0,"ears_1":-1,"ears_2":0,"bproof_2":0,"helmet_1":25,"torso_2":0,"chain_1":0,"mask_2":0,"torso_1":65,"makeup_1":0,"helmet_2":1,"beard_4":0,"makeup_3":0,"tshirt_2":0}', NULL, NULL),
	('3a0b9a8c554c8c4a07dd10b5842b05b99e9483cf', '{"black_money":0,"bank":25000,"money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"y":-955.6,"x":-270.4,"heading":205.8,"z":31.2}', 'Stan', 'Klippe', '16-12-2004', 'm', '180', '[{"percent":97.53,"name":"hunger","val":975300},{"percent":98.024,"name":"thirst","val":980240}]', NULL, NULL, 0, 0, '3334320', NULL, '{"beard_1":0,"arms":0,"makeup_2":0,"bags_1":0,"bproof_2":0,"helmet_1":-1,"hair_2":0,"shoes_1":0,"mask_1":0,"hair_1":0,"face":0,"hair_color_2":0,"age_2":0,"chain_2":0,"tshirt_2":0,"glasses_2":0,"eyebrows_4":0,"makeup_1":0,"mask_2":0,"hair_color_1":0,"beard_4":0,"eyebrows_3":0,"shoes_2":0,"lipstick_2":0,"eyebrows_1":0,"tshirt_1":0,"lipstick_3":0,"decals_1":0,"decals_2":0,"ears_1":-1,"helmet_2":0,"makeup_4":0,"sex":0,"beard_2":0,"pants_1":0,"glasses_1":-1,"eyebrows_2":0,"age_1":0,"ears_2":0,"beard_3":0,"makeup_3":0,"pants_2":0,"chain_1":0,"torso_2":0,"skin":0,"bproof_1":0,"torso_1":0,"lipstick_4":0,"lipstick_1":0,"bags_2":0}', 'MNRP 46120', 'MNRP 41815'),
	('468d8e859dd395e754354ed19318802f51777054', '{"black_money":0,"money":0,"bank":44424}', 'user', '[]', 'realestateagent', 0, '[]', '{"x":-287.7,"y":-1475.5,"z":31.0,"heading":343.5}', 'Thijs', 'Boersma', '09-10-1990', 'm', '180', '[{"name":"hunger","val":476400,"percent":47.64},{"name":"thirst","val":481120,"percent":48.112}]', NULL, NULL, 0, 0, '4988311', NULL, '{"beard_3":0,"bags_2":0,"eyebrows_1":0,"lipstick_2":0,"sex":0,"shoes_1":12,"pants_2":0,"lipstick_4":0,"makeup_1":0,"tshirt_1":0,"helmet_2":0,"makeup_4":0,"beard_1":0,"torso_2":0,"face":0,"chain_1":1,"bags_1":0,"torso_1":234,"bproof_1":27,"beard_2":0,"arms":0,"tshirt_2":0,"pants_1":4,"hair_1":21,"ears_2":0,"lipstick_3":0,"shoes_2":6,"hair_color_1":27,"age_1":0,"hair_color_2":0,"mask_1":17,"glasses_1":5,"decals_1":0,"age_2":0,"helmet_1":9,"glasses_2":5,"eyebrows_3":0,"ears_1":-1,"skin":0,"makeup_2":0,"chain_2":0,"lipstick_1":0,"eyebrows_2":0,"hair_2":4,"mask_2":0,"beard_4":0,"decals_2":0,"makeup_3":0,"eyebrows_4":0,"bproof_2":5}', 'MNRP 42504', 'MNRP 70106'),
	('46cf32dd881d4ce580c67d1d9d10ba1413e019ab', '{"bank":34691,"black_money":0,"money":960}', 'user', '{"rifle_ammo":89,"medikit":4,"rugzak":24,"nightstick":1,"bread":5,"water":5,"lightarmor":9,"stungun":1,"combatpistol":1,"phone":1,"pistol_ammo":91,"specialcarbine":1}', 'police', 9, '{"WEAPON_PISTOL":{"ammo":25}}', '{"heading":63.6,"x":471.5,"y":-986.1,"z":26.8}', 'Henkjan ', 'Peters', '16-07-1990', 'm', '190', '[{"name":"hunger","val":806450,"percent":80.645},{"name":"thirst","val":825160,"percent":82.516}]', NULL, NULL, 0, 0, '7783233', NULL, '{"skin":5,"chain_1":22,"hair_color_1":4,"tshirt_1":22,"makeup_3":0,"sex":0,"helmet_2":0,"glasses_2":1,"makeup_2":0,"makeup_4":0,"lipstick_3":0,"age_1":0,"eyebrows_4":0,"helmet_1":-1,"pants_2":1,"lipstick_4":0,"bproof_2":0,"lipstick_1":0,"pants_1":2,"decals_2":0,"beard_3":0,"eyebrows_1":0,"tshirt_2":0,"age_2":0,"ears_2":0,"makeup_1":0,"hair_color_2":0,"shoes_2":5,"hair_2":0,"mask_2":0,"beard_2":10,"mask_1":0,"chain_2":0,"face":0,"eyebrows_3":0,"arms":22,"glasses_1":5,"ears_1":-1,"beard_4":0,"bproof_1":0,"beard_1":11,"hair_1":19,"lipstick_2":0,"eyebrows_2":0,"shoes_1":7,"torso_2":0,"decals_1":0,"torso_1":25,"bags_1":0,"bags_2":0}', 'MNRP 40852', 'MNRP 98714'),
	('477b4d85cdf07dcd8fae87cb4a2ffc33805e1e51', '{"money":0,"bank":25000,"black_money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":31.2,"y":-955.3,"x":-269.4,"heading":205.8}', '', '', '', '', '', '[{"name":"hunger","percent":99.96000000000001,"val":999600},{"name":"thirst","percent":99.968,"val":999680}]', NULL, NULL, 0, 0, '4802917', NULL, NULL, NULL, NULL),
	('4c7e20b18547c074831ecbcd119a349dc9057f9e', '{"money":0,"bank":26384,"black_money":0}', 'user', '[]', 'ambulance', 5, '[]', '{"z":28.8,"y":-572.9,"x":327.0,"heading":229.9}', 'Piet', 'Veenstra', '14-01-1995', 'm', '187', '[{"name":"hunger","percent":92.355,"val":923550},{"name":"thirst","percent":93.884,"val":938840}]', NULL, NULL, 0, 0, '9969787', NULL, '{"decals_1":0,"hair_1":19,"pants_1":63,"age_2":0,"makeup_4":0,"eyebrows_1":0,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":10,"shoes_1":14,"tshirt_1":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"glasses_2":0,"face":19,"skin":0,"glasses_1":-1,"eyebrows_2":10,"beard_2":10,"bproof_1":0,"torso_1":49,"hair_color_1":3,"age_1":0,"eyebrows_3":0,"bags_1":0,"mask_1":0,"chain_2":0,"lipstick_2":0,"shoes_2":0,"makeup_3":0,"ears_2":0,"ears_1":-1,"tshirt_2":0,"bproof_2":0,"pants_2":0,"torso_2":2,"chain_1":0,"mask_2":0,"arms":4,"makeup_1":0,"helmet_1":-1,"lipstick_3":0,"sex":0,"eyebrows_4":0}', NULL, NULL),
	('55b0011ecda01bd93f78795346c7413d6f00f6c4', '{"black_money":0,"bank":25851,"money":0}', 'user', '[]', 'police', 9, '[]', '{"heading":257.9,"x":251.5,"y":-1010.5,"z":29.3}', 'Mitchell', 'Sloot', '03-12-1994', 'm', '186', '[{"val":828050,"percent":82.80499999999999,"name":"hunger"},{"val":862440,"percent":86.244,"name":"thirst"}]', NULL, NULL, 0, 0, '4340667', NULL, '{"beard_4":0,"shoes_2":0,"eyebrows_2":0,"shoes_1":0,"lipstick_4":0,"tshirt_1":0,"ears_1":-1,"pants_2":0,"glasses_1":-1,"makeup_3":0,"hair_1":0,"age_1":0,"eyebrows_4":0,"hair_color_2":0,"torso_2":0,"decals_1":0,"skin":0,"lipstick_1":0,"ears_2":0,"bproof_2":0,"chain_2":0,"lipstick_3":0,"face":0,"beard_3":0,"eyebrows_1":0,"sex":0,"makeup_2":0,"torso_1":0,"pants_1":0,"makeup_1":0,"lipstick_2":0,"mask_2":0,"mask_1":0,"eyebrows_3":0,"beard_1":0,"decals_2":0,"tshirt_2":0,"helmet_2":0,"age_2":0,"helmet_1":-1,"bags_1":0,"makeup_4":0,"arms":0,"hair_color_1":0,"chain_1":0,"beard_2":0,"glasses_2":0,"hair_2":0,"bags_2":0,"bproof_1":0}', 'MNRP 81561', 'MNRP 46918'),
	('623ca025b6fc4a2c376e80fb01c060f6f151d266', '{"bank":2807,"black_money":0,"money":0}', 'user', '{"coke_pooch":251}', 'mechanic', 1, '[]', '{"x":-566.6,"y":323.3,"z":84.4,"heading":92.2}', 'Colin', 'Jacobs', '05/02/2003', 'm', '185', '[{"name":"hunger","percent":31.71,"val":317100},{"name":"thirst","percent":35.368,"val":353680}]', NULL, NULL, 0, 0, '6187194', NULL, '{"beard_1":0,"arms":48,"makeup_2":0,"bags_1":0,"bproof_2":0,"sex":0,"hair_2":0,"skin":0,"mask_1":17,"hair_1":21,"face":0,"hair_color_2":0,"eyebrows_2":0,"chain_2":0,"tshirt_2":0,"ears_1":-1,"eyebrows_4":0,"makeup_1":0,"mask_2":0,"hair_color_1":0,"beard_4":0,"eyebrows_3":0,"tshirt_1":15,"lipstick_2":0,"eyebrows_1":0,"glasses_2":5,"lipstick_3":0,"decals_1":0,"shoes_1":57,"helmet_1":50,"decals_2":0,"makeup_4":0,"lipstick_4":0,"helmet_2":0,"pants_1":4,"glasses_1":5,"pants_2":12,"age_1":0,"beard_2":10,"beard_3":0,"makeup_3":0,"chain_1":0,"torso_2":2,"bproof_1":0,"age_2":0,"shoes_2":0,"torso_1":13,"ears_2":0,"lipstick_1":0,"bags_2":0}', 'MNRP 81618', 'MNRP 28724'),
	('657e2d16859a7e5655c7a00cc0395177479a38e3', '{"money":0,"bank":21780,"black_money":4851}', 'user', '{"phone":1}', 'cardealer', 3, '[]', '{"z":30.1,"y":-991.2,"x":188.0,"heading":151.8}', 'Xander', 'Sinaloa', '04-05-2003', 'm', '186', '[{"name":"hunger","percent":48.595,"val":485950},{"name":"thirst","percent":48.876,"val":488760}]', NULL, NULL, 0, 0, '3297241', NULL, '{"decals_1":0,"hair_1":12,"pants_1":28,"age_2":0,"makeup_4":0,"eyebrows_1":0,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"mask_1":17,"shoes_1":10,"tshirt_1":31,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"lipstick_4":0,"helmet_1":-1,"skin":0,"beard_2":0,"eyebrows_2":0,"arms":33,"bproof_1":0,"torso_1":104,"hair_color_1":10,"age_1":0,"eyebrows_3":0,"bags_1":0,"glasses_1":5,"face":0,"lipstick_2":0,"beard_1":0,"makeup_3":0,"glasses_2":0,"ears_1":-1,"tshirt_2":2,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":2,"mask_2":0,"eyebrows_4":0,"makeup_1":0,"chain_2":0,"beard_4":0,"sex":0,"ears_2":0}', NULL, NULL),
	('65824048d1d2a80583facb81b7531e3b478a2217', '{"money":2300,"bank":20430,"black_money":0}', 'user', '{"phone":1}', 'miner', 0, '[]', '{"z":28.0,"y":-1000.6,"x":443.3,"heading":40.1}', 'Jan-Pieter', 'Shelby', '2002-02-02', 'm', '183', '[{"name":"hunger","percent":78.94,"val":789400},{"name":"thirst","percent":83.152,"val":831520}]', NULL, NULL, 0, 0, '1694885', NULL, '{"decals_1":0,"hair_1":0,"pants_1":10,"age_2":0,"makeup_4":0,"eyebrows_1":0,"glasses_1":-1,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"mask_1":0,"shoes_1":10,"tshirt_1":4,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"beard_4":0,"helmet_1":-1,"skin":0,"sex":0,"eyebrows_2":0,"face":0,"bproof_1":0,"age_1":0,"hair_color_1":0,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"torso_1":115,"helmet_2":0,"lipstick_2":0,"beard_1":0,"chain_2":0,"tshirt_2":0,"ears_1":-1,"arms":0,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":0,"mask_2":0,"makeup_3":0,"makeup_1":0,"glasses_2":0,"beard_2":0,"lipstick_3":0,"ears_2":0}', NULL, NULL),
	('6ca9ccc89c4036628cb292e614c8e4927ab29fa5', '{"black_money":0,"money":95,"bank":34813}', 'user', '{"pistol_ammo":150,"stungun":1,"combatpistol":1,"water":30,"phone":1,"medikit":10,"lightarmor":10,"nightstick":1,"bread":30,"flashlight":1,"rugzak":10,"demper":2}', 'police', 9, '[]', '{"x":463.8,"y":-992.0,"z":26.8,"heading":127.3}', 'Sander', 'Blub', '07-05-1990', 'm', '198', '[{"name":"hunger","val":524650,"percent":52.46499999999999},{"name":"thirst","val":619720,"percent":61.97200000000001}]', NULL, NULL, 0, 0, '3632598', NULL, '{"lipstick_4":0,"tshirt_1":0,"hair_color_2":0,"lipstick_2":0,"shoes_2":0,"beard_2":0,"bags_1":0,"torso_1":2,"lipstick_1":0,"tshirt_2":0,"makeup_3":0,"hair_1":18,"eyebrows_2":0,"makeup_1":0,"chain_2":0,"ears_1":-1,"beard_3":0,"ears_2":0,"bproof_2":0,"bags_2":0,"bproof_1":0,"glasses_1":-1,"age_2":0,"pants_1":2,"hair_2":0,"torso_2":0,"lipstick_3":0,"decals_1":0,"helmet_2":0,"eyebrows_3":0,"skin":0,"helmet_1":-1,"mask_1":0,"face":0,"beard_4":0,"beard_1":0,"eyebrows_1":0,"pants_2":0,"eyebrows_4":0,"decals_2":0,"glasses_2":0,"arms":0,"makeup_4":0,"sex":0,"shoes_1":15,"chain_1":0,"mask_2":0,"hair_color_1":8,"age_1":0,"makeup_2":0}', NULL, NULL),
	('6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9', '{"black_money":0,"money":0,"bank":122946}', 'user', '{"bread":2,"water":2}', 'garbage', 0, '[]', '{"x":687.7,"y":5513.3,"z":629.0,"heading":79.5}', 'Miguel', 'Galindo', '02-12-1997', 'm', '178', '[{"name":"hunger","val":427100,"percent":42.71},{"name":"thirst","val":601680,"percent":60.168}]', NULL, NULL, 0, 1, '2089294', NULL, '{"beard_3":0,"bags_2":0,"age_1":8,"lipstick_2":0,"sex":0,"shoes_1":24,"hair_2":0,"lipstick_4":0,"makeup_1":0,"beard_4":0,"mask_2":0,"makeup_4":0,"beard_1":11,"glasses_1":15,"mask_1":17,"chain_1":17,"bags_1":56,"torso_1":139,"bproof_1":9,"decals_2":0,"arms":55,"tshirt_2":0,"pants_1":9,"hair_1":47,"ears_2":0,"lipstick_3":0,"shoes_2":0,"hair_color_1":61,"torso_2":3,"hair_color_2":0,"lipstick_1":0,"glasses_2":0,"face":0,"skin":4,"eyebrows_1":28,"beard_2":10,"eyebrows_4":0,"ears_1":-1,"makeup_3":0,"makeup_2":0,"tshirt_1":15,"pants_2":7,"chain_2":0,"eyebrows_2":10,"age_2":6,"helmet_2":0,"decals_1":0,"bproof_2":2,"helmet_1":51,"eyebrows_3":0}', 'MNRP 39493', 'MNRP 41707'),
	('7d50b4537dbb98ac290c5dc1f56bc59963a7e0e8', '{"money":12375,"bank":26985,"black_money":0}', 'user', '[]', 'garbage', 0, '[]', '{"z":26.4,"y":-1114.1,"x":-42.5,"heading":109.2}', 'Bella', 'Ciao Sinaloa', '1990-10-10', 'm', '190', '[{"name":"hunger","percent":81.77499999999999,"val":817750},{"name":"thirst","percent":85.42,"val":854200}]', NULL, NULL, 0, 0, '4556274', NULL, '{"beard_1":0,"arms":24,"lipstick_3":0,"bags_1":0,"bproof_2":0,"sex":0,"hair_2":0,"torso_1":11,"mask_1":55,"hair_1":7,"face":0,"hair_color_2":0,"eyebrows_2":0,"chain_2":0,"tshirt_2":2,"ears_1":-1,"eyebrows_4":0,"makeup_1":0,"mask_2":0,"hair_color_1":0,"pants_2":0,"eyebrows_3":0,"age_2":0,"lipstick_2":0,"eyebrows_1":0,"helmet_1":51,"beard_2":0,"decals_1":0,"glasses_2":0,"torso_2":1,"helmet_2":0,"makeup_4":0,"makeup_2":0,"bproof_1":0,"pants_1":28,"glasses_1":5,"chain_1":1,"age_1":0,"beard_4":0,"beard_3":0,"makeup_3":0,"ears_2":0,"shoes_1":10,"decals_2":0,"lipstick_4":0,"shoes_2":0,"tshirt_1":22,"skin":0,"lipstick_1":0,"bags_2":0}', 'MNRP 64683', 'MNRP 34043'),
	('854812e40063a2bcbbf10c29bc55296a87904f13', '{"black_money":11700,"bank":78179,"money":15}', 'user', '{"phone":1,"bread":16,"water":17}', 'garbage', 0, '[]', '{"heading":352.4,"z":26.9,"y":-1834.2,"x":-70.5}', 'Goomboa', 'Karimi', '03/10/2003', 'm', '180', '[{"percent":39.57499999999999,"val":395750,"name":"hunger"},{"percent":47.66,"val":476600,"name":"thirst"}]', NULL, '{}', 0, 0, '7329772', NULL, '{"beard_1":10,"arms":17,"lipstick_3":0,"bags_1":23,"bproof_2":0,"sex":0,"hair_2":0,"shoes_1":55,"mask_1":145,"hair_1":18,"face":2,"hair_color_2":0,"beard_2":10,"lipstick_4":0,"tshirt_2":0,"ears_1":-1,"eyebrows_4":17,"makeup_1":0,"mask_2":16,"hair_color_1":38,"beard_4":0,"eyebrows_3":0,"skin":0,"torso_2":3,"eyebrows_1":1,"pants_2":3,"chain_1":0,"decals_1":0,"glasses_2":0,"makeup_2":0,"decals_2":0,"makeup_4":0,"chain_2":0,"eyebrows_2":6,"pants_1":77,"glasses_1":-1,"torso_1":178,"age_1":0,"shoes_2":3,"beard_3":38,"makeup_3":0,"lipstick_2":0,"helmet_1":115,"helmet_2":16,"ears_2":0,"bproof_1":0,"tshirt_1":0,"age_2":0,"lipstick_1":0,"bags_2":2}', 'MNRP 71487', 'MNRP 78124'),
	('87b22c3823eca7892d62ccfd05086dac866d510c', '{"money":500,"bank":4004,"black_money":0}', 'user', '{"petrol":1}', 'fueler', 0, '[]', '{"z":5.1,"y":-3031.9,"x":772.0,"heading":29.1}', 'Thom', 'Shelby', '25-06-2000', 'm', '180', '[{"name":"hunger","percent":85.705,"val":857050},{"name":"thirst","percent":88.564,"val":885640}]', NULL, NULL, 0, 0, '8223785', NULL, '{"decals_1":0,"hair_1":40,"beard_2":10,"age_2":0,"makeup_4":0,"eyebrows_1":0,"glasses_1":-1,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"beard_1":10,"shoes_1":10,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"mask_1":41,"tshirt_1":4,"skin":0,"arms":17,"eyebrows_2":0,"helmet_2":0,"bproof_1":0,"glasses_2":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"sex":0,"ears_2":0,"lipstick_2":0,"eyebrows_4":0,"makeup_3":0,"tshirt_2":0,"ears_1":-1,"lipstick_3":0,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":24,"mask_2":0,"torso_1":115,"makeup_1":0,"pants_1":28,"beard_4":0,"chain_2":2,"helmet_1":-1}', NULL, NULL),
	('893ffc926e30d183fb9d6b3240942e09bca081a3', '{"black_money":0,"bank":6349,"money":11000}', 'user', '{"stungun":1,"flashlight":1,"nightstick":1,"bread":6,"combatpistol":1,"phone":1,"pistol_ammo":149,"water":17}', 'police', 3, '[]', '{"heading":14.7,"z":28.0,"y":-1016.4,"x":448.2}', 'Sponsor', 'Loop', '10-03-1980', 'm', '180', '[{"percent":69.63000000000001,"val":696300,"name":"hunger"},{"percent":61.704,"val":617040,"name":"thirst"}]', NULL, NULL, 0, 0, '5963073', NULL, '{"ears_2":0,"beard_4":0,"sex":0,"makeup_1":0,"age_1":0,"eyebrows_1":2,"tshirt_1":0,"age_2":0,"eyebrows_2":10,"mask_2":0,"decals_1":0,"ears_1":-1,"bproof_1":0,"face":0,"hair_1":13,"helmet_1":104,"chain_2":0,"tshirt_2":0,"makeup_3":0,"eyebrows_3":0,"decals_2":0,"torso_1":260,"makeup_4":0,"pants_2":0,"pants_1":4,"beard_1":22,"shoes_1":0,"bags_1":0,"lipstick_1":0,"skin":0,"chain_1":0,"glasses_2":7,"eyebrows_4":0,"hair_2":0,"arms":0,"lipstick_2":0,"lipstick_3":0,"makeup_2":0,"hair_color_1":19,"bags_2":0,"glasses_1":15,"helmet_2":20,"mask_1":17,"hair_color_2":0,"shoes_2":0,"beard_2":10,"torso_2":2,"beard_3":19,"lipstick_4":0,"bproof_2":0}', 'MNRP 78518', 'MNRP 27758'),
	('8a249fe36729c5f2fe0377983d6cbd74d6590c79', '{"bank":0,"black_money":0,"money":0}', 'user', '{"bread":30,"phone":1,"water":30}', 'garbage', 0, '[]', '{"heading":169.2,"x":1711.3,"y":3594.6,"z":35.4}', 'Kees', 'De Jong', '1969/04/20', 'm', '200', '[{"name":"hunger","val":859100,"percent":85.91},{"name":"thirst","val":867280,"percent":86.72800000000001}]', NULL, '{}', 0, 0, '7639862', NULL, '{"eyebrows_3":0,"mask_2":0,"makeup_4":0,"torso_2":10,"beard_4":0,"hair_1":40,"glasses_1":-1,"glasses_2":0,"shoes_2":10,"arms":17,"face":0,"helmet_2":0,"lipstick_3":0,"sex":0,"chain_2":0,"pants_1":77,"beard_3":0,"mask_1":145,"ears_1":-1,"bags_2":11,"makeup_1":0,"makeup_3":0,"ears_2":0,"torso_1":178,"lipstick_2":0,"pants_2":10,"skin":0,"age_1":0,"tshirt_1":0,"beard_2":0,"eyebrows_1":0,"hair_color_2":0,"lipstick_1":0,"eyebrows_2":0,"bags_1":23,"age_2":0,"helmet_1":115,"chain_1":0,"hair_2":0,"beard_1":0,"makeup_2":0,"bproof_1":0,"bproof_2":0,"shoes_1":55,"decals_2":0,"eyebrows_4":0,"hair_color_1":26,"tshirt_2":0,"decals_1":0,"lipstick_4":0}', 'MNRP 37866', 'MNRP 64751'),
	('8c001bcdd122e455f5f4e750b4db42fdf5d99871', '{"bank":12819,"black_money":0,"money":985}', 'user', '{"medikit":12,"rugzak":1,"nightstick":1,"bread":496,"water":97,"lightarmor":5,"flashlight":1,"combatpistol":1,"phone":1,"stungun":1,"pistol_ammo":148}', 'police', 1, '[]', '{"heading":258.2,"x":482.4,"y":-1021.7,"z":27.9}', 'Esnor', 'Lexa', '24/10/1800', 'm', '190', '[{"name":"hunger","val":812050,"percent":81.205},{"name":"thirst","val":809640,"percent":80.964}]', '[{"texture":7,"collection":"mpimportexport_overlays"}]', NULL, 0, 0, '5418151', NULL, '{"skin":0,"chain_1":0,"eyebrows_3":0,"tshirt_1":4,"makeup_3":0,"sex":0,"helmet_2":0,"glasses_2":5,"makeup_2":0,"makeup_4":0,"lipstick_3":0,"age_1":0,"eyebrows_4":0,"torso_2":1,"pants_2":0,"lipstick_4":0,"bproof_2":0,"lipstick_1":0,"pants_1":28,"decals_2":0,"beard_3":0,"eyebrows_1":0,"tshirt_2":0,"glasses_1":5,"ears_2":0,"eyebrows_2":0,"hair_2":0,"shoes_1":10,"lipstick_2":0,"mask_2":0,"beard_2":0,"mask_1":0,"chain_2":0,"makeup_1":0,"shoes_2":0,"arms":1,"bags_2":0,"ears_1":1,"beard_4":0,"bproof_1":0,"beard_1":0,"hair_1":10,"hair_color_1":29,"torso_1":20,"face":0,"decals_1":0,"hair_color_2":0,"age_2":0,"bags_1":0,"helmet_1":-1}', NULL, NULL),
	('8caaf012e059c13c6e1ede05366effed2a5764de', '{"money":0,"bank":28380,"black_money":0}', 'user', '[]', 'garbage', 0, '[]', '{"z":48.6,"y":2574.4,"x":1779.3,"heading":322.0}', 'Hai', 'Bye', '20/05/1990', 'm', '180', '[{"name":"hunger","percent":46.105,"val":461050},{"name":"thirst","percent":46.884,"val":468840}]', NULL, NULL, 23, 0, '5292907', NULL, '{"decals_1":0,"hair_1":2,"beard_2":0,"age_2":0,"makeup_4":0,"arms":0,"glasses_1":-1,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":0,"shoes_1":0,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"lipstick_3":0,"pants_1":4,"skin":0,"helmet_1":-1,"eyebrows_2":0,"glasses_2":0,"bproof_1":0,"chain_2":0,"hair_color_1":0,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"tshirt_1":0,"shoes_2":0,"lipstick_2":0,"age_1":0,"makeup_3":0,"torso_1":8,"ears_1":-1,"sex":0,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":0,"mask_2":0,"eyebrows_1":0,"makeup_1":0,"helmet_2":0,"mask_1":0,"tshirt_2":0,"ears_2":0}', NULL, NULL),
	('9382c0e2d6eae4ad9f7306ce8161e478b1918ac2', '{"money":1498,"bank":22880,"black_money":0}', 'user', '{"phone":1}', 'unemployed', 0, '[]', '{"z":19.9,"y":-2401.6,"x":727.5,"heading":300.9}', 'Fr', 'Fr', '155', 'm', '155', '[{"name":"hunger","percent":95.345,"val":953450},{"name":"thirst","percent":97.74000000000001,"val":977400}]', NULL, NULL, 0, 0, '7686828', NULL, '{"decals_1":0,"hair_1":0,"beard_2":0,"age_2":0,"makeup_4":0,"arms":0,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":0,"shoes_1":0,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"lipstick_3":0,"tshirt_1":0,"skin":0,"glasses_1":-1,"eyebrows_2":0,"mask_1":0,"bproof_1":0,"chain_2":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"pants_1":0,"tshirt_2":0,"lipstick_2":0,"shoes_2":0,"makeup_3":0,"ears_2":0,"ears_1":-1,"pants_2":0,"bproof_2":0,"helmet_1":-1,"torso_2":1,"chain_1":0,"mask_2":0,"eyebrows_1":0,"makeup_1":0,"glasses_2":0,"torso_1":7,"eyebrows_4":0,"sex":0}', NULL, NULL),
	('a26f419014de3c0f1dc60e310b4e363bcaf060d3', '{"money":0,"bank":7380,"black_money":0}', 'user', '[]', 'garbage', 0, '[]', '{"z":30.6,"y":-791.9,"x":232.3,"heading":242.4}', 'Mike', 'Sinaloa', '16-05-2000', 'm', '183', '[{"name":"hunger","percent":86.78,"val":867800},{"name":"thirst","percent":89.424,"val":894240}]', NULL, NULL, 0, 0, '6848571', NULL, '{"decals_1":5,"hair_1":8,"beard_2":0,"age_2":0,"makeup_4":0,"arms":27,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"mask_1":55,"shoes_1":10,"tshirt_1":22,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"face":0,"eyebrows_4":0,"skin":0,"sex":0,"eyebrows_2":0,"pants_1":28,"bproof_1":0,"eyebrows_1":0,"hair_color_1":55,"age_1":0,"eyebrows_3":0,"bags_1":0,"glasses_1":8,"shoes_2":0,"lipstick_2":0,"pants_2":0,"makeup_3":0,"ears_2":0,"ears_1":-1,"lipstick_4":0,"bproof_2":0,"helmet_1":50,"torso_2":0,"chain_1":5,"mask_2":0,"chain_2":0,"makeup_1":0,"beard_1":0,"glasses_2":0,"tshirt_2":4,"torso_1":11}', NULL, NULL),
	('ac90d3decdf0304869352296bd3eda2e234bb869', '{"bank":10231,"black_money":0,"money":900}', 'user', '{"water":50,"phone":1}', 'mechanic', 7, '[]', '{"heading":235.1,"x":246.4,"y":-799.8,"z":30.3}', 'Karel', 'Overmans', '1977', 'm', '200', '[{"name":"hunger","val":755200,"percent":75.52},{"name":"thirst","val":804160,"percent":80.416}]', NULL, NULL, 0, 0, '6532989', NULL, '{"decals_1":0,"hair_1":9,"beard_2":10,"age_2":6,"makeup_4":0,"arms":1,"glasses_1":17,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":21,"shoes_1":20,"face":13,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"glasses_2":7,"pants_2":0,"skin":1,"sex":0,"eyebrows_2":0,"chain_2":0,"bproof_1":0,"pants_1":7,"hair_color_1":27,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"mask_1":57,"torso_1":38,"lipstick_2":0,"eyebrows_1":0,"makeup_3":0,"tshirt_2":9,"ears_1":-1,"age_1":11,"bproof_2":0,"helmet_1":105,"torso_2":0,"chain_1":0,"mask_2":0,"helmet_2":23,"makeup_1":0,"tshirt_1":11,"shoes_2":0,"ears_2":0,"lipstick_3":0}', NULL, NULL),
	('b0f52bbad39871f886445279437163b33ecaaa81', '{"money":0,"bank":19385,"black_money":0}', 'user', '{"coke_pooch":250,"coca_leaf":1}', 'windowcleaner', 0, '[]', '{"heading":70.1,"x":68.3,"y":-1433.3,"z":29.3}', 'Thijn', 'Hazekamp', '17-10-2002', 'm', '200', '[{"val":583500,"percent":58.35,"name":"hunger"},{"val":666800,"percent":66.67999999999999,"name":"thirst"}]', NULL, NULL, 0, 0, '7867004', NULL, '{"decals_1":0,"hair_1":2,"pants_1":37,"age_2":0,"makeup_4":0,"arms":1,"glasses_1":5,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":0,"shoes_1":27,"tshirt_1":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"beard_2":0,"sex":0,"skin":0,"mask_1":55,"eyebrows_2":0,"glasses_2":0,"bproof_1":0,"helmet_2":0,"hair_color_1":4,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"chain_2":12,"tshirt_2":0,"lipstick_2":0,"torso_1":50,"makeup_3":0,"ears_2":0,"ears_1":-1,"shoes_2":0,"bproof_2":0,"pants_2":2,"torso_2":0,"chain_1":4,"mask_2":0,"face":0,"makeup_1":0,"eyebrows_1":0,"age_1":0,"lipstick_3":0,"helmet_1":52}', NULL, NULL),
	('b13b12c162404f3ac4bd2a36470118f23c755794', '{"bank":10392,"black_money":0,"money":1380}', 'user', '[]', 'windowcleaner', 0, '[]', '{"heading":163.4,"x":361.9,"y":-593.7,"z":28.7}', 'Kimberley', 'Wanders', '18-02-2005', 'f', '150', '[{"name":"hunger","val":817550,"percent":81.755},{"name":"thirst","val":854040,"percent":85.404}]', NULL, NULL, 0, 0, '5578552', NULL, '{"decals_1":0,"hair_1":15,"pants_1":23,"age_2":0,"makeup_4":0,"eyebrows_1":2,"helmet_2":0,"hair_2":4,"beard_3":0,"bags_2":0,"shoes_2":1,"mask_1":0,"shoes_1":10,"face":6,"lipstick_1":0,"lipstick_3":3,"decals_2":0,"makeup_2":0,"hair_color_2":0,"tshirt_1":27,"ears_2":0,"skin":5,"sex":1,"eyebrows_2":6,"eyebrows_4":4,"bproof_1":0,"glasses_1":5,"hair_color_1":3,"age_1":4,"eyebrows_3":3,"bags_1":0,"helmet_1":-1,"glasses_2":0,"lipstick_2":0,"lipstick_4":0,"makeup_3":1,"torso_1":7,"ears_1":0,"chain_2":0,"bproof_2":0,"pants_2":0,"torso_2":1,"chain_1":0,"mask_2":0,"beard_1":0,"makeup_1":9,"beard_2":0,"arms":6,"beard_4":0,"tshirt_2":0}', 'MNRP 13579', 'MNRP 56627'),
	('b28c27f38441e9fecacf05250de37e42bd447c3b', '{"money":0,"bank":25760,"black_money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":-1.4,"y":-5.9,"x":-7.6,"heading":44.2}', 'Souf', 'Lotus', '01/01/1990', 'm', '195', '[{"name":"hunger","percent":93.185,"val":931850},{"name":"thirst","percent":94.548,"val":945480}]', NULL, NULL, 0, 0, '3930877', NULL, '{"decals_1":0,"hair_1":14,"pants_1":105,"age_2":0,"makeup_4":0,"arms":26,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":0,"shoes_1":28,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"tshirt_1":15,"glasses_1":-1,"skin":3,"eyebrows_1":0,"eyebrows_2":0,"mask_1":125,"bproof_1":0,"glasses_2":0,"hair_color_1":27,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"ears_2":0,"lipstick_3":0,"lipstick_2":0,"sex":0,"makeup_3":0,"torso_1":82,"ears_1":-1,"beard_2":0,"bproof_2":0,"helmet_1":-1,"torso_2":8,"chain_1":6,"mask_2":19,"age_1":0,"makeup_1":0,"shoes_2":0,"chain_2":0,"tshirt_2":0,"pants_2":2}', NULL, NULL),
	('b8be3d071f442fa70ef75b6ee2497ebf3100a42d', '{"black_money":0,"money":0,"bank":24}', 'user', '[]', 'taxi', 0, '[]', '{"x":-292.1,"y":-1480.4,"z":30.8,"heading":332.5}', 'Josh', 'Bee', '08-12-2000', 'm', '190', '[{"name":"hunger","val":907900,"percent":90.79},{"name":"thirst","val":926320,"percent":92.632}]', NULL, NULL, 0, 0, '2063476', NULL, '{"beard_3":0,"bags_2":0,"age_1":0,"lipstick_2":0,"decals_1":5,"shoes_1":1,"pants_2":0,"lipstick_4":0,"makeup_1":0,"beard_4":0,"mask_2":0,"makeup_4":0,"beard_1":0,"glasses_1":-1,"face":1,"chain_1":0,"bags_1":0,"torso_1":8,"bproof_1":0,"eyebrows_4":0,"arms":0,"tshirt_2":0,"pants_1":1,"hair_1":0,"ears_2":0,"lipstick_3":0,"shoes_2":0,"lipstick_1":0,"skin":2,"hair_color_2":0,"hair_color_1":0,"torso_2":0,"helmet_2":0,"tshirt_1":0,"decals_2":0,"mask_1":0,"sex":0,"ears_1":-1,"makeup_3":0,"makeup_2":0,"glasses_2":0,"helmet_1":-1,"eyebrows_1":0,"chain_2":0,"eyebrows_2":0,"hair_2":0,"bproof_2":0,"age_2":0,"beard_2":0,"eyebrows_3":0}', NULL, NULL),
	('baeab599a7148a331c131954de1a6605000bd165', '{"money":0,"bank":25012,"black_money":0}', 'user', '[]', 'taxi', 0, '[]', '{"z":28.7,"y":-1049.5,"x":315.3,"heading":98.9}', 'John', 'Schneider', '5 25 1999', 'm', '199', '[{"name":"hunger","percent":98.215,"val":982150},{"name":"thirst","percent":98.572,"val":985720}]', NULL, NULL, 0, 0, '3550476', NULL, '{"decals_1":0,"hair_1":3,"beard_2":0,"age_2":0,"makeup_4":0,"arms":0,"glasses_1":-1,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"mask_1":0,"shoes_1":32,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"age_1":0,"ears_2":0,"skin":0,"helmet_1":-1,"eyebrows_2":0,"lipstick_3":0,"bproof_1":0,"tshirt_2":0,"hair_color_1":0,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"shoes_2":0,"tshirt_1":15,"lipstick_2":0,"sex":0,"makeup_3":0,"torso_1":187,"ears_1":-1,"eyebrows_1":0,"bproof_2":0,"pants_2":2,"torso_2":10,"chain_1":0,"mask_2":0,"helmet_2":0,"makeup_1":0,"beard_1":0,"chain_2":0,"glasses_2":0,"pants_1":78}', NULL, NULL),
	('bba5a10878001eaf23160ade255dbc1d4bae03b7', '{"black_money":0,"bank":13182,"money":1625}', 'user', '{"petrol_raffin":18,"petrol":1}', 'fueler', 0, '[]', '{"heading":257.0,"z":24.5,"y":1415.4,"x":2736.7}', 'Steve', 'Trelique', '28-06-1999', 'm', '200', '[{"percent":49.355,"val":493550,"name":"hunger"},{"percent":59.484,"val":594840,"name":"thirst"}]', NULL, NULL, 0, 0, '9551757', NULL, '{"ears_2":0,"beard_4":0,"sex":0,"makeup_1":0,"age_1":0,"eyebrows_1":0,"tshirt_1":15,"age_2":0,"eyebrows_2":0,"mask_2":0,"decals_1":0,"ears_1":-1,"bproof_1":0,"face":0,"hair_1":12,"helmet_1":-1,"arms":0,"tshirt_2":0,"makeup_2":0,"makeup_3":0,"decals_2":0,"torso_1":2,"bags_1":0,"pants_2":0,"pants_1":2,"lipstick_4":0,"mask_1":0,"makeup_4":0,"lipstick_1":0,"chain_1":0,"shoes_2":3,"glasses_2":0,"chain_2":0,"hair_2":0,"hair_color_1":0,"lipstick_2":0,"lipstick_3":0,"hair_color_2":0,"shoes_1":7,"bags_2":0,"glasses_1":-1,"helmet_2":0,"eyebrows_4":0,"skin":0,"eyebrows_3":0,"beard_2":0,"torso_2":4,"beard_3":0,"beard_1":0,"bproof_2":0}', NULL, NULL),
	('bf04013a1acd21ba814044b5488df8e9a23a0d7e', '{"money":0,"bank":25000,"black_money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":31.2,"y":-979.8,"x":-258.1,"heading":208.6}', 'Mark', 'Black Mafia', '1983-04-06', 'm', '200', '[{"name":"hunger","percent":99.81,"val":998100},{"name":"thirst","percent":99.848,"val":998480}]', NULL, NULL, 0, 0, '6181427', NULL, '{"decals_1":0,"hair_1":0,"pants_1":0,"age_2":0,"makeup_4":0,"eyebrows_1":0,"glasses_1":-1,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"beard_1":0,"shoes_1":0,"face":0,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"age_1":0,"mask_1":0,"skin":0,"torso_1":0,"eyebrows_2":0,"ears_2":0,"bproof_1":0,"beard_2":0,"hair_color_1":0,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"tshirt_2":0,"helmet_1":-1,"lipstick_2":0,"helmet_2":0,"makeup_3":0,"glasses_2":0,"ears_1":-1,"lipstick_3":0,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":0,"mask_2":0,"beard_4":0,"makeup_1":0,"tshirt_1":0,"arms":0,"chain_2":0,"sex":0}', NULL, NULL),
	('c0cd8109c04899c9a7dc9177531bead5cbd72bd4', '{"bank":5337,"black_money":0,"money":12960}', 'user', '{"bread":1,"water":1}', 'garbage', 0, '[]', '{"heading":179.7,"x":-321.4,"y":-1544.4,"z":30.8}', 'Mootje', 'Karimi', '10-09-1998', 'm', '200', '[{"name":"hunger","val":746050,"percent":74.605},{"name":"thirst","val":776840,"percent":77.684}]', NULL, '{}', 0, 0, '2562255', NULL, '{"skin":5,"chain_1":0,"eyebrows_3":33,"tshirt_1":0,"lipstick_2":0,"sex":0,"helmet_2":7,"glasses_2":0,"makeup_2":0,"makeup_4":0,"face":0,"age_1":0,"eyebrows_4":0,"makeup_1":0,"pants_2":4,"lipstick_4":0,"bproof_2":0,"lipstick_1":0,"pants_1":77,"decals_2":0,"glasses_1":-1,"eyebrows_1":1,"tshirt_2":0,"beard_4":0,"ears_2":0,"hair_color_1":33,"decals_1":0,"shoes_1":55,"shoes_2":4,"mask_2":7,"beard_2":10,"mask_1":145,"hair_color_2":0,"lipstick_3":0,"torso_1":178,"arms":17,"bags_2":0,"ears_1":-1,"makeup_3":0,"bproof_1":0,"beard_1":13,"hair_1":12,"beard_3":33,"hair_2":0,"eyebrows_2":9,"torso_2":4,"chain_2":0,"age_2":0,"bags_1":0,"helmet_1":115}', NULL, NULL),
	('c9c13e5ed18c956773dd0c4dc28c02070020fe3d', '{"bank":27843,"black_money":0,"money":220}', 'user', '{"bread":5,"phone":1,"water":5}', 'mechanic', 7, '[]', '{"heading":346.8,"x":231.1,"y":-794.6,"z":30.6}', 'Meneer', 'Hanenkam', '14-12-1999', 'm', '198', '[{"name":"hunger","val":662150,"percent":66.215},{"name":"thirst","val":769720,"percent":76.972}]', NULL, NULL, 0, 0, '4287109', NULL, '{"chain_2":0,"lipstick_1":0,"lipstick_4":0,"beard_4":0,"hair_2":0,"hair_color_2":7,"bproof_2":0,"mask_2":0,"torso_2":0,"skin":7,"arms":0,"lipstick_2":0,"age_1":0,"glasses_1":5,"makeup_1":0,"eyebrows_3":0,"pants_1":7,"eyebrows_2":4,"decals_1":0,"makeup_3":0,"beard_3":0,"beard_1":7,"lipstick_3":0,"ears_1":3,"eyebrows_1":0,"helmet_1":12,"shoes_2":6,"mask_1":48,"ears_2":0,"face":3,"age_2":3,"hair_1":34,"bags_2":2,"makeup_2":0,"pants_2":2,"beard_2":10,"bags_1":21,"tshirt_1":1,"eyebrows_4":0,"tshirt_2":5,"glasses_2":5,"decals_2":0,"makeup_4":0,"chain_1":0,"bproof_1":0,"hair_color_1":33,"shoes_1":15,"torso_1":4,"sex":0,"helmet_2":0}', NULL, NULL),
	('cd4b446d0873d0d2943bc3bace3c55692e953516', '{"black_money":0,"money":161,"bank":200}', 'user', '{"bread":8,"phone":1,"water":10}', 'garbage', 0, '[]', '{"x":-65.6,"y":-1837.5,"z":26.8,"heading":232.2}', 'Emre', 'Karimi', '10-09-1990', 'm', '200', '[{"name":"hunger","val":745950,"percent":74.595},{"name":"thirst","val":656760,"percent":65.676}]', NULL, '{"prop_cash_case_02":{"price":50,"amount":1,"label":"Cash Case"},"prop_amb_beer_bottle":{"price":50,"label":"Beer 3","amount":1},"prop_mr_rasberryclean":{"price":100,"label":"Rasberry","amount":1},"prop_fib_plant_01":{"price":100,"label":"Plant 4","amount":1}}', 0, 0, '7933746', NULL, '{"beard_1":0,"arms":39,"makeup_2":0,"bags_1":23,"bproof_2":0,"helmet_1":115,"hair_2":0,"skin":3,"mask_1":145,"hair_1":19,"face":0,"hair_color_2":0,"age_2":0,"chain_2":0,"tshirt_2":0,"ears_1":-1,"eyebrows_4":0,"makeup_1":0,"mask_2":15,"hair_color_1":19,"pants_2":5,"eyebrows_3":0,"glasses_2":0,"chain_1":0,"eyebrows_1":0,"shoes_1":55,"helmet_2":24,"decals_1":0,"lipstick_4":0,"lipstick_2":0,"decals_2":0,"makeup_4":0,"torso_1":178,"sex":0,"pants_1":77,"glasses_1":-1,"ears_2":0,"age_1":0,"beard_4":0,"beard_3":0,"makeup_3":0,"eyebrows_2":0,"lipstick_3":0,"torso_2":5,"beard_2":0,"shoes_2":5,"tshirt_1":15,"bproof_1":0,"lipstick_1":0,"bags_2":13}', 'MNRP 48581', 'MNRP 28819'),
	('d1491d84201f9f3677b8a564300dc0d906188f74', '{"black_money":0,"bank":16617,"money":54}', 'user', '{"phone":1}', 'reporter', 0, '[]', '{"heading":251.9,"z":30.1,"y":-792.4,"x":232.5}', 'Sjoerd', 'Boshert', '09-11-1998', 'm', '180', '[{"percent":83.83500000000001,"val":838350,"name":"hunger"},{"percent":87.068,"val":870680,"name":"thirst"}]', NULL, NULL, 0, 0, '5519500', NULL, '{"ears_2":0,"beard_4":0,"sex":0,"makeup_1":0,"age_1":0,"eyebrows_1":0,"tshirt_1":0,"age_2":0,"eyebrows_2":0,"mask_2":0,"decals_1":0,"shoes_1":0,"bproof_1":0,"face":0,"skin":0,"helmet_1":-1,"arms":0,"tshirt_2":0,"shoes_2":4,"bags_1":0,"decals_2":0,"torso_1":2,"beard_3":0,"pants_2":0,"pants_1":1,"beard_1":0,"chain_2":0,"glasses_2":0,"lipstick_1":0,"mask_1":0,"makeup_2":0,"makeup_4":0,"lipstick_4":0,"hair_2":0,"eyebrows_3":0,"lipstick_2":0,"lipstick_3":0,"hair_color_1":2,"chain_1":0,"bags_2":0,"glasses_1":-1,"helmet_2":0,"makeup_3":0,"ears_1":-1,"hair_1":3,"beard_2":0,"torso_2":1,"hair_color_2":0,"eyebrows_4":0,"bproof_2":0}', NULL, NULL),
	('d997b95b329a56b97fc059f6a5ed81984d7a8fda', '{"bank":13066,"black_money":0,"money":148}', 'user', '{"bread":18,"phone":1,"water":18}', 'mechanic', 6, '[]', '{"heading":330.0,"x":129.3,"y":-1380.5,"z":29.3}', 'Nick', 'Vossebeld', '28-10-2000', 'm', '180', '[{"name":"hunger","val":874700,"percent":87.47},{"name":"thirst","val":879760,"percent":87.976}]', NULL, NULL, 0, 0, '4742492', NULL, '{"decals_1":0,"hair_1":21,"beard_2":0,"age_2":0,"makeup_4":0,"eyebrows_1":0,"helmet_2":5,"hair_2":0,"beard_3":0,"bags_2":10,"shoes_2":14,"beard_1":0,"shoes_1":1,"face":0,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"chain_2":0,"arms":77,"skin":0,"tshirt_1":0,"eyebrows_2":7,"mask_1":17,"bproof_1":25,"beard_4":0,"hair_color_1":1,"age_1":0,"eyebrows_3":7,"bags_1":23,"helmet_1":63,"eyebrows_4":0,"lipstick_2":0,"glasses_1":5,"sex":0,"tshirt_2":0,"ears_1":-1,"makeup_3":0,"bproof_2":5,"pants_2":0,"torso_2":5,"chain_1":0,"mask_2":4,"ears_2":0,"makeup_1":0,"pants_1":2,"lipstick_4":0,"torso_1":2,"glasses_2":4}', NULL, NULL),
	('dd1a8cca0456c1d12d5437142c3b6bca16e8bd26', '{"black_money":0,"bank":23750,"money":0}', 'user', '[]', 'garbage', 0, '[]', '{"heading":211.1,"x":149.6,"y":-1040.2,"z":29.4}', 'Koen', 'Kampioen', '02/03/2001', 'm', '	174', '[{"name":"hunger","percent":97.175,"val":971750},{"name":"thirst","percent":97.74000000000001,"val":977400}]', NULL, NULL, 0, 0, '1671264', NULL, '{"beard_2":0,"lipstick_1":0,"shoes_2":0,"beard_4":0,"hair_2":0,"hair_color_2":0,"bproof_2":0,"mask_2":0,"age_2":0,"skin":0,"arms":0,"lipstick_3":0,"age_1":0,"tshirt_1":0,"hair_1":10,"eyebrows_3":0,"pants_1":5,"eyebrows_2":0,"glasses_2":0,"beard_3":0,"makeup_2":0,"makeup_1":0,"bags_1":0,"ears_1":-1,"chain_2":0,"helmet_1":-1,"decals_1":0,"lipstick_4":0,"ears_2":0,"face":0,"shoes_1":0,"beard_1":0,"sex":0,"torso_2":0,"pants_2":0,"makeup_3":0,"eyebrows_1":0,"hair_color_1":0,"eyebrows_4":0,"lipstick_2":0,"decals_2":0,"helmet_2":0,"makeup_4":0,"chain_1":0,"tshirt_2":0,"bags_2":0,"glasses_1":-1,"torso_1":2,"bproof_1":0,"mask_1":0}', NULL, NULL),
	('e25c35dcdc4fd27dfbe6471c91f10ebbef81f717', '{"black_money":0,"bank":25772,"money":900}', 'user', '[]', 'realestateagent', 1, '[]', '{"heading":311.9,"z":29.3,"y":-959.3,"x":-195.6}', 'Michael', 'Shelby', '13-01-1999', 'm', '200', '[{"percent":60.89499999999999,"val":608950,"name":"hunger"},{"percent":68.716,"val":687160,"name":"thirst"}]', NULL, NULL, 0, 0, '5832061', NULL, '{"skin":0,"chain_1":0,"eyebrows_3":0,"tshirt_1":22,"makeup_3":0,"sex":0,"helmet_2":0,"glasses_2":0,"makeup_2":0,"makeup_4":0,"face":0,"age_1":0,"eyebrows_4":0,"bags_2":0,"pants_2":1,"lipstick_4":0,"bproof_2":0,"lipstick_1":0,"pants_1":24,"decals_2":0,"glasses_1":-1,"eyebrows_1":0,"tshirt_2":0,"makeup_1":0,"ears_2":0,"hair_2":4,"beard_4":0,"shoes_2":0,"mask_1":0,"mask_2":0,"beard_2":0,"decals_1":0,"chain_2":0,"hair_color_1":14,"age_2":0,"arms":1,"torso_2":1,"ears_1":-1,"lipstick_3":0,"bproof_1":0,"beard_1":0,"hair_1":19,"shoes_1":10,"beard_3":0,"helmet_1":-1,"lipstick_2":0,"hair_color_2":2,"torso_1":11,"bags_1":0,"eyebrows_2":0}', NULL, NULL),
	('e2e331d86c0520b9b05d571f1a8649d4f49ee482', '{"money":0,"bank":25380,"black_money":0}', 'user', '[]', 'unemployed', 0, '[]', '{"z":29.1,"y":-853.1,"x":251.6,"heading":295.4}', 'Zwemdiploma', 'Ibrahim', '12-12-02', 'm', '200', '[{"name":"hunger","percent":97.18,"val":971800},{"name":"thirst","percent":97.744,"val":977440}]', NULL, NULL, 0, 0, '5211608', NULL, '{"decals_1":0,"hair_1":30,"beard_2":0,"age_2":0,"makeup_4":0,"eyebrows_1":0,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":2,"beard_1":0,"shoes_1":5,"face":1,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"mask_1":0,"pants_1":18,"skin":2,"glasses_2":0,"eyebrows_2":0,"glasses_1":-1,"bproof_1":16,"sex":0,"hair_color_1":0,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"tshirt_1":15,"beard_4":0,"lipstick_2":0,"helmet_1":39,"makeup_3":0,"torso_1":91,"ears_1":-1,"tshirt_2":0,"bproof_2":0,"pants_2":10,"torso_2":0,"chain_1":0,"mask_2":0,"ears_2":0,"makeup_1":0,"lipstick_4":0,"arms":15,"age_1":0,"chain_2":0}', NULL, NULL),
	('e90064e044b389ea7862e96828f837d36e8ad1d3', '{"black_money":0,"bank":19808,"money":390}', 'user', '{"phone":1,"bread":22,"water":22}', 'ambulance', 5, '[]', '{"heading":139.4,"z":29.9,"y":-1431.7,"x":396.7}', 'Tim', 'Dijkstra', '19-06-1985', 'm', '190', '[{"percent":89.915,"val":899150,"name":"hunger"},{"percent":91.932,"val":919320,"name":"thirst"}]', NULL, NULL, 0, 0, '5105865', NULL, '{"chain_1":0,"beard_4":0,"sex":0,"makeup_1":0,"age_1":0,"eyebrows_1":30,"tshirt_1":15,"age_2":0,"beard_1":10,"makeup_2":0,"decals_1":0,"shoes_1":10,"bproof_1":0,"face":0,"skin":4,"helmet_1":-1,"arms":4,"tshirt_2":0,"ears_2":0,"eyebrows_4":0,"decals_2":0,"torso_1":49,"hair_1":19,"pants_2":0,"bags_1":0,"lipstick_4":0,"eyebrows_2":10,"hair_color_1":0,"lipstick_1":0,"bproof_2":0,"pants_1":28,"makeup_4":0,"shoes_2":0,"hair_2":0,"makeup_3":0,"lipstick_2":0,"lipstick_3":0,"beard_3":0,"ears_1":-1,"bags_2":0,"glasses_1":5,"helmet_2":0,"glasses_2":4,"mask_2":0,"eyebrows_3":0,"beard_2":10,"torso_2":0,"hair_color_2":0,"mask_1":0,"chain_2":0}', NULL, NULL),
	('ea3f576a5548386eff8e48025ed5f5c026c89f16', '{"black_money":0,"bank":5764,"money":2130}', 'user', '[]', 'lumberjack', 0, '[]', '{"heading":111.6,"z":30.1,"y":-819.9,"x":239.7}', 'Dr', 'Neef', '29/12/1980', 'm', '195', '[{"percent":85.17,"val":851700,"name":"hunger"},{"percent":88.13600000000001,"val":881360,"name":"thirst"}]', NULL, NULL, 0, 0, '5915832', NULL, '{"ears_2":0,"beard_4":0,"sex":0,"makeup_1":0,"age_1":0,"eyebrows_1":12,"tshirt_1":26,"age_2":0,"eyebrows_2":8,"mask_2":0,"decals_1":0,"ears_1":-1,"bproof_1":0,"face":0,"bproof_2":0,"helmet_1":-1,"chain_2":0,"tshirt_2":3,"makeup_3":0,"arms":14,"decals_2":0,"torso_1":10,"hair_color_1":3,"pants_2":11,"bags_1":0,"beard_3":0,"lipstick_4":0,"eyebrows_4":0,"lipstick_1":0,"chain_1":0,"eyebrows_3":2,"glasses_2":8,"beard_1":0,"hair_2":0,"makeup_2":0,"lipstick_2":0,"lipstick_3":0,"shoes_1":51,"pants_1":28,"bags_2":0,"glasses_1":2,"helmet_2":0,"shoes_2":1,"makeup_4":0,"hair_1":55,"beard_2":0,"torso_2":3,"hair_color_2":0,"mask_1":0,"skin":1}', NULL, NULL),
	('eac2237361a2521cc32ec30782792e44f2db57a8', '{"black_money":0,"bank":33687,"money":90}', 'user', '{"stungun":1,"flashlight":1,"nightstick":1,"bread":7,"combatpistol":2,"phone":1,"pistol_ammo":150,"water":7}', 'police', 3, '[]', '{"heading":179.5,"z":30.7,"y":-998.4,"x":421.3}', 'Roy', 'De Jong', '1980-04-07', 'm', '200', '[{"percent":61.91,"val":619100,"name":"hunger"},{"percent":67.528,"val":675280,"name":"thirst"}]', NULL, NULL, 0, 0, '9990386', NULL, '{"decals_1":0,"hair_1":55,"beard_2":0,"age_2":0,"makeup_4":0,"eyebrows_1":0,"glasses_1":3,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"beard_1":0,"shoes_1":0,"tshirt_1":0,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"helmet_2":0,"face":0,"skin":0,"helmet_1":9,"eyebrows_2":0,"arms":20,"bproof_1":0,"mask_1":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"eyebrows_4":0,"pants_1":4,"lipstick_2":0,"ears_2":0,"sex":0,"glasses_2":0,"ears_1":-1,"chain_2":0,"bproof_2":0,"pants_2":0,"torso_2":0,"chain_1":0,"mask_2":0,"beard_4":0,"makeup_1":0,"lipstick_4":0,"makeup_3":0,"tshirt_2":0,"torso_1":49}', 'MNRP 84733', 'MNRP 66498'),
	('f59633ec0b5a12870dfd85222c1a912cdf4cb86a', '{"money":0,"bank":27464,"black_money":0}', 'user', '{"stungun":1,"flashlight":1,"water":4,"phone":1,"combatpistol":1,"pistol_ammo":150,"nightstick":1}', 'police', 1, '[]', '{"z":30.7,"y":-982.4,"x":439.2,"heading":237.5}', 'Rico', 'CHILEEN ', '09/08/2000', 'm', '175', '[{"name":"hunger","percent":83.38,"val":833800},{"name":"thirst","percent":86.70400000000001,"val":867040}]', NULL, NULL, 0, 0, '1153808', NULL, '{"decals_1":0,"hair_1":0,"beard_2":0,"age_2":0,"makeup_4":0,"eyebrows_1":0,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"mask_1":0,"shoes_1":0,"face":0,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"eyebrows_4":0,"glasses_2":0,"skin":0,"glasses_1":-1,"eyebrows_2":0,"ears_2":0,"bproof_1":0,"beard_1":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"pants_2":0,"beard_4":0,"lipstick_2":0,"tshirt_1":0,"chain_2":0,"torso_1":0,"ears_1":-1,"tshirt_2":0,"bproof_2":0,"helmet_1":-1,"torso_2":0,"chain_1":0,"mask_2":0,"pants_1":0,"makeup_1":0,"sex":0,"arms":0,"lipstick_4":0,"makeup_3":0}', NULL, NULL),
	('f76c1500479ad81ea2e626f607078f8dbac39e0b', '{"black_money":0,"money":1773,"bank":16497}', 'user', '{"coke_pooch":40,"phone":1,"water":1,"bread":1}', 'garbage', 0, '[]', '{"x":251.0,"y":-266.4,"z":60.0,"heading":353.9}', 'Jordy', 'Galindo', '19-04-2000', 'm', '189', '[{"name":"hunger","val":438950,"percent":43.895},{"name":"thirst","val":491400,"percent":49.14}]', NULL, NULL, 0, 0, '2058532', 'https://media.discordapp.net/attachments/936578696255512596/949370060202471444/screenshot.jpeg', '{"lipstick_4":0,"lipstick_3":0,"hair_color_2":10,"lipstick_2":0,"shoes_2":0,"beard_2":10,"bags_1":56,"torso_1":95,"eyebrows_3":0,"tshirt_2":0,"makeup_3":0,"hair_1":21,"eyebrows_2":0,"age_1":0,"pants_2":0,"decals_2":0,"ears_1":2,"lipstick_1":0,"ears_2":0,"beard_1":2,"bags_2":0,"bproof_1":9,"glasses_1":15,"eyebrows_1":0,"pants_1":26,"hair_2":0,"shoes_1":57,"tshirt_1":15,"helmet_2":1,"chain_2":0,"face":0,"skin":0,"helmet_1":2,"mask_1":124,"beard_4":10,"beard_3":0,"makeup_4":0,"bproof_2":2,"torso_2":1,"eyebrows_4":0,"decals_1":0,"glasses_2":6,"sex":0,"age_2":0,"shoes":35,"makeup_1":0,"chain_1":0,"mask_2":25,"hair_color_1":0,"arms":59,"makeup_2":0}', 'MNRP 33189', 'MNRP 16604'),
	('f94244739561f92f070a19968cf31b38eccb1cea', '{"money":4483,"bank":23198,"black_money":0}', 'user', '{"stungun":1,"flashlight":1,"water":5,"combatpistol":1,"phone":1,"pistol_ammo":150,"bread":20,"nightstick":1}', 'police', 2, '[]', '{"z":15.7,"y":-940.0,"x":-837.6,"heading":163.7}', 'Tamas', 'Loop', '11-12-2002', 'm', '188', '[{"name":"hunger","percent":71.525,"val":715250},{"name":"thirst","percent":82.176,"val":821760}]', NULL, NULL, 0, 0, '2264526', NULL, '{"decals_1":0,"hair_1":21,"pants_1":24,"age_2":0,"makeup_4":0,"eyebrows_1":17,"glasses_1":5,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"beard_1":27,"shoes_1":10,"tshirt_1":10,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"pants_2":6,"arms":0,"skin":29,"beard_2":10,"eyebrows_2":10,"glasses_2":4,"bproof_1":0,"sex":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"helmet_2":25,"mask_1":0,"lipstick_2":0,"face":0,"chain_2":0,"torso_1":167,"ears_1":-1,"shoes_2":0,"bproof_2":0,"helmet_1":112,"torso_2":10,"chain_1":0,"mask_2":0,"lipstick_4":0,"makeup_1":0,"tshirt_2":9,"eyebrows_4":0,"makeup_3":0,"ears_2":0}', NULL, NULL),
	('fa90eb9f929b3d5c9b8d9600b6b0ed9aeabcb4a2', '{"money":0,"bank":25000,"black_money":0}', 'user', '[]', 'garbage', 0, '[]', '{"z":30.3,"y":-973.9,"x":-260.6,"heading":208.9}', 'Frans', 'Jongsma', '1990-01-01', 'm', '199', '[{"name":"hunger","percent":99.71,"val":997100},{"name":"thirst","percent":99.768,"val":997680}]', NULL, NULL, 0, 0, '3174743', NULL, '{"decals_1":0,"hair_1":0,"beard_2":0,"age_2":0,"makeup_4":0,"eyebrows_1":0,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"beard_4":0,"mask_1":0,"shoes_1":0,"face":0,"lipstick_1":0,"lipstick_3":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"beard_1":0,"arms":0,"skin":0,"pants_1":0,"eyebrows_2":0,"ears_2":0,"bproof_1":0,"torso_1":0,"hair_color_1":0,"age_1":0,"eyebrows_3":0,"bags_1":0,"chain_2":0,"eyebrows_4":0,"lipstick_2":0,"glasses_1":-1,"sex":5,"glasses_2":0,"ears_1":-1,"lipstick_4":0,"bproof_2":0,"helmet_1":-1,"torso_2":0,"chain_1":0,"mask_2":0,"shoes_2":0,"makeup_1":0,"tshirt_2":0,"makeup_3":0,"tshirt_1":0,"pants_2":0}', NULL, NULL),
	('fd34328d7be3ef9fdf87a783b33da39ed661be53', '{"black_money":0,"bank":42847,"money":425}', 'user', '{"bread":4,"water":14}', 'garbage', 0, '[]', '{"heading":110.8,"z":21.3,"y":-1660.4,"x":-565.6}', 'Ragkai', 'Karimi', '28/05/2004', 'm', '187', '[{"percent":44.675,"val":446750,"name":"hunger"},{"percent":69.74000000000001,"val":697400,"name":"thirst"}]', NULL, NULL, 0, 0, '2144226', NULL, '{"decals_1":0,"hair_1":13,"pants_1":77,"age_2":0,"makeup_4":0,"arms":31,"helmet_2":0,"hair_2":0,"beard_3":0,"bags_2":0,"shoes_2":0,"beard_1":0,"shoes_1":55,"tshirt_1":15,"lipstick_1":0,"lipstick_4":0,"decals_2":0,"makeup_2":0,"hair_color_2":0,"glasses_1":-1,"face":0,"skin":0,"chain_2":0,"eyebrows_2":0,"pants_2":0,"bproof_1":0,"beard_4":0,"hair_color_1":11,"eyebrows_4":0,"eyebrows_3":0,"bags_1":0,"tshirt_2":0,"makeup_3":0,"lipstick_2":0,"beard_2":0,"sex":0,"ears_2":0,"ears_1":-1,"lipstick_3":0,"bproof_2":0,"helmet_1":115,"torso_2":0,"chain_1":0,"mask_2":17,"age_1":0,"makeup_1":0,"eyebrows_1":0,"mask_1":145,"glasses_2":0,"torso_1":178}', NULL, NULL),
	('fe98f8dc9deb20e673a8785f29745d90ed1db052', '{"black_money":0,"money":0,"bank":23902}', 'user', '[]', 'unemployed', 0, '[]', '{"x":-229.2,"y":-954.9,"z":29.3,"heading":177.8}', 'Danique', 'Bloem', '20/06/2002', 'f', '166', '[{"name":"hunger","val":835850,"percent":83.585},{"name":"thirst","val":868680,"percent":86.868}]', NULL, NULL, 0, 0, '4565063', NULL, '{"beard_3":0,"bags_2":14,"age_1":0,"lipstick_2":6,"helmet_1":-1,"shoes_1":3,"pants_2":0,"lipstick_4":0,"makeup_1":0,"tshirt_1":0,"mask_2":0,"makeup_4":0,"beard_1":0,"torso_2":4,"face":21,"chain_1":0,"bags_1":22,"torso_1":133,"bproof_1":0,"decals_2":0,"arms":5,"tshirt_2":0,"pants_1":43,"chain_2":0,"ears_2":0,"lipstick_3":6,"shoes_2":3,"hair_color_1":5,"beard_2":0,"hair_color_2":2,"bproof_2":0,"beard_4":0,"sex":1,"hair_1":37,"eyebrows_3":41,"eyebrows_1":2,"helmet_2":0,"ears_1":-1,"makeup_3":0,"makeup_2":7,"eyebrows_2":10,"decals_1":0,"hair_2":0,"mask_1":0,"lipstick_1":1,"glasses_1":-1,"skin":8,"glasses_2":0,"eyebrows_4":0,"age_2":0}', 'MNRP 91099', 'MNRP 90115');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.user_licenses wordt geschreven
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.user_licenses: ~48 rows (ongeveer)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'aircraft', '1884df4db1128ba239a00566272091bc6e4b8404'),
	(2, 'plane', 'steam:110000118914341'),
	(3, 'drive', 'fe98f8dc9deb20e673a8785f29745d90ed1db052'),
	(4, 'dmv', '657e2d16859a7e5655c7a00cc0395177479a38e3'),
	(5, 'drive', '657e2d16859a7e5655c7a00cc0395177479a38e3'),
	(6, 'dmv', 'b0f52bbad39871f886445279437163b33ecaaa81'),
	(7, 'dmv', 'f76c1500479ad81ea2e626f607078f8dbac39e0b'),
	(8, 'dmv', '623ca025b6fc4a2c376e80fb01c060f6f151d266'),
	(9, 'dmv', '28f047a408daa3b2181761b8fd94a329f69117b3'),
	(10, 'drive', 'b13b12c162404f3ac4bd2a36470118f23c755794'),
	(11, 'drive_truck', 'c0cd8109c04899c9a7dc9177531bead5cbd72bd4'),
	(12, 'drive', 'c0cd8109c04899c9a7dc9177531bead5cbd72bd4'),
	(13, 'drive_bike', 'c0cd8109c04899c9a7dc9177531bead5cbd72bd4'),
	(14, 'drive', 'f76c1500479ad81ea2e626f607078f8dbac39e0b'),
	(15, 'drive', '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9'),
	(16, 'drive', '8a249fe36729c5f2fe0377983d6cbd74d6590c79'),
	(17, 'drive', 'cd4b446d0873d0d2943bc3bace3c55692e953516'),
	(18, 'drive_truck', 'cd4b446d0873d0d2943bc3bace3c55692e953516'),
	(19, 'drive_bike', 'cd4b446d0873d0d2943bc3bace3c55692e953516'),
	(20, 'drive', 'dd1a8cca0456c1d12d5437142c3b6bca16e8bd26'),
	(21, 'drive', '303519e413d2d8d09edbacdeb32832e9f6a87973'),
	(22, 'drive_bike', '303519e413d2d8d09edbacdeb32832e9f6a87973'),
	(23, 'drive_truck', '303519e413d2d8d09edbacdeb32832e9f6a87973'),
	(24, 'drive', 'c9c13e5ed18c956773dd0c4dc28c02070020fe3d'),
	(25, 'drive_truck', 'c9c13e5ed18c956773dd0c4dc28c02070020fe3d'),
	(26, 'drive_bike', 'c9c13e5ed18c956773dd0c4dc28c02070020fe3d'),
	(27, 'drive', 'ea3f576a5548386eff8e48025ed5f5c026c89f16'),
	(28, 'drive', 'eac2237361a2521cc32ec30782792e44f2db57a8'),
	(29, 'drive_bike', 'eac2237361a2521cc32ec30782792e44f2db57a8'),
	(30, 'drive', '25a4e03167c4b6bf2200414395f8ad5600af312f'),
	(31, 'drive_truck', '25a4e03167c4b6bf2200414395f8ad5600af312f'),
	(32, 'drive_bike', '25a4e03167c4b6bf2200414395f8ad5600af312f'),
	(33, 'drive', 'bba5a10878001eaf23160ade255dbc1d4bae03b7'),
	(34, 'drive_truck', 'bba5a10878001eaf23160ade255dbc1d4bae03b7'),
	(35, 'drive_bike', 'bba5a10878001eaf23160ade255dbc1d4bae03b7'),
	(36, 'drive', 'd1491d84201f9f3677b8a564300dc0d906188f74'),
	(37, 'drive_bike', 'd1491d84201f9f3677b8a564300dc0d906188f74'),
	(38, 'drive', '854812e40063a2bcbbf10c29bc55296a87904f13'),
	(39, 'drive_truck', '854812e40063a2bcbbf10c29bc55296a87904f13'),
	(40, 'drive_bike', '854812e40063a2bcbbf10c29bc55296a87904f13'),
	(41, 'drive_bike', '6e8d7df445c5ddef6b5dc89a88591bd5acaa3af9'),
	(42, 'drive', '468d8e859dd395e754354ed19318802f51777054'),
	(43, 'drive_truck', '468d8e859dd395e754354ed19318802f51777054'),
	(44, 'drive_bike', '468d8e859dd395e754354ed19318802f51777054'),
	(45, 'dmv', '1c58571e499884bf0801c5b5d85d3cfc0e71357d'),
	(46, 'drive', '1c58571e499884bf0801c5b5d85d3cfc0e71357d'),
	(47, 'drive_truck', '1c58571e499884bf0801c5b5d85d3cfc0e71357d'),
	(48, 'drive_bike', '1c58571e499884bf0801c5b5d85d3cfc0e71357d');
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.uteknark wordt geschreven
CREATE TABLE IF NOT EXISTS `uteknark` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stage` int(3) unsigned NOT NULL DEFAULT 1,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `soil` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stage` (`stage`,`time`)
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.uteknark: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `uteknark` DISABLE KEYS */;
/*!40000 ALTER TABLE `uteknark` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.vehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.vehicles: ~239 rows (ongeveer)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Audi A4 TFSI', 'aaq4', 48225, 'custom'),
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Volkswagen Amarok V6', 'amarok', 34000, 'custom'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Audi Quattro', 'audquattros', 41235, 'custom'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Renault Clio', 'clio', 12023, 'custom'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Corvette Z06', 'corvettec5z06', 101995, 'custom'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('Honda Civic', 'fk8', 33120, 'custom'),
	('FMJ', 'fmj', 185000, 'super'),
	('Mitsubishi GP FTO', 'fto', 15370, 'custom'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Golf GTI 7', 'golfgti7', 52000, 'custom'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Honda CR Vtec', 'honcrx91', 23710, 'custom'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Lexus IS350', 'is350mod', 33891, 'custom'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jeep Rubicon', 'jeep2012', 39000, 'custom'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Volvo S60', 's60pole', 44880, 'custom'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Subaru WRX', 'subwrx', 46000, 'custom'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Chevrolet Tahoe', 'tahoe', 39614, 'custom'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Audi TT RS', 'ttrs', 94630, 'custom'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('BMW M40i', 'z419', 81158, 'custom'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.vehicle_categories wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.vehicle_categories: ~12 rows (ongeveer)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
	('custom', 'Geïmporteerd'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.vehicle_sold wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpen data van tabel middelveenv2.vehicle_sold: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Structuur van  tabel middelveenv2.yellow_tweets wordt geschreven
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpen data van tabel middelveenv2.yellow_tweets: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `yellow_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yellow_tweets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
