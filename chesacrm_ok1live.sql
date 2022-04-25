-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2022 at 12:04 PM
-- Server version: 8.0.21
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chesacrm_ok1`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_payment_settings`
--

CREATE TABLE `admin_payment_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `callback`
--

CREATE TABLE `callback` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `status` int NOT NULL,
  `datetime` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_deals`
--

CREATE TABLE `client_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_deals`
--

INSERT INTO `client_deals` (`id`, `client_id`, `deal_id`, `created_at`, `updated_at`) VALUES
(2, 7, 1, '2022-01-12 05:20:42', '2022-01-12 05:20:42'),
(4, 12, 3, '2022-02-21 22:39:09', '2022-02-21 22:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `client_permissions`
--

CREATE TABLE `client_permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_name` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT '0.00',
  `limit` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint UNSIGNED NOT NULL,
  `record_id` bigint UNSIGNED NOT NULL,
  `field_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `pipeline_id` int NOT NULL,
  `stage_id` int NOT NULL,
  `sources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `labels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `lead_id`, `name`, `price`, `pipeline_id`, `stage_id`, `sources`, `products`, `notes`, `labels`, `status`, `order`, `created_by`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 'Mr. / Mrs. Ranvijay', 9000000, 1, 2, '1', '2,7', '                    Call him to book the appointment for date 07/01/2022', NULL, 'Active', 0, 2, 1, '2022-01-12 05:20:42', '2022-02-21 22:42:48'),
(3, 9, 'Mr. / Mrs. jaybhaye', 89000, 1, 1, '1', '2', '', NULL, 'Active', 0, 2, 1, '2022-02-21 22:39:09', '2022-02-21 22:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `deal_calls`
--

CREATE TABLE `deal_calls` (
  `id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `call_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `call_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_discussions`
--

CREATE TABLE `deal_discussions` (
  `id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_emails`
--

CREATE TABLE `deal_emails` (
  `id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_files`
--

CREATE TABLE `deal_files` (
  `id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_tasks`
--

CREATE TABLE `deal_tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `from`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'New User', 'Lead', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(2, 'Assign Deal', 'Lead', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(3, 'Move Deal', 'Lead', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(4, 'Create Task', 'Lead', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(5, 'Assign Lead', 'Lead', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(6, 'Move Lead', 'Lead', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(7, 'Assign Estimation', 'Lead', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(8, 'SMS on Birthday', 'Lead', 1, '2021-09-24 23:30:34', '2021-09-24 23:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `email_template_langs`
--

CREATE TABLE `email_template_langs` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` int NOT NULL,
  `lang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_template_langs`
--

INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'Login Detail', '<p>مرحبا،&nbsp;<br>مرحبا بك في {app_name}.</p><p><b>البريد الإلكتروني </b>: {email}<br><b>كلمه السر</b> : {password}</p><p>{app_url}</p><p>شكر،<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(2, 1, 'da', 'Login Detail', '<p>Hej,&nbsp;<br>Velkommen til {app_name}.</p><p><b>E-mail </b>: {email}<br><b>Adgangskode</b> : {password}</p><p>{app_url}</p><p>Tak,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(3, 1, 'de', 'Login Detail', '<p>Hallo,&nbsp;<br>Willkommen zu {app_name}.</p><p><b>Email </b>: {email}<br><b>Passwort</b> : {password}</p><p>{app_url}</p><p>Vielen Dank,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(4, 1, 'en', 'Login Detail', '<p>Hello,&nbsp;<br>Welcome to {app_name}.</p><p><b>Email </b>: {email}<br><b>Password</b> : {password}</p><p>{app_url}</p><p>Thanks,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(5, 1, 'es', 'Login Detail', '<p>Hola,&nbsp;<br>Bienvenido a {app_name}.</p><p><b>Correo electrónico </b>: {email}<br><b>Contraseña</b> : {password}</p><p>{app_url}</p><p>Gracias,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(6, 1, 'fr', 'Login Detail', '<p>Bonjour,&nbsp;<br>Bienvenue à {app_name}.</p><p><b>Email </b>: {email}<br><b>Mot de passe</b> : {password}</p><p>{app_url}</p><p>Merci,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(7, 1, 'it', 'Login Detail', '<p>Ciao,&nbsp;<br>Benvenuto a {app_name}.</p><p><b>E-mail </b>: {email}<br><b>Parola d\'ordine</b> : {password}</p><p>{app_url}</p><p>Grazie,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(8, 1, 'ja', 'Login Detail', '<p>こんにちは、&nbsp;<br>へようこそ {app_name}.</p><p><b>Eメール </b>: {email}<br><b>パスワード</b> : {password}</p><p>{app_url}</p><p>おかげで、<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(9, 1, 'nl', 'Login Detail', '<p>Hallo,&nbsp;<br>Welkom bij {app_name}.</p><p><b>E-mail </b>: {email}<br><b>Wachtwoord</b> : {password}</p><p>{app_url}</p><p>Bedankt,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(10, 1, 'pl', 'Login Detail', '<p>Witaj,&nbsp;<br>Witamy w {app_name}.</p><p><b>E-mail </b>: {email}<br><b>Hasło</b> : {password}</p><p>{app_url}</p><p>Dzięki,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(11, 1, 'ru', 'Login Detail', '<p>Привет,&nbsp;<br>Добро пожаловать в {app_name}.</p><p><b>Электронное письмо </b>: {email}<br><b>пароль</b> : {password}</p><p>{app_url}</p><p>Спасибо,<br>{app_name}</p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(12, 2, 'ar', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">مرحبا،</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">تم تعيين صفقة جديدة لك.</span></p><p><span style=\"font-family: sans-serif;\"><b>اسم الصفقة</b> : {deal_name}<br><b>خط أنابيب الصفقة</b> : {deal_pipeline}<br><b>مرحلة الصفقة</b> : {deal_stage}<br><b>حالة الصفقة</b> : {deal_status}<br><b>سعر الصفقة</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(13, 2, 'da', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Hej,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Deal er blevet tildelt til dig.</span></p><p><span style=\"font-family: sans-serif;\"><b>Deal Navn</b> : {deal_name}<br><b>Deal Pipeline</b> : {deal_pipeline}<br><b>Deal Fase</b> : {deal_stage}<br><b>Deal status</b> : {deal_status}<br><b>Deal pris</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(14, 2, 'de', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Deal wurde Ihnen zugewiesen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Geschäftsname</b> : {deal_name}<br><b>Deal Pipeline</b> : {deal_pipeline}<br><b>Deal Stage</b> : {deal_stage}<br><b>Deal Status</b> : {deal_status}<br><b>Ausgehandelter Preis</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(15, 2, 'en', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Deal has been Assign to you.</span></p><p><span style=\"font-family: sans-serif;\"><b>Deal Name</b> : {deal_name}<br><b>Deal Pipeline</b> : {deal_pipeline}<br><b>Deal Stage</b> : {deal_stage}<br><b>Deal Status</b> : {deal_status}<br><b>Deal Price</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(16, 2, 'es', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Hola,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Deal ha sido asignado a usted.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nombre del trato</b> : {deal_name}<br><b>Tubería de reparto</b> : {deal_pipeline}<br><b>Etapa de reparto</b> : {deal_stage}<br><b>Estado del acuerdo</b> : {deal_status}<br><b>Precio de oferta</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(17, 2, 'fr', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Bonjour,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Le New Deal vous a été attribué.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nom de l\'accord</b> : {deal_name}<br><b>Pipeline de transactions</b> : {deal_pipeline}<br><b>Étape de l\'opération</b> : {deal_stage}<br><b>Statut de l\'accord</b> : {deal_status}<br><b>Prix ​​de l\'offre</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(18, 2, 'it', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Ciao,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Deal è stato assegnato a te.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nome dell\'affare</b> : {deal_name}<br><b>Pipeline di offerte</b> : {deal_pipeline}<br><b>Stage Deal</b> : {deal_stage}<br><b>Stato dell\'affare</b> : {deal_status}<br><b>Prezzo dell\'offerta</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(19, 2, 'ja', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">こんにちは、</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">新しい取引が割り当てられました。</span></p><p><span style=\"font-family: sans-serif;\"><b>取引名</b> : {deal_name}<br><b>取引パイプライン</b> : {deal_pipeline}<br><b>取引ステージ</b> : {deal_stage}<br><b>取引状況</b> : {deal_status}<br><b>取引価格</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(20, 2, 'nl', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Deal is aan u toegewezen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Dealnaam</b> : {deal_name}<br><b>Deal Pipeline</b> : {deal_pipeline}<br><b>Deal Stage</b> : {deal_stage}<br><b>Dealstatus</b> : {deal_status}<br><b>Deal prijs</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(21, 2, 'pl', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Witaj,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nowa oferta została Ci przypisana.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nazwa oferty</b> : {deal_name}<br><b>Deal Pipeline</b> : {deal_pipeline}<br><b>Etap transakcji</b> : {deal_stage}<br><b>Status oferty</b> : {deal_status}<br><b>Cena oferty</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(22, 2, 'ru', 'New Deal Assign', '<p><span style=\"font-family: sans-serif;\">Привет,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Новый курс был назначен вам.</span></p><p><span style=\"font-family: sans-serif;\"><b>Название сделки</b> : {deal_name}<br><b>Трубопровод сделки</b> : {deal_pipeline}<br><b>Этап сделки</b> : {deal_stage}<br><b>Статус сделки</b> : {deal_status}<br><b>Цена сделки</b> : {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(23, 3, 'ar', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">مرحبا،</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">تم نقل صفقة من {deal_old_stage} إلى&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">اسم الصفقة</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">خط أنابيب الصفقة</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">مرحلة الصفقة</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">حالة الصفقة</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">سعر الصفقة</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(24, 3, 'da', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Hej,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">En aftale er flyttet fra {deal_old_stage} til&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Deal Navn</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Deal Pipeline</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Deal Fase</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Deal status</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Deal pris</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(25, 3, 'de', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Ein Deal wurde verschoben {deal_old_stage} zu&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Geschäftsname</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Deal Pipeline</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Deal Stage</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Deal Status</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Ausgehandelter Preis</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(26, 3, 'en', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">A Deal has been move from {deal_old_stage} to&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Deal Name</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Deal Pipeline</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Deal Stage</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Deal Status</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Deal Price</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(27, 3, 'es', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Hola,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Se ha movido un acuerdo de {deal_old_stage} a&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Nombre del trato</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Tubería de reparto</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Etapa de reparto</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Estado del acuerdo</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Precio de oferta</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(28, 3, 'fr', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Bonjour,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Un accord a été déplacé de {deal_old_stage} à&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Nom de l\'accord</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Pipeline de transactions</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Étape de l\'opération</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Statut de l\'accord</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Prix ​​de l\'offre</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(29, 3, 'it', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Ciao,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Un affare è stato spostato da {deal_old_stage} per&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Nome dell\'affare</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Pipeline di offerte</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Stage Deal</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Stato dell\'affare</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Prezzo dell\'offerta</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(30, 3, 'ja', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">こんにちは、</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">取引は {deal_old_stage} に&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">取引名</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">取引パイプライン</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">取引ステージ</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">取引状況</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">取引価格</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(31, 3, 'nl', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Een deal is verplaatst van {deal_old_stage} naar&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Dealnaam</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Deal Pipeline</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Deal Stage</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Dealstatus</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Deal prijs</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(32, 3, 'pl', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Witaj,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Umowa została przeniesiona {deal_old_stage} do&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Nazwa oferty</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Deal Pipeline</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Etap transakcji</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Status oferty</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Cena oferty</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(33, 3, 'ru', 'Deal has been Moved', '<p><span style=\"font-family: sans-serif;\">Привет,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Сделка была перемещена из {deal_old_stage} в&nbsp; {deal_new_stage}.</span></p><p><span style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder;\">Название сделки</span>&nbsp;: {deal_name}<br><span style=\"font-weight: bolder;\">Трубопровод сделки</span>&nbsp;: {deal_pipeline}<br><span style=\"font-weight: bolder;\">Этап сделки</span>&nbsp;: {deal_stage}<br><span style=\"font-weight: bolder;\">Статус сделки</span>&nbsp;: {deal_status}<br><span style=\"font-weight: bolder;\">Цена сделки</span>&nbsp;: {deal_price}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(34, 4, 'ar', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">مرحبا،</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">تم تعيين مهمة جديدة لك.</span></p><p><span style=\"font-family: sans-serif;\"><b>اسم المهمة</b> : {task_name}<br><b>أولوية المهمة</b> : {task_priority}<br><b>حالة المهمة</b> : {task_status}<br><b>صفقة المهمة</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(35, 4, 'da', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Hej,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Ny opgave er blevet tildelt til dig.</span></p><p><span style=\"font-family: sans-serif;\"><b>Opgavens navn</b> : {task_name}<br><b>Opgaveprioritet</b> : {task_priority}<br><b>Opgavestatus</b> : {task_status}<br><b>Opgave</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(36, 4, 'de', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Neue Aufgabe wurde Ihnen zugewiesen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Aufgabennname</b> : {task_name}<br><b>Aufgabenpriorität</b> : {task_priority}<br><b>Aufgabenstatus</b> : {task_status}<br><b>Task Deal</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(37, 4, 'en', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Task has been Assign to you.</span></p><p><span style=\"font-family: sans-serif;\"><b>Task Name</b> : {task_name}<br><b>Task Priority</b> : {task_priority}<br><b>Task Status</b> : {task_status}<br><b>Task Deal</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(38, 4, 'es', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Hola,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nueva tarea ha sido asignada a usted.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nombre de la tarea</b> : {task_name}<br><b>Prioridad de tarea</b> : {task_priority}<br><b>Estado de la tarea</b> : {task_status}<br><b>Reparto de tarea</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(39, 4, 'fr', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Bonjour,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Une nouvelle tâche vous a été assignée.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nom de la tâche</b> : {task_name}<br><b>Priorité des tâches</b> : {task_priority}<br><b>Statut de la tâche</b> : {task_status}<br><b>Deal Task</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(40, 4, 'it', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Ciao,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">La nuova attività è stata assegnata a te.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nome dell\'attività</b> : {task_name}<br><b>Priorità dell\'attività</b> : {task_priority}<br><b>Stato dell\'attività</b> : {task_status}<br><b>Affare</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(41, 4, 'ja', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">こんにちは、</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">新しいタスクが割り当てられました。</span></p><p><span style=\"font-family: sans-serif;\"><b>タスク名</b> : {task_name}<br><b>タスクの優先度</b> : {task_priority}<br><b>タスクのステータス</b> : {task_status}<br><b>タスク取引</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(42, 4, 'nl', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nieuwe taak is aan u toegewezen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Opdrachtnaam</b> : {task_name}<br><b>Taakprioriteit</b> : {task_priority}<br><b>Taakstatus</b> : {task_status}<br><b>Task Deal</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(43, 4, 'pl', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Witaj,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nowe zadanie zostało Ci przypisane.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nazwa zadania</b> : {task_name}<br><b>Priorytet zadania</b> : {task_priority}<br><b>Status zadania</b> : {task_status}<br><b>Zadanie Deal</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(44, 4, 'ru', 'New Task Assign', '<p><span style=\"font-family: sans-serif;\">Привет,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Новая задача была назначена вам.</span></p><p><span style=\"font-family: sans-serif;\"><b>Название задачи</b> : {task_name}<br><b>Приоритет задачи</b> : {task_priority}<br><b>Состояние задачи</b> : {task_status}<br><b>Задача</b> : {deal_name}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(45, 5, 'ar', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">مرحبا،</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">تم تعيين عميل جديد لك.</span></p><p><span style=\"font-family: sans-serif;\"><b>اسم العميل المحتمل</b> : {lead_name}<br><b>البريد الإلكتروني الرئيسي</b> : {lead_email}<br><b>خط أنابيب الرصاص</b> : {lead_pipeline}<br><b>مرحلة الرصاص</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(46, 5, 'da', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Hej,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Ny bly er blevet tildelt dig.</span></p><p><span style=\"font-family: sans-serif;\"><b>Blynavn</b> : {lead_name}<br><b>Lead-e-mail</b> : {lead_email}<br><b>Blyrørledning</b> : {lead_pipeline}<br><b>Lead scenen</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(47, 5, 'de', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Neuer Lead wurde Ihnen zugewiesen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Lead Name</b> : {lead_name}<br><b>Lead-E-Mail</b> : {lead_email}<br><b>Lead Pipeline</b> : {lead_pipeline}<br><b>Lead Stage</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(48, 5, 'en', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Lead has been Assign to you.</span></p><p><span style=\"font-family: sans-serif;\"><b>Lead Name</b> : {lead_name}<br><b>Lead Email</b> : {lead_email}<br><b>Lead Pipeline</b> : {lead_pipeline}<br><b>Lead Stage</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(49, 5, 'es', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Hola,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Se le ha asignado un nuevo plomo.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nombre principal</b> : {lead_name}<br><b>Correo electrónico principal</b> : {lead_email}<br><b>Tubería de plomo</b> : {lead_pipeline}<br><b>Etapa de plomo</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(50, 5, 'fr', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Bonjour,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Un nouveau prospect vous a été attribué.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nom du responsable</b> : {lead_name}<br><b>Courriel principal</b> : {lead_email}<br><b>Pipeline de plomb</b> : {lead_pipeline}<br><b>Étape principale</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(51, 5, 'it', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Ciao,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Lead è stato assegnato a te.</span></p><p><span style=\"font-family: sans-serif;\"><b>Nome del lead</b> : {lead_name}<br><b>Lead Email</b> : {lead_email}<br><b>Conduttura di piombo</b> : {lead_pipeline}<br><b>Lead Stage</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(52, 5, 'ja', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">こんにちは、</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">新しいリードが割り当てられました。</span></p><p><span style=\"font-family: sans-serif;\"><b>リード名</b> : {lead_name}<br><b>リードメール</b> : {lead_email}<br><b>リードパイプライン</b> : {lead_pipeline}<br><b>リードステージ</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(53, 5, 'nl', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nieuwe lead is aan u toegewezen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Lead naam</b> : {lead_name}<br><b>E-mail leiden</b> : {lead_email}<br><b>Lead Pipeline</b> : {lead_pipeline}<br><b>Hoofdfase</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(54, 5, 'pl', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Witaj,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nowy potencjalny klient został do ciebie przypisany.</span></p><p><span style=\"font-family: sans-serif;\"><b>Imię i nazwisko</b> : {lead_name}<br><b>Główny adres e-mail</b> : {lead_email}<br><b>Ołów rurociągu</b> : {lead_pipeline}<br><b>Etap prowadzący</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(55, 5, 'ru', 'New Lead Assign', '<p><span style=\"font-family: sans-serif;\">Привет,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Новый Лид был назначен вам.</span></p><p><span style=\"font-family: sans-serif;\"><b>Имя лидера</b> : {lead_name}<br><b>Ведущий Email</b> : {lead_email}<br><b>Ведущий трубопровод</b> : {lead_pipeline}<br><b>Ведущий этап</b> : {lead_stage}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(56, 6, 'ar', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">مرحبا،</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">تم نقل العميل المحتمل من {lead_old_stage} إلى&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">اسم العميل المحتمل</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">البريد الإلكتروني الرئيسي</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">خط أنابيب الرصاص</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">مرحلة الرصاص</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(57, 6, 'da', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Hej,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">En leder er flyttet fra {lead_old_stage} til&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Blynavn</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead-e-mail</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Blyrørledning</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead scenen</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(58, 6, 'de', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Ein Lead wurde verschoben von {lead_old_stage} zu&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Name</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead-E-Mail</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Pipeline</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Stage</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(59, 6, 'en', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">A Lead has been move from {lead_old_stage} to&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Name</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Email</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Pipeline</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Stage</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(60, 6, 'es', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Hola,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Un plomo ha sido movido de {lead_old_stage} a&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Nombre principal</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Correo electrónico principal</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Tubería de plomo</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Etapa de plomo</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(61, 6, 'fr', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Bonjour,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Un lead a été déplacé de {lead_old_stage} à&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Nom du responsable</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Courriel principal</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Pipeline de plomb</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Étape principale</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(62, 6, 'it', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Ciao,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">È stato spostato un lead {lead_old_stage} per&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Nome del lead</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Email</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Conduttura di piombo</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Stage</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(63, 6, 'ja', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">こんにちは、</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">リードが移動しました {lead_old_stage} に&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">リード名</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">リードメール</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">リードパイプライン</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">リードステージ</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(64, 6, 'nl', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Er is een lead verplaatst van {lead_old_stage} naar&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead naam</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">E-mail leiden</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Lead Pipeline</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Hoofdfase</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(65, 6, 'pl', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Witaj,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Prowadzenie zostało przeniesione {lead_old_stage} do&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Imię i nazwisko</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Główny adres e-mail</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Ołów rurociągu</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Etap prowadzący</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(66, 6, 'ru', 'Lead has been Moved', '<p><span style=\"font-family: sans-serif;\">Привет,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Свинец был двигаться от {lead_old_stage} в&nbsp; {lead_new_stage}.</span></p><p><span style=\"font-weight: bolder; font-family: sans-serif;\">Имя лидера</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_name}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Ведущий Email</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_email}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Ведущий трубопровод</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_pipeline}</span><br style=\"font-family: sans-serif;\"><span style=\"font-weight: bolder; font-family: sans-serif;\">Ведущий этап</span><span style=\"font-family: sans-serif;\">&nbsp;: {lead_stage}</span><span style=\"font-family: sans-serif;\"><br></span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(67, 7, 'ar', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">مرحبا،</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">تم تعيين تقدير جديد لك.</span></p><p><span style=\"font-family: sans-serif;\"><b>معرف التقدير</b>: {estimation_name}<br><b>عميل تقدير</b> : {estimation_client}<br><b>حالة التقدير</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(68, 7, 'da', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Hej,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Ny estimering er blevet tildelt til dig.</span></p><p><span style=\"font-family: sans-serif;\"><b>Estimations-id</b>: {estimation_name}<br><b>Estimeringsklient</b> : {estimation_client}<br><b>Estimeringsstatus</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(69, 7, 'de', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Neue Schätzung wurde Ihnen zugewiesen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Schätz-Id</b>: {estimation_name}<br><b>Schätzungs-Client</b> : {estimation_client}<br><b>Schätzungsstatus</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(70, 7, 'en', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Hello,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">New Estimation has been Assign to you.</span></p><p><span style=\"font-family: sans-serif;\"><b>Estimation Id</b>: {estimation_name}<br><b>Estimation Client</b> : {estimation_client}<br><b>Estimation Status</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(71, 7, 'es', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Hola,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Se le ha asignado una nueva estimación.</span></p><p><span style=\"font-family: sans-serif;\"><b>ID de estimación</b>: {estimation_name}<br><b>Cliente de Estimación</b> : {estimation_client}<br><b>Estado de estimación</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(72, 7, 'fr', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Bonjour,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Une nouvelle estimation vous a été attribuée.</span></p><p><span style=\"font-family: sans-serif;\"><b>Identifiant d\'estimation</b>: {estimation_name}<br><b>Client d\'estimation</b> : {estimation_client}<br><b>Statut d\'estimation</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(73, 7, 'it', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Ciao,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">La nuova stima è stata assegnata a te.</span></p><p><span style=\"font-family: sans-serif;\"><b>ID stima</b>: {estimation_name}<br><b>Cliente di stima</b> : {estimation_client}<br><b>Stato della stima</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(74, 7, 'ja', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">こんにちは、</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">新しい見積もりが割り当てられました。</span></p><p><span style=\"font-family: sans-serif;\"><b>見積もりID</b>: {estimation_name}<br><b>見積もりクライアント</b> : {estimation_client}<br><b>見積もり状況</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(75, 7, 'nl', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Hallo,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nieuwe schatting is aan u toegewezen.</span></p><p><span style=\"font-family: sans-serif;\"><b>Schattings-ID</b>: {estimation_name}<br><b>Schatting Client</b> : {estimation_client}<br><b>Schattingsstatus</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(76, 7, 'pl', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Witaj,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Nowe oszacowanie zostało Ci przypisane.</span></p><p><span style=\"font-family: sans-serif;\"><b>Identyfikator szacunku</b>: {estimation_name}<br><b>Oszacowanie klienta</b> : {estimation_client}<br><b>Status oszacowania</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(77, 7, 'ru', 'New Estimation Assign', '<p><span style=\"font-family: sans-serif;\">Привет,</span><br style=\"font-family: sans-serif;\"><span style=\"font-family: sans-serif;\">Новая оценка была назначена вам.</span></p><p><span style=\"font-family: sans-serif;\"><b>Идентификатор оценки</b>: {estimation_name}<br><b>Оценка клиента</b> : {estimation_client}<br><b>Статус оценки</b> : {estimation_status}</span></p>', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(78, 8, 'en', 'Happy Birthday', '<p><font face=\"sans-serif\">Hello&nbsp;</font><span style=\"color: rgb(5, 28, 75); font-size: 12px;\">{name}</span><span style=\"font-family: sans-serif; font-size: 1rem;\">,</span></p><p><font face=\"sans-serif\">Happy Birth Day!</font></p>', '2021-09-12 08:41:07', '2021-09-25 01:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `estimations`
--

CREATE TABLE `estimations` (
  `id` bigint UNSIGNED NOT NULL,
  `estimation_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `discount` double(8,2) NOT NULL,
  `tax_id` bigint UNSIGNED NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimation_products`
--

CREATE TABLE `estimation_products` (
  `id` bigint UNSIGNED NOT NULL,
  `estimation_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `date` date NOT NULL,
  `description` varchar(250) NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `description`, `time`, `created_at`, `updated_at`) VALUES
(1, 'Promotinal', '2022-02-18', 'Promotinal Event', '02:00:00', '2022-02-17 06:49:43', '2022-02-17 06:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Meeting', '', 2, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(2, 'Product', '', 2, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(3, 'Repair', '', 2, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(4, 'Travel', '', 2, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(5, 'Meeting', '', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(6, 'Product', '', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(7, 'Repair', '', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(8, 'Travel', '', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(9, 'Meeting', '', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(10, 'Product', '', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(11, 'Repair', '', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(12, 'Travel', '', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `favorite_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form_builders`
--

CREATE TABLE `form_builders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `is_lead_active` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_builders`
--

INSERT INTO `form_builders` (`id`, `name`, `code`, `is_active`, `is_lead_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'email cam', '6149bd231c9411632222499', 1, 0, 2, '2021-09-21 05:38:19', '2021-09-21 05:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `form_fields`
--

CREATE TABLE `form_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_field_responses`
--

CREATE TABLE `form_field_responses` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `subject_id` int NOT NULL,
  `name_id` int NOT NULL,
  `email_id` int NOT NULL,
  `user_id` int NOT NULL,
  `pipeline_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `form_responses`
--

CREATE TABLE `form_responses` (
  `id` bigint UNSIGNED NOT NULL,
  `form_id` bigint UNSIGNED NOT NULL,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` double(8,2) NOT NULL,
  `tax_id` bigint UNSIGNED NOT NULL,
  `terms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED NOT NULL,
  `client_id` int NOT NULL DEFAULT '0',
  `invoice_id` bigint UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `payment_id` bigint UNSIGNED NOT NULL,
  `payment_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pipeline_id` int NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `name`, `color`, `pipeline_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Fresh Lead', 'primary', 1, 2, '2021-09-12 08:41:14', '2021-09-30 01:48:36'),
(2, 'HOT', 'danger', 1, 2, '2021-09-12 08:41:14', '2021-09-30 01:48:50'),
(3, 'WARM', 'warning', 1, 2, '2021-09-12 08:41:14', '2021-09-30 01:49:02'),
(4, 'Cold', 'warning', 1, 2, '2022-01-06 07:18:40', '2022-01-06 07:18:40'),
(5, 'Fresh Lead', 'primary', 2, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(6, 'HOT', 'danger', 2, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(7, 'WARM', 'warning', 2, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(8, 'Fresh Lead', 'primary', 3, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(9, 'HOT', 'danger', 3, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(10, 'WARM', 'warning', 3, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `landing_page_sections`
--

CREATE TABLE `landing_page_sections` (
  `id` bigint UNSIGNED NOT NULL,
  `section_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_order` int NOT NULL DEFAULT '0',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `section_type` enum('section-1','section-2','section-3','section-4','section-5','section-6','section-7','section-8','section-9','section-10','section-plan') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_demo_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_blade_file_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `landing_page_sections`
--

INSERT INTO `landing_page_sections` (`id`, `section_name`, `section_order`, `content`, `section_type`, `default_content`, `section_demo_image`, `section_blade_file_name`, `created_at`, `updated_at`) VALUES
(1, 'section-1', 1, '{\"logo\":\"landing_logo.png\",\"image\":\"top-banner.png\",\"button\":{\"text\":\"Login\"},\"menu\":[{\"menu\":\"Features\",\"href\":\"#\"},{\"menu\":\"Pricing\",\"href\":\"#\"}],\"text\":{\"text-1\":\"Chesa CRM\",\"text-2\":\"Lead Management Tool\",\"text-3\":\"...\",\"text-4\":\"get started - its free\",\"text-5\":\"no credit card required\"},\"custom_class_name\":\"\"}', 'section-1', '{\"logo\":\"landing_logo.png\",\"image\":\"top-banner.png\",\"button\":{\"text\":\"Login\"},\"menu\":[{\"menu\":\"Features\",\"href\":\"#\"},{\"menu\":\"Pricing\",\"href\":\"#\"}],\"text\":{\"text-1\":\"LeadGo\",\"text-2\":\"Lead Management Tool\",\"text-3\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"text-4\":\"get started - its free\",\"text-5\":\"no creadit card reqired\"},\"custom_class_name\":\"\"}', 'top-header-section.png', 'custome-top-header-section', '2021-09-12 08:41:13', '2021-11-27 21:05:56'),
(2, 'section-2', 2, '{\"image\":\"cal-sec.png\",\"button\":{\"text\":\"try our system\",\"href\":\"#\"},\"text\":{\"text-1\":\"Features\",\"text-2\":\"Lorem Ipsum is simply dummy\",\"text-3\":\"text of the printing\",\"text-4\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting\"},\"image_array\":[{\"id\":1,\"image\":\"nexo.png\"},{\"id\":2,\"image\":\"edge.png\"},{\"id\":3,\"image\":\"atomic.png\"},{\"id\":4,\"image\":\"brd.png\"},{\"id\":5,\"image\":\"trust.png\"},{\"id\":6,\"image\":\"keep-key.png\"},{\"id\":7,\"image\":\"atomic.png\"},{\"id\":8,\"image\":\"edge.png\"}],\"custom_class_name\":\"\"}', 'section-2', '{\"image\":\"cal-sec.png\",\"button\":{\"text\":\"try our system\",\"href\":\"#\"},\"text\":{\"text-1\":\"Features\",\"text-2\":\"Lorem Ipsum is simply dummy\",\"text-3\":\"text of the printing\",\"text-4\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting\"},\"image_array\":[{\"id\":1,\"image\":\"nexo.png\"},{\"id\":2,\"image\":\"edge.png\"},{\"id\":3,\"image\":\"atomic.png\"},{\"id\":4,\"image\":\"brd.png\"},{\"id\":5,\"image\":\"trust.png\"},{\"id\":6,\"image\":\"keep-key.png\"},{\"id\":7,\"image\":\"atomic.png\"},{\"id\":8,\"image\":\"edge.png\"}],\"custom_class_name\":\"\"}', 'logo-part-main-back-part.png', 'custome-logo-part-main-back-part', '2021-09-12 08:41:13', '2021-11-12 05:35:38'),
(3, 'section-3', 9, '', 'section-3', '{\"image\": \"sec-2.png\",\"button\": {\"text\": \"try our system\",\"href\": \"#\"},\"text\": {\"text-1\": \"Features\",\"text-2\": \"Lorem Ipsum is simply dummy\",\"text-3\": \"text of the printing\",\"text-4\": \"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting\"},\"custom_class_name\":\"\"}', 'simple-sec-even.png', 'custome-simple-sec-even', '2021-09-12 08:41:13', '2021-11-12 05:35:26'),
(5, 'section-5', 3, '{\"button\": {\"text\": \"TRY OUR SYSTEM\",\"href\": \"#\"},\"text\": {\"text-1\": \"See more features\",\"text-2\": \"All Features\",\"text-3\": \"in one place\",\"text-4\": \"Attractive Dashboard Customer & Vendor Login Multi Languages\",\"text-5\":\"Invoice, Billing & Transaction Multi User & Permission Paypal & Stripe for Invoice User Friendly Invoice Theme Make your own setting\",\"text-6\":\"Multi User & Permission Paypal & Stripe for Invoice User Friendly Invoice Theme Make your own setting\",\"text-7\":\"Multi User & Permission Paypal & Stripe for Invoice User Friendly Invoice Theme Make your own setting User Friendly Invoice Theme Make your own setting\",\"text-8\":\"Multi User & Permission Paypal & Stripe for Invoice\"},\"custom_class_name\":\"\"}', 'section-5', '{\"button\": {\"text\": \"TRY OUR SYSTEM\",\"href\": \"#\"},\"text\": {\"text-1\": \"See more features\",\"text-2\": \"All Features\",\"text-3\": \"in one place\",\"text-4\": \"Attractive Dashboard Customer & Vendor Login Multi Languages\",\"text-5\":\"Invoice, Billing & Transaction Multi User & Permission Paypal & Stripe for Invoice User Friendly Invoice Theme Make your own setting\",\"text-6\":\"Multi User & Permission Paypal & Stripe for Invoice User Friendly Invoice Theme Make your own setting\",\"text-7\":\"Multi User & Permission Paypal & Stripe for Invoice User Friendly Invoice Theme Make your own setting User Friendly Invoice Theme Make your own setting\",\"text-8\":\"Multi User & Permission Paypal & Stripe for Invoice\"},\"custom_class_name\":\"\"}', 'features-inner-part.png', 'custome-features-inner-part', '2021-09-12 08:41:13', '2021-11-12 05:35:25'),
(6, 'section-6', 4, '{\"system\":[{\"id\":1,\"name\":\"Dashboard\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"},{\"data_id\":3,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-3.png\"},{\"data_id\":4,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":5,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"}]},{\"id\":2,\"name\":\"Functions\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"},{\"data_id\":3,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-3.png\"}]},{\"id\":3,\"name\":\"Reports\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"}]},{\"id\":4,\"name\":\"Tables\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"},{\"data_id\":3,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-3.png\"},{\"data_id\":4,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"}]},{\"id\":5,\"name\":\"Settings\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"}]},{\"id\":6,\"name\":\"Contact\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"}]}],\"custom_class_name\":\"\"}', 'section-6', '{\"system\":[{\"id\":1,\"name\":\"Dashboard\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"},{\"data_id\":3,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-3.png\"},{\"data_id\":4,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":5,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"}]},{\"id\":2,\"name\":\"Functions\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"},{\"data_id\":3,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-3.png\"}]},{\"id\":3,\"name\":\"Reports\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"}]},{\"id\":4,\"name\":\"Tables\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"},{\"data_id\":3,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-3.png\"},{\"data_id\":4,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"}]},{\"id\":5,\"name\":\"Settings\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"},{\"data_id\":2,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-2.png\"}]},{\"id\":6,\"name\":\"Contact\",\"data\":[{\"data_id\":1,\"text\":{\"text_1\":\"Dashboard\",\"text_2\":\"Main Page\"},\"button\":{\"text\":\"LIVE DEMO\",\"href\":\"#\"},\"image\":\"tab-1.png\"}]}],\"custom_class_name\":\"\"}', 'container-our-system-div.png', 'custome-container-our-system-div', '2021-09-12 08:41:13', '2021-11-12 05:35:25'),
(7, 'section-7', 11, NULL, 'section-7', '{\"testimonials\":[{\"id\":1,\"text\":{\"text_1\":\"We have been building AI projects for a long time and we decided it was time to build a platform that can streamline the broken process that we had to put up with. Here are some of the key things we wish we had when we were building projects before.\",\"text_2\":\"Lorem Ipsum\",\"text_3\":\"Founder and CEO at Rajodiya Infotech\"},\"image\":\"testimonials-img.png\"},{\"id\":2,\"text\":{\"text_1\":\"We have been building AI projects for a long time and we decided it was time to build a platform that can streamline the broken process that we had to put up with. Here are some of the key things we wish we had when we were building projects before.\",\"text_2\":\"Lorem Ipsum\",\"text_3\":\"Founder and CEO at Rajodiya Infotech\"},\"image\":\"testimonials-img.png\"},{\"id\":3,\"text\":{\"text_1\":\"We have been building AI projects for a long time and we decided it was time to build a platform that can streamline the broken process that we had to put up with. Here are some of the key things we wish we had when we were building projects before.\",\"text_2\":\"Lorem Ipsum\",\"text_3\":\"Founder and CEO at Rajodiya Infotech\"},\"image\":\"testimonials-img.png\"},{\"id\":4,\"text\":{\"text_1\":\"We have been building AI projects for a long time and we decided it was time to build a platform that can streamline the broken process that we had to put up with. Here are some of the key things we wish we had when we were building projects before.\",\"text_2\":\"Lorem Ipsum\",\"text_3\":\"Founder and CEO at Rajodiya Infotech\"},\"image\":\"testimonials-img.png\"},{\"id\":5,\"text\":{\"text_1\":\"We have been building AI projects for a long time and we decided it was time to build a platform that can streamline the broken process that we had to put up with. Here are some of the key things we wish we had when we were building projects before.\",\"text_2\":\"Lorem Ipsum\",\"text_3\":\"Founder and CEO at Rajodiya Infotech\"},\"image\":\"testimonials-img.png\"}],\"custom_class_name\":\"\"}', 'testimonials-section.png', 'custome-testimonials-section', '2021-09-12 08:41:13', '2021-11-12 05:34:45'),
(8, ' section-plan', 5, 'plan', 'section-plan', 'plan', 'plan-section.png', 'plan-section', '2021-09-12 08:41:13', '2021-11-12 05:35:25'),
(9, 'section-8', 6, '{\"button\":{\"text\":\"Subscribe\"},\"text\":{\"text-1\":\"Try for free\",\"text-2\":\"Lorem Ipsum is simply dummy text\",\"text-3\":\"of the printing and typesetting industry\",\"text-4\":\"Type your email address and click the button\"},\"custom_class_name\":\"\"}', 'section-8', '{\"button\":{\"text\":\"Subscribe\"},\"text\":{\"text-1\":\"Try for free\",\"text-2\":\"Lorem Ipsum is simply dummy text\",\"text-3\":\"of the printing and typesetting industry\",\"text-4\":\"Type your email address and click the button\"},\"custom_class_name\":\"\"}', 'subscribe-part.png', 'custome-subscribe-part', '2021-09-12 08:41:13', '2021-11-12 05:35:25'),
(10, 'section-9', 7, '{\"menu\":[{\"menu\":\"Facebook\",\"href\":\"#\"},{\"menu\":\"LinkedIn\",\"href\":\"#\"},{\"menu\":\"Twitter\",\"href\":\"#\"},{\"menu\":\"Discord\",\"href\":\"#\"}],\"custom_class_name\":\"\"}', 'section-9', '{\"menu\":[{\"menu\":\"Facebook\",\"href\":\"#\"},{\"menu\":\"LinkedIn\",\"href\":\"#\"},{\"menu\":\"Twitter\",\"href\":\"#\"},{\"menu\":\"Discord\",\"href\":\"#\"}],\"custom_class_name\":\"\"}', 'social-links.png', 'custome-social-links', '2021-09-12 08:41:13', '2021-11-12 05:35:25'),
(11, 'section-10', 8, '{\"footer\":{\"logo\":{\"logo\":\"landing_logo.png\",\"text\":\"All rights reserved.\"},\"footer_menu\":[{\"id\":1,\"menu\":\"FIO Protocol\",\"data\":[{\"menu_name\":\"Feature\",\"menu_href\":\"#\"},{\"menu_name\":\"Download\",\"menu_href\":\"#\"},{\"menu_name\":\"Integration\",\"menu_href\":\"#\"},{\"menu_name\":\"Extras\",\"menu_href\":\"#\"}]},{\"id\":2,\"menu\":\"Learn\",\"data\":[{\"menu_name\":\"Feature\",\"menu_href\":\"#\"},{\"menu_name\":\"Download\",\"menu_href\":\"#\"},{\"menu_name\":\"Integration\",\"menu_href\":\"#\"},{\"menu_name\":\"Extras\",\"menu_href\":\"#\"}]},{\"id\":3,\"menu\":\"Foundation\",\"data\":[{\"menu_name\":\"About Us\",\"menu_href\":\"#\"},{\"menu_name\":\"Customers\",\"menu_href\":\"#\"},{\"menu_name\":\"Resources\",\"menu_href\":\"#\"},{\"menu_name\":\"Blog\",\"menu_href\":\"#\"}]}],\"contact_app\":[{\"menu\":\"Contact\",\"data\":[{\"id\":1,\"image\":\"app-store.png\",\"image_href\":\"#\"},{\"id\":2,\"image\":\"google-pay.png\",\"image_href\":\"#\"}]}],\"bottom_menu\":{\"text\":\"All rights reserved.\",\"data\":[{\"menu_name\":\"Privacy Policy\",\"menu_href\":\"#\"},{\"menu_name\":\"Github\",\"menu_href\":\"#\"},{\"menu_name\":\"Press Kit\",\"menu_href\":\"#\"},{\"menu_name\":\"Contact\",\"menu_href\":\"#\"}]}},\"custom_class_name\":\"\"}', 'section-10', '{\"footer\":{\"logo\":{\"logo\":\"landing_logo.png\",\"text\":\"All rights reserved.\"},\"footer_menu\":[{\"id\":1,\"menu\":\"FIO Protocol\",\"data\":[{\"menu_name\":\"Feature\",\"menu_href\":\"#\"},{\"menu_name\":\"Download\",\"menu_href\":\"#\"},{\"menu_name\":\"Integration\",\"menu_href\":\"#\"},{\"menu_name\":\"Extras\",\"menu_href\":\"#\"}]},{\"id\":2,\"menu\":\"Learn\",\"data\":[{\"menu_name\":\"Feature\",\"menu_href\":\"#\"},{\"menu_name\":\"Download\",\"menu_href\":\"#\"},{\"menu_name\":\"Integration\",\"menu_href\":\"#\"},{\"menu_name\":\"Extras\",\"menu_href\":\"#\"}]},{\"id\":3,\"menu\":\"Foundation\",\"data\":[{\"menu_name\":\"About Us\",\"menu_href\":\"#\"},{\"menu_name\":\"Customers\",\"menu_href\":\"#\"},{\"menu_name\":\"Resources\",\"menu_href\":\"#\"},{\"menu_name\":\"Blog\",\"menu_href\":\"#\"}]}],\"contact_app\":[{\"menu\":\"Contact\",\"data\":[{\"id\":1,\"image\":\"app-store.png\",\"image_href\":\"#\"},{\"id\":2,\"image\":\"google-pay.png\",\"image_href\":\"#\"}]}],\"bottom_menu\":{\"text\":\"All rights reserved.\",\"data\":[{\"menu_name\":\"Privacy Policy\",\"menu_href\":\"#\"},{\"menu_name\":\"Github\",\"menu_href\":\"#\"},{\"menu_name\":\"Press Kit\",\"menu_href\":\"#\"},{\"menu_name\":\"Contact\",\"menu_href\":\"#\"}]}},\"custom_class_name\":\"\"}', 'footer-section.png', 'custome-footer-section', '2021-09-12 08:41:13', '2021-11-12 05:35:25'),
(12, 'section-4', 10, '', 'section-4', '{\"image\": \"sec-3.png\",\"button\": {\"text\": \"try our system\",\"href\": \"#\"},\"text\": {\"text-1\": \"Features\",\"text-2\": \"Lorem Ipsum is simply dummy\",\"text-3\": \"text of the printing\",\"text-4\": \"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting\"},\"custom_class_name\":\"\"}', 'simple-sec-odd.png', 'custome-simple-sec-odd', '2021-11-12 05:40:45', '2021-11-12 05:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `callback` int NOT NULL DEFAULT '0',
  `pipeline_id` int NOT NULL,
  `stage_id` int NOT NULL,
  `sources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `labels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `is_converted` int NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mob` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_sms` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `my_loan` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `name`, `email`, `subject`, `user_id`, `callback`, `pipeline_id`, `stage_id`, `sources`, `products`, `notes`, `labels`, `order`, `created_by`, `is_active`, `is_converted`, `date`, `created_at`, `updated_at`, `mob`, `send_mail`, `send_sms`, `my_loan`) VALUES
(2, 'Ranvijay', 'ranvijay1@gmail.com', 'loan', 6, 0, 1, 2, '1', '7', '                    Call him to book the appointment for date 07/01/2022', '2', 0, 2, 1, 1, '2022-01-06', '2022-01-06 02:19:43', '2022-02-21 06:22:11', '0000000000', NULL, NULL, '9000000'),
(3, 'Maddy', 'maddy@gmail.com', 'loan', 4, 0, 1, 2, '1', '5', NULL, '4', 0, 2, 1, 0, '2022-01-06', '2022-01-06 02:31:30', '2022-02-21 06:21:48', '1234567890', NULL, NULL, '50000000'),
(4, 'Vishal', 'vishal@gmail.com', 'loan', 4, 0, 1, 2, '3', '2', NULL, NULL, 0, 2, 1, 0, '2022-01-06', '2022-01-06 02:33:47', '2022-01-06 07:38:33', '1234567890', NULL, NULL, '10000000'),
(5, 'Shree', 'shree@gmail.com', 'loan', 6, 0, 1, 2, '1', '5', NULL, NULL, 0, 2, 1, 0, '2022-01-06', '2022-01-06 07:42:45', '2022-01-06 07:47:53', '1234567890', NULL, NULL, '450000000'),
(6, 'Bee', 'bee@gmail.com', 'loan', 4, 0, 1, 5, '3', '8', NULL, NULL, 0, 2, 1, 0, '2022-01-08', '2022-01-07 21:05:03', '2022-01-12 06:05:28', '9999999999', NULL, NULL, '9500000'),
(7, 'nitin', 'nitin@gmail.com', 'loan', 4, 0, 1, 1, '1', '6', NULL, NULL, 0, 2, 1, 0, '2022-01-08', '2022-01-08 00:16:40', '2022-01-08 00:16:40', '9898989898', NULL, NULL, '10000000'),
(8, 'Roshan', 'roshansingh97@gmail.com', 'loan', 3, 0, 1, 2, '1', '2', NULL, NULL, 0, 2, 1, 0, '2022-01-10', '2022-01-10 00:51:14', '2022-01-10 00:59:16', '5656616515', NULL, NULL, '111'),
(9, 'jaybhaye', 'k@gmail.com', 'loan', 4, 0, 1, 2, '1', '2', '', NULL, 0, 2, 1, 3, '2022-01-12', '2022-01-12 02:10:53', '2022-02-21 22:39:10', '9875641230', NULL, NULL, '89000'),
(10, 'rohit', 'krtyhty@gmail.com', 'loan', 4, 0, 1, 5, '3', '5', '', '3', 0, 2, 1, 0, '2022-01-12', '2022-01-12 03:45:35', '2022-02-14 04:08:36', '8794562258', NULL, NULL, '8000000'),
(12, 'rohit', 's@gmail.com', 'loan', 21, 0, 1, 1, '3', '5', '', '3', 0, 2, 1, 0, '2022-01-12', '2022-01-12 03:45:35', '2022-01-29 06:27:03', '8794562258', NULL, NULL, '80000'),
(13, 'snehal', 'swapnal222i@gmail.com', 'loan', 4, 0, 1, 2, '1', '2', '', NULL, 0, 2, 1, 0, '2022-02-11', '2022-02-10 23:58:31', '2022-02-14 03:09:18', '1234567890', NULL, NULL, '2342'),
(14, 'swati', 'swati@gmail.com', 'loan', 4, 0, 1, 2, '1', '2', '', NULL, 0, 2, 1, 0, '2022-02-12', '2022-02-12 06:51:33', '2022-02-14 04:15:10', '1234567890', NULL, NULL, '0'),
(15, 'Vasu', 'vasu@gmail.com', 'loan', 4, 0, 1, 2, '3', '2', NULL, '1', 0, 2, 1, 0, '2022-02-17', '2022-02-17 17:12:27', '2022-02-18 02:38:26', '1234567890', 'on', 'on', '1000');

-- --------------------------------------------------------

--
-- Table structure for table `lead_activities`
--

CREATE TABLE `lead_activities` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `usr` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `venue` varchar(230) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` date NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_activities`
--

INSERT INTO `lead_activities` (`id`, `lead_id`, `usr`, `date`, `time`, `venue`, `status`, `updated_at`, `created_at`) VALUES
(1, 1, '2', '2022-01-08', '13:00', 'Bavdhan', 'Rejected', '2022-01-08', '2022-01-06'),
(3, 3, '2', '2022-01-06', '11:00', 'Kasba Peth', 'Todays Appointment', '2022-01-06', '2022-01-06'),
(5, 2, '2', '2022-01-07', '11:00', 'Bavdhan', 'Rejected', '2022-02-15', '2022-01-06'),
(6, 4, '2', '2022-01-08', '11:00', 'pashan', 'Todays Appointment', '2022-01-06', '2022-01-06'),
(7, 5, '2', '2022-01-07', '11:00', 'Dubai', 'Todays Appointment', '2022-01-06', '2022-01-06'),
(8, 8, '3', '2022-01-13', '11:01', NULL, 'Todays Appointment', '2022-01-10', '2022-01-10'),
(9, 10, '2', '1991-02-12', '15:07', '80000', 'Rejected', '2022-02-14', '2022-01-12'),
(10, 9, '2', '1991-12-04', '16:12', '80000', 'Todays Appointment', '2022-02-08', '2022-01-12'),
(11, 6, '2', '1990-04-12', '17:05', '80000', 'Rejected', '2022-01-12', '2022-01-12'),
(12, 13, '2', '2021-09-26', '00:00', NULL, 'Todays Appointment', '2022-02-11', '2022-02-11'),
(13, 13, '2', '2022-02-10', '05:55', NULL, 'Todays Appointment', '2022-02-11', '2022-02-11'),
(14, 14, '2', '2022-02-17', '11:21', NULL, 'Ready To Settle', '2022-02-14', '2022-02-14'),
(15, 14, '2', '2022-02-25', '11:01', NULL, 'Todays Appointment', '2022-02-14', '2022-02-14'),
(16, 2, '2', '2022-02-15', '11:11', NULL, 'Todays Appointment', '2022-02-15', '2022-02-15'),
(17, 2, '2', '2022-02-15', '11:11', NULL, 'Todays Appointment', '2022-02-15', '2022-02-15'),
(18, 3, '2', '2022-02-15', '11:11', NULL, 'Initial Disscussion', '2022-02-15', '2022-02-15'),
(19, 15, '2', '2022-02-18', '13:38', 'baee', 'Todays Appointment', '2022-02-18', '2022-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `lead_activity_logs`
--

CREATE TABLE `lead_activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `log_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_activity_logs`
--

INSERT INTO `lead_activity_logs` (`id`, `user_id`, `lead_id`, `log_type`, `remark`, `created_at`, `updated_at`) VALUES
(4, 2, 2, 'Initial Disscussion', '{\"title\":\"Initial Disscussion\"}', '2022-01-06 02:24:22', '2022-01-06 02:24:22'),
(5, 2, 3, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-01-06 02:34:27', '2022-01-06 02:34:27'),
(6, 2, 3, 'Initial Disscussion', '{\"title\":\"Initial Disscussion\"}', '2022-01-06 02:54:34', '2022-01-06 02:54:34'),
(7, 2, 2, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-01-06 07:37:53', '2022-01-06 07:37:53'),
(8, 2, 4, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-01-06 07:38:33', '2022-01-06 07:38:33'),
(9, 2, 5, 'Initial Disscussion', '{\"title\":\"Initial Disscussion\"}', '2022-01-06 07:44:47', '2022-01-06 07:44:47'),
(10, 2, 2, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-01-06 07:58:11', '2022-01-06 07:58:11'),
(11, 2, 2, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-01-06 07:59:25', '2022-01-06 07:59:25'),
(12, 2, 2, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-01-06 08:01:02', '2022-01-06 08:01:02'),
(13, 2, 2, 'Existing Loan Added', '{\"title\":\"Existing Loan Stored in DB\"}', '2022-01-06 08:04:49', '2022-01-06 08:04:49'),
(14, 2, 2, 'Loan Application Detail Updated', '{\"title\":\"Loan Application Detail successfully created!\"}', '2022-01-06 08:06:01', '2022-01-06 08:06:01'),
(15, 2, 3, 'Loan Application Detail Updated', '{\"title\":\"Loan Application Detail successfully created!\"}', '2022-01-07 04:07:12', '2022-01-07 04:07:12'),
(16, 2, 4, 'Loan Application Detail Updated', '{\"title\":\"Loan Application Detail successfully created!\"}', '2022-01-07 04:13:00', '2022-01-07 04:13:00'),
(17, 2, 5, 'Loan Application Detail Updated', '{\"title\":\"Loan Application Detail successfully created!\"}', '2022-01-07 04:17:34', '2022-01-07 04:17:34'),
(18, 3, 8, 'Loan Application Detail Updated', '{\"title\":\"Loan Application Detail successfully created!\"}', '2022-01-10 00:55:08', '2022-01-10 00:55:08'),
(19, 3, 8, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-01-10 00:59:16', '2022-01-10 00:59:16'),
(20, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-01-12 03:49:11', '2022-01-12 03:49:11'),
(21, 2, 10, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-01-12 03:50:41', '2022-01-12 03:50:41'),
(22, 2, 10, 'Upload File', '{\"file_name\":\"readme.txt\"}', '2022-01-12 03:56:51', '2022-01-12 03:56:51'),
(23, 2, 10, 'Done With Collection', '{\"title\":\"Done With Collection\"}', '2022-01-12 04:07:20', '2022-01-12 04:07:20'),
(24, 2, 9, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-01-12 04:12:52', '2022-01-12 04:12:52'),
(25, 2, 9, 'Loan Application Detail Updated', '{\"title\":\"Loan Application Detail successfully created!\"}', '2022-01-12 04:15:15', '2022-01-12 04:15:15'),
(26, 2, 9, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-01-12 04:17:00', '2022-01-12 04:17:00'),
(27, 2, 9, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-01-12 04:18:38', '2022-01-12 04:18:38'),
(28, 2, 9, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-01-12 04:22:11', '2022-01-12 04:22:11'),
(29, 2, 6, 'Rejected', '{\"title\":\"Rejected\"}', '2022-01-12 06:05:28', '2022-01-12 06:05:28'),
(30, 2, 10, 'Existing Loan Added', '{\"title\":\"Existing Loan Stored in DB\"}', '2022-01-31 01:44:05', '2022-01-31 01:44:05'),
(31, 2, 10, 'Existing Loan Added', '{\"title\":\"Existing Loan Stored in DB\"}', '2022-01-31 02:49:23', '2022-01-31 02:49:23'),
(32, 2, 10, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-02-07 03:31:41', '2022-02-07 03:31:41'),
(33, 2, 10, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-02-07 03:32:07', '2022-02-07 03:32:07'),
(34, 2, 10, 'Update Case Structuring Detail', '{\"title\":\"Case Structuring Detail Updated\"}', '2022-02-07 03:38:50', '2022-02-07 03:38:50'),
(35, 2, 10, 'Update Case Structuring Detail', '{\"title\":\"Case Structuring Detail Updated\"}', '2022-02-07 03:46:15', '2022-02-07 03:46:15'),
(36, 2, 10, 'Existing Loan Added', '{\"title\":\"Existing Loan Stored in DB\"}', '2022-02-08 05:55:54', '2022-02-08 05:55:54'),
(37, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-08 06:28:55', '2022-02-08 06:28:55'),
(38, 2, 10, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-02-08 06:38:13', '2022-02-08 06:38:13'),
(39, 2, 10, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-02-08 06:46:31', '2022-02-08 06:46:31'),
(40, 2, 10, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-02-08 06:48:52', '2022-02-08 06:48:52'),
(41, 2, 10, 'Existing Loan Added', '{\"title\":\"Existing Loan Stored in DB\"}', '2022-02-08 07:00:33', '2022-02-08 07:00:33'),
(42, 2, 10, 'Existing Loan Added', '{\"title\":\"Existing Loan Stored in DB\"}', '2022-02-08 08:07:04', '2022-02-08 08:07:04'),
(43, 2, 10, 'Existing Loan Added', '{\"title\":\"Existing Loan Stored in DB\"}', '2022-02-08 08:07:12', '2022-02-08 08:07:12'),
(44, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 00:06:59', '2022-02-10 00:06:59'),
(45, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 00:09:37', '2022-02-10 00:09:37'),
(46, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 00:18:40', '2022-02-10 00:18:40'),
(47, 2, 10, 'Update Mortgage Detail', '{\"title\":\"Mortgage Detail Updated\"}', '2022-02-10 04:18:06', '2022-02-10 04:18:06'),
(48, 2, 5, 'Update Case Structuring Detail', '{\"title\":\"Case Structuring Detail Updated\"}', '2022-02-10 05:51:43', '2022-02-10 05:51:43'),
(49, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:07:36', '2022-02-10 07:07:36'),
(50, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:08:58', '2022-02-10 07:08:58'),
(51, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:10:57', '2022-02-10 07:10:57'),
(52, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:15:27', '2022-02-10 07:15:27'),
(53, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:15:44', '2022-02-10 07:15:44'),
(54, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:16:30', '2022-02-10 07:16:30'),
(55, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:16:54', '2022-02-10 07:16:54'),
(56, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:24:30', '2022-02-10 07:24:30'),
(57, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:27:40', '2022-02-10 07:27:40'),
(58, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:29:18', '2022-02-10 07:29:18'),
(59, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:29:37', '2022-02-10 07:29:37'),
(60, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:34:06', '2022-02-10 07:34:06'),
(61, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:34:56', '2022-02-10 07:34:56'),
(62, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:39:34', '2022-02-10 07:39:34'),
(63, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:43:31', '2022-02-10 07:43:31'),
(64, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:46:30', '2022-02-10 07:46:30'),
(65, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:47:39', '2022-02-10 07:47:39'),
(66, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:47:47', '2022-02-10 07:47:47'),
(67, 2, 9, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:49:12', '2022-02-10 07:49:12'),
(68, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:49:59', '2022-02-10 07:49:59'),
(69, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:52:38', '2022-02-10 07:52:38'),
(70, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:54:09', '2022-02-10 07:54:09'),
(71, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 07:59:56', '2022-02-10 07:59:56'),
(72, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 08:00:10', '2022-02-10 08:00:10'),
(73, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 08:05:25', '2022-02-10 08:05:25'),
(74, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 08:16:55', '2022-02-10 08:16:55'),
(75, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 08:20:10', '2022-02-10 08:20:10'),
(76, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 08:21:33', '2022-02-10 08:21:33'),
(77, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 08:22:19', '2022-02-10 08:22:19'),
(78, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-10 22:39:40', '2022-02-10 22:39:40'),
(79, 2, 13, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-02-11 03:59:47', '2022-02-11 03:59:47'),
(80, 2, 13, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-02-11 04:00:11', '2022-02-11 04:00:11'),
(81, 2, 10, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-13 22:42:05', '2022-02-13 22:42:05'),
(82, 2, 14, 'Meeting Done', '{\"title\":\"Meeting Done\"}', '2022-02-14 04:09:37', '2022-02-14 04:09:37'),
(83, 2, 14, 'Loan Application Detail Updated', '{\"title\":\"Loan Application Detail successfully created!\"}', '2022-02-14 04:10:06', '2022-02-14 04:10:06'),
(84, 2, 14, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-02-14 04:15:10', '2022-02-14 04:15:10'),
(85, 2, 2, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-02-14 23:29:00', '2022-02-14 23:29:00'),
(86, 2, 2, 'Update Case Structuring Detail', '{\"title\":\"Case Structuring Detail Updated\"}', '2022-02-15 03:12:22', '2022-02-15 03:12:22'),
(87, 2, 2, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-02-15 04:07:01', '2022-02-15 04:07:01'),
(88, 2, 3, 'Initial Disscussion', '{\"title\":\"Initial Disscussion\"}', '2022-02-15 04:09:50', '2022-02-15 04:09:50'),
(89, 2, 3, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-16 07:46:06', '2022-02-16 07:46:06'),
(90, 2, 15, 'Todays Appointment', '{\"title\":\"Todays Appointment\"}', '2022-02-18 02:38:26', '2022-02-18 02:38:26'),
(91, 2, 2, 'Update Case Structuring Detail', '{\"title\":\"Case Structuring Detail Updated\"}', '2022-02-18 05:57:54', '2022-02-18 05:57:54'),
(92, 2, 9, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-18 07:11:14', '2022-02-18 07:11:14'),
(93, 2, 2, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-20 23:28:35', '2022-02-20 23:28:35'),
(94, 2, 2, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-20 23:45:08', '2022-02-20 23:45:08'),
(95, 2, 2, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-20 23:58:03', '2022-02-20 23:58:03'),
(96, 2, 2, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-20 23:58:32', '2022-02-20 23:58:32'),
(97, 2, 9, 'Update Lead Detail', '{\"title\":\"Lead Detail Updated\"}', '2022-02-21 06:28:33', '2022-02-21 06:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `lead_calls`
--

CREATE TABLE `lead_calls` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `call_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `call_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_case_structuring_details`
--

CREATE TABLE `lead_case_structuring_details` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `eligibility_product` varchar(100) NOT NULL,
  `eligibility_amount` int NOT NULL,
  `deviation` varchar(50) NOT NULL,
  `LTV` int NOT NULL,
  `FOIR` int NOT NULL,
  `legal_opinion` varchar(100) NOT NULL,
  `special_condition` varchar(100) NOT NULL,
  `technical_opinion` varchar(100) NOT NULL,
  `note` varchar(300) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lead_case_structuring_details`
--

INSERT INTO `lead_case_structuring_details` (`id`, `lead_id`, `eligibility_product`, `eligibility_amount`, `deviation`, `LTV`, `FOIR`, `legal_opinion`, `special_condition`, `technical_opinion`, `note`, `created_at`, `updated_at`) VALUES
(1, 10, 'banking', 2, '2', 3, 3, '3', '3', 'Yes', NULL, '2022-02-07 09:16:15.330984', '2022-02-07 03:46:15.000000'),
(2, 5, 'banking', 1200, '2', 1, 1, '1', '1', 'Yes', NULL, '2022-02-10 05:51:43.000000', '2022-02-10 05:51:43.000000'),
(3, 2, 'banking', 232, '1', 1, 22, '1', '1', 'Yes', 'HI', '2022-02-18 11:27:54.657881', '2022-02-18 05:57:54.000000');

-- --------------------------------------------------------

--
-- Table structure for table `lead_details`
--

CREATE TABLE `lead_details` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `dob` date NOT NULL,
  `mobile_number` bigint NOT NULL,
  `address` text NOT NULL,
  `profession` varchar(200) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `marital_status` varchar(25) NOT NULL,
  `anniversary` date DEFAULT NULL,
  `investment_type` varchar(250) DEFAULT NULL,
  `credit_card` varchar(5) DEFAULT NULL,
  `credit_card_remark` varchar(250) DEFAULT NULL,
  `fund_remark` text,
  `ITR_filling` varchar(20) NOT NULL,
  `ITR_E_verified` varchar(20) NOT NULL,
  `ref_client_name_two` varchar(30) DEFAULT NULL,
  `ref_client_mob_two` varchar(10) DEFAULT NULL,
  `ref_client_call_two` varchar(30) DEFAULT NULL,
  `ref_client_name` varchar(30) DEFAULT NULL,
  `ref_client_mob` varchar(10) DEFAULT NULL,
  `ref_client_call` varchar(30) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_details`
--

INSERT INTO `lead_details` (`id`, `lead_id`, `dob`, `mobile_number`, `address`, `profession`, `gender`, `marital_status`, `anniversary`, `investment_type`, `credit_card`, `credit_card_remark`, `fund_remark`, `ITR_filling`, `ITR_E_verified`, `ref_client_name_two`, `ref_client_mob_two`, `ref_client_call_two`, `ref_client_name`, `ref_client_mob`, `ref_client_call`, `updated_at`, `created_at`) VALUES
(1, 1, '2000-01-01', 1234567777, 'pune', '0', 'male', '', NULL, 'fixed_deposits', 'yes', NULL, NULL, '', '', 'raju2', '1234567890', 'NotCalled', 'raju', '1234567890', 'NotCalled', '2022-01-05 21:21:01', '2022-01-05 21:21:01'),
(2, 2, '1985-01-06', 1234567890, 'Pashan', '0', 'male', 'Married', NULL, 'Bonds issued by Govt of India,Investment in Equities', 'yes', NULL, NULL, 'no', 'no', 'shiv', NULL, 'NotCalled', 'raju', '1234567890', 'Called', '2022-02-20 23:58:32', '2022-01-06 07:58:11'),
(3, 10, '1991-02-12', 7894561230, 'pune', '0', 'male', 'Married', '2022-02-07', 'Equity', 'no', NULL, NULL, 'no', 'no', 'sham', '1234567890', 'NotCalled', 'ram', '0123456789', 'NotCalled', '2022-02-13 22:42:05', '2022-01-12 03:49:11'),
(4, 9, '1993-04-28', 7894561230, 'pune', '0', 'male', 'Married', '2022-02-24', 'Fixed deposits', 'no', NULL, NULL, 'no', 'no', NULL, NULL, 'NotCalled', NULL, NULL, 'NotCalled', '2022-02-21 06:28:33', '2022-01-12 04:22:11'),
(5, 3, '1995-01-05', 1234567890, 'pune', '0', 'male', 'Married', '2022-02-08', 'Equity', 'no', NULL, NULL, 'no', 'no', NULL, NULL, 'NotCalled', NULL, NULL, 'NotCalled', '2022-02-16 07:46:06', '2022-02-16 07:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `lead_discussions`
--

CREATE TABLE `lead_discussions` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_emails`
--

CREATE TABLE `lead_emails` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_files`
--

CREATE TABLE `lead_files` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_files`
--

INSERT INTO `lead_files` (`id`, `lead_id`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 10, 'readme.txt', '10_9991d507e60b12b13be8d83bea10b678_readme.txt', '2022-01-12 03:56:51', '2022-01-12 03:56:51');

-- --------------------------------------------------------

--
-- Table structure for table `lead_loans`
--

CREATE TABLE `lead_loans` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `disbursed_date` date NOT NULL,
  `existing_product` varchar(50) NOT NULL,
  `loan_amount` double(10,2) NOT NULL,
  `loan_roi` varchar(6) NOT NULL,
  `loan_tenor` double(10,2) NOT NULL,
  `loan_emi` double(10,2) NOT NULL,
  `loan_emi_date` date NOT NULL,
  `lender_name` varchar(100) DEFAULT NULL,
  `loan_lender` text,
  `cibil_score` int NOT NULL,
  `cibil_track` varchar(20) NOT NULL,
  `loan_ac_no` varchar(20) NOT NULL,
  `sanction_letter` text,
  `credit_details` varchar(200) DEFAULT NULL,
  `leave_note` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lead_loans`
--

INSERT INTO `lead_loans` (`id`, `lead_id`, `disbursed_date`, `existing_product`, `loan_amount`, `loan_roi`, `loan_tenor`, `loan_emi`, `loan_emi_date`, `lender_name`, `loan_lender`, `cibil_score`, `cibil_track`, `loan_ac_no`, `sanction_letter`, `credit_details`, `leave_note`, `created_at`, `updated_at`) VALUES
(1, 2, '2015-04-12', '2', 8000000.00, '8%', 180.00, 55000.00, '0000-00-00', 'idbi_bank', NULL, 0, '', '', '', NULL, NULL, '2022-01-06 08:04:49', '2022-01-06 08:04:49'),
(2, 10, '2022-01-04', '2', 10000.00, '1%', 2.00, 100.00, '0000-00-00', 'sbi_bank', NULL, 0, '', '', '', NULL, NULL, '2022-01-31 01:44:05', '2022-01-31 01:44:05'),
(3, 10, '2022-02-01', '7', 10000.00, '12%', 1.00, 12.00, '0000-00-00', 'yes_bank', NULL, 0, '', '', '', NULL, NULL, '2022-01-31 02:49:23', '2022-01-31 02:49:23'),
(6, 10, '2022-02-09', '3', 2.00, '2%', 1.00, 1.00, '2022-02-04', 'sbi_bank', NULL, 1, 'Regular', 'sd', '', NULL, NULL, '2022-02-08 08:07:04', '2022-02-08 08:07:04');

-- --------------------------------------------------------

--
-- Table structure for table `lead_mortgage_details`
--

CREATE TABLE `lead_mortgage_details` (
  `id` int NOT NULL,
  `lead_id` int NOT NULL,
  `prop_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prop_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prop_amount` int NOT NULL,
  `construction_year` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_size` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_valuation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `house_feature` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `property_owner` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `res_project` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `self_occupied` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rented_prop` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `legalised_prop` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `chain_agreement` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Occupancy_Certificate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `builder_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `builder_mob` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Chairman_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Chairman_mob` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `concern_person_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `concern_person_mob` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mort_remark` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_person_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_person_mob` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_mortgage_details`
--

INSERT INTO `lead_mortgage_details` (`id`, `lead_id`, `prop_address`, `prop_type`, `prop_amount`, `construction_year`, `property_size`, `property_valuation`, `house_feature`, `property_owner`, `res_project`, `self_occupied`, `rented_prop`, `legalised_prop`, `chain_agreement`, `Occupancy_Certificate`, `builder_name`, `builder_mob`, `Chairman_name`, `Chairman_mob`, `concern_person_name`, `concern_person_mob`, `mort_remark`, `sales_person_name`, `sales_person_mob`, `created_at`, `updated_at`) VALUES
(1, 2, 'Bavdhan', 'office', 20000000, '2008', '1400', '20000000', 'fully_furnished', 'third_owner', 'society', 'Yes', 'No', 'Yes', 'Yes', '', '', '', '', '', '', '', '', '', '', '2022-01-06 08:01:01.000000', '2022-01-06 08:01:01.000000'),
(2, 10, 'pune', 'flat', 80000, '2021', '1100', '800000', 'fully_furnished', 'first_owner', 'builder', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'sxzx', '1234567890', 'abc', '0123456789', 'ram', '0123456789', 'hello', 'sham', '0123456789', '2022-02-11 08:12:41.416401', '2022-02-08 06:48:52.000000'),
(3, 9, 'pune', 'flat', 80000, '2021', '1100', '800000', 'fully_furnished', 'first_owner', 'builder', 'Yes', 'Yes', 'Yes', 'Yes', '', '', '', '', '', '', '', '', '', '', '2022-01-12 04:17:00.000000', '2022-01-12 04:17:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `lead_stages`
--

CREATE TABLE `lead_stages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pipeline_id` int NOT NULL,
  `created_by` int NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_stages`
--

INSERT INTO `lead_stages` (`id`, `name`, `pipeline_id`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Open Leads', 1, 2, 0, '2021-09-12 08:41:14', '2021-11-28 02:14:12'),
(2, 'Today\'s Appointment', 1, 2, 1, '2021-09-12 08:41:14', '2021-11-28 02:14:12'),
(3, 'Document Pending', 1, 2, 2, '2021-09-12 08:41:14', '2021-09-30 04:06:55'),
(4, 'Lead Converted', 1, 2, 3, '2021-09-12 08:41:14', '2021-09-30 04:09:52'),
(5, 'Lead Declined', 1, 2, 4, '2021-09-12 08:41:14', '2021-09-30 04:09:41'),
(6, 'Open Leads', 2, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(7, 'Today\'s Appointment', 2, 8, 2, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(8, 'Document Pending', 2, 8, 3, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(9, 'Lead Converted', 2, 8, 4, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(10, 'Lead Declined', 2, 8, 5, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(11, 'Open Leads', 3, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(12, 'Today\'s Appointment', 3, 9, 2, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(13, 'Document Pending', 3, 9, 3, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(14, 'Lead Converted', 3, 9, 4, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(15, 'Lead Declined', 3, 9, 5, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `lead_tasks`
--

CREATE TABLE `lead_tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `priority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` int NOT NULL,
  `deal_id` int NOT NULL,
  `loan_type` varchar(100) NOT NULL,
  `lender_name` varchar(250) DEFAULT NULL,
  `loan_app_id` int NOT NULL,
  `amount` double(10,2) NOT NULL,
  `emi_amount` double(10,2) NOT NULL,
  `emi_qty` int NOT NULL,
  `interest_rate` double(10,2) NOT NULL,
  `approval_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `remarks` longtext NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `emi_start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `deal_id`, `loan_type`, `lender_name`, `loan_app_id`, `amount`, `emi_amount`, `emi_qty`, `interest_rate`, `approval_date`, `status`, `remarks`, `created_by`, `created_at`, `updated_at`, `emi_start_date`) VALUES
(1, 1, '2', 'sbi_bank', 1, 9000000.00, 1.00, 1, 1.00, '2022-02-17', '1', '', 2, '2022-02-08 06:23:16', '2022-02-08 06:23:16', '2022-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `loan_applications`
--

CREATE TABLE `loan_applications` (
  `id` int NOT NULL,
  `new_product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `all_lender_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_loan_date` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_loan_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usr` int DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  `lead_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_applications`
--

INSERT INTO `loan_applications` (`id`, `new_product`, `all_lender_name`, `new_loan_date`, `new_loan_status`, `usr`, `created_at`, `updated_at`, `lead_id`) VALUES
(1, '2', 'sbi_bank', '2022-01-07', 'lender_fully_disbursed', 2, '2022-01-07 09:52:46.613923', '2022-01-07 04:22:46.000000', 2),
(2, '2', 'sbi_bank', '2022-01-07', 'lender_review', 2, '2022-01-07 09:48:49.819202', '2022-01-07 04:18:49.000000', 3),
(3, '2', 'sbi_bank', '2022-01-07', 'lender_rejected', 2, '2022-01-07 04:13:00.000000', '2022-01-07 04:13:00.000000', 4),
(4, '2', 'sbi_bank', '2022-01-07', 'lender_SIP', 2, '2022-01-07 04:17:34.000000', '2022-01-07 04:17:34.000000', 5),
(5, '2', 'sbi_bank', '2022-01-05', 'lender_PD_pending', 2, '2022-01-10 06:59:26.361989', '2022-01-10 01:29:26.000000', 8),
(6, '2', 'sbi_bank', '2022-01-12', 'lender_fully_disbursed', 2, '2022-02-21 11:58:57.384922', '2022-02-21 06:28:57.000000', 9),
(7, '2', 'sbi_bank', '2022-02-16', 'lender_under_valuation', 2, '2022-02-17 06:41:30.787189', '2022-02-17 01:11:30.000000', 14);

-- --------------------------------------------------------

--
-- Table structure for table `mdfs`
--

CREATE TABLE `mdfs` (
  `id` bigint UNSIGNED NOT NULL,
  `mdf_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` bigint UNSIGNED NOT NULL,
  `type` bigint UNSIGNED NOT NULL,
  `sub_type` bigint UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` double(25,2) DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_complete` smallint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdf_funds`
--

CREATE TABLE `mdf_funds` (
  `id` bigint UNSIGNED NOT NULL,
  `mdf_id` bigint UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `payment_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` date NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdf_products`
--

CREATE TABLE `mdf_products` (
  `id` bigint UNSIGNED NOT NULL,
  `mdf_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdf_statuses`
--

CREATE TABLE `mdf_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdf_sub_types`
--

CREATE TABLE `mdf_sub_types` (
  `id` bigint UNSIGNED NOT NULL,
  `mdf_type` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdf_types`
--

CREATE TABLE `mdf_types` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint NOT NULL,
  `to_id` bigint NOT NULL,
  `body` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_22_192348_create_messages_table', 1),
(5, '2019_09_28_045254_create_groups_table', 1),
(6, '2019_09_28_102009_create_settings_table', 1),
(7, '2019_09_30_050856_create_pipelines_table', 1),
(8, '2019_09_30_052036_create_sources_table', 1),
(9, '2019_09_30_053046_create_payments_table', 1),
(10, '2019_09_30_054747_create_expense_categories_table', 1),
(11, '2019_09_30_061801_create_stages_table', 1),
(12, '2019_09_30_092218_create_labels_table', 1),
(13, '2019_09_30_101254_create_custom_fields_table', 1),
(14, '2019_09_30_112530_create_products_table', 1),
(15, '2019_10_01_104005_create_custom_field_values_table', 1),
(16, '2019_10_03_052618_create_deals_table', 1),
(17, '2019_10_05_045358_create_user_deals_table', 1),
(18, '2019_10_05_045359_create_client_deals_table', 1),
(19, '2019_10_05_045360_create_client_permissions_table', 1),
(20, '2019_10_07_054657_create_deal_files_table', 1),
(21, '2019_10_07_091153_create_deal_tasks_table', 1),
(22, '2019_10_08_125513_create_expenses_table', 1),
(23, '2019_10_09_055258_create_invoices_table', 1),
(24, '2019_10_09_060342_create_taxes_table', 1),
(25, '2019_10_09_101639_create_invoice_products_table', 1),
(26, '2019_10_09_121658_create_invoice_payments_table', 1),
(27, '2019_10_10_114133_create_activity_logs_table', 1),
(28, '2019_10_14_055151_create_deal_discussions_table', 1),
(29, '2019_10_16_211433_create_favorites_table', 1),
(30, '2019_10_18_223259_add_avatar_to_users', 1),
(31, '2019_10_20_211056_add_messenger_color_to_users', 1),
(32, '2019_10_22_000539_add_dark_mode_to_users', 1),
(33, '2019_10_25_214038_add_active_status_to_users', 1),
(34, '2019_11_13_144239_create_plans_table', 1),
(35, '2019_11_13_150219_create_orders_table', 1),
(36, '2020_01_04_053551_update_products_table', 1),
(37, '2020_01_04_060343_create_contract_types_table', 1),
(38, '2020_01_04_060354_create_contracts_table', 1),
(39, '2020_03_04_122711_create_leads_table', 1),
(40, '2020_03_04_122801_create_lead_stages_table', 1),
(41, '2020_03_05_042105_create_lead_activity_logs_table', 1),
(42, '2020_03_05_042308_create_lead_discussions_table', 1),
(43, '2020_03_05_042318_create_user_leads_table', 1),
(44, '2020_03_05_042549_create_lead_files_table', 1),
(45, '2020_03_05_042636_create_lead_emails_table', 1),
(46, '2020_03_05_042710_create_lead_calls_table', 1),
(47, '2020_03_05_044157_create_deal_emails_table', 1),
(48, '2020_03_05_044322_create_deal_calls_table', 1),
(49, '2020_03_16_051313_create_coupons_table', 1),
(50, '2020_03_16_051921_create_user_coupons_table', 1),
(51, '2020_03_17_104345_create_estimations_table', 1),
(52, '2020_03_17_112732_create_estimation_products_table', 1),
(53, '2020_03_18_104909_create_notifications_table', 1),
(54, '2020_04_16_113408_create_messageses_table', 1),
(55, '2020_05_02_075614_create_email_templates_table', 1),
(56, '2020_05_02_075630_create_email_template_langs_table', 1),
(57, '2020_05_02_075647_create_user_email_templates_table', 1),
(58, '2020_05_21_065337_create_permission_tables', 1),
(59, '2020_07_08_040251_add_payment_type_to_orders_table', 1),
(60, '2020_07_13_040251_add_payment_type_and_client_id_to_invoice_payments_table', 1),
(61, '2020_07_22_052605_update_price_amount', 1),
(62, '2020_08_13_120951_update_setting_value', 1),
(63, '2020_08_18_125932_create_form_builders_table', 1),
(64, '2020_08_18_130112_create_form_fields_table', 1),
(65, '2020_08_18_130220_create_form_field_responses_table', 1),
(66, '2020_08_18_130245_create_form_responses_table', 1),
(67, '2020_10_07_083917_create_mdf_statuses_table', 1),
(68, '2020_10_07_084509_create_mdf_types_table', 1),
(69, '2020_10_07_084522_create_mdf_sub_types_table', 1),
(70, '2020_10_07_113432_create_mdfs_table', 1),
(71, '2020_10_09_102208_create_mdf_products_table', 1),
(72, '2020_10_12_120907_create_mdf_funds_table', 1),
(73, '2020_11_10_113703_changes_for_plans_payment', 1),
(74, '2021_06_23_091357_create_landing_page_sections_table', 1),
(75, '2021_07_02_114852_create_admin_payment_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 2),
(5, 'App\\User', 3),
(4, 'App\\User', 4),
(3, 'App\\User', 5),
(4, 'App\\User', 5),
(5, 'App\\User', 5),
(3, 'App\\User', 6),
(4, 'App\\User', 6),
(3, 'App\\User', 7),
(6, 'App\\User', 7),
(3, 'App\\User', 8),
(5, 'App\\User', 8),
(3, 'App\\User', 9),
(3, 'App\\User', 10),
(5, 'App\\User', 10),
(3, 'App\\User', 11),
(4, 'App\\User', 11),
(6, 'App\\User', 11),
(3, 'App\\User', 12),
(6, 'App\\User', 12),
(3, 'App\\User', 13),
(3, 'App\\User', 14),
(3, 'App\\User', 15),
(3, 'App\\User', 16),
(3, 'App\\User', 17),
(3, 'App\\User', 18),
(4, 'App\\User', 18),
(3, 'App\\User', 19),
(3, 'App\\User', 20),
(3, 'App\\User', 21),
(3, 'App\\User', 22),
(4, 'App\\User', 25),
(5, 'App\\User', 26),
(4, 'App\\User', 27),
(3, 'App\\User', 28),
(4, 'App\\User', 29),
(3, 'App\\User', 32),
(3, 'App\\User', 33),
(3, 'App\\User', 34),
(3, 'App\\User', 35),
(3, 'App\\User', 36),
(3, 'App\\User', 37),
(3, 'App\\User', 38),
(3, 'App\\User', 40),
(3, 'App\\User', 45);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `data`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 6, 'assign_lead', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-05 21:17:39', '2022-01-05 21:17:39'),
(2, 1, 'Todays Appointment', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-05 21:24:17', '2022-01-05 21:24:17'),
(3, 6, 'assign_lead', '{\"lead_id\":2,\"name\":\"Ranvijay\",\"updated_by\":2}', 0, '2022-01-06 02:19:43', '2022-01-06 02:19:43'),
(4, 4, 'assign_lead', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 02:31:30', '2022-01-06 02:31:30'),
(5, 4, 'assign_lead', '{\"lead_id\":4,\"name\":\"Vishal\",\"updated_by\":2}', 0, '2022-01-06 02:33:47', '2022-01-06 02:33:47'),
(6, 3, 'Todays Appointment', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 02:34:27', '2022-01-06 02:34:27'),
(7, 3, 'Initial Disscussion', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 02:54:34', '2022-01-06 02:54:34'),
(8, 3, 'Todays Appointment', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 03:11:04', '2022-01-06 03:11:04'),
(9, 3, 'Todays Appointment', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 03:12:46', '2022-01-06 03:12:46'),
(10, 3, 'Initial Disscussion', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 03:13:27', '2022-01-06 03:13:27'),
(11, 3, 'Todays Appointment', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 03:32:16', '2022-01-06 03:32:16'),
(12, 3, 'Todays Appointment', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 04:02:58', '2022-01-06 04:02:58'),
(13, 3, 'Todays Appointment', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-06 04:03:11', '2022-01-06 04:03:11'),
(14, 1, 'Todays Appointment', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:09:50', '2022-01-06 07:09:50'),
(15, 4, 'Todays Appointment', '{\"lead_id\":4,\"name\":\"Vishal\",\"updated_by\":2}', 0, '2022-01-06 07:38:33', '2022-01-06 07:38:33'),
(16, 6, 'assign_lead', '{\"lead_id\":5,\"name\":\"Shree\",\"updated_by\":2}', 0, '2022-01-06 07:42:45', '2022-01-06 07:42:45'),
(17, 5, 'Initial Disscussion', '{\"lead_id\":5,\"name\":\"Shree\",\"updated_by\":2}', 0, '2022-01-06 07:44:47', '2022-01-06 07:44:47'),
(18, 1, 'Initial Disscussion', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:45:10', '2022-01-06 07:45:10'),
(19, 1, 'Meeting Done', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:45:30', '2022-01-06 07:45:30'),
(20, 1, 'Initial Disscussion', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:46:01', '2022-01-06 07:46:01'),
(21, 1, 'Todays Appointment', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:46:29', '2022-01-06 07:46:29'),
(22, 5, 'Meeting Done', '{\"lead_id\":5,\"name\":\"Shree\",\"updated_by\":2}', 0, '2022-01-06 07:47:29', '2022-01-06 07:47:29'),
(23, 5, 'Todays Appointment', '{\"lead_id\":5,\"name\":\"Shree\",\"updated_by\":2}', 0, '2022-01-06 07:47:53', '2022-01-06 07:47:53'),
(24, 1, 'Initial Disscussion', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:48:09', '2022-01-06 07:48:09'),
(25, 1, 'Rejected', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:48:46', '2022-01-06 07:48:46'),
(26, 1, 'Done With Collection', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:49:15', '2022-01-06 07:49:15'),
(27, 1, 'Initial Disscussion', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 07:50:24', '2022-01-06 07:50:24'),
(28, 1, 'Ask To Wait', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-06 08:19:56', '2022-01-06 08:19:56'),
(29, 3, 'Loan Application Detail Created', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-07 04:07:12', '2022-01-07 04:07:12'),
(30, 3, 'Loan Application Updated', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-07 04:07:56', '2022-01-07 04:07:56'),
(31, 4, 'Loan Application Detail Created', '{\"lead_id\":4,\"name\":\"Vishal\",\"updated_by\":2}', 0, '2022-01-07 04:13:00', '2022-01-07 04:13:00'),
(32, 5, 'Loan Application Detail Created', '{\"lead_id\":5,\"name\":\"Shree\",\"updated_by\":2}', 0, '2022-01-07 04:17:34', '2022-01-07 04:17:34'),
(33, 3, 'Loan Application Updated', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-01-07 04:18:49', '2022-01-07 04:18:49'),
(34, 1, 'Rejected', '{\"lead_id\":1,\"name\":\"viraj\",\"updated_by\":2}', 0, '2022-01-07 19:26:48', '2022-01-07 19:26:48'),
(35, 4, 'assign_lead', '{\"lead_id\":6,\"name\":\"Bee\",\"updated_by\":2}', 0, '2022-01-07 21:05:04', '2022-01-07 21:05:04'),
(36, 8, 'Loan Application Detail Created', '{\"lead_id\":8,\"name\":\"Roshan\",\"updated_by\":3}', 0, '2022-01-10 00:55:08', '2022-01-10 00:55:08'),
(37, 8, 'Loan Application Updated', '{\"lead_id\":8,\"name\":\"Roshan\",\"updated_by\":2}', 0, '2022-01-10 00:55:31', '2022-01-10 00:55:31'),
(38, 8, 'Todays Appointment', '{\"lead_id\":8,\"name\":\"Roshan\",\"updated_by\":3}', 0, '2022-01-10 00:59:16', '2022-01-10 00:59:16'),
(39, 8, 'Loan Application Updated', '{\"lead_id\":8,\"name\":\"Roshan\",\"updated_by\":2}', 0, '2022-01-10 01:29:26', '2022-01-10 01:29:26'),
(40, 4, 'assign_lead', '{\"lead_id\":9,\"name\":\"jaybhaye\",\"updated_by\":2}', 0, '2022-01-12 02:10:53', '2022-01-12 02:10:53'),
(41, 4, 'assign_lead', '{\"lead_id\":10,\"name\":\"roghit\",\"updated_by\":2}', 0, '2022-01-12 03:45:35', '2022-01-12 03:45:35'),
(42, 10, 'Done With Collection', '{\"lead_id\":10,\"name\":\"roghit\",\"updated_by\":2}', 0, '2022-01-12 04:07:20', '2022-01-12 04:07:20'),
(43, 9, 'Todays Appointment', '{\"lead_id\":9,\"name\":\"jaybhaye\",\"updated_by\":2}', 0, '2022-01-12 04:12:52', '2022-01-12 04:12:52'),
(44, 9, 'Done With Collection', '{\"lead_id\":9,\"name\":\"jaybhaye\",\"updated_by\":2}', 0, '2022-01-12 04:13:59', '2022-01-12 04:13:59'),
(45, 9, 'Loan Application Detail Created', '{\"lead_id\":9,\"name\":\"jaybhaye\",\"updated_by\":2}', 0, '2022-01-12 04:15:15', '2022-01-12 04:15:15'),
(46, 7, 'assign_deal', '{\"deal_id\":1,\"name\":\"Mr. \\/ Mrs. Ranvijay\",\"updated_by\":2}', 0, '2022-01-12 05:20:42', '2022-01-12 05:20:42'),
(47, 6, 'Rejected', '{\"lead_id\":6,\"name\":\"Bee\",\"updated_by\":2}', 0, '2022-01-12 06:05:28', '2022-01-12 06:05:28'),
(48, 10, 'Existing Loan Added', '{\"lead_id\":10,\"name\":\"rohit\",\"updated_by\":2}', 0, '2022-01-31 01:44:05', '2022-01-31 01:44:05'),
(49, 10, 'Existing Loan Added', '{\"lead_id\":10,\"name\":\"rohit\",\"updated_by\":2}', 0, '2022-01-31 02:49:23', '2022-01-31 02:49:23'),
(50, 9, 'Todays Appointment', '{\"lead_id\":9,\"name\":\"jaybhaye\",\"updated_by\":2}', 0, '2022-02-08 05:25:03', '2022-02-08 05:25:03'),
(51, 10, 'Existing Loan Added', '{\"lead_id\":10,\"name\":\"rohit\",\"updated_by\":2}', 0, '2022-02-08 05:55:54', '2022-02-08 05:55:54'),
(52, 10, 'Existing Loan Added', '{\"lead_id\":10,\"name\":\"rohit\",\"updated_by\":2}', 0, '2022-02-08 07:00:33', '2022-02-08 07:00:33'),
(53, 10, 'Existing Loan Added', '{\"lead_id\":10,\"name\":\"rohit\",\"updated_by\":2}', 0, '2022-02-08 08:07:04', '2022-02-08 08:07:04'),
(54, 10, 'Existing Loan Added', '{\"lead_id\":10,\"name\":\"rohit\",\"updated_by\":2}', 0, '2022-02-08 08:07:12', '2022-02-08 08:07:12'),
(55, 4, 'assign_lead', '{\"lead_id\":13,\"name\":\"snehal\",\"updated_by\":2}', 0, '2022-02-10 23:58:31', '2022-02-10 23:58:31'),
(56, 13, 'Todays Appointment', '{\"lead_id\":13,\"name\":\"snehal\",\"updated_by\":2}', 0, '2022-02-11 03:59:47', '2022-02-11 03:59:47'),
(57, 13, 'Todays Appointment', '{\"lead_id\":13,\"name\":\"snehal\",\"updated_by\":2}', 0, '2022-02-11 04:00:11', '2022-02-11 04:00:11'),
(58, 13, 'Todays Appointment', '{\"lead_id\":13,\"name\":\"snehal\",\"updated_by\":2}', 0, '2022-02-11 04:19:20', '2022-02-11 04:19:20'),
(59, 13, 'Todays Appointment', '{\"lead_id\":13,\"name\":\"snehal\",\"updated_by\":2}', 0, '2022-02-11 04:19:37', '2022-02-11 04:19:37'),
(60, 13, 'Todays Appointment', '{\"lead_id\":13,\"name\":\"snehal\",\"updated_by\":2}', 0, '2022-02-11 04:21:17', '2022-02-11 04:21:17'),
(61, 13, 'Todays Appointment', '{\"lead_id\":13,\"name\":\"snehal\",\"updated_by\":2}', 0, '2022-02-11 04:24:18', '2022-02-11 04:24:18'),
(62, 4, 'assign_lead', '{\"lead_id\":14,\"name\":\"drfg\",\"updated_by\":2}', 0, '2022-02-12 06:51:33', '2022-02-12 06:51:33'),
(63, 10, 'Rejected', '{\"lead_id\":10,\"name\":\"rohit\",\"updated_by\":2}', 0, '2022-02-14 04:08:36', '2022-02-14 04:08:36'),
(64, 14, 'Meeting Done', '{\"lead_id\":14,\"name\":\"swati\",\"updated_by\":2}', 0, '2022-02-14 04:09:37', '2022-02-14 04:09:37'),
(65, 14, 'Loan Application Detail Created', '{\"lead_id\":14,\"name\":\"swati\",\"updated_by\":2}', 0, '2022-02-14 04:10:06', '2022-02-14 04:10:06'),
(66, 14, 'Todays Appointment', '{\"lead_id\":14,\"name\":\"swati\",\"updated_by\":2}', 0, '2022-02-14 04:15:10', '2022-02-14 04:15:10'),
(67, 14, 'Ready To Settle', '{\"lead_id\":14,\"name\":\"swati\",\"updated_by\":2}', 0, '2022-02-14 04:15:54', '2022-02-14 04:15:54'),
(68, 3, 'Initial Disscussion', '{\"lead_id\":3,\"name\":\"Maddy\",\"updated_by\":2}', 0, '2022-02-15 04:09:50', '2022-02-15 04:09:50'),
(69, 14, 'Loan Application Updated', '{\"lead_id\":14,\"name\":\"swati\",\"updated_by\":2}', 0, '2022-02-17 01:11:30', '2022-02-17 01:11:30'),
(70, 4, 'assign_lead', '{\"lead_id\":15,\"name\":\"Vasu\",\"updated_by\":2}', 0, '2022-02-17 17:12:27', '2022-02-17 17:12:27'),
(71, 15, 'Todays Appointment', '{\"lead_id\":15,\"name\":\"Vasu\",\"updated_by\":2}', 0, '2022-02-18 02:38:26', '2022-02-18 02:38:26'),
(72, 9, 'Loan Application Updated', '{\"lead_id\":9,\"name\":\"jaybhaye\",\"updated_by\":2}', 0, '2022-02-21 06:28:57', '2022-02-21 06:28:57'),
(73, 12, 'assign_deal', '{\"deal_id\":2,\"name\":\"Mr. \\/ Mrs. jaybhaye\",\"updated_by\":2}', 0, '2022-02-21 06:29:47', '2022-02-21 06:29:47'),
(74, 9, 'Loan Application Updated', '{\"lead_id\":9,\"name\":\"jaybhaye\",\"updated_by\":2}', 0, '2022-02-21 22:38:27', '2022-02-21 22:38:27'),
(75, 12, 'assign_deal', '{\"deal_id\":3,\"name\":\"Mr. \\/ Mrs. jaybhaye\",\"updated_by\":2}', 0, '2022-02-21 22:39:09', '2022-02-21 22:39:09');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_month` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_exp_year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` int NOT NULL,
  `price` double NOT NULL,
  `price_currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `txn_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_frequency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 2, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(2, 'Bank', 2, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(3, 'Cash', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(4, 'Bank', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(5, 'Cash', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(6, 'Bank', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Manage Users', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(2, 'Create User', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(3, 'Edit User', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(4, 'Delete User', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(5, 'Manage Roles', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(6, 'Create Role', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(7, 'Edit Role', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(8, 'Delete Role', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(9, 'Manage Permissions', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(10, 'Create Permission', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(11, 'Edit Permission', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(12, 'Delete Permission', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(13, 'Manage Languages', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(14, 'Create Language', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(15, 'Edit Language', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(16, 'System Settings', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(17, 'Manage Pipelines', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(18, 'Create Pipeline', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(19, 'Edit Pipeline', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(20, 'Delete Pipeline', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(21, 'Manage Sources', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(22, 'Create Source', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(23, 'Edit Source', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(24, 'Delete Source', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(25, 'Manage Payments', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(26, 'Create Payment', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(27, 'Edit Payment', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(28, 'Delete Payment', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(29, 'Manage Expense Categories', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(30, 'Create Expense Category', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(31, 'Edit Expense Category', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(32, 'Delete Expense Category', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(33, 'Manage Stages', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(34, 'Create Stage', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(35, 'Edit Stage', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(36, 'Delete Stage', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(37, 'Manage Lead Stages', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(38, 'Create Lead Stage', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(39, 'Edit Lead Stage', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(40, 'Delete Lead Stage', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(41, 'Manage Leads', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(42, 'Create Lead', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(43, 'Edit Lead', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(44, 'Delete Lead', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(45, 'View Lead', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(46, 'Move Lead', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(47, 'Create Label', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(48, 'Manage Labels', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(49, 'Edit Label', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(50, 'Delete Label', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(51, 'Manage Custom Fields', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(52, 'Create Custom Field', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(53, 'Edit Custom Field', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(54, 'Delete Custom Field', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(55, 'Manage Products', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(56, 'Create Product', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(57, 'Edit Product', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(58, 'Delete Product', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(59, 'Manage Clients', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(60, 'Create Client', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(61, 'Edit Client', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(62, 'Delete Client', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(63, 'Manage Deals', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(64, 'Create Deal', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(65, 'Edit Deal', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(66, 'Delete Deal', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(67, 'Move Deal', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(68, 'Manage Tasks', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(69, 'Create Task', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(70, 'Edit Task', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(71, 'Delete Task', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(72, 'Manage Expenses', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(73, 'Create Expense', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(74, 'Edit Expense', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(75, 'Delete Expense', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(76, 'Manage Invoices', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(77, 'Create Invoice', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(78, 'Edit Invoice', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(79, 'Delete Invoice', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(80, 'Manage Taxes', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(81, 'Create Tax', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(82, 'Edit Tax', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(83, 'Delete Tax', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(84, 'Manage Contract Types', 'web', '2021-09-12 08:41:05', '2021-09-12 08:41:05'),
(85, 'Create Contract Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(86, 'Edit Contract Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(87, 'Delete Contract Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(88, 'Manage Contracts', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(89, 'Create Contract', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(90, 'Edit Contract', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(91, 'Delete Contract', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(92, 'View Invoice', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(93, 'Invoice Add Product', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(94, 'Create Invoice Payment', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(95, 'Invoice Edit Product', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(96, 'Invoice Delete Product', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(97, 'Manage Invoice Payments', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(98, 'View Deal', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(99, 'View Task', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(100, 'Manage Plans', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(101, 'Create Plan', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(102, 'Edit Plan', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(103, 'Buy Plan', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(104, 'View Order', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(105, 'Convert Lead To Deal', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(106, 'Manage Deal Emails', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(107, 'Create Deal Email', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(108, 'Manage Deal Calls', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(109, 'Create Deal Call', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(110, 'Edit Deal Call', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(111, 'Delete Deal Call', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(112, 'Manage Lead Emails', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(113, 'Create Lead Email', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(114, 'Manage Lead Calls', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(115, 'Create Lead Call', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(116, 'Edit Lead Call', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(117, 'Delete Lead Call', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(118, 'Manage Coupons', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(119, 'Create Coupon', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(120, 'Edit Coupon', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(121, 'Delete Coupon', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(122, 'View Coupon', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(123, 'Manage Business Settings', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(124, 'Manage Estimations', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(125, 'Create Estimation', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(126, 'Edit Estimation', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(127, 'Delete Estimation', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(128, 'View Estimation', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(129, 'Estimation Add Product', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(130, 'Estimation Edit Product', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(131, 'Estimation Delete Product', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(132, 'Manage Email Templates', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(133, 'Create Email Template', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(134, 'Edit Email Template', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(135, 'On-Off Email Template', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(136, 'Edit Email Template Lang', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(137, 'Manage MDFs', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(138, 'Request MDF', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(139, 'Edit MDF', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(140, 'Delete MDF', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(141, 'View MDF', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(142, 'Manage MDF Types', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(143, 'Create MDF Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(144, 'Edit MDF Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(145, 'Delete MDF Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(146, 'Manage MDF Sub Types', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(147, 'Create MDF Sub Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(148, 'Edit MDF Sub Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(149, 'Delete MDF Sub Type', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(150, 'Manage MDF Status', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(151, 'Create MDF Status', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(152, 'Edit MDF Status', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(153, 'Delete MDF Status', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(154, 'Create MDF Payment', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(155, 'MDF Add Expense', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(156, 'MDF Edit Expense', 'web', '2021-09-12 08:41:06', '2021-09-12 08:41:06'),
(157, 'MDF Delete Expense', 'web', '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(158, 'Manage Connectors', 'web', '2021-09-18 00:48:01', '2021-09-18 00:48:01'),
(161, 'View Connectors', 'web', '2021-09-18 00:54:52', '2021-09-18 00:54:52');

-- --------------------------------------------------------

--
-- Table structure for table `pipelines`
--

CREATE TABLE `pipelines` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pipelines`
--

INSERT INTO `pipelines` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Sales', 2, '2021-09-12 03:11:13', '2021-09-12 03:11:13'),
(2, 'Sales', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(3, 'Sales', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monthly_price` double NOT NULL DEFAULT '0',
  `annual_price` double(25,2) DEFAULT '0.00',
  `status` smallint NOT NULL DEFAULT '0',
  `trial_days` int NOT NULL DEFAULT '0',
  `max_users` int NOT NULL DEFAULT '0',
  `max_clients` int NOT NULL DEFAULT '0',
  `max_deals` int NOT NULL DEFAULT '0',
  `max_emails` int NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `monthly_price`, `annual_price`, `status`, `trial_days`, `max_users`, `max_clients`, `max_deals`, `max_emails`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Free Plan', 0, 0.00, 1, 0, 5, 5, 20, 5, '', NULL, '2021-09-12 08:41:05', '2021-09-18 00:02:36'),
(2, 'Pro', 10, 100.00, 1, 30, 10, 10, 10, 10, '', NULL, '2021-09-17 23:54:39', '2021-09-17 23:54:39'),
(3, 'Premium', 299, 3200.00, 1, 30, 30, 15, 15, 30, 'Advanced Package', NULL, '2021-11-22 04:04:48', '2021-11-22 04:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `image`, `type`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Home Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:00:23', '2021-12-12 15:11:31'),
(3, 'Home Loan Balance Transfer', 0, '', NULL, 'Product', 2, '2021-10-04 01:02:14', '2021-12-12 15:11:42'),
(4, 'Home Loan Balance Transfer Top-up', 0, '', NULL, 'Product', 2, '2021-10-04 01:02:44', '2021-12-12 15:11:53'),
(5, 'Loan Against Property', 0, '', NULL, 'Product', 2, '2021-10-04 01:03:09', '2021-12-12 15:12:04'),
(6, 'Loan Against Property Balance Transfer', 0, '', NULL, 'Product', 2, '2021-10-04 01:03:34', '2021-12-12 15:12:22'),
(7, 'Loan Against Property Balance Transfer Top-up', 0, '', NULL, 'Product', 2, '2021-10-04 01:20:03', '2021-12-12 15:12:40'),
(8, 'Business Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:20:17', '2021-12-12 15:12:49'),
(9, 'Personal Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:21:06', '2021-12-12 15:12:59'),
(10, 'Education Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:21:28', '2021-12-12 15:13:08'),
(11, 'Gold Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:21:42', '2021-12-12 15:13:18'),
(12, 'Car Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:21:58', '2021-12-12 15:13:29'),
(13, 'Commercial Vehicle Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:22:17', '2021-12-12 15:13:42'),
(14, 'Equipment Loan', 0, '', NULL, 'Product', 2, '2021-10-04 01:22:37', '2021-12-12 15:13:52'),
(15, 'Other', 0, '', NULL, 'Product', 2, '2021-10-04 01:23:30', '2021-10-04 01:23:30'),
(16, 'Home Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(17, 'Home Loan Balance Transfer', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(18, 'Home Loan Balance Transfer Top-up', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(19, 'Loan Against Property', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(20, 'Loan Against Property Balance Transfer', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(21, 'Loan Against Property Balance Transfer Top-up', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(22, 'Business Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(23, 'Personal Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(24, 'Education Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(25, 'Gold Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(26, 'Car Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(27, 'Commercial Vehicle Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(28, 'Equipment Loan', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(29, 'Other', 0, NULL, NULL, NULL, 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(30, 'Home Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(31, 'Home Loan Balance Transfer', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(32, 'Home Loan Balance Transfer Top-up', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(33, 'Loan Against Property', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(34, 'Loan Against Property Balance Transfer', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(35, 'Loan Against Property Balance Transfer Top-up', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(36, 'Business Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(37, 'Personal Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(38, 'Education Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(39, 'Gold Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(40, 'Car Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(41, 'Commercial Vehicle Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(42, 'Equipment Loan', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(43, 'Other', 0, NULL, NULL, NULL, 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `referred_requests`
--

CREATE TABLE `referred_requests` (
  `id` int NOT NULL,
  `referred_by` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', 0, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(3, 'Owner', 'web', 1, '2021-09-12 08:41:07', '2021-09-12 08:41:07'),
(4, 'Employee', 'web', 2, '2021-09-12 08:41:12', '2021-09-12 08:41:12'),
(5, 'Connector', 'web', 2, '2021-09-18 00:32:27', '2021-09-18 00:32:27'),
(6, 'client', 'web', 2, '2022-01-12 05:18:46', '2022-01-12 05:18:46'),
(7, 'Employee', 'web', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(8, 'Employee', 'web', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(100, 1),
(101, 1),
(102, 1),
(104, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(132, 1),
(133, 1),
(134, 1),
(136, 1),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 3),
(81, 3),
(82, 3),
(83, 3),
(84, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(89, 3),
(90, 3),
(91, 3),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(123, 3),
(124, 3),
(125, 3),
(126, 3),
(127, 3),
(128, 3),
(129, 3),
(130, 3),
(131, 3),
(132, 3),
(135, 3),
(137, 3),
(138, 3),
(139, 3),
(140, 3),
(141, 3),
(142, 3),
(143, 3),
(144, 3),
(145, 3),
(146, 3),
(147, 3),
(148, 3),
(149, 3),
(150, 3),
(151, 3),
(152, 3),
(153, 3),
(154, 3),
(155, 3),
(156, 3),
(157, 3),
(158, 3),
(161, 3),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 4),
(64, 4),
(65, 4),
(66, 4),
(67, 4),
(68, 4),
(69, 4),
(70, 4),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 4),
(80, 4),
(81, 4),
(82, 4),
(83, 4),
(93, 4),
(94, 4),
(95, 4),
(96, 4),
(97, 4),
(98, 4),
(99, 4),
(105, 4),
(106, 4),
(107, 4),
(108, 4),
(109, 4),
(110, 4),
(111, 4),
(114, 4),
(115, 4),
(116, 4),
(117, 4),
(137, 4),
(138, 4),
(139, 4),
(140, 4),
(141, 4),
(155, 4),
(156, 4),
(157, 4),
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(45, 5),
(63, 5),
(64, 5),
(65, 5),
(66, 5),
(98, 5),
(105, 5),
(41, 6),
(42, 6),
(43, 6),
(44, 6),
(45, 6),
(46, 6),
(55, 6),
(56, 6),
(57, 6),
(93, 6),
(95, 6),
(97, 6),
(104, 6),
(41, 7),
(42, 7),
(43, 7),
(44, 7),
(45, 7),
(46, 7),
(55, 7),
(56, 7),
(57, 7),
(58, 7),
(63, 7),
(64, 7),
(65, 7),
(66, 7),
(67, 7),
(68, 7),
(69, 7),
(70, 7),
(71, 7),
(72, 7),
(73, 7),
(74, 7),
(75, 7),
(76, 7),
(77, 7),
(78, 7),
(79, 7),
(80, 7),
(81, 7),
(82, 7),
(83, 7),
(92, 7),
(93, 7),
(94, 7),
(95, 7),
(96, 7),
(97, 7),
(98, 7),
(99, 7),
(137, 7),
(138, 7),
(139, 7),
(140, 7),
(141, 7),
(155, 7),
(156, 7),
(157, 7),
(41, 8),
(42, 8),
(43, 8),
(44, 8),
(45, 8),
(46, 8),
(55, 8),
(56, 8),
(57, 8),
(58, 8),
(63, 8),
(64, 8),
(65, 8),
(66, 8),
(67, 8),
(68, 8),
(69, 8),
(70, 8),
(71, 8),
(72, 8),
(73, 8),
(74, 8),
(75, 8),
(76, 8),
(77, 8),
(78, 8),
(79, 8),
(80, 8),
(81, 8),
(82, 8),
(83, 8),
(92, 8),
(93, 8),
(94, 8),
(95, 8),
(96, 8),
(97, 8),
(98, 8),
(99, 8),
(137, 8),
(138, 8),
(139, 8),
(140, 8),
(141, 8),
(155, 8),
(156, 8),
(157, 8);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'company_logo', '2_logo.png', 2, NULL, NULL),
(2, 'company_favicon', '2_favicon.png', 2, NULL, NULL),
(3, 'header_text', '- CHESA CRM ©', 2, NULL, NULL),
(4, 'site_currency', 'INR', 2, NULL, NULL),
(5, 'site_currency_symbol', '₹', 2, NULL, NULL),
(6, 'site_currency_symbol_position', 'pre', 2, NULL, NULL),
(7, 'footer_title', 'Payment Information', 2, NULL, NULL),
(8, 'site_date_format', 'M j, Y', 2, NULL, NULL),
(9, 'site_time_format', 'g:i A', 2, NULL, NULL),
(10, 'invoice_prefix', '#INV', 2, NULL, NULL),
(11, 'estimation_prefix', '#EST', 2, NULL, NULL),
(12, 'mdf_prefix', '#MDF', 2, NULL, NULL),
(13, 'footer_note', 'Thank you for your business.', 2, NULL, NULL),
(14, 'company_name', 'CHESA CRM', 2, NULL, NULL),
(15, 'company_address', 'PUNE', 2, NULL, NULL),
(16, 'company_city', 'PUNE', 2, NULL, NULL),
(17, 'company_state', 'MAHARASHTRA', 2, NULL, NULL),
(18, 'company_zipcode', '411038', 2, NULL, NULL),
(19, 'company_country', 'INDIA', 2, NULL, NULL),
(20, 'company_telephone', '', 2, NULL, NULL),
(21, 'company_email', 'admin@chesacrm.com', 2, NULL, NULL),
(22, 'company_email_from_name', 'admin@chesacrm.com', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Employee', 2, '2021-09-12 08:41:14', '2021-11-10 23:07:15'),
(2, 'Client Reference', 2, '2021-09-12 08:41:14', '2021-11-10 23:08:22'),
(3, 'Connector', 2, '2021-09-12 08:41:14', '2021-11-10 23:08:05'),
(4, 'Other', 2, '2021-11-10 23:09:08', '2021-11-10 23:09:08'),
(5, 'Client Reference', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(6, 'Connector', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(7, 'Employee', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(8, 'Other', 8, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(9, 'Client Reference', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(10, 'Connector', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(11, 'Employee', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(12, 'Other', 9, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pipeline_id` int NOT NULL,
  `created_by` int NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `name`, `pipeline_id`, `created_by`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Deal Open', 1, 2, 0, '2021-09-12 08:41:13', '2021-11-10 01:03:29'),
(2, 'Deal Close', 1, 2, 1, '2021-09-12 08:41:13', '2021-11-27 21:49:03'),
(3, 'Deal Open', 2, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(4, 'Deal Close', 2, 8, 2, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(5, 'Deal Open', 3, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(6, 'Deal Close', 3, 9, 2, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active_status` tinyint(1) NOT NULL DEFAULT '0',
  `dark_mode` tinyint(1) NOT NULL DEFAULT '0',
  `messenger_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2359ee',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `anniversary` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `mobile_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `loan_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_app_id` int DEFAULT NULL,
  `loan_amt` int DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `referred_by` int DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `marital_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Employee_ID` int DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `job_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_pipeline` int DEFAULT NULL,
  `plan` int DEFAULT NULL,
  `plan_expire_date` date DEFAULT NULL,
  `payment_subscription_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_trial_done` smallint NOT NULL DEFAULT '0',
  `is_plan_purchased` smallint NOT NULL DEFAULT '0',
  `interested_plan_id` smallint NOT NULL DEFAULT '0',
  `is_register_trial` smallint NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `delete_status` int NOT NULL DEFAULT '0',
  `is_active` int NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cron_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `name`, `email`, `active_status`, `dark_mode`, `messenger_color`, `email_verified_at`, `password`, `type`, `anniversary`, `address`, `mobile_number`, `loan_type`, `loan_app_id`, `loan_amt`, `avatar`, `referred_code`, `referred_by`, `dob`, `marital_status`, `Employee_ID`, `lang`, `job_title`, `default_pipeline`, `plan`, `plan_expire_date`, `payment_subscription_id`, `is_trial_done`, `is_plan_purchased`, `interested_plan_id`, `is_register_trial`, `created_by`, `delete_status`, `is_active`, `remember_token`, `created_at`, `updated_at`, `cron_date`) VALUES
(1, NULL, 'Super Admin', 'superadmin@example.com', 0, 0, '#2359ee', NULL, '$2y$10$RC3p76zmacs/EQ.tIy5i.OeSHsXjTaJxjnLCCNSAUXtILsKlM/OUe', 'Super Admin', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, NULL, '2021-09-12 03:11:07', '2021-09-12 03:11:07', NULL),
(2, NULL, 'Paresh', 'paresh@chesacrm.com', 0, 0, '#2359ee', NULL, '$2y$10$B2XqNFzX7570tuhBQs1GbO8bipW4tbPFMCPJ6pnkvDg32.TporF8S', 'Owner', NULL, NULL, '1122332211', NULL, 0, NULL, '2_avatar1632482843.jpg', NULL, 0, NULL, NULL, NULL, 'en', NULL, NULL, 1, '2022-12-31', NULL, 2, 0, 0, 0, 1, 0, 1, 'LX8kbXK1rw8FPNgWw2tc24ZHepaWJcVLfWfQyBg3YVO6nciYAoY1EPc6AsmH', '2021-09-12 03:11:12', '2022-01-06 07:09:10', NULL),
(3, NULL, 'Yogi', 'yogi@gmail.com', 0, 0, '#2359ee', NULL, '$2y$10$0Rh72XaUZUY0Ltt6ISpP0emjsPhSFDouGtvnh36TWnkV.Qf.f.5le', 'Connector', '1985-01-13', NULL, '9898989898', NULL, NULL, NULL, NULL, NULL, NULL, '1985-01-13', 'No', NULL, 'en', '', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-01-05 20:36:40', '2022-01-10 00:49:38', NULL),
(4, NULL, 'Vikas', 'vikas@gmail.com', 0, 0, '#2359ee', NULL, '$2y$10$QcIbfg9kbnVxPQ1WoGx4Q.6HjdJm.BC8lY4XkV04rBoeN.Qhc45uq', 'Employee', '2010-02-01', NULL, '1234567777', NULL, NULL, NULL, NULL, NULL, NULL, '2000-12-01', 'Yes', 1, 'en', 'RM', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-01-05 20:46:47', '2022-01-08 00:02:43', NULL),
(5, NULL, 'ABHI', 'ABHI@GMAIL.COM', 0, 0, '#2359ee', NULL, '$2y$10$DkBY3Rjklgj2s2QT1z1Pf.BAU8e6FlF23l3Yzr2DWjCi2JCtbbdZ.', 'Connector', '2010-10-01', NULL, '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, '2000-01-01', 'Yes', NULL, 'en', '', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-01-05 20:50:16', '2022-01-05 20:50:16', NULL),
(6, NULL, 'shruti', 'shruti@gmail.com', 0, 0, '#2359ee', NULL, '$2y$10$AbsVjnbgn.JWwdYhHkDtN.3stTPAIH/YfaHx1/J30LW5yOPU2v7im', 'Employee', NULL, NULL, '1234567777', NULL, NULL, NULL, NULL, NULL, NULL, '2000-01-01', 'No', 1, 'en', 'RM', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-01-05 20:51:00', '2022-01-05 20:51:00', NULL),
(7, 6, 'Ranvijay', 'ranvijay1@gmail.com', 0, 0, '#2359ee', NULL, '$2y$10$kOMqc2J4Cw20UCASvJb6wunnTYLk.sRjMOAhT1yaaYaTZVFk7C7xu', 'Client', NULL, NULL, NULL, 'Product ID : 2', 1, NULL, NULL, 'cf0927e98d2e3bf814259f45af6cc667d4c12e40', NULL, NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-01-12 05:20:42', '2022-01-12 05:20:42', NULL),
(8, NULL, 'snehal', 'snehalgujar@gmail.com', 0, 0, '#2359ee', NULL, '$2y$10$Ld3ijhMw8FiifpZKVAnwEONlX0hVQm9Y5tPFvzxS5VDIp7IuwzgaS', 'Owner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f2eb2d62305d190be5835da5382665597175063a', NULL, NULL, NULL, NULL, 'en', NULL, NULL, 1, '2022-01-29', NULL, 2, 0, 0, 0, 1, 0, 1, NULL, '2022-01-29 00:37:09', '2022-01-31 03:11:34', NULL),
(9, NULL, 'snehal', 'snehalgujar1@gmail.com', 0, 0, '#2359ee', NULL, '$2y$10$J1KXJTR/ThCJNtACEw3bOOQxL6H7fYxjIyuIehGLo/6fSwRCXXbd6', 'Owner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'd4b0e1198810d0cbfdd5afd92767d61b41229522', NULL, NULL, NULL, NULL, 'en', NULL, NULL, 1, NULL, NULL, 0, 0, 0, 0, 1, 0, 1, NULL, '2022-01-29 04:23:19', '2022-01-29 04:23:19', NULL),
(10, NULL, 'sonali', 'sg@g.com', 0, 0, '#2359ee', NULL, '$2y$10$aDE9DWt9ORW3LXqEMF.6N.bduzrbBzjFW.ajozTCjMe6S8RDhdeFC', 'Connector', NULL, NULL, '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, '1991-03-06', 'no', 1, 'en', 'sadfdsf', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-02-08 06:51:15', '2022-02-08 06:51:15', NULL),
(11, NULL, 'sonali', '2022-02-11', 0, 0, '#2359ee', NULL, '$2y$10$74v.jw9J.70tmS00zJJsqu4bUtCV0pAIOZiTWV8ws.YKkPZCeuG5C', 'Client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-02-11 05:45:07', '2022-02-11 05:45:07', NULL),
(12, 4, 'jaybhaye', 'k@gmail.com', 0, 0, '#2359ee', NULL, '$2y$10$1m6onuFX0xknAZ/AbB5cbu1p0DlNjWWv1N3SB.1GtEmGKzq8GJObm', 'Client', NULL, NULL, NULL, 'Product ID : 2', 6, NULL, NULL, '3f9b14b6027b05f18ed1923cbde786ab86860eda', NULL, NULL, NULL, NULL, 'en', NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 2, 0, 1, NULL, '2022-02-21 06:29:47', '2022-02-21 06:29:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_coupons`
--

CREATE TABLE `user_coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `user` int NOT NULL,
  `coupon` int NOT NULL,
  `order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_deals`
--

CREATE TABLE `user_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `deal_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_deals`
--

INSERT INTO `user_deals` (`id`, `user_id`, `deal_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2022-01-12 05:20:45', '2022-01-12 05:20:45'),
(2, 6, 1, '2022-01-12 05:20:45', '2022-01-12 05:20:45'),
(5, 2, 3, '2022-02-21 22:39:10', '2022-02-21 22:39:10'),
(6, 4, 3, '2022-02-21 22:39:10', '2022-02-21 22:39:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_email_templates`
--

CREATE TABLE `user_email_templates` (
  `id` bigint UNSIGNED NOT NULL,
  `template_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_email_templates`
--

INSERT INTO `user_email_templates` (`id`, `template_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0, '2021-09-12 08:41:14', '2021-09-16 03:46:50'),
(2, 2, 2, 1, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(3, 3, 2, 1, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(4, 4, 2, 1, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(5, 5, 2, 1, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(6, 6, 2, 1, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(7, 7, 2, 1, '2021-09-12 08:41:14', '2021-09-12 08:41:14'),
(8, 8, 2, 1, '2021-09-12 08:41:14', '2021-09-24 23:43:43'),
(9, 1, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(10, 2, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(11, 3, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(12, 4, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(13, 5, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(14, 6, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(15, 7, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(16, 8, 8, 1, '2022-01-29 00:37:09', '2022-01-29 00:37:09'),
(17, 1, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(18, 2, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(19, 3, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(20, 4, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(21, 5, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(22, 6, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(23, 7, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19'),
(24, 8, 9, 1, '2022-01-29 04:23:19', '2022-01-29 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_leads`
--

CREATE TABLE `user_leads` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_leads`
--

INSERT INTO `user_leads` (`id`, `user_id`, `lead_id`, `created_at`, `updated_at`) VALUES
(9, 2, 2, '2022-01-06 02:19:43', '2022-01-06 02:19:43'),
(10, 6, 2, '2022-01-06 02:19:43', '2022-01-06 02:19:43'),
(11, 2, 3, '2022-01-06 02:31:30', '2022-01-06 02:31:30'),
(12, 4, 3, '2022-01-06 02:31:30', '2022-01-06 02:31:30'),
(13, 2, 4, '2022-01-06 02:33:47', '2022-01-06 02:33:47'),
(14, 4, 4, '2022-01-06 02:33:47', '2022-01-06 02:33:47'),
(15, 2, 5, '2022-01-06 07:42:45', '2022-01-06 07:42:45'),
(16, 6, 5, '2022-01-06 07:42:45', '2022-01-06 07:42:45'),
(17, 2, 6, '2022-01-07 21:05:04', '2022-01-07 21:05:04'),
(18, 4, 6, '2022-01-07 21:05:04', '2022-01-07 21:05:04'),
(19, 4, 7, '2022-01-08 00:16:40', '2022-01-08 00:16:40'),
(20, 3, 8, '2022-01-10 00:51:14', '2022-01-10 00:51:14'),
(21, 3, 8, '2022-01-10 00:51:14', '2022-01-10 00:51:14'),
(22, 2, 9, '2022-01-12 02:10:53', '2022-01-12 02:10:53'),
(23, 4, 9, '2022-01-12 02:10:53', '2022-01-12 02:10:53'),
(24, 2, 10, '2022-01-12 03:45:35', '2022-01-12 03:45:35'),
(25, 4, 10, '2022-01-12 03:45:35', '2022-01-12 03:45:35'),
(26, 2, 13, '2022-02-10 23:58:31', '2022-02-10 23:58:31'),
(27, 4, 13, '2022-02-10 23:58:31', '2022-02-10 23:58:31'),
(28, 2, 14, '2022-02-12 06:51:33', '2022-02-12 06:51:33'),
(29, 4, 14, '2022-02-12 06:51:33', '2022-02-12 06:51:33'),
(30, 2, 15, '2022-02-17 17:12:27', '2022-02-17 17:12:27'),
(31, 4, 15, '2022-02-17 17:12:27', '2022-02-17 17:12:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_payment_settings`
--
ALTER TABLE `admin_payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_payment_settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `callback`
--
ALTER TABLE `callback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_deals`
--
ALTER TABLE `client_deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_deals_client_id_foreign` (`client_id`),
  ADD KEY `client_deals_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `client_permissions`
--
ALTER TABLE `client_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_permissions_client_id_foreign` (`client_id`),
  ADD KEY `client_permissions_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_field_values_record_id_field_id_unique` (`record_id`,`field_id`),
  ADD KEY `custom_field_values_field_id_foreign` (`field_id`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_calls`
--
ALTER TABLE `deal_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_calls_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `deal_discussions`
--
ALTER TABLE `deal_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_discussions_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `deal_emails`
--
ALTER TABLE `deal_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_emails_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `deal_files`
--
ALTER TABLE `deal_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_files_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `deal_tasks`
--
ALTER TABLE `deal_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deal_tasks_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimations`
--
ALTER TABLE `estimations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estimation_products`
--
ALTER TABLE `estimation_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_builders`
--
ALTER TABLE `form_builders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form_builders_code_unique` (`code`);

--
-- Indexes for table `form_fields`
--
ALTER TABLE `form_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_field_responses`
--
ALTER TABLE `form_field_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `form_responses`
--
ALTER TABLE `form_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_page_sections`
--
ALTER TABLE `landing_page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leads_email_unique` (`email`);

--
-- Indexes for table `lead_activities`
--
ALTER TABLE `lead_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_activity_logs`
--
ALTER TABLE `lead_activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_calls`
--
ALTER TABLE `lead_calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_calls_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_case_structuring_details`
--
ALTER TABLE `lead_case_structuring_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_details`
--
ALTER TABLE `lead_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_discussions`
--
ALTER TABLE `lead_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_discussions_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_emails`
--
ALTER TABLE `lead_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_emails_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_files_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_loans`
--
ALTER TABLE `lead_loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_mortgage_details`
--
ALTER TABLE `lead_mortgage_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_stages`
--
ALTER TABLE `lead_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_tasks`
--
ALTER TABLE `lead_tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdfs`
--
ALTER TABLE `mdfs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdf_funds`
--
ALTER TABLE `mdf_funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdf_products`
--
ALTER TABLE `mdf_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdf_statuses`
--
ALTER TABLE `mdf_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdf_sub_types`
--
ALTER TABLE `mdf_sub_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdf_types`
--
ALTER TABLE `mdf_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_id_unique` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_name_unique` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referred_requests`
--
ALTER TABLE `referred_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_deals`
--
ALTER TABLE `user_deals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_deals_user_id_foreign` (`user_id`),
  ADD KEY `user_deals_deal_id_foreign` (`deal_id`);

--
-- Indexes for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_leads`
--
ALTER TABLE `user_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_leads_user_id_foreign` (`user_id`),
  ADD KEY `user_leads_lead_id_foreign` (`lead_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_payment_settings`
--
ALTER TABLE `admin_payment_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `callback`
--
ALTER TABLE `callback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_deals`
--
ALTER TABLE `client_deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_permissions`
--
ALTER TABLE `client_permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deal_calls`
--
ALTER TABLE `deal_calls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_discussions`
--
ALTER TABLE `deal_discussions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_emails`
--
ALTER TABLE `deal_emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_files`
--
ALTER TABLE `deal_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_tasks`
--
ALTER TABLE `deal_tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `estimations`
--
ALTER TABLE `estimations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimation_products`
--
ALTER TABLE `estimation_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_builders`
--
ALTER TABLE `form_builders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `form_fields`
--
ALTER TABLE `form_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_field_responses`
--
ALTER TABLE `form_field_responses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `form_responses`
--
ALTER TABLE `form_responses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `landing_page_sections`
--
ALTER TABLE `landing_page_sections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lead_activities`
--
ALTER TABLE `lead_activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lead_activity_logs`
--
ALTER TABLE `lead_activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `lead_calls`
--
ALTER TABLE `lead_calls`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_case_structuring_details`
--
ALTER TABLE `lead_case_structuring_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lead_details`
--
ALTER TABLE `lead_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lead_discussions`
--
ALTER TABLE `lead_discussions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_emails`
--
ALTER TABLE `lead_emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_files`
--
ALTER TABLE `lead_files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lead_loans`
--
ALTER TABLE `lead_loans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lead_mortgage_details`
--
ALTER TABLE `lead_mortgage_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lead_stages`
--
ALTER TABLE `lead_stages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `lead_tasks`
--
ALTER TABLE `lead_tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mdfs`
--
ALTER TABLE `mdfs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdf_funds`
--
ALTER TABLE `mdf_funds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdf_products`
--
ALTER TABLE `mdf_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdf_statuses`
--
ALTER TABLE `mdf_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdf_sub_types`
--
ALTER TABLE `mdf_sub_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdf_types`
--
ALTER TABLE `mdf_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `pipelines`
--
ALTER TABLE `pipelines`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `referred_requests`
--
ALTER TABLE `referred_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_coupons`
--
ALTER TABLE `user_coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_deals`
--
ALTER TABLE `user_deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_leads`
--
ALTER TABLE `user_leads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_deals`
--
ALTER TABLE `client_deals`
  ADD CONSTRAINT `client_deals_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `client_deals_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `client_permissions`
--
ALTER TABLE `client_permissions`
  ADD CONSTRAINT `client_permissions_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `client_permissions_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deal_calls`
--
ALTER TABLE `deal_calls`
  ADD CONSTRAINT `deal_calls_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deal_discussions`
--
ALTER TABLE `deal_discussions`
  ADD CONSTRAINT `deal_discussions_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deal_emails`
--
ALTER TABLE `deal_emails`
  ADD CONSTRAINT `deal_emails_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deal_files`
--
ALTER TABLE `deal_files`
  ADD CONSTRAINT `deal_files_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `deal_tasks`
--
ALTER TABLE `deal_tasks`
  ADD CONSTRAINT `deal_tasks_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_calls`
--
ALTER TABLE `lead_calls`
  ADD CONSTRAINT `lead_calls_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_discussions`
--
ALTER TABLE `lead_discussions`
  ADD CONSTRAINT `lead_discussions_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_emails`
--
ALTER TABLE `lead_emails`
  ADD CONSTRAINT `lead_emails_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD CONSTRAINT `lead_files_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `user_deals`
--
ALTER TABLE `user_deals`
  ADD CONSTRAINT `user_deals_deal_id_foreign` FOREIGN KEY (`deal_id`) REFERENCES `deals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_deals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_leads`
--
ALTER TABLE `user_leads`
  ADD CONSTRAINT `user_leads_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_leads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
