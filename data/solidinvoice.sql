-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2022 at 04:34 PM
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
(1, 6, '66 Falby Court', NULL, 'Ajax', 'Ontario', 'l1S 3l2', 'CA', '2022-09-18 21:04:04', '2022-10-24 15:53:40');

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
(6, 'Crossbridge Condominium', NULL, 'active', NULL, NULL, NULL, '2022-09-18 21:04:04', '2022-10-24 16:03:26');

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
(6, 6, 0, NULL, '2022-09-18 21:04:04', '2022-09-18 21:04:04');

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
(6, 6, 'Crossbridge', 'Condominium', '66falbycourt@crossbridgecs.com', '2022-09-18 21:04:04', '2022-10-24 16:03:26');

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
(58, 'create', '2022-10-24 15:54:16', '19', 'SolidInvoice\\InvoiceBundle\\Entity\\Item', 1, 'N;', 'joelm');

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
(8, 6, NULL, '0a5b6808-36d7-11ed-8ac9-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 45200, 'CAD', 40000, 'CAD', 45200, 'CAD', 5200, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:21:14', '2022-09-19 03:06:18'),
(9, 2, NULL, '27d1c706-36d7-11ed-a5e1-00d861e67d9e', 'draft', NULL, 'Send payment through email transfer.', NULL, NULL, NULL, 27120, 'CAD', 24000, 'CAD', 27120, 'CAD', 3120, 'CAD', NULL, NULL, 0, NULL, '2022-09-18 00:22:03', '2022-09-18 20:27:12'),
(10, 4, NULL, '1831ba6e-41b2-11ed-9893-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 226000, 'CAD', 200000, 'CAD', 226000, 'CAD', 26000, 'CAD', NULL, NULL, 0, NULL, '2022-10-01 19:54:28', '2022-10-01 20:02:26'),
(11, 4, NULL, '6253004a-45df-11ed-9fca-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 268488, 'CAD', 237600, 'CAD', 268488, 'CAD', 30888, 'CAD', NULL, NULL, 0, NULL, '2022-10-07 03:28:45', '2022-10-07 03:28:45'),
(12, 6, NULL, '599e289a-53a3-11ed-a44e-00d861e67d9e', 'draft', NULL, NULL, NULL, NULL, NULL, 85880, 'CAD', 76000, 'CAD', 85880, 'CAD', 9880, 'CAD', NULL, NULL, 0, NULL, '2022-10-24 15:54:16', '2022-10-24 15:54:16');

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
(8, 1),
(9, 2),
(10, 4),
(11, 4),
(12, 6);

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
(9, 8, 1, 'run coaxial for rogers and replaced  lobby potlight', 5, 8000, 'CAD', 40000, 'CAD', '2022-09-18 00:21:14', '2022-09-19 03:06:18', NULL),
(10, 9, 1, 'Suite 311, troubleshoot bedroom lighting and install new light fixture.', 3, 8000, 'CAD', 24000, 'CAD', '2022-09-18 00:22:03', '2022-09-18 20:27:12', NULL),
(11, 2, 1, 'Electrical Permit', 1, 36100, 'CAD', 36100, 'CAD', '2022-09-18 21:20:12', '2022-09-19 01:43:35', NULL),
(12, 2, 1, 'Add on 2 counter outlets', 1, 15000, 'CAD', 15000, 'CAD', '2022-09-18 21:20:12', '2022-09-19 01:43:35', NULL),
(13, 4, 1, 'electrical permit', 1, 13100, 'CAD', 13100, 'CAD', '2022-09-19 02:58:51', '2022-09-19 02:58:51', NULL),
(14, 7, 1, 'materials + 10%', 1, 18700, 'CAD', 18700, 'CAD', '2022-09-19 03:03:31', '2022-09-19 03:03:31', NULL),
(15, 7, NULL, 'material ( 10\' ladder)', 1, 33100, 'CAD', 33100, 'CAD', '2022-09-19 03:03:31', '2022-09-19 03:03:31', NULL),
(16, 10, 1, 'Electrical work (100% Completion) 16655 Yonge St Newmarket', 1, 200000, 'CAD', 200000, 'CAD', '2022-10-01 19:54:28', '2022-10-01 20:02:26', NULL),
(17, 11, 1, 'Electrical works (50% completion, 40 Mcewan Drive UD 6 Bolton)', 1, 200000, 'CAD', 200000, 'CAD', '2022-10-07 03:28:45', '2022-10-07 03:28:45', NULL),
(18, 11, 1, 'Electrical permit', 1, 37600, 'CAD', 37600, 'CAD', '2022-10-07 03:28:45', '2022-10-07 03:28:45', NULL),
(19, 12, 1, 'Electrical inspection and work (party room, pot light, lobby and offices)', 1, 76000, 'CAD', 76000, 'CAD', '2022-10-24 15:54:16', '2022-10-24 15:54:17', NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `quote_contact`
--

CREATE TABLE `quote_contact` (
  `quote_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `client_credit`
--
ALTER TABLE `client_credit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoice_lines`
--
ALTER TABLE `invoice_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote_lines`
--
ALTER TABLE `quote_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
