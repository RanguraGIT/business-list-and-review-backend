-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Jan 2023 pada 02.04
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interview_62`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `businesses`
--

CREATE TABLE `businesses` (
  `business_id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(100) NOT NULL,
  `business_type` varchar(20) NOT NULL,
  `business_category` text NOT NULL,
  `business_email` varchar(100) NOT NULL,
  `business_phone` varchar(20) NOT NULL,
  `business_website` varchar(100) NOT NULL,
  `business_price` enum('1','2','3','4') NOT NULL,
  `business_opening` varchar(6) NOT NULL,
  `business_closing` varchar(6) NOT NULL,
  `business_country` varchar(20) DEFAULT NULL,
  `business_state` varchar(20) DEFAULT NULL,
  `business_city` varchar(20) DEFAULT NULL,
  `business_address` text NOT NULL,
  `business_zip` varchar(10) DEFAULT NULL,
  `business_latitute` float(10,7) NOT NULL,
  `business_longitude` float(10,7) NOT NULL,
  `business_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `businesses`
--

INSERT INTO `businesses` (`business_id`, `business_name`, `business_type`, `business_category`, `business_email`, `business_phone`, `business_website`, `business_price`, `business_opening`, `business_closing`, `business_country`, `business_state`, `business_city`, `business_address`, `business_zip`, `business_latitute`, `business_longitude`, `business_status`, `created_at`, `updated_at`) VALUES
(1, 'MIXUE Puncak', 'Ice cream', 'ice cream, soda, drink, food', 'hello@mixueid', '081214485100', 'www.mixue.id', '1', '100000', '180000', NULL, NULL, NULL, '72CR+P6 Sindanglaya, Kabupaten Cianjur, Jawa Barat', NULL, -6.7280908, 107.0405426, 1, '2023-01-28 03:38:30', '2023-01-28 03:38:30'),
(2, 'Mie Ayam Gajah Mungkur Maharaja', 'Food', 'Mie ayam, Food, Drink', 'hello@gajahmungkur.id', '081214485100', 'www.mixue.id', '1', '100000', '180000', NULL, NULL, NULL, 'Jalan Perumahan Depok Maharaja, RT.05/RW.05, Pancoran MAS, Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', NULL, -6.4031324, 106.7944717, 1, '2023-01-28 03:51:36', '2023-01-28 08:12:55'),
(3, 'Bevetta Brownies', 'Roti', 'Dishes, Roti, Makanan Ringan', 'bevetta@bakery.com', '0123456789012', 'www.bevetta.com', '3', '0000', '2359', NULL, NULL, NULL, 'Jl. Perumahan Depok Maharaja Blk. L4 No.7, Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', NULL, -6.4035149, 106.7964554, 1, '2023-01-28 16:23:43', '2023-01-28 16:23:43'),
(4, 'Rice Bowl Ibu Ira', 'Rice', 'Food, Rice', 'rice@bowl.ira', '01234567890123', 'www.ricebowl.ira', '2', '0600', '1700', NULL, NULL, NULL, 'HQXR+GX8, Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', NULL, -6.4010487, 106.7924728, 1, '2023-01-28 16:27:07', '2023-01-28 16:27:07'),
(5, 'Mie Ayam Gajah Mungkur Maharaja', 'Food', 'Mie ayam, Food, Drink', 'hello@gajahmungkur.id', '081214485100', 'www.mixue.id', '1', '100000', '180000', NULL, NULL, NULL, 'Jalan Perumahan Depok Maharaja, RT.05/RW.05, Pancoran MAS, Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', NULL, -6.4031324, 106.7944717, 0, '2023-01-28 17:29:13', '2023-01-28 17:57:27'),
(6, 'Mie Ayam Gajah Mungkur Maharaja', 'Food', 'Mie ayam, Food, Drink', 'hello@gajahmungkur.id', '081214485100', 'www.mixue.id', '1', '100000', '180000', NULL, NULL, NULL, 'Jalan Perumahan Depok Maharaja, RT.05/RW.05, Pancoran MAS, Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', NULL, -6.4031324, 106.7944717, 1, '2023-01-28 17:29:14', '2023-01-28 17:29:14'),
(7, 'Mie Ayam Gajah Mungkur Maharaja', 'Food', 'Mie ayam, Food, Drink', 'hello@gajahmungkur.id', '081214485100', 'www.mixue.id', '1', '100000', '180000', NULL, NULL, NULL, 'Jalan Perumahan Depok Maharaja, RT.05/RW.05, Pancoran MAS, Rangkapan Jaya, Kec. Pancoran Mas, Kota Depok, Jawa Barat 16435', NULL, -6.4031324, 106.7944717, 1, '2023-01-28 17:29:15', '2023-01-28 17:29:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `business_ratings`
--

CREATE TABLE `business_ratings` (
  `rating_id` bigint(20) UNSIGNED NOT NULL,
  `rating_business` bigint(20) NOT NULL,
  `rating_user` bigint(20) NOT NULL,
  `rating` double(2,1) NOT NULL,
  `rating_review` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `business_ratings`
--

INSERT INTO `business_ratings` (`rating_id`, `rating_business`, `rating_user`, `rating`, `rating_review`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2.0, 'contoh', '2023-01-28 03:38:40', '2023-01-28 03:38:40'),
(2, 1, 1, 3.0, 'contoh', '2023-01-28 05:23:20', '2023-01-28 05:23:20'),
(3, 1, 1, 1.0, 'contoh', '2023-01-28 05:23:43', '2023-01-28 05:23:43'),
(4, 1, 1, 5.0, 'contoh', '2023-01-28 05:23:56', '2023-01-28 05:23:56'),
(5, 2, 1, 2.0, 'Coba', '2023-01-28 15:01:45', '2023-01-28 15:01:45'),
(6, 2, 1, 5.0, 'Coba 2', '2023-01-28 15:02:04', '2023-01-28 15:02:04'),
(7, 2, 1, 1.0, 'coba 2', '2023-01-28 15:04:43', '2023-01-28 15:04:43'),
(8, 1, 1, 5.0, 'Keren nih tempat', '2023-01-28 15:08:42', '2023-01-28 15:08:42'),
(9, 1, 1, 5.0, 'Keren nih pas aku datang sama temen ku', '2023-01-28 15:09:04', '2023-01-28 15:09:04'),
(10, 2, 1, 5.0, 'Keren', '2023-01-28 15:09:48', '2023-01-28 15:09:48'),
(11, 2, 1, 5.0, 'keren bangat', '2023-01-28 15:10:00', '2023-01-28 15:10:00'),
(12, 2, 1, 5.0, 'keren parah', '2023-01-28 15:10:07', '2023-01-28 15:10:07'),
(13, 2, 1, 1.0, 'Parah', '2023-01-28 15:11:01', '2023-01-28 15:11:01'),
(14, 2, 1, 2.0, 'test', '2023-01-28 15:11:07', '2023-01-28 15:11:07'),
(15, 2, 1, 5.0, 'coba', '2023-01-28 15:11:49', '2023-01-28 15:11:49'),
(16, 2, 1, 1.0, 'coba', '2023-01-28 15:12:15', '2023-01-28 15:12:15'),
(17, 2, 1, 5.0, 'a', '2023-01-28 15:15:22', '2023-01-28 15:15:22'),
(18, 2, 1, 5.0, 'b', '2023-01-28 15:17:19', '2023-01-28 15:17:19'),
(19, 1, 1, 1.0, 'Coba', '2023-01-28 15:20:27', '2023-01-28 15:20:27'),
(20, 1, 1, 2.0, 'coba', '2023-01-28 15:20:40', '2023-01-28 15:20:40'),
(21, 1, 1, 5.0, 'c', '2023-01-28 15:20:58', '2023-01-28 15:20:58'),
(22, 1, 1, 1.0, 'a', '2023-01-28 15:21:26', '2023-01-28 15:21:26'),
(23, 1, 1, 5.0, 'c', '2023-01-28 15:21:33', '2023-01-28 15:21:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `business_reservations`
--

CREATE TABLE `business_reservations` (
  `reservation_id` bigint(20) UNSIGNED NOT NULL,
  `reservation_business` bigint(20) NOT NULL,
  `reservation_user` bigint(20) NOT NULL,
  `reservation_person` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `reservation_message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(4, '2016_06_01_000004_create_oauth_clients_table', 1),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(6, '2023_01_24_101442_businesses', 1),
(7, '2023_01_24_114229_user', 1),
(8, '2023_01_24_114246_business_rating', 1),
(9, '2023_01_24_114304_business_reservation', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('128c2cdff2132b408272376a3fbb8b2b16106f4fede1fc48fb6c5760235095ea377c255dfd25fd6a', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:38:59', '2023-01-28 14:38:59', '2024-01-28 21:38:59'),
('185cbfa66a4849a4be788834140bfd4ac205b01730944c6634548ac2a6437ea4f1351088eeb18b73', 1, 1, 'access_token', '[]', 0, '2023-01-28 03:38:19', '2023-01-28 03:38:19', '2024-01-28 10:38:19'),
('1907b5cec89e9d4cd4efb5301718ffdf7e4d6c642e5d87b476ebd5a0f15791afcf73071ef4adff42', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:01:26', '2023-01-28 14:01:26', '2024-01-28 21:01:26'),
('2c19a0fd62f41d73a3163ba922d83eb99bbadac4597ae51dcd1a4e70058f36e45add871098a8c189', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:00:07', '2023-01-28 14:00:07', '2024-01-28 21:00:07'),
('34b154c599c28db500e5bffa3f8d7bad90379d62fafd080631ed15707df049885640a49a284ec389', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:01:43', '2023-01-28 14:01:43', '2024-01-28 21:01:43'),
('3ebf1c92834eb08859d6851eebce8aa4dd12b87d674604cf121a3e514ce4ed6b7c66e9ecbf791309', 1, 1, 'access_token', '[]', 0, '2023-01-28 16:13:43', '2023-01-28 16:13:43', '2024-01-28 23:13:43'),
('466e5ac190a1f0efa5eaf842ade0808d2f23b177188969929d2d56dd801cf177eae47299cce6f230', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:26:54', '2023-01-28 14:26:54', '2024-01-28 21:26:54'),
('4d8e0ac229e7a9afec99cde12f93f4859f1db419c8e12a49f9cfdb5aaaa19c2e39889fd7d5ed8e85', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:07:04', '2023-01-28 14:07:04', '2024-01-28 21:07:04'),
('561fbaf24e7cdbe11354a48780dc852c2267eb22e6f81fd3f16e155eebc45543537e7fc31ffbeb14', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:02:37', '2023-01-28 14:02:37', '2024-01-28 21:02:37'),
('63601e6416bc8dd940883f40469db7b55dc87da3f0c2f132862ce90c6cfe9c8219ea9c331e11dd4a', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:01:35', '2023-01-28 14:01:35', '2024-01-28 21:01:35'),
('a19342054bb9493417d12fe5dc9aa186424dceae8b52405de3a398d0b1a176fb4ed6aaab941c68d8', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:01:55', '2023-01-28 14:01:55', '2024-01-28 21:01:55'),
('a740ba98fc40e9159189827baf777264cf821942ee6b0e319d7e52b47105b44d7054e2ddde6f29eb', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:03:13', '2023-01-28 14:03:14', '2024-01-28 21:03:13'),
('bfe52cf11600cdea3a5987ce243c79c65612802d767833054f08de96b416dc66d140eb44bdc646d6', 1, 1, 'access_token', '[]', 0, '2023-01-28 15:08:14', '2023-01-28 15:08:14', '2024-01-28 22:08:14'),
('dd5afcc1eb212fa5cc74a6a1d020e96f8f63590bf0a5c2f78b31cdcea40ea3972a236695412be221', 2, 1, 'access_token', '[]', 0, '2023-01-28 16:09:49', '2023-01-28 16:09:49', '2024-01-28 23:09:49'),
('dd7946da80d421336c858180808fd4fa8ff042d423d6fe11c455141262bf7afbd7159aae92e27084', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:02:53', '2023-01-28 14:02:53', '2024-01-28 21:02:53'),
('dde14007332adc96686cf9a5f5cb945d443a21fdd753f159da797072e7ab7738eefae3d13989f71a', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:00:47', '2023-01-28 14:00:47', '2024-01-28 21:00:47'),
('e8a0ed8c88ff078a1f391544dc2138cf7f2e9c8faae8a44086ae9a6fdb1326e2c3fab4549f8a2a80', 1, 1, 'access_token', '[]', 0, '2023-01-28 14:02:16', '2023-01-28 14:02:16', '2024-01-28 21:02:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'BNslE8iLoSu8wNJJ5p9C4M7UfA2qwnikeHfiaRRm', NULL, 'http://localhost', 1, 0, 0, '2023-01-28 03:38:15', '2023-01-28 03:38:15'),
(2, NULL, 'Laravel Password Grant Client', 'cBM1jFViYanBPaw9GIw18V1yBl69guHYKYfOWcz9', 'users', 'http://localhost', 0, 1, 0, '2023-01-28 03:38:15', '2023-01-28 03:38:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-01-28 03:38:15', '2023-01-28 03:38:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_username` varchar(20) DEFAULT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_country` varchar(20) DEFAULT NULL,
  `user_state` varchar(20) DEFAULT NULL,
  `user_city` varchar(20) DEFAULT NULL,
  `user_address` text DEFAULT NULL,
  `user_zip` varchar(10) DEFAULT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_username`, `user_email`, `user_phone`, `user_password`, `user_country`, `user_state`, `user_city`, `user_address`, `user_zip`, `user_status`, `created_at`, `updated_at`) VALUES
(1, 'Agung Maulana Syahputra', NULL, 'ranguraaa@gmail.com', NULL, '$2y$10$f3VpxMg2EPtdakKP5AoIm.FhtzEh80XUpBekOjPHl0VJWXGKYGqce', NULL, NULL, NULL, NULL, NULL, 1, '2023-01-28 03:37:39', '2023-01-28 03:37:39'),
(2, 'COBA', NULL, 'COBA@GMAIL.COM', NULL, '$2y$10$p4mnCIz17XXLxkopccdI1etirFHxFgHUV6SYEdM8ULYn8CBs6uw.u', NULL, NULL, NULL, NULL, NULL, 1, '2023-01-28 16:09:34', '2023-01-28 16:09:34');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`business_id`);

--
-- Indeks untuk tabel `business_ratings`
--
ALTER TABLE `business_ratings`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indeks untuk tabel `business_reservations`
--
ALTER TABLE `business_reservations`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_user_email_unique` (`user_email`),
  ADD UNIQUE KEY `users_user_username_unique` (`user_username`),
  ADD UNIQUE KEY `users_user_phone_unique` (`user_phone`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `businesses`
--
ALTER TABLE `businesses`
  MODIFY `business_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `business_ratings`
--
ALTER TABLE `business_ratings`
  MODIFY `rating_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `business_reservations`
--
ALTER TABLE `business_reservations`
  MODIFY `reservation_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
