-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2018 at 06:43 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rent`
--

-- --------------------------------------------------------

--
-- Table structure for table `casual`
--

CREATE TABLE `casual` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `casual`
--

INSERT INTO `casual` (`id`, `name`, `image`, `price`) VALUES
(1, 'Business Casual Attire (M)', 'casual1.jpg', 399.99),
(2, 'Semi Casual Attire (F)', 'casual2.jpg', 350.00),
(3, 'Casual Attire (M)', 'casual3.jpg', 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `christmas`
--

CREATE TABLE `christmas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `christmas`
--

INSERT INTO `christmas` (`id`, `name`, `image`, `price`) VALUES
(1, 'Elf', 'christmas1.jpg', 199.00),
(2, 'Santa Claus', 'christmas2.jpg', 300.00),
(3, 'Santa Claus (Kid)', 'christmas3.jpg', 175.00);

-- --------------------------------------------------------

--
-- Table structure for table `cosplay`
--

CREATE TABLE `cosplay` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cosplay`
--

INSERT INTO `cosplay` (`id`, `name`, `image`, `price`) VALUES
(1, 'Sailor Moon', 'cosplay1.jpg', 350.00),
(2, 'Blood C', 'cosplay2.jpg', 375.00),
(3, 'Themis', 'cosplay3.jpg', 299.99),
(4, 'Chikito', 'cosplay4.jpg', 399.99),
(5, 'Luffy (Kid)', 'cosplay5.jpg', 250.00),
(6, 'Mickey Mouse (Kid)', 'cosplay6.jpg', 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `formal`
--

CREATE TABLE `formal` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formal`
--

INSERT INTO `formal` (`id`, `name`, `image`, `price`) VALUES
(1, 'Semi Formal (M)', 'formal1.jpg', 349.99),
(2, 'Work Dress (F)', 'formal2.jpg', 349.99);

-- --------------------------------------------------------

--
-- Table structure for table `halloween`
--

CREATE TABLE `halloween` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `halloween`
--

INSERT INTO `halloween` (`id`, `name`, `image`, `price`) VALUES
(4, 'Witch', 'halloween1.jpg', 274.99),
(5, 'Vampire', 'halloween2.jpg', 300.00),
(6, 'Honey Bee (Kid)', 'halloween3.jpg', 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `others`
--

CREATE TABLE `others` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `others`
--

INSERT INTO `others` (`id`, `name`, `image`, `price`) VALUES
(1, 'Graduation Gown (F)', 'grad1.jpg', 500.00),
(2, 'Graduation Gown (M)', 'grad2.jpg', 500.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `casual`
--
ALTER TABLE `casual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `christmas`
--
ALTER TABLE `christmas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cosplay`
--
ALTER TABLE `cosplay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formal`
--
ALTER TABLE `formal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `halloween`
--
ALTER TABLE `halloween`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `others`
--
ALTER TABLE `others`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casual`
--
ALTER TABLE `casual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `christmas`
--
ALTER TABLE `christmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cosplay`
--
ALTER TABLE `cosplay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `formal`
--
ALTER TABLE `formal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `halloween`
--
ALTER TABLE `halloween`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `others`
--
ALTER TABLE `others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
