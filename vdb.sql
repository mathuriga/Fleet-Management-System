-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2010 at 11:57 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(10) NOT NULL auto_increment,
  `uname` varchar(30) NOT NULL,
  `upass` varchar(30) NOT NULL,
  `login` varchar(40) NOT NULL,
  `logout` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `uname`, `upass`, `login`, `logout`) VALUES
(1, 'admin', 'admin', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
  `bid` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL,
  `u_name` varchar(40) NOT NULL,
  `v_name` varchar(50) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `sdate` varchar(30) NOT NULL,
  `edate` varchar(30) NOT NULL,
  `nod` int(10) NOT NULL,
  `km` varbinary(10) NOT NULL,
  `no_of_seats` int(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `b_date` varchar(40) NOT NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`bid`, `uid`, `u_name`, `v_name`, `d_name`, `sdate`, `edate`, `nod`, `km`, `no_of_seats`, `status`, `b_date`) VALUES
(1, 1, 'Nitish', 'Honda Accord', 'Siddharth', '2010-04-21', '2010-04-23', 3, '1200', 5, 'Approved', '2010-04-02 21:26:05'),
(2, 2, 'vaibhav', 'Chevrolet Tavera', 'Arun Kumbhar', '2010-04-21', '2010-04-23', 3, '800', 6, 'Pending', '2010-04-03 12:27:31'),
(3, 2, 'vaibhav', 'Toyota Innova', 'Siddharth', '2010-04-15', '2010-04-20', 6, '2300', 5, 'Approved', '2010-04-03 12:29:02');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE IF NOT EXISTS `driver` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(40) NOT NULL,
  `l_name` varchar(40) NOT NULL,
  `address` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(30) NOT NULL,
  `mob` varchar(15) NOT NULL,
  `lic_no` varchar(20) NOT NULL,
  `exp` varchar(20) NOT NULL,
  `experiance` int(4) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `name`, `l_name`, `address`, `image`, `city`, `state`, `mob`, `lic_no`, `exp`, `experiance`, `note`) VALUES
(2, 'Siddharth', 'Siddharth', 'New Modern Colony', 'any', 'Dhule', 'Maharashtra', '9089878765', 'MH23-X2uW', '2022-03-04', 6, 'Siddharth'),
(3, 'Umesh Patil', 'Umesh Patil', '34, Near Petrol Pump', 'any', 'Jalgaon', 'Maharashtra', '9809878767', 'MH23XD34', '2033-03-17', 3, 'Umesh is having 3 year of Expericance'),
(4, 'Kiran Sonone', 'Kiran Sonone', '2/12, Ishwar Colony', 'any', 'Bhusawal', 'Maharashtra', '9578733322', 'MH12XKD', '2010-03-26', 4, 'Kiran is having 4 year fo Exp. He is Good and Intelligent and First Choice of Customers.'),
(5, 'Asmit Patel', 'Asmit Patel', '34, New Baji market', 'any', 'Surat', 'Gujarat', '8909898767', 'GJ-34XW3', '2016-03-17', 6, 'Well Known in Gujarat.'),
(6, 'Sachin Jha', 'Sachin Jha', '34, New Baji market', 'images/', 'Dhule', 'Maharashtra', '8909898767', 'MH12XKD', '2010-03-26', 4, 'rec'),
(10, 'Yuvraj Tare', 'Yuvraj Tare', '34, Near Petrol Pump', 'images/images/ims.gif', 'Bhusawal', 'Gujarat', '9089878765', 'GJ-34XCC', '2010-03-03', 1, 'asdasd\r\nsadsa\r\nd'),
(11, 'Asim Abbas', 'Asim Abbas', 'New Modern Colony', 'images/rdc.gif', 'Dhule', 'Maharashtra', '9089878765', 'MH10-X2juW', '2010-03-16', 1, 'asdasd'),
(15, 'nitish', 'kumar', '290, shani peth,', 'No', 'bukaro', 'jharkhand', '9089878765', 'MH10-X2juW', '2010-04-29', 3, 'sadas');

-- --------------------------------------------------------

--
-- Table structure for table `fuel_details`
--

CREATE TABLE IF NOT EXISTS `fuel_details` (
  `fid` int(10) NOT NULL auto_increment,
  `v_name` varchar(50) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `date` varchar(40) NOT NULL,
  `f_type` varchar(40) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `fuel_details`
--

INSERT INTO `fuel_details` (`fid`, `v_name`, `d_name`, `date`, `f_type`, `qty`, `cost`, `note`) VALUES
(1, 'Swing XLS', 'Tousif Khan', '2010-03-18', 'Diesel', '12', 600, 'Diesel Added'),
(2, 'HUNDAI Sonata', 'Asmit Patel', '2010-03-09', 'Diesel', '30', 1500, 'Asmit Goes to full the fuel and fill the tank. the bill was 1500 Rs.'),
(4, 'TATA Nano XL', 'Kiran Sonone', '2010-03-25', 'Pertol', '23', 1250, 'Filled in Nano.');

-- --------------------------------------------------------

--
-- Table structure for table `oil_detail`
--

CREATE TABLE IF NOT EXISTS `oil_detail` (
  `id` int(11) NOT NULL auto_increment,
  `v_name` varchar(50) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `date` varchar(40) NOT NULL,
  `cost` int(10) NOT NULL,
  `o_type` varchar(30) NOT NULL,
  `odometer` varchar(20) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oil_detail`
--

INSERT INTO `oil_detail` (`id`, `v_name`, `d_name`, `date`, `cost`, `o_type`, `odometer`, `note`) VALUES
(4, 'Toyota Camry', 'Asmit Patel', '2010-04-20', 500, 'Synthetic', '67000', 'gdgfdg');

-- --------------------------------------------------------

--
-- Table structure for table `repair`
--

CREATE TABLE IF NOT EXISTS `repair` (
  `id` int(10) NOT NULL auto_increment,
  `v_name` varchar(50) NOT NULL,
  `g_name` varchar(50) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `date` varchar(40) NOT NULL,
  `odometer` varchar(20) NOT NULL,
  `cost` int(10) NOT NULL,
  `note` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `repair`
--

INSERT INTO `repair` (`id`, `v_name`, `g_name`, `d_name`, `date`, `odometer`, `cost`, `note`) VALUES
(1, 'Swing XLS', 'Kerala Garage', 'Siddharth', '2010-03-11', '23423', 1200, 'Repairs'),
(2, 'TATA Nano XL', 'Nisar Autoo Garage', 'Kiran Sonone', '2009-03-05', '23000', 23000, 'Problem is Nano then repaired by Nisar Bhai and Delivered in 4 Days.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `add1` varchar(200) NOT NULL,
  `city` varchar(40) NOT NULL,
  `state` varchar(30) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `pass`, `add1`, `city`, `state`, `mobile`, `email`) VALUES
(1, 'Nitish', 'nitish123', '2, saraswati road', 'Faizpur', 'Maharashtra', '9898987876', 'nitish@gmail.com'),
(2, 'vaibhav', 'vaibhav', 'XYZ', 'jalgaon', 'Maharashtra', '8909898767', 'vaibhav@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `vmast`
--

CREATE TABLE IF NOT EXISTS `vmast` (
  `id` int(10) NOT NULL auto_increment,
  `v_name` varchar(40) NOT NULL,
  `v_no` varchar(40) NOT NULL,
  `make` varchar(20) NOT NULL,
  `fuel_type` varchar(40) NOT NULL,
  `kmr` double NOT NULL,
  `avg` varchar(10) NOT NULL,
  `cost` int(10) NOT NULL,
  `image` varchar(50) NOT NULL,
  `v_type` varchar(40) NOT NULL,
  `insurer` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `date` varchar(40) NOT NULL,
  `exp_date` varchar(40) NOT NULL,
  `driver_name` varchar(40) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `vmast`
--

INSERT INTO `vmast` (`id`, `v_name`, `v_no`, `make`, `fuel_type`, `kmr`, `avg`, `cost`, `image`, `v_type`, `insurer`, `company`, `date`, `exp_date`, `driver_name`) VALUES
(1, 'Mercedes (S Class)', 'MH-19 8990', 'Mercedes', 'Pertol', 8, '20', 5000000, 'cars/mercedes-s-class.jpg', 'Luxury Cars', 'Shashank Agrawal', 'ICICI bank', '2010-03-02', '2020-03-24', 'Tousif Khan'),
(2, 'Mercedes (E Class)', 'MH 19 2334', 'Mercedes', 'Diesel', 5.2, '22', 180000, 'cars/mercedes-e-class.jpg', 'Luxury Cars', 'Vilas Mahajan', 'HDFC Bank', '2010-03-17', '2016-03-11', 'Tousif Khan'),
(3, 'Toyota Camry', 'MH 20 232', 'Toyota', 'Gas', 4.5, '15', 350000, 'cars/toyota--camry.jpg', 'Luxury Cars', 'Bhushan Patil', 'LIC Finance Ltd.', '2009-03-02', '2015-03-11', 'Siddharth'),
(4, 'Honda Accord', 'MH 09 234', 'Honda', 'Pertol', 4.4, '18', 340000, 'cars/honda-accord.jpg', 'Luxury Cars', 'Asif Khan', 'Bajaj Finance Ltd.', '2003-03-13', '2012-09-13', 'Tousif Khan'),
(5, 'Skoda Octavia ', 'MH 23 8987', 'Skoda', 'Gas', 6, '22', 340000, 'cars/skoda-octavia.jpg', 'Luxury Cars', 'Aakash Saxena', 'Bajaj Finance Ltd.', '2010-03-15', '2022-03-12', 'Kiran Sonone'),
(6, 'Toyota Commuter', 'MH-12 9898', 'Toyota', 'Petrol', 20, '12', 220000, 'cars/toyota_commuter.jpg', 'Mini Vans & Large Coaches', 'Amit Sharma', 'ICICI Bank Ltd.', '', '', ''),
(7, ' Deluxe A/c Coach (18 Seater)', 'MH-12 2333', ' TATA', 'Petrol', 12, '12', 2300000, 'cars/deluxe-ac-coach-3.jpg', 'Mini Vans & Large Coaches', 'Amit Sharma', 'ICICI Bank Ltd.', '', '', ''),
(8, 'Deluxe A/c Coach (35 Seater )', 'MH-12 2122', 'Toyota', 'Petrol', 12, '12', 5000000, 'cars/deluxe-volovo-coach.jpg', 'Mini Vans & Large Coaches', 'Amit Sharma', 'ICICI Bank Ltd.', '', '', ''),
(9, 'Luxury Traveller', 'MH-12 2355', 'Tempo', 'Desial', 12, '12', 220000, 'cars/tempo-travellers-a.jpg', 'Mini Vans & Large Coaches', 'Amit Sharma', 'ICICI Bank Ltd.', '', '', ''),
(10, ' Mercedes Viano', 'MH-12 2199', ' Mercedes', 'Desial', 12, '12', 5000000, 'cars/mercedes-viano.jpg', 'Mini Vans & Large Coaches', 'Amit Sharma', 'ICICI Bank Ltd.', '', '', ''),
(11, 'Maruti Baleno', 'MH 12 MC 234', 'Maruti', 'Diesel', 20, '15', 4000000, 'cars/maruti--baleno.jpg', 'Executive Cars ', 'Aakash Saxena', 'ICICI bank', '2004-04-13', '2012-09-27', 'Abid Khan'),
(12, 'Ford Fiesta', 'MH 12 8787', 'Ford', 'Diesel', 24, '21', 2300000, 'cars/ford-fiesta.jpg', 'Executive Cars', 'Asif Khan', 'HDFC Bank', '2010-04-22', '2022-04-13', 'Kiran Sonone'),
(13, 'Toyota Corolla', 'MH 23 2234', 'Toyota', 'Pertol', 23, '15', 5500000, 'cars/toyota-corolla.jpg', 'Executive Cars ', 'Aakash Saxena', 'ICICI bank', '2010-04-14', '2033-04-19', 'Abid Khan'),
(14, 'Honda Civic', 'MH 23 K878', 'Honda', 'Pertol', 18, '12', 3500000, 'cars/honda-civic.jpg', 'Executive Cars ', 'Shashank Agrawal', 'LIC Finance Ltd.', '2005-04-20', '2018-04-18', 'Kiran Sonone'),
(15, 'Tata Indica', 'MH 12 BC12 ', 'Tata', 'Diesel', 10, '22', 450000, 'cars/tata-indica.jpg', 'Economy Cars', 'Bhushan Patil', 'Bajaj Finance Ltd.', '2009-02-11', '2012-04-19', 'Sachin Jha'),
(16, 'Maruti Swift', 'MH 24 898', 'Maruti', 'Diesel', 12, '23', 340000, 'cars/swift.jpg', 'Economy Cars', 'Bhushan Patil', 'Bajaj Finance Ltd.', '2005-11-24', '2012-04-11', 'Yuvraj Tare'),
(17, 'Wagon R', 'MH 23', 'Wagon R', 'Diesel', 10, '15', 2300000, 'cars/wagnor.jpg', 'Economy Cars', 'Bhushan Patil', 'Bajaj Finance Ltd.', '2005-09-29', '2010-04-23', 'Kiran Sonone'),
(18, 'Chevrolet Tavera', 'MH 12 8787', 'Chevrolet', 'Diesel', 10, '12', 700000, 'cars/chevrolet-tavera.jpg', 'MUVs & SUVs', 'Vilas Mahajan', 'Bajaj Finance Ltd.', '2007-04-25', '2019-04-24', 'Yuvraj Tare'),
(19, 'Ford Endeavour', 'MH 23 c876', 'Ford', 'Diesel', 18, '18', 780000, 'cars/ford-endeavour.jpg', 'MUVs & SUVs', 'Vilas Mahajan', 'LIC Finance Ltd.', '2004-04-23', '2016-12-22', 'Asim Abbas'),
(20, 'Toyota Innova', 'Mh 23 N676', 'Toyota', 'Diesel', 23, '15', 800000, 'cars/toyota-innova.jpg', 'MUVs & SUVs', 'Vilas Mahajan', 'LIC Finance Ltd.', '2004-07-15', '2016-10-19', 'Asmit Patel');
