-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `asxoleitai`;
CREATE TABLE `asxoleitai` (
  `kwdikos` int(11) NOT NULL,
  `onomatepwnymo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`onomatepwnymo`,`kwdikos`),
  KEY `kwdikos` (`kwdikos`),
  CONSTRAINT `asxoleitai_ibfk_1` FOREIGN KEY (`kwdikos`) REFERENCES `athlima` (`kwdikos`),
  CONSTRAINT `asxoleitai_ibfk_2` FOREIGN KEY (`onomatepwnymo`) REFERENCES `athlitis` (`onomatepwnymo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `athlima`;
CREATE TABLE `athlima` (
  `kwdikos` int(11) NOT NULL,
  `onoma` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kathgotia` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `olympiako` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kwdikos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `athlitis`;
CREATE TABLE `athlitis` (
  `onomatepwnymo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hmeromhniaGennhshs` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ethnikothta` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `onomaOmadas` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`onomatepwnymo`,`hmeromhniaGennhshs`),
  KEY `onomaOmadas` (`onomaOmadas`),
  CONSTRAINT `athlitis_ibfk_1` FOREIGN KEY (`onomaOmadas`) REFERENCES `omada` (`onoma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `omada`;
CREATE TABLE `omada` (
  `onoma` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emvlima` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`onoma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2016-11-15 23:17:35
