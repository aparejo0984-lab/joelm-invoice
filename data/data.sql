-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 06:01 PM
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
-- Database: `solidinvoice`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `street1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `client_id`, `street1`, `street2`, `city`, `state`, `zip`, `country`, `created`, `updated`) VALUES
(1, 6, '66 Falby Court', NULL, 'Ajax', 'Ontario', 'l1S 3l2', 'CA', '2022-09-18 21:04:04', '2022-10-24 15:53:40'),
(2, 9, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-04 02:09:59', '2022-12-04 02:11:37'),
(3, 11, '132 Railside Road Unit 15', NULL, 'North York', 'Ontario', 'M3A 1A3', 'CA', '2023-01-20 02:29:24', '2023-01-20 02:32:31'),
(4, 8, '44 Falby Court', NULL, 'Ajax', 'Ontario', 'L1S 3L1', 'CA', '2023-01-20 02:37:32', '2023-01-20 02:37:32'),
(5, 12, '66 Falby court', NULL, 'Ajax', 'Ontario', 'L1S 3L2', 'CA', '2023-02-01 02:45:04', '2023-02-01 02:45:04'),
(6, 13, '44 Falby Court', 'Suite 1609', 'Ajax', 'Ontario', NULL, 'CA', '2023-02-10 02:03:34', '2023-02-10 02:17:21'),
(7, 14, '1605 44 Falby Court', NULL, 'Ajax', 'Ontario', 'L1S 3L1', 'CA', '2023-02-26 02:04:17', '2023-02-26 02:04:17'),
(8, 15, '44 Falby court', 'Suite 311', 'Ajax', 'ON', 'L1S 3L1', 'CA', '2023-05-12 03:04:34', '2023-05-12 03:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `api_tokens`
--

CREATE TABLE `api_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_token_history`
--

CREATE TABLE `api_token_history` (
  `id` int(11) NOT NULL,
  `token_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `requestData` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `userAgent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_config`
--

CREATE TABLE `app_config` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_config`
--

INSERT INTO `app_config` (`id`, `setting_key`, `setting_value`, `description`, `field_type`) VALUES
(1, 'system/company/company_name', 'JOELM ELECTRIC', NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(2, 'system/company/logo', 'png|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', NULL, 'SolidInvoice\\CoreBundle\\Form\\Type\\ImageUploadType'),
(3, 'quote/email_subject', 'New Quotation - #{id}', 'To include the id of the quote in the subject, add the placeholder {id} where you want the id', 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(4, 'quote/bcc_address', NULL, 'Send BCC copy of quote to this address', 'Symfony\\Component\\Form\\Extension\\Core\\Type\\EmailType'),
(5, 'invoice/email_subject', 'New Invoice - #{id}', 'To include the id of the invoice in the subject, add the placeholder {id} where you want the id', 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(6, 'invoice/bcc_address', NULL, 'Send BCC copy of invoice to this address', 'Symfony\\Component\\Form\\Extension\\Core\\Type\\EmailType'),
(7, 'email/from_name', 'JOELM ELECTRIC', NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(8, 'email/from_address', 'joelmaique04@gmail.com', NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(10, 'sms/twilio/number', '(437) 999-3577', NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(11, 'sms/twilio/sid', NULL, NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(12, 'sms/twilio/token', NULL, NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(13, 'design/system/theme', 'skin-black', NULL, 'SolidInvoice\\SettingsBundle\\Form\\Type\\ThemeType'),
(14, 'system/company/vat_number', '733094106 RT 0001', NULL, 'SolidInvoice\\TaxBundle\\Form\\Type\\TaxNumberType'),
(15, 'system/company/contact_details/email', 'joelmelectric@gmail.com', NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\EmailType'),
(16, 'system/company/contact_details/phone_number', '(437) 999-3577', NULL, 'Symfony\\Component\\Form\\Extension\\Core\\Type\\TextType'),
(17, 'system/company/contact_details/address', '{\"street1\":\"104-1690 Victoria Park Ave\",\"street2\":null,\"city\":\"North York\",\"state\":\"Ontario\",\"zip\":\"M1R 1R1\",\"country\":\"CA\"}', NULL, 'SolidInvoice\\SettingsBundle\\Form\\Type\\AddressType'),
(18, 'notification/client_create', '{\"email\":\"1\",\"sms\":\"\"}', NULL, 'SolidInvoice\\NotificationBundle\\Form\\Type\\NotificationType'),
(19, 'notification/invoice_status_update', '{\"email\":\"1\",\"sms\":\"\"}', NULL, 'SolidInvoice\\NotificationBundle\\Form\\Type\\NotificationType'),
(20, 'notification/quote_status_update', '{\"email\":\"1\",\"sms\":\"\"}', NULL, 'SolidInvoice\\NotificationBundle\\Form\\Type\\NotificationType'),
(21, 'notification/payment_made', '{\"email\":\"1\",\"sms\":\"\"}', NULL, 'SolidInvoice\\NotificationBundle\\Form\\Type\\NotificationType'),
(28, 'system/company/currency', 'CAD', NULL, 'SolidInvoice\\MoneyBundle\\Form\\Type\\CurrencyType'),
(29, 'email/sending_options/provider', '{\"provider\":\"Gmail\",\"config\":{\"username\":\"aparejo0984@gmail.com\",\"password\":null}}', NULL, 'SolidInvoice\\SettingsBundle\\Form\\Type\\MailTransportType'),
(30, 'system/company/ecra_logo', 'png|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', NULL, 'SolidInvoice\\CoreBundle\\Form\\Type\\ImageUploadType'),
(31, 'system/company/white_logo', 'png|iVBORw0KGgoAAAANSUhEUgAAADwAAABVCAMAAAAi2XfSAAAAAXNSR0IB2cksfwAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAVBQTFRFAAAA////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////RqlzQwAAAHB0Uk5TAP8q/hMB9wT2EFPfFQcJogwxQwv1QeMh6tt5LJWzVazSgG2xJucXT/EF2PNzGFlNoGbI+l+5p3YvriMf3A4GmKRG79cczTR8XClw5cvUGvzOvhG4u5C8toXBYUiBOqrog51KazeLPWnF7Y1khz+ak4qWGQAAAAOkSURBVHic3Zf3V+JAEMcz2QQMoUgvIlKlioA0RcXe69l773r3//92SYgeCSHseu/dD/f9hZeZ/bzdnd2ZHSjqv5Jla+DC/bEUZ4ykZDp5E04YAACl+OcDh4UAXVjjQSFf8x5zfuOKBzrkGvJisVUkLncjkLyn6x+ntqyMZ8u9J58YBzAs1v7M0+8OJiR6e2aqB0tnAFUurErjVq4Vg6Mf+vN6IHPGauwlKsVh39rp+hJTGjse0XZ590T6QWffN5Dv6pv+uS1E466rP+9a01nW9LlwDJPDXbwLcxHd0zBWhYUHtH1s4V0jVO1idoTL1q/pGoil9VmKmhWmPtX0BOy9WIqqCMeluby1HosWlRyDqwUNu0XLqBZ3BOgWY5y2VgCuvw3HUzCONdD6azO8rCoiznnYwGG5XfE2D6nuzS5M4sBFJOXhrNI6A+s48EGrguSU1iB4cODTFuxQw2Ec2Hki7VllLcAeDkzFAfw1dR4cQRALbgCcq22WMLzhsNyTsOhQaFph9L64BnDgAYMUME5hHEU7ekVQFzY2Ma823YIVtZr2IKxVa8IROMRiP2GmzTTlM7i/Da9B7zrXDeb86xh1rgX3qeEyusZkO+F0xsfojNeHoyiKy3bA9OS8/vusA7OXUMRm1bA9lXB+G652eyD1YLM8MSp16Rk0tepqhwtohYBVwiPrvPnb8Ci6IWGVew4C2eOoiLY/S9L5KrNqBGEWgU+117AkHJPB+dZDJ1X9Bwjhg0mHI3IlsXNSp7KZpfHhwa8uPSZ+jkBGu/3Sh5FJ/JzF7CVU8L50QjWipPiE+Yb0aVO/0rrK2/afS7vbYJO+rGEDQSrLcslw3VUhZqk+GY6QnLIsdhtmxF9zyo/Rln7KeWYStSx01ysmU6gC4yb8tPBOglrd/h10amvnL2CjPbIxJt+wTCu3ev2Za5Odo8z5mMj7OetSYB4QQcTuEoPR+pS5PLPZd7J8652eIDmq9ETZxmcKIca5lDtJvZQORglg9+vsFht/GuQX392M9eN1Ud1E6mnCtp44jDwah++Xd/17ubiFpGYbKZbObaC5WNFJcY5mlsftJkQ5do7dw2yjWN307UUvGOcZwUlRzJABeSo1mrXWi+M8f0kSL0H9yWa4DzyX5XiaXY2ayODHu4a1HpgDSJWCowTFT1LDB/PntJwgMYL7JYoN/kkKRFLAJA1ffcE2wokF0f4WOjbI9R7cIW9BfGMTb6ThkmWvLtbInuV/p9/fZ2JEuDtqXwAAAABJRU5ErkJggg==', NULL, 'SolidInvoice\\CoreBundle\\Form\\Type\\ImageUploadType');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(125) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `archived` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `website`, `status`, `currency`, `vat_number`, `archived`, `created`, `updated`) VALUES
(1, 'Anna Lou Parejo', NULL, 'active', NULL, NULL, NULL, '2022-09-14 16:45:59', '2022-09-19 03:15:04'),
(2, 'Unit 311 Durham Condominium 34', NULL, 'active', NULL, NULL, NULL, '2022-09-18 00:11:57', '2022-09-18 00:11:57'),
(3, 'Pau Rhea', NULL, 'active', NULL, NULL, NULL, '2022-09-18 20:56:29', '2022-09-18 20:56:29'),
(4, 'Rey Lariosa', NULL, 'active', NULL, NULL, NULL, '2022-09-18 21:01:13', '2022-09-18 21:01:13'),
(5, 'Rowena Candelaria', NULL, 'active', NULL, NULL, NULL, '2022-09-18 21:02:03', '2022-09-18 21:02:03'),
(6, 'Crossbridge Condominium', NULL, 'active', NULL, NULL, NULL, '2022-09-18 21:04:04', '2022-10-24 16:03:26'),
(7, 'Annabelle', NULL, 'active', NULL, NULL, NULL, '2022-11-08 01:58:17', '2022-11-08 01:58:17'),
(8, 'DCC#34', NULL, 'active', NULL, NULL, NULL, '2022-11-11 02:21:02', '2023-01-20 02:38:44'),
(9, '44 Falby', NULL, 'active', NULL, NULL, NULL, '2022-11-22 03:08:55', '2022-12-04 02:26:39'),
(10, 'GAC Engineering', NULL, 'active', NULL, NULL, NULL, '2022-11-29 01:31:50', '2022-11-29 01:31:50'),
(11, 'LPG', NULL, 'active', NULL, NULL, NULL, '2023-01-20 02:29:24', '2023-01-20 02:29:24'),
(12, 'DCC 33 - 66 FALBY COURT', NULL, 'active', NULL, NULL, NULL, '2023-02-01 02:45:04', '2023-02-01 02:45:04'),
(13, 'Judy Luo', NULL, 'active', NULL, NULL, NULL, '2023-02-10 02:02:07', '2023-02-10 02:02:07'),
(14, 'Steve Keen', NULL, 'active', NULL, NULL, NULL, '2023-02-26 02:04:17', '2023-02-26 02:04:17'),
(15, 'Megan Harris', NULL, 'active', NULL, NULL, NULL, '2023-05-12 03:04:34', '2023-05-12 03:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `client_credit`
--

CREATE TABLE `client_credit` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `value_amount` int(11) DEFAULT NULL,
  `value_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_credit`
--

INSERT INTO `client_credit` (`id`, `client_id`, `value_amount`, `value_currency`, `created`, `updated`) VALUES
(1, 1, 0, NULL, '2022-09-14 16:45:59', '2022-09-14 16:45:59'),
(2, 2, 0, NULL, '2022-09-18 00:11:57', '2022-09-18 00:11:57'),
(3, 3, 0, NULL, '2022-09-18 20:56:29', '2022-09-18 20:56:29'),
(4, 4, 0, NULL, '2022-09-18 21:01:13', '2022-09-18 21:01:13'),
(5, 5, 0, NULL, '2022-09-18 21:02:03', '2022-09-18 21:02:03'),
(6, 6, 0, NULL, '2022-09-18 21:04:04', '2022-09-18 21:04:04'),
(7, 7, 0, NULL, '2022-11-08 01:58:17', '2022-11-08 01:58:17'),
(8, 8, 0, NULL, '2022-11-11 02:21:02', '2022-11-11 02:21:02'),
(9, 9, 0, NULL, '2022-11-22 03:08:55', '2022-11-22 03:08:55'),
(10, 10, 0, NULL, '2022-11-29 01:31:50', '2022-11-29 01:31:50'),
(11, 11, 0, NULL, '2023-01-20 02:29:24', '2023-01-20 02:29:24'),
(12, 12, 0, NULL, '2023-02-01 02:45:04', '2023-02-01 02:45:04'),
(13, 13, 0, NULL, '2023-02-10 02:02:07', '2023-02-10 02:02:07'),
(14, 14, 0, NULL, '2023-02-26 02:04:17', '2023-02-26 02:04:17'),
(15, 15, 0, NULL, '2023-05-12 03:04:34', '2023-05-12 03:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `firstName` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(125) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `client_id`, `firstName`, `lastName`, `email`, `created`, `updated`) VALUES
(1, 1, 'Anna Lou', 'Parejo', 'aparejo0984@gmail.com', '2022-09-14 16:45:59', '2022-09-18 20:59:52'),
(2, 2, 'Unit 311 Durham Condominium 34', NULL, '44falbycourt@crossbridgecs.com', '2022-09-18 00:11:57', '2022-09-18 00:11:57'),
(3, 3, 'Pau Rhea', NULL, 'pau.rhea@gmail.com', '2022-09-18 20:56:29', '2022-09-18 20:56:29'),
(4, 4, 'Rey', 'Lariosa', 'reylariosa.gacengineering@gmail.com', '2022-09-18 21:01:13', '2022-09-18 21:01:13'),
(5, 5, 'Rowena', 'Candelaria', 'rowenacandelaria1228@gmail.com', '2022-09-18 21:02:03', '2022-09-18 21:02:03'),
(6, 6, 'Crossbridge', 'Condominium', '66falbycourt@crossbridgecs.com', '2022-09-18 21:04:04', '2022-10-24 16:03:26'),
(7, 7, 'Annabelle', NULL, '44falbycourt@crossbridgecs.com', '2022-11-08 01:58:17', '2022-11-08 01:58:17'),
(8, 8, 'DCC#34', NULL, '44falbycourt@crossbridgecs.com', '2022-11-11 02:21:02', '2023-01-20 02:38:44'),
(9, 9, '44 Falby', NULL, '44falbycourt@crossbridgecs.com', '2022-11-22 03:08:55', '2022-12-04 02:24:32'),
(10, 10, 'GAC Engineering', NULL, 'ecofreros718@gmail.com', '2022-11-29 01:31:50', '2022-11-29 01:31:50'),
(11, 11, 'LPG', NULL, 'lpj@gmail.com', '2023-01-20 02:29:24', '2023-01-20 02:29:24'),
(12, 12, 'DCC 33 - 66 FALBY COURT', NULL, '66falbycourt@crossbridgecs.com', '2023-02-01 02:45:04', '2023-02-01 02:45:04'),
(13, 13, 'Judy Luo', NULL, 'luo.cm.judy@gmail.com', '2023-02-10 02:02:07', '2023-02-10 02:02:07'),
(14, 14, 'Steve', 'Keen', 'fkeen@sympatico.ca', '2023-02-26 02:04:17', '2023-02-26 02:04:17'),
(15, 15, 'Megan', 'Harris', 'megan.harris8@icloud.com', '2023-05-12 03:04:34', '2023-05-12 03:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `id` int(11) NOT NULL,
  `contact_type_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`id`, `contact_type_id`, `contact_id`, `value`, `created`, `updated`) VALUES
(1, 2, 2, '905-683-8347', '2022-09-18 00:11:57', '2022-09-18 00:11:57'),
(2, 2, 4, '(416) 292-0527', '2022-09-18 21:01:13', '2022-09-18 21:01:13'),
(3, 2, 5, '647-830-6949', '2022-09-18 21:02:03', '2022-09-18 21:02:03'),
(4, 3, 6, '905-428-3202', '2022-09-18 21:04:04', '2022-09-18 21:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `contact_types`
--

CREATE TABLE `contact_types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `field_options` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact_types`
--

INSERT INTO `contact_types` (`id`, `name`, `type`, `field_options`, `required`) VALUES
(1, 'email', 'email', 'a:1:{s:11:\"constraints\";a:1:{i:0;s:5:\"email\";}}', 1),
(2, 'mobile', 'text', 'N;', 0),
(3, 'phone', 'text', 'N;', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ext_log_entries`
--

CREATE TABLE `ext_log_entries` (
  `id` int(11) NOT NULL,
  `action` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `logged_at` datetime NOT NULL,
  `object_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `ext_log_entries`
--

INSERT INTO `ext_log_entries` (`id`, `action`, `logged_at`, `object_id`, `object_class`, `version`, `data`, `username`) VALUES
(1, 'create', '2022-09-14 16:32:57', '1', 'SolidInvoice\\UserBundle\\Entity\\User', 1, 'N;', NULL),
(2, 'create', '2022-09-14 16:45:59', '1', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(3, 'create', '2022-09-14 16:45:59', '1', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(4, 'create', '2022-09-14 16:45:59', '1', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(5, 'create', '2022-09-14 16:57:07', '1', 'SolidInvoice\\TaxBundle\\Entity\\Tax', 1, 'N;', 'joelm'),
(6, 'create', '2022-09-14 16:57:54', '1', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(7, 'create', '2022-09-14 16:57:54', '1', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(8, 'create', '2022-09-14 16:57:54', '2', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(9, 'create', '2022-09-18 00:11:58', '2', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(10, 'create', '2022-09-18 00:11:58', '2', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(11, 'create', '2022-09-18 00:11:58', '1', 'SolidInvoice\\ClientBundle\\Entity\\AdditionalContactDetail', 1, 'N;', 'joelm'),
(12, 'create', '2022-09-18 00:11:58', '2', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(13, 'create', '2022-09-18 00:12:45', '2', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(14, 'create', '2022-09-18 00:12:45', '3', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(15, 'create', '2022-09-18 00:18:11', '3', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(16, 'create', '2022-09-18 00:18:11', '4', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(17, 'create', '2022-09-18 00:19:28', '4', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(18, 'create', '2022-09-18 00:19:28', '5', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(19, 'create', '2022-09-18 00:20:02', '5', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(20, 'create', '2022-09-18 00:20:02', '6', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(21, 'create', '2022-09-18 00:20:26', '6', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(22, 'create', '2022-09-18 00:20:26', '7', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(23, 'create', '2022-09-18 00:20:48', '7', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(24, 'create', '2022-09-18 00:20:48', '8', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(25, 'create', '2022-09-18 00:21:14', '8', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(26, 'create', '2022-09-18 00:21:14', '9', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(27, 'create', '2022-09-18 00:22:03', '9', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(28, 'create', '2022-09-18 00:22:03', '10', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(29, 'create', '2022-09-18 20:56:29', '3', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(30, 'create', '2022-09-18 20:56:29', '3', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(31, 'create', '2022-09-18 20:56:29', '3', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(32, 'create', '2022-09-18 21:01:13', '4', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(33, 'create', '2022-09-18 21:01:13', '4', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(34, 'create', '2022-09-18 21:01:13', '2', 'SolidInvoice\\ClientBundle\\Entity\\AdditionalContactDetail', 1, 'N;', 'joelm'),
(35, 'create', '2022-09-18 21:01:13', '4', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(36, 'create', '2022-09-18 21:02:03', '5', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(37, 'create', '2022-09-18 21:02:03', '5', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(38, 'create', '2022-09-18 21:02:03', '3', 'SolidInvoice\\ClientBundle\\Entity\\AdditionalContactDetail', 1, 'N;', 'joelm'),
(39, 'create', '2022-09-18 21:02:03', '5', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(40, 'create', '2022-09-18 21:04:04', '6', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(41, 'create', '2022-09-18 21:04:04', '6', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(42, 'create', '2022-09-18 21:04:04', '4', 'SolidInvoice\\ClientBundle\\Entity\\AdditionalContactDetail', 1, 'N;', 'joelm'),
(43, 'create', '2022-09-18 21:04:04', '5', 'SolidInvoice\\ClientBundle\\Entity\\AdditionalContactDetail', 1, 'N;', 'joelm'),
(44, 'create', '2022-09-18 21:04:04', '1', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(45, 'create', '2022-09-18 21:04:04', '6', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(46, 'create', '2022-09-18 21:20:12', '11', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(47, 'create', '2022-09-18 21:20:12', '12', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(48, 'create', '2022-09-19 02:58:51', '13', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(49, 'create', '2022-09-19 03:03:31', '14', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(50, 'create', '2022-09-19 03:03:31', '15', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(51, 'remove', '2022-09-19 03:13:41', '5', 'SolidInvoice\\ClientBundle\\Entity\\AdditionalContactDetail', 2, 'N;', 'joelm'),
(52, 'create', '2022-10-01 19:54:28', '10', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(53, 'create', '2022-10-01 19:54:28', '16', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(54, 'create', '2022-10-07 03:28:45', '11', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(55, 'create', '2022-10-07 03:28:45', '17', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(56, 'create', '2022-10-07 03:28:45', '18', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(57, 'create', '2022-10-24 15:54:16', '12', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(58, 'create', '2022-10-24 15:54:16', '19', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(59, 'create', '2022-11-08 01:58:17', '7', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(60, 'create', '2022-11-08 01:58:17', '7', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(61, 'create', '2022-11-08 01:58:17', '7', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(62, 'create', '2022-11-08 02:01:28', '1', 'SolidInvoice\\QuoteBundle\\Entity\\Quote', 1, 'N;', 'joelm'),
(63, 'create', '2022-11-08 02:01:28', '1', 'SolidInvoice\\QuoteBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(64, 'create', '2022-11-08 02:02:25', '13', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(65, 'create', '2022-11-08 02:02:25', '20', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(66, 'create', '2022-11-11 02:21:02', '8', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(67, 'create', '2022-11-11 02:21:02', '8', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(68, 'create', '2022-11-11 02:21:02', '8', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(69, 'create', '2022-11-11 02:21:40', '14', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(70, 'create', '2022-11-11 02:21:40', '21', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(71, 'create', '2022-11-11 02:24:14', '15', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(72, 'create', '2022-11-11 02:24:14', '22', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(73, 'create', '2022-11-22 03:08:55', '9', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(74, 'create', '2022-11-22 03:08:55', '9', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(75, 'create', '2022-11-22 03:08:55', '9', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(76, 'create', '2022-11-22 03:09:57', '16', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(77, 'create', '2022-11-22 03:09:57', '23', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(78, 'create', '2022-11-29 01:31:50', '10', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(79, 'create', '2022-11-29 01:31:50', '10', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(80, 'create', '2022-11-29 01:31:50', '10', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(81, 'create', '2022-11-29 01:32:41', '17', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(82, 'create', '2022-11-29 01:32:41', '24', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(83, 'create', '2022-11-29 01:32:41', '25', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(84, 'create', '2022-12-04 01:58:00', '18', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(85, 'create', '2022-12-04 01:58:00', '26', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(86, 'create', '2022-12-04 02:05:42', '2', 'SolidInvoice\\QuoteBundle\\Entity\\Quote', 1, 'N;', 'joelm'),
(87, 'create', '2022-12-04 02:05:42', '2', 'SolidInvoice\\QuoteBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(88, 'create', '2022-12-04 02:09:59', '2', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(89, 'create', '2022-12-04 02:26:01', '19', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(90, 'create', '2022-12-04 02:26:01', '27', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(91, 'create', '2022-12-27 20:21:45', '3', 'SolidInvoice\\QuoteBundle\\Entity\\Quote', 1, 'N;', 'joelm'),
(92, 'create', '2022-12-27 20:21:45', '3', 'SolidInvoice\\QuoteBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(93, 'create', '2023-01-20 02:29:24', '11', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(94, 'create', '2023-01-20 02:29:24', '11', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(95, 'create', '2023-01-20 02:29:24', '3', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(96, 'create', '2023-01-20 02:29:24', '11', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(97, 'create', '2023-01-20 02:31:38', '20', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(98, 'create', '2023-01-20 02:31:38', '28', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(99, 'create', '2023-01-20 02:31:38', '29', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(100, 'create', '2023-01-20 02:35:48', '21', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(101, 'create', '2023-01-20 02:35:48', '30', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(102, 'create', '2023-01-20 02:37:32', '4', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(103, 'create', '2023-02-01 02:26:49', '22', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(104, 'create', '2023-02-01 02:26:49', '31', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(105, 'create', '2023-02-01 02:45:04', '12', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(106, 'create', '2023-02-01 02:45:04', '12', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(107, 'create', '2023-02-01 02:45:04', '5', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(108, 'create', '2023-02-01 02:45:04', '12', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(109, 'create', '2023-02-10 01:56:39', '23', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(110, 'create', '2023-02-10 01:56:39', '32', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(111, 'create', '2023-02-10 02:02:07', '13', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(112, 'create', '2023-02-10 02:02:07', '13', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(113, 'create', '2023-02-10 02:02:07', '13', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(114, 'create', '2023-02-10 02:03:34', '6', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(115, 'create', '2023-02-10 02:12:59', '4', 'SolidInvoice\\QuoteBundle\\Entity\\Quote', 1, 'N;', 'joelm'),
(116, 'create', '2023-02-10 02:12:59', '4', 'SolidInvoice\\QuoteBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(117, 'create', '2023-02-26 02:04:17', '14', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(118, 'create', '2023-02-26 02:04:17', '14', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(119, 'create', '2023-02-26 02:04:17', '7', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(120, 'create', '2023-02-26 02:04:17', '14', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(121, 'create', '2023-02-26 02:05:42', '24', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(122, 'create', '2023-02-26 02:05:42', '33', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(123, 'create', '2023-03-22 16:02:28', '25', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(124, 'create', '2023-03-22 16:02:28', '34', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(125, 'create', '2023-03-22 16:02:28', '35', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(126, 'create', '2023-03-29 13:43:42', '5', 'SolidInvoice\\QuoteBundle\\Entity\\Quote', 1, 'N;', 'joelm'),
(127, 'create', '2023-03-29 13:43:42', '5', 'SolidInvoice\\QuoteBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(128, 'create', '2023-04-03 01:38:12', '26', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(129, 'create', '2023-04-03 01:38:12', '36', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(130, 'create', '2023-04-03 01:38:12', '37', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(131, 'create', '2023-04-03 01:38:12', '38', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(132, 'create', '2023-04-25 02:40:30', '27', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(133, 'create', '2023-04-25 02:40:30', '39', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(134, 'create', '2023-05-12 03:04:34', '15', 'SolidInvoice\\ClientBundle\\Entity\\Client', 1, 'N;', 'joelm'),
(135, 'create', '2023-05-12 03:04:34', '15', 'SolidInvoice\\ClientBundle\\Entity\\Contact', 1, 'N;', 'joelm'),
(136, 'create', '2023-05-12 03:04:34', '8', 'SolidInvoice\\ClientBundle\\Entity\\Address', 1, 'N;', 'joelm'),
(137, 'create', '2023-05-12 03:04:34', '15', 'SolidInvoice\\ClientBundle\\Entity\\Credit', 1, 'N;', 'joelm'),
(138, 'create', '2023-05-12 03:05:12', '28', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(139, 'create', '2023-05-12 03:05:12', '40', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm'),
(140, 'create', '2023-05-12 03:14:49', '29', 'SolidInvoice\\InvoiceBundle\\Entity\\Invoice', 1, 'N;', 'joelm'),
(141, 'create', '2023-05-12 03:14:49', '41', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `quote_id` int(11) DEFAULT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `terms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `due` date DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `archived` tinyint(1) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `total_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseTotal_amount` int(11) DEFAULT NULL,
  `baseTotal_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance_amount` int(11) DEFAULT NULL,
  `balance_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `tax_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_value_percentage` double DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_valueMoney_amount` int(11) DEFAULT NULL,
  `discount_valueMoney_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `client_id`, `quote_id`, `uuid`, `status`, `terms`, `notes`, `due`, `paid_date`, `archived`, `total_amount`, `total_currency`, `baseTotal_amount`, `baseTotal_currency`, `balance_amount`, `balance_currency`, `tax_amount`, `tax_currency`, `discount_value_percentage`, `discount_type`, `discount_valueMoney_amount`, `discount_valueMoney_currency`, `created`, `updated`) VALUES
(1, 1, NULL, '9c56066a-343d-11ed-9586-00d861e67d9e', 'pending', NULL, 'Please send payment through email transfer.', NULL, NULL, NULL, 242950, 'CAD', 215000, 'CAD', 242950, 'CAD', 27950, 'CAD', NULL, NULL, 0, NULL, '2022-09-14 16:57:54', '2022-09-19 01:42:53'),
(2, 4, NULL, 'db85ec48-36d5-11ed-bf44-00d861e67d9e', 'draft', NULL, 'Please send your payment through email transfer.', NULL, NULL, NULL, 283743, 'CAD', 251100, 'CAD', 283743, 'CAD', 32643, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:12:45', '2022-09-19 01:43:35'),
(3, 1, NULL, '9d7e484a-36d6-11ed-a5a3-00d861e67d9e', 'archived', NULL, NULL, NULL, NULL, NULL, 15142, 'CAD', 13400, 'CAD', 15142, 'CAD', 1742, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:18:11', '2022-09-18 00:18:11'),
(4, 4, NULL, 'cba3763c-36d6-11ed-9b9c-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 240803, 'CAD', 213100, 'CAD', 240803, 'CAD', 27703, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:19:28', '2022-09-19 02:58:51'),
(5, 3, NULL, 'dfb53a70-36d6-11ed-b79c-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 75000, 'CAD', 75000, 'CAD', 75000, 'CAD', 0, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:20:02', '2022-09-18 21:11:32'),
(6, 1, NULL, 'edd5b2c4-36d6-11ed-93e7-00d861e67d9e', 'archived', NULL, NULL, NULL, NULL, NULL, 56700, 'CAD', 56700, 'CAD', 56700, 'CAD', 0, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:20:26', '2022-09-19 03:09:05'),
(7, 4, NULL, 'fb496784-36d6-11ed-b5a4-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 280231, 'CAD', 251800, 'CAD', 280231, 'CAD', 28431, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:20:48', '2022-09-19 03:03:31'),
(8, 6, NULL, '0a5b6808-36d7-11ed-8ac9-00d861e67d9e', 'draft', NULL, 'Cheque payable to Joel Maique', NULL, NULL, NULL, 45200, 'CAD', 40000, 'CAD', 45200, 'CAD', 5200, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:21:14', '2022-12-09 03:04:27'),
(9, 2, NULL, '27d1c706-36d7-11ed-a5e1-00d861e67d9e', 'draft', NULL, 'Send payment through email transfer.', NULL, NULL, NULL, 27120, 'CAD', 24000, 'CAD', 27120, 'CAD', 3120, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:22:03', '2022-09-18 20:27:12'),
(10, 4, NULL, '1831ba6e-41b2-11ed-9893-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 226000, 'CAD', 200000, 'CAD', 226000, 'CAD', 26000, 'CAD', NULL, NULL, 0, NULL, '2022-10-01 19:54:28', '2022-10-01 20:02:26'),
(11, 4, NULL, '6253004a-45df-11ed-9fca-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 268488, 'CAD', 237600, 'CAD', 268488, 'CAD', 30888, 'CAD', NULL, NULL, 0, NULL, '2022-10-07 03:28:45', '2022-10-07 03:28:45'),
(12, 6, NULL, '599e289a-53a3-11ed-a44e-00d861e67d9e', 'draft', NULL, 'Cheque payable to Joel Maique', NULL, NULL, NULL, 85880, 'CAD', 76000, 'CAD', 85880, 'CAD', 9880, 'CAD', NULL, NULL, 0, NULL, '2022-10-24 15:54:16', '2022-12-09 03:10:01'),
(13, 7, NULL, '01e19eca-5f01-11ed-9de6-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 152550, 'CAD', 135000, 'CAD', 152550, 'CAD', 17550, 'CAD', NULL, NULL, 0, NULL, '2022-11-08 02:02:25', '2022-11-08 02:07:28'),
(14, 8, NULL, '31fe68d0-615f-11ed-8a5f-00d861e67d9e', 'draft', NULL, 'Cheque payable to Joel Maique', NULL, NULL, NULL, 57630, 'CAD', 51000, 'CAD', 57630, 'CAD', 6630, 'CAD', NULL, NULL, 0, NULL, '2022-11-11 02:21:40', '2022-12-09 02:27:00'),
(15, 8, NULL, '8d8fd800-615f-11ed-8fe6-00d861e67d9e', 'draft', NULL, 'Cheque payable to Joel Maique', NULL, NULL, NULL, 67235, 'CAD', 59500, 'CAD', 67235, 'CAD', 7735, 'CAD', NULL, NULL, 0, NULL, '2022-11-11 02:24:14', '2022-12-09 02:45:42'),
(16, 8, NULL, 'c347f622-6a0a-11ed-baff-00d861e67d9e', 'draft', NULL, 'Cheque payable to Joel Maique', NULL, NULL, NULL, 152550, 'CAD', 135000, 'CAD', 152550, 'CAD', 17550, 'CAD', NULL, NULL, 0, NULL, '2022-11-22 03:09:57', '2022-12-09 03:02:13'),
(17, 10, NULL, '55aef6ec-6f7d-11ed-a341-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 265550, 'CAD', 235000, 'CAD', 265550, 'CAD', 30550, 'CAD', NULL, NULL, 0, NULL, '2022-11-29 01:32:41', '2022-11-29 01:33:04'),
(18, 8, NULL, 'b29d1b5a-736e-11ed-b495-00d861e67d9e', 'draft', NULL, 'Cheque payable to Joel Maique', NULL, NULL, NULL, 22035, 'CAD', 19500, 'CAD', 22035, 'CAD', 2535, 'CAD', NULL, NULL, 0, NULL, '2022-12-04 01:58:00', '2022-12-09 02:50:41'),
(19, 9, NULL, '9cad48a2-7372-11ed-be83-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 355046, 'CAD', 314200, 'CAD', 355046, 'CAD', 40846, 'CAD', NULL, NULL, 0, NULL, '2022-12-04 02:26:01', '2022-12-04 02:26:01'),
(20, 11, NULL, '2f2b7848-9862-11ed-96df-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 96300, 'CAD', 92400, 'CAD', 96300, 'CAD', 3900, 'CAD', NULL, NULL, 0, NULL, '2023-01-20 02:31:38', '2023-01-20 02:33:04'),
(21, 8, NULL, 'c3fe8c9e-9862-11ed-95cf-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 9605, 'CAD', 8500, 'CAD', 9605, 'CAD', 1105, 'CAD', NULL, NULL, 0, NULL, '2023-01-20 02:35:48', '2023-01-20 02:35:48'),
(22, 12, NULL, '7facae7e-a1cf-11ed-8622-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 231650, 'CAD', 205000, 'CAD', 231650, 'CAD', 26650, 'CAD', NULL, NULL, 0, NULL, '2023-02-01 02:26:49', '2023-02-01 02:49:23'),
(23, 12, NULL, 'c68fe198-a8dd-11ed-835a-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 18080, 'CAD', 16000, 'CAD', 18080, 'CAD', 2080, 'CAD', NULL, NULL, 0, NULL, '2023-02-10 01:56:39', '2023-02-10 01:56:51'),
(24, 14, NULL, 'b11dcafa-b571-11ed-acbe-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 124300, 'CAD', 110000, 'CAD', 124300, 'CAD', 14300, 'CAD', NULL, NULL, 0, NULL, '2023-02-26 02:05:42', '2023-02-26 02:05:42'),
(25, 4, NULL, '900903ac-c8c2-11ed-8476-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 45900, 'CAD', 43300, 'CAD', 45900, 'CAD', 2600, 'CAD', NULL, NULL, 0, NULL, '2023-03-22 16:02:28', '2023-03-22 16:02:28'),
(26, 4, NULL, '6e3d3e32-d1af-11ed-a727-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 597544, 'CAD', 528800, 'CAD', 597544, 'CAD', 68744, 'CAD', NULL, NULL, 0, NULL, '2023-04-03 01:38:11', '2023-04-03 01:38:12'),
(27, 10, NULL, 'c79326be-e301-11ed-b0e1-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 680000, 'CAD', 680000, 'CAD', 680000, 'CAD', 0, 'CAD', NULL, NULL, 0, NULL, '2023-04-25 02:40:30', '2023-04-25 13:04:01'),
(28, 15, NULL, '0bfb167e-f061-11ed-9d13-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 135600, 'CAD', 120000, 'CAD', 135600, 'CAD', 15600, 'CAD', NULL, NULL, 0, NULL, '2023-05-12 03:05:12', '2023-05-12 03:05:12'),
(29, 15, NULL, '643db4b2-f062-11ed-a53f-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 135600, 'CAD', 120000, 'CAD', 135600, 'CAD', 15600, 'CAD', NULL, NULL, 0, NULL, '2023-05-12 03:14:49', '2023-05-12 03:14:49');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_contact`
--

CREATE TABLE `invoice_contact` (
  `invoice_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_contact`
--

INSERT INTO `invoice_contact` (`invoice_id`, `contact_id`) VALUES
(1, 1),
(2, 4),
(3, 1),
(4, 4),
(5, 3),
(6, 1),
(7, 4),
(8, 6),
(9, 2),
(10, 4),
(11, 4),
(12, 6),
(13, 7),
(14, 8),
(15, 8),
(16, 8),
(17, 10),
(18, 8),
(19, 7),
(20, 11),
(21, 8),
(22, 12),
(23, 12),
(24, 14),
(25, 4),
(26, 4),
(27, 10),
(28, 15),
(29, 15);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_lines`
--

CREATE TABLE `invoice_lines` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `qty` double NOT NULL,
  `price_amount` int(11) DEFAULT NULL,
  `price_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `total_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `recurringInvoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_lines`
--

INSERT INTO `invoice_lines` (`id`, `invoice_id`, `tax_id`, `description`, `qty`, `price_amount`, `price_currency`, `total_amount`, `total_currency`, `created`, `updated`, `recurringInvoice_id`) VALUES
(1, 1, 1, 'Initial Down payment', 1, 200000, 'CAD', 200000, 'CAD', '2022-09-14 16:57:54', '2022-09-19 01:42:53', NULL),
(2, 1, 1, 'Electrical Permit', 1, 15000, 'CAD', 15000, 'CAD', '2022-09-14 16:57:54', '2022-09-19 01:42:53', NULL),
(3, 2, 1, '50% Project Completion', 1, 200000, 'CAD', 200000, 'CAD', '2022-09-18 00:12:45', '2022-09-19 01:43:35', NULL),
(4, 3, 1, 'Test 123', 1, 13400, 'CAD', 13400, 'CAD', '2022-09-18 00:18:11', '2022-09-18 00:18:11', NULL),
(5, 4, 1, '(NEWMARKET) Project 50% completion', 1, 200000, 'CAD', 200000, 'CAD', '2022-09-18 00:19:28', '2022-09-19 02:58:51', NULL),
(6, 5, NULL, 'Install lighting fixtures', 1, 75000, 'CAD', 75000, 'CAD', '2022-09-18 00:20:02', '2022-09-18 21:11:32', NULL),
(7, 6, NULL, 'Test 234', 1, 56700, 'CAD', 56700, 'CAD', '2022-09-18 00:20:26', '2022-09-19 03:09:05', NULL),
(8, 7, 1, '100% completion ( 40 mcewan, bolton)', 1, 200000, 'CAD', 200000, 'CAD', '2022-09-18 00:20:48', '2022-09-19 03:03:31', NULL),
(9, 8, 1, 'run coaxial for rogers and replaced  lobby potlight', 1, 40000, 'CAD', 40000, 'CAD', '2022-09-18 00:21:14', '2022-12-09 03:04:27', NULL),
(10, 9, 1, 'Suite 311, troubleshoot bedroom lighting and install new light fixture.', 3, 8000, 'CAD', 24000, 'CAD', '2022-09-18 00:22:03', '2022-09-18 20:27:12', NULL),
(11, 2, 1, 'Electrical Permit', 1, 36100, 'CAD', 36100, 'CAD', '2022-09-18 21:20:12', '2022-09-19 01:43:35', NULL),
(12, 2, 1, 'Add on 2 counter outlets', 1, 15000, 'CAD', 15000, 'CAD', '2022-09-18 21:20:12', '2022-09-19 01:43:35', NULL),
(13, 4, 1, 'electrical permit', 1, 13100, 'CAD', 13100, 'CAD', '2022-09-19 02:58:51', '2022-09-19 02:58:51', NULL),
(14, 7, 1, 'materials + 10%', 1, 18700, 'CAD', 18700, 'CAD', '2022-09-19 03:03:31', '2022-09-19 03:03:31', NULL),
(15, 7, NULL, 'material ( 10\' ladder)', 1, 33100, 'CAD', 33100, 'CAD', '2022-09-19 03:03:31', '2022-09-19 03:03:31', NULL),
(16, 10, 1, 'Electrical work (100% Completion) 16655 Yonge St Newmarket', 1, 200000, 'CAD', 200000, 'CAD', '2022-10-01 19:54:28', '2022-10-01 20:02:26', NULL),
(17, 11, 1, 'Electrical works (50% completion, 40 Mcewan Drive UD 6 Bolton)', 1, 200000, 'CAD', 200000, 'CAD', '2022-10-07 03:28:45', '2022-10-07 03:28:45', NULL),
(18, 11, 1, 'Electrical permit', 1, 37600, 'CAD', 37600, 'CAD', '2022-10-07 03:28:45', '2022-10-07 03:28:45', NULL),
(19, 12, 1, 'Electrical inspection and work (party room, pot light, lobby and offices)', 1, 76000, 'CAD', 76000, 'CAD', '2022-10-24 15:54:16', '2022-12-09 03:10:01', NULL),
(20, 13, 1, 'Upgrading old lighting on penthouse hallway.\r\n\r\n\r\nLabour and materials included, removing old fluorescent light fixtures to LED 2\'x2\' light fixtures', 1, 135000, 'CAD', 135000, 'CAD', '2022-11-08 02:02:25', '2022-11-08 02:07:28', NULL),
(21, 14, 1, 'Install 3 light fixtures, run emt pipe for power supply at B1 parking lot for additional lighting. Materials and labour are included.', 1, 51000, 'CAD', 51000, 'CAD', '2022-11-11 02:21:40', '2022-12-09 02:27:00', NULL),
(22, 15, 1, 'Replace exit sign at B1 parking area, fixed and re mount 1 light fixture, change 2 garbage chute light fixture to LED fixture with motion sensor (5th and 10th floor).\r\nLabour and materials are included.', 1, 59500, 'CAD', 59500, 'CAD', '2022-11-11 02:24:14', '2022-12-09 02:45:42', NULL),
(23, 16, 1, 'Upgrading old lighting on\r\npenthouse hallway.\r\n\r\nLabour and materials included,\r\nremoving old fluorescent light\r\nfixtures and changing to LED 2\'x2\'\r\nlight fixtures', 1, 135000, 'CAD', 135000, 'CAD', '2022-11-22 03:09:57', '2022-12-09 03:02:13', NULL),
(24, 17, 1, 'Electrical work (100% completion) 40 Mcewan Drive UD 6 Bolton', 1, 200000, 'CAD', 200000, 'CAD', '2022-11-29 01:32:41', '2022-11-29 01:33:04', NULL),
(25, 17, 1, 'Additional 5 electrical outlets', 1, 35000, 'CAD', 35000, 'CAD', '2022-11-29 01:32:41', '2022-11-29 01:33:04', NULL),
(26, 18, 1, 'Replaced old exit sign at B1 parking lot. Labour and material are included', 1, 19500, 'CAD', 19500, 'CAD', '2022-12-04 01:58:00', '2022-12-09 02:50:41', NULL),
(27, 19, 1, 'Replaced 7pcs outdoor pole light head to LED 55W 120V. \r\n\r\nNote: just replacing the pole top area light with LED head. Labour and materials are included.', 1, 314200, 'CAD', 314200, 'CAD', '2022-12-04 02:26:01', '2022-12-04 02:26:01', NULL),
(28, 20, 1, 'Electrical work: re locate potlights switches, run cable and installed 4 receptacle', 1, 30000, 'CAD', 30000, 'CAD', '2023-01-20 02:31:38', '2023-01-20 02:33:04', NULL),
(29, 20, NULL, 'Materials cost', 1, 62400, 'CAD', 62400, 'CAD', '2023-01-20 02:31:38', '2023-01-20 02:33:04', NULL),
(30, 21, 1, 'Electrical work: Unit 907 troubleshoot bedroom furnace. Bad cable connection between thermostat and motor.', 1, 8500, 'CAD', 8500, 'CAD', '2023-01-20 02:35:48', '2023-01-20 02:35:48', NULL),
(31, 22, 1, 'Electrical work: installed 2 switches with dimmer and rewired party room potlights. Troubleshoot wiring connection and junction box for lighting circuit. Replaced 1 potlight in the lobby. Labour and materials included', 1, 205000, 'CAD', 205000, 'CAD', '2023-02-01 02:26:49', '2023-02-01 02:49:23', NULL),
(32, 23, 1, 'Service call - Troubleshoot party room receptacles.', 1, 16000, 'CAD', 16000, 'CAD', '2023-02-10 01:56:39', '2023-02-10 01:56:51', NULL),
(33, 24, 1, 'Electrical work : panel change fuse to breaker', 1, 110000, 'CAD', 110000, 'CAD', '2023-02-26 02:05:42', '2023-02-26 02:05:42', NULL),
(34, 25, NULL, 'Electrical materials + 10%', 1, 23300, 'CAD', 23300, 'CAD', '2023-03-22 16:02:28', '2023-03-22 16:02:29', NULL),
(35, 25, 1, 'Electrical permit', 1, 20000, 'CAD', 20000, 'CAD', '2023-03-22 16:02:28', '2023-03-22 16:02:29', NULL),
(36, 26, 1, 'Materials', 1, 59500, 'CAD', 59500, 'CAD', '2023-04-03 01:38:11', '2023-04-03 01:38:12', NULL),
(37, 26, 1, 'Permit', 1, 69300, 'CAD', 69300, 'CAD', '2023-04-03 01:38:11', '2023-04-03 01:38:12', NULL),
(38, 26, 1, 'Rutherford project 50% completion', 1, 400000, 'CAD', 400000, 'CAD', '2023-04-03 01:38:11', '2023-04-03 01:38:12', NULL),
(39, 27, NULL, '40% down payment for Bathurst and Wilson project', 1, 680000, 'CAD', 680000, 'CAD', '2023-04-25 02:40:30', '2023-04-25 13:04:01', NULL),
(40, 28, 1, 'Panel change fuse to breaker', 1, 120000, 'CAD', 120000, 'CAD', '2023-05-12 03:05:12', '2023-05-12 03:05:12', NULL),
(41, 29, 1, 'Panel change fuse to breaker', 1, 120000, 'CAD', 120000, 'CAD', '2023-05-12 03:14:49', '2023-05-12 03:14:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20000', '2022-09-14 14:31:23'),
('20001', '2022-09-14 14:31:23'),
('20100', '2022-09-14 14:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  `method_id` int(11) DEFAULT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `completed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `gateway_name` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `factory` varchar(125) COLLATE utf8_unicode_ci NOT NULL,
  `config` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:array)',
  `internal` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `gateway_name`, `factory`, `config`, `internal`, `enabled`, `created`, `updated`) VALUES
(1, 'Cash', 'cash', 'offline', 'a:0:{}', 1, 1, '2022-09-14 16:31:23', '2022-09-14 16:31:23'),
(2, 'Bank Transfer', 'bank_transfer', 'offline', 'a:0:{}', 1, 1, '2022-09-14 16:31:23', '2022-09-14 16:31:23'),
(3, 'Credit', 'credit', 'offline', 'a:0:{}', 1, 1, '2022-09-14 16:31:23', '2022-09-14 16:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `uuid` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:uuid)',
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `terms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `due` date DEFAULT NULL,
  `archived` tinyint(1) DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `total_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseTotal_amount` int(11) DEFAULT NULL,
  `baseTotal_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `tax_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_value_percentage` double DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_valueMoney_amount` int(11) DEFAULT NULL,
  `discount_valueMoney_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `client_id`, `uuid`, `status`, `terms`, `notes`, `due`, `archived`, `total_amount`, `total_currency`, `baseTotal_amount`, `baseTotal_currency`, `tax_amount`, `tax_currency`, `discount_value_percentage`, `discount_type`, `discount_valueMoney_amount`, `discount_valueMoney_currency`, `created`, `updated`) VALUES
(1, 1, 'e037e838-5f00-11ed-b77d-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, 152550, 'CAD', 135000, 'CAD', 17550, 'CAD', 0, NULL, 0, NULL, '2022-11-08 02:01:28', '2022-11-08 02:01:28'),
(2, 1, 'c6417d58-736f-11ed-802d-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, 355046, 'CAD', 314200, 'CAD', 40846, 'CAD', 0, NULL, 0, NULL, '2022-12-04 02:05:42', '2022-12-04 02:05:42'),
(3, 1, 'b36d6b1a-861b-11ed-a7fc-00d861e67d9e', 'draft', NULL, 'This is a test', NULL, NULL, 2825, 'CAD', 2500, 'CAD', 325, 'CAD', 0, NULL, 0, NULL, '2022-12-27 20:21:45', '2022-12-27 20:51:27'),
(4, 13, '0ef21166-a8e0-11ed-9ffe-00d861e67d9e', 'draft', NULL, 'I can start 7AM on February 16 2023.', NULL, NULL, 197000, 'CAD', 197000, 'CAD', 0, 'CAD', NULL, NULL, 0, NULL, '2023-02-10 02:12:59', '2023-02-10 03:07:45'),
(5, 7, 'f495ed80-ce26-11ed-9df5-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, 87010, 'CAD', 77000, 'CAD', 10010, 'CAD', NULL, NULL, 0, NULL, '2023-03-29 13:43:42', '2023-03-29 13:43:42');

-- --------------------------------------------------------

--
-- Table structure for table `quote_contact`
--

CREATE TABLE `quote_contact` (
  `quote_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quote_contact`
--

INSERT INTO `quote_contact` (`quote_id`, `contact_id`) VALUES
(1, 7),
(2, 9),
(3, 1),
(4, 13),
(5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `quote_lines`
--

CREATE TABLE `quote_lines` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `qty` double NOT NULL,
  `price_amount` int(11) DEFAULT NULL,
  `price_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `total_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quote_lines`
--

INSERT INTO `quote_lines` (`id`, `quote_id`, `tax_id`, `description`, `qty`, `price_amount`, `price_currency`, `total_amount`, `total_currency`, `created`, `updated`) VALUES
(1, 1, 1, 'Upgrading old lighting on penthouse hallway', 1, 135000, 'CAD', 135000, 'CAD', '2022-11-08 02:01:28', '2022-11-08 02:01:28'),
(2, 2, 1, 'Replaced 7 pcs. outdoor pole light head to LED 55W 120V.\r\n\r\nNOTE: Just replacing the pole top area light with LED head.  Labour and materials are included', 1, 314200, 'CAD', 314200, 'CAD', '2022-12-04 02:05:42', '2022-12-04 02:05:42'),
(3, 3, 1, 'Test Quote', 1, 2500, 'CAD', 2500, 'CAD', '2022-12-27 20:21:45', '2022-12-27 20:51:27'),
(4, 4, NULL, 'Replacing fuse panel to breaker panel, changing 13 light switches, 1 dimmer, 4 GFCI and run and install light power, switches and receptacle in laundry room. Labour and materials are included.  For the materials: switches, receptacles and cover plates are excluded.', 1, 197000, 'CAD', 197000, 'CAD', '2023-02-10 02:12:59', '2023-02-10 03:07:45'),
(5, 5, 1, 'Hybrid plug estimates: Run emt 36 meter 1/2 emt conduit and t90 wire for 120Volt outlet. Labour and materials included.', 1, 77000, 'CAD', 77000, 'CAD', '2023-03-29 13:43:42', '2023-03-29 13:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `recurringinvoice_contact`
--

CREATE TABLE `recurringinvoice_contact` (
  `recurringinvoice_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recurring_invoices`
--

CREATE TABLE `recurring_invoices` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` date NOT NULL COMMENT '(DC2Type:date_immutable)',
  `date_end` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)',
  `archived` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `terms` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `total_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baseTotal_amount` int(11) DEFAULT NULL,
  `baseTotal_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `tax_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_value_percentage` double DEFAULT NULL,
  `discount_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount_valueMoney_amount` int(11) DEFAULT NULL,
  `discount_valueMoney_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `security_token`
--

CREATE TABLE `security_token` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '(DC2Type:object)',
  `after_url` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gateway_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `tax_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `name`, `rate`, `tax_type`, `created`, `updated`) VALUES
(1, 'HST ON', 13, 'Exclusive', '2022-09-14 16:57:07', '2022-09-14 16:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `enabled`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `mobile`, `created`, `updated`) VALUES
(1, 'joelm', 'aparejo0984@gmail.com', 1, '$argon2id$v=19$m=65536,t=4,p=1$RUtNRnBOWi9HWVVpMkt3Yw$sexiGsvqgjgfXa3wkNKWeEmYK7goZRc1RoYKedjOa0U', NULL, NULL, NULL, 'a:0:{}', NULL, '2022-09-14 16:32:57', '2022-09-14 16:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `version`
--

CREATE TABLE `version` (
  `version` varchar(125) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `version`
--

INSERT INTO `version` (`version`) VALUES
('2.2.0-dev');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6FCA751619EB6921` (`client_id`);

--
-- Indexes for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2CAD560EA76ED395` (`user_id`);

--
-- Indexes for table `api_token_history`
--
ALTER TABLE `api_token_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_61D8DC4441DEE7B9` (`token_id`);

--
-- Indexes for table `app_config`
--
ALTER TABLE `app_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_318942FC5FA1E697` (`setting_key`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C82E745E237E06` (`name`);

--
-- Indexes for table `client_credit`
--
ALTER TABLE `client_credit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4967254D19EB6921` (`client_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3340157319EB6921` (`client_id`),
  ADD KEY `IDX_33401573E7927C74` (`email`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E8092A0B5F63AD12` (`contact_type_id`),
  ADD KEY `IDX_E8092A0BE7A1254A` (`contact_id`);

--
-- Indexes for table `contact_types`
--
ALTER TABLE `contact_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_741A993F5E237E06` (`name`);

--
-- Indexes for table `ext_log_entries`
--
ALTER TABLE `ext_log_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_class_lookup_idx` (`object_class`),
  ADD KEY `log_date_lookup_idx` (`logged_at`),
  ADD KEY `log_user_lookup_idx` (`username`),
  ADD KEY `log_version_lookup_idx` (`object_id`,`object_class`,`version`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2F2F95DB805178` (`quote_id`),
  ADD KEY `IDX_6A2F2F9519EB6921` (`client_id`),
  ADD KEY `IDX_6A2F2F95DB805178` (`quote_id`);

--
-- Indexes for table `invoice_contact`
--
ALTER TABLE `invoice_contact`
  ADD PRIMARY KEY (`invoice_id`,`contact_id`),
  ADD KEY `IDX_BEBBD0EB2989F1FD` (`invoice_id`),
  ADD KEY `IDX_BEBBD0EBE7A1254A` (`contact_id`);

--
-- Indexes for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_72DBDC232989F1FD` (`invoice_id`),
  ADD KEY `IDX_72DBDC23B2A824D8` (`tax_id`),
  ADD KEY `IDX_72DBDC23416CCF0F` (`recurringInvoice_id`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_65D29B322989F1FD` (`invoice_id`),
  ADD KEY `IDX_65D29B32C7440455` (`client`),
  ADD KEY `IDX_65D29B3219883967` (`method_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4FABF9833D4E91C8` (`gateway_name`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A1B588C519EB6921` (`client_id`);

--
-- Indexes for table `quote_contact`
--
ALTER TABLE `quote_contact`
  ADD PRIMARY KEY (`quote_id`,`contact_id`),
  ADD KEY `IDX_A38D4EBCDB805178` (`quote_id`),
  ADD KEY `IDX_A38D4EBCE7A1254A` (`contact_id`);

--
-- Indexes for table `quote_lines`
--
ALTER TABLE `quote_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_42FE01F7DB805178` (`quote_id`),
  ADD KEY `IDX_42FE01F7B2A824D8` (`tax_id`);

--
-- Indexes for table `recurringinvoice_contact`
--
ALTER TABLE `recurringinvoice_contact`
  ADD PRIMARY KEY (`recurringinvoice_id`,`contact_id`),
  ADD KEY `IDX_1673913EE31CCDF` (`recurringinvoice_id`),
  ADD KEY `IDX_1673913EE7A1254A` (`contact_id`);

--
-- Indexes for table `recurring_invoices`
--
ALTER TABLE `recurring_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FE93E28419EB6921` (`client_id`);

--
-- Indexes for table `security_token`
--
ALTER TABLE `security_token`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `api_tokens`
--
ALTER TABLE `api_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_token_history`
--
ALTER TABLE `api_token_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_config`
--
ALTER TABLE `app_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `client_credit`
--
ALTER TABLE `client_credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_types`
--
ALTER TABLE `contact_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ext_log_entries`
--
ALTER TABLE `ext_log_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `quote_lines`
--
ALTER TABLE `quote_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recurring_invoices`
--
ALTER TABLE `recurring_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_6FCA751619EB6921` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD CONSTRAINT `FK_2CAD560EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `api_token_history`
--
ALTER TABLE `api_token_history`
  ADD CONSTRAINT `FK_61D8DC4441DEE7B9` FOREIGN KEY (`token_id`) REFERENCES `api_tokens` (`id`);

--
-- Constraints for table `client_credit`
--
ALTER TABLE `client_credit`
  ADD CONSTRAINT `FK_4967254D19EB6921` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `FK_3340157319EB6921` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD CONSTRAINT `FK_E8092A0B5F63AD12` FOREIGN KEY (`contact_type_id`) REFERENCES `contact_types` (`id`),
  ADD CONSTRAINT `FK_E8092A0BE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `FK_6A2F2F9519EB6921` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `FK_6A2F2F95DB805178` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`);

--
-- Constraints for table `invoice_contact`
--
ALTER TABLE `invoice_contact`
  ADD CONSTRAINT `FK_BEBBD0EB2989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BEBBD0EBE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  ADD CONSTRAINT `FK_72DBDC232989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `FK_72DBDC23416CCF0F` FOREIGN KEY (`recurringInvoice_id`) REFERENCES `recurring_invoices` (`id`),
  ADD CONSTRAINT `FK_72DBDC23B2A824D8` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK_65D29B3219883967` FOREIGN KEY (`method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `FK_65D29B322989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  ADD CONSTRAINT `FK_65D29B32C7440455` FOREIGN KEY (`client`) REFERENCES `clients` (`id`);

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `FK_A1B588C519EB6921` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `quote_contact`
--
ALTER TABLE `quote_contact`
  ADD CONSTRAINT `FK_A38D4EBCDB805178` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A38D4EBCE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_lines`
--
ALTER TABLE `quote_lines`
  ADD CONSTRAINT `FK_42FE01F7B2A824D8` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `FK_42FE01F7DB805178` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`);

--
-- Constraints for table `recurringinvoice_contact`
--
ALTER TABLE `recurringinvoice_contact`
  ADD CONSTRAINT `FK_1673913EE31CCDF` FOREIGN KEY (`recurringinvoice_id`) REFERENCES `recurring_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1673913EE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recurring_invoices`
--
ALTER TABLE `recurring_invoices`
  ADD CONSTRAINT `FK_FE93E28419EB6921` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
