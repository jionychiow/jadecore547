/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.5.9-log : Database - auth
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='Account System';

/*Data for the table `account` */

LOCK TABLES `account` WRITE;

insert  into `account`(`id`,`username`,`sha_pass_hash`,`sessionkey`,`v`,`s`,`token_key`,`email`,`joindate`,`last_ip`,`failed_logins`,`locked`,`last_login`,`online`,`expansion`,`mutetime`,`locale`,`os`,`recruiter`) values (7,'ANDER','D44CE8DF75C1AE3F7C5CD0CDABB1B3BCD8B960C1','4DBB674334EBCD7DA6EF900727FCFD9089FB057AE534D05E72F659A912C8BD818F719C9CC7FA44AB','31AA3F144ABEABC468B41CF8A1238F9FAAE3BA5D461F747AE0947439144AE00C','D8B913E1D9B55F2BCEA33F8034DC4E576FEA5C005C7D77ADB19BD9677F6B9F6D','','','2016-11-24 21:09:40','127.0.0.1',0,0,'2016-11-25 20:48:53',0,4,0,8,'Win',0);

UNLOCK TABLES;

/*Table structure for table `account_access` */

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  `comment` text,
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account_access` */

LOCK TABLES `account_access` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_banned` */

DROP TABLE IF EXISTS `account_banned`;

CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

/*Data for the table `account_banned` */

LOCK TABLES `account_banned` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_log_ip` */

DROP TABLE IF EXISTS `account_log_ip`;

CREATE TABLE `account_log_ip` (
  `accountid` int(11) unsigned NOT NULL,
  `ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`accountid`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `account_log_ip` */

LOCK TABLES `account_log_ip` WRITE;

insert  into `account_log_ip`(`accountid`,`ip`,`date`) values (7,'127.0.0.1','2016-11-24 21:11:07');

UNLOCK TABLES;

/*Table structure for table `account_premium` */

DROP TABLE IF EXISTS `account_premium`;

CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `premium_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `gm` varchar(12) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account_premium` */

LOCK TABLES `account_premium` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_spell` */

DROP TABLE IF EXISTS `account_spell`;

CREATE TABLE `account_spell` (
  `accountId` int(11) NOT NULL,
  `spell` int(10) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountId`,`spell`),
  KEY `account` (`accountId`) USING HASH,
  KEY `account_spell` (`accountId`,`spell`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account_spell` */

LOCK TABLES `account_spell` WRITE;

UNLOCK TABLES;

/*Table structure for table `firewall_farms` */

DROP TABLE IF EXISTS `firewall_farms`;

CREATE TABLE `firewall_farms` (
  `ip` tinytext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `firewall_farms` */

LOCK TABLES `firewall_farms` WRITE;

UNLOCK TABLES;

/*Table structure for table `ip_banned` */

DROP TABLE IF EXISTS `ip_banned`;

CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

/*Data for the table `ip_banned` */

LOCK TABLES `ip_banned` WRITE;

UNLOCK TABLES;

/*Table structure for table `ip_to_country` */

DROP TABLE IF EXISTS `ip_to_country`;

CREATE TABLE `ip_to_country` (
  `IP_FROM` double NOT NULL,
  `IP_TO` double NOT NULL,
  `COUNTRY_CODE` char(2) DEFAULT NULL,
  `COUNTRY_CODE_3` char(3) NOT NULL,
  `COUNTRY_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IP_FROM`,`IP_TO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `ip_to_country` */

LOCK TABLES `ip_to_country` WRITE;

UNLOCK TABLES;

/*Table structure for table `log_vote` */

DROP TABLE IF EXISTS `log_vote`;

CREATE TABLE `log_vote` (
  `top_name` varchar(15) NOT NULL DEFAULT 'top',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `date` int(11) NOT NULL,
  PRIMARY KEY (`top_name`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `log_vote` */

LOCK TABLES `log_vote` WRITE;

UNLOCK TABLES;

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `logs` */

LOCK TABLES `logs` WRITE;

UNLOCK TABLES;

/*Table structure for table `mails` */

DROP TABLE IF EXISTS `mails`;

CREATE TABLE `mails` (
  `email` varchar(254) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mails` */

LOCK TABLES `mails` WRITE;

UNLOCK TABLES;

/*Table structure for table `realmcharacters` */

DROP TABLE IF EXISTS `realmcharacters`;

CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

/*Data for the table `realmcharacters` */

LOCK TABLES `realmcharacters` WRITE;

insert  into `realmcharacters`(`realmid`,`acctid`,`numchars`) values (1,7,5);

UNLOCK TABLES;

/*Table structure for table `realmlist` */

DROP TABLE IF EXISTS `realmlist`;

CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '16135',
  `online` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

/*Data for the table `realmlist` */

LOCK TABLES `realmlist` WRITE;

insert  into `realmlist`(`id`,`name`,`address`,`port`,`icon`,`flag`,`timezone`,`allowedSecurityLevel`,`population`,`gamebuild`,`online`) values (1,'MopCore547','127.0.0.1',8085,0,0,1,0,0,18019,1);

UNLOCK TABLES;

/*Table structure for table `transferts` */

DROP TABLE IF EXISTS `transferts`;

CREATE TABLE `transferts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `perso_guid` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `revision` blob NOT NULL,
  `dump` longtext NOT NULL,
  `last_error` blob NOT NULL,
  `nb_attempt` int(11) NOT NULL,
  `state` int(10) DEFAULT NULL,
  `error` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transferts` */

LOCK TABLES `transferts` WRITE;

UNLOCK TABLES;

/*Table structure for table `transferts_logs` */

DROP TABLE IF EXISTS `transferts_logs`;

CREATE TABLE `transferts_logs` (
  `id` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `perso_guid` int(11) DEFAULT NULL,
  `from` int(2) DEFAULT NULL,
  `to` int(2) DEFAULT NULL,
  `dump` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transferts_logs` */

LOCK TABLES `transferts_logs` WRITE;

UNLOCK TABLES;

/*Table structure for table `uptime` */

DROP TABLE IF EXISTS `uptime`;

CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

/*Data for the table `uptime` */

LOCK TABLES `uptime` WRITE;

insert  into `uptime`(`realmid`,`starttime`,`uptime`,`maxplayers`,`revision`) values (1,1480010932,1220,1,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480012404,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480014032,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480014298,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480014366,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480014467,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480014519,601,1,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480016204,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480016594,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480016820,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480017199,600,1,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480019310,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480093590,1219,1,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480095189,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480095420,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480096060,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480096097,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480097063,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480097947,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480098047,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)'),(1,1480098586,0,0,'WoWSource rev. 2016-04-01 00:00:00 +0000 (rev.1) (Win64, Release)');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
