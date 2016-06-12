-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 12, 2016 at 09:52 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vyom`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_seen_id` int(10) unsigned NOT NULL,
  `name` varchar(1024) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `retail_price` float NOT NULL,
  `discounted_price` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `site_seen_id`, `name`, `valid_from`, `valid_to`, `retail_price`, `discounted_price`, `created_at`, `updated_at`) VALUES
(32, 1, 'sdfsd', '2016-06-09', '2016-06-14', 22, 22, '2016-06-11 12:33:06', '2016-06-11 07:03:06'),
(33, 1, 'zxcvdsvd', '2016-06-23', '2016-06-30', 2222, 222, '2016-06-11 12:33:07', '2016-06-11 07:03:07'),
(38, 3, 'sadsad', '2016-06-15', '2016-06-08', 2321, 12321, '2016-06-11 12:38:26', '2016-06-11 07:08:26'),
(39, 3, 'asdsad', '2016-06-29', '2016-06-29', 12321, 21321, '2016-06-11 12:38:26', '2016-06-11 07:08:26'),
(40, 4, 'afsfsadfsdaf', '2016-06-15', '2016-06-23', 22, 34, '2016-06-11 12:39:14', '2016-06-11 07:09:14'),
(41, 2, 'sddfgfdg', '2016-06-14', '2016-06-12', 324, 23423, '2016-06-12 01:03:53', '2016-06-11 19:33:53'),
(42, 2, 'asdwqe', '2016-06-14', '2016-06-14', 213, 213214, '2016-06-12 01:03:53', '2016-06-11 19:33:53'),
(43, 2, 'sdfsdf', '2016-06-30', '2016-06-30', 1123, 123213, '2016-06-12 01:03:53', '2016-06-11 19:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE IF NOT EXISTS `attachments` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `model` varchar(255) NOT NULL,
  `itemId` int(11) NOT NULL,
  `hash` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `cover_image` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('Admin', '1', 1450353347),
('Manager', '1', 1450353347),
('Manager', '10', 1465326326),
('Seller', '1', 1464466963),
('Super Admin', '1', 1450353347),
('User Management', '1', 1450353347),
('User Management', '2', 1450353356);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/admin/*', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/assignment/*', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/assignment/assign', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/assignment/index', 2, NULL, NULL, NULL, 1450352656, 1450352656),
('/admin/assignment/search', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/assignment/view', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/default/*', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/default/index', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/menu/*', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/menu/create', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/menu/delete', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/menu/index', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/menu/update', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/menu/view', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/*', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/assign', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/create', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/delete', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/index', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/search', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/update', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/permission/view', 2, NULL, NULL, NULL, 1450352657, 1450352657),
('/admin/role/*', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/role/assign', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/role/create', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/role/delete', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/role/index', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/role/search', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/role/update', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/role/view', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/route/*', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/route/assign', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/route/create', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/route/index', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/route/search', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/rule/*', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/rule/create', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/rule/delete', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/rule/index', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/rule/update', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/admin/rule/view', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/city/*', 2, NULL, NULL, NULL, 1464087985, 1464087985),
('/city/create', 2, NULL, NULL, NULL, 1464087985, 1464087985),
('/city/delete', 2, NULL, NULL, NULL, 1464087985, 1464087985),
('/city/index', 2, NULL, NULL, NULL, 1464087985, 1464087985),
('/city/update', 2, NULL, NULL, NULL, 1464087985, 1464087985),
('/city/view', 2, NULL, NULL, NULL, 1464087985, 1464087985),
('/customer/*', 2, NULL, NULL, NULL, 1464920579, 1464920579),
('/customer/create', 2, NULL, NULL, NULL, 1464920579, 1464920579),
('/customer/delete', 2, NULL, NULL, NULL, 1464920579, 1464920579),
('/customer/index', 2, NULL, NULL, NULL, 1464920578, 1464920578),
('/customer/update', 2, NULL, NULL, NULL, 1464920579, 1464920579),
('/customer/view', 2, NULL, NULL, NULL, 1464920578, 1464920578),
('/debug/*', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/debug/default/*', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/debug/default/index', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/debug/default/view', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/gii/*', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/gii/default/*', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/gii/default/action', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/gii/default/diff', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/gii/default/index', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/gii/default/preview', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/gii/default/view', 2, NULL, NULL, NULL, 1450352658, 1450352658),
('/restaurant/*', 2, NULL, NULL, NULL, 1464066312, 1464066312),
('/restaurant/create', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/restaurant/delete', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/restaurant/image-delete', 2, NULL, NULL, NULL, 1464346634, 1464346634),
('/restaurant/index', 2, NULL, NULL, NULL, 1464066322, 1464066322),
('/restaurant/update', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/restaurant/view', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/services/*', 2, NULL, NULL, NULL, 1464092229, 1464092229),
('/services/create', 2, NULL, NULL, NULL, 1464092229, 1464092229),
('/services/delete', 2, NULL, NULL, NULL, 1464092229, 1464092229),
('/services/index', 2, NULL, NULL, NULL, 1464092229, 1464092229),
('/services/update', 2, NULL, NULL, NULL, 1464092229, 1464092229),
('/services/view', 2, NULL, NULL, NULL, 1464092229, 1464092229),
('/site-config/*', 2, NULL, NULL, NULL, 1464066314, 1464066314),
('/site-config/create', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/site-config/delete', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/site-config/index', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/site-config/update', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/site-config/view', 2, NULL, NULL, NULL, 1464066323, 1464066323),
('/site-seen/*', 2, NULL, NULL, NULL, 1464479560, 1464479560),
('/site-seen/create', 2, NULL, NULL, NULL, 1464479560, 1464479560),
('/site-seen/delete', 2, NULL, NULL, NULL, 1464479560, 1464479560),
('/site-seen/index', 2, NULL, NULL, NULL, 1464479560, 1464479560),
('/site-seen/update', 2, NULL, NULL, NULL, 1464479560, 1464479560),
('/site-seen/view', 2, NULL, NULL, NULL, 1464479560, 1464479560),
('/site/*', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/site/error', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/site/index', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/site/login', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/site/logout', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/uploaded-file/*', 2, NULL, NULL, NULL, 1464466712, 1464466712),
('/uploaded-file/delete', 2, NULL, NULL, NULL, 1464466720, 1464466720),
('/uploaded-file/image-delete', 2, NULL, NULL, NULL, 1464466720, 1464466720),
('/uploaded-file/index', 2, NULL, NULL, NULL, 1464466720, 1464466720),
('/user/*', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/user/create', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/user/delete', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/user/index', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/user/update', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('/user/view', 2, NULL, NULL, NULL, 1450352659, 1450352659),
('Admin', 1, NULL, 'Admin Rule', NULL, 1450352597, 1465119148),
('Manager', 1, NULL, 'Manager Rule', NULL, 1450353024, 1450353024),
('Seller', 2, NULL, 'Seller Rule', NULL, 1450357350, 1450357350),
('Super Admin', 2, NULL, 'Super Admin Rule', NULL, 1450353233, 1464920588),
('User Management', 2, NULL, 'Manager Rule', NULL, 1450353082, 1450353325);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('Super Admin', '/*'),
('Admin', '/admin/*'),
('Super Admin', '/admin/*'),
('Super Admin', '/admin/assignment/*'),
('Super Admin', '/admin/assignment/assign'),
('Super Admin', '/admin/assignment/index'),
('Super Admin', '/admin/assignment/search'),
('Super Admin', '/admin/assignment/view'),
('Super Admin', '/admin/default/*'),
('Super Admin', '/admin/default/index'),
('Super Admin', '/admin/menu/*'),
('Super Admin', '/admin/menu/create'),
('Super Admin', '/admin/menu/delete'),
('Super Admin', '/admin/menu/index'),
('Super Admin', '/admin/menu/update'),
('Super Admin', '/admin/menu/view'),
('Super Admin', '/admin/permission/*'),
('Super Admin', '/admin/permission/assign'),
('Super Admin', '/admin/permission/create'),
('Super Admin', '/admin/permission/delete'),
('Super Admin', '/admin/permission/index'),
('Super Admin', '/admin/permission/search'),
('Super Admin', '/admin/permission/update'),
('Super Admin', '/admin/permission/view'),
('Super Admin', '/admin/role/*'),
('Super Admin', '/admin/role/assign'),
('Super Admin', '/admin/role/create'),
('Super Admin', '/admin/role/delete'),
('Super Admin', '/admin/role/index'),
('Super Admin', '/admin/role/search'),
('Super Admin', '/admin/role/update'),
('Super Admin', '/admin/role/view'),
('Super Admin', '/admin/route/*'),
('Super Admin', '/admin/route/assign'),
('Super Admin', '/admin/route/create'),
('Super Admin', '/admin/route/index'),
('Super Admin', '/admin/route/search'),
('Super Admin', '/admin/rule/*'),
('Super Admin', '/admin/rule/create'),
('Super Admin', '/admin/rule/delete'),
('Super Admin', '/admin/rule/index'),
('Super Admin', '/admin/rule/update'),
('Super Admin', '/admin/rule/view'),
('Admin', '/city/*'),
('Super Admin', '/city/*'),
('Super Admin', '/city/create'),
('Super Admin', '/city/delete'),
('Super Admin', '/city/index'),
('Super Admin', '/city/update'),
('Super Admin', '/city/view'),
('Admin', '/customer/*'),
('Super Admin', '/customer/*'),
('Super Admin', '/customer/create'),
('Super Admin', '/customer/delete'),
('Super Admin', '/customer/index'),
('Super Admin', '/customer/update'),
('Super Admin', '/customer/view'),
('Manager', '/debug/*'),
('Super Admin', '/debug/*'),
('User Management', '/debug/*'),
('Manager', '/debug/default/*'),
('Super Admin', '/debug/default/*'),
('User Management', '/debug/default/*'),
('Manager', '/debug/default/db-explain'),
('Super Admin', '/debug/default/db-explain'),
('User Management', '/debug/default/db-explain'),
('Manager', '/debug/default/download-mail'),
('Super Admin', '/debug/default/download-mail'),
('User Management', '/debug/default/download-mail'),
('Manager', '/debug/default/index'),
('Super Admin', '/debug/default/index'),
('User Management', '/debug/default/index'),
('Manager', '/debug/default/toolbar'),
('Super Admin', '/debug/default/toolbar'),
('User Management', '/debug/default/toolbar'),
('Manager', '/debug/default/view'),
('Super Admin', '/debug/default/view'),
('User Management', '/debug/default/view'),
('Manager', '/gii/*'),
('Super Admin', '/gii/*'),
('User Management', '/gii/*'),
('Manager', '/gii/default/*'),
('Super Admin', '/gii/default/*'),
('User Management', '/gii/default/*'),
('Manager', '/gii/default/action'),
('Super Admin', '/gii/default/action'),
('User Management', '/gii/default/action'),
('Manager', '/gii/default/diff'),
('Super Admin', '/gii/default/diff'),
('User Management', '/gii/default/diff'),
('Manager', '/gii/default/index'),
('Super Admin', '/gii/default/index'),
('User Management', '/gii/default/index'),
('Manager', '/gii/default/preview'),
('Super Admin', '/gii/default/preview'),
('User Management', '/gii/default/preview'),
('Manager', '/gii/default/view'),
('Super Admin', '/gii/default/view'),
('User Management', '/gii/default/view'),
('Admin', '/restaurant/*'),
('Super Admin', '/restaurant/*'),
('Super Admin', '/restaurant/create'),
('Super Admin', '/restaurant/delete'),
('Super Admin', '/restaurant/image-delete'),
('Super Admin', '/restaurant/index'),
('Super Admin', '/restaurant/update'),
('Super Admin', '/restaurant/view'),
('Admin', '/services/*'),
('Super Admin', '/services/*'),
('Super Admin', '/services/create'),
('Super Admin', '/services/delete'),
('Super Admin', '/services/index'),
('Super Admin', '/services/update'),
('Super Admin', '/services/view'),
('Admin', '/site-config/*'),
('Super Admin', '/site-config/*'),
('Super Admin', '/site-config/create'),
('Super Admin', '/site-config/delete'),
('Super Admin', '/site-config/index'),
('Super Admin', '/site-config/update'),
('Super Admin', '/site-config/view'),
('Admin', '/site-seen/*'),
('Super Admin', '/site-seen/*'),
('Super Admin', '/site-seen/create'),
('Super Admin', '/site-seen/delete'),
('Super Admin', '/site-seen/index'),
('Super Admin', '/site-seen/update'),
('Super Admin', '/site-seen/view'),
('Admin', '/site/*'),
('Manager', '/site/*'),
('Seller', '/site/*'),
('Super Admin', '/site/*'),
('User Management', '/site/*'),
('Manager', '/site/error'),
('Seller', '/site/error'),
('Super Admin', '/site/error'),
('User Management', '/site/error'),
('Manager', '/site/index'),
('Seller', '/site/index'),
('Super Admin', '/site/index'),
('User Management', '/site/index'),
('Manager', '/site/login'),
('Seller', '/site/login'),
('Super Admin', '/site/login'),
('User Management', '/site/login'),
('Manager', '/site/logout'),
('Seller', '/site/logout'),
('Super Admin', '/site/logout'),
('User Management', '/site/logout'),
('Admin', '/uploaded-file/*'),
('Super Admin', '/uploaded-file/*'),
('Super Admin', '/uploaded-file/delete'),
('Super Admin', '/uploaded-file/image-delete'),
('Super Admin', '/uploaded-file/index'),
('Admin', '/user/*'),
('Manager', '/user/*'),
('Super Admin', '/user/*'),
('User Management', '/user/*'),
('Manager', '/user/create'),
('Super Admin', '/user/create'),
('User Management', '/user/create'),
('Manager', '/user/delete'),
('Super Admin', '/user/delete'),
('User Management', '/user/delete'),
('Manager', '/user/index'),
('Super Admin', '/user/index'),
('User Management', '/user/index'),
('Manager', '/user/update'),
('Super Admin', '/user/update'),
('User Management', '/user/update'),
('Manager', '/user/view'),
('Super Admin', '/user/view'),
('User Management', '/user/view'),
('Admin', 'Manager'),
('Super Admin', 'Seller'),
('Admin', 'User Management'),
('Super Admin', 'User Management');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('Admin Rule', 'O:19:"app\\rules\\AdminRule":3:{s:4:"name";s:10:"Admin Rule";s:9:"createdAt";i:1450352534;s:9:"updatedAt";i:1450352534;}', 1450352534, 1450352534),
('Manager Rule', 'O:21:"app\\rules\\ManagerRule":3:{s:4:"name";s:12:"Manager Rule";s:9:"createdAt";i:1450353007;s:9:"updatedAt";i:1450353007;}', 1450353007, 1450353007),
('Seller Rule', 'O:20:"app\\rules\\SellerRule":3:{s:4:"name";s:11:"Seller Rule";s:9:"createdAt";i:1450357305;s:9:"updatedAt";i:1450357305;}', 1450357305, 1450357305),
('Super Admin Rule', 'O:24:"app\\rules\\SuperAdminRule":3:{s:4:"name";s:16:"Super Admin Rule";s:9:"createdAt";i:1450353172;s:9:"updatedAt";i:1450353172;}', 1450353172, 1450353172);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(2048) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT '',
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `code`, `description`, `country_name`, `latitude`, `longitude`) VALUES
(1, 'Kaitaia', 'KAT', '', ' New Zealand', '', ''),
(2, 'Napier-Hastings', 'NPE', NULL, ' New Zealand', NULL, NULL),
(3, 'Nelso', 'NSN', NULL, ' New Zealand', NULL, NULL),
(4, 'New', 'NPL', NULL, ' New Zealand', NULL, NULL),
(5, 'Palmerston', 'PMR', NULL, ' New Zealand', NULL, NULL),
(6, 'Queenstown', 'ZQN', NULL, ' New Zealand', NULL, NULL),
(7, 'Rotorua', 'ROT', NULL, ' New Zealand', NULL, NULL),
(8, 'Mount', 'MON', NULL, ' New Zealand', NULL, NULL),
(9, 'Auckland', 'AKL', NULL, ' New Zealand', NULL, NULL),
(10, 'Blenheim', 'BHE', NULL, ' New Zealand', NULL, NULL),
(11, 'Chatham', 'CHT', NULL, ' New Zealand', NULL, NULL),
(12, 'Christchurch', 'CHC', NULL, ' New Zealand', NULL, NULL),
(14, 'Timaru', 'TIU', NULL, ' New Zealand', NULL, NULL),
(15, 'Wanaka', 'WKA', NULL, ' New Zealand', NULL, NULL),
(16, 'Wanganui', 'WAG', NULL, ' New Zealand', NULL, NULL),
(17, 'Wellington', 'WLG', NULL, ' New Zealand', NULL, NULL),
(18, 'Westport', 'WSZ', NULL, ' New Zealand', NULL, NULL),
(19, 'Whakatane', 'WHK', NULL, ' New Zealand', NULL, NULL),
(20, 'Whangarei', 'WRE', NULL, ' New Zealand', NULL, NULL),
(21, 'Dunedin', 'DUD', '', ' New Zealand', '', ''),
(22, 'Gisborne', 'GIS', NULL, ' New Zealand', NULL, NULL),
(23, 'Hamilton', 'HLZ', NULL, ' New Zealand', NULL, NULL),
(24, 'Hokitika', 'HKK', NULL, ' New Zealand', NULL, NULL),
(25, 'Invercargill', 'IVC', NULL, ' New Zealand', NULL, NULL),
(26, 'Taupo', 'TUO', NULL, ' New Zealand', NULL, NULL),
(27, 'Tauranga', 'TRG', NULL, ' New Zealand', NULL, NULL),
(30, 'Cityname', 'COde', 'Desc', '', '12.999299', '34.234324');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` text,
  `icon` varchar(255) DEFAULT 'fa fa-circle-o',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `parent`, `route`, `order`, `data`, `icon`) VALUES
(1, 'Admin', NULL, '/admin/assignment/index', 0, NULL, 'fa fa-user'),
(2, 'Roles', 1, '/admin/role/index', NULL, NULL, 'fa fa-circle-o'),
(3, 'Assignment', 1, '/admin/assignment/index', NULL, NULL, 'fa fa-circle-o'),
(4, 'Routes', 1, '/admin/route/index', NULL, NULL, 'fa fa-circle-o'),
(5, 'Rules', 1, '/admin/rule/index', NULL, NULL, 'fa fa-circle-o'),
(6, 'Menu', 1, '/admin/menu/index', NULL, NULL, 'fa fa-circle-o'),
(7, 'User Manage', 1, '/user/index', NULL, NULL, 'fa fa-circle-o'),
(8, 'Gii', NULL, '/gii/default/index', 11, NULL, 'fa fa-laptop'),
(9, 'Debug', NULL, '/debug/default/index', 12, NULL, 'fa fa-bug'),
(10, 'Permission', 1, '/admin/permission/index', NULL, NULL, 'fa fa-circle-o'),
(11, 'Restaurants', NULL, '/restaurant/index', 3, NULL, 'fa fa-circle-o'),
(13, 'Cities', NULL, '/city/index', 2, NULL, 'fa fa-circle-o'),
(15, 'Services', NULL, '/services/index', 3, NULL, 'fa fa-circle-o'),
(16, 'Site-Seen', NULL, '/site-seen/index', 4, NULL, 'fa fa-circle-o'),
(17, 'Itinerary', NULL, '/customer/index', 1, NULL, 'fa fa-circle-o');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1450345151),
('m130524_201442_init', 1450345154),
('m140506_102106_rbac_init', 1450352131),
('m140602_111327_create_menu_table', 1450352044);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` mediumint(7) unsigned NOT NULL,
  `type` enum('Restaurant','Pub',' Nightclubs') NOT NULL,
  `title` varchar(1024) NOT NULL,
  `Description` text NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `close_time` varchar(50) NOT NULL,
  `address` varchar(512) NOT NULL,
  `phone_no1` varchar(11) NOT NULL,
  `phone_no2` varchar(11) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `city_id`, `type`, `title`, `Description`, `open_time`, `close_time`, `address`, `phone_no1`, `phone_no2`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(3, 12, 'Restaurant', 'Restaurant[title]', 'Restaurant[Description]', 'Restaurant[open_time]', 'Restaurant[close_time]', 'Restaurant[address1]', '1234567890', '1234567890', '21.21321', '23.3242', '2016-06-07 08:18:39', '2016-06-09 01:52:21'),
(4, 22, 'Restaurant', 'zdsadsa', 'kjbkjb', 'mnbmb', 'b', 'm', 'mm', 'mb', '21312321', '21423523', '2016-06-12 01:51:28', '2016-06-11 20:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `type` enum('Taxi services','Money Exchanger','Petrol pumps','i-site centres','Super markets','Shopping','Cinemas') NOT NULL,
  `title` varchar(1024) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `retail_price` float NOT NULL,
  `discounted_price` float NOT NULL,
  `Description` text NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `close_time` varchar(50) NOT NULL,
  `address` varchar(512) NOT NULL,
  `phone_no1` varchar(11) NOT NULL,
  `phone_no2` varchar(11) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `city_id`, `type`, `title`, `valid_from`, `valid_to`, `retail_price`, `discounted_price`, `Description`, `open_time`, `close_time`, `address`, `phone_no1`, `phone_no2`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'Taxi services', 'Services[title]', '0000-00-00', '0000-00-00', 7, 4, 'Services[Description]', 'Services[open_time]', 'Services[close_time]', 'Services[address1]', '1234567890', '1234567890', '4', '4', '2016-06-05 09:43:55', '2016-06-11 22:31:07'),
(2, 9, 'Taxi services', 'Services[title]', '0000-00-00', '0000-00-00', 67, 45, 'Services[Description]', 'Services[open_time]', 'Services[close_time]', 'Services[address1]', '1234567890', '1234567890', '3243', '34', '2016-06-05 10:27:28', '2016-06-05 04:57:28'),
(3, 9, 'Taxi services', 'Services[title]', '0000-00-00', '0000-00-00', 0, 0, 'Services[Description]', 'Services[open_time]', 'Services[close_time]', 'Services[address1]', '1234567890', '1234567890', '213', '21321', '2016-06-05 10:42:51', '2016-06-05 05:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `site_config`
--

CREATE TABLE IF NOT EXISTS `site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `label` varchar(60) NOT NULL,
  `type` enum('API_URL','System','Custom') NOT NULL DEFAULT 'System',
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `site_config`
--

INSERT INTO `site_config` (`id`, `config_key`, `value`, `label`, `type`, `created_at`, `modified_at`) VALUES
(1, '_Restaurant_Upload_Path', '/upload/restaurants/', 'Path for Restaurant image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(2, '_Services_Upload_Path', '/upload/services/', 'Path for Services image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(3, '_Upload_Path', '/upload/', 'Path for Restaurant image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(4, '_SiteSeen_Upload_Path', '/upload/site-seen/', 'Path for site seen image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(5, '_City_Upload_Path', '/upload/city/', 'Path for City image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(6, '_Relative_Upload_Path', '/web/', 'Relative path after base path', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `site_seen`
--

CREATE TABLE IF NOT EXISTS `site_seen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `title` varchar(1024) NOT NULL,
  `Description` text NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `close_time` varchar(50) NOT NULL,
  `address` varchar(512) NOT NULL,
  `phone_no1` varchar(11) NOT NULL,
  `phone_no2` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `site_seen`
--

INSERT INTO `site_seen` (`id`, `city_id`, `title`, `Description`, `open_time`, `close_time`, `address`, `phone_no1`, `phone_no2`, `email`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 9, 'Services[title]', 'Services[Description]', 'Services[open_time]', 'Services[close_time]', 'Services[address1]', '1234567890', '1234567890', 'example@example.com', '4', '4', '2016-06-05 09:43:55', '2016-06-09 01:56:02'),
(2, 9, 'Services[title]', 'Services[Description]', 'Services[open_time]', 'Services[close_time]', 'Services[address1]', '1234567890', '1234567890', NULL, '3243', '34', '2016-06-05 10:27:28', '2016-06-05 04:57:28'),
(3, 25, 'SiteSeen[title]', 'SiteSeen[Description]', 'SiteSeen[open_time]', 'SiteSeen[close_time]', 'SiteSeen[address1]', '1234567890', '1234567890', 'example@example.com', '23423', '23423', '2016-06-12 02:28:00', '2016-06-11 21:00:33'),
(4, 23, 'asvfdjhasv', 'bmvbdsmbv', '9:00 AM', '7:00 PM', 'kgkjgjk', '', '', '', '21', '22', '2016-06-12 03:46:06', '2016-06-11 22:16:31'),
(5, 2, 'SiteSeen[title]', 'SiteSeen[Description]', 'SiteSeen[open_time]', 'SiteSeen[close_time]', '', '1234567890', '1234567890', 'example@example.com', '1223', '12', '2016-06-12 04:00:11', '2016-06-11 22:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_file`
--

CREATE TABLE IF NOT EXISTS `uploaded_file` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `reference_id` int(11) unsigned DEFAULT NULL,
  `reference_type` enum('Restaurant','Services','SiteSeen','City') DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `cover_image` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- Dumping data for table `uploaded_file`
--

INSERT INTO `uploaded_file` (`id`, `reference_id`, `reference_type`, `name`, `filename`, `size`, `path`, `type`, `cover_image`, `created_at`) VALUES
(1, 3, 'Restaurant', '3.jpg', '31465500141-big.jpg', 273710, '/upload/restaurants/31465500141-big.jpg', 'Big', 1, '2016-06-09 07:22:21'),
(2, 3, 'Restaurant', 'download.jpg', 'download1465500141-big.jpg', 10708, '/upload/restaurants/download1465500141-big.jpg', 'Big', 1, '2016-06-09 07:22:21'),
(3, 3, 'Restaurant', 'download (1).jpg', 'download (1)1465500141-big.jpg', 7008, '/upload/restaurants/download (1)1465500141-big.jpg', 'Big', 1, '2016-06-09 07:22:21'),
(4, 3, 'Restaurant', 'index.jpeg', 'index1465500141-big.jpeg', 4332, '/upload/restaurants/index1465500141-big.jpeg', 'Big', 1, '2016-06-09 07:22:21'),
(5, 3, 'Restaurant', 'screenshot2.png', 'screenshot21465500141-big.png', 95084, '/upload/restaurants/screenshot21465500141-big.png', 'Big', 1, '2016-06-09 07:22:21'),
(6, 3, 'Restaurant', 'setting.png', 'setting1465500141-big.png', 504470, '/upload/restaurants/setting1465500141-big.png', 'Big', 1, '2016-06-09 07:22:21'),
(7, 3, 'Restaurant', 'download.jpg', 'download1465500141-small.jpg', 10708, '/upload/restaurants/download1465500141-small.jpg', 'Small', 0, '2016-06-09 07:22:21'),
(8, 3, 'Restaurant', 'download (1).jpg', 'download (1)1465500141-small.jpg', 7008, '/upload/restaurants/download (1)1465500141-small.jpg', 'Small', 0, '2016-06-09 07:22:21'),
(9, 3, 'Restaurant', 'index.jpeg', 'index1465500141-small.jpeg', 4332, '/upload/restaurants/index1465500141-small.jpeg', 'Small', 0, '2016-06-09 07:22:21'),
(10, 3, 'Restaurant', 'screenshot2.png', 'screenshot21465500141-small.png', 95084, '/upload/restaurants/screenshot21465500141-small.png', 'Small', 0, '2016-06-09 07:22:21'),
(11, 3, 'Restaurant', 'setting.png', 'setting1465500141-small.png', 504470, '/upload/restaurants/setting1465500141-small.png', 'Small', 0, '2016-06-09 07:22:21'),
(36, 1, 'City', '3.jpg', '31465500385-big.jpg', 273710, '/upload/city/31465500385-big.jpg', 'Big', 1, '2016-06-09 07:26:25'),
(37, 1, 'City', 'download.jpg', 'download1465500385-big.jpg', 10708, '/upload/city/download1465500385-big.jpg', 'Big', 1, '2016-06-09 07:26:25'),
(42, 1, 'City', 'download.jpg', 'download1465500385-small.jpg', 10708, '/upload/city/download1465500385-small.jpg', 'Small', 0, '2016-06-09 07:26:25'),
(43, 1, 'City', 'download (1).jpg', 'download (1)1465500385-small.jpg', 7008, '/upload/city/download (1)1465500385-small.jpg', 'Small', 0, '2016-06-09 07:26:25'),
(45, 1, 'City', 'screenshot2.png', 'screenshot21465500385-small.png', 95084, '/upload/city/screenshot21465500385-small.png', 'Small', 0, '2016-06-09 07:26:25'),
(56, 4, 'Restaurant', '3.jpg', '31465696288-big.jpg', 273710, '/upload/restaurants/31465696288-big.jpg', 'Big', 1, '2016-06-12 01:51:28'),
(57, 4, 'Restaurant', 'download.jpg', 'download1465696288-big.jpg', 10708, '/upload/restaurants/download1465696288-big.jpg', 'Big', 1, '2016-06-12 01:51:28'),
(58, 4, 'Restaurant', 'download (1).jpg', 'download (1)1465696288-big.jpg', 7008, '/upload/restaurants/download (1)1465696288-big.jpg', 'Big', 1, '2016-06-12 01:51:28'),
(59, 4, 'Restaurant', 'index.jpeg', 'index1465696288-big.jpeg', 4332, '/upload/restaurants/index1465696288-big.jpeg', 'Big', 1, '2016-06-12 01:51:28'),
(60, 4, 'Restaurant', 'screenshot2.png', 'screenshot21465696288-big.png', 95084, '/upload/restaurants/screenshot21465696288-big.png', 'Big', 1, '2016-06-12 01:51:28'),
(61, 4, 'Restaurant', 'setting.png', 'setting1465696288-big.png', 504470, '/upload/restaurants/setting1465696288-big.png', 'Big', 1, '2016-06-12 01:51:28'),
(62, 4, 'Restaurant', 'download.jpg', 'download1465696288-small.jpg', 10708, '/upload/restaurants/download1465696288-small.jpg', 'Small', 0, '2016-06-12 01:51:28'),
(63, 4, 'Restaurant', 'download (1).jpg', 'download (1)1465696288-small.jpg', 7008, '/upload/restaurants/download (1)1465696288-small.jpg', 'Small', 0, '2016-06-12 01:51:28'),
(64, 4, 'Restaurant', 'index.jpeg', 'index1465696288-small.jpeg', 4332, '/upload/restaurants/index1465696288-small.jpeg', 'Small', 0, '2016-06-12 01:51:28'),
(65, 4, 'Restaurant', 'screenshot2.png', 'screenshot21465696288-small.png', 95084, '/upload/restaurants/screenshot21465696288-small.png', 'Small', 0, '2016-06-12 01:51:28'),
(66, 4, 'Restaurant', 'setting.png', 'setting1465696288-small.png', 504470, '/upload/restaurants/setting1465696288-small.png', 'Small', 0, '2016-06-12 01:51:28'),
(67, 1, 'Services', '3.jpg', '31465698000-big.jpg', 273710, '/upload/services/31465698000-big.jpg', 'Big', 1, '2016-06-12 02:20:00'),
(68, 1, 'Services', 'download.jpg', 'download1465698000-big.jpg', 10708, '/upload/services/download1465698000-big.jpg', 'Big', 1, '2016-06-12 02:20:00'),
(69, 1, 'Services', 'download (1).jpg', 'download (1)1465698000-big.jpg', 7008, '/upload/services/download (1)1465698000-big.jpg', 'Big', 1, '2016-06-12 02:20:00'),
(70, 1, 'Services', 'index.jpeg', 'index1465698000-big.jpeg', 4332, '/upload/services/index1465698000-big.jpeg', 'Big', 1, '2016-06-12 02:20:00'),
(71, 1, 'Services', 'screenshot2.png', 'screenshot21465698000-big.png', 95084, '/upload/services/screenshot21465698000-big.png', 'Big', 1, '2016-06-12 02:20:00'),
(72, 1, 'Services', 'setting.png', 'setting1465698000-big.png', 504470, '/upload/services/setting1465698000-big.png', 'Big', 1, '2016-06-12 02:20:00'),
(73, 1, 'Services', 'download.jpg', 'download1465698000-small.jpg', 10708, '/upload/services/download1465698000-small.jpg', 'Small', 0, '2016-06-12 02:20:00'),
(74, 1, 'Services', 'download (1).jpg', 'download (1)1465698000-small.jpg', 7008, '/upload/services/download (1)1465698000-small.jpg', 'Small', 0, '2016-06-12 02:20:00'),
(75, 1, 'Services', 'index.jpeg', 'index1465698000-small.jpeg', 4332, '/upload/services/index1465698000-small.jpeg', 'Small', 0, '2016-06-12 02:20:00'),
(76, 1, 'Services', 'screenshot2.png', 'screenshot21465698000-small.png', 95084, '/upload/services/screenshot21465698000-small.png', 'Small', 0, '2016-06-12 02:20:00'),
(77, 1, 'Services', 'setting.png', 'setting1465698000-small.png', 504470, '/upload/services/setting1465698000-small.png', 'Small', 0, '2016-06-12 02:20:00'),
(78, 3, 'SiteSeen', '3.jpg', '31465698480-big.jpg', 273710, '/upload/site-seen/31465698480-big.jpg', 'Big', 1, '2016-06-12 02:28:00'),
(79, 3, 'SiteSeen', 'download.jpg', 'download1465698480-big.jpg', 10708, '/upload/site-seen/download1465698480-big.jpg', 'Big', 1, '2016-06-12 02:28:00'),
(80, 3, 'SiteSeen', 'download (1).jpg', 'download (1)1465698480-big.jpg', 7008, '/upload/site-seen/download (1)1465698480-big.jpg', 'Big', 1, '2016-06-12 02:28:00'),
(81, 3, 'SiteSeen', 'index.jpeg', 'index1465698480-big.jpeg', 4332, '/upload/site-seen/index1465698480-big.jpeg', 'Big', 1, '2016-06-12 02:28:00'),
(82, 3, 'SiteSeen', 'screenshot2.png', 'screenshot21465698480-big.png', 95084, '/upload/site-seen/screenshot21465698480-big.png', 'Big', 1, '2016-06-12 02:28:00'),
(83, 3, 'SiteSeen', 'setting.png', 'setting1465698480-big.png', 504470, '/upload/site-seen/setting1465698480-big.png', 'Big', 1, '2016-06-12 02:28:00'),
(84, 3, 'SiteSeen', '3.jpg', '31465698480-small.jpg', 273710, '/upload/site-seen/31465698480-small.jpg', 'Small', 0, '2016-06-12 02:28:00'),
(85, 3, 'SiteSeen', 'download.jpg', 'download1465698480-small.jpg', 10708, '/upload/site-seen/download1465698480-small.jpg', 'Small', 0, '2016-06-12 02:28:00'),
(86, 3, 'SiteSeen', 'download (1).jpg', 'download (1)1465698480-small.jpg', 7008, '/upload/site-seen/download (1)1465698480-small.jpg', 'Small', 0, '2016-06-12 02:28:00'),
(87, 3, 'SiteSeen', 'index.jpeg', 'index1465698480-small.jpeg', 4332, '/upload/site-seen/index1465698480-small.jpeg', 'Small', 0, '2016-06-12 02:28:00'),
(88, 3, 'SiteSeen', 'screenshot2.png', 'screenshot21465698480-small.png', 95084, '/upload/site-seen/screenshot21465698480-small.png', 'Small', 0, '2016-06-12 02:28:00'),
(89, 3, 'SiteSeen', 'setting.png', 'setting1465698480-small.png', 504470, '/upload/site-seen/setting1465698480-small.png', 'Small', 0, '2016-06-12 02:28:00'),
(90, 4, 'SiteSeen', 'download.jpg', 'download1465703166-big.jpg', 10708, '/upload/site-seen/download1465703166-big.jpg', 'Big', 1, '2016-06-12 03:46:06'),
(91, 4, 'SiteSeen', 'download (1).jpg', 'download (1)1465703166-big.jpg', 7008, '/upload/site-seen/download (1)1465703166-big.jpg', 'Big', 1, '2016-06-12 03:46:06'),
(92, 4, 'SiteSeen', 'index.jpeg', 'index1465703166-big.jpeg', 4332, '/upload/site-seen/index1465703166-big.jpeg', 'Big', 1, '2016-06-12 03:46:06'),
(93, 4, 'SiteSeen', 'screenshot2.png', 'screenshot21465703166-big.png', 95084, '/upload/site-seen/screenshot21465703166-big.png', 'Big', 1, '2016-06-12 03:46:06'),
(94, 4, 'SiteSeen', 'setting.png', 'setting1465703166-big.png', 504470, '/upload/site-seen/setting1465703166-big.png', 'Big', 1, '2016-06-12 03:46:06'),
(95, 4, 'SiteSeen', '3.jpg', '31465703166-small.jpg', 273710, '/upload/site-seen/31465703166-small.jpg', 'Small', 0, '2016-06-12 03:46:06'),
(96, 4, 'SiteSeen', 'download.jpg', 'download1465703166-small.jpg', 10708, '/upload/site-seen/download1465703166-small.jpg', 'Small', 0, '2016-06-12 03:46:06'),
(97, 4, 'SiteSeen', 'download (1).jpg', 'download (1)1465703166-small.jpg', 7008, '/upload/site-seen/download (1)1465703166-small.jpg', 'Small', 0, '2016-06-12 03:46:06'),
(98, 4, 'SiteSeen', 'index.jpeg', 'index1465703166-small.jpeg', 4332, '/upload/site-seen/index1465703166-small.jpeg', 'Small', 0, '2016-06-12 03:46:06'),
(99, 4, 'SiteSeen', 'screenshot2.png', 'screenshot21465703166-small.png', 95084, '/upload/site-seen/screenshot21465703166-small.png', 'Small', 0, '2016-06-12 03:46:06'),
(100, 4, 'SiteSeen', 'setting.png', 'setting1465703166-small.png', 504470, '/upload/site-seen/setting1465703166-small.png', 'Small', 0, '2016-06-12 03:46:06'),
(101, 4, 'SiteSeen', '3.jpg', '31465703191-big.jpg', 273710, '/upload/site-seen/31465703191-big.jpg', 'Big', 1, '2016-06-12 03:46:31'),
(102, 4, 'SiteSeen', 'download.jpg', 'download1465703191-big.jpg', 10708, '/upload/site-seen/download1465703191-big.jpg', 'Big', 1, '2016-06-12 03:46:31'),
(103, 4, 'SiteSeen', 'download (1).jpg', 'download (1)1465703191-big.jpg', 7008, '/upload/site-seen/download (1)1465703191-big.jpg', 'Big', 1, '2016-06-12 03:46:31'),
(104, 4, 'SiteSeen', 'index.jpeg', 'index1465703191-big.jpeg', 4332, '/upload/site-seen/index1465703191-big.jpeg', 'Big', 1, '2016-06-12 03:46:31'),
(105, 4, 'SiteSeen', 'screenshot2.png', 'screenshot21465703191-big.png', 95084, '/upload/site-seen/screenshot21465703191-big.png', 'Big', 1, '2016-06-12 03:46:31'),
(106, 4, 'SiteSeen', 'setting.png', 'setting1465703191-big.png', 504470, '/upload/site-seen/setting1465703191-big.png', 'Big', 1, '2016-06-12 03:46:31'),
(107, 5, 'SiteSeen', '3.jpg', '31465704011-big.jpg', 273710, '/upload/site-seen/31465704011-big.jpg', 'Big', 1, '2016-06-12 04:00:11'),
(108, 5, 'SiteSeen', 'download.jpg', 'download1465704011-big.jpg', 10708, '/upload/site-seen/download1465704011-big.jpg', 'Big', 1, '2016-06-12 04:00:11'),
(109, 5, 'SiteSeen', 'download (1).jpg', 'download (1)1465704011-big.jpg', 7008, '/upload/site-seen/download (1)1465704011-big.jpg', 'Big', 1, '2016-06-12 04:00:11'),
(110, 5, 'SiteSeen', 'index.jpeg', 'index1465704011-big.jpeg', 4332, '/upload/site-seen/index1465704011-big.jpeg', 'Big', 1, '2016-06-12 04:00:11'),
(111, 5, 'SiteSeen', 'screenshot2.png', 'screenshot21465704011-big.png', 95084, '/upload/site-seen/screenshot21465704011-big.png', 'Big', 1, '2016-06-12 04:00:11'),
(112, 5, 'SiteSeen', 'setting.png', 'setting1465704011-big.png', 504470, '/upload/site-seen/setting1465704011-big.png', 'Big', 1, '2016-06-12 04:00:11'),
(113, 5, 'SiteSeen', 'index.jpeg', 'index1465704011-small.jpeg', 4332, '/upload/site-seen/index1465704011-small.jpeg', 'Small', 0, '2016-06-12 04:00:11'),
(114, 5, 'SiteSeen', 'screenshot2.png', 'screenshot21465704011-small.png', 95084, '/upload/site-seen/screenshot21465704011-small.png', 'Small', 0, '2016-06-12 04:00:11'),
(115, 5, 'SiteSeen', 'setting.png', 'setting1465704011-small.png', 504470, '/upload/site-seen/setting1465704011-small.png', 'Small', 0, '2016-06-12 04:00:11');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_no` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `day_description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `name`, `mobile_no`, `day_description`, `type`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'nTq8nI-MFQmZahBimlNOC2I_4DugYCEK', '$2y$13$4eoYQIlXkPjrn7GSv3Ueue4IfOI0ZldcX4.EA.auiM7SIKxyok4ba', NULL, 'jitendra.kumar@girnarsoft.com', 10, '0', '0', '0', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'test', 'lihqJQ9OjBjDb757GQ77bjWc8J-OH8Az', '$2y$13$G6pAtXwwsrcIPUACx41V6eTGqonu0SrYvqauA./kMoN9TsJwxb3/u', 'qexg-abrHUVxYA92xV_H8mDKauFsLh-5_1424243975', 'test@girnarsoft.com', 10, '0', '0', '0', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'R00001', 'SIhwgmhIAgWMNbdzZeNITwbZ-xuMsc8x', '$2y$13$qFNzOEbTJOOS7pDmyR1GC.Bzko5XmkLVLxOL7maEK1N6mxqShViyu', NULL, 'test@test.com', 10, 'test', '9871942912', '{"day1":"sdfmnvmfndsfv","day2":"nvsdmnvmvsn","day3":"vmndvm","day4":"vsmsdnvc","day5":"vmnvx","day6":"mnxvmsx","day7":"vsmnvmzx","day8":"vxcvbxcn","day9":"mnvmnxvbmn","day10":"vmncxvmnc"}', 'customer', '0000-00-00 00:00:00', '2016-06-12 04:11:47'),
(10, 'manager', 'sbmFtdYM3amWGh5guLv3FPxS-HySB_3D', '$2y$13$P.Xk81bWgfkqFhB0gpfZw.lzHp9ooYrGHFJVBeAYF9LZQUZN9mKBm', NULL, 'manager@vyom.com', 10, '', '', '', '', '2016-06-07 07:05:12', '2016-06-07 07:05:12');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
