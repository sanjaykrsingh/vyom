-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 03, 2016 at 10:00 AM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `vyom`
--

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
('Admin', 1, NULL, 'Admin Rule', NULL, 1450352597, 1464687244),
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
('Super Admin', '/city/*'),
('Super Admin', '/city/create'),
('Super Admin', '/city/delete'),
('Super Admin', '/city/index'),
('Super Admin', '/city/update'),
('Super Admin', '/city/view'),
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
('Super Admin', '/restaurant/*'),
('Super Admin', '/restaurant/create'),
('Super Admin', '/restaurant/delete'),
('Super Admin', '/restaurant/image-delete'),
('Super Admin', '/restaurant/index'),
('Super Admin', '/restaurant/update'),
('Super Admin', '/restaurant/view'),
('Super Admin', '/services/*'),
('Super Admin', '/services/create'),
('Super Admin', '/services/delete'),
('Super Admin', '/services/index'),
('Super Admin', '/services/update'),
('Super Admin', '/services/view'),
('Super Admin', '/site-config/*'),
('Super Admin', '/site-config/create'),
('Super Admin', '/site-config/delete'),
('Super Admin', '/site-config/index'),
('Super Admin', '/site-config/update'),
('Super Admin', '/site-config/view'),
('Super Admin', '/site-seen/*'),
('Super Admin', '/site-seen/create'),
('Super Admin', '/site-seen/delete'),
('Super Admin', '/site-seen/index'),
('Super Admin', '/site-seen/update'),
('Super Admin', '/site-seen/view'),
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
('Super Admin', '/uploaded-file/*'),
('Super Admin', '/uploaded-file/delete'),
('Super Admin', '/uploaded-file/image-delete'),
('Super Admin', '/uploaded-file/index'),
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
('Super Admin', 'Seller'),
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
  `country_name` varchar(255) NOT NULL DEFAULT '',
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

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
(27, 'Tauranga', 'TRG', NULL, ' New Zealand', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `code` char(2) NOT NULL,
  `name` char(52) NOT NULL,
  `population` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`code`, `name`, `population`) VALUES
('AU', 'Australia', 18886000),
('BR', 'Brazil', 170115000),
('CA', 'Canada', 1147000),
('CN', 'China', 1277558000),
('DE', 'Germany', 82164700),
('FR', 'France', 59225700),
('GB', 'United Kingdom', 59623400),
('IN', 'India', 1013662000),
('RU', 'Russia', 146934000),
('US', 'United States', 278357000);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `itinerary_id` char(26) NOT NULL,
  `mobile_no` varchar(12) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `day_description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `itinerary_id` (`itinerary_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `itinerary_id`, `mobile_no`, `email`, `day_description`, `created_at`, `updated_at`) VALUES
(2, 'Sanjay', 'R000001', '999999999', 'sanjay@gmail.com', '{"day1":"sdfsdglkdashlsdg h","day2":"dsk glhl kdfhghjhjkhh","day3":"hhjhjj","day4":"jjjjj","day5":"jjjjj","day6":"jjjj","day7":"jjjjhhjh","day8":"jhjkjbmb,","day9":"jbbmmbb,","day10":"jkbjbbm"}', '2016-06-03 02:13:49', '2016-06-03 02:22:30');

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
(17, 'Customer', NULL, '/customer/index', 1, NULL, 'fa fa-circle-o');

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
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `phone_no1` varchar(11) NOT NULL,
  `phone_no2` varchar(11) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `city_id`, `type`, `title`, `Description`, `open_time`, `close_time`, `address1`, `address2`, `phone_no1`, `phone_no2`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(11, 1, 'Pub', 'asdas', 'asdA', '9:00 AM', '9:00 PM', 'ASDA', 'asda', '121312', '12321', '12', '21', '2016-05-26 05:47:40', '2016-05-31 22:43:26'),
(15, 1, '', 'asfdas', 'asfads', '', '', 'asfsad', 'safdf', '12321321', '12321', '22', '22', '2016-05-26 08:47:44', '2016-05-26 03:17:44'),
(21, 1, '', 'asdsa', 'asdas', '', '', 'asdas', 'asdsa', '21321', '12321', '12321', '213213', '2016-05-26 08:56:56', '2016-05-26 03:26:56'),
(34, 1, '', 'zdfdsfdsfsdf', 'sdfsdaf', '', '', 'sdfdsfsdsd', 'fsddsfds2131212', '76557775', '7575', '5757', '77', '2016-05-28 11:18:28', '2016-05-28 05:48:28'),
(35, 1, '', 'zdsdfdsfdf', 'sdfdsfs', '', '', 'dsfdsf', 'fdsfdsfs', '2321', '21312', '213', '21312', '2016-05-28 11:21:25', '2016-05-28 07:18:52'),
(36, 1, '', 'vhhjgh', 'hjghgh', '', '', 'hhh', 'ghhghg', '4444', '5555', '44', '5', '2016-05-28 11:41:34', '2016-05-28 06:13:16');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `type` enum('Taxi services','Money Exchanger','Petrol pumps','i-site centres','Super markets','Shopping','Cinemas') NOT NULL,
  `title` varchar(1024) NOT NULL,
  `Description` text NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `close_time` varchar(50) NOT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `phone_no1` varchar(11) NOT NULL,
  `phone_no2` varchar(11) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `site_config`
--

INSERT INTO `site_config` (`id`, `config_key`, `value`, `label`, `type`, `created_at`, `modified_at`) VALUES
(1, '_Restaurant_Upload_Path', '/../upload/restaurants/', 'Path for Restaurant image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(2, '_Services_Upload_Path', '/../upload/services/', 'Path for Services image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(3, '_Upload_Path', '/../upload/', 'Path for Restaurant image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(4, '_SiteSeen_Upload_Path', '/../upload/site-seen/', 'Path for site seen image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31'),
(5, '_City_Upload_Path', '/../upload/city/', 'Path for City image', 'Custom', '2016-05-26 08:43:47', '2016-05-28 09:07:31');

-- --------------------------------------------------------

--
-- Table structure for table `site_seen`
--

CREATE TABLE IF NOT EXISTS `site_seen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `title` varchar(1024) NOT NULL,
  `Description` text NOT NULL,
  `open_time` varchar(50) DEFAULT NULL,
  `close_time` varchar(50) DEFAULT NULL,
  `address1` varchar(100) NOT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `phone_no1` varchar(11) NOT NULL,
  `phone_no2` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `site_seen`
--

INSERT INTO `site_seen` (`id`, `city_id`, `title`, `Description`, `open_time`, `close_time`, `address1`, `address2`, `phone_no1`, `phone_no2`, `email`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 1, 'sdffdsf', 'klk', 'kkk', 'kk', 'kk', 'kk', '3213', '213', 'test@test.com', '21321', '12', '2016-05-28 11:32:11', '2016-05-28 06:27:26');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `uploaded_file`
--

INSERT INTO `uploaded_file` (`id`, `reference_id`, `reference_type`, `name`, `filename`, `size`, `path`, `type`, `cover_image`, `created_at`) VALUES
(2, 11, 'Restaurant', 'download (1).jpg', 'download (1)1464754406-big.jpg', 7008, '/../upload/restaurants/download (1)1464754406-big.jpg', 'Big', 1, '2016-06-01 04:13:26'),
(4, 11, 'Restaurant', 'download (1).jpg', 'download (1)1464754406-small.jpg', 7008, '/../upload/restaurants/download (1)1464754406-small.jpg', 'Small', 0, '2016-06-01 04:13:26'),
(5, 21, 'City', 'download.jpg', 'download1464923038-big.jpg', 10708, '/../upload/city/download1464923038-big.jpg', 'Big', 1, '2016-06-03 03:03:58'),
(6, 21, 'City', 'download (1).jpg', 'download (1)1464923038-big.jpg', 7008, '/../upload/city/download (1)1464923038-big.jpg', 'Big', 1, '2016-06-03 03:03:58'),
(7, 21, 'City', 'download.jpg', 'download1464923038-small.jpg', 10708, '/../upload/city/download1464923038-small.jpg', 'Small', 0, '2016-06-03 03:03:58'),
(8, 21, 'City', 'download (1).jpg', 'download (1)1464923038-small.jpg', 7008, '/../upload/city/download (1)1464923038-small.jpg', 'Small', 0, '2016-06-03 03:03:58');

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
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'nTq8nI-MFQmZahBimlNOC2I_4DugYCEK', '$2y$13$4eoYQIlXkPjrn7GSv3Ueue4IfOI0ZldcX4.EA.auiM7SIKxyok4ba', NULL, 'jitendra.kumar@girnarsoft.com', 10, 0, 2015),
(2, 'test', 'lihqJQ9OjBjDb757GQ77bjWc8J-OH8Az', '$2y$13$G6pAtXwwsrcIPUACx41V6eTGqonu0SrYvqauA./kMoN9TsJwxb3/u', 'qexg-abrHUVxYA92xV_H8mDKauFsLh-5_1424243975', 'test@girnarsoft.com', 10, 0, 2015);

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
