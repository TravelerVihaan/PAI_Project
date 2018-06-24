-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Cze 2018, 18:49
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
  `description` varchar(350) COLLATE utf8_polish_ci NOT NULL,
  `id_whoadd` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `event`
--

INSERT INTO `event` (`id_event`, `ename`, `date`, `add_date`, `location`, `description`, `id_whoadd`) VALUES
(1, 'Dub Temple #106', '2018-07-21', '2018-06-20', 'Krakow', 'Kolejna edycja slynnego cyklu imprez Dub Temple. Steppa Warriors SoundSystem', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `eventq`
--

CREATE TABLE `eventq` (
  `id_event` int(4) NOT NULL,
  `ename` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `date` date NOT NULL,
  `add_date` date NOT NULL,
  `location` varchar(40) COLLATE utf8_polish_ci NOT NULL,
  `description` varchar(350) COLLATE utf8_polish_ci NOT NULL,
  `id_whoadd` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `eventq`
--

INSERT INTO `eventq` (`id_event`, `ename`, `date`, `add_date`, `location`, `description`, `id_whoadd`) VALUES
(1, 'aaaaaa', '0000-00-00', '0000-00-00', 'bbbbbbb', '', 2),
(2, 'qeqeqeqe', '2018-06-12', '0000-00-00', 'qeqeqweqe', 'qweqweqweqwewqeqwe', 2),
(3, 'ssfsfsfsfs', '2018-06-06', '2018-06-24', 'eeeeeeeeeee', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 2);

--
-- Wyzwalacze `eventq`
--
DELIMITER $$
CREATE TRIGGER `eventdatetrigger` BEFORE INSERT ON `eventq` FOR EACH ROW BEGIN
    SET NEW.add_date= CURDATE();
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `eventy`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `eventy` (
`ename` varchar(40)
,`date` date
,`location` varchar(40)
,`description` varchar(350)
,`username` varchar(30)
);

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

--
-- Zrzut danych tabeli `music`
--

INSERT INTO `music` (`id_music`, `title`, `year`, `add_date`, `performer`, `id_format`, `id_genre`, `id_whoadd`) VALUES
(1, 'Babylon is falling', 2018, '2018-06-20', 'OBF', 2, 3, 1),
(2, 'Vanity', 2018, '2018-06-20', 'King Alpha', 2, 3, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `musicq`
--

CREATE TABLE `musicq` (
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
-- Zastąpiona struktura widoku `muzyka`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `muzyka` (
`performer` varchar(40)
,`title` varchar(40)
,`year` int(4)
,`ftype` varchar(20)
,`gname` varchar(25)
);

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
(2, 'uzytkownik', '70bb9e0b4a07e8ee00274d2fdd59403b', 'us', 'er', 'us@er.pl', 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `uzytkownicy`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `uzytkownicy` (
`username` varchar(30)
,`name` varchar(50)
,`surname` varchar(50)
,`email` varchar(50)
,`rola` varchar(20)
);

-- --------------------------------------------------------

--
-- Struktura widoku `eventy`
--
DROP TABLE IF EXISTS `eventy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eventy`  AS  select `event`.`ename` AS `ename`,`event`.`date` AS `date`,`event`.`location` AS `location`,`event`.`description` AS `description`,`user`.`username` AS `username` from (`event` join `user` on((`event`.`id_whoadd` = `user`.`id_user`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `muzyka`
--
DROP TABLE IF EXISTS `muzyka`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `muzyka`  AS  select `music`.`performer` AS `performer`,`music`.`title` AS `title`,`music`.`year` AS `year`,`format`.`ftype` AS `ftype`,`genre`.`gname` AS `gname` from ((`music` join `genre` on((`music`.`id_genre` = `genre`.`id_genre`))) join `format` on((`music`.`id_format` = `format`.`id_format`))) ;

-- --------------------------------------------------------

--
-- Struktura widoku `uzytkownicy`
--
DROP TABLE IF EXISTS `uzytkownicy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `uzytkownicy`  AS  select `user`.`username` AS `username`,`user`.`name` AS `name`,`user`.`surname` AS `surname`,`user`.`email` AS `email`,`role`.`rola` AS `rola` from (`user` join `role` on((`user`.`id_role` = `role`.`id_role`))) ;

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
-- Indeksy dla tabeli `eventq`
--
ALTER TABLE `eventq`
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
-- Indeksy dla tabeli `musicq`
--
ALTER TABLE `musicq`
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
  MODIFY `id_event` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `eventq`
--
ALTER TABLE `eventq`
  MODIFY `id_event` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id_music` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `musicq`
--
ALTER TABLE `musicq`
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
  MODIFY `id_user` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
