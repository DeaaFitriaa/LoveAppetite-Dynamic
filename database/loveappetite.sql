-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2022 at 06:07 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loveappetite`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Description`) VALUES
(1, 'Tasty Burger', 'Delicious Burger with high quality meat,bun,veggies.'),
(2, 'Tasty Pizza', 'A Dish Typically Of Flanttened Bread Dough Spread With A Savory Mixture Usually Including Tomatoes And Cheese And Often Other Toppings And Baked.'),
(3, 'Cold Ice-Cream', 'A Rich, Sweet, Creamy Frozen Food Made From Variously Flavored Cream And Milk Products Churned Or Stirred To A Smooth Consistency During The Freezing Process And Often Containing Gelatin, Eggs, Fruits, Nuts, Etc.'),
(4, 'Cold/Hot Drinks', 'Cold/Hot Drinks Served With Love With Attractive Appearance And Taste.'),
(5, 'Tasty Sweets', 'So Sweet Is That Sugary Flavor That You Have In Your Mouth When You Eat Something That Has, Natural Sweet  Flavors I Guess.');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `ID` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`ID`, `Name`) VALUES
(1, 'Gopay'),
(2, 'Shopeepay'),
(3, 'OVO'),
(4, 'BRIVA'),
(5, 'BCA Virtual Account'),
(6, 'BNI Virtual Account'),
(7, 'DANA'),
(8, 'Cash On Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ID`, `Name`, `Description`, `CategoryID`) VALUES
(1, 'Japanese Curry Burger', 'Japanese Curry Burger Best seller', 1),
(2, 'M.C Burger', 'M.C Burger Krapow', 1),
(3, 'Danish', 'Danish Hotdogs', 1),
(4, 'Kraut Seattle', 'Kraut Seattle Hotdogs', 1),
(5, 'Meatzza Carbonara', 'Meatzza Carbonara Cheesy Bites', 2),
(6, 'Cheesy Galore', 'Cheesy Galore Stuffed Crust', 2),
(7, 'Veggie Garden', 'Veggie Garden Sausage Crust', 2),
(8, 'Hawaiian Chicken', 'Hawaiian Chicken Pizza Original', 2),
(9, 'Classic Vanilla', 'Classic Vanilla Gelato', 3),
(10, 'Limoncello', 'Limoncello Gelato', 3),
(11, 'Strawberry Cheese', 'Strawberry Cheese Gelato', 3),
(12, 'Chocolate', 'Chocolate Gelato', 3),
(13, 'Cappuccino', 'Cappuccino Cold/Hot', 4),
(14, 'Latte', 'Latte Cold/Hot', 4),
(15, 'Smoothie', 'Smoothie Manggo', 4),
(16, 'Tea', 'Tea Cold/Hot', 4),
(17, 'Choc Almond', 'Choc Almond Donuts', 5),
(18, 'Black Forest', 'Black Forest Brownies', 5),
(19, 'Oreo Buterscotch', 'Oreo Buterscotch Donuts', 5),
(20, 'Cookies Monster', 'Cookies Monster Cupcake', 5);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `ID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `PaymentID` int(11) NOT NULL,
  `Paid` tinyint(1) NOT NULL DEFAULT 0,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`ID`, `ProductID`, `UserID`, `Name`, `Email`, `PhoneNumber`, `Address`, `PaymentID`, `Paid`, `Timestamp`) VALUES
(1, 1, 1, 'Admin', 'admin@gmail.com', 123456789, 'Vila Dago Blok H3/19 RT 002/RW 022 Benda Baru, Pamulang', 4, 1, '2022-07-13 14:01:34'),
(2, 3, NULL, 'Deyya', 'dea@gmail.com', 123456789, 'Cinangka', 2, 1, '2022-07-13 14:14:44'),
(3, 8, 1, NULL, NULL, NULL, NULL, 1, 1, '2022-07-13 15:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Password` varchar(32) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `PhoneNumber` bigint(20) NOT NULL,
  `Address` varchar(1028) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Email`, `Password`, `Name`, `PhoneNumber`, `Address`) VALUES
(1, 'admin@gmail.com', '321', 'Admin', 123456789, 'UIN Regency'),
(2, 'secret@gmail.com', '123', 'Secret', 9876546231, 'Vila Dago Blok H3/19 RT 002/RW 022 Benda Baru, Pamulang');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`ID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `users` (`ID`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`PaymentID`) REFERENCES `payments` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
