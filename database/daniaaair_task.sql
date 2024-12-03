-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2024 at 12:44 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daniaaair_task`
--

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
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` varchar(255) NOT NULL,
  `file_sort` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `mediable_id` bigint(20) UNSIGNED NOT NULL,
  `mediable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `file_name`, `file_path`, `file_type`, `file_size`, `file_sort`, `mediable_id`, `mediable_type`, `created_at`, `updated_at`) VALUES
(1, '173317879111729.jpg', 'http://127.0.0.1:8000/public/attachments/user/173317879111729.jpg', 'image/jpeg', '4288298', 1, 2, 'App\\Models\\User', '2024-12-02 22:33:11', '2024-12-02 22:33:11'),
(2, '1733178833212711.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733178833212711.jpg', 'image/jpeg', '1086876', 1, 3, 'App\\Models\\User', '2024-12-02 22:33:53', '2024-12-02 22:33:53'),
(3, '1733259026623180.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733259026623180.jpg', 'image/jpeg', '659943', 1, 8, 'App\\Models\\User', '2024-12-03 20:50:26', '2024-12-03 20:50:26'),
(4, '1733259156623180.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733259156623180.jpg', 'image/jpeg', '659943', 1, 9, 'App\\Models\\User', '2024-12-03 20:52:36', '2024-12-03 20:52:36'),
(5, '1733259323623180.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733259323623180.jpg', 'image/jpeg', '659943', 1, 10, 'App\\Models\\User', '2024-12-03 20:55:23', '2024-12-03 20:55:23'),
(6, '1733259468212655.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733259468212655.jpg', 'image/jpeg', '4757054', 1, 11, 'App\\Models\\User', '2024-12-03 20:57:48', '2024-12-03 20:57:48'),
(7, '1733259656310500.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733259656310500.jpg', 'image/jpeg', '10281741', 1, 12, 'App\\Models\\User', '2024-12-03 21:00:56', '2024-12-03 21:00:56'),
(8, '1733259839128914.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733259839128914.jpg', 'image/jpeg', '6977437', 1, 13, 'App\\Models\\User', '2024-12-03 21:03:59', '2024-12-03 21:03:59'),
(9, '173325989838206.jpg', 'http://127.0.0.1:8000/public/attachments/user/173325989838206.jpg', 'image/jpeg', '9747548', 1, 14, 'App\\Models\\User', '2024-12-03 21:04:58', '2024-12-03 21:04:58'),
(10, '1733259972281835.jpg', 'http://127.0.0.1:8000/public/attachments/user/1733259972281835.jpg', 'image/jpeg', '5126159', 1, 15, 'App\\Models\\User', '2024-12-03 21:06:12', '2024-12-03 21:06:12');

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
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_07_20_000002_create_password_resets_table', 1),
(3, '2024_07_20_000003_create_failed_jobs_table', 1),
(4, '2024_07_20_000004_create_permission_tables', 1),
(5, '2024_07_20_000006_create_users_table', 1),
(6, '2024_07_20_000007_create_media_table', 1),
(7, '2024_07_20_660329_create_tasks_table', 1);

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
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 10),
(3, 'App\\Models\\User', 11),
(3, 'App\\Models\\User', 12),
(3, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 14),
(3, 'App\\Models\\User', 15);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'صلاحيات المستخدمين', 'web', '2024-12-02 22:31:03', '2024-12-02 22:31:03'),
(2, 'عرض المستخدمين', 'web', '2024-12-02 22:31:03', '2024-12-02 22:31:03'),
(3, 'إضافة المستخدمين', 'web', '2024-12-02 22:31:03', '2024-12-02 22:31:03'),
(4, 'تعديل المستخدمين', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(5, 'حذف المستخدمين', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(6, 'تغيير حالة المستخدمين', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(7, 'عرض الصلاحيات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(8, 'إضافة الصلاحيات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(9, 'تعديل الصلاحيات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(10, 'حذف الصلاحيات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(11, 'عرض المهمات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(12, 'إضافة المهمات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(13, 'تعديل المهمات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(14, 'حذف المهمات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(15, 'تكليف المهمات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04'),
(16, 'تغيير حالة المهمات', 'web', '2024-12-02 22:31:04', '2024-12-02 22:31:04');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Admin', 'web', '2024-12-02 22:31:05', '2024-12-02 22:31:05'),
(2, 'Manager', 'web', '2024-12-02 22:31:06', '2024-12-02 22:31:06'),
(3, 'User', 'web', '2024-12-02 22:31:06', '2024-12-02 22:31:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(13, 1),
(13, 2),
(14, 1),
(15, 1),
(15, 2),
(16, 1),
(16, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('pending','in-progress','completed') DEFAULT 'pending',
  `priority` enum('low','medium','high') DEFAULT 'low',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `status`, `priority`, `user_id`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 'Lev Mcclure', 'Excepturi tempor at', 'pending', 'low', 3, 1, '2024-12-02 22:43:11', '2024-12-03 22:10:36'),
(4, 'Elizabeth Melendez', 'Fuga Sint qui mole', 'pending', 'low', 3, 1, '2024-12-02 22:43:16', '2024-12-02 22:43:16'),
(5, 'Elizabeth Melendez', 'Fuga Sint qui mole', 'completed', 'high', 3, 1, '2024-12-02 22:43:16', '2024-12-02 22:43:16'),
(6, 'ddd', 'ddd', 'pending', 'low', 3, 1, '2024-12-03 22:47:58', '2024-12-03 22:47:58'),
(7, 'www', 'www', 'pending', 'low', 10, 1, '2024-12-03 22:50:18', '2024-12-03 22:50:18'),
(8, 'fff', 'ffff', 'pending', 'low', 11, 1, '2024-12-03 22:50:56', '2024-12-03 22:50:56'),
(9, 'ffff', 'ffff', 'pending', 'low', 12, 1, '2024-12-03 22:51:07', '2024-12-03 22:51:08'),
(10, 'ssss', 'ssss', 'pending', 'low', 3, 1, '2024-12-03 22:51:16', '2024-12-03 22:54:33'),
(11, 'aaa', 'aaaa', 'pending', 'low', 14, 1, '2024-12-03 22:51:32', '2024-12-03 22:51:32'),
(12, 'fff', 'fff', 'pending', 'low', 10, 1, '2024-12-03 22:51:41', '2024-12-03 22:51:41'),
(13, 'ggg', 'ggg', 'pending', 'low', 11, 1, '2024-12-03 22:51:49', '2024-12-03 22:51:49'),
(14, 'hhhh', 'hhhh', 'pending', 'low', 15, 1, '2024-12-03 22:53:12', '2024-12-03 22:53:12'),
(15, 'ddddd', 'dddddd', 'pending', 'low', 13, 1, '2024-12-03 23:07:46', '2024-12-03 23:07:46'),
(16, 'xxxx', 'xxxx', 'pending', 'medium', 12, 1, '2024-12-03 23:10:53', '2024-12-03 23:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles_name` text NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `mobile`, `password`, `roles_name`, `status`, `created_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ahmed', 'Nabil', 'ahmednassag@gmail.com', NULL, '01016856433', '$2y$10$rKZ8xNjETlou6w9XnfhlHuk8puJBm/OS0ZVDQYtl2ySd09nYzhICK', 'Admin', 1, NULL, NULL, '2024-12-02 22:31:05', '2024-12-02 22:31:05'),
(2, 'manager', 'name', 'manager@gmail.com', NULL, '01102588575', '$2y$10$20bOqN1fYloZZ5bYMFb6BuebQIMCNT/IsB3A1ysyFHW658zAO881C', 'Manager', 1, 1, NULL, '2024-12-02 22:33:11', '2024-12-02 22:33:11'),
(3, 'user', 'name', 'user@gmail.com', NULL, '01141090116', '$2y$10$0Y7HJwWwNA/j1JlLyCql3etnYjuOs2huPSHNAV672SKJQM5j8L6Ca', 'User', 1, 1, NULL, '2024-12-02 22:33:52', '2024-12-02 22:33:52'),
(10, 'aaaa', 'aaaa', 'aaaa@aaaa.aaaa', NULL, '111', '$2y$10$KyGqV9VTt.EgJZFeREHBt.RtWWGKD.DW3b.ie3PTWqssHG0gv7vm6', 'User', 1, 1, NULL, '2024-12-03 20:55:22', '2024-12-03 20:55:22'),
(11, 'bbb', 'bbb', 'bbb@bbb.bbb', NULL, '222', '$2y$10$Y8DcpizUHpwRYE5GN1bxpekchHm8V4Nvk2l5H7s4MPmSzLb2qbo6u', 'User', 1, 1, NULL, '2024-12-03 20:57:48', '2024-12-03 20:57:48'),
(12, 'ccc', 'ccc', 'ccc@ccc.ccc', NULL, '333', '$2y$10$ZwOm8jU5/0wayzI08EUOHu/RKyeoxMxNaZQ7FnxPh5E3orGoWshhO', 'User', 1, 1, NULL, '2024-12-03 21:00:55', '2024-12-03 21:00:55'),
(13, 'ddd', 'ddd', 'ddd@ddd.ddd', NULL, '444', '$2y$10$NY54gWz033dzPfferUGpLevgrMr4D5D6q20CbBRQ/o0xB8xB2SOiW', 'User', 1, 1, NULL, '2024-12-03 21:03:58', '2024-12-03 21:03:58'),
(14, 'eee', 'eee', 'eee@eee.eee', NULL, '555', '$2y$10$X8gD0XiyPPMoP6arBLU13usQnJyO1tg7UnKhUjTtRIrx/kwce5heK', 'User', 1, 1, NULL, '2024-12-03 21:04:58', '2024-12-03 21:04:58'),
(15, 'fff', 'fff', 'fff@fff.fff', NULL, '666', '$2y$10$m1cSdV4.YkwcNaWIJiWZSe8m7YrWnIMBVXGcAV5iFslXJ8uck0B.u', 'User', 1, 1, NULL, '2024-12-03 21:06:11', '2024-12-03 21:06:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_unique` (`mobile`),
  ADD KEY `users_created_by_foreign` (`created_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
