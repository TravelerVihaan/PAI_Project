-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Cze 2018, 21:19
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

--
-- Zrzut danych tabeli `format`
--

INSERT INTO `format` (`id_format`, `ftype`) VALUES
(1, 'CD'),
(2, 'Vinyl'),
(3, 'Digital');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(4) NOT NULL,
  `gname` varchar(25) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `genre`
--

INSERT INTO `genre` (`id_genre`, `gname`) VALUES
(1, 'Reggae'),
(2, 'Roots'),
(3, 'Dub'),
(4, 'Bass Music'),
(5, 'Jungle');

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

--
-- Zrzut danych tabeli `role`
--

INSERT INTO `role` (`id_role`, `rola`) VALUES
(1, 'Administrator'),
(2, 'User');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_user` int(4) NOT NULL,
  `username` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_polish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `id_role` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `name`, `surname`, `email`, `id_role`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Luk', 'Biel', 'lukbiel@luk.pl', 1),
(2, 'uzytkownik', '70bb9e0b4a07e8ee00274d2fdd59403b', 'us', 'er', 'us@er.pl', 1),
(3, 'uzytkownik2', '70bb9e0b4a07e8ee00274d2fdd59403b', 'abcd', 'abcd', 'us@er2.pl', 2);

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
  ADD KEY `id_role` (`id_role`);

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
  MODIFY `id_format` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `music`
--
ALTER TABLE `music`
  MODIFY `id_music` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
