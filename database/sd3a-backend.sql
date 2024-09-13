-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2024 at 01:33 PM
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
  `type` enum('house','apartment') NOT NULL,
  `availability` enum('available','not available') NOT NULL,
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

INSERT INTO `contents` (`id`, `type`, `availability`, `address`, `city`, `state`, `zip`, `price`, `description`, `m2`, `bedrooms`, `bathrooms`, `image`, `created_at`, `updated_at`) VALUES
(1, 'house', 'available', '84790 Willms Manor', 'Port Maurine', 'MI', '62224', 65742.26, NULL, 468, 2, 4, 'https://via.placeholder.com/640x480.png/00ff88?text=aut', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(2, 'house', 'not available', '172 Blanda Trafficway Suite 384', 'Stephaniemouth', 'MS', '89661-3183', 457166.34, 'Asperiores ut rerum asperiores tempore corporis nihil commodi. Voluptas vitae fugiat et dolorem aliquam labore. Quidem quia delectus in architecto.', 127, 1, 4, 'https://via.placeholder.com/640x480.png/0022cc?text=sit', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(3, 'apartment', 'not available', '1862 Fabiola Oval Apt. 805', 'Port Ashly', 'FL', '88774-8888', 162991.89, 'Quia nisi asperiores est corporis eius atque distinctio. Et et amet laborum vel odio quo. Rerum repellendus quis necessitatibus. Omnis omnis deserunt aut ea.', 371, 1, 2, 'https://via.placeholder.com/640x480.png/000022?text=exercitationem', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(4, 'house', 'available', '66544 Crona Court', 'Bodeview', 'MT', '52522', 371061.59, 'Voluptatem et dolorem architecto culpa quo. Recusandae explicabo architecto laudantium ad quam qui voluptas ut. Voluptas a error hic aut eligendi atque. Eius quo autem voluptate aut non. Nesciunt tenetur ut earum et ut veritatis.', 240, 2, 4, 'https://via.placeholder.com/640x480.png/006622?text=et', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(5, 'house', 'available', '5072 Johnston Village Suite 866', 'Zaneberg', 'HI', '73328-4570', 438113.36, NULL, 298, 2, 1, 'https://via.placeholder.com/640x480.png/0077cc?text=aut', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(6, 'apartment', 'not available', '80073 Labadie Drives Suite 536', 'Gorczanytown', 'WY', '92119-3791', 327302.60, 'Atque animi est inventore velit. Nihil molestias nihil molestiae. Omnis ab ex sint.', 86, 5, 3, 'https://via.placeholder.com/640x480.png/00dd77?text=sed', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(7, 'apartment', 'available', '651 Muller Pine Apt. 547', 'East Maximoport', 'LA', '28290-1726', 439693.56, 'Et aut adipisci corporis esse non beatae. Nostrum unde necessitatibus possimus qui. Omnis saepe sunt cum dolorum voluptatibus. Aut inventore similique quia illo quia voluptas.', 324, 4, 4, 'https://via.placeholder.com/640x480.png/00ddee?text=modi', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(8, 'apartment', 'available', '1774 Flatley Crescent Apt. 597', 'Verlieport', 'AK', '89112', 143177.57, NULL, 305, 4, 4, 'https://via.placeholder.com/640x480.png/001144?text=officia', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(9, 'apartment', 'not available', '109 Maeve Row', 'Lemkemouth', 'NM', '39779-6585', 435873.47, NULL, 306, 3, 1, 'https://via.placeholder.com/640x480.png/00dd22?text=beatae', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(10, 'apartment', 'not available', '95186 Turcotte Rapids Apt. 038', 'Turcotteview', 'IN', '32034-3006', 304854.01, 'Eum vero maiores ut deserunt. Voluptas eum nobis praesentium itaque non. Suscipit quidem et totam eligendi doloribus incidunt.', 213, 4, 3, 'https://via.placeholder.com/640x480.png/007700?text=eos', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(11, 'apartment', 'available', '23382 Glover Crossing', 'Corkeryberg', 'NC', '97463', 55739.18, NULL, 361, 2, 1, 'https://via.placeholder.com/640x480.png/00eebb?text=alias', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(12, 'apartment', 'not available', '108 Champlin Lights', 'Naomiefort', 'DE', '76627', 327268.89, 'Omnis error aut numquam odit eligendi nihil. Corporis ad quo consectetur sequi qui. Sit atque voluptatibus quo distinctio vel fugiat perspiciatis. Explicabo commodi autem ipsa qui.', 299, 4, 4, 'https://via.placeholder.com/640x480.png/009922?text=necessitatibus', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(13, 'apartment', 'available', '5017 Gottlieb Street', 'North Khalilland', 'ND', '11026-8345', 242268.75, NULL, 452, 1, 4, 'https://via.placeholder.com/640x480.png/007799?text=eos', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(14, 'apartment', 'available', '41090 Claudine Junction', 'Port Meredithborough', 'AL', '30052-5457', 449936.55, NULL, 213, 2, 3, 'https://via.placeholder.com/640x480.png/006600?text=occaecati', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(15, 'apartment', 'available', '13810 Jasmin Park', 'Brooklynchester', 'PA', '30730-8750', 227135.48, NULL, 298, 3, 2, 'https://via.placeholder.com/640x480.png/000066?text=ea', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(16, 'apartment', 'available', '94843 Regan Views Suite 969', 'Collinston', 'MI', '21442', 365039.52, NULL, 250, 2, 2, 'https://via.placeholder.com/640x480.png/002211?text=suscipit', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(17, 'house', 'available', '407 Demario Centers Suite 464', 'North Lula', 'FL', '91216-9158', 480591.94, 'Libero pariatur dolorum eligendi sit qui ratione sit. Eveniet aut nobis ducimus. Eos fuga cupiditate sunt aut. Et officia explicabo voluptatum. Debitis doloremque et voluptas.', 384, 1, 1, 'https://via.placeholder.com/640x480.png/005599?text=numquam', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(18, 'apartment', 'not available', '4445 Cassin Meadow', 'South Josianneview', 'MO', '58598-7137', 121253.52, 'Nostrum natus sequi reiciendis dolorum eum quo. Nisi quas sit nihil sint. Ducimus saepe magnam perferendis in repellat totam et.', 273, 5, 1, 'https://via.placeholder.com/640x480.png/00bbcc?text=eligendi', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(19, 'house', 'not available', '468 Shanahan Spur Apt. 285', 'South Mitchellton', 'CT', '62051', 349126.76, 'Aut vel rerum consequatur commodi reiciendis soluta dicta. Facere dolorem corrupti ad architecto quis eveniet. Labore distinctio ducimus cupiditate ea. Nobis rerum consectetur recusandae distinctio.', 416, 5, 2, 'https://via.placeholder.com/640x480.png/002233?text=eaque', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(20, 'apartment', 'not available', '9954 Purdy Trafficway Apt. 972', 'Hayleyton', 'MI', '36369', 496312.17, 'Numquam voluptatibus molestias repudiandae veritatis eligendi dolorem. Quisquam fugiat soluta error amet voluptatem perferendis.', 460, 1, 1, 'https://via.placeholder.com/640x480.png/00ee11?text=in', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(21, 'apartment', 'not available', '496 Bridgette Gardens Suite 576', 'Blickside', 'GA', '46648-8324', 375811.65, 'Dolor et est qui. Id est consequatur et. Fuga esse molestiae commodi.', 260, 5, 4, 'https://via.placeholder.com/640x480.png/0088cc?text=at', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(22, 'house', 'not available', '702 Ernser Burg Apt. 593', 'New Keelyborough', 'OK', '41309', 411188.52, NULL, 381, 3, 1, 'https://via.placeholder.com/640x480.png/0088cc?text=possimus', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(23, 'house', 'available', '2642 Schimmel Divide', 'Lamarberg', 'NV', '43770', 147123.08, 'A non reiciendis est doloremque. Mollitia possimus animi ad commodi enim et repudiandae facere. Consequuntur hic consectetur eum nam commodi rerum. Nostrum necessitatibus est voluptas est commodi.', 198, 5, 1, 'https://via.placeholder.com/640x480.png/00cc33?text=ratione', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(24, 'apartment', 'not available', '472 Amos Extension', 'Lake Vergie', 'CT', '56242', 196053.96, NULL, 219, 2, 2, 'https://via.placeholder.com/640x480.png/001155?text=enim', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(25, 'house', 'available', '250 Lindgren Mountain', 'Lake Kitty', 'NY', '42395-2055', 444156.56, 'Reprehenderit in ipsam deserunt asperiores. Sed debitis rerum hic eum veritatis fugit at. Asperiores optio voluptatem nisi.', 203, 1, 2, 'https://via.placeholder.com/640x480.png/004444?text=provident', '2024-09-13 09:25:30', '2024-09-13 09:25:30');

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
(25, '2024_09_13_093841_create_content_table', 1),
(31, '0001_01_01_000000_create_users_table', 2),
(32, '0001_01_01_000001_create_cache_table', 2),
(33, '0001_01_01_000002_create_jobs_table', 2),
(34, '2024_09_10_150451_create_personal_access_tokens_table', 2),
(35, '2024_09_13_093841_create_contents_table', 2);

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Norbert Haag', 'stanton.salvador@example.com', '2024-09-13 09:25:29', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'F8oGWKS3z2', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(2, 'Conor Reynolds', 'taya94@example.com', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', '9vr5RpUZi8', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(3, 'Ms. Leilani Grady Sr.', 'udare@example.com', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'ppytBkFUK6', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(4, 'Marshall Harber', 'umosciski@example.net', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'cf6HPQsWBz', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(5, 'Selena Spinka Jr.', 'fbarton@example.org', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', '2lnIiXAlhp', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(6, 'Lorna Labadie', 'jayden.kerluke@example.net', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', '5iofZOlWvw', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(7, 'Miss Maude Macejkovic I', 'spencer.haag@example.net', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'Wbci3S9k4l', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(8, 'Prof. Brock Koch Sr.', 'cole.nelle@example.com', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'vlko44cvoJ', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(9, 'Leanna Rolfson', 'ed.leuschke@example.net', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'mej0PFJFFn', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(10, 'Lawson Baumbach', 'yadira.connelly@example.org', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'Xd1wpy71Bs', '2024-09-13 09:25:30', '2024-09-13 09:25:30'),
(11, 'Test User', 'test@example.com', '2024-09-13 09:25:30', '$2y$12$sBqwDKxeJGQ.uC.48nsh3.GI0wFxCIG6smbTHy5xkUPjUIWCkUDx2', 'gbs9cVCUdb', '2024-09-13 09:25:30', '2024-09-13 09:25:30');

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
