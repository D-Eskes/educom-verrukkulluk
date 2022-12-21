-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 21 dec 2022 om 09:01
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.1.12

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
-- Tabelstructuur voor tabel `artikel`
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
-- Gegevens worden geëxporteerd voor tabel `artikel`
--

INSERT INTO `artikel` (`id`, `naam`, `omschrijving`, `prijs`, `eenheid`, `verpakking`, `calorie`) VALUES
(1, 'tomaat', 'Gekweekt met liefde.', 40, 'stuks', 1, 17700);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht`
--

CREATE TABLE `gerecht` (
  `id` int(12) NOT NULL,
  `keuken_id` int(12) DEFAULT NULL,
  `type_id` int(12) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `datum_toegevoegd` date NOT NULL DEFAULT current_timestamp(),
  `titel` varchar(30) NOT NULL,
  `korte_omschrijving` varchar(300) NOT NULL,
  `lange_omschrijving` varchar(3000) NOT NULL,
  `afbeelding` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht_info`
--

CREATE TABLE `gerecht_info` (
  `id` int(12) NOT NULL,
  `record_type` varchar(1) DEFAULT NULL,
  `gerecht_id` int(12) DEFAULT NULL,
  `user_id` int(12) DEFAULT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp(),
  `nummeriekveld` int(12) DEFAULT NULL,
  `tekstveld` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(12) NOT NULL,
  `gerecht_id` int(12) DEFAULT NULL,
  `artikel_id` int(12) DEFAULT NULL,
  `aantal` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `keuken_type`
--

CREATE TABLE `keuken_type` (
  `id` int(12) NOT NULL,
  `record_type` varchar(1) DEFAULT NULL,
  `omschrijving` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `keuken_type`
--

INSERT INTO `keuken_type` (`id`, `record_type`, `omschrijving`) VALUES
(1, 'K', 'Italiaans'),
(2, 'K', 'Frans'),
(3, 'K', 'Belgisch'),
(4, 'K', 'Nederlands'),
(5, 'K', 'Spaans');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `afbeelding` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_ibfk_1` (`user_id`),
  ADD KEY `gerecht_ibfk_2` (`keuken_id`),
  ADD KEY `gerecht_ibfk_3` (`type_id`);

--
-- Indexen voor tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_info_ibfk_1` (`gerecht_id`);

--
-- Indexen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`);

--
-- Indexen voor tabel `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `gerecht_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_2` FOREIGN KEY (`keuken_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `gerecht_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `keuken_type` (`id`);

--
-- Beperkingen voor tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD CONSTRAINT `gerecht_info_ibfk_1` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);

--
-- Beperkingen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
