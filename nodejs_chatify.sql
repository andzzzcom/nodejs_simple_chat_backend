-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2022 at 08:57 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodejs_chatify`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `id_user` int(10) NOT NULL,
  `content` text NOT NULL,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id_message`, `id_user`, `content`, `status`, `created_at`, `last_updated_at`) VALUES
(1, 1, 'Hai, ini chat uji coba', 1, '2022-03-18 09:04:44', '2022-03-18 09:04:44'),
(2, 1, 'CHat ke dua', 1, '2022-03-18 09:04:44', '2022-03-18 09:04:44'),
(3, 1, 'Masa sih?', 1, '2022-03-18 09:04:44', '2022-03-18 09:04:44'),
(77, 1, 'Hai, ini chat uji cobas', 1, '2022-03-18 09:04:44', '2022-03-18 09:04:44'),
(78, 1, 'Hai, ini chat uji cobass', 1, '2022-03-18 09:04:44', '2022-03-18 09:04:44'),
(79, 2, 'tes', 1, '2022-03-20 22:19:21', '2022-03-20 22:19:21'),
(80, 2, 'hm', 1, '2022-03-20 22:19:23', '2022-03-20 22:19:23'),
(81, 2, 'biarin dulu deh', 1, '2022-03-20 22:19:37', '2022-03-20 22:19:37'),
(82, 2, 'tes', 1, '2022-03-21 05:05:23', '2022-03-21 05:05:23'),
(83, 2, 'hm', 1, '2022-03-21 05:05:27', '2022-03-21 05:05:27'),
(84, 2, 'tes', 1, '2022-03-21 05:49:00', '2022-03-21 05:49:00'),
(85, 2, 'oke', 1, '2022-03-21 05:49:03', '2022-03-21 05:49:03'),
(86, 2, 'woi', 1, '2022-03-21 05:49:06', '2022-03-21 05:49:06'),
(87, 2, 'tes', 1, '2022-03-21 06:02:49', '2022-03-21 06:02:49'),
(88, 2, 'woi', 1, '2022-03-21 06:37:07', '2022-03-21 06:37:07'),
(89, 2, 'yakin lu kayak gitu?', 1, '2022-03-21 06:53:15', '2022-03-21 06:53:15'),
(90, 2, 'hm', 1, '2022-03-21 06:53:47', '2022-03-21 06:53:47'),
(91, 2, 'tes', 1, '2022-03-21 06:56:01', '2022-03-21 06:56:01'),
(92, 2, 'hm', 1, '2022-03-21 14:06:16', '2022-03-21 14:06:16'),
(93, 2, 'hm', 1, '2022-03-21 14:08:30', '2022-03-21 14:08:30'),
(94, 2, 'oi', 1, '2022-03-21 14:09:04', '2022-03-21 14:09:04'),
(95, 2, 'p', 1, '2022-03-21 14:12:07', '2022-03-21 14:12:07'),
(96, 2, 'bagaimana', 1, '2022-03-21 14:42:22', '2022-03-21 14:42:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(1) NOT NULL,
  `last_online` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `last_updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `email`, `password`, `description`, `status`, `last_online`, `created_at`, `last_updated_at`) VALUES
(1, 'Admin', 'adminbaru@gmail.com', '$2b$10$2yVK9HFtpL4YtTSuwZ.ZMumQKOTlbZAdKD38bAyviWCKXFeDZIxYy', '0.9684673644946258', 1, '2022-03-21 06:39:24', '2022-03-18 09:05:32', '2022-03-21 06:39:24'),
(2, NULL, 'admin2@gmail.com', '$2b$10$2yVK9HFtpL4YtTSuwZ.ZMumQKOTlbZAdKD38bAyviWCKXFeDZIxYy', '0.5099474871670009', 1, '2022-03-21 14:44:40', '2022-03-19 17:45:41', '2022-03-21 14:44:40'),
(34, NULL, 'admin5@gmail.com', '$2b$10$2yVK9HFtpL4YtTSuwZ.ZMumQKOTlbZAdKD38bAyviWCKXFeDZIxYy', '0.6226983364422467', 1, '2022-03-21 06:15:11', '2022-03-19 17:45:41', '2022-03-21 06:15:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
