-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2016 at 06:33 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `dev_interview`
--
CREATE DATABASE IF NOT EXISTS `dev_interview` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dev_interview`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID for indicating rows of this table',
  `cart_id` int(11) NOT NULL COMMENT 'Non-unique field for arranging multiple products in same cart, used for ordering',
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Contains data about having multiple products with different quantity in same car' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`unique_id`, `cart_id`, `product_id`, `qty`) VALUES
(1, 10123, 1, 3),
(2, 10123, 2, 1),
(3, 1011, 1, 2),
(4, 1011, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`_id`, `title`, `description`, `url`) VALUES
(1, 'Laptops', 'A computer that is portable and suitable for use while traveling.', 'https://www.example.com/category/laptop'),
(2, 'Mobiles', 'A telephone with access to a cellular radio system so it can be used over a wide area, without a physical connection to a network.', 'https://www.example.com/category/mobiles');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int(11) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`_id`, `user_id`, `timestamp`, `cart_id`) VALUES
(1, 1, '2016-03-19 18:58:42', 10123),
(2, 2, '2016-03-19 18:58:42', 1011);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `cat_id` int(3) NOT NULL,
  `availibility` int(11) NOT NULL,
  `product_url` text NOT NULL,
  `img_url` text NOT NULL,
  `purchase_count` int(11) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`_id`, `name`, `description`, `sku`, `price`, `cat_id`, `availibility`, `product_url`, `img_url`, `purchase_count`) VALUES
(1, 'Nexus 6P', 'Nexus 6P is quicker to access and more secure with a fingerprint sensor. Features all-metal design with powerful hardware and the newest Android ...', 'NEXUS6P001', 499, 2, 100, 'https://store.google.com/product/nexus_6p', 'http://cnet3.cbsistatic.com/hub/i/r/2015/10/19/2a8e9fb8-e75d-44e9-9778-4c6e928d1ae8/thumbnail/770x433/343037624b6361c1ab525c3d050dfe7b/google-nexus-6p-2069-001.jpg', 5),
(2, 'HP Envy dv7-7250us 17.3-Inch Laptop (2.4 GHz Intel Core i7-3630QM Processor, 8GB DDR3, 1TB HDD, Windows 8) Midnight Black', 'Intel i7 2.4 GHz\r\n8GB DDR3 SDRAM\r\n17.3-Inch Screen\r\nWindows 8', 'HPENVYDV77250US', 899, 1, 26, 'http://www.amazon.com/HP-dv7-7250us-17-3-Inch-i7-3630QM-Processor/dp/B009A1785K', 'http://ecx.images-amazon.com/images/I/41EMETUxflL.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `scressnshots`
--

DROP TABLE IF EXISTS `scressnshots`;
CREATE TABLE IF NOT EXISTS `scressnshots` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Contains every product screenshots with meta tags of that ' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `scressnshots`
--

INSERT INTO `scressnshots` (`_id`, `product_id`, `url`, `title`) VALUES
(1, 1, 'http://cdn.arstechnica.net/wp-content/uploads/2015/10/Nexus-8.jpg', 'Front pic'),
(2, 1, 'https://cdn0.vox-cdn.com/thumbor/r1aMkufCzf79luAaGCmYakSlIPY=/cdn0.vox-cdn.com/uploads/chorus_asset/file/4178268/nexus-6p-9693.0.jpg', 'Back pic'),
(3, 2, 'http://ecx.images-amazon.com/images/I/71a97KYWBeL._SL1500_.jpg', 'View1'),
(4, 2, 'http://ecx.images-amazon.com/images/I/71G06nasGfL._SL1500_.jpg', 'View2');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_st` text NOT NULL,
  `address_city` varchar(50) NOT NULL,
  `address_state` varchar(50) NOT NULL,
  `address_pincode` int(5) NOT NULL,
  `address_country` varchar(50) NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`_id`, `first_name`, `last_name`, `email`, `creation_time`, `address_st`, `address_city`, `address_state`, `address_pincode`, `address_country`) VALUES
(1, 'Dhruv', 'Patel', 'dpate171@nyit.edu', '2016-03-19 14:16:07', '348, Liberty Ave, FL2', 'Jersey city', 'New Jersey', 7307, 'USA'),
(2, 'Dhruv', 'Patel', 'dhruv.p1110@gmail.com', '2016-03-19 14:17:38', '6, Urja-1 Bunglows,\r\nNew C G Road', 'Ahmedabad', 'Gujarat', 38242, 'India');
