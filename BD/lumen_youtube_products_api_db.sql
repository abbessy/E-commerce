-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2022 at 02:18 PM
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
-- Database: `lumen_youtube_products_api_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_07_13_165109_create_products_table', 1),
(2, '2022_08_06_155618_create_users_table', 1),
(3, '2022_08_22_160156_create_cart_table', 1),
(4, '2022_08_28_154727_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_id`, `user_id`, `status`, `payment_status`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'pending', 'pending', 'Krib 6120', NULL, NULL),
(2, 4, 2, 'pending', 'pending', 'Krib 6120', NULL, NULL),
(3, 7, 2, 'pending', 'pending', 'Krib 6120', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'First Product', 100.00, 'This is the 1st Product', '2022-08-28 18:44:09', '2022-08-28 18:44:09'),
(2, 'Second Product', 200.00, 'This is the 2nd Product', '2022-08-28 18:44:25', '2022-08-28 18:44:25'),
(3, 'Third Product', 300.00, 'This is the 3rd Product', '2022-08-28 18:44:36', '2022-08-28 18:44:36'),
(4, 'Fourth Product', 400.00, 'This is the 4th Product', '2022-08-28 18:44:51', '2022-08-28 18:44:51'),
(5, 'Fifth Product', 500.00, 'This is the 5th Product', '2022-08-28 18:45:04', '2022-08-28 18:45:04'),
(6, 'Sixth Product', 600.00, 'This is the 6th Product', '2022-08-28 18:45:22', '2022-08-28 18:45:22'),
(7, 'Seventh Product', 700.00, 'This is the 7th Product', '2022-08-28 18:45:42', '2022-08-28 18:45:42'),
(8, 'Eighth Product', 800.00, 'This is the 8th Product', '2022-08-28 18:46:01', '2022-08-28 18:46:01'),
(9, 'Ninth Product', 900.00, 'This is the 9th Product', '2022-08-28 18:46:17', '2022-08-28 18:46:17'),
(10, 'Tenth Product', 1000.00, 'This is the 10th Product', '2022-08-28 18:46:32', '2022-08-28 18:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'admin@gmail.com', '$2y$10$KxdiSVY14uZb0eowjPWY6epVw2IgNJatNcXA0vyM6Jmckl8wXYMOS', '2022-08-28 18:42:24', '2022-08-28 18:42:24'),
(2, 'user', 'User 1', 'user@gmail.com', '$2y$10$cg5Ppif4wtQEL97ET4SMkONL.rcpe35zRt2G11p6ieODwEiCDNdmW', '2022-08-28 18:42:55', '2022-08-28 18:42:55'),
(3, 'user', 'User 2', 'user2@gmail.com', '$2y$10$Pl/NSsO/JtLjf4v34AfuOOpBkkBhxaugoUFeoaJI6hsFfG10x01XW', '2022-08-28 18:43:09', '2022-08-28 18:43:09'),
(4, 'user', 'User 3', 'user3@gmail.com', '$2y$10$hhkUlbW0eQSCih1/.D1rwOcnwnGjEen3FYfEkbWz1XlW1Jc.G7DcG', '2022-08-28 18:43:27', '2022-08-28 18:43:27'),
(5, 'admin', 'Admin 2', 'admin2@gmail.com', '$2y$10$cQTzs5CK3E/xRppMbnsUQ.DpL2kNb9/rGcC/QhMlh3YTRnOLnSCy.', '2022-08-28 18:43:48', '2022-08-28 18:43:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
