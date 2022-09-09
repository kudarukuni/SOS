-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2022 at 09:16 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `astore`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `AddressID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`AddressID`, `UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`) VALUES
(5, 5, 'Kudakwashe William Rukuni', '7 Arlington Road, Logan Park, Hatfield', '0263', 'Harare', 'Zimbabwe', '+26378251626');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(58) NOT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CategorySlug` varchar(68) NOT NULL,
  `Image` varchar(58) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`, `Description`, `CategorySlug`, `Image`) VALUES
(1, 'Fruits & Vegetables', 'Get fresh and cheap fruits and vegetables from some of the most promising and inspiring SME organisations across Zimbabwe.', 'Fruits-and-Vegetables', 'smartphone.png'),
(2, 'Pre-Loved Clothing', 'Get durable and cheap preloved clothing from some of the most promising and inspiring SME organisations across Zimbabwe.', 'Pre-Loved-Clothing', 'tv.png'),
(3, 'Electronic Smart Devices', 'Get original and high-spec smart devices from some of the most promising and inspiring SME organisations across Zimbabwe.', 'Electronic-Smart-Devices', 'computers.png'),
(4, 'Beverages', 'Get cheap and top quality Beverages from some of the most promising and inspiring SME startups across Zimbabwe.', 'Beverages', 'game-console.png'),
(5, 'Vehicles', 'Get good condition and cheap second hand vehicles from some of the most promising and inspiring SME organisations across Zimbabwe.', 'Vehicles', 'networks.png'),
(6, 'Construction', 'Get good quality and cheap construction materials from some of the most promising and inspiring SME organisations across Zimbabwe.', 'Construction', 'software.png');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `MessageID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Subject` varchar(128) DEFAULT NULL,
  `Content` varchar(158) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` smallint(2) NOT NULL DEFAULT 1,
  `Total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`OrderID`, `ProductID`, `Quantity`, `Total`) VALUES
(3, 1, 23, '5.75');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `SubTotal` decimal(10,2) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL,
  `ShippingFee` decimal(10,2) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `AddressID`, `SubTotal`, `Discount`, `ShippingFee`, `Total`, `OrderDate`, `Status`) VALUES
(3, 5, 5, '5.75', '0.00', '0.00', '5.75', '2022-08-24 13:26:05', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(40) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductPrice` decimal(10,2) DEFAULT 0.00,
  `UnitsInStock` smallint(5) DEFAULT 0,
  `Description` varchar(255) NOT NULL,
  `ManufactureYear` smallint(5) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `ProductSlug` varchar(50) NOT NULL,
  `Feature` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `CategoryID`, `ProductPrice`, `UnitsInStock`, `Description`, `ManufactureYear`, `Image`, `ProductSlug`, `Feature`) VALUES
(1, 'Fresh Tomatoes', 1, '0.25', 17562, 'The tomato is the edible berry of Solanum Lycopersicum, commonly known as the tomato plant. The species originated in western South America.', 2022, '1.png', 'Fresh-Tomatoes', 1),
(2, 'Fresh Onions', 1, '0.32', 15783, 'The onion, also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium. The shallot is a botanical variety of the onion which was classified as a separate species until 2010.', 2022, '2.png', 'Fresh-Onions', 0),
(3, 'Pre-Loved Clothing Bales', 2, '110.00', 93, 'We Collect 6000 Tons 100% A Grade: No Stain, No Torn, No Pilling, No Hole, No Over-Used, No Fade For You. 10 Years Experience. 3 Warehouses in Africa. With 20 Flow Lines.', 2013, '3.png', 'Pre-Loved-Clothing-Bales', 1),
(4, 'Pre-Loved Shoes', 2, '145.00', 129, 'Browse for great deals on wholesale second-hand shoes in bales on Alibaba.com. ... wholesale second-hand used soccer football shoes boots bales.', 2022, '4.png', 'Pre-Loved-Shoes', 1),
(5, 'Lenovo PC', 3, '1000.99', 8, 'Intel-NVIDA-Logitech', 2011, '5.png', 'Lenovo-PC', 0),
(6, 'Gold Detector', 3, '2300.00', 69, 'The device detects gold, buried treasure, precious metal, spaces & caves underground. The device reaches a depth of 45 meters in the ground &up to 2500 meters of the front range.', 2010, '6.png', 'Gold-Detector', 1),
(7, 'Jameson Irish Whisky', 4, '15.50', 12, 'Jameson is a blended Irish whiskey produced by the Irish Distillers subsidiary of Pernod Ricard. Originally one of the six main Dublin Whiskeys at the Jameson Distillery Bow St., Jameson is now distilled at the New Midleton Distillery in County Cork.', 1962, '7.png', 'Jameson-Irish-Whisky', 1),
(8, 'Redbull', 4, '1.05', 2201, 'Red Bull is a brand of energy drinks of Austrian company Red Bull GmbH. With a 38% market share, it is the most popular energy drink brand as of 2019. Since its launch in 1987, more than 100 billion cans of Red Bull have been sold worldwide, including 9.8', 1987, '8.png', 'Redbull', 1),
(9, 'Buggatti Veyron', 5, '945000.00', 2, 'The Bugatti Veyron EB 16.4 is a mid-engine sports car, designed and developed in France by the Volkswagen Group and Bugatti and manufactured in Molsheim.', 2015, '9.png', 'Buggatti-Veyron', 1),
(10, 'Honda-Fit', 5, '1.05', 2201, 'The Honda Fit or Honda Jazz is a small car manufactured and marketed by Honda since 2001 and is now in its fourth generation.', 1987, '10.png', 'Honda-Fit', 0),
(11, 'PPC Cement', 6, '10.50', 1781, 'Cement generally refers to a very fine powdery substance chiefly made up of limestone (calcium), sand or clay (silicon), bauxite (aluminium) and iron ore, and may include shells, chalk, marl, shale, clay, blast furnace slag, slate.', 2021, '11.png', 'PPC-Cement', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`Email`) VALUES
('');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(28) DEFAULT NULL,
  `Password` varchar(158) DEFAULT NULL,
  `Admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FullName`, `StreetAddress`, `PostCode`, `City`, `Country`, `Phone`, `Email`, `Username`, `Password`, `Admin`) VALUES
(1, 'Richard Gwewera', '54 George Road', '0263', 'Harare', 'Zimbabwe', '+26377203596', 'admin@gmail.com', 'admin', '$2a$10$mpJCYlSr762SwQVzdLwxR.KgRuWEHA2NzUanxxG/nxEStDRcRBbB6', 1),
(5, 'Kudakwashe William Rukuni', '7 Arlington Road, Logan Park, Hatfield', '0263', 'Harare', 'Zimbabwe', '+26378251626', 'krukuni@gmail.com', 'N1', '$2a$10$B2O.uzF1EQXU/QKlUe4w/.cwuee0S.i9TKZq0ws94R1Nau6kouNg6', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`AddressID`),
  ADD KEY `FK_Users_UserID` (`UserID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`),
  ADD KEY `CategoryName` (`CategoryName`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`MessageID`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`OrderID`,`ProductID`),
  ADD KEY `FK_Order_Details_Products` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `FK_Orders_Users` (`UserID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `FK_Products_Categories` (`CategoryID`),
  ADD KEY `ProductName` (`ProductName`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `MessageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_Users_UserID` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `FK_Order_Details_Orders` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Order_Details_Products` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Orders_Users` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_Products_Categories` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
