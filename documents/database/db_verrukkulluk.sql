-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 10:48 AM
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
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int(12) NOT NULL,
  `naam` varchar(30) DEFAULT NULL,
  `omschrijving` varchar(300) DEFAULT NULL,
  `prijs` int(12) DEFAULT NULL,
  `eenheid` varchar(30) DEFAULT NULL,
  `verpakking` int(12) DEFAULT NULL,
  `calorie` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `naam`, `omschrijving`, `prijs`, `eenheid`, `verpakking`, `calorie`) VALUES
(1, 'tomaat', 'Een tomaat', 40, 'stuks', 1, 17700),
(2, 'hamburger', 'Een stuk hamburger vlees ', 200, 'stuks', 1, 300000),
(3, 'hamburger broodje', 'Een hamburger broodje', 125, 'stuks', 4, 600000),
(4, 'mayonaise', 'Een pot mayonaise', 370, 'milliliter', 750, 5500000),
(5, 'kipburger', 'Een stuk kip in de vorm van een burger', 250, 'stuks', 2, 450000),
(6, 'visburger', 'Een stuk vis in de vorm van een burger', 300, 'stuks', 2, 400000),
(7, 'veganburger', 'Een vegetarische burger', 100, 'stuks', 1, 150000);

-- --------------------------------------------------------

--
-- Table structure for table `gerecht`
--

CREATE TABLE `gerecht` (
  `id` int(12) NOT NULL,
  `keuken_id` int(12) DEFAULT NULL,
  `type_id` int(12) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `datum_toegevoegd` timestamp NOT NULL DEFAULT current_timestamp(),
  `titel` varchar(30) NOT NULL,
  `korte_omschrijving` varchar(300) NOT NULL,
  `lange_omschrijving` varchar(3000) NOT NULL,
  `afbeelding` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gerecht`
--

INSERT INTO `gerecht` (`id`, `keuken_id`, `type_id`, `user_id`, `datum_toegevoegd`, `titel`, `korte_omschrijving`, `lange_omschrijving`, `afbeelding`) VALUES
(1, 9, 6, 1, '2022-12-20 23:00:00', 'hamburger', 'Een lekkere hamburger.', 'Een heel lekkere hamburger.', ''),
(2, 4, 7, 1, '2022-12-21 09:31:12', 'visburger', 'Een lekkere visburger.', 'Een heel lekkere visburger.', ''),
(3, 4, 6, 1, '2022-12-21 09:31:12', 'kipburger', 'Een lekkere kipburger.', 'Een heel lekkere kipburger.', ''),
(4, 5, 8, 1, '2022-12-21 09:31:12', 'veganburger', 'Een lekkere veganburger.', 'Een heel lekkere veganburger.', '');

-- --------------------------------------------------------

--
-- Table structure for table `gerecht_info`
--

CREATE TABLE `gerecht_info` (
  `id` int(12) NOT NULL,
  `record_type` varchar(1) DEFAULT NULL,
  `gerecht_id` int(12) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `datum` timestamp NOT NULL DEFAULT current_timestamp(),
  `nummeriekveld` int(12) DEFAULT NULL,
  `tekstveld` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gerecht_info`
--

INSERT INTO `gerecht_info` (`id`, `record_type`, `gerecht_id`, `user_id`, `datum`, `nummeriekveld`, `tekstveld`) VALUES
(1, 'B', 1, NULL, '2022-12-20 23:00:00', 1, 'Bak de hamburgers'),
(2, 'B', 1, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de hamburgers op de broodjes'),
(3, 'B', 1, NULL, '2022-12-20 23:00:00', 3, 'Doe een schepje mayonaise op elk broodje en klaar is Kees'),
(4, 'O', 1, 1, '2022-12-21 09:12:32', NULL, 'Lekkerste hamburger ooit gegeten!'),
(5, 'W', 1, NULL, '2022-12-21 09:16:26', 4, NULL),
(6, 'W', 1, NULL, '2022-12-21 09:16:26', 5, NULL),
(7, 'F', 1, 1, '2022-12-21 09:17:59', NULL, NULL),
(8, 'B', 3, NULL, '2022-12-20 23:00:00', 1, 'Bak de kipburgers'),
(9, 'B', 3, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de kipburgers op de broodjes'),
(10, 'B', 3, NULL, '2022-12-20 23:00:00', 3, 'Doe een schepje mayonaise op elk broodje en klaar is Kees'),
(11, 'O', 3, 1, '2022-12-21 09:12:32', NULL, 'Lekkerste kipburger ooit gegeten!'),
(12, 'B', 2, NULL, '2022-12-20 23:00:00', 1, 'Bak de visburgers'),
(13, 'B', 2, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de visburgers op de broodjes'),
(14, 'B', 2, NULL, '2022-12-20 23:00:00', 3, 'Doe een schepje mayonaise op elk broodje en klaar is Kees'),
(15, 'O', 2, 1, '2022-12-21 09:12:32', NULL, 'Lekkerste visburger ooit gegeten!'),
(16, 'B', 4, NULL, '2022-12-20 23:00:00', 1, 'Bak de veganburgers'),
(17, 'B', 4, NULL, '2022-12-20 23:00:00', 2, 'Snij de broodjes en plaats de veganburgers op de broodjes'),
(18, 'B', 4, NULL, '2022-12-20 23:00:00', 3, 'Doe een flinke schepje mayonaise op elk broodje en klaar is Kees'),
(19, 'O', 4, 1, '2022-12-21 09:12:32', NULL, 'Die flinke klodder mayonaise maakte het nog enigszins te eten...'),
(20, 'W', 4, NULL, '2022-12-21 09:16:26', 2, NULL),
(21, 'W', 4, NULL, '2022-12-21 09:16:26', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(12) NOT NULL,
  `gerecht_id` int(12) DEFAULT NULL,
  `artikel_id` int(12) DEFAULT NULL,
  `aantal` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `gerecht_id`, `artikel_id`, `aantal`) VALUES
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
-- Table structure for table `keuken_type`
--

CREATE TABLE `keuken_type` (
  `id` int(12) NOT NULL,
  `record_type` varchar(1) DEFAULT NULL,
  `omschrijving` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keuken_type`
--

INSERT INTO `keuken_type` (`id`, `record_type`, `omschrijving`) VALUES
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `afbeelding` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `afbeelding`) VALUES
(1, 'DaanEskes', '1234', 'daaneskes57@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_ibfk_1` (`user_id`),
  ADD KEY `gerecht_ibfk_2` (`keuken_id`),
  ADD KEY `gerecht_ibfk_3` (`type_id`);

--
-- Indexes for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_info_ibfk_1` (`gerecht_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`),
  ADD KEY `ingredient_ibfk_2` (`gerecht_id`);

--
-- Indexes for table `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `gerecht_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_2` FOREIGN KEY (`keuken_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `keuken_type` (`id`);

--
-- Constraints for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD CONSTRAINT `gerecht_info_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
