-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 05:50 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weblove_attirerentals`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`admin_id`, `username`, `password`, `firstname`, `lastname`) VALUES
(1, 'superadmin', 'superadmin', 'Super', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address_line` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `postal_code` varchar(4) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `username`, `password`, `email`, `firstname`, `lastname`, `phone_number`, `address_line`, `city`, `province`, `postal_code`, `registration_date`) VALUES
(1, 'InitialUser', 'initialuser', 'initialuser@email.com', 'Initial', 'User', '01234567890', '123 House/Building/Unit, Street Name Barangay', 'City', 'Province', '0000', '2018-05-11 11:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_code` int(11) NOT NULL,
  `product_providerid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `rental_price` decimal(7,2) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `product_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_code`, `product_providerid`, `name`, `description`, `category_id`, `rental_price`, `availability`, `product_image`) VALUES
(4, 1, 'Business Casual Attire (M)', 'Male Business Casual Attire.', 3, '399.00', 1, 'casual1.jpg'),
(5, 1, 'Semi Casual Attire (F)', 'Female Casual Attire', 3, '399.00', 1, 'casual2.jpg'),
(6, 1, 'Casual Attire (M)', 'Casual Attire for Mens', 3, '350.00', 1, 'casual3.jpg'),
(7, 1, 'Female Elf Costume', 'New Female Elf Costume. let your santa merry this chrismats.', 4, '399.00', 1, 'christmas1.jpg'),
(8, 1, 'Santa Claus Costume', 'Santa Claus Costume for this upcoming christmas day', 4, '300.00', 1, 'christmas2.jpg'),
(9, 1, 'Santa Claus (Kid)', 'Let your Son be Santa Claus this christmas.', 4, '300.00', 1, 'christmas3.jpg'),
(10, 1, 'Sailor Moon', 'Let your Kid made their dream to become a sailor moon', 5, '375.00', 1, 'cosplay1.jpg'),
(11, 1, 'Blood C', 'Become the one of the Blood Alphabet Gang', 5, '375.00', 1, 'cosplay2.jpg'),
(12, 1, 'Themis', 'Themis is an ancient Greek Titaness', 5, '380.00', 1, 'cosplay3.jpg'),
(13, 1, 'Chikito', 'Chikito GOT THIS! get your chikito costume now!', 5, '350.00', 1, 'cosplay4.jpg'),
(14, 1, 'Luffy (Kid)', 'Buy low price, high quality one piece luffy cosplay costume', 5, '350.00', 1, 'cosplay5.jpg'),
(15, 1, 'Mickey Mouse (Kid)', 'Mickey Mouse kid costume be the Man of minnie mouse.', 5, '320.00', 1, 'cosplay6.jpg'),
(16, 1, 'Semi Formal(M)', 'In Western clothing semi-formal is a grouping of dress codes indicating the sort of clothes worn to events with a level of protocol between informal (e.g., lounge suit) and formal.', 6, '500.00', 1, 'formal1.jpg'),
(17, 1, 'Work Dress (F)', 'This Employee Dress Code policy template is ready to be tailored to your company’s needs and should be considered a starting point for setting up your company dress code policies.', 6, '550.00', 1, 'formal2.jpg'),
(18, 1, 'Blazer for boys', 'Level Up your way of dressing by try our new Blazer For boys.', 6, '450.00', 1, 'formal boy.jpg'),
(19, 1, 'witch', 'Become witch this coming halloween.', 7, '450.00', 1, 'halloween1.jpg'),
(20, 1, 'Vampire', 'vampire costumes for kids and adults, including sexy and light-up costumes. Find vampire costume ideas', 7, '450.00', 1, 'halloween2.jpg'),
(21, 1, 'Honey Bee (Kid)', 'Start creating your own honey rent this Honey Bee costume.', 7, '350.00', 1, 'halloween3.jpg'),
(22, 1, 'Graduation Gown (F)', 'Rent Gown For your Graduation. Female', 8, '600.00', 1, 'grad1.jpg'),
(23, 1, 'Graduation Gown (M)', 'Rent Gown For your Graduation. Male', 8, '600.00', 1, 'grad2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `description`) VALUES
(3, 'Casual', 'Casual is the dress code that emphasizes comfort and personal expression over presentation, formality and conformity.'),
(4, 'Christmas', 'Fun and affordable Christmas costumes for women, men, and kids. Shop for reindeer costumes, snowman costumes, and other Christmas outfits.'),
(5, 'Cosplay', 'Check out our huge selection on Cosplay Costumes from popular Japanese anime, manga and video games.'),
(6, 'Formal', 'Formal dress is the grouping of all the dress codes which govern clothes worn to formal events.'),
(7, 'halloween', 'Halloween costumes for all the family, whether you\'re off trick or treating or to a killer Halloween party.'),
(8, 'others', 'The graduates\' dress usually consists of a simple black gown, a square academic cap, and possibly a stole in faculty colour. At most other universities, faculties are responsible for organizing graduation ceremonies individually.');

-- --------------------------------------------------------

--
-- Table structure for table `serviceprovider`
--

CREATE TABLE `serviceprovider` (
  `serviceprov_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `owner_firstname` varchar(30) NOT NULL,
  `owner_lastname` varchar(30) NOT NULL,
  `address_line` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `province` varchar(50) NOT NULL,
  `postal_code` varchar(4) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_approved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serviceprovider`
--

INSERT INTO `serviceprovider` (`serviceprov_id`, `username`, `password`, `email`, `business_name`, `phone_number`, `owner_firstname`, `owner_lastname`, `address_line`, `city`, `province`, `postal_code`, `registration_date`, `is_approved`) VALUES
(1, 'InitialServiceProvider', 'initialserviceprovider', 'initialserviceprovider@email.com', 'Initial Service Provider', '01234567890', 'Initial', 'ServiceProvider', '123 House/Building/Unit, Street Name Barangay', 'City', 'Province', '0000', '2018-05-11 10:19:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `reservation_number` int(11) NOT NULL,
  `reservation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pickup_date` datetime NOT NULL,
  `product_code` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `serviceprov_id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_code`),
  ADD KEY `product_providerid` (`product_providerid`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  ADD PRIMARY KEY (`serviceprov_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `business_name` (`business_name`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`reservation_number`),
  ADD KEY `product_code` (`product_code`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `serviceprov_id` (`serviceprov_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `serviceprovider`
--
ALTER TABLE `serviceprovider`
  MODIFY `serviceprov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `reservation_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_providerid`) REFERENCES `serviceprovider` (`serviceprov_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`category_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`serviceprov_id`) REFERENCES `serviceprovider` (`serviceprov_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
