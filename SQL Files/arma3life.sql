/*
Navicat MySQL Data Transfer

Source Server         : A2Server
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : arma3life

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-10-21 10:47:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gangs
-- ----------------------------
DROP TABLE IF EXISTS `gangs`;
CREATE TABLE `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for wanted
-- ----------------------------
DROP TABLE IF EXISTS `wanted`;
CREATE TABLE `wanted` (
  `wantedID` varchar(50) NOT NULL,
  `wantedName` varchar(52) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Procedure structure for deleteDeadVehicles
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDeadVehicles`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for deleteOldGangs
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldGangs`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for deleteOldHouses
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteOldHouses`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for resetLifeVehicles
-- ----------------------------
DROP PROCEDURE IF EXISTS `resetLifeVehicles`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE `vehicles` SET `active`= 0;
END
;;
DELIMITER ;
