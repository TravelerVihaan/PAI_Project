-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Cze 2018, 13:41
-- Wersja serwera: 10.1.31-MariaDB
-- Wersja PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bstage`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `event`
--

CREATE TABLE `event` (
  `id_event` int(4) NOT NULL,
  `ename` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `date` date NOT NULL,
  `add_date` date NOT NULL,
  `location` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `desription` varchar(350) COLLATE utf8_polish_ci NOT NULL,
  `id_whoadd` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `format`
--

CREATE TABLE `format` (
  `id_format` int(4) NOT NULL,
  `ftype` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(4) NOT NULL,
  `gname` varchar(25) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `music`
--

CREATE TABLE `music` (
  `id_music` int(4) NOT NULL,
  `title` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `year` int(4) NOT NULL,
  `add_date` date NOT NULL,
  `performer` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `id_format` int(4) NOT NULL,
  `id_genre` int(4) NOT NULL,
  `id_whoadd` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `role`
--

CREATE TABLE `role` (
  `id_role` int(5) NOT NULL,
  `rola` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_user` int(4) NOT NULL,
  `username` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(35) COLLATE utf8_polish_ci NOT NULL,
  `created_at` date NOT NULL,
  `last_login` date NOT NULL,
  `id_role` int(5) NOT NULL,
  `id_userdet` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_details`
--

CREATE TABLE `user_details` (
  `id_userdet` int(5) NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_whoadd` (`id_whoadd`);

--
-- Indeksy dla tabeli `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`id_format`);

--
-- Indeksy dla tabeli `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indeksy dla tabeli `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id_music`),
  ADD KEY `id_format` (`id_format`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_whoadd` (`id_whoadd`);

--
-- Indeksy dla tabeli `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`),
  ADD UNIQUE KEY `rola` (`rola`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD KEY `id_role` (`id_role`),
  ADD KEY `id_userdet` (`id_userdet`);

--
-- Indeksy dla tabeli `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id_userdet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `format`
--
ALTER TABLE `format`
  MODIFY `id_format` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `music`
--
ALTER TABLE `music`
  MODIFY `id_music` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id_userdet` int(5) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`id_whoadd`) REFERENCES `user` (`id_user`);

--
-- Ograniczenia dla tabeli `music`
--
ALTER TABLE `music`
  ADD CONSTRAINT `music_ibfk_1` FOREIGN KEY (`id_format`) REFERENCES `format` (`id_format`),
  ADD CONSTRAINT `music_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`),
  ADD CONSTRAINT `music_ibfk_3` FOREIGN KEY (`id_whoadd`) REFERENCES `user` (`id_user`);

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_userdet`) REFERENCES `user_details` (`id_userdet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
