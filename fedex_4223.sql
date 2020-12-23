-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2020 at 07:03 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fedex_4223`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_Client` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_Client`, `firstName`, `lastName`, `address`, `city`, `email`) VALUES
(1, 'firstName', 'lastName', 'address', 'city', 'email'),
(2, 'Client 2', 'pClient 2', 'address 2', 'City 2', 'email2@mail.com'),
(3, 'Client 3', 'pClient 3', 'address 3', 'City 3', 'email3@mail.com'),
(4, 'firstName', 'lastName', 'address', 'city', 'email');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `Id_delivery` int(11) NOT NULL,
  `fk_packet` int(11) NOT NULL,
  `fk_status` int(11) NOT NULL,
  `date_delivered` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`Id_delivery`, `fk_packet`, `fk_status`, `date_delivered`) VALUES
(1, 1, 1, '0000-00-00 00:00:00'),
(2, 1, 2, '0000-00-00 00:00:00'),
(3, 1, 3, '0000-00-00 00:00:00'),
(4, 2, 1, '0000-00-00 00:00:00'),
(5, 2, 2, '0000-00-00 00:00:00'),
(6, 3, 1, '0000-00-00 00:00:00'),
(7, 3, 2, '0000-00-00 00:00:00'),
(8, 3, 4, '0000-00-00 00:00:00'),
(9, 4, 1, '0000-00-00 00:00:00'),
(10, 4, 5, '0000-00-00 00:00:00'),
(11, 0, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `packet`
--

CREATE TABLE `packet` (
  `id_packet` int(11) NOT NULL,
  `fk_price_packet` int(11) NOT NULL,
  `fk_client` int(11) NOT NULL,
  `fk_recipient` int(11) NOT NULL,
  `datePacket` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packet`
--

INSERT INTO `packet` (`id_packet`, `fk_price_packet`, `fk_client`, `fk_recipient`, `datePacket`) VALUES
(1, 1, 1, 1, '0000-00-00 00:00:00'),
(2, 2, 2, 2, '0000-00-00 00:00:00'),
(3, 3, 3, 3, '0000-00-00 00:00:00'),
(4, 4, 1, 2, '0000-00-00 00:00:00'),
(5, 5, 3, 1, '0000-00-00 00:00:00'),
(7, 2, 1, 1, '0000-00-00 00:00:00'),
(8, 2, 3, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `packet_price`
--

CREATE TABLE `packet_price` (
  `id_packet_Price` int(11) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `packet_price`
--

INSERT INTO `packet_price` (`id_packet_Price`, `weight`, `price`) VALUES
(1, '0-2 kg', '200'),
(2, '2-4 kg', '400'),
(3, '4-8 kg', '800'),
(4, '8-12 kg', '1500'),
(5, '12 kg+', '4000');

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `id_recipient` int(11) NOT NULL,
  `fulName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`id_recipient`, `fulName`, `address`) VALUES
(1, 'Recipient 1', 'Address 1'),
(2, 'Recipient 2', 'Address 2'),
(3, 'Recipient 3', 'Address 3');

-- --------------------------------------------------------

--
-- Table structure for table `stat`
--

CREATE TABLE `stat` (
  `ID_STAT` int(11) NOT NULL,
  `Desc_STAT` text NOT NULL,
  `DATE_STAT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `status_delivery`
--

CREATE TABLE `status_delivery` (
  `id_status` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_delivery`
--

INSERT INTO `status_delivery` (`id_status`, `status`) VALUES
(1, 'Packet preparation'),
(2, 'Packet in Transit'),
(3, 'Delivery Completed'),
(4, 'Cancelled'),
(5, 'UnKnown');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_Client`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Id_delivery`),
  ADD KEY `fk_packet` (`fk_packet`),
  ADD KEY `fk_Status` (`fk_status`);

--
-- Indexes for table `packet`
--
ALTER TABLE `packet`
  ADD PRIMARY KEY (`id_packet`),
  ADD KEY `fk_price_packet` (`fk_price_packet`),
  ADD KEY `fk_recipient` (`fk_recipient`),
  ADD KEY `fk_client` (`fk_client`);

--
-- Indexes for table `packet_price`
--
ALTER TABLE `packet_price`
  ADD PRIMARY KEY (`id_packet_Price`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`id_recipient`);

--
-- Indexes for table `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`ID_STAT`);

--
-- Indexes for table `status_delivery`
--
ALTER TABLE `status_delivery`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `Id_delivery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `packet`
--
ALTER TABLE `packet`
  MODIFY `id_packet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `packet_price`
--
ALTER TABLE `packet_price`
  MODIFY `id_packet_Price` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `id_recipient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stat`
--
ALTER TABLE `stat`
  MODIFY `ID_STAT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_delivery`
--
ALTER TABLE `status_delivery`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `fk_Status` FOREIGN KEY (`fk_status`) REFERENCES `status_delivery` (`id_status`),
  ADD CONSTRAINT `fk_packet` FOREIGN KEY (`fk_packet`) REFERENCES `packet` (`id_packet`);

--
-- Constraints for table `packet`
--
ALTER TABLE `packet`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`fk_client`) REFERENCES `client` (`id_Client`),
  ADD CONSTRAINT `fk_price_packet` FOREIGN KEY (`fk_price_packet`) REFERENCES `packet_price` (`id_packet_Price`),
  ADD CONSTRAINT `fk_recipient` FOREIGN KEY (`fk_recipient`) REFERENCES `recipient` (`id_recipient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
