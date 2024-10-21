-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 02:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sd3a-backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `biddings`
--

CREATE TABLE `biddings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `bid` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('house','apartment') NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext DEFAULT NULL,
  `m2` int(10) UNSIGNED NOT NULL,
  `bedrooms` int(10) UNSIGNED NOT NULL,
  `bathrooms` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `user_id`, `type`, `availability`, `address`, `city`, `state`, `zip`, `price`, `description`, `m2`, `bedrooms`, `bathrooms`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'apartment', 0, 'Keizersgracht 202', 'Amsterdam', 'NH', '1016 DW', 187500.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/003344?text=apartment1', '2024-01-12 13:22:30', '2024-01-12 13:22:30'),
(2, 2, 'house', 1, 'Van Woustraat 118', 'Amsterdam', 'NH', '1074 AC', 450000.00, 'Very cool desc', 120, 3, 2, 'https://via.placeholder.com/640x480.png/006666?text=house1', '2023-05-18 07:15:47', '2023-05-18 07:15:47'),
(3, 3, 'apartment', 1, 'Brouwersgracht 33', 'Amsterdam', 'NH', '1015 GD', 295000.00, 'Very cool desc', 85, 2, 1, 'https://via.placeholder.com/640x480.png/002255?text=apartment2', '2024-07-04 08:44:50', '2024-07-04 08:44:50'),
(4, 4, 'house', 1, 'Vondelpark 20', 'Amsterdam', 'NH', '1071 AA', 980000.00, 'Very cool desc', 150, 4, 3, 'https://via.placeholder.com/640x480.png/00cc33?text=house2', '2023-12-10 11:00:00', '2023-12-10 11:00:00'),
(5, 1, 'house', 1, 'Zuidweg 145', 'Utrecht', 'UT', '3581 DA', 265000.00, 'Very cool desc', 110, 3, 2, 'https://via.placeholder.com/640x480.png/002299?text=house3', '2024-03-22 07:30:15', '2024-03-22 07:30:15'),
(6, 2, 'apartment', 0, 'Westerstraat 58', 'Utrecht', 'UT', '3513 BD', 180000.00, 'Very cool desc', 70, 2, 1, 'https://via.placeholder.com/640x480.png/0088bb?text=apartment3', '2024-04-15 09:45:00', '2024-04-15 09:45:00'),
(7, 3, 'apartment', 1, 'Amsterdamsestraatweg 64', 'Utrecht', 'UT', '3513 BD', 230000.00, 'Very cool desc', 80, 2, 1, 'https://via.placeholder.com/640x480.png/002288?text=apartment4', '2023-06-17 12:14:14', '2023-06-17 12:14:14'),
(8, 1, 'apartment', 0, 'Keizersgracht 202', 'Amsterdam', 'NH', '1016 DW', 187500.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/003344?text=apartment1', '2024-01-12 13:22:30', '2024-01-12 13:22:30'),
(9, 2, 'house', 1, 'Van Woustraat 118', 'Amsterdam', 'NH', '1074 AC', 450000.00, 'Very cool desc', 120, 3, 2, 'https://via.placeholder.com/640x480.png/006666?text=house1', '2023-05-18 07:15:47', '2023-05-18 07:15:47'),
(10, 3, 'apartment', 1, 'Brouwersgracht 33', 'Amsterdam', 'NH', '1015 GD', 295000.00, 'Very cool desc', 85, 2, 1, 'https://via.placeholder.com/640x480.png/002255?text=apartment2', '2024-07-04 08:44:50', '2024-07-04 08:44:50'),
(11, 4, 'house', 1, 'Vondelpark 20', 'Amsterdam', 'NH', '1071 AA', 980000.00, 'Very cool desc', 150, 4, 3, 'https://via.placeholder.com/640x480.png/00cc33?text=house2', '2023-12-10 11:00:00', '2023-12-10 11:00:00'),
(12, 1, 'house', 1, 'Zuidweg 145', 'Utrecht', 'UT', '3581 DA', 265000.00, 'Very cool desc', 110, 3, 2, 'https://via.placeholder.com/640x480.png/002299?text=house3', '2024-03-22 07:30:15', '2024-03-22 07:30:15'),
(13, 2, 'apartment', 0, 'Westerstraat 58', 'Utrecht', 'UT', '3513 BD', 180000.00, 'Very cool desc', 70, 2, 1, 'https://via.placeholder.com/640x480.png/0088bb?text=apartment3', '2024-04-15 09:45:00', '2024-04-15 09:45:00'),
(14, 3, 'apartment', 1, 'Amsterdamsestraatweg 64', 'Utrecht', 'UT', '3513 BD', 230000.00, 'Very cool desc', 80, 2, 1, 'https://via.placeholder.com/640x480.png/002288?text=apartment4', '2023-06-17 12:14:14', '2023-06-17 12:14:14'),
(15, 4, 'house', 1, 'Herengracht 22', 'Amsterdam', 'NH', '1015 BS', 550000.00, 'Very cool desc', 95, 3, 1, 'https://via.placeholder.com/640x480.png/005577?text=house4', '2023-08-30 14:30:00', '2023-08-30 14:30:00'),
(16, 1, 'apartment', 1, 'Javastraat 15', 'Amsterdam', 'NH', '1094 HK', 350000.00, 'Very cool desc', 60, 1, 1, 'https://via.placeholder.com/640x480.png/123456?text=apartment5', '2024-02-20 11:00:00', '2024-02-20 11:00:00'),
(17, 2, 'house', 1, 'Westerstraat 2', 'Amsterdam', 'NH', '1015 NL', 450000.00, 'Very cool desc', 130, 4, 2, 'https://via.placeholder.com/640x480.png/654321?text=house5', '2024-03-01 09:15:30', '2024-03-01 09:15:30'),
(18, 3, 'apartment', 1, 'Leliegracht 55', 'Amsterdam', 'NH', '1015 DH', 320000.00, 'Very cool desc', 80, 2, 1, 'https://via.placeholder.com/640x480.png/222222?text=apartment6', '2024-05-10 07:30:00', '2024-05-10 07:30:00'),
(19, 4, 'house', 1, 'Kinkerstraat 70', 'Amsterdam', 'NH', '1053 DZ', 590000.00, 'Very cool desc', 140, 4, 3, 'https://via.placeholder.com/640x480.png/777777?text=house6', '2024-06-15 09:00:00', '2024-06-15 09:00:00'),
(20, 1, 'apartment', 0, 'Singel 12', 'Amsterdam', 'NH', '1012 WX', 250000.00, 'Very cool desc', 55, 1, 1, 'https://via.placeholder.com/640x480.png/888888?text=apartment7', '2024-07-22 12:45:00', '2024-07-22 12:45:00'),
(22, 3, 'apartment', 1, 'Herengracht 85', 'Amsterdam', 'NH', '1016 EA', 650000.00, 'Very cool desc', 100, 2, 1, 'https://via.placeholder.com/640x480.png/101010?text=apartment8', '2024-09-05 09:30:00', '2024-09-05 09:30:00'),
(23, 4, 'house', 1, 'Pijp 78', 'Amsterdam', 'NH', '1072 BS', 890000.00, 'Very cool desc', 180, 4, 3, 'https://via.placeholder.com/640x480.png/202020?text=house8', '2024-10-01 08:15:00', '2024-10-01 08:15:00'),
(24, 1, 'apartment', 1, 'Damstraat 20', 'Amsterdam', 'NH', '1012 WX', 320000.00, 'Very cool desc', 90, 2, 1, 'https://via.placeholder.com/640x480.png/303030?text=apartment9', '2024-10-05 12:45:00', '2024-10-05 12:45:00'),
(25, 2, 'house', 1, 'NDSM 5', 'Amsterdam', 'NH', '1033 WC', 720000.00, 'Very cool desc', 145, 4, 2, 'https://via.placeholder.com/640x480.png/404040?text=house9', '2024-10-10 07:15:00', '2024-10-10 07:15:00'),
(26, 3, 'apartment', 0, 'Leidseplein 10', 'Amsterdam', 'NH', '1017 PT', 290000.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/505050?text=apartment10', '2024-10-12 10:00:00', '2024-10-12 10:00:00'),
(27, 4, 'house', 1, 'Damstraat 5', 'Amsterdam', 'NH', '1012 WX', 550000.00, 'Very cool desc', 130, 3, 2, 'https://via.placeholder.com/640x480.png/606060?text=house10', '2024-10-15 08:00:00', '2024-10-15 08:00:00'),
(28, 1, 'apartment', 1, 'Amstel 2', 'Amsterdam', 'NH', '1017 AB', 300000.00, 'Very cool desc', 65, 2, 1, 'https://via.placeholder.com/640x480.png/707070?text=apartment11', '2024-10-20 12:45:00', '2024-10-20 12:45:00'),
(29, 2, 'house', 1, 'Zeedijk 3', 'Amsterdam', 'NH', '1012 AW', 850000.00, 'Very cool desc', 160, 4, 2, 'https://via.placeholder.com/640x480.png/808080?text=house11', '2024-10-25 06:30:00', '2024-10-25 06:30:00'),
(30, 3, 'apartment', 1, 'Muntplein 1', 'Amsterdam', 'NH', '1012 AB', 360000.00, 'Very cool desc', 80, 2, 1, 'https://via.placeholder.com/640x480.png/909090?text=apartment12', '2024-10-30 15:00:00', '2024-10-30 15:00:00'),
(31, 1, 'apartment', 1, 'Damstraat 100', 'Amsterdam', 'NH', '1012 WX', 340000.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/111111?text=apartment13', '2024-11-01 09:00:00', '2024-11-01 09:00:00'),
(32, 2, 'house', 1, 'Utrechtsestraat 40', 'Amsterdam', 'NH', '1017 VN', 890000.00, 'Very cool desc', 180, 4, 3, 'https://via.placeholder.com/640x480.png/222222?text=house12', '2024-11-02 13:30:00', '2024-11-02 13:30:00'),
(33, 3, 'apartment', 1, 'Korte Reguliersdwarsstraat 15', 'Amsterdam', 'NH', '1017 MW', 320000.00, 'Very cool desc', 60, 1, 1, 'https://via.placeholder.com/640x480.png/333333?text=apartment14', '2024-11-03 07:45:00', '2024-11-03 07:45:00'),
(35, 1, 'apartment', 0, 'Bloemgracht 3', 'Amsterdam', 'NH', '1015 RL', 275000.00, 'Very cool desc', 70, 2, 1, 'https://via.placeholder.com/640x480.png/555555?text=apartment15', '2024-11-05 08:00:00', '2024-11-05 08:00:00'),
(36, 2, 'house', 1, 'Weteringschans 100', 'Amsterdam', 'NH', '1017 XS', 670000.00, 'Very cool desc', 140, 4, 2, 'https://via.placeholder.com/640x480.png/666666?text=house14', '2024-11-06 09:15:00', '2024-11-06 09:15:00'),
(37, 3, 'apartment', 1, 'Amstel 90', 'Amsterdam', 'NH', '1018 EJ', 320000.00, 'Very cool desc', 65, 2, 1, 'https://via.placeholder.com/640x480.png/777777?text=apartment16', '2024-11-07 11:30:00', '2024-11-07 11:30:00'),
(38, 4, 'house', 1, 'Haarlemmerdijk 56', 'Amsterdam', 'NH', '1013 JW', 820000.00, 'Very cool desc', 175, 4, 2, 'https://via.placeholder.com/640x480.png/888888?text=house15', '2024-11-08 07:45:00', '2024-11-08 07:45:00'),
(39, 1, 'apartment', 1, 'Prinsengracht 22', 'Amsterdam', 'NH', '1015 DK', 430000.00, 'Very cool desc', 85, 2, 1, 'https://via.placeholder.com/640x480.png/999999?text=apartment17', '2024-11-09 13:00:00', '2024-11-09 13:00:00'),
(40, 2, 'house', 1, 'Kinkerstraat 44', 'Amsterdam', 'NH', '1053 DZ', 940000.00, 'Very cool desc', 180, 4, 3, 'https://via.placeholder.com/640x480.png/101010?text=house16', '2024-11-10 09:15:00', '2024-11-10 09:15:00'),
(41, 3, 'apartment', 1, 'Zeedijk 55', 'Amsterdam', 'NH', '1012 AW', 270000.00, 'Very cool desc', 65, 2, 1, 'https://via.placeholder.com/640x480.png/111111?text=apartment18', '2024-11-11 10:30:00', '2024-11-11 10:30:00'),
(42, 4, 'house', 0, 'Damstraat 120', 'Amsterdam', 'NH', '1012 WX', 650000.00, 'Very cool desc', 130, 3, 2, 'https://via.placeholder.com/640x480.png/222222?text=house17', '2024-11-12 08:45:00', '2024-11-12 08:45:00'),
(43, 1, 'apartment', 1, 'Brouwersgracht 90', 'Amsterdam', 'NH', '1015 GD', 295000.00, 'Very cool desc', 85, 2, 1, 'https://via.placeholder.com/640x480.png/333333?text=apartment19', '2024-11-13 09:30:00', '2024-11-13 09:30:00'),
(44, 2, 'house', 1, 'Haarlemmerstraat 78', 'Amsterdam', 'NH', '1013 EW', 740000.00, 'Very cool desc', 145, 4, 2, 'https://via.placeholder.com/640x480.png/444444?text=house18', '2024-11-14 13:00:00', '2024-11-14 13:00:00'),
(45, 3, 'apartment', 1, 'Singel 30', 'Amsterdam', 'NH', '1012 WX', 330000.00, 'Very cool desc', 70, 2, 1, 'https://via.placeholder.com/640x480.png/555555?text=apartment20', '2024-11-15 11:00:00', '2024-11-15 11:00:00'),
(46, 4, 'house', 1, 'Westerstraat 90', 'Amsterdam', 'NH', '1013 DE', 480000.00, 'Very cool desc', 130, 3, 2, 'https://via.placeholder.com/640x480.png/666666?text=house19', '2024-11-16 08:30:00', '2024-11-16 08:30:00'),
(47, 1, 'apartment', 0, 'Oudezijds Achterburgwal 20', 'Amsterdam', 'NH', '1012 DB', 410000.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/777777?text=apartment21', '2024-11-17 10:00:00', '2024-11-17 10:00:00'),
(48, 2, 'house', 1, 'Reguliersgracht 70', 'Amsterdam', 'NH', '1017 LE', 920000.00, 'Very cool desc', 160, 4, 2, 'https://via.placeholder.com/640x480.png/888888?text=house20', '2024-11-18 09:00:00', '2024-11-18 09:00:00'),
(49, 3, 'apartment', 1, 'Vondelpark 88', 'Amsterdam', 'NH', '1071 AA', 470000.00, 'Very cool desc', 90, 3, 1, 'https://via.placeholder.com/640x480.png/999999?text=apartment22', '2024-11-19 13:30:00', '2024-11-19 13:30:00'),
(50, 4, 'house', 1, 'Javastraat 23', 'Amsterdam', 'NH', '1094 HK', 600000.00, 'Very cool desc', 120, 3, 2, 'https://via.placeholder.com/640x480.png/101010?text=house21', '2024-11-20 08:15:00', '2024-11-20 08:15:00'),
(51, 1, 'apartment', 0, 'Herenstraat 10', 'Amsterdam', 'NH', '1015 DX', 290000.00, 'Very cool desc', 65, 2, 1, 'https://via.placeholder.com/640x480.png/111111?text=apartment23', '2024-11-21 07:45:00', '2024-11-21 07:45:00'),
(52, 2, 'house', 1, 'Amstelkade 3', 'Amsterdam', 'NH', '1012 AC', 990000.00, 'Very cool desc', 150, 4, 3, 'https://via.placeholder.com/640x480.png/222222?text=house22', '2024-11-22 13:00:00', '2024-11-22 13:00:00'),
(53, 3, 'apartment', 1, 'Korte Prinsengracht 5', 'Amsterdam', 'NH', '1015 BK', 310000.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/333333?text=apartment24', '2024-11-23 09:15:00', '2024-11-23 09:15:00'),
(55, 1, 'apartment', 1, 'Kerkstraat 18', 'Amsterdam', 'NH', '1017 GS', 380000.00, 'Very cool desc', 80, 2, 1, 'https://via.placeholder.com/640x480.png/555555?text=apartment25', '2024-11-25 13:00:00', '2024-11-25 13:00:00'),
(56, 2, 'house', 1, 'Lange Leidsedwarsstraat 15', 'Amsterdam', 'NH', '1017 NE', 850000.00, 'Very cool desc', 160, 4, 3, 'https://via.placeholder.com/640x480.png/666666?text=house24', '2024-11-26 09:15:00', '2024-11-26 09:15:00'),
(57, 3, 'apartment', 1, 'Amstelstraat 20', 'Amsterdam', 'NH', '1017 AB', 295000.00, 'Very cool desc', 70, 2, 1, 'https://via.placeholder.com/640x480.png/777777?text=apartment26', '2024-11-27 10:00:00', '2024-11-27 10:00:00'),
(58, 4, 'house', 1, 'Utrechtsestraat 32', 'Amsterdam', 'NH', '1017 SV', 720000.00, 'Very cool desc', 140, 4, 2, 'https://via.placeholder.com/640x480.png/888888?text=house25', '2024-11-28 13:00:00', '2024-11-28 13:00:00'),
(59, 1, 'apartment', 0, 'Burgwal 55', 'Amsterdam', 'NH', '1012 NT', 360000.00, 'Very cool desc', 80, 2, 1, 'https://via.placeholder.com/640x480.png/999999?text=apartment27', '2024-11-29 08:15:00', '2024-11-29 08:15:00'),
(60, 2, 'house', 1, 'Keizersgracht 30', 'Amsterdam', 'NH', '1015 AC', 990000.00, 'Very cool desc', 180, 4, 3, 'https://via.placeholder.com/640x480.png/101010?text=house26', '2024-11-30 09:30:00', '2024-11-30 09:30:00'),
(61, 3, 'apartment', 1, 'Damstraat 120', 'Amsterdam', 'NH', '1012 WX', 410000.00, 'Very cool desc', 70, 2, 1, 'https://via.placeholder.com/640x480.png/111111?text=apartment28', '2024-12-01 13:45:00', '2024-12-01 13:45:00'),
(62, 4, 'house', 1, 'Utrechtsestraat 16', 'Amsterdam', 'NH', '1017 LD', 850000.00, 'Very cool desc', 160, 4, 2, 'https://via.placeholder.com/640x480.png/222222?text=house27', '2024-12-02 07:30:00', '2024-12-02 07:30:00'),
(63, 1, 'apartment', 1, 'Vondelpark 15', 'Amsterdam', 'NH', '1071 AA', 310000.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/333333?text=apartment29', '2024-12-03 09:15:00', '2024-12-03 09:15:00'),
(64, 2, 'house', 1, 'Leidsekruisstraat 5', 'Amsterdam', 'NH', '1017 NH', 890000.00, 'Very cool desc', 160, 4, 3, 'https://via.placeholder.com/640x480.png/444444?text=house28', '2024-12-04 13:00:00', '2024-12-04 13:00:00'),
(65, 3, 'apartment', 1, 'Zeedijk 18', 'Amsterdam', 'NH', '1012 AW', 270000.00, 'Very cool desc', 65, 2, 1, 'https://via.placeholder.com/640x480.png/555555?text=apartment30', '2024-12-05 10:30:00', '2024-12-05 10:30:00'),
(66, 4, 'house', 0, 'Keizersgracht 80', 'Amsterdam', 'NH', '1015 AC', 980000.00, 'Very cool desc', 180, 4, 3, 'https://via.placeholder.com/640x480.png/666666?text=house29', '2024-12-06 08:45:00', '2024-12-06 08:45:00'),
(67, 1, 'apartment', 1, 'Damstraat 90', 'Amsterdam', 'NH', '1012 TX', 330000.00, 'Very cool desc', 75, 2, 1, 'https://via.placeholder.com/640x480.png/777777?text=apartment31', '2024-12-07 07:30:00', '2024-12-07 07:30:00'),
(68, 2, 'house', 1, 'Zijde 17', 'Amsterdam', 'NH', '1015 AC', 710000.00, 'Very cool desc', 140, 3, 2, 'https://via.placeholder.com/640x480.png/888888?text=house30', '2024-12-08 09:15:00', '2024-12-08 09:15:00'),
(69, 3, 'apartment', 1, 'Reguliersdwarsstraat 100', 'Amsterdam', 'NH', '1017 BK', 250000.00, 'Very cool desc', 60, 1, 1, 'https://via.placeholder.com/640x480.png/999999?text=apartment32', '2024-12-09 08:00:00', '2024-12-09 08:00:00'),
(71, 1, 'apartment', 1, 'Zandstraat 7', 'Amsterdam', 'NH', '1011 LV', 360000.00, 'Very cool desc', 90, 3, 1, 'https://via.placeholder.com/640x480.png/111111?text=apartment33', '2024-12-11 07:30:00', '2024-12-11 07:30:00'),
(72, 2, 'house', 1, 'Vijzelstraat 23', 'Amsterdam', 'NH', '1017 HG', 950000.00, 'Very cool desc', 180, 4, 3, 'https://via.placeholder.com/640x480.png/222222?text=house32', '2024-12-12 09:15:00', '2024-12-12 09:15:00'),
(73, 3, 'apartment', 1, 'Weteringschans 50', 'Amsterdam', 'NH', '1017 SB', 320000.00, 'Very cool desc', 65, 2, 1, 'https://via.placeholder.com/640x480.png/333333?text=apartment34', '2024-12-13 10:00:00', '2024-12-13 10:00:00'),
(74, 4, 'house', 1, 'Bloemstraat 15', 'Amsterdam', 'NH', '1016 VX', 550000.00, 'Very cool desc', 120, 3, 2, 'https://via.placeholder.com/640x480.png/444444?text=house33', '2024-12-14 08:30:00', '2024-12-14 08:30:00'),
(75, 1, 'apartment', 1, 'Spuistraat 60', 'Amsterdam', 'NH', '1012 WA', 340000.00, 'Very cool desc', 80, 2, 1, 'https://via.placeholder.com/640x480.png/555555?text=apartment35', '2024-12-15 11:30:00', '2024-12-15 11:30:00'),
(76, 2, 'house', 1, 'Prinsengracht 45', 'Amsterdam', 'NH', '1015 DK', 980000.00, 'Very cool desc', 160, 4, 3, 'https://via.placeholder.com/640x480.png/666666?text=house34', '2024-12-16 13:00:00', '2024-12-16 13:00:00'),
(77, 3, 'apartment', 0, 'Keizersgracht 20', 'Amsterdam', 'NH', '1015 AC', 295000.00, 'Very cool desc', 70, 2, 1, 'https://via.placeholder.com/640x480.png/777777?text=apartment36', '2024-12-17 08:45:00', '2024-12-17 08:45:00'),
(78, 4, 'house', 1, 'Utrechtsestraat 50', 'Amsterdam', 'NH', '1017 SG', 710000.00, 'Very cool desc', 140, 3, 2, 'https://via.placeholder.com/640x480.png/888888?text=house35', '2024-12-18 10:00:00', '2024-12-18 10:00:00'),
(79, 1, 'apartment', 1, 'Singel 50', 'Amsterdam', 'NH', '1012 AC', 320000.00, 'Very cool desc', 85, 2, 1, 'https://via.placeholder.com/640x480.png/999999?text=apartment37', '2024-12-19 09:00:00', '2024-12-19 09:00:00'),
(80, 2, 'house', 1, 'Korte Leliedwarsstraat 25', 'Amsterdam', 'NH', '1015 AC', 920000.00, 'Very cool desc', 160, 4, 2, 'https://via.placeholder.com/640x480.png/101010?text=house36', '2024-12-20 13:30:00', '2024-12-20 13:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `verification_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_10_150451_create_personal_access_tokens_table', 1),
(5, '2024_09_13_093841_create_contents_table', 1),
(6, '2024_09_17_105921_create_notifications_table', 1),
(7, '2024_09_17_114639_create_permission_tables', 1),
(8, '2024_09_18_074115_create_biddings_table', 1),
(9, '2024_09_20_113727_create_favorites_table', 1),
(10, '2024_10_18_121049_add_profile_picture_to_users_table', 2),
(11, '2024_10_21_115514_create_email_verifications_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `sender_id`, `receiver_id`, `message`, `read`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'New bid on your Apartment from John Klein', 0, '2024-10-09 09:12:17', '2024-10-09 09:12:17'),
(3, 5, 1, 'Your bid has been declined by Alysa', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(151, 'App\\Models\\User', 1, 'Access Token', 'e20004b79857f9d2a87e31b135e90b0232d145626f45f969ee3aa64985665f5a', '[\"*\"]', NULL, NULL, '2024-10-21 10:13:05', '2024-10-21 10:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'verhuurder', 'web', '2024-09-20 10:44:50', '2024-09-20 10:44:50'),
(2, 'admin', 'web', '2024-09-20 10:44:50', '2024-09-20 10:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1GMscAdq8N6WpK4dF5auPOvIDtZAlFTWKS5Xncts', NULL, '205.169.39.47', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGhzOWJQd2xjMjNQSG5oU0xHWkRZRVpYVlhJdUp1cXByRkhYa05qZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728705377),
('3O3Htymdnr8d9M7bL9JkOMgJFtr37T9331lsHCvt', NULL, '93.174.93.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHBOaHlyd0dUNTloQWd1cG80YTF4MDVZbHUxQ0hEbHNGSURWMU5vRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728723288),
('6pJieWRHdKyIn8lZl2Y9RbF1Nn5eYU8uslINHHUh', NULL, '198.20.67.200', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUU92U0RWZzJ5QXYyeE9ZUktXVnhwdUhWN1hJTFFQQ0JlZmRwWkNBSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LmNocmlzb3Vib3Rlci5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728736043),
('9GEu9YqCloCzddumO2hyt2ZoFbG2Itx8iGIbQuSR', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjJtR1MwdkJIVU1DYnhrZmFWMVIzSlRmQVhNcDc3eGFLeXEyWUdZQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729261364),
('aW5TRi4wzAPki8fCPUzbEr7wEKTBKnEHRTL19sv9', NULL, '43.133.77.208', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTdUN2wyeURJVXprckRzaVlodk1ENzhFaEJMOVd2MWZhYjZUOU50YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728821651),
('dljjAu9nymfWTEwcprfbMKpIvQIXC30scXn1wuzi', NULL, '5.133.192.131', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekNmZ01RS0s3M3hDWHpsWGx4TTlyWmZ6NEJrQUQ3Uk84bUZDSk85YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728819098),
('GF84z7OikBb34Wk9a1Tqw9mIPeduDvNVD0FWF3K2', NULL, '94.152.186.69', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGxXYnljSW1HdHB6WW9Uc1AzdmtnQTY4dmdGa3dqR0RKd1I4eDVJQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728793367),
('Hgi9I1VVYRIRfvDQY6mjzbX3QmkHaFseISyJgeyD', NULL, '127.0.0.1', 'PostmanRuntime/7.42.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic09mQXRaWHZtcmhnQjYySEZsaGcxSUFBMm9HNU45WEZZek9HMTdZVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1729513555),
('HPSnHdafnDFZIp9pH9ifUKogyEepsKBVvGqJXpIL', NULL, '49.51.72.76', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVpzTnU5NHBSV29ZejB3ckNuRUM2S2FmZWhzUVRkUzI2OTZpMThlSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LmNocmlzb3Vib3Rlci5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728786987),
('j9SeWKxcqLPtfam5JJQa0ciVlMYC3Mca6pN7Kj0t', NULL, '94.152.186.69', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmcyU3hNUUJJY1pWM1hXelZhT1d3bjZaYXZrTHhLc3VPVG9nY0dLRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728793353),
('l6vH30KDd85tuhcf7aQpUtoAAeyW9jr5ee7G3pYl', NULL, '170.106.84.136', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUdTeUUwdnhzRjN6UkNRNmUycWdQb2d4eW9iQzFJWWZLSGVld0pxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LmNocmlzb3Vib3Rlci5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728689827),
('lITYCGIu0T6j151ZJfcR6LLCFiTmmOdrjbY7XpGG', NULL, '92.255.85.164', 'Mozilla/5.0 (Windows NT 10.0.0; Win64; x64; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.6367.63 Chrome/124.0.6367.63 Not-A.Brand/99  Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnJuWDZGSDB0Y05GdFBWVmZqa2NaSVVFQlZ1STRGUUVsbDZmQ0NqTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728834134),
('NiocM32bekRJEhSfXfrJVIPmarp05r5Y7r4LexbU', NULL, '194.38.20.13', 'ALittle Client', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjV5Q01IcWxnMm1XQlJUM21HU242ZW5zemozT1c0cUJXSmpEcDV3cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbS9pbmRleC5waHA/b3B0aW9uPWNvbV9hZHNtYW5hZ2VyJnRhc2s9dXBsb2FkJnRtcGw9Y29tcG9uZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728795248),
('nl98wJIgydS5r1DraJDgn1uivY6TcD9zHUXsG4pV', NULL, '54.226.115.185', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVibDZSbkdHU2NocXprRjBVWU9IYkdEVDFTbTYwM3hRMnFFYXhFUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LmNocmlzb3Vib3Rlci5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728863949),
('O0G8VjKNWOG23E7LNkJfENWnoNWaDs124l8AfFTc', NULL, '129.226.146.179', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUM5amp6ZWEwNm5Dc0JSWGNXY21iRUJybkZGeGJzUXNxYzNOQU44VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728748920),
('ogehkqxytkIFj9j1yrLHATxCiYMS4Pv0nEaoto3l', NULL, '34.83.159.241', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmZkODNHOXVGRlBmZ3AwRFZoejJQSVdVRTBMUzVvbkJqZFZiWHJDWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728832245),
('ojlInluji2N260ZF88Hd6xbFSe2UVU6KvDKtADYp', NULL, '35.226.224.195', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXdqeUlBTXlXaUVxSkh3cE5zbkxLamVQMkcwQ1psWHVDWEZ2ejFOdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728838396),
('PAVy7zblMMVTxEv3ZBeH52k3oapOT53JGDpYb7Us', NULL, '117.33.163.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEdYOGl6UG1CZ3daNGVxdWszdkpnbmtYSlFJc3g3QzdLUVZxUEhIViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728708610),
('qbhQdCXcM2EcjY3GzEZOlpFTklvtRsZ3gYsrIJwm', NULL, '17.241.227.130', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15 (Applebot/0.1; +http://www.apple.com/go/applebot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlpMbWdyVDNLa2oyVURHSU8xNnZYaHRLaFhkQ0RXTU43d29XN296MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbS8/ZGlyPU5MIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1728770795),
('rllOD71iUihfSwkt7oIsvDy7LhmnD4QGTOEZhhPq', NULL, '43.131.243.208', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFljcEJQaXRpS2p3a2dsVGlQaVltbmRKNHk4TGl3QU9pcEQyM3hzRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LmNocmlzb3Vib3Rlci5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728861314),
('TeAUYKWlXZdVIzYJJGR71H0u299g4q9yz0Bnp1wk', NULL, '43.159.128.68', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVp2NzVlaTh5TjFqZ1lVU2hJZ1N3TE9YU3hmTlBPZGF6Q3Z2Znl1OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728900142),
('W14oYn07Lv5o7E47zvUwDuE1tPeTPjbJ27w5ckIk', NULL, '110.166.71.39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVBFZFBkY3dZTlpUOHNGYmJ3Q2xXeFZScDRsVVp6VG5XM2czS0ZyQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728764069),
('XimOJORzyA9lCTrUGauJGlhnFdb18kswxHFz1xkC', NULL, '198.20.67.199', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/6.0)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjMzZXRWTHRtTDlyVDBnRXVEdEdKTzg0QjB3MWY4SU1OQjlWbG9waSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LmNocmlzb3Vib3Rlci5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728834191),
('z1IIptnKRXeaU3htW4DXol24grxRVAF5BvS1MdCi', NULL, '159.89.13.39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNktrdWxEdnBQZFY2MGcxbllacnhVYzVyN1RIcGZZdk53UEJ3ckpBMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728807765),
('zIYFiky4pETFRdy8spnFioJ7MCBSwNBviJQE1JAK', NULL, '35.226.224.195', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkZSRmZkcHlJbUhld3RsekQ1NUhSZ3NnbHhTa3p3ZmZTRGs1OHZ6SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vd3d3LmNocmlzb3Vib3Rlci5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1728838396),
('zrF3nn9hKSIv0i6Cb9ufelrQUaPWdhp0SfwFlz4f', NULL, '45.94.31.68', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDVWenRnVnBSRHZEd0UwdUZ5cXBjcFI1dUJ3dTNUYU5GQnIwd0l1cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHBzOi8vY2hyaXNvdWJvdGVyLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728694385);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `profile_picture`) VALUES
(1, 'Admin admin', 'chrisobt@outlook.com', '2024-10-21 12:33:50', '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'yrERdt8dW0', '2024-09-20 10:44:50', '2024-10-21 10:33:50', 'storage/profile_pictures/1729508456.jpg'),
(2, 'Hillary Dickinson DVM', 'jaida42@example.com', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'Tk5NMmtzvB', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(3, 'Ozella Abernathy', 'ggusikowski@example.net', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'QyZgXVK4rF', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(4, 'Marcelina Kassulke', 'jordon57@example.org', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'Zs1gemlJxt', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(5, 'Rocky Gleason', 'alysa27@example.net', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'iwmtSHKtAE', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(6, 'Dr. Jannie Abshire DVM', 'daniella30@example.com', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'VQLNd7iuQc', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(7, 'Albin Jast', 'lewis.wehner@example.org', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'lzbEM3zorL', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(8, 'Agnes Carroll', 'thaddeus.schoen@example.net', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'kONF0fm9Sh', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(9, 'Dr. Jackson Stokes', 'tina55@example.org', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'xj9Ojcafc1', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(10, 'Dr. Giovanny Rogahn', 'harris.bradley@example.net', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'A6ZEHEVQrA', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(11, 'Lonie Kuphal', 'ubernier@example.org', NULL, '$2y$12$nQPECTqALyAE9WYpAfZLR.JiPnU1sDSpec.TGA1.8jywq.gzNPTqu', 'bMXlo8SyDo', '2024-09-20 10:44:50', '2024-09-20 10:44:50', NULL),
(12, 'conner wit', 'connerwit@gmail.com', NULL, '$2y$12$7Hcrh7hmQh3JwjUDt.NUI.tOBaWQanMvRl3rv.0coEkpGtwmaIOXO', NULL, '2024-10-02 09:52:16', '2024-10-02 09:52:16', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biddings`
--
ALTER TABLE `biddings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `biddings_sender_id_foreign` (`sender_id`),
  ADD KEY `biddings_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_user_id_foreign` (`user_id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_verifications_email_index` (`email`),
  ADD KEY `email_verifications_user_id_index` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`),
  ADD KEY `favorites_content_id_foreign` (`content_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_sender_id_foreign` (`sender_id`),
  ADD KEY `notifications_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `biddings`
--
ALTER TABLE `biddings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biddings`
--
ALTER TABLE `biddings`
  ADD CONSTRAINT `biddings_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `biddings_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contents`
--
ALTER TABLE `contents`
  ADD CONSTRAINT `contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `contents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
