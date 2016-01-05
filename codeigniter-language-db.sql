-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2016 at 09:05 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `codeigniter-language-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `configeration`
--

CREATE TABLE IF NOT EXISTS `configeration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Value` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `configeration`
--

INSERT INTO `configeration` (`id`, `Key`, `Value`) VALUES
(1, 'default_display_language', '2');

-- --------------------------------------------------------

--
-- Table structure for table `content_holder`
--

CREATE TABLE IF NOT EXISTS `content_holder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Programming_Name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Page_ID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Content_Page1_idx` (`Page_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=39 ;

--
-- Dumping data for table `content_holder`
--

INSERT INTO `content_holder` (`id`, `Programming_Name`, `Page_ID`) VALUES
(1, 'welcome_message_title', 1);

-- --------------------------------------------------------

--
-- Table structure for table `content_view`
--

CREATE TABLE IF NOT EXISTS `content_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Content_ID` int(11) NOT NULL,
  `Language_ID` int(11) NOT NULL,
  `Content` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ContentDescription_Language1_idx` (`Language_ID`),
  KEY `fk_ContentView_Content1_idx` (`Content_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `content_view`
--

INSERT INTO `content_view` (`id`, `Content_ID`, `Language_ID`, `Content`) VALUES
(1, 1, 1, 'Willkommen in Codeigniter Sprache db :D'),
(2, 1, 3, 'أهلا بك في مكتبة اللغة لمنصة عمل كودغنايتر :D'),
(3, 1, 2, 'Welcome to Codeigniter language db :D');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Language` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `Language`) VALUES
(1, 'German'),
(2, 'English'),
(3, 'Arabic'),
(4, 'French'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `Name`) VALUES
(1, 'welcome_message');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content_holder`
--
ALTER TABLE `content_holder`
  ADD CONSTRAINT `content_holder_ibfk_1` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content_view`
--
ALTER TABLE `content_view`
  ADD CONSTRAINT `content_view_ibfk_2` FOREIGN KEY (`Language_ID`) REFERENCES `language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `content_view_ibfk_1` FOREIGN KEY (`Content_ID`) REFERENCES `content_holder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
