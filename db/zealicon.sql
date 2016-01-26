-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2015 at 07:34 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zealicon`
--

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE IF NOT EXISTS `contactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `position` varchar(200) NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `display`
--

CREATE TABLE IF NOT EXISTS `display` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `team` int(2) NOT NULL,
  `about` int(2) NOT NULL,
  `registration` int(2) NOT NULL,
  `contact` int(2) NOT NULL,
  `schedule` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `display`
--

INSERT INTO `display` (`id`, `team`, `about`, `registration`, `contact`, `schedule`) VALUES
(1, 0, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `societyId` int(10) unsigned NOT NULL,
  `eventData` text COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `display` tinyint(1) NOT NULL,
  `eventTime` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `winner1` varchar(125) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Not Yet Declared',
  `winner2` varchar(125) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Not Yet Declated',
  PRIMARY KEY (`id`),
  KEY `events_societyid_foreign` (`societyId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `societyId`, `eventData`, `category`, `name`, `display`, `eventTime`, `winner1`, `winner2`) VALUES
(5, 1, '{"about":"About","prize1":"First Prize","prize2":"Second Prize","contact1":"Contact Person 1","contact2":"Contact Person 2","link":"http://www.google.com","rules":["Rule 1","Rule 2","Rule 3"],"filePath":"uploads/events/10647064_10153250475046840_6619977397163753460_nEvent.jpg","description":"Desc"}', 'Mechavoltz', 'Event', 0, '2015-03-26', 'Not Yet Declared', 'Not Yet Declated'),
(6, 1, '{"about":"ads","prize1":"asd","prize2":"asd","contact1":"sda","contact2":"asd","link":"ads","rules":["sad","adssad"],"filePath":"","description":"ds"}', 'Coderz', 'CodeWars', 0, '2015-03-19', 'Not Yet Declared', 'Not Yet Declated');

-- --------------------------------------------------------

--
-- Table structure for table `festdata`
--

CREATE TABLE IF NOT EXISTS `festdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `display` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `festdata`
--

INSERT INTO `festdata` (`id`, `type`, `data`, `display`) VALUES
(1, 'about', '', 0),
(2, 'schedule', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zealId` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `course` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `collegeName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `events` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registration_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `zealId`, `mobile`, `email`, `name`, `password`, `course`, `collegeName`, `paid`, `events`) VALUES
(1, 'Z15s_1', 7503705892, 'v.nikhil323@gmail.com', 'Nikhil Verma', 'india123', 'B.tecy', 'afdsdas', 0, ''),
(2, 'Z15s_2', 0, '', 'Prashant', 'adas', '', '', 0, ''),
(3, 'Z15s_3', 644646, 'asd@gmail.com', 'sdf', 'asd', 'adad', 'addasdas', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `society`
--

CREATE TABLE IF NOT EXISTS `society` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `societyName` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `isSuperAdmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `society_username_unique` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `society`
--

INSERT INTO `society` (`id`, `societyName`, `username`, `password`, `isSuperAdmin`) VALUES
(1, 'Nibble Computer Society', 'NCS', 'india', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE IF NOT EXISTS `sponsors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `link` varchar(500) NOT NULL,
  `title` varchar(500) NOT NULL,
  `logo` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `category` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `links` varchar(500) NOT NULL,
  `img` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `category`, `title`, `description`, `links`, `img`) VALUES
(4, 'a', 'Lead', '', '{"long_desc":"","short_desc":""}', '{"fb_link":"","l_link":""}', ''),
(5, 'adadsasda', 'Lead', 'asdmsadkm', '{"long_desc":"dasmkamdkasmd","short_desc":"askdmksad"}', '{"fb_link":"sadsad","l_link":"dsaasdasdasd"}', 'uploads/team/profile_image.jpg'),
(6, 'dsf', 'Lead', 'ad', '{"long_desc":"sad","short_desc":"d"}', '{"fb_link":"ad","l_link":"sad"}', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_societyid_foreign` FOREIGN KEY (`societyId`) REFERENCES `society` (`id`),
  ADD CONSTRAINT `societyId` FOREIGN KEY (`societyId`) REFERENCES `society` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
