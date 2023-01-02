-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2023 at 07:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_verrukkulluk`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(12) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `price` int(12) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `quantity` int(12) DEFAULT NULL,
  `calories` int(12) DEFAULT NULL,
  `picture` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `name`, `description`, `price`, `unit`, `quantity`, `calories`, `picture`) VALUES
(1, 'tomaat', 'Een tomaat.', 40, 'stuks', 1, 17700, 'https://schoolfruit.nl/wp-content/uploads/2018/11/tomaat-los.jpg'),
(2, 'hamburger', 'Een stuk hamburger vlees.', 200, 'stuks', 4, 600000, 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/L/534551.png'),
(3, 'hamburger broodje', 'Een hamburger broodje.', 125, 'stuks', 6, 900000, 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/L/381721.png'),
(4, 'mayonaise', 'Een pot mayonaise.', 370, 'milliliter', 650, 5500000, 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/ML/929595.png'),
(5, 'kipburger', 'Een stuk kip in de vorm van een burger.', 250, 'stuks', 2, 450000, 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/ML/639652.png'),
(6, 'visburger', 'Een stuk vis in de vorm van een burger.', 300, 'stuks', 4, 800000, 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/ML/640816.png'),
(7, 'veganburger', 'Een vegetarische burger.', 100, 'stuks', 2, 300000, 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/L/911879.png');

-- --------------------------------------------------------

--
-- Table structure for table `grocery`
--

CREATE TABLE `grocery` (
  `id` int(12) NOT NULL,
  `user_id` int(12) DEFAULT NULL,
  `article_id` int(12) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grocery`
--

INSERT INTO `grocery` (`id`, `user_id`, `article_id`, `date_added`, `amount`) VALUES
(23, 1, 7, '2022-12-23 08:55:04', 8),
(24, 1, 3, '2022-12-23 08:55:04', 8),
(25, 1, 4, '2022-12-23 08:55:04', 8),
(26, 1, 6, '2022-12-30 14:46:00', 2),
(27, 1, 5, '2022-12-30 14:46:22', 4),
(28, 1, 2, '2022-12-30 14:46:30', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(12) NOT NULL,
  `recipe_id` int(12) DEFAULT NULL,
  `article_id` int(12) DEFAULT NULL,
  `quantity_used` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `recipe_id`, `article_id`, `quantity_used`) VALUES
(1, 1, 2, 4),
(2, 1, 3, 4),
(3, 1, 4, 100),
(4, 3, 5, 4),
(5, 3, 3, 4),
(6, 3, 4, 150),
(7, 2, 6, 4),
(8, 2, 3, 4),
(9, 2, 4, 80),
(10, 4, 7, 4),
(11, 4, 3, 4),
(12, 4, 4, 400);

-- --------------------------------------------------------

--
-- Table structure for table `kitchen_type`
--

CREATE TABLE `kitchen_type` (
  `id` int(12) NOT NULL,
  `record_type` varchar(1) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kitchen_type`
--

INSERT INTO `kitchen_type` (`id`, `record_type`, `description`) VALUES
(1, 'K', 'Italiaans'),
(2, 'K', 'Frans'),
(3, 'K', 'Belgisch'),
(4, 'K', 'Nederlands'),
(5, 'K', 'Spaans'),
(6, 'T', 'Vlees'),
(7, 'T', 'Vis'),
(8, 'T', 'Vegetarisch'),
(9, 'K', 'Duits');

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(12) NOT NULL,
  `kitchen_id` int(12) DEFAULT NULL,
  `type_id` int(12) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(30) DEFAULT NULL,
  `description_short` varchar(300) DEFAULT NULL,
  `description_long` varchar(3000) DEFAULT NULL,
  `picture` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `kitchen_id`, `type_id`, `user_id`, `date_added`, `title`, `description_short`, `description_long`, `picture`) VALUES
(1, 9, 6, 1, '2022-12-20 23:00:00', 'hamburger', 'Een lekkere hamburger.', 'Een heel lekkere hamburger.', 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/LW/r_pm0080.jpg'),
(2, 4, 7, 1, '2022-12-21 09:31:12', 'visburger', 'Een lekkere visburger.', 'Een heel lekkere visburger.', 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/LW/r_pm0271.jpg'),
(3, 4, 6, 1, '2022-12-21 09:31:12', 'kipburger', 'Een lekkere kipburger.', 'Een heel lekkere kipburger.', 'https://img.static-rmg.be/a/food/image/q75/w1280/h720/1084076/tandoori-kipburger.jpg'),
(4, 5, 8, 1, '2022-12-21 09:31:12', 'veganburger', 'Een lekkere veganburger.', 'Een heel lekkere veganburger.', 'https://www.plus.nl/INTERSHOP/static/WFS/PLUS-Site/-/PLUS/nl_NL/product/LW/r_kma00339.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_info`
--

CREATE TABLE `recipe_info` (
  `id` int(12) NOT NULL,
  `record_type` varchar(1) DEFAULT NULL,
  `recipe_id` int(12) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `field_number` int(12) DEFAULT NULL,
  `field_text` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_info`
--

INSERT INTO `recipe_info` (`id`, `record_type`, `recipe_id`, `user_id`, `date`, `field_number`, `field_text`) VALUES
(1, 'P', 1, NULL, '2022-12-20 23:00:00', 1, 'Bak de hamburgers.'),
(2, 'P', 1, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de hamburgers op de broodjes.'),
(3, 'P', 1, NULL, '2022-12-20 23:00:00', 3, 'Doe een schepje mayonaise op elk broodje en klaar is Kees.'),
(4, 'C', 1, 1, '2022-12-21 09:12:32', NULL, 'Lekkerste hamburger ooit gegeten!'),
(5, 'R', 1, NULL, '2022-12-21 09:16:26', 4, NULL),
(6, 'R', 1, NULL, '2022-12-21 09:16:26', 5, NULL),
(8, 'P', 3, NULL, '2022-12-20 23:00:00', 1, 'Bak de kipburgers.'),
(9, 'P', 3, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de kipburgers op de broodjes.'),
(10, 'P', 3, NULL, '2022-12-20 23:00:00', 3, 'Doe een schepje mayonaise op elk broodje en klaar is Kees.'),
(11, 'C', 3, 1, '2022-12-21 09:12:32', NULL, 'Lekkerste kipburger ooit gegeten!'),
(12, 'P', 2, NULL, '2022-12-20 23:00:00', 1, 'Bak de visburgers.'),
(13, 'P', 2, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de visburgers op de broodjes.'),
(14, 'P', 2, NULL, '2022-12-20 23:00:00', 3, 'Doe een schepje mayonaise op elk broodje en klaar is Kees.'),
(15, 'C', 2, 1, '2022-12-21 09:12:32', NULL, 'Lekkerste visburger ooit gegeten!'),
(16, 'P', 4, NULL, '2022-12-20 23:00:00', 1, 'Bak de veganburgers.'),
(17, 'P', 4, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de veganburgers op de broodjes.'),
(18, 'P', 4, NULL, '2022-12-20 23:00:00', 3, 'Doe een flinke schepje mayonaise op elk broodje en klaar is Kees.'),
(19, 'C', 4, 1, '2022-12-21 09:12:32', NULL, 'Die flinke klodder mayonaise maakte het nog enigszins te eten...'),
(20, 'R', 4, NULL, '2022-12-21 09:16:26', 2, NULL),
(21, 'R', 4, NULL, '2022-12-21 09:16:26', 3, NULL),
(247, 'R', 1, NULL, '2022-12-30 10:24:44', 4, NULL),
(388, 'R', 3, NULL, '2022-12-30 11:13:36', 5, NULL),
(390, 'R', 2, NULL, '2022-12-30 11:24:42', 4, NULL),
(415, 'R', 2, NULL, '2022-12-30 11:25:24', 3, NULL),
(423, 'F', 1, 1, '2022-12-30 13:03:55', NULL, NULL),
(426, 'R', 2, NULL, '2023-01-01 18:13:04', 1, NULL),
(427, 'R', 2, NULL, '2023-01-01 18:13:06', 5, NULL),
(428, 'R', 2, NULL, '2023-01-01 18:13:07', 5, NULL),
(429, 'R', 2, NULL, '2023-01-01 18:13:08', 5, NULL),
(430, 'R', 2, NULL, '2023-01-01 18:13:08', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `picture` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `picture`) VALUES
(1, 'Justin123', '1234', 'justin@trudeau.com', 'https://media.licdn.com/dms/image/C4E03AQGD-PJnXZmU8g/profile-displayphoto-shrink_800_800/0/1629053584973?e=2147483647&v=beta&t=FNFUVJ2bR7fV3a7zsgSD74d8VsV-Tg2hGzxrlTtEE0s');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grocery`
--
ALTER TABLE `grocery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shopping_ingredient_ibfk_1` (`article_id`),
  ADD KEY `shopping_ingredient_ibfk_2` (`user_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`article_id`),
  ADD KEY `ingredient_ibfk_2` (`recipe_id`);

--
-- Indexes for table `kitchen_type`
--
ALTER TABLE `kitchen_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_ibfk_1` (`user_id`),
  ADD KEY `gerecht_ibfk_2` (`kitchen_id`),
  ADD KEY `gerecht_ibfk_3` (`type_id`);

--
-- Indexes for table `recipe_info`
--
ALTER TABLE `recipe_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_info_ibfk_1` (`recipe_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `grocery`
--
ALTER TABLE `grocery`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `kitchen_type`
--
ALTER TABLE `kitchen_type`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipe_info`
--
ALTER TABLE `recipe_info`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=431;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grocery`
--
ALTER TABLE `grocery`
  ADD CONSTRAINT `shopping_ingredient_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `shopping_ingredient_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`kitchen_id`) REFERENCES `kitchen_type` (`id`),
  ADD CONSTRAINT `recipe_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `kitchen_type` (`id`);

--
-- Constraints for table `recipe_info`
--
ALTER TABLE `recipe_info`
  ADD CONSTRAINT `recipe_info_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
