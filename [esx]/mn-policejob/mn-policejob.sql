-- --------------------------------------------------------
-- Host:                         137.74.202.159
-- Server versie:                10.5.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versie:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Databasestructuur van s16575_mnrp wordt geschreven
CREATE DATABASE IF NOT EXISTS `s16575_mnrp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `s16575_mnrp`;

-- Structuur van  tabel s16575_mnrp.mn_policejob_aangiftes wordt geschreven
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

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel s16575_mnrp.mn_policejob_inbeslagnamevoertuigen wordt geschreven
CREATE TABLE IF NOT EXISTS `mn_policejob_inbeslagnamevoertuigen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL DEFAULT '0',
  `vehicle` longtext NOT NULL,
  `plate` varchar(50) NOT NULL DEFAULT '',
  `reden` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel s16575_mnrp.mn_policejob_opslag wordt geschreven
CREATE TABLE IF NOT EXISTS `mn_policejob_opslag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opslag` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `mn_policejob_opslag` (`id`, `opslag`) VALUES
    (1, '[]');

-- Data exporteren was gedeselecteerd

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
