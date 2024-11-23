-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2024 at 05:25 PM
-- Server version: 10.4.11-MariaDB-log
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mss`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `phone`, `email`, `logo`, `website`, `created_at`, `updated_at`) VALUES
(12, 'Alphabet Inc u', '+123007', 'alphabet@gmail.com', 'logos/logo_6741916ccde2a6.47270483.png', 'https://abc.xyz/', '2024-11-23 08:25:16', '2024-11-23 16:06:43'),
(13, 'Apple', '1-800-007', 'apple@apple.com', 'logos/logo_674191e5478058.69436738.png', 'https://apple.com', '2024-11-23 08:27:17', '2024-11-23 08:27:17'),
(14, 'Mal Thidar', '097870077', 'meta@meta.com', 'logos/logo_6741928b528a27.95628099.png', 'https://about.meta.com/', '2024-11-23 08:30:03', '2024-11-23 08:30:03'),
(16, 'testing', '08323', 'test212@gmail.com', 'logos/logo_6741fc24134371.47136717.jpg', 'https://shineshinedev.github.io/me/', '2024-11-23 16:00:36', '2024-11-23 16:00:36');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `companies_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `profile`, `companies_id`, `created_at`, `updated_at`) VALUES
(14, 'Julian', 'julian@gmail.com', '09787796698', 'profile/profile_6741a8edb5c548.12226142.jpg', 12, '2024-11-23 09:26:22', '2024-11-23 10:05:46'),
(15, 'test update', 'tee@gmail.com', '004304', 'profile/profile_6741fbfe9bbc94.04290412.png', 14, '2024-11-23 15:59:59', '2024-11-23 16:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2023_09_25_072527_create_customers_table', 1),
(11, '2023_09_28_070647_create_products_table', 1),
(12, '2023_09_28_090856_create_property_types_table', 2),
(13, '2023_09_28_091036_create_properties_table', 2),
(14, '2023_10_02_150136_create_banners_table', 3),
(15, '2023_10_04_090142_create_f_a_q_s_table', 4),
(16, '2023_10_11_082615_create_internal_tokens_table', 5),
(17, '2023_10_12_035034_create_internal_access_lists_table', 6),
(19, '2023_10_26_134016_create_core_customers_table', 8),
(20, '2023_10_19_102752_create_device_tokens_table', 9),
(21, '2023_10_31_074947_create_request_form_types_table', 10),
(22, '2023_11_02_032226_create_product_code_lists_table', 11),
(23, '2023_11_02_045052_create_product_code_list_request_form_types_table', 12),
(24, '2023_11_02_094058_create_request_forms_table', 13),
(25, '2023_11_08_163357_create_logs_table', 14),
(26, '2023_11_13_113312_create_motor_claim_cases_table', 15),
(27, '2023_11_14_003620_create_non_motor_claim_cases_table', 16),
(28, '2023_11_24_113522_create_messagings_table', 17),
(29, '2023_12_14_120150_create_location_map_categories_table', 18),
(30, '2023_12_14_145627_create_location_maps_table', 19),
(31, '2024_01_04_225650_create_tables_table', 20),
(32, '2024_01_06_181738_create_product_categories_table', 21),
(33, '2024_01_06_181325_create_products_table', 22),
(34, '2024_01_08_232239_create_stocks_table', 23),
(35, '2024_01_11_170239_create_tests_table', 24),
(36, '2024_01_11_182410_create_employees_table', 25),
(37, '2024_01_11_231620_create_payments_table', 26),
(38, '2024_01_15_192631_create_orders_table', 27),
(39, '2024_01_17_001650_create_order_items_table', 28),
(40, '2024_02_04_125311_create_transactions_table', 29),
(41, '2024_11_23_023133_create_companies_table', 30),
(42, '2024_11_23_031317_create_employees_table', 31);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00161692d3044c9533cf36abacf5ab25defb04602b859039f5d16997cf09d0852a09fb2d13d51374', 47, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-01 08:48:49', '2023-12-01 08:48:49', '2023-12-03 15:18:49'),
('00d6c173cf9d61d35df404ee291ef1814f880feefd19f515be7084f47ae213c6d00e0765e728acac', 70, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 07:54:58', '2023-12-21 07:54:58', '2023-12-23 14:24:58'),
('00f074f016907637b4e0d513e96011148f85d7a9510204ddfd38bdd9b6eee0db6742a32e5c535447', 28, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 11:07:41', '2023-10-26 11:07:41', '2023-10-28 17:37:41'),
('015b695dd35a19de3615ed0486f9bd4fa7e7976b872eac2cb03217745141cfc2a05ba2198f97ab81', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-28 05:22:16', '2023-12-28 05:22:16', '2023-12-30 11:52:16'),
('0166fd53afb9c9936840516801a6b1e1446717436eeed33dc53197b49e91e1040116b37dedab99bc', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-13 03:48:45', '2023-10-13 03:48:45', '2023-10-15 10:18:45'),
('01db626ff24b943070ea0645a60c67524bebbd6df23b0c50da79a60eb226856ed1b745ca32e146ab', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 21:15:57', '2024-11-22 21:15:57', '2024-11-25 03:45:57'),
('01f3c978febea9756805618f92dc943bbb44329d99dc6b9fcb36eb3440d6c50afd7aa3cd9ac5999e', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:17:39', '2023-12-20 09:17:39', '2023-12-22 15:47:39'),
('02fbb1d98bdeab49015f6fc0e96d46ea6415c01abc842a841c53af16a22420bb4b19478f6b60fbe3', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-10-26 09:30:04', '2023-10-26 09:30:04', '2023-10-28 16:00:04'),
('0399e95c64a1949025c4b30e856cad0d5a62d0c79147a3ac9a6abe9b93ce3ce7536160dc8091a39c', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:35:36', '2023-12-28 05:35:36', '2023-12-30 12:05:36'),
('0751bff771137ff40f741a0090e72b00c7bb4822b61359d82e80a4ac4c377c27f22918a7cf558a87', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 21:58:43', '2023-10-11 21:58:43', '2024-10-12 04:28:43'),
('08b1d0eb7cf562f7d6064154da09eedcc6fae38f4ee90b9d97044b0b106ead8d827f6903a22e1f43', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:33:52', '2023-12-20 07:33:52', '2023-12-22 14:03:52'),
('0b2636e9ed1141756466c6cd395a53d388aa6cd3fbbe30e129a8fe9589b31fe30778e4e5d02d3d4f', 26, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 09:25:44', '2023-10-26 09:25:44', '2023-10-28 15:55:44'),
('0c57a45dbdb04ad2b2aa3a5c33831303c86c22b9b9af7219929c681e011907e0108425812f491814', 6, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 10:29:06', '2024-11-23 10:29:06', '2024-11-25 16:59:06'),
('0d22817ff598c57db2586bcbc2c4372c8bf88c1e3b6cee02366afbd66689659c622fa98424a4b977', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 08:58:33', '2023-12-20 08:58:33', '2023-12-22 15:28:33'),
('0d7bd8ebee5d5d0352748e1fea89c511ccbf08597e52a03a610f49d215cf5230d71fa47db83f3e59', 17, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 07:44:26', '2023-10-26 07:44:26', '2023-10-28 14:14:26'),
('0d8ae3f3de2cea0128edf13eddef5e310e38981a704adc2f3b50b7ae5e46ccad7a36d9772adacc39', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:24:47', '2023-12-21 08:24:47', '2023-12-23 14:54:47'),
('0dab1eb6f1f0e60e8c85351cdbe09423dfe7c7926db50e8bd7b82d7a1da0204e251c5602dd75dd06', 75, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:03:07', '2023-12-21 08:03:07', '2023-12-23 14:33:07'),
('0f03f6134954d0bb2f4857af3f297a56baa04b3d398561ba3c1a4fc88023713da40f990b6a1c9e0c', 7, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:11:47', '2023-10-26 02:11:47', '2023-10-28 08:41:47'),
('0f9cf4a404404fde3fd9df98beedde3295296a8c5402c5d5ab04d8565329efdd3be0fc25bf529fd8', 47, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-05 08:59:33', '2023-12-05 08:59:33', '2023-12-07 15:29:33'),
('101592931a802cf20ac4da8a3c16a3105869bb117b0be601eb1066dce33b283f3a98e5fa633f3108', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:25:42', '2023-10-11 22:25:42', '2024-10-12 04:55:42'),
('108c5eda23df2e8f244093e14fac737d5e85233a9b80b121d92ae657cebc1f22efdd989b14c649aa', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:31:03', '2023-10-11 22:31:03', '2024-10-12 05:01:03'),
('10b6c6a25af07f37d6b4b91ad5fe47c45ba9cbcb37afe6b8005037596964078c3c56f9fccbdb94a5', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:26:23', '2023-12-21 08:26:23', '2023-12-23 14:56:23'),
('10e01ca7c18c87ff95b972706692e7d274da951303db9915796f67047fad56ad41ea39cd648543fc', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:36:35', '2023-12-28 05:36:35', '2023-12-30 12:06:35'),
('114fb8e3e64abc4755174385b0d1abb69da6ba54d2d009e727fc55dbed96dd20e3b00f72179037af', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 23:04:03', '2023-10-11 23:04:03', '2023-11-11 05:34:03'),
('1223edfd5c4d3bbbe4c9b6f49b2458722f4472b18b75c392c188e6b54c4487da95128a81ec61b7ad', 27, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-11-23 19:20:00', '2023-11-23 19:20:00', '2023-11-26 01:50:00'),
('139ec41832238b7a24379759afa38d824d95255986c339f8044160428d959ec4358a4746ab19cde8', 71, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 07:55:41', '2023-12-21 07:55:41', '2023-12-23 14:25:41'),
('149d521e89d09cc2fd225777cccbd445677301cf3edaa17ceaf8062b65e6ed64aa9c1824af0c06df', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:33:59', '2023-12-21 08:33:59', '2023-12-23 15:03:59'),
('15f33ec4c33fb771243fea28f63cea0a2fe27aa07e4ae724ba6646a2145fae305d075f7dcd14ef6d', 10, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 11:13:57', '2024-11-23 11:13:57', '2024-11-25 17:43:57'),
('166f7571a3cf200f6b087fb5130b83e84737fe249d3b9d491646b613d47a026b8522431ef3c6ef29', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 21:59:08', '2023-10-11 21:59:08', '2024-10-12 04:29:08'),
('175770c0a4cdb6372f93fc8339eca430fd2d0eb1417c4c5e94cbc72539083b12463b07ca16ac7f19', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:11:00', '2023-12-20 05:11:00', '2023-12-22 11:41:00'),
('1b6c5225c11405fd473d130efad73b51b55ec78f6028eb6d1e49acd7c805c9f8d3f1bd83ec308c39', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:37:56', '2023-10-11 22:37:56', '2024-10-12 05:07:56'),
('1b7e6ab142a112c6884fff7a350cd0b3f2f86c602ea32864998774870b1702e6ff6a5e90b43ec911', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 17:34:41', '2024-01-01 17:34:41', '2024-01-04 00:04:41'),
('1ba662612dd7f581a93b228f753d6d928b8d0356c1ce60bf0289bc9efd9135d3febdc1a5495aef24', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 06:49:34', '2024-11-23 06:49:34', '2024-11-25 13:19:34'),
('1c4f41c104424662d8e384cc7efb2ac99e30230f2ccfcedc8db581dd0a37baffc5e754a7d7d60bf5', 13, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:52:39', '2023-10-26 02:52:39', '2023-10-28 09:22:39'),
('1c8d8cdbeaffd9d4b981347003bf35a39871586d88d120aacac394ca2975a85509903f95a6d8fd9f', 80, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 04:55:46', '2023-12-22 04:55:46', '2023-12-24 11:25:46'),
('1e3941ec712182f601fdec55f81a88e59f6cd5d3418b6bf1758b952e1136550e03403fea81e82128', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-28 06:24:31', '2023-12-28 06:24:31', '2023-12-30 12:54:31'),
('21f02ed7c5235b5f6d6879dbef19663a232c745e52c3c210aa84c516ac2753bd48c6223d4a42b2ef', 83, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 05:06:20', '2023-12-22 05:06:20', '2023-12-24 11:36:20'),
('22ae3193746923bd20972082868a8b155b4a1b0042661a0b3fe03b190da344c1a1db68c00c2b0798', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-28 05:22:27', '2023-12-28 05:22:27', '2023-12-30 11:52:27'),
('22b9439e0454bf1f4686f3d1b747029ba3148bc98ea5e7fd450b5a3b2394c281643be9b6baa59a77', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:33:59', '2023-10-11 22:33:59', '2024-10-12 05:03:59'),
('2530e7def85a4f3b506f835a673b39d77dde5ccb9714bdfb65896694a2aa67267b282b83385d082a', 20, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 08:03:34', '2023-10-26 08:03:34', '2023-10-28 14:33:34'),
('273fdc65473726b44120761050044a86cd4c9bb3b7dec59d342eb2d90508dfcc813b5bfd71e3b5be', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 17:30:10', '2024-01-01 17:30:10', '2024-01-04 00:00:10'),
('27565fb34a8f51eac4b2a36eea882f5c01fa5a02b26ebc616c08c60d5b3480b9c2cfb696739e9d8b', 77, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:04:47', '2023-12-21 08:04:47', '2023-12-23 14:34:47'),
('279656e1b3204f5939bfb61048e549940e7819cfc98198d805e94a12825f137c7d58db281dfa58ac', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:37:31', '2023-12-20 07:37:31', '2023-12-22 14:07:31'),
('27ff291091bee43ffc709770e3ff29100930d0e76160e68423e19c7b72d0f07ad956d4759945b2d4', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-10-18 02:09:55', '2023-10-18 02:09:55', '2023-10-20 08:39:55'),
('2a123f7acfe7fda38b1973cd899c8c57ab5f1d067d620b956314c6526d1168eb8fc0e26edc932275', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:33:47', '2023-10-11 22:33:47', '2024-10-12 05:03:47'),
('2a5a405fddc9522f10b25abcd672343a082217ca1f4747bd8f08cef232be4054377e1c244b503b7c', 82, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 05:04:50', '2023-12-22 05:04:50', '2023-12-24 11:34:50'),
('2ab48bcf01b87d168e8b577eb63b4aec153d4f1db2838fcf1875bb40bad2d49cb1f246192b50bd00', 79, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 04:45:00', '2023-12-22 04:45:00', '2023-12-24 11:15:00'),
('2afaa1e685b08e9cf9a4d4236dacd49736892cd0fb26c6218bfae82757d8eaaef7c7c551b94b14c8', 86, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:32:59', '2023-12-28 05:32:59', '2023-12-30 12:02:59'),
('2b1055ec0720c6ba0b41dcff01f62d4f469114fc7c5be37a653db87103ccb76bc1fb5f3dff078984', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 12:27:12', '2024-11-23 12:27:12', '2024-11-25 18:57:12'),
('2d926fc795a5c07d2969bf5db293faa20badc36dffdc323387b4003a4011b0f5e4b7e91cade18951', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:42:05', '2023-12-28 05:42:05', '2023-12-30 12:12:05'),
('2da0da093326fb37b64dec98211180f83935c074e3c847be60109a4621e1b921e914ce3df7cd81e8', 56, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-15 04:21:22', '2023-12-15 04:21:22', '2023-12-17 10:51:22'),
('2f02bbe6b51681e66ae865de82ff3bae0d07e95de597a37588c2f1141c4cb108ef0e6323bb93d306', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-15 07:57:24', '2023-12-15 07:57:24', '2023-12-17 14:27:24'),
('307b169b55c91e0f688a1fefa6595a5ddb06afb2c0365899cf02882c9dbf62765fc2bf9df65fbfb8', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:36:04', '2023-12-21 08:36:04', '2023-12-23 15:06:04'),
('3201419ee1655ebc27522cbfccc40c09fe7cd47b79a1b54977cda926921ab031fc1094914a5dbae7', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:34:53', '2023-12-20 07:34:53', '2023-12-22 14:04:53'),
('326f741a73fac319388e24e32c39b862641a00bdd6514dd6b5ea3e023381dfb36775ff24fad75511', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 16:24:57', '2024-01-01 16:24:57', '2024-01-03 22:54:57'),
('327138c2e288bd466eb2bb9981dc558508b91c4927b6ea876850eb39a715c8b9af73dcba5dc9232b', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 21:09:00', '2024-11-22 21:09:00', '2024-11-25 03:39:00'),
('330e1ab9c55bbc759080f21d317916bd2f89c937be9dabf00f87dac080a0a6c1913ab21041252cda', 22, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 08:36:12', '2023-10-26 08:36:12', '2023-10-28 15:06:12'),
('331b30a81e6f00b4146263e70841a7bb76ba3112857eeb5d2398d4d734f892672f85b3c15ac83490', 4, '9a595b34-f73b-425c-b371-807407f9d575', 'CustomerToken', '[]', 0, '2023-10-11 22:14:11', '2023-10-11 22:14:11', '2024-10-12 04:44:11'),
('33eabbf73452590f4b11e3a4b5ac69254b5393d06b45b1584ff4880a4f22e23c5bede4627bcd9ffa', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:29:47', '2023-12-20 09:29:47', '2023-12-22 15:59:47'),
('33f565f642145d19fff83f675e078eea0d9fdd1e47fc05cde39462d6727902ed80785bcc1dbdd505', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:39:31', '2023-12-28 05:39:31', '2023-12-30 12:09:31'),
('3589c66e56198750cde2e5521030065ea982d6264f73eb7a1a218a02b118c6012ea7af1443c77c72', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 15:58:41', '2024-11-23 15:58:41', '2024-11-25 22:28:41'),
('35b17dd238456d0559454dcaebc9c840d5b4856ea4f57e3c7c910f15aa49e7e1dbe20d22c4a02a30', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:38:40', '2023-12-20 07:38:40', '2023-12-22 14:08:40'),
('35c0d7137336505a8b58047846b208f1ce3d5ec240d29a9ca0ad3cc34e7878a259186a89f0b3813b', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:37:27', '2023-12-28 05:37:27', '2023-12-30 12:07:27'),
('372fa50aa0282a0178d4747881e301afb02a8cd2cbf7de828aa6360c16bc5a0da59503f3326cccca', 20, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 07:54:03', '2023-10-26 07:54:03', '2023-10-28 14:24:03'),
('3afd03d99f7d3607b920e6dce4d52ab92916cf4eca48ea5351ded030218c58021d7bcbcd8821de43', 11, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:14:05', '2023-10-26 02:14:05', '2023-10-28 08:44:05'),
('3b02b1f775be1e1941591a3cadf6ff517292bd1b548a1321000cc8c23eb994d36c9b162659e46382', 85, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:31:46', '2023-12-28 05:31:46', '2023-12-30 12:01:46'),
('3c0175e25c439dd5819510c567176c5b9c83d7503dd1491e62e5229a08713e4480cdcfcd5dd6433f', 23, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 08:37:18', '2023-10-26 08:37:18', '2023-10-28 15:07:18'),
('3cacd29cd64559874df5e3fed57c1135db6e70e6a808a80e03246347309cb0a9c0f81e8d6abfe7cc', 10, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 11:13:38', '2024-11-23 11:13:38', '2024-11-25 17:43:38'),
('3f79d7a3afaba8f526215e025b85870ac902ed060ed950116aa39938b730d22cdc7dce73e1886548', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:37:06', '2023-12-20 07:37:06', '2023-12-22 14:07:06'),
('4118c8f7b5b77c03a5056df21912305da863205d7a6f26d15e110435221dd47c92db8f96836a4735', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:33:38', '2023-12-20 07:33:38', '2023-12-22 14:03:38'),
('414b39b44af60b78554c197351a3301b3a9caf51df8ca669bcc0861a150e7e8198df2089e54ede9f', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 13:33:37', '2024-01-01 13:33:37', '2024-01-03 20:03:37'),
('419489e7cbee7548fa94821a598fd18e99ab7d042542e43a538cca044fd2cb846100d375d15dd938', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 21:59:25', '2023-10-11 21:59:25', '2024-10-12 04:29:25'),
('48169e97d0d5300d5572aa750d45377c353e1d3016a1da14e018b67845a227ee9c6a9a6a69ecbaec', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:43:13', '2023-10-11 22:43:13', '2024-10-12 05:13:13'),
('481ff806fe7a1dee930ebb562a4b50b25b31def42ade77d86520957dd0311afc420bac2def52e8f0', 67, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:05:48', '2023-12-20 09:05:48', '2023-12-22 15:35:48'),
('4850580a84e6dc0ecb428a1b0fca6d56d8a64bd47a2ee3879ac3d816dc9484d80e264a4f87b80c05', 27, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-11-23 19:20:20', '2023-11-23 19:20:20', '2023-11-26 01:50:20'),
('4881ee98af6efdf917d5b8e916ce4eba8218f212a63eaf2fdd4c4b4afb428755d5d3256f0b2a5fb3', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:12:58', '2023-12-21 08:12:58', '2023-12-23 14:42:58'),
('48e49c06c56028ac73d61ea465f4b58e890c4a0564b0b3fb2e8dee81acda571167c646c96ac3a34f', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:06:35', '2023-12-20 09:06:35', '2023-12-22 15:36:35'),
('498dee4194bdaba596ecff4be5bfd3300c2ae881b40627d48b6dc10599d8f7472e048f2edd218115', 30, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-11-23 19:14:59', '2023-11-23 19:14:59', '2023-11-26 01:44:59'),
('49bbb53c66b6c18d85bf59042b28e12c06eb475ac82853cc144a6151eb8838aa1c0eef85664657e2', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:37:17', '2023-12-20 07:37:17', '2023-12-22 14:07:17'),
('4b73fbc50e637e5a8372ccb53e9c3a4e0b55fc09badf1a932d807e58bc2d6aad69bb1e42c3127f2b', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-28 05:22:01', '2023-12-28 05:22:01', '2023-12-30 11:52:01'),
('4c7e932cba7828ba84aba08d58e3bb4b20b8749900b6e423d406f903f93afafd9de9dd5c897259ea', 21, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 08:34:37', '2023-10-26 08:34:37', '2023-10-28 15:04:37'),
('4d87f283769e56cd129634eaa4ff8fe4509ccf026f0678cb77c60a22ec72590258e27ab3dac07461', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-10-26 08:15:16', '2023-10-26 08:15:16', '2023-10-28 14:45:16'),
('4dae677b162ebded67a26b6bc1decbcfbc51f466f156d4c6fbdae786b5bfdea2978e987352a1d0f6', 72, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 07:57:02', '2023-12-21 07:57:02', '2023-12-23 14:27:02'),
('4e54a73612aca2b9a40367c2b478324306121f561c3cd873e2fdcd1fe397a9b0a575e9ba2d5f536a', 3, '9a595b34-f73b-425c-b371-807407f9d575', 'admin_api', '[]', 0, '2023-10-15 09:33:29', '2023-10-15 09:33:29', '2023-10-17 16:03:29'),
('4e7b8f40215c01783f30f49a1f79c9394a272a6f6c706f147e21009454c35a4e5a6f2cc716dbaf07', 68, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:30:17', '2023-12-20 09:30:17', '2023-12-22 16:00:17'),
('4e8d41eaf3f11d66cd7e05992eafc0bdd664eb2df7f762cfb4d69c1a2c026404144ee780938da6a6', 74, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:02:41', '2023-12-21 08:02:41', '2023-12-23 14:32:41'),
('50747fbe0f865931de9285314bf2964d7502db037eae93f5d46c41cccac5b775f2ef49ba4b993881', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-28 05:22:39', '2023-12-28 05:22:39', '2023-12-30 11:52:39'),
('543cf201a76318d427c26f306b55a5119ceb18005ddeaba6590f6407e6d571d51044c7017eb7d530', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:01:10', '2023-12-20 09:01:10', '2023-12-22 15:31:10'),
('54b2beb396fd51009b872383177e2cd29ee59e17b8c48bd5281ec93163e4ebe38e1b586307be638a', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:09:03', '2023-12-20 09:09:03', '2023-12-22 15:39:03'),
('5a72d9c3421e16475d1e2e4f9a30b1369f2c8b554f29ff3a9df67bfec1a4af3257f254430649fa11', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 10:12:06', '2024-11-23 10:12:06', '2024-11-25 16:42:06'),
('5b62bc5189a59d3c613a91e2fac6d75dbffce04196162c9c443b55a67e5a600c2204498aea80f64c', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:38:11', '2023-10-11 22:38:11', '2024-10-12 05:08:11'),
('5bc879b59b3deb67d978906b9b78f8863f4fa4c22074bca10926932150352233625dc6f0e1652d39', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:12:08', '2023-12-20 09:12:08', '2023-12-22 15:42:08'),
('5d65b9e18bc76b5ffcc28d40b5fcd588e4d93e9987a1af9700a70ff3e14512beeaf40f1c3e2b93bc', 65, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:04:30', '2023-12-20 09:04:30', '2023-12-22 15:34:30'),
('5e626859b9c08cc09d4de3813675381616753a61c7c982b98021c9d4a00d16f0c2726cdf8ae555ed', 24, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 09:06:44', '2023-10-26 09:06:44', '2023-10-28 15:36:44'),
('6060c287934ea7141fc709474f0afeee05d1748cf0c2bb8096dda0dc3f30849d081eee8ac46e2fe2', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 22:01:39', '2023-10-11 22:01:39', '2024-10-12 04:31:39'),
('612d6a25876bf61959e02ba0559255abf87c8aebdc22647a7b11b6be7bd2fbba0257a983f0cce397', 29, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-11-22 07:44:31', '2023-11-22 07:44:31', '2023-11-24 14:14:31'),
('637ff8ad038c2d833811f3b344cf8adf5363e76841ee050834698dcdac011ac521db26da0556e2ba', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:16:26', '2023-12-21 08:16:26', '2023-12-23 14:46:26'),
('64b0f9268bc3678a8dfa48bd8e68349acf4d6a18ecbae6001446bf862a8be90046e9a34f1547e269', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 22:09:17', '2023-10-11 22:09:17', '2024-10-12 04:39:17'),
('650f9c944481c0d18f27daf7a969b451870915de44374307878f0660725b7bb91d0340ac2c7fe323', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:35:59', '2023-12-28 05:35:59', '2023-12-30 12:05:59'),
('65fb4ab45cc4d4f7afad713e7f7a88b705666285b067156031001962f2c49fcde1cdbe0a5c3825eb', 19, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 07:52:24', '2023-10-26 07:52:24', '2023-10-28 14:22:24'),
('66001103d5e078ddc4e62c23d271e7d97abdd9c204a8b83705ba0e1b6acd48f5b384c46e93f59227', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:29:56', '2023-12-20 09:29:56', '2023-12-22 15:59:56'),
('665756869144df8ff3b1e9fdcf6afa07cb3bb1f1d450b613414f104cd01c41b4902825608ff311ec', 5, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 10:28:35', '2024-11-23 10:28:35', '2024-11-25 16:58:35'),
('68579c7575d0fe12e9aa7e2137d0fb4ba557a1621da6808195c7b2d7e5c3f44c56a82d768cdbcb8b', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:14:17', '2023-10-11 22:14:17', '2024-10-12 04:44:17'),
('6893dee48806fcf2f8fe3baacde8b3c29b03dd1c18c604bca5dd370ad0aee8eb7e66dfaf88cb7acc', 9, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:12:55', '2023-10-26 02:12:55', '2023-10-28 08:42:55'),
('69bac4133af8f5140a82273af732cd185c80b3abde909188f61f9cdd94f7bd1f7d51992ba37c6223', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 23:06:07', '2023-10-11 23:06:07', '2023-10-14 05:36:07'),
('6ab380f7a098eb0da85f44d6a09510724c6ccb023320c37f10dd8c5237fdbd5030d6371f4c47a968', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:43:39', '2023-10-11 22:43:39', '2024-10-12 05:13:39'),
('6dc3b6e48fa894464d2fc7516da235a19e44935085ab73fd493f89a9bdb87b60641440bbd6958809', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:15:26', '2023-10-11 22:15:26', '2024-10-12 04:45:26'),
('6de52567b5385514bfcb17ad5dbac94bbffdc068acae9e55dcceec1bd9f4291bd9daa0d22ea73133', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 19:38:48', '2024-11-22 19:38:48', '2024-11-25 02:08:48'),
('6ec7b698aa12f10bd4e91940144be66110ac119b753d44cb50cead0feffa169960d5131167dc9742', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:03:24', '2023-12-20 05:03:24', '2023-12-22 11:33:24'),
('6ee1074c14ea7372ffdaeb1cedd1cd2b1d787ca90b936c927e14e263df86285b2ba8468436cabd62', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 17:37:17', '2024-01-01 17:37:17', '2024-01-04 00:07:17'),
('6f79f8aa57bc047b7e8adfbc11658c9ba0bbbe15b2deb8698706ee7d1fd9b66ce2f385920e97c428', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 10:12:44', '2024-11-23 10:12:44', '2024-11-25 16:42:44'),
('7038d1e0757117f6e05c372131a6993da0a90d47e1a944cae16df4fa4e13c13eea6e9977331efb37', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:12:21', '2023-12-20 09:12:21', '2023-12-22 15:42:21'),
('704fbedbf6ffad11d1010e7b32bbf75ea9be24dd73f0cf1b1e07191a39dfda107f342069b4cdce4b', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 18:19:08', '2024-01-01 18:19:08', '2024-01-04 00:49:08'),
('71bdce3f8ae80df8a51ee55a9ec57d39f253b57de26668b748039f51181c5ef5c7ea764ae8528bec', 17, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 11:22:47', '2024-11-23 11:22:47', '2024-11-25 17:52:47'),
('71c0323f1dec82aacbf657e41a225a7a6790901ceb1ac7b7d0d8d5cd08e49605529d78dff040b0b7', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:29:36', '2023-10-11 22:29:36', '2024-10-12 04:59:36'),
('7473c941d8f3d2a8de7326a3cba1008e32587fe2b5183b8a0bc5664b4e1a4ac381cf7fa49b68989b', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:05:51', '2023-12-21 08:05:51', '2023-12-23 14:35:51'),
('74b69e0e1c4a30dbadd38221996f1ebf39ee6f15c614c9c91f87d4f20442d09c3cf6dcfb6c7c1f3b', 76, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:03:44', '2023-12-21 08:03:44', '2023-12-23 14:33:44'),
('75659270af0c9990f1c262c66c85001c7bd2143ca4d9a911d1b01826441fea3b997286d7e9f981f4', 13, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:17:55', '2023-10-26 02:17:55', '2023-10-28 08:47:55'),
('75bb0472af829186d8c881606e4f4acf89de4d5102ae61bae2b18106ae11b4d4fb596acfe012ffce', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-10-26 08:07:09', '2023-10-26 08:07:09', '2023-10-28 14:37:09'),
('75e00c20d5fe9457c812c213ab61c6639bb509106453c9eec52ec7c916e71065ec72eaf7084cec24', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:15:05', '2023-12-20 09:15:05', '2023-12-22 15:45:05'),
('784a0be8153fd193bc1f5bb641f470ebc9fd46523cefac54a0f23927c06a558feeaa3f4204008cbf', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 21:50:35', '2023-10-11 21:50:35', '2024-10-12 04:20:35'),
('79ebd7b55b882ab6b22fc342c6b11c7e42ac19d3258b28b6fbe1cdb2b234c6325b03a6fe4ece1c93', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 06:49:31', '2024-11-23 06:49:31', '2024-11-25 13:19:31'),
('7c01ad239bc7f6cf204ecc9fd45e299c988952abdbe1c0f1695069e8398eeb3fedf831fded472ff3', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 15:12:49', '2024-11-23 15:12:49', '2024-11-25 21:42:49'),
('7d24fb5edf828581c88667efccd5d68d06b22a214d8250c436c99762b5963058cbdb4bc3adb644b2', 8, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:12:36', '2023-10-26 02:12:36', '2023-10-28 08:42:36'),
('8175e4860fbf2d1e3457d47e35f7b658e628b9c6461c8ba2dff023417972f6892940ed2172b3b699', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-15 09:48:02', '2023-10-15 09:48:02', '2023-10-17 16:18:02'),
('82601d58a82e029f7748806ce014b63ebf844563b23ad705410135d40437a3962474aae0482ab2a1', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 19:39:17', '2024-11-22 19:39:17', '2024-11-25 02:09:17'),
('8263e50331f93bd0f429be702174cc9359f2f4df09be9a7b65a033335d55dc3da55ef058388ce0e8', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:13:37', '2023-12-20 05:13:37', '2023-12-22 11:43:37'),
('8280621a0d297605f96fa0ae9bf79dac3dbc1aec89eb488f033fa1ce6f3f52ab7e4845c811c36388', 3, '9a595b34-f73b-425c-b371-807407f9d575', 'admin_api', '[]', 0, '2023-10-15 09:32:59', '2023-10-15 09:32:59', '2023-10-17 16:02:59'),
('858f891df80135fa3242ac9d33f97dbcadc44327c36d8eacf6a26bfb1680fbe6b3a85813e8a2c3ff', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:00:54', '2023-12-20 09:00:54', '2023-12-22 15:30:54'),
('86c54aca97b8da427b6ab54a2a1f96849b93db1b0ce2ce546f6c1e9ef1786f6727b250a63f1f5c33', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 15:12:47', '2024-11-23 15:12:47', '2024-11-25 21:42:47'),
('883e15dd36e87faef2cae7a795696e85712eea4d7747c26649f9f29aa856616ca16962816969becf', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:31:26', '2023-12-21 08:31:26', '2023-12-23 15:01:26'),
('8988b1ac535566dbdfd4bfec824f24a1291b77001fa75006d4f5fe70a501ece1252d147b32d12b12', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:13:30', '2023-10-11 22:13:30', '2024-10-12 04:43:30'),
('8b3e2a2f1825b27928180598a4fed19fd50b0069cffd0dc3a4208685b34e17c9802afd6df2bd0ccf', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:38:35', '2023-12-28 05:38:35', '2023-12-30 12:08:35'),
('8c6b3bfc1ff594b0f8b759997149c453d2297cb1c555cc3acc84598cb8bbebf76a18ad770157cc8f', 85, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-26 08:24:50', '2023-12-26 08:24:50', '2023-12-28 14:54:50'),
('8ca97ac0e94d2f834a1aed2e9abcef39e2609279421a9d6de93eb51a672d484c1e03e33c92ee6b51', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 06:49:34', '2024-11-23 06:49:34', '2024-11-25 13:19:34'),
('8ed78a6ca6e8dede6040453177ff8255e68cb9f86bccfabe11f437c9efbc6deda1a79106bce3a0e7', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-10-26 08:18:24', '2023-10-26 08:18:24', '2023-10-28 14:48:24'),
('90904f2adb0101ef3bc07d3cc29ea914ff4dea2ecf8543a31c1aa581a0e3e1040441d9e69f0865ee', 14, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 06:55:13', '2023-10-26 06:55:13', '2023-10-28 13:25:13'),
('90c8b5626f6cc544cb0d7a374d9c4824925dab36d62c40198108a2d3aaada4fc11fb86488dd7f622', 25, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 09:12:41', '2023-10-26 09:12:41', '2023-10-28 15:42:41'),
('93017213d5d7a4873320c98a910491737443fb1c6738ca9ff8e5af37ce2eab97c31fe0838b09dd11', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-13 03:46:31', '2023-10-13 03:46:31', '2023-10-15 10:16:31'),
('9560c35b8e2ba64d67057309264dd85ca416f8a1cec75165161fabdb171815bf8ddf0312e497e28d', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 15:45:13', '2024-11-23 15:45:13', '2024-11-25 22:15:13'),
('95d322e67fdaed2a7a770f3424cb4d2f323bb3dd89cb716cab161e14fcba86e92b515fe3360c5361', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-12 20:21:10', '2023-10-12 20:21:10', '2023-10-15 02:51:10'),
('97df88c40d5459726198c199af857a5bc80bc46162454e87d20978ebe48a00ee9d5e66e292e23ea4', 84, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 05:08:55', '2023-12-22 05:08:55', '2023-12-24 11:38:55'),
('97ef1df5d5b2af8f31fde5f48a204fe755212f9597633d9e9318aaa79b5b317e773b667f54acb6c0', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-28 05:21:33', '2023-12-28 05:21:33', '2023-12-30 11:51:33'),
('9a6e00737c9d083384829c27a02e6780e191f5080729645929fb6cf20b10624f82838d2c3374fc7f', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:32:28', '2023-12-20 05:32:28', '2023-12-22 12:02:28'),
('9bcb3b5559e33b7c9f32b8cd2ce9dba06dcd03ba4cd20749dad9e0f4b4afbd28ab062e02cb976aef', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 22:00:57', '2023-10-11 22:00:57', '2024-10-12 04:30:57'),
('9c1ca608f8ddf5ebc4b426afa4a0c5708fef43e7a4347f914511b27fef41b65cec589494306cde7f', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-12-28 06:23:39', '2023-12-28 06:23:39', '2023-12-30 12:53:39'),
('9c4c2cc92d5d8670a7e5e87c1045a9d39d2ba3c812fc269210a1d9d1b9c0710718939398210b61e2', 66, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:05:04', '2023-12-20 09:05:04', '2023-12-22 15:35:04'),
('9d2498c22e84fbd0c2a28d07f726ace47be1063e15769858212ddee731d713f7bd066031f6b18eae', 31, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-11-23 19:25:26', '2023-11-23 19:25:26', '2023-11-26 01:55:26'),
('9db0fd2e7df8610169865dc88badbd833eb8a896b22a978f79580ebfd9e6cee21b683c8d9b8adc61', 69, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 05:56:24', '2023-12-21 05:56:24', '2023-12-23 12:26:24'),
('a1a790b95e62efa9510820422aa24627716bfaa5d79ff6bbd30d13691c9721d1afdba5374688dd49', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 21:50:51', '2023-10-11 21:50:51', '2024-10-12 04:20:51'),
('a2549bda164c7b74e2e2d0616c3023ce608d7627f5032f70bd44394283978cc3d29c724972c2d2f2', 4, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 10:28:03', '2024-11-23 10:28:03', '2024-11-25 16:58:03'),
('a28b7c4a3ebb533e2b11a75fc2fd177ff107ec4d004a577acb764f2d7ba39c2db585353ab2bddd04', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:06:08', '2023-12-20 09:06:08', '2023-12-22 15:36:08'),
('a2953762d51a02962d6c8da992f20265c4dbdaed3674a15b639306175a18035a36067383816e1519', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:11:56', '2023-12-21 08:11:56', '2023-12-23 14:41:56'),
('a404838829b85329a2d3b5165928c02cda0d5bf227dd627eccf07eac86653d6b7faad53596c57512', 73, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 07:59:47', '2023-12-21 07:59:47', '2023-12-23 14:29:47'),
('a53b664bb11eaf6993552befc214766ddcd88d03707a617d4d9249e69ee9f627c0aed0d5d796f9f4', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:35:24', '2023-10-11 22:35:24', '2024-10-12 05:05:24'),
('a62b418d2aaa6bc8eaef97c7b055a252c154397f9756df3e4e868389816514ab9d3f17d7fe35defa', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:43:01', '2023-12-28 05:43:01', '2023-12-30 12:13:01'),
('a7bfcbada5c5c78830b9bc7e8c91d402bac05837d2bb1c016600acc95cc7933371292829d9f3e2ef', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 21:14:12', '2024-11-22 21:14:12', '2024-11-25 03:44:12'),
('a84d9317fe618266b29bb1cc9db0b3ea77d7054cf4bcf6d6dd76546d503a1494f2dc2f90bcdd5188', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:25:07', '2023-12-21 08:25:07', '2023-12-23 14:55:07'),
('a8ff24bf341ffaf8691d502f8b053ce11779f867284bcb847a22105d8f4772adc9be54d67c41b5bc', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:32:38', '2023-12-20 05:32:38', '2023-12-22 12:02:38'),
('a97bc537f7680f379465a116f918c8109feb062eff52893dbf0a8cb3bbb8f85589e1e52c21df3c56', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:36:34', '2023-12-20 07:36:34', '2023-12-22 14:06:34'),
('a9c143e8811c8b6a3090d3c7aa0f68503c152e01ea6f78cc1a4c9a533456c2b8db45e4dd654867af', 80, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 04:49:03', '2023-12-22 04:49:03', '2023-12-24 11:19:03'),
('aa51cdbc851669a252f413ef5779f9180c712835e8fd6be312187644b2e580ade6099c195d3512b5', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:13:32', '2023-12-21 08:13:32', '2023-12-23 14:43:32'),
('ab6cd3f9a8eaad9f3c0afe966029690d1681f0c189d36654fe76cbefdb626ec87abf5a2b464e48e5', 1, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'internal_server_api_token', '[]', 0, '2023-10-26 08:17:36', '2023-10-26 08:17:36', '2023-10-28 14:47:36'),
('ac2e2563630d0182a42890dbdcb59fed9152ad6da4abba0818f6fc0d252d1ac121968df860d3ec65', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 21:49:14', '2023-10-11 21:49:14', '2024-10-12 04:19:14'),
('b2b3f7100613e36969bb7c755a6ee16b1a8fa84dec37dc9ff9169531b9f167b2386cd4c97026915a', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:36:17', '2023-12-20 07:36:17', '2023-12-22 14:06:17'),
('b470ea542583318a6b07008ecc05350c5b2646e22546abc37317f0b2c54778fc0a2ee0bbd6dbbbaf', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-13 03:47:48', '2023-10-13 03:47:48', '2023-10-15 10:17:48'),
('b8a585eb12983bc745129f77923f4d5cbd56d5feb83794f6d5a4173126ba22bb5a392a82c76e2f42', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 10:11:36', '2024-11-23 10:11:36', '2024-11-25 16:41:36'),
('b9428e4e252f3c0fa186a05cdfbfbff7b76bf996d9a0b42656394130644146e41798e477ec131060', 27, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 11:06:56', '2023-10-26 11:06:56', '2023-10-28 17:36:56'),
('b9561b1d884b07f2cdd47eec6c15b6b6fd53dfd0f02406b1c706d630469b3a7685baa69e12a88918', 32, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-11-29 05:12:37', '2023-11-29 05:12:37', '2023-12-01 11:42:37'),
('b97bc38e3a28659ea5669f36d7e2fa89d0beb0f1c6a8645b4d601180cf272d896ab51d9d97abd6b5', 7, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 11:02:31', '2024-11-23 11:02:31', '2024-11-25 17:32:31'),
('b98f15a0e1ec072c68c88614914e1e2370d0e7dec595e64cd43d14177d6c9e6800f78b9bb0ae7314', 13, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:51:53', '2023-10-26 02:51:53', '2023-10-28 09:21:53'),
('ba353260fce167ff10259983250a897bd164b75339179f92afecba824a13b9d71ec6a4d2579d6229', 13, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:53:01', '2023-10-26 02:53:01', '2023-10-28 09:23:01'),
('bbbfafa5517a477f14ad62697cbab2ddd49b4625f4c87ff882b47473ac3002c63a1cfc6173342e60', 1, '9a5952ed-9899-43c4-b958-f98c33920aeb', 'internal_server_api_token', '[]', 0, '2023-10-11 22:11:18', '2023-10-11 22:11:18', '2024-10-12 04:41:18'),
('bc50c74633dbfea8db643e75a7aacb69b2b2cf397133326646678aa9ece90b93fccd4480f18a6be1', 10, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:13:30', '2023-10-26 02:13:30', '2023-10-28 08:43:30'),
('bccc02a9ccc0d44a56e6cdd6f671a2fe2c63c5e5b3c342f64d5408992d0ac5fcc9ca2ab8e6c601f6', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:43:28', '2023-10-11 22:43:28', '2024-10-12 05:13:28'),
('bd4ff0768c83830187cfc8707d8cfe7d87df8787835cd61634cd63b79198a0cdc810104b0ee88081', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:32:11', '2023-12-21 08:32:11', '2023-12-23 15:02:11'),
('bf7ea43fc5c833ba693a08a2ba467710a0508bb5afa575095c061ba865f8ef09edf4a617306ec09f', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:06:40', '2023-12-20 09:06:40', '2023-12-22 15:36:40'),
('bf9919a88cee4d473f97e36b8efc0c2cc8b156757460d18c755a4a435174b0c8fcb60518535edf4b', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 17:55:38', '2024-01-01 17:55:38', '2024-01-04 00:25:38'),
('bfef92b9ac305507945a40e040e739854104b06f4af9995e677b82cc8744d6f89c50907e8c27c378', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:23:35', '2023-12-21 08:23:35', '2023-12-23 14:53:35'),
('c0563d35880e73629cb95ccc1a25755a3d3a8922487d7ee91d52409b9c2656bcfeb1793257d6d268', 5, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 11:10:17', '2024-11-23 11:10:17', '2024-11-25 17:40:17'),
('c203ff0d333a69d793f521f02443e24dbee643d4c828b7c68ee635e3afd96e546e31f69453538e87', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:16:26', '2023-12-20 09:16:26', '2023-12-22 15:46:26'),
('c292654b5dfcd38c32ae060fc7e52674e50976c409a39275f80b3c3f5eb989356e449f3e1a036803', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 13:33:13', '2024-01-01 13:33:13', '2024-01-03 20:03:13'),
('c5f3b7f62c697e152437536958968df20dc5b373ae0fad10c9c508f45a4ecf7f4383e017e1a76702', 26, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 09:26:58', '2023-10-26 09:26:58', '2023-10-28 15:56:58'),
('c7ea894a6ada83ff7739c3d3011f39d6f7d6fec0c032d30f55a01f91eb9ee822af669a2b69ae5ba9', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:32:58', '2023-12-20 07:32:58', '2023-12-22 14:02:58'),
('c80782dabc2b8c86ab5040e6b5354f460a16f691d6aadd53871304499f3bc0e876319322cfb6aa8e', 87, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-28 05:35:01', '2023-12-28 05:35:01', '2023-12-30 12:05:01'),
('c82f08610fdb8ce156108e04b4151e48272b3745f8e4176653b9148aa4bfdcd82417ca9e4f4f92ec', 78, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-21 08:31:51', '2023-12-21 08:31:51', '2023-12-23 15:01:51'),
('c956199c0045f47d1d3829921b8145fbd01d747f110d586a737cfd1168a751ba53a039d80d22e46d', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:29:20', '2023-10-11 22:29:20', '2024-10-12 04:59:20'),
('ca47c94d12c2268eee3f78a37ec6f82db4bdecdc45638eae5f038fe4019b05fc45385e609fcfe319', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:09:52', '2023-12-20 05:09:52', '2023-12-22 11:39:52'),
('d19426168df0b7420bc0cac65392ccd6195fa8832229a27ba70387a101cc62645e099f9d35c96170', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-12 03:36:32', '2023-10-12 03:36:32', '2023-10-14 10:06:32'),
('d254c2e6c715872c76003b4e9307934635407d39e804c249c0fabc1b9222b0ebc44875dbc7069d51', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 15:58:39', '2024-11-23 15:58:39', '2024-11-25 22:28:39'),
('d41cc611c0447df3d2afab385882bae49c317c72d58d571795ff730bf44184fbf56ebf33d5ca0b31', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 15:57:49', '2024-11-23 15:57:49', '2024-11-25 22:27:49'),
('d4941dac950c1098eaeb3120beb5543ec81e7dcf3047f3fb6af4358f808ef825d00f66e1bb3222d9', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2024-01-01 18:24:55', '2024-01-01 18:24:55', '2024-01-04 00:54:55'),
('d5b795bc2eaa4464b3c912e603264cc558aa1368588a29e4738e4fc42c861f89f710cab74456d38d', 80, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 04:57:15', '2023-12-22 04:57:15', '2023-12-24 11:27:15'),
('d5c63b4558cbc8b02972cde67f8f6b7613b21ced7194f3a85b2e6777101d75869977c785cadce4d3', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:27:52', '2023-10-11 22:27:52', '2024-10-12 04:57:52'),
('d61c52646cb7a2e1fc920765de8cd8a3bb9acdc8462f797b086330b7e3fc95b5bacd7cab7b298692', 6, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:04:43', '2023-10-26 02:04:43', '2023-10-28 08:34:43'),
('d83835927a6f7c759e907c3ca73a1ebfccf9e177f540240db19cdbf67c5d32d72077caccdcc70f1e', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:52:34', '2023-10-11 22:52:34', '2024-10-12 05:22:34'),
('dbab27641dd3487f25630e1c5757cc5f7937a3d09ede8db5e26a8d5b55cd09e2728c89030e5b9def', 3, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'admin_api', '[]', 0, '2023-10-15 10:17:28', '2023-10-15 10:17:28', '2023-10-17 16:47:28'),
('dc13d8b8c11a0e2748c592bc85de40bd6664fa1aaffcfbb3589684129fc9069351c615cf5221db52', 16, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 15:12:49', '2024-11-23 15:12:49', '2024-11-25 21:42:49'),
('dca6945dbb44eb8fb7c511d9fff0026636f4390e3089359457ca5c7d53073b0cf8c8c080fe1b4674', 15, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 07:16:01', '2023-10-26 07:16:01', '2023-10-28 13:46:01'),
('dda024305ce7b926bfb4856563a2ad65dde9bd0472b72c44e9f99309b73687116bbb662560f98a03', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:12:46', '2023-12-20 05:12:46', '2023-12-22 11:42:46'),
('de27c0f5724e30d0a233097d8407543fa4aba9e645676a3437429d8e68a13b270fc1f576bc920c71', 81, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 05:01:55', '2023-12-22 05:01:55', '2023-12-24 11:31:55'),
('e0c87427c277a9d987fea76478cbd5c706f2a52d908077c05313b103eba381d198f6c2c5bf8e3269', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 08:57:46', '2023-12-20 08:57:46', '2023-12-22 15:27:46'),
('e21089b43338334227e5b85042c2421ac9d38b3e9ba663ddd4a6147ba6902588ed0c55e4c79b36f2', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:25:07', '2023-10-11 22:25:07', '2024-10-12 04:55:07'),
('e238d2a743e615d8aee7e5d2396a2f97b2fe14ea5d2979ec5a3cbe1ce5a8bc54feb890e5cf1eee5f', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 21:08:59', '2024-11-22 21:08:59', '2024-11-25 03:38:59'),
('e3c1668426e9228bd8317b129d0238b87e0eca275e18717195ef9592beda6db41fa619178646a64c', 62, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 05:02:47', '2023-12-20 05:02:47', '2023-12-22 11:32:47'),
('e490f271271e0265c6122b0a190a1aa95f06c226d8cea2826fcd5dd960419bd02bcb53e0a5cfa1ab', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:14:28', '2023-12-20 09:14:28', '2023-12-22 15:44:28'),
('e896591e51ec460a6661b534bd083649a2f66b623d05aab029b2a817d10a7d0b5eab920c89407c30', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-13 03:51:16', '2023-10-13 03:51:16', '2023-10-15 10:21:16'),
('e9e0247cb426d9c83dcdfcc4f6127b974eb5da439dd49a85719a5c299ef20a95fc1450fdb779187d', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 21:13:34', '2024-11-22 21:13:34', '2024-11-25 03:43:34'),
('eb4682fb35f49f5a02239664a38af85a9850552e25708fb102f7abc3c5f214bf71097e02571e269d', 84, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-22 05:07:00', '2023-12-22 05:07:00', '2023-12-24 11:37:00'),
('ec05c6d6f03c98bac18ea37d4f9a7a3f7777c08b31b76c628657585168576603b6ff10236ae0ea14', 63, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 07:33:19', '2023-12-20 07:33:19', '2023-12-22 14:03:19'),
('f042dfbca3fcc3373be110932fd158a5b4df97834be02a170173f1220fa49f8ce0cae2d027293d8c', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:33:11', '2023-10-11 22:33:11', '2024-10-12 05:03:11'),
('f2498fd4cdf258ebc556fa8c53eb8b7918ee82e39882d4d3e5f9587000d24216442024f3a2b4b3ad', 18, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 07:51:42', '2023-10-26 07:51:42', '2023-10-28 14:21:42'),
('f27233e98cda4befb180b8534e3fae70ec9534169d4cd0439c7bc733946cf258f115b5e9cf430e91', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:08:50', '2023-12-20 09:08:50', '2023-12-22 15:38:50'),
('f523a94008fae00fa134b942a42810687ec307acc59c15f173f0d320cbe5913b92a457d8b5bf368e', 1, '9a595b34-f73b-425c-b371-807407f9d575', 'internal_server_api_token', '[]', 0, '2023-10-11 22:52:24', '2023-10-11 22:52:24', '2024-10-12 05:22:24'),
('f5930b50ebcf0ab9d5cea8cffb93a7c5f82526d09cdf0b56e8739fb2b29bb1448936eda5106b54c4', 3, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-22 19:56:51', '2024-11-22 19:56:51', '2024-11-25 02:26:51'),
('f5e3d267f3661b2533b0a5cdcf0caa65a4eaf9c6ad07d07fc1c6be90d0e6556c377a9e9128df8c62', 16, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 07:36:38', '2023-10-26 07:36:38', '2023-10-28 14:06:38'),
('f7825058f4a97b0275e6c076ce7c52c2e50329efb3b775b79a580692f0bebf49bdd11571bebbf954', 11, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', 'admin_api', '[]', 0, '2024-11-23 14:46:33', '2024-11-23 14:46:33', '2024-11-25 21:16:33'),
('fce38f4827a9e52760f018734d18873fbe6df5f98630fcc379875ec29e9c435c669926f96d05a93e', 64, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-12-20 09:06:24', '2023-12-20 09:06:24', '2023-12-22 15:36:24'),
('fda77e200abce4ef2e14f2f0b02309ea210307d4daba8daf6149b6451514585236f03f33857bf124', 12, '9a6063a2-7596-46d2-b43f-fdf07d21724e', 'app_api_token', '[]', 0, '2023-10-26 02:15:09', '2023-10-26 02:15:09', '2023-10-28 08:45:09'),
('fdf4e6a200b0857bac9128caea0213f154ab3b2f15a5a907792e9a0a356b3b634cface8f75840e30', 3, '9a595b34-f73b-425c-b371-807407f9d575', 'admin_api', '[]', 0, '2023-10-15 09:35:08', '2023-10-15 09:35:08', '2023-10-17 16:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9a57b98e-e6f9-4613-8ec8-7003837ae637', NULL, 'aya-smompo Personal Access Client', 'JF9haIW5KfOAz8M6CQaDpH1wSweasHmDQWCo5jA1', NULL, 'http://localhost', 1, 0, 0, '2023-10-11 02:44:19', '2023-10-11 02:44:19'),
('9a5952ed-9899-43c4-b958-f98c33920aeb', NULL, 'aya-smompo Personal Access Client', 'CsrnT2YB2K1QvK0sIYeMLUZV38gXwUbWP1Ry05Yf', NULL, 'http://localhost', 1, 0, 0, '2023-10-11 21:49:00', '2023-10-11 21:49:00'),
('9a595b34-f73b-425c-b371-807407f9d575', NULL, 'aya-smompo Personal Access Client', 'xMcPzrbN2iOa9QtSFk7vIKhFMia2WrTlImKaGdOv', NULL, 'http://localhost', 1, 0, 0, '2023-10-11 22:12:09', '2023-10-11 22:12:09'),
('9a595b81-c5fb-40c7-9d86-5e9584fb8284', NULL, 'aya-smompo Password Grant Client', 'P9lqmY1q4AV8GkdKneWZu9QOdlfpxrxtm0hQwj7L', 'internal_access', 'http://localhost', 0, 1, 0, '2023-10-11 22:12:59', '2023-10-11 22:12:59'),
('9a6063a2-7596-46d2-b43f-fdf07d21724e', NULL, 'aya-smompo Personal Access Client', 'BhhkZFHJJsauqA6qB8KZv06wgkQRLy4DLiR9yP6J', NULL, 'http://localhost', 1, 0, 0, '2023-10-15 10:06:31', '2023-10-15 10:06:31'),
('9a6063bd-217c-46d3-a169-8ba5fc3a8b27', NULL, 'aya-smompo Password Grant Client', 'm556IpbFzoUS4nIIcMFYvPn8jvHvlNdXNnEi1vcx', 'admin', 'http://localhost', 0, 1, 0, '2023-10-15 10:06:48', '2023-10-15 10:06:48'),
('9d8d5a39-a5ed-4072-a323-fbd680c89e65', NULL, ' Personal Access Client', 'dLFG0kXiMOrkMolpSWcLMr2zZ25iiycoguyM4PIs', NULL, 'http://localhost', 1, 0, 0, '2024-11-22 19:38:16', '2024-11-22 19:38:16'),
('9d8d5a42-bc0d-45c6-96c7-647b3a0405e5', NULL, ' Password Grant Client', 'h0VlsU3IB3rL4Ey04vji5DBOLeCA7ZkGcR6qVk1v', 'user', 'http://localhost', 0, 1, 0, '2024-11-22 19:38:22', '2024-11-22 19:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(2, '9a5952ed-9899-43c4-b958-f98c33920aeb', '2023-10-11 21:49:00', '2023-10-11 21:49:00'),
(3, '9a595b34-f73b-425c-b371-807407f9d575', '2023-10-11 22:12:09', '2023-10-11 22:12:09'),
(4, '9a6063a2-7596-46d2-b43f-fdf07d21724e', '2023-10-15 10:06:31', '2023-10-15 10:06:31'),
(5, '9d8d5a39-a5ed-4072-a323-fbd680c89e65', '2024-11-22 19:38:16', '2024-11-22 19:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','manager','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(10, 'spidey', 'spideyshine@gmail.com', NULL, '$2y$10$aOVmKS18PjeaZCDLUg6DmeKLP2RjQIW7oTHg8n0CT95THVbCMD3Uy', NULL, 'admin', NULL, NULL),
(11, 'AdminUser', 'admin@admin.com', NULL, '$2y$10$tth5bAJMzt7J/Tp1SQZuMun.5x49vaIjdGpOu5uQWrhv1F9fjlOJO', NULL, 'admin', '2024-11-23 11:15:28', '2024-11-23 11:15:28'),
(16, 'Manager', 'manager@company.com', NULL, '$2y$10$vsmJD8Feb3KZsHrueeApk.97XubbQR0aPowtmJGBVE9N0Ea2Ed0zu', NULL, 'manager', '2024-11-23 11:21:44', '2024-11-23 15:58:10'),
(17, 'User', 'user@company.com', NULL, '$2y$10$K9fvTUfSztrF6l/OozZXcOiAoylS11jCRxL5vPzU0CTBb/diuIpWG', NULL, 'user', '2024-11-23 11:22:06', '2024-11-23 11:22:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
