-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Kwi 2023, 10:02
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ztm`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autobusy`
--

CREATE TABLE `autobusy` (
  `ID_a` int(11) NOT NULL,
  `Marka` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Długosc` tinyint(2) NOT NULL,
  `Numer` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `autobusy`
--

INSERT INTO `autobusy` (`ID_a`, `Marka`, `Długosc`, `Numer`) VALUES
(1, 'Solaris', 12, 2665),
(2, 'Solaris', 15, 2248),
(3, 'Solaris', 18, 2487);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bilety`
--

CREATE TABLE `bilety` (
  `ID_b` int(11) NOT NULL,
  `czas` time NOT NULL,
  `cena` tinyint(2) NOT NULL,
  `ulga` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `bilety`
--

INSERT INTO `bilety` (`ID_b`, `czas`, `cena`, `ulga`) VALUES
(1, '00:20:00', 2, 1),
(2, '00:40:00', 3, 1),
(3, '01:30:00', 4, 1),
(4, '00:20:00', 5, 0),
(5, '00:40:00', 7, 0),
(6, '01:30:00', 9, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kierowcy`
--

CREATE TABLE `kierowcy` (
  `ID_k` int(11) NOT NULL,
  `Imie` varchar(25) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(25) COLLATE utf8_polish_ci NOT NULL,
  `identyfikator` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `kierowcy`
--

INSERT INTO `kierowcy` (`ID_k`, `Imie`, `Nazwisko`, `identyfikator`) VALUES
(1, 'Mięczysław', 'Wałsyzcęim', 4206),
(2, 'Wojtek', 'Sokół', 2137),
(3, 'Mój', 'Stary', 6969);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `ID_kl` int(11) NOT NULL,
  `imie` varchar(25) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(25) COLLATE utf8_polish_ci NOT NULL,
  `wiek` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Klientów do bazy nalerzy dodać przez formularz

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `linie`
--

CREATE TABLE `linie` (
  `ID_l` int(11) NOT NULL,
  `numer_l` int(11) NOT NULL,
  `ID_kierowcy` int(11) NOT NULL,
  `ID_autobusu` int(11) NOT NULL,
  `ID_trasy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `linie`
--

INSERT INTO `linie` (`ID_l`, `numer_l`, `ID_kierowcy`, `ID_autobusu`, `ID_trasy`) VALUES
(1, 14, 1, 2, 2),
(2, 48, 2, 3, 3),
(3, 111, 3, 1, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przejazdy`
--

CREATE TABLE `przejazdy` (
  `ID_p` int(11) NOT NULL,
  `ID_klienta` int(11) NOT NULL,
  `ID_biletu` int(11) NOT NULL,
  `ID_lini` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- Dane przejazdów nalerzy dodać do bazy przez formularz

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trasy`
--

CREATE TABLE `trasy` (
  `ID_t` int(11) NOT NULL,
  `p_poczatkowy` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `p_koncowy` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `p_ilosc` smallint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `trasy`
--

INSERT INTO `trasy` (`ID_t`, `p_poczatkowy`, `p_koncowy`, `p_ilosc`) VALUES
(1, 'Zadupie Małe', 'Zadupie Wielkie', 11),
(2, 'Łącza Początek', 'Łącza Koniec', 3),
(3, 'Wydupice Centum', 'Wydupice COP', 21);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `autobusy`
--
ALTER TABLE `autobusy`
  ADD PRIMARY KEY (`ID_a`);

--
-- Indeksy dla tabeli `bilety`
--
ALTER TABLE `bilety`
  ADD PRIMARY KEY (`ID_b`);

--
-- Indeksy dla tabeli `kierowcy`
--
ALTER TABLE `kierowcy`
  ADD PRIMARY KEY (`ID_k`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`ID_kl`);

--
-- Indeksy dla tabeli `linie`
--
ALTER TABLE `linie`
  ADD PRIMARY KEY (`ID_l`),
  ADD KEY `ID_k` (`ID_kierowcy`),
  ADD KEY `ID_a` (`ID_autobysu`),
  ADD KEY `ID_t` (`ID_trasy`);

--
-- Indeksy dla tabeli `przejazdy`
--
ALTER TABLE `przejazdy`
  ADD PRIMARY KEY (`ID_p`),
  ADD KEY `ID_kl` (`ID_klienta`),
  ADD KEY `ID_b` (`ID_biletu`),
  ADD KEY `ID_l` (`ID_lini`);

--
-- Indeksy dla tabeli `trasy`
--
ALTER TABLE `trasy`
  ADD PRIMARY KEY (`ID_t`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `autobusy`
--
ALTER TABLE `autobusy`
  MODIFY `ID_a` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT dla tabeli `bilety`
--
ALTER TABLE `bilety`
  MODIFY `ID_b` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT dla tabeli `kierowcy`
--
ALTER TABLE `kierowcy`
  MODIFY `ID_k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `ID_kl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT dla tabeli `linie`
--
ALTER TABLE `linie`
  MODIFY `ID_l` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT dla tabeli `przejazdy`
--
ALTER TABLE `przejazdy`
  MODIFY `ID_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

--
-- AUTO_INCREMENT dla tabeli `trasy`
--
ALTER TABLE `trasy`
  MODIFY `ID_t` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
