-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 25 2022 г., 08:02
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `admin_lk`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_list`
--

CREATE TABLE `admin_list` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `chat_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_list`
--

INSERT INTO `admin_list` (`id`, `name`, `phone`, `chat_id`) VALUES
(1, 'Нестеров Андрей', '+79030264456', '250826590'),
(2, 'Машкова Елена', '+79206106746', '456211880');

-- --------------------------------------------------------

--
-- Структура таблицы `build_tasks_auto`
--

CREATE TABLE `build_tasks_auto` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `tkp_id` varchar(256) NOT NULL,
  `filepath` text NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=321 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `build_tasks_auto`
--

INSERT INTO `build_tasks_auto` (`id`, `name`, `tkp_id`, `filepath`) VALUES
(1, 'kochevnik-8-m-s-pand-plity-3h1-75-npkm-482-401-44-01mch', '1,15', '/build-tasks/build-tasks-auto/kochevnik-pandus/8meters/kochevnik-8-m-s-pand-plity-3h1-75-npkm-482-401-44-01mch.pdf'),
(2, 'kochevnik-12-m-s-pand-plity-3h1-75-npkm-482-401-44-02mch', '2,3,4,16,17,18', '/build-tasks/build-tasks-auto/kochevnik-pandus/12meters/kochevnik-12-m-s-pand-plity-3h1-75-npkm-482-401-44-02mch.pdf'),
(3, 'kochevnik-16-m-s-pand-plity-3h1-75-npkm-482-401-44-03mch', '5,6,19,20', '/build-tasks/build-tasks-auto/kochevnik-pandus/16meters/kochevnik-16-m-s-pand-plity-3h1-75-npkm-482-401-44-03mch.pdf'),
(4, 'kochevnik-18-m-s-pand-plity-3h1-75-npkm-482-401-44-04mch', '7,8,9,21,22,23', '/build-tasks/build-tasks-auto/kochevnik-pandus/18meters/kochevnik-18-m-s-pand-plity-3h1-75-npkm-482-401-44-04mch.pdf'),
(5, 'kochevnik-20-m-s-pand-plity-3h175-npkm-482-401-44-05mch', '10,11,12,24,25', '/build-tasks/build-tasks-auto/kochevnik-pandus/20meters/kochevnik-20-m-s-pand-plity-3h175-npkm-482-401-44-05mch.pdf'),
(6, 'kochevnik-24-m-s-pand-plity-3h1-75-npkm-482-401-44mch', '13,14,26,27', '/build-tasks/build-tasks-auto/kochevnik-pandus/24meters/kochevnik-24-m-s-pand-plity-3h1-75-npkm-482-401-44mch.pdf'),
(7, 'patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-40-fundament-m8200b-08-2-h-k', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-40-fundament-m8200b-08-2-h-k.pdf'),
(8, 'patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-41-fundament-m8200b-08-k', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-41-fundament-m8200b-08-k.pdf'),
(9, 'patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-40-fundament-m8200b-08-2-h-k', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-40-fundament-m8200b-08-2-h-k.pdf'),
(10, 'patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-41-fundament-m8200b-08-k', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-41-fundament-m8200b-08-k.pdf'),
(11, 'torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01.pdf'),
(12, 'torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01.pdf'),
(13, 'zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02.pdf'),
(14, 'zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02', '42,44,70,72', '/build-tasks/build-tasks-auto/patriot-priyamok/8meters/zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02.pdf'),
(15, 'patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-42-fundament-m8200b-12-k', '43,45,49,71,73,76', '/build-tasks/build-tasks-auto/patriot-priyamok/12meters/patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-42-fundament-m8200b-12-k.pdf'),
(16, 'patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-42-fundament-m8200b-12-k', '43,45,49,71,73,76', '/build-tasks/build-tasks-auto/patriot-priyamok/12meters/patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-42-fundament-m8200b-12-k.pdf'),
(17, 'torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01', '43,45,49,71,73,76', '/build-tasks/build-tasks-auto/patriot-priyamok/12meters/torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01.pdf'),
(18, 'torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01', '43,45,49,71,73,76', '/build-tasks/build-tasks-auto/patriot-priyamok/12meters/torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01.pdf'),
(19, 'zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02', '43,45,49,71,73,76', '/build-tasks/build-tasks-auto/patriot-priyamok/12meters/zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02.pdf'),
(20, 'zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02', '43,45,49,71,73,76', '/build-tasks/build-tasks-auto/patriot-priyamok/12meters/zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02.pdf'),
(21, 'patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-43-fundament-m8200b-16-k', '46,50,74,77', '/build-tasks/build-tasks-auto/patriot-priyamok/16meters/patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-43-fundament-m8200b-16-k.pdf'),
(22, 'patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-43-fundament-m8200b-16-k', '46,50,74,77', '/build-tasks/build-tasks-auto/patriot-priyamok/16meters/patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-43-fundament-m8200b-16-k.pdf'),
(23, 'torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01', '46,50,74,77', '/build-tasks/build-tasks-auto/patriot-priyamok/16meters/torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01.pdf'),
(24, 'torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01', '46,50,74,77', '/build-tasks/build-tasks-auto/patriot-priyamok/16meters/torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01.pdf'),
(25, 'zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02', '46,50,74,77', '/build-tasks/build-tasks-auto/patriot-priyamok/16meters/zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02.pdf'),
(26, 'zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02', '46,50,74,77', '/build-tasks/build-tasks-auto/patriot-priyamok/16meters/zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02.pdf'),
(27, 'patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-44-fundament-m8200b-18-k', '47,48,51,54,75,78,81', '/build-tasks/build-tasks-auto/patriot-priyamok/18meters/patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-44-fundament-m8200b-18-k.pdf'),
(28, 'patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-44-fundament-m8200b-18-k', '47,48,51,54,75,78,81', '/build-tasks/build-tasks-auto/patriot-priyamok/18meters/patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-44-fundament-m8200b-18-k.pdf'),
(29, 'torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01', '47,48,51,54,75,78,81', '/build-tasks/build-tasks-auto/patriot-priyamok/18meters/torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01.pdf'),
(30, 'torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01', '47,48,51,54,75,78,81', '/build-tasks/build-tasks-auto/patriot-priyamok/18meters/torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01.pdf'),
(31, 'zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02', '47,48,51,54,75,78,81', '/build-tasks/build-tasks-auto/patriot-priyamok/18meters/zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02.pdf'),
(32, 'zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02', '47,48,51,54,75,78,81', '/build-tasks/build-tasks-auto/patriot-priyamok/18meters/zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02.pdf'),
(33, 'patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-45-fundament-m8200b-20-k', '52,55,56,79,82', '/build-tasks/build-tasks-auto/patriot-priyamok/20meters/patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-45-fundament-m8200b-20-k.pdf'),
(34, 'patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-45-fundament-m8200b-20-k', '52,55,56,79,82', '/build-tasks/build-tasks-auto/patriot-priyamok/20meters/patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-45-fundament-m8200b-20-k.pdf'),
(35, 'torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01', '52,55,56,79,82', '/build-tasks/build-tasks-auto/patriot-priyamok/20meters/torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01.pdf'),
(36, 'torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01', '52,55,56,79,82', '/build-tasks/build-tasks-auto/patriot-priyamok/20meters/torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01.pdf'),
(37, 'zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02', '52,55,56,79,82', '/build-tasks/build-tasks-auto/patriot-priyamok/20meters/zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02.pdf'),
(38, 'zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02', '52,55,56,79,82', '/build-tasks/build-tasks-auto/patriot-priyamok/20meters/zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02.pdf'),
(39, 'patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-46-fundament-m8200b-24-k', '53,80,83', '/build-tasks/build-tasks-auto/patriot-priyamok/24meters/patriot-dyulin-kotlovan-specifikaciya-npkm-482-207-46-fundament-m8200b-24-k.pdf'),
(40, 'patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-46-fundament-m8200b-24-k', '53,80,83', '/build-tasks/build-tasks-auto/patriot-priyamok/24meters/patriot-dyulin-kotlovan-stroitelnoe-zadanie-npkm-482-207-46-fundament-m8200b-24-k.pdf'),
(41, 'torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01', '53,80,83', '/build-tasks/build-tasks-auto/patriot-priyamok/24meters/torec-fundamenta-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-01.pdf'),
(42, 'torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01', '53,80,83', '/build-tasks/build-tasks-auto/patriot-priyamok/24meters/torec-fundamenta-patriot-dyulin-specifikaciya-npkm-482-200-40-01.pdf'),
(43, 'zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02', '53,80,83', '/build-tasks/build-tasks-auto/patriot-priyamok/24meters/zakladnaya-patriot-dyulin-sborochnyj-chertezh-npkm-482-200-40-02.pdf'),
(44, 'zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02', '53,80,83', '/build-tasks/build-tasks-auto/patriot-priyamok/24meters/zakladnaya-patriot-dyulin-specifikaciya-npkm-482-200-40-02.pdf'),
(45, 'patriot-8m-npkm-482-401-54-02mch', '28,57,93', '/build-tasks/build-tasks-auto/patriot-pandus/8meters/patriot-8m-npkm-482-401-54-02mch.pdf'),
(46, 'patriot-12m-npkm-482-401-54-03mch', '29,30,31,58,59,60', '/build-tasks/build-tasks-auto/patriot-pandus/12meters/patriot-12m-npkm-482-401-54-03mch.pdf'),
(47, 'patriot-16m-npkm-482-401-54-04mch', '32,33,61,62', '/build-tasks/build-tasks-auto/patriot-pandus/16meters/patriot-16m-npkm-482-401-54-04mch.pdf'),
(48, 'patriot-18m-npkm-482-401-54mch', '34,35,36,63,64,65', '/build-tasks/build-tasks-auto/patriot-pandus/18meters/patriot-18m-npkm-482-401-54mch.pdf'),
(49, 'patriot-20m-npkm-482-401-54-05mch', '37,38,39,66,67', '/build-tasks/build-tasks-auto/patriot-pandus/20meters/patriot-20m-npkm-482-401-54-05mch.pdf'),
(50, 'patriot-20m-skhema-nagruzok-npkm-482-401-54-05s8', '37,38,39,66,67', '/build-tasks/build-tasks-auto/patriot-pandus/20meters/patriot-20m-skhema-nagruzok-npkm-482-401-54-05s8.pdf'),
(51, 'patriot-24m-npkm-482-401-54-06mch', '40,41,68,69', '/build-tasks/build-tasks-auto/patriot-pandus/24meters/patriot-24m-npkm-482-401-54-06mch.pdf');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int(10) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `img`, `parent`) VALUES
(1, 'Весы автомобильные', '/assets/default/img/categories/1.png', 0),
(2, 'Весы вагонные', '/assets/default/img/categories/2.png', 0),
(3, 'Приборы', '/assets/default/img/categories/3.png', 0),
(4, 'Промышленные платформенные Весы', '/assets/default/img/categories/4.png', 0),
(5, 'Большегрузные Весы', '/assets/default/img/categories/5.png', 0),
(6, 'Весы для взвешивания животных', '/assets/default/img/categories/6.png', 0),
(7, 'Монорельсовые Весы', '/assets/default/img/categories/7.png', 0),
(8, 'Конвеерные Весы', '/assets/default/img/categories/8.png', 0),
(9, 'Электронные бункерные Весы', '/assets/default/img/categories/9.png', 0),
(10, 'Дозаторы', '/assets/default/img/categories/10.png', 0),
(11, 'Шкафы управления', '/assets/default/img/categories/11.png', 0),
(12, 'Тензометрические датчики', '/assets/default/img/categories/12.png', 0),
(13, 'Узлы встройки тензодатчиков', '/assets/default/img/categories/13.png', 0),
(14, 'Комплектующие весовых систем', '/assets/default/img/categories/14.png', 0),
(16, 'Весы автомобильные на поверхности', '/assets/default/img/category-no-img.svg', 1),
(17, 'Весы автомобильные в приямок', '/assets/default/img/category-no-img.svg', 1),
(18, 'Весы автомобильные «Трэк»', '/assets/default/img/category-no-img.svg', 1),
(19, 'Весы автомобильные «Абсолют»', '/assets/default/img/category-no-img.svg', 1),
(20, 'Весы автомобильные «Оптимум-М»', '/assets/default/img/category-no-img.svg', 1),
(21, 'Весы автомобильные для взвешивания карьерных самосвалов (БелАЗ)', '/assets/default/img/category-no-img.svg', 1),
(22, 'Весы автомобильные во взрывозащищенном исполнении', '/assets/default/img/category-no-img.svg', 1),
(23, 'Вагонные весы для статического взвешивания', '/assets/default/img/category-no-img.svg', 2),
(24, 'Весы вагонные М8300-СД для взвешивания в статике и движении', '/assets/default/img/category-no-img.svg', 2),
(25, 'Платформенные весы на одном тензодатчике «Гарант»', '/assets/default/img/category-no-img.svg', 4),
(26, 'Платформенные весы на одном тензодатчике «Стандарт»', '/assets/default/img/category-no-img.svg', 4),
(27, 'Платформенные весы на четырёх тензодатчиках «Классик»', '/assets/default/img/category-no-img.svg', 4),
(28, 'Платформенные весы на четырёх тензодатчиках «Профи»', '/assets/default/img/category-no-img.svg', 4),
(29, 'Паллетные весы', '/assets/default/img/category-no-img.svg', 4),
(30, 'Противоударные весы для крановой погрузки «Удар»', '/assets/default/img/category-no-img.svg', 5),
(31, 'Платформенные большегрузные весы «Титан»', '/assets/default/img/category-no-img.svg', 5),
(32, 'Контейнерные весы', '/assets/default/img/category-no-img.svg', 5),
(33, 'Весы для взвешивания мелких домашних животных', '/assets/default/img/category-no-img.svg', 6),
(34, 'Весы для взвешивания крупного рогатого скота', '/assets/default/img/category-no-img.svg', 6),
(35, 'Тензометрические датчики типа «SINGLE-POINT»', '/assets/default/img/category-no-img.svg', 12),
(36, 'Тензометрические датчики типа «Колонна»', '/assets/default/img/category-no-img.svg', 12),
(37, 'Тензометрические датчики типа «S-ОБРАЗНЫЙ»', '/assets/default/img/category-no-img.svg', 12),
(38, 'Тензометрические датчики типа «Двусторонняя балка среза»', '/assets/default/img/category-no-img.svg', 12),
(39, 'Тензометрические датчики типа «Балка среза»', '/assets/default/img/category-no-img.svg', 12),
(40, 'Весы вагонные бесфундаментные', '/assets/default/img/category-no-img.svg', 2),
(41, 'ГПУ', '/assets/default/img/category-no-img.svg', 16),
(42, 'Комплект настилов', '/assets/default/img/category-no-img.svg', 16),
(43, 'Комплект ограждений', '/assets/default/img/category-no-img.svg', 16),
(44, 'Комплект Кочевник с металлическими пандусами', '/assets/default/img/category-no-img.svg', 16),
(45, 'Комплект Кочевник с торцами под отсыпку/отливку', '/assets/default/img/category-no-img.svg', 16),
(46, 'Комплект для установки Патриот', '/assets/default/img/category-no-img.svg', 16),
(47, 'Аналоговые', '/assets/default/img/category-no-img.svg', 41),
(48, 'Многоканальные', '/assets/default/img/category-no-img.svg', 41);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) NOT NULL,
  `sku` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `sku`, `description`, `img`, `price`, `quantity`) VALUES
(1, 'Шкаф управления М6801', 11, 'р13232', '', '/assets/default/img/no-image.jpg', '102350', 0),
(2, 'Весы автомобильные ТРЭК М8200Б-30/40-07-М06-H8C-5T-800-БФ (НПКМ 482.008-03)', 18, 'р11598', 'Рабочее наименование старое: ТРЭК М8200Б-30/40-07-М06-Z-008-БФ. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-5T ZEMIC.  Длина платформ 7000 мм ширина 800 мм.', '/exchange/images/00-00010941.png', '593845', 0),
(3, 'Весы автомобильные ТРЭК М8200Б-30/40-09-М06-H8C-5T-800-БФ (НПКМ 482.008-05)', 18, 'р12309', 'Рабочее наименование старое: ТРЭК М8200Б-30/40-09-М06-Z-008-БФ. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-5T ZEMIC.  Длина платформ 9000 мм ширина 800 мм.', '/exchange/images/00-00011345.png', '655212', 0),
(4, 'Весы автомобильные ТРЭК М8200Б-30/40-08-М06-H8C-5T-800-БФ (НПКМ 482.008-04)', 18, 'р11599', 'Рабочее наименование старое: ТРЭК М8200Б-30/40-08-М06-Z-008-БФ. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-5T ZEMIC.  Длина платформ 8000 мм ширина 800 мм.', '/exchange/images/00-00010942.png', '630590', 0),
(5, 'М8400-2-1-320-001', 8, '14604', 'Ширина ленты: 400-500 мм. 4 датчика Z6FC3-100 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 320кг.   В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011211.jpg', '520606', 0),
(6, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-00.00', 3, 'р12992', 'Для конвейерных весов и ленточных дозаторов непрерывного действия, RS-485, MS-bus токовый выход 0-5 мА, без модуля сопряжения.', '/exchange/images/00-00010448.jpg', '44196', 0),
(7, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-04.02', 3, 'р14846', 'Для конвейерных весов, ленточных дозаторов непрерывного действия, блок сопряжения М2606, RS-485, MS-bus токовый выход 0-20 мА', '/assets/default/img/no-image.jpg', '61022', 0),
(8, 'Датчик М5023-Ni-1500кг-3м', 39, 'р14561', '', '/exchange/images/00-00010774.jpg', '18604', 17),
(9, 'Весы вагонные М8300-С-60-М06-C16A-1-К-Р_ _ (4)', 23, 'р13577', 'Весы для потележечного  взвешивания в статике.  Без рельсов.  4 датчика C16AC3-30t производства HBM', '/assets/default/img/no-image.jpg', '980746', 0),
(10, 'Весы автомобильные М8200Б-60-18-М06-НМ9В-001-К', 17, 'р14403', '', '/exchange/images/00-00010672.jpg', '2252737', 0),
(11, 'Весы автомобильные ТРЭК М8200Б-30/40-09-М06-H8C-10T-1000-БФ (НПКМ 482.039)', 18, 'р15248', 'Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-10T ZEMIC.  Длина платформ 9000 мм ширина 1000 мм.', '/exchange/images/00-00010829.png', '708760', 0),
(12, 'Весы автомобильные ТРЭК М8200Б-30/40-08-М06-H8C-5T-1000-БФ (НПКМ 482.043)', 18, 'р15483', 'Рабочее наименование старое: ТРЭК М8200Б-30/40-08-М06-Z-010-БФ Ширина платформы 1000мм. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-5T ZEMIC.  Длина платформ 8000 мм ширина 1000 мм.', '/exchange/images/00-00010838.png', '686028', 0),
(13, 'Шкаф управления М6035-П (НПКМ 460.045)', 11, '33972', '', '/assets/default/img/no-image.jpg', '273793', 0),
(14, 'КЛАССИК 1000 (1200х1500мм)  М8100-1-АК11С', 27, 'р08855', 'Весы палтформенные 1200х1500х90 (4 датчика), однодиапазонные 1000 кг. Дискретность индикации 0,5 Кг. К весам подходят пандусы  р9675, р9679, рама р9062', '/exchange/images/00-00011077.jpg', '127008', 0),
(15, 'КЛАССИК 300/600 (1000х1200мм) М8100-0,3/0,6-АК1С', 27, 'р08850', 'Весы платформенные 1000х1200х90 (4 датчика), двухинтервальные 300/600 кг. Дискретность индикации 0,1/0,2 Кг. К весам подходят пандусы  р9662, р9668, рама р9059', '/exchange/images/00-00011072.jpg', '119528', 0),
(16, 'Весы автомобильные М8200Б-80-12-ПК-HM9B-003-К', 17, 'р14511', '', '/exchange/images/00-00010735.jpg', '1586161', 0),
(17, 'Оптимум 30/60-18 (М8200Б-30/60-18-М06-V-012)', 20, '10322', 'НПВ 60т d=20кг, допустимая нагрузка на ось 10 т. ГПУ 18000х3000мм над поверхностью земли с пандусами. Датчики DLB-40 Klb. Схема установки датчиков 2-4-2.', '/assets/default/img/no-image.jpg', '2982918', 0),
(18, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-02.00', 3, 'р14840', 'Для конвейерных весов, ленточных дозаторов непрерывного действия и конвейерных дозаторов доз, блок сопряжения М2604, RS-485, MS-bus токовый выход 0-5 мА', '/assets/default/img/no-image.jpg', '55341', 0),
(19, 'КЛАССИК 600/1500 (1200х1200мм) М8100-0,6/1,5-АК2С', 27, 'р08778', 'Весы палтформенные 1200х1200х90 (4 датчика), двухинтервальные  600х1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят пандусы  р9675, р9679, рама р9061', '/exchange/images/00-00011069.jpg', '123543', 3),
(20, 'Весы автомобильные М8200Б-60-12-ПК-HM9B-002-К', 17, 'р14512', '', '/exchange/images/00-00010736.jpg', '1788126', 0),
(21, 'Стандарт 60/150 (М8000-60/150-1-КН4А)', 26, 'р09723', 'ГПУ из конструкционной стали. Крышка из нержавеющей стали. 450х600мм. датчик Алюминиевый LOC-250. СПЕЦНАСТРОЙКА прибора', '/exchange/images/00-00011173.jpg', '70508', 0),
(22, 'Весы автомобильные М8200Б-80-20-ПК-HM9B-002-К', 17, 'р14505', '', '/exchange/images/00-00010729.jpg', '2868214', 0),
(23, 'Весы автомобильные ТРЭК М8200Б-30/40-08-М06-H8C-10T-800-БФ (НПКМ 482.024-02)', 18, 'р12365', 'Рабочее наименование старое: Весы автомобильные ТРЭК М8200Б-30/40-08-М06-Z-024-БФ. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-10T ZEMIC.  Длина платформ 8000 мм ширина 800 мм.', '/exchange/images/00-00010925.png', '599148', 0),
(24, 'ПРОФИ 300/600 (1200х1200мм) М8101-0,3/0,6-АН2Н', 28, 'р09007', 'Весы платформенные из нержавеющей стали1200х1200х90 (4 датчика), двухдиапазонные 300/600 кг. Дискретность индикации 0,1/0,2 Кг. К весам подходят пандусы р9297, р9298, рама р9061', '/exchange/images/00-00011092.jpg', '285345', 0),
(25, 'Концентратор RS485 М2110 на DIN рельс', 3, 'р08471', '', '/exchange/images/00-00011059.jpg', '14089', 10),
(26, 'М62109-12в', 3, 'р08481', 'Комплект поставки:  Преобразователь-концентратор RS232/RS485 (М2109), блок питания 12в., кабель USB для подключения к компьютеру.', '/exchange/images/00-00011060.png', '14089', 2),
(27, 'М8400-2-3-63-001', 8, 'П6242', 'Ширина ленты: 600-800 мм. 4 датчика Z6FC3-20 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 63кг.В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011204.png', '520606', 0),
(28, 'Датчик М5023-Ni-750кг-3м', 39, 'р14566', '', '/exchange/images/00-00010777.jpg', '18604', 12),
(29, 'М8400-2-7-320-001', 8, '13562', 'Ширина ленты: 1400-1600 мм. 4 датчика Z6FC3-100 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 320кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011207.jpg', '520606', 0),
(30, 'М8400-2-5-630-001', 8, '14298', 'Ширина ленты: 1000-1200 мм. 4 датчика Z6FC3-200 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 630кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011023.jpg', '520606', 0),
(31, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-02.01', 3, 'р14842', 'Для конвейерных весов, ленточных дозаторов непрерывного действия, блок сопряжения М2604, RS-485, MS-bus токовый выход 4-20 мА', '/assets/default/img/no-image.jpg', '55525', 0),
(32, 'Весы автомобильные М8200Б-40-08-М06-НМ9В-002-К', 17, 'р14391', '', '/exchange/images/00-00010666.jpg', '1297461', 0),
(33, 'Микросим М0808-01-031', 3, '15726', 'Прежнее название М0803-1. Цифровой тензопреобразователь в корпусе G120 , RS485, 4 вх, 4 вых. Светодиоды внутри. 1 тензо датчик.', '/assets/default/img/no-image.jpg', '27338', 2),
(34, 'Микросим-06А (М1900)', 3, '2939', 'индикация и клавиатура М0600-А, RS485, Гарантия 1 годиндикация и клавиатура М0600-А, RS485, Гарантия 1 год', '/exchange/images/00-00011146.jpg', '26126', 1),
(35, 'ПРОФИ 300/600 (1000х1500мм) М8101-0,3/0,6-АН10Н', 28, 'р09005', 'Весы платформенные из нержавеющей стали 1000х1500х90 (4 датчика), двухдиапазонные 300/600 кг. К весам подходят Пандусы р9295, р9296, рама р9060', '/exchange/images/00-00011090.jpg', '288386', 0),
(36, 'Весы вагонные М8300-СД-150-ПК-740DMET-2-K-Р_ _ (4-x-4)', 24, 'р13593', 'Весы для повагонного взвешивания в статике и движении. Без рельсов. 8 датчиков M.740 DMET 30T  производства МЕТРА (UTILCELL)', '/assets/default/img/no-image.jpg', '1726714', 1),
(37, 'Моно 600/1500Н', 7, '18268', 'НОС-2t 1 датч. Нержавеющие. Плоск.Грузоподъемность до 1500 кг. Встраиваются в штатный монорельс конвейера.', '/exchange/images/00-00010908.png', '169967', 0),
(38, 'Абсолют 60/100-18-К (М8200А-60/100-1-3-18-008-К)', 19, '15641', 'ГПУ 18000х3450 мм в котлован. 8 датчиков M.740 30T   (Комплект)  (колонна) нержавеющая сталь  IP68. Нагрузка 4 оси по 16 т/ось .Ширина платформы весов 3 м. Сплошное покрытие ГПУ лист 16мм. Продольные двутавровые балки марка  50Б1, поперечные стяжки из балки  марка 25Б2.', '/assets/default/img/no-image.jpg', '3829044', 0),
(39, 'Датчик скорости импульсный М4208', 3, 'р13317', '', '/assets/default/img/no-image.jpg', '73171', 0),
(40, 'Весы вагонные М8300-С-60-М06-740-1-К-Р65 (4) р13578     ', 23, 'р13578', 'Весы для потележечного  взвешивания в статике.  В комплекте с рельсами Р65.  4 датчика M.740 30T производства UTILCELL', '/assets/default/img/no-image.jpg', '1006908', 0),
(41, 'Шкаф управления М6404', 11, 'р08174', 'Шкаф управления М6404 (Северсталь)', '/assets/default/img/no-image.jpg', '174985', 0),
(42, 'Шкаф пневмоавтоматики М7003', 11, 'р12696', '', '/assets/default/img/no-image.jpg', '53303', 0),
(43, 'Шкаф управления М6506', 11, 'р08350', 'Шкаф управления для Дифлекс (Выкса-2)', '/assets/default/img/no-image.jpg', '525029', 0),
(44, 'М6403', 11, '12649', 'для конвейерных весов , Прибор М0600-К6 с модулем М2604, источник питания, кнопки пуск, стоп, выключатель автоматический, лампы индикации,  кабельные вводы, клеммные соединители, розетка', '/exchange/images/00-00011019.jpg', '149364', 1),
(45, 'Весы вагонные М8300-С-150-М06-HM14H-2-К-Р_ _ (4-x-4)', 23, 'р13589', 'Весы для повагонного взвешивания в статике.  Без рельсов.  8 датчиков HM14C-C3-30t-13B6-D05 производства ZEMIC', '/exchange/images/00-00010531.png', '1627198', 0),
(46, 'М8400-2-3-630-001', 8, '14349', 'Ширина ленты: 600-800 мм. 4 датчика Z6FC3-200 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 630кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011210.png', '520606', 0),
(47, 'Датчик М5023-Ni-375кг-3м', 39, 'р14562', '', '/exchange/images/00-00010775.jpg', '18604', 14),
(48, 'Микросим-06А (М0600-С6-3)', 3, 'П6297', 'Прошивка для поосного взвешивания автомобилей в движении', '/exchange/images/00-00011349.jpg', '58269', 1),
(49, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-02.02', 3, 'р14844', 'Для конвейерных весов, ленточных дозаторов непрерывного действия, блок сопряжения М2604, RS-485, MS-bus токовый выход 0-20 мА', '/assets/default/img/no-image.jpg', '60155', 0),
(50, 'Гарант 6/15 (М8000-6/15-1-НН2Н)', 25, 'р09351', 'Платформа из нержавеющей стали. Размер 350х450. Тензодатчик из нержавеющей стали М5064-25 кг.6кгХ2г/15кг Х5г, нерж. датчик, нерж. платформа 350х450 М=10кг. М0601-БМ', '/exchange/images/00-00011195.jpg', '76980', 0),
(51, 'Гарант 15/30 (М8000-15/30-1-НН2Н)', 25, 'р09352', 'Платформа из нержавеющей стали. Размер 350х450. Тензодатчик из нержавеющей стали М5064-50 кг', '/exchange/images/00-00011196.jpg', '76808', 3),
(52, 'Табло дублирующее М1903', 3, 'р08534', 'Для установки на улице. Зелёные индикаторы. Высота цифры 100мм. При установке данного табло на улице  использовать кабеля для с маркировкой OUTDOORS', '/exchange/images/00-00011066.jpg', '49498', 3),
(53, 'Весы автомобильные М8200Б-80-12-М06-НМ9В-003-К', 17, 'р14397', '', '/exchange/images/00-00010669.jpg', '1551204', 0),
(54, 'М8400-2-1-63-001', 8, '14731', '', '/exchange/images/00-00011213.jpg', '520606', 0),
(55, 'М4002-2', 14, '15180', 'Блок грозозащиты приборный, металлич. гермовводы, IP65', '/exchange/images/00-00010421.png', '5995', 4),
(56, 'Абсолют 60/100-24 (М8200А-60/100-1-1-24-010)', 19, 'р11302', '', '/assets/default/img/no-image.jpg', '4824147', 0),
(57, 'Шкаф управления М6030-У', 11, 'р11882', 'Убывающий  дозатор', '/assets/default/img/no-image.jpg', '333969', 0),
(58, 'Датчик СБ LOC-500 ЛАС', 35, '15578', 'Тензодатчик LOC-500 скабелем 5м и вилкой DB-9M для прибора М0600-Б', '/assets/default/img/no-image.jpg', '27252', 0),
(59, 'Шкаф управления М6025', 11, 'р07404', 'Шкаф управления бункерных весов', '/assets/default/img/no-image.jpg', '319519', 1),
(60, 'М5064-50 кг', 35, '3047', '50кг, 2мВ/В, 0.02%, -10-+40С, 380±30Ом, IP65, Нерж., 3м,', '/exchange/images/00-00010976.jpg', '20444', 22),
(61, 'Шкаф управления М6207', 11, 'р13803', 'Шкаф для управления светофорами, подключения 2х камер видео регистрации (распознавания номеров), подключения весов на цифровых датчиках. В состав входят Модуль tDS-735 (для подключения  с одной  стороны цифровых датчиков по RS 485, с другой Ethernet)  Индустриальный коммутатор NS-205PSE-24V с 5 шт  портами Ethernet для подключения камер и подачи на них питания.', '/exchange/images/00-00010548.jpg', '123336', 3),
(62, 'ПРОФИ 1500/3000 (1500х2000мм) М8101-1,5/3-АН4Н', 28, 'р09014', 'Весы платформенные из нержавеющей стали 1500х2000х90 (4 датчика), двухдиапазонные 1500/3000 кг. Дискретность индикации 0,5/1 Кг. К весам подходят Пандусы р9299, р9138, рама р9064', '/exchange/images/00-00011099.jpg', '344573', 0),
(63, 'Весы автомобильные М8200Б-100-20-М06-НМ9В-003-К', 17, 'р14411', '', '/exchange/images/00-00010676.jpg', '3038644', 0),
(64, 'Весы автомобильные М8200Б-60-16-М06-НМ9В-002-К', 17, 'р14399', '', '/exchange/images/00-00010670.jpg', '2238767', 0),
(65, 'Пандус М4816-10К (НПКМ 448.123)', 1, '', '', '/assets/default/img/no-image.jpg', '22502', 0),
(66, 'Весы вагонные М8300-СД-150-ПК-740DMET-1-K-Р_ _', 24, 'р13595', 'Весы для потележечного  взвешивания в Статике (в 2 такта) и  в движении.  Без рельсов.  4 датчика M.740 DMET 30T производства МЕТРА (UTILCELL)', '/assets/default/img/no-image.jpg', '905000', 0),
(67, 'Абсолют 60/100-18 (М8200А-60/100-1-3-18-010)', 19, 'р06231', 'ГПУ 18м х 3м. 8 датчиков M.740 30T   (Комплект)  (колонна) нержавеющая сталь  IP68. Нагрузка 4 оси по 16 т/ось . Сплошное покрытие ГПУ лист 16мм. Продольные двутавровые балки марка  50Б1, поперечные стяжки из балки  марка 25Б2.', '/assets/default/img/no-image.jpg', '3945272', 0),
(68, 'Весы автомобильные М8200Б-100-20-ПК-HM9B-003-К', 17, 'р14504', '', '/exchange/images/00-00010728.jpg', '3102767', 0),
(69, 'Весы вагонные М8300-С-150-М06-HM14H-2-К-Р65 (4-x-4)', 23, 'р13588', 'Весы для повагонного взвешивания в статике.  В комплекте с рельсами р65.  8 датчиков HM14C-C3-30t-13B6-D05 производства ZEMIC', '/exchange/images/00-00010529.png', '1981339', 0),
(70, 'М6103-П', 11, 'р05857', 'Для конвейерного дозатора местный пульт', '/assets/default/img/no-image.jpg', '112671', 0),
(71, 'Шкаф управления М6104', 11, 'р11725', 'Конвейерный дозатор  на контроллере (проверить спецификацию)', '/assets/default/img/no-image.jpg', '311152', 0),
(72, 'Весы вагонные М8300-СД-150-ПК-740DMET-2-K-Р65 (4-x-4)', 24, 'р13592', 'Весы для повагонного взвешивания в статике и движении. В комплекте с рельсами Р65. 8 датчиков M.740 DMET 30T  производства МЕТРА (UTILCELL)', '/assets/default/img/no-image.jpg', '2090940', 0),
(73, 'Шкаф управления М6025-П', 11, 'р12599', '', '/assets/default/img/no-image.jpg', '237725', 0),
(74, 'Шкаф управления М6025-Э', 11, 'р12823', '', '/assets/default/img/no-image.jpg', '271217', 0),
(75, 'Микросим М0808-01-032', 3, '16144', 'Прежнее название М0803-2. Цифровой тензопреобразователь в корпусе G120 2 ТД, RS485 без дискретных входов и выхода. 1 тензодатчик.', '/assets/default/img/no-image.jpg', '26302', 3),
(76, 'Весы вагонные М8300-С-150-M06-740-2-K-Р_ _ (4-x-4)', 23, 'р13587', 'Весы для повагонного взвешивания в статике.  Без рельсов.  8 датчиков M.740 30T производства UTILCELL', '/assets/default/img/no-image.jpg', '1594937', 0),
(77, 'М4209', 3, '32094', 'Импульсный датчик скорости с пружинным прижатием к нижней стороне рабочей ветви конвейерной ленты, с разъемом LTW на 4 контакта. 18имп/об,  Диапазон скоростей ленты от 0,1 до 5 м/с. Пластиковое колесо.', '/exchange/images/00-00032094.jpg', '42625', 1),
(78, 'Патриот 60/80-18-К (М8200Б-60/80-18-М06-HM9B-001-К) с пешеходным настилом', 17, 'р14405', 'Внимание, в  комплект поставки весов не входят фундаментные плиты! В приямок, настил входит в состав весов. 8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось. Швеллер 27У. Ширина платформы весов 3 м. Ширина колеи 1 м.', '/exchange/images/00-00010673.jpg', '2365640', 0),
(79, 'Весы автомобильные М8200Б-60-18-ПК-HM9B-001-К', 17, 'р14508', '', '/exchange/images/00-00010732.jpg', '2380682', 0),
(80, 'Оптимум 30/60-16 (М8200Б-30/60-16-М06-V-015)', 20, '2654', 'НПВ 40т d=10кг, допустимая нагрузка на ось 10 т. Допустимая нагрузка на одну секцию 25т. ГПУ 16000х3000мм над поверхностью земли с пандусами. Датчики DLB-40 Klb. Схема установки датчиков 2-4.', '/assets/default/img/no-image.jpg', '2970466', 0),
(81, 'Микросим М0601-БМ-3', 3, 'р11243', 'шкафного исполнения. На задней панели прибора все соединения на клеммниках под отвёртку', '/assets/default/img/no-image.jpg', '39662', 3),
(82, 'ПРОФИ 600/1500 (1000х1500мм) М8101-0,6/1,5-АН10Н', 28, 'р09006', 'Весы платформенные из нержавеющей стали1000х1500х90 (4 датчика), двухдиапазонные 600/1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят Пандусы р9295, р9296, рама р9060', '/exchange/images/00-00011091.jpg', '299959', 0),
(83, 'М5064-25 кг', 35, '3119', '25кг, 2мВ/В, 0.02%, -10-+40С, 350±30Ом, IP65, Нерж., 3м,', '/exchange/images/00-00011151.jpg', '22057', 12),
(84, 'Главный шкаф М6204 искрозащитный', 11, '18410', 'Шкаф искрозащитный М6204 в составе с барьерами искробезопасности (Z757 -1шт, Z765 – 2шт)', '/assets/default/img/no-image.jpg', '109654', 0),
(85, 'Титан 5000/10000 (М8100-10ТК5С)', 31, '17773', 'Крашеные, типоразмера №5 (2000х2000), на стальных тензодатчиках, с узлами встройки типа Подвеска. НПВ=10 т.', '/exchange/images/00-00011337.jpg', '418109', 0),
(86, 'КЛАССИК 2000 (1500х2000мм) М8100-2-АК4С', 27, 'р08861', 'Весы платформенные 1500х2000х90 (4 датчика), однодиапазонные 2000 кг. Дискретность индикации 1 Кг. К весам подходят пандусы  р9681, р9685, рама р9064', '/exchange/images/00-00011083.jpg', '141969', 0),
(87, 'М8400-2-5-160-001', 8, '14335', 'Ширина ленты: 1000-1200 мм. 4 датчика Z6FC3-50 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 160кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011227.jpg', '520606', 0),
(88, 'М8400-2-1-630-001', 8, '14605', 'Ширина ленты: 400-500 мм. 4 датчика Z6FC3-200 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 630кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011212.jpg', '520606', 0),
(89, 'Моно 300/600', 7, '18264', 'НОС-750 кг  1 датч. Крашенные. Плоский монорельс из полосы толщиной 10мм высотой 100 мм, длиной 600мм. Грузоподъемность до 600 кг. Встраиваются в штатный монорельс.', '/exchange/images/00-00010905.jpeg', '116552', 0),
(90, 'Весы вагонные М8300-СД-100-ПК-740DMET-2-K-Р_ _ (5-x-5)', 24, '29673', 'Весы для повагонного взвешивания в статике и движении. В комплекте без рельсов и креплений. 8 датчиков M.740 DMET 30T  производства МЕТРА (UTILCELL)', '/assets/default/img/no-image.jpg', '1558691', 0),
(91, 'КЛАССИК 2000 (1200х1500мм) М8100-2-АК11С', 27, 'р08856', 'Весы платформенные 1200х1500х90 (4 датчика), однодиапазонные 2000 кг. К весам подходят пандусы  р9675, р9679, рама р9062', '/exchange/images/00-00011078.jpg', '126273', 0),
(92, 'КЛАССИК 600/1500 (1000х1000мм)  М8100-0,6/1,5-АК0С', 27, 'р08849', 'Весы платформенные 1000х1000х90 (4 датчика), двухинтервальные 600/1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят пандусы  р9662, р9668, рама р9058', '/exchange/images/00-00011071.jpg', '119159', 0),
(93, 'ПРОФИ 300/600 (1000х1000мм) М8101-0,3/0,6-АН0Н', 28, 'р09001', 'Весы платформенные из нержавеющей стали 1000х1000х90 (4 датчика), двухинтервальные 300/600 кг. Дискретность индикации 0,1/0,2 кг. К весам подходят Пандусы р9295, р9296, рама р9058', '/exchange/images/00-00011086.jpg', '267267', 0),
(94, 'М2604', 3, '2839', 'Модуль дискретного ввода-вывода. 8 входов и 8 выходов с отпторазвязкой. Кожух  арт.2030-использовать!', '/exchange/images/00-00010980.png', '10833', 2),
(95, 'М2606', 3, '3658', 'Модуль дискретного ввода-вывода. 8 входов и 8 выходов с отпторазвязкой. Программируемый.', '/exchange/images/00-00010982.jpg', '13061', 0),
(96, 'Весы автомобильные М8200Б-80-20-М06-НМ9В-002-К', 17, 'р14409', '', '/exchange/images/00-00010675.jpg', '2759704', 0),
(97, 'Весы автомобильные М8200Б-40-12-М06-НМ9В-001-К', 17, 'р14393', '', '/exchange/images/00-00010667.jpg', '1373258', 0),
(98, 'Весы вагонные М8300-С-60-М06-740-1-К-Р_ _ (4)', 23, 'р13579', 'Весы для потележечного взвешивания в статике. Без рельсов. 4 датчика M.740 30T  производства UTILCELL.', '/assets/default/img/no-image.jpg', '830169', 0),
(99, 'М0600-Б', 3, '14697', 'Прибор для багажных весов разрабатывается по договору для фирмы LAS-1', '/exchange/images/00-00011109.png', '40908', 8),
(100, 'Рамка для прибора в шкаф (М0601ШУ )', 3, '9448', 'Рамка лицевая для встройки в шкафы управления 0600К, Д, 0601Б', '/assets/default/img/no-image.jpg', '3326', 8),
(101, 'Весы автомобильные М8200Б-60-08-ПК-HM9B-001-К', 17, 'р14501', '', '/exchange/images/00-00010725.jpg', '1220976', 0),
(102, 'ПРОФИ 600/1500 (1500Х2000мм) М8101-0,6/1,5-АН4Н', 28, 'р09013', 'Весы платформенные 1500х2000х90 (4 датчика), двухдиапазонные 600/1500 кг. Дискретность индикации 02/0,5 Кг. К весам подходят Пандусы р9299, р9138, рама р9064', '/exchange/images/00-00011098.jpg', '363244', 0),
(103, 'НПКМ 406.042-01 Прибор весоизмерительный М0601-БМ-4-П-W', 3, '34429', '', '/assets/default/img/no-image.jpg', '41435', 0),
(104, 'Весы автомобильные М8200Б-60-16-ПК-HM9B-002-К', 17, 'р14510', '', '/exchange/images/00-00010734.jpg', '2336199', 0),
(105, 'ПРОФИ 600/1500 (1000х1200мм) М8101-0,6/1,5-АН1Н', 28, 'р09004', 'Весы платформенные из нержавеющей стали 1000х1200х90 (4 датчика), двухдиапазонные 600/1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят Пандусы р9295, р9296, рама р9059', '/exchange/images/00-00011089.jpg', '285330', 0),
(106, 'М6202', 11, '17512', 'Шкаф для установки прибора рядом с весами.  В составе шкафа нет БМ и грозы, устанавливается в шкаф из весов.', '/assets/default/img/no-image.jpg', '105530', 0),
(107, 'Шкаф управления М6205', 11, 'р07619', 'Для авто- и вагонных весов с применением Moxa', '/assets/default/img/no-image.jpg', '188225', 0),
(108, 'Весы автомобильные ТРЭК М8200Б-30/40-08-М06-H8C-10T-1000-БФ (НПКМ 482.044)', 18, 'р15544', 'Рабочее наименование старое: Весы автомобильные ТРЭК М8200Б-30/40-08-М06-H8C-10T-024-БФ. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-10T ZEMIC.  Длина платформ 8000 мм ширина 1000 мм.', '/exchange/images/00-00010849.png', '761381', 0),
(109, 'ПРОФИ 600/1500 (1200х1200мм) М8101-0,6/1,5-АН2Н', 28, 'р09008', 'Весы палтформенные из нержавеющей стали1200х1200х90 (4 датчика), двухдиапазонные 600х1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят пандусы р9297, р9298, рама р9061', '/exchange/images/00-00011093.jpg', '296193', 0),
(110, 'Весы автомобильные М8200Б-80-18-ПК-HM9B-002-К', 17, 'р14507', '', '/exchange/images/00-00010731.jpg', '2485616', 0),
(111, 'Гарант 30/60 (М8000-30/60-1-НН2Н)', 25, 'р08498', 'Платформа из нержавеющей стали. Размер 350х450. Тензодатчик из нержавеющей стали М5064-100 кг', '/exchange/images/00-00011063.jpg', '77142', 0),
(112, 'Весы автомобильные М8200Б-80-24-М06-НМ9В-001-К', 17, 'р14413', '', '/exchange/images/00-00010677.jpg', '2911851', 0),
(113, 'Оптимум 100-24 (М8200Б-60/100-24-М06-V-016)', 20, '11082', 'НПВ 100т d=20кг, допустимая нагрузка на ось 12 т. ГПУ 24000х3200мм над поверхностью земли с пандусами. Датчики DLB-40 Klb. Схема установки датчиков 2-4-2-2.', '/assets/default/img/no-image.jpg', '4781207', 0),
(114, 'Весы автомобильные М8200Б-80-16-ПК-HM9B-003-К', 17, 'р14509', '', '/exchange/images/00-00010733.jpg', '2389964', 0),
(115, 'М5064-200 кг', 35, '3118', '200кг, 2мВ/В, 0.02%, -10-+40С, 350±30Ом, IP65, Нерж., 3м,', '/exchange/images/00-00011136.jpg', '23049', 5),
(116, 'М8100-10ТК9C-5-С(1780)', 31, '1393', 'НПВ10000кг d= 5кг, р/п. 1700х8000, 4 датчика 65023C-10000 lb-3107. Узлы встройки с пружинными шайбами.', '/exchange/images/00-00028522.jpg', '729327', 0),
(117, 'КЛАССИК 1000 (1500х1500мм)  М8100-1-АК3С', 27, 'р08857', 'Весы платформенные 1500х1500х90 (4 датчика), однодиапазонные 1000 кг. Дискретность индикации 0,5 Кг. К весам подходят пандусы  р9681, р9685, рама р9063', '/exchange/images/00-00011079.jpg', '133213', 0),
(118, 'КЛАССИК 1000 (1500х2000мм)  М8100-1-АК4С', 27, 'р08860', 'Весы платформенные 1500х2000х90 (4 датчика), однодиапазонные 1000 кг. Дискретность индикации 0,5 Кг. К весам подходят пандусы  р9681, р9685, рама р9064', '/exchange/images/00-00011082.jpg', '139781', 0),
(119, 'М8400-2-1-160-001', 8, '14602', 'Ширина ленты: 400-500 мм. 4 датчика Z6FC3-50 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 160кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011113.png', '520606', 0),
(120, 'М8400-2-7-630-001', 8, '13563', 'Ширина ленты: 1400-1600 мм. 4 датчика Z6FC3-200 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 630кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011194.jpg', '520606', 0),
(121, 'Моно 300/600Н(60/800)', 7, '18286', 'НОС-750 кг 1 датч. Труба. Нерж. (D=60, L=800) мм.', '/exchange/images/00-00010914.jpg', '163447', 0),
(122, 'Микросим М0601-БМ-2.1-К ', 3, 'р11879', '', '/exchange/images/00-00000023.png', '49234', 13),
(123, 'ПРОФИ 1000 (1200х1500мм) М8101-1-АН11Н', 28, 'р09009', 'Весы палтформенные из нержавеющей стали 1200х1500х90 (4 датчика), однодиапазонные 1000 кг. Дискретность индикации 0,5 Кг. К весам подходят Пандусы р9297, р9298, рама р9062', '/exchange/images/00-00011094.jpg', '307781', 0),
(124, 'Рамка для встраивания дублирующей платы индикации LAS', 3, 'р05924', '', '/assets/default/img/no-image.jpg', '19105', 0),
(125, 'Весы автомобильные М8200Б-40-12-ПК-HM9B-001-К', 17, 'р14513', '', '/exchange/images/00-00010737.jpg', '1487171', 0),
(126, 'Весы автомобильные М8200Б-80-24-ПК-HM9B-001-К', 17, 'р14502', '', '/exchange/images/00-00010726.jpg', '3053253', 0),
(127, 'Весы автомобильные М8200Б-80-16-М06-НМ9В-003-К', 17, 'р14401', '', '/exchange/images/00-00010671.jpg', '2276052', 0),
(128, 'Весы автомобильные М8200Б-100-18-ПК-HM9B-003-К', 17, 'р14506', '', '/exchange/images/00-00010730.jpg', '2799372', 0),
(129, 'ПРОФИ 600/1500 (1000х1000мм) М8101-0,6/1,5-АН0Н', 28, 'р09002', 'Весы платформенные из нержавеющей стали1000х1000х90 (4 датчика), двухдиапазонные 600/1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят Пандусы р9295, р9296, рама р9058', '/exchange/images/00-00011087.jpg', '275375', 0),
(130, 'М0803-ПК-2', 3, '15457', 'Плата прибора М0803', '/assets/default/img/no-image.jpg', '23214', 0),
(131, 'Титан 3000/5000 (М8100-5ТК5С-12-БМ)', 31, '17665', 'Крашеные  №5 (2000х2000), на подвесках со стальными тензодатчиками. НПВ=5т', '/exchange/images/00-00011128.jpg', '422141', 0),
(132, 'КЛАССИК 2000 (1500х1500мм) М8100-2-АК3С', 27, 'р08858', 'Весы платформенные 1500х1500х90 (4 датчика), однодиапазонные 2000 кг. Дискретность индикации 1 Кг. К весам подходят пандусы  р9681, р9685, рама р9063', '/exchange/images/00-00011080.jpg', '134309', 0),
(133, 'КЛАССИК 1500/3000 (1500х1500мм) М8100-1,5/3-АК3С', 27, 'р08859', 'Весы платформенные 1500х1500х90 (4 датчика), двухинтервальные 1500/3000 кг. Дискретность индикации 0,5/1 Кг. К весам подходят пандусы  р9681, р9685, рама р9063', '/exchange/images/00-00011081.jpg', '134124', 0),
(134, 'М8400-2-5-63-001', 8, '16755', 'Ширина ленты: 1000-1200 мм. 4 датчика Z6FC3-20 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 63кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011336.jpg', '495803', 0),
(135, 'Коробка соединительная М4805-5А-05', 14, '16321', 'В корпусе G120. С грозозащитой на 4 (четыре) датчика. 4 входа (кабели 4-WS, d=4…7,6 мм) , 2 выхода (кабель 6-WS, d=4…7,6 мм).', '/exchange/images/00-00011311.jpg', '16442', 2),
(136, 'Гарант 150/300 (М8000-150/300-1-НН6Н)', 25, 'р09354', 'Платформа из нержавеющей стали. Размер 600х800. Тензодатчик из нержавеющей стали Utilcell M.190i 400kg', '/exchange/images/00-00011198.jpg', '134375', 0),
(137, 'Весы вагонные М8300-СД-150-ПК-740DMET-1-K-Р65', 24, 'р13594', 'Весы для потележечного  взвешивания в статике ( в 2 такта) и движении.  В комплекте с рельсами Р65.  4 датчика M.740 DMET 30T производства МЕТРА (UTILCELL)', '/assets/default/img/no-image.jpg', '1116011', 0),
(138, 'Стандарт 30/60 (М8000-30/60-1-КН4А)', 26, 'р09717', 'ГПУ из конструкционной стали. Крышка из нержавеющей стали. 450х600мм. датчик Алюминиевый. LOC-100 СПЕЦНАСТРОЙКА прибора', '/exchange/images/00-00011172.jpg', '72003', 1),
(139, 'Весы автомобильные М8200Б-40-08-ПК-HM9B-002-К', 17, 'р14514', '', '/exchange/images/00-00010738.jpg', '1397918', 0),
(140, 'КЛАССИК 1500/3000 (1500х2000мм) М8100-1,5/3-АК4С', 27, 'р08862', 'Весы платформенные 1500х2000х90 (4 датчика), двухинтервальные 1500/3000 кг. Дискретность индикации 0,5/1 Кг. К весам подходят пандусы  р9681, р9685, рама р9064', '/exchange/images/00-00011084.jpg', '141792', 0),
(141, 'КЛАССИК 600/1500 (1000х1200мм)  М8100-0,6/1,5-АК1С', 27, 'р08851', 'Весы платформенные 1000х1200х90 (4 датчика), двухинтервальные 600/1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят пандусы  р9662, р9668, рама р9059', '/exchange/images/00-00011073.jpg', '121168', 0),
(142, 'Коробка соединительная М4805-8А-03', 14, '15179', 'Коробка суммирующая 8-ми входовая с элементами грозозащиты, металлич. гермовводы, IP65', '/exchange/images/00-00011192.jpg', '18934', 5),
(143, 'М5064-100 кг', 35, '2837', '100кг, 2мВ/В, 0.02%, -10-+40С, 350±30Ом, IP65, Нерж., 3м,', '/exchange/images/00-00011135.jpg', '20264', 21),
(144, 'Оптимум 30/60-18-К (М8200Б-30/60-18-М06-V-012-К)', 20, '15906', 'НПВ 60т d=20кг, допустимая нагрузка на ось 10 т. ГПУ 18000х3000мм в котлован. Датчики DLB-40 Klb. Схема установки датчиков 2-4-2.', '/assets/default/img/no-image.jpg', '3775657', 0),
(145, 'Моно2 300/600Н(700)', 7, '14191', 'Весы нержавеющие на 2-х тензодатчиках  М5023-550 кгдля взвешивания продукции массой до 600 кг на монорельсе. Встраиваются в существующий (штатный) монорельс.Прибор М0601-БМ.', '/exchange/images/00-00011355.png', '160090', 0),
(146, 'Прибор весоизмерительный цифровой М1001-Е-1-К', 3, 'р12942', '', '/assets/default/img/no-image.jpg', '155580', 0),
(147, 'Абсолют цифровые 60/100-24 (М8200А-60/100-0-1-24-010)', 19, 'р10205', 'Двухдиапазонные цифровые 60/100т. Длина 24 м. Установка с пандусом. 10 тензодатчиков С16-30т.Тензопреобразователи цифровые М0808-E-01 (4х и 6и-канальный). Компьютер.', '/assets/default/img/no-image.jpg', '4976810', 0),
(148, 'Весы электронные конвейерные М8400-3-63-001 (НПКМ 484.103 -07)', 8, '16730', '', '/exchange/images/00-00011335.jpg', '491672', 0),
(149, 'Оптимум 60/80-18 (М8200Б-60/80-18-М06-V-014)', 20, '12257', 'НПВ 80т d=20кг, допустимая нагрузка на ось 12 т. ГПУ 18000х3200мм над поверхностью земли с пандусами. Датчики DLB-40 Klb. Схема установки датчиков 2-4-2.', '/assets/default/img/no-image.jpg', '3337359', 0),
(150, 'Весы вагонные М8300-С-150-ПК-740DMET-2-K-Р_ _ (5-x-5)', 24, '36690', 'Весы для повагонного взвешивания в статике. В комплекте без рельсов и креплений. 8 датчиков M.740 DMET 30T  производства МЕТРА (UTILCELL)', '/assets/default/img/no-image.jpg', '1813829', 0),
(151, 'Весы вагонные М8300-С-150-М06-C16A-2-К-Р_ _ (4-x-4)', 23, 'р13585', 'Весы для повагонного взвешивания в статике. Без рельсов.  8 датчиков C16AC3-30t производства HBM.', '/assets/default/img/no-image.jpg', '1896115', 0),
(152, 'Весы автомобильные М8200Б-60-08-М06-НМ9В-001-К', 17, 'р14389', '', '/exchange/images/00-00010665.jpg', '1107063', 0),
(153, 'Коробка соединительная М4809-4НА-01', 14, 'р10158', 'С элементами грозозащиты. Корпус из нерж. стали IP67. Кабельные вводы под гофрорукав 16мм. Многооборотные переменные резисторы для подстройки датчиков.', '/exchange/images/00-00010956.jpg', '16758', 8),
(154, 'Пандус М4814-10 Длина 1090 мм ширина 1000 мм', 18, 'р15178', 'Пандус для ТРЭК шириной 1000мм высота пандуса 224 мм длина 1090мм  Для въезда с одной стороны нужно 2 пандуса. Для въезда и съезда нужно 4 пандуса.', '/exchange/images/00-00010828.png', '18470', 0),
(155, 'Микросим М0808-01-035', 3, '17161', 'Прежнее название М0803-5. Установка на DIN рейку. 8 дискретных Входов 6 выходов.', '/exchange/images/00-00011332.jpg', '21832', 1),
(156, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-04.01', 3, 'р14848', 'Для конвейерных весов, ленточных дозаторов непрерывного действия, блок сопряжения М2606, RS-485, MS-bus токовый выход 4-20 мА', '/assets/default/img/no-image.jpg', '57766', 0),
(157, 'Моно2 300/600 Н(60/1000)', 7, '18097', 'Для взвешивания мясных туш в колбасных цехах массой до 600 кг. Встраиваются в штатный монорельс конвейера.', '/exchange/images/00-00011126.jpg', '174741', 0),
(158, 'ПРОФИ 600/1500 (1500х1500мм) М8101-0,6/1,5-АН3Н', 28, 'р09011', 'Весы палтформенные из нержавеющей стали1500х1500х90 (4 датчика), двухдиапазонные 600х1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят Пандусы р9299, р9138, рама р9063', '/exchange/images/00-00011096.jpg', '331828', 0),
(159, 'Моно 300/600 (48/600)', 7, '18280', '1 датч. НОС-750 кг Труба. Краш. (D=48, L=600) мм.', '/exchange/images/00-00010909.jpg', '116687', 0),
(160, 'Весы автомобильные М8200Б-60-12-М06-НМ9В-002-К', 17, 'р14395', '', '/exchange/images/00-00010668.jpg', '1674212', 0),
(161, 'Весы автомобильные М8200Б-100-24-М06-НМ9В-002-К', 17, 'р14415', '', '/exchange/images/00-00010678.jpg', '3294476', 0),
(164, 'Коробка соединительная М4807-4ПА-01', 14, 'р09229', 'Клемная коробка для платформенных весов в пластиковом корпусе с многооборотными переменными подстроечными резисторами. 4 кабельных ввода для подключения датчиков + 1 выход кабеля к прибору.', '/exchange/images/00-00011285.jpg', '4508', 14),
(165, 'Моно 300/600 (60/800)', 7, '18284', 'НОС-750 кг', '/exchange/images/00-00010912.jpg', '114774', 0),
(166, 'Весы платформенные М8100-1,5/3-ВК9Н (900х900)', 31, 'р15933', '!!! В составе весов шкаф, внутри которого 1- портовый шлюз Modbus в PROFIBUS Slave. Платформенные весы типа \"ТИТАН\" в противоударном исполнении. Узлы встройки подвески с пружинными шайбами. Габариты платформы 900х900 мм высота 202 мм', '/exchange/images/00-00010873.jpg', '347513', 0),
(167, 'Микросим М0808-04-100', 3, 'р10150', 'Прежнее название Микросим М0808-04. В корпусе из нержавеющей стали. Металлические кабельные вводы. 4 датчика подключаются по 6 проводной схеме, каждый к отдельному тензоканалу. Питание 10-30 В и RS485 вводятся в корпус одним кабелем. Предусмотрены клеммы и кабельный ввод для подключения следующего прибора в «Цепочку».', '/exchange/images/00-00010955.jpg', '72182', 4),
(168, 'Моно 300/600 (48/800)', 7, '18281', 'НОС-750 кг', '/exchange/images/00-00010910.jpg', '119470', 0),
(169, 'Моно2 1000Н(700)', 7, '18257', 'Весы нержавеющие на 2-х тензодатчиках М5023-750 кг (А-модификация) для взвешивания продукции массой до 600 кг на монорельсе. Встраиваются в существующий (штатный) монорельс.Прибор М0601-БМ.', '/exchange/images/00-00010904.jpg', '190453', 0),
(170, 'Прибор весоизмерительный М0601-Б-3.1 В комплекте с герметичным кожухом', 3, 'р11939', 'В комплекте с герметичным кожухом.Под кожухом на задней панели прибора все соединения на клеммниках под отвёртку.', '/exchange/images/00-00011225.jpg', '49234', 3),
(171, 'Микросим М0401-2', 3, 'р06597', '', '/exchange/images/00-00010392.jpg', '75456', 6),
(172, 'Коробка соединительная М4806-2ПД-01 (НПКМ 448.246)', 14, '34760', 'Пластиковая цифровая коробка для подключения 2х цифровых датчиков M740DMET. Датчики подключаются на клеммниках под отвёртку.', '/exchange/images/00-00034760.jpg', '5613', 2),
(173, 'Пандус М4814-075 Длина 1090 мм ширина 750мм', 18, 'р11634', 'Пандус для весов ТРЭК с НПВ 30 и 40тонн. с платформами шириной 800мм. Высота пандуса 224мм. Длина 1090 ширина 750мм Для въезда с одной стороны нужно 2 пандуса. Для въезда и съезда нужно 4 пандуса.', '/exchange/images/00-00010944.png', '14141', 0),
(174, 'Коробка соединительная М4806-02АД', 14, 'р07942', 'Для подключения  2 цифровых датчиков. [2 входа датчики (Розетка LTW 5-pin), 1 вход соеденение (Розетка LTW 5-pin),  1 выход соединение (Вилка LTW 5-pin)]', '/exchange/images/00-00011325.jpg', '10161', 3),
(175, 'Модуль tDS-735', 3, 'б09470', 'Производитель: ICP DAS. COM портов RS-485: 3 Максимальная скорость COM-портов RS-485:	115200 Бит/с Портов PoE 10/100 Mbit/s 1. Входное напряжение питания DC:	12 ... 48 ВПроизводитель: ICP DAS. COM портов RS-485: 3 Максимальная скорость COM-портов RS-485:	115200 Бит/с Портов PoE 10/100 Mbit/s 1. Входное напряжение питания DC:	12 ... 48 В', '/exchange/images/00-00000536.jpg', '14121', 0),
(176, 'Микросим М0808-06-101', 3, 'р10261', 'Прежнее названиеМикросим М0808-06. В корпусе из нержавеющей стали. Металлические кабельные вводы. 6 датчиков подключаются по 6 проводной схеме, каждый к отдельному тензоканалу. Питание 10-30 В и RS485 вводятся в корпус одним кабелем.', '/exchange/images/00-00011312.jpg', '103123', 4),
(177, 'Прибор весоизмерительный М0601-БМ-4-П (НПКМ 406.042) ', 3, '32930', 'ВНИМАНИЕ! У прибора 2 порта RS485. Для подключения к компьютеру по USB использовать: Преобразователь интерфейсов RS485 в USB (НПКМ 443.016 СБ)  арт. 38031,  Прибор предназначен для установки в помещении. По разъёму тензоканала совместим с Микросим М0601_БМ-1.2. Для крепления на стену использовать: Комплект для крепления прибора в пластиковом корпусе (НПКМ 906.001) арт. 36692', '/exchange/images/00-00032930.jpg', '39961', 16),
(178, 'Моно 300/600 (60/600)', 7, '18282', 'НОС-750 кг', '/exchange/images/00-00010911.jpg', '116687', 0),
(179, 'КЛАССИК 300/600 (1200х1200мм) М8100-0,3/0,6-АК2С', 27, 'р08854', 'Весы платформенные 1200х1200х90 (4 датчика), двухинтервальные 300/600 кг. Дискретность индикации 0,1/0,2 Кг. К весам подходят пандусы  р9675, р9679, рама р9061', '/exchange/images/00-00011076.jpg', '121534', 0),
(180, 'Весы автомобильные ТРЭК М8200Б-30/40-09-М06-H8C-10T-800-БФ (НПКМ 482.024-03)', 18, 'р12366', 'Рабочее наименование старое: Весы автомобильные ТРЭК М8200Б-30/40-09-М06-Z-024-БФ. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-10T ZEMIC.  Длина платформ 9000 м ширина 800 мм.', '/exchange/images/00-00010926.png', '740799', 0),
(181, 'Шкаф управления М6508', 11, 'р12460', 'Шкаф для ВМЗ с контроллерами S7-1500', '/assets/default/img/no-image.jpg', '616410', 0),
(182, 'Моно 600/1500', 7, '18265', 'НОС-2t 1 датч. Крашенные. Плоск.Грузоподъемность до 1500 кг. Встраиваются в штатный монорельс конвейера.', '/exchange/images/00-00010906.png', '117078', 0),
(183, 'Оптимум 30/60-16-К (М8200Б-30/60-16-М06V-015-К)', 20, '2696', 'НПВ 60т d=20кг, допустимая нагрузка на ось 10 т. Допустимая нагрузка на одну секцию 25т. ГПУ 16000х3000мм в котлован. Датчики DLB-40 Klb. Схема установки датчиков 2-4. ВНИМАНИЕ Узел встройки заменен на правельный (в бумажной спецификации указан неверный узел втройки)', '/assets/default/img/no-image.jpg', '2688745', 0),
(184, 'М8400-2-3-160-001', 8, '14382', 'Ширина ленты: 600-800 мм. 4 датчика Z6FC3-50 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 160кг.В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011238.jpg', '520606', 0),
(185, 'Датчик М5023-Ni-550кг-3м', 39, 'р14564', '', '/exchange/images/00-00010776.jpg', '18604', 2),
(186, 'Весы вагонные М8300-С-60-М06-HM14H-1-К-Р_ _ (4)', 23, 'р13581', 'Весы для потележечного  взвешивания в статике. Состоят из одной секции длиной 4м. Без рельсов.  4 Тензодатчика Zemic HM14H1-30t', '/exchange/images/00-00010512.png', '853736', 0),
(187, 'Датчик М5023-Ni-1100кг-3м', 39, 'р14568', '', '/exchange/images/00-00010778.jpg', '18604', 6),
(188, 'Весы вагонные М8300-С-150-M06-740-2-K-Р65 (4-x-4)', 23, 'р13586', 'Весы для повагонного взвешивания в статике. В комплекте с рельсами Р65. 8 датчиков M.740 30T производства UTILCELL.', '/assets/default/img/no-image.jpg', '1949706', 0),
(189, 'Моно2 300/600(60/1000)', 7, '18220', 'Для взвешивания мясных туш в колбасных цехах массой до 600 кг. Встраиваются в штатный монорельс конвейера. Оцинкованные. Круглый путь.', '/exchange/images/00-00010903.jpg', '156932', 0),
(190, 'Оптимум 60/80-18-К (М8200Б-60/80-18-М06-V-014-К)', 20, '12317', 'НПВ 80т d=20кг, допустимая нагрузка на ось 12 т. ГПУ 18000х3200мм в котлован. Датчики DLB-40 Klb. Схема установки датчиков 2-4-2.', '/assets/default/img/no-image.jpg', '3935436', 0),
(191, 'Весы вагонные М8300-С-60-М06-HM14H-1-К-Р65 (4)', 23, 'р13580', 'Весы для потележечного  взвешивания в статике.  В комплекте с рельсами Р65.  4 датчика HM14C-C3-30t-13B6-D05 производства ZEMIC', '/exchange/images/00-00010510.png', '1088452', 0),
(192, 'Моно 300/600Н', 7, '18266', 'НОС-750 кг 1 датч. Нержавеющие. Плоск.Грузоподъемность до 600 кг. Встраиваются в штатный монорельс конвейера.', '/exchange/images/00-00010907.png', '165164', 0),
(193, 'Коробка соединительная М4805-4А-04', 14, 'р06933', '', '/assets/default/img/no-image.jpg', '10161', 0),
(194, 'Весы автомобильные ТРЭК М8200Б-30/40-07-М06-Н8С-10Т-800-БФ (НПКМ 482.024-01)', 18, 'р12354', 'Рабочее наименование старое: Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-10T ZEMIC.  Длина платформ 7000 мм ширина 800 мм.', '/exchange/images/00-00010924.png', '663134', 0),
(195, 'Микросим М0808-01-020', 3, '16373', 'Прежнее название М0802. В корпусе G120. С грозозащитой на 4  датчика  (кабели  d=4…7,6 мм) , 2 выхода RS485 (кабель  d=4…7,6 мм).', '/assets/default/img/no-image.jpg', '28679', 11),
(196, 'Моно 300/600Н (60/600)', 7, '18285', 'НОС-750 кг 1 датч. Труба. Нерж. (D=60, L=600) мм.', '/exchange/images/00-00010913.jpg', '163447', 0),
(197, 'Микросим-06А (М0600-С6-4)', 3, 'П6296', 'Прошивка для поосного взвешивания вагонов и вагонеток в движении', '/assets/default/img/no-image.jpg', '58269', 0),
(198, 'ПРОФИ 300/600 (1000х1200мм) М8101-0,3/0,6-АН1Н', 28, 'р09003', 'Весы платформенные из нержавеющей стали 1000х1200х90 (4 датчика), двухдиапазонные 300/600 кг. Дискретность индикации 0,1/0,2 Кг. К весам подходят Пандусы р9295, р9296, рама р9059', '/exchange/images/00-00011088.jpg', '275857', 0),
(199, 'Модуль М2109 (НПКМ 421.010) Концентратор RS485', 3, 'р08448', 'Преобразователь-концентратор RS232/RS485 (М2109),', '/exchange/images/00-00011057.jpg', '11177', 6),
(200, 'Весы автомобильные ТРЭК М8200Б-30/40-06-М06-Н8С-10Т-800-БФ (НПКМ 482.024)', 18, 'р12334', 'Рабочее наименование старое: Весы автомобильные ТРЭК М8200Б-30/40-06-М06-Z-024-БФ. Весы ТРЭК из 2х платформ. В весах 12 датчиков H8C-C3-10T ZEMIC.  Длина платформ 6000 мм ширина 800 мм.', '/exchange/images/00-00010920.png', '631678', 0),
(201, 'Весы автомобильные ТРЭК М8200Б-15/30-05-М06-H8C-5T-800-БФ (НПКМ 482.008-01)', 18, 'р11596', 'Рабочее наименование старое: ТРЭК М8200Б-15/30-05-М06-Z-008-БФ. Весы ТРЭК из 2х платформ. В весах 8 датчиков H8C-C3-5T ZEMIC.  Длина платформ 5000 мм ширина 800 мм.', '/exchange/images/00-00010939.png', '489092', 0),
(202, 'Весы автомобильные ТРЭК М8200Б-15/30-06-М06-H8C-5T-800-БФ (НПКМ 482.008-02)', 18, 'р11597', 'Рабочее наименование старое: ТРЭК М8200Б-15/30-06-М06-Z-008-БФ. Весы ТРЭК из 2х платформ. В весах 8 датчиков H8C-C3-5T ZEMIC.  Длина платформ 6100 мм ширина 800 мм.', '/exchange/images/00-00010940.jpg', '532673', 0),
(203, 'Весы монорельсовые М8700-1-0,6НА(60/500)', 7, 'р14816', 'На 1 тензодатчике. Монорельс в виде трубы диаметром 60мм длиной 500мм', '/exchange/images/00-00010786.jpg', '117087', 0),
(204, 'Весы монорельсовые М8700-1-0,6КА(60/800)', 7, 'р14817', 'На 1 тензодатчике монорельс в виде трубы диаметром 60мм диной 800 мм', '/exchange/images/00-00010787.jpg', '108254', 0),
(205, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-00.01', 3, 'р12592', 'Для конвейерных весов и ленточных дозаторов непрерывного действия, RS-485, MS-bus токовый выход 4-20 мА, без модуля сопряжения.', '/exchange/images/00-00010396.jpg', '46746', 5),
(206, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-04.00', 3, 'р14850', 'Для конвейерных весов, ленточных дозаторов непрерывного действия, блок сопряжения М2606, RS-485, MS-bus токовый выход 0-5 мА', '/assets/default/img/no-image.jpg', '57766', 0),
(207, 'М8400-2-5-320-001', 8, '14334', 'Ширина ленты: 1000-1200 мм. 4 датчика Z6FC3-100 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 320кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00011236.png', '520606', 0),
(208, 'ПРОФИ 1500/3000 (1500х1500мм) М8101-1,5/3-АН3Н', 28, 'р09012', 'Весы платформенные из нержавеющей стали 1500х1500х90 (4 датчика), двухдиапазонные 1500/3000 кг. Дискретность индикации 0,5/1 Кг. К весам подходят Пандусы р9299, р9138, рама р9063', '/exchange/images/00-00011097.jpg', '329397', 0),
(209, 'Стандарт 150/300 (М8000-150/300-1-КН6А)', 26, 'р10024', 'ГПУ из конструкционной стали. Крышка из нержавеющей стали.размер платформы 500х800. датчик Алюминиевый. LOC-500', '/exchange/images/00-00010952.jpg', '80460', 0),
(210, 'Кожух М0601-Б-3', 3, 'б10085', 'НПКМ 406.034', '/assets/default/img/no-image.jpg', '9572', 0),
(211, 'Коробка соединительная М4807-6ПА-01', 14, 'р11706', '', '/exchange/images/00-00011222.jpg', '8622', 19),
(212, 'Весы вагонные М8300-С-150-М06-C16A-2-К-Р65 (4-x-4)', 23, 'р13584', 'Весы для повагонного взвешивания в статике.  В комплекте с рельсами Р65.  8 датчиков C16AC3-30t производства HBM.', '/assets/default/img/no-image.jpg', '2244980', 0),
(213, 'М8400-2-3-320-001', 8, '14381', 'Ширина ленты: 600-800 мм. 4 датчика Z6FC3-100 kg. Наибольшая предельно-допустимая нагрузка на ГПУ 320кг. В комплект поставки входит шкаф М6403.', '/exchange/images/00-00010398.png', '520606', 0),
(214, 'Шкаф управления М6035-Э (НПКМ 460.044)', 11, '33794', '', '/assets/default/img/no-image.jpg', '371131', 0),
(215, 'Оптимум цифровые  60/100-24 (М8200Б-60/100-24-М08-V-016)', 20, 'р10206', 'Двухдиапазонные цифровые 60/100т. Длина 24 м. Установка с пандусом. 10 тензодатчиков DLB-40Rlb.Тензопреобразователи цифровые М0808-E-01 (4х и 6и-канальный). Компьютер.', '/assets/default/img/no-image.jpg', '4612517', 0),
(216, 'Гарант 60/150 (М8000-60/150-1-НН4Н)', 25, 'р09353', 'Платформа из нержавеющей стали. Размер 450х600. Тензодатчик из нержавеющей стали М5064-200 кг', '/exchange/images/00-00011197.jpg', '89583', 0),
(217, 'Весы автомобильные М8200Б-100-18-М06-НМ9В-003-К', 17, 'р14407', '', '/exchange/images/00-00010674.jpg', '2739620', 0),
(218, 'Весы автомобильные ТРЭК М8200Б-15/30-04-М06-H8C-5T-800-БФ (НПКМ 482.008)', 18, 'р11595', 'Рабочее наименование старое: ТРЭК М8200Б-15/30-04-М06-Z-008-БФ. Весы ТРЭК из 2х платформ. В весах 8 датчиков H8C-C3-5T ZEMIC.  Длина платформ 4100 мм ширина 800 мм.', '/exchange/images/00-00010938.png', '443329', 0),
(219, 'КЛАССИК 300/600 (1000х1000мм) М8100-0,3/0,6-АК0С', 27, 'р08848', 'Весы платформенные 1000х1000х90 (4 датчика), двухинтервальные 300/600 кг. Дискретность индикации 0,1/0,2 кг. К весам подходят пандусы  р9662, р9668, рама р9058', '/exchange/images/00-00011070.jpg', '117152', 1),
(220, 'КЛАССИК 300/600 (1000х1500мм)  М8100-0,3/0,6-АК10С', 27, 'р08852', 'Весы платформенные 1000х1500х90 (4 датчика), двухинтервальные 300/600 кг. К весам подходят пандусы  р9662, р9668, рама р9060', '/exchange/images/00-00011074.jpg', '122443', 0),
(221, 'КЛАССИК 600/1500 (1000х1500мм)  М8100-0,6/1,5-АК10С', 27, 'р08853', 'Весы платформенные 1000х1500х90 (4 датчика), двухинтервальные 600/1500 кг. Дискретность индикации 0,2/0,5 Кг. К весам подходят пандусы  р9662, р9668, рама р9060', '/exchange/images/00-00011075.jpg', '123910', 0),
(222, 'М62109-24в', 3, 'р08482', 'Комплект поставки:  Преобразователь-концентратор RS232/RS485 (М2109), блок питания 24в., кабель USB для подключения к компьютеру.', '/exchange/images/00-00011061.png', '14275', 2),
(223, 'Весы вагонные М8300-С-60-М06-C16A-1-К-Р65 (4)', 23, 'р13576', 'Весы для потележечного  взвешивания в статике.  В комплекте с рельсами Р65.  4 датчика C16AC3-30t производства HBM', '/assets/default/img/no-image.jpg', '1154537', 0),
(224, 'Прибор весоизмерительный конвейерный Микросим М0600-КМ-6-00.02', 3, 'р12994', 'Для конвейерных весов и ленточных дозаторов непрерывного действия, RS-485, MS-bus токовый выход 0-20 мА, без модуля сопряжения.', '/exchange/images/00-00010449.jpg', '44196', 0),
(225, 'ПРОФИ 2000 (1200х1500мм) М8101-2-АН11Н', 28, 'р09010', 'Весы платформенные из нержавеющей стали1200х1500х90 (4 датчика), однодиапазонные 2000 кг. К весам подходят Пандусы р9297, р9298, рама р9062', '/exchange/images/00-00011095.jpg', '303383', 0),
(226, 'Коробка соединительная М4809-6НА-01', 14, 'р10267', '', '/exchange/images/00-00011313.jpg', '18041', 7),
(227, 'Весы автомобильные М8200Б-100-24-ПК-HM9B-002-К', 17, 'р14503', '', '/exchange/images/00-00010727.jpg', '3365032', 0),
(228, 'Весы вагонные М8300-С-60-М06-НМ14Н-1-БФ-Р_ _', 40, '34948', 'Весы вагонные бесфундаментные, с ГПУ производства Метра.', '/exchange/images/00-00034948.jpg', '1012209', 0),
(229, 'Весы вагонные М8300-С-150-М06-НМ14Н-2-БФ-Р_ _', 40, 'б11028', 'Весы вагонные бесфундаментные, с ГПУ производства Метра.', '/exchange/images/00-00028938.jpg', '1941390', 0),
(230, 'Весы вагонные М8300-СД-150-ПК-740DMET-2-БФ-Р_ _', 40, '33216', 'Весы вагонные бесфундаментные, C нашим ГПУ. Датчики 740DMET\nВесы вагонные НПКМ 483.017 с покупным ГПУ.\nВесы вагонные НПКМ 483.038 с ГПУ метра.', '/exchange/images/00-00033216.jpg', '2063490', 0),
(231, 'Весы вагонные М8300-СД-150-ПК-740DMET-1-БФ-Р_ _', 40, '33577', 'Весы вагонные бесфундаментные, с ГПУ (Метра). Датчики 740DMET', '/exchange/images/00-00033577.jpg', '1086690', 0),
(232, 'Весы вагонные М8300-СД-150-ПК-HM14H-1-БФ-Р_ _ (НПКМ 483.039)', 40, '36081', 'Весы вагонные бесфундаментные, Платформа производства Метра.', '/exchange/images/00-00036081.jpg', '1086690', 0),
(233, 'Весы вагонные М8300-СД-150-ПК-НМ14Н-2-БФ-Р_ _ (НПКМ 483.040)', 40, '36078', 'Весы вагонные бесфундаментные, Платформа производства Метра.', '/exchange/images/00-00036078.jpg', '2063490', 0),
(240, 'Настил-комплект (L=8 м) (Весы 2021) (НПКМ 448.241)', 42, '36216', 'Настил для весов модельного ряда 2021 длиной 8 метров', '/assets/default/img/no-image.jpg', '66432', 0);
INSERT INTO `products` (`id`, `name`, `category_id`, `sku`, `description`, `img`, `price`, `quantity`) VALUES
(241, 'Настил-комплект с Креплениями \"щеколда\" (L=20 м) (НПКМ 448.259-04)', 42, '36224', 'Настил-комплект с щеколдой для весов модельного ряда 2021 длиной 20 метров', '/assets/default/img/no-image.jpg', '70296', 0),
(242, 'Настил-комплект с Креплениями \"щеколда\" (L=8 м) (НПКМ 448.259)', 42, '36221', 'Настил-комплект с щеколдой для весов модельного ряда 2021 длиной 8 метров', '/assets/default/img/no-image.jpg', '28635', 0),
(243, 'Комплект металлических пандусов 4 метра', 44, '36487', 'Комплект состоит из 4-х четырехметровых пандусов. В комплект поставки пандусов входят клиновые анкеры М16 для крепления к бетонной плите основания', '/assets/default/img/no-image.jpg', '434615', 0),
(244, 'Весы автомобильные М8200Б-30/60-16-М06-НМ9В-027 (НПКМ 482.401-04)', 47, '35115', '6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 16 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '1644871', 0),
(245, 'Весы автомобильные М8200Б-30/60-12-М06-НМ9В-027 (НПКМ 482.401-02)', 47, '35113', '6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 12 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '1250467', 1),
(246, 'Настил-комплект (L=8 м) с монтажным креплением (Весы 2021) (НПКМ 448.260)', 42, '36824', 'Настил для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '37319', 0),
(247, 'Настил-комплект (L=24 м) с монтажным креплением (Весы 2021) (НПКМ 448.260-05)', 42, '36828', 'Настил для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '101851', 0),
(248, 'Весы автомобильные М8200Б-60/100-18-ПК-НМ9В-030 (НПКМ 482.404-08)', 48, '35131', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 2 шт. 8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 18 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '2097680', 0),
(249, 'Настил-комплект с Креплениями \"щеколда\" (L=18 м) (НПКМ 448.259-03)', 42, '36195', 'Настил-комплект с щеколдой для весов модельного ряда 2021 длиной 18 метров', '/assets/default/img/no-image.jpg', '62414', 0),
(250, 'Настил-комплект (L=16 м) (Весы 2021) (НПКМ 448.241-02)', 42, '36218', 'Настил для весов модельного ряда 2021 длиной 16 метров', '/assets/default/img/no-image.jpg', '128460', 0),
(251, 'Настил-комплект с Креплениями \"щеколда\" (L=12 м) (НПКМ 448.259-01)', 42, '36222', 'Настил-комплект с щеколдой для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '41661', 0),
(252, 'Настил-комплект с Креплениями \"щеколда\" (L=16 м) (НПКМ 448.259-02)', 42, '36223', 'Настил-комплект с щеколдой для весов модельного ряда 2021 длиной 16 метров', '/assets/default/img/no-image.jpg', '57271', 0),
(253, 'Настил-комплект (L=16 м) с монтажным креплением (Весы 2021) (НПКМ 448.260-02)', 42, '36825', 'Настил для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '74637', 0),
(254, 'Ограждение-комплект 12 м (НПКМ 448.243-01)', 43, '34651', '', '/assets/default/img/no-image.jpg', '77760', 1),
(255, 'Весы автомобильные М8200Б-60/100-24-ПК-НМ9В-027', 48, '35135', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 1 шт Микросим М0808-06 1 шт. 10 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 24 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '2374605', 0),
(256, 'Настил-комплект (L=20 м) с монтажным креплением (Весы 2021) (НПКМ 448.260-04)', 42, '36827', 'Настил для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '90970', 0),
(257, 'Настил-комплект с Креплениями \"щеколда\" (L=24 м) (НПКМ 448.259-05)', 42, '36225', 'Настил-комплект с щеколдой для весов модельного ряда 2021 длиной 24 метров', '/assets/default/img/no-image.jpg', '83322', 0),
(258, 'Комплект оснований для установки на плиты - 8 датчиков', 44, '32928', '', '/assets/default/img/no-image.jpg', '68852', 6),
(259, 'Весы автомобильные М8200Б-60/100-20-М06-НМ9В-030 (НПКМ 482.401-10)', 47, '35119', '8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 20 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '2258945', 0),
(260, 'Настил-комплект (L=24 м) (Весы 2021) (НПКМ 448.241-05)', 42, '36220', 'Настил для весов модельного ряда 2021 длиной 24 метров', '/assets/default/img/no-image.jpg', '182667', 0),
(261, 'Весы автомобильные М8200Б-30/40-12-ПК-НМ9В-024 (НПКМ 482.404-01)', 48, '35124', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-06 1 шт.6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 10 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 12м. 24 швеллер.', '/assets/default/img/no-image.jpg', '1147874', 0),
(262, 'Ограждение-комплект 8 м (4 м х 2) (НПКМ 448.243)', 43, '34650', '', '/assets/default/img/no-image.jpg', '65898', 0),
(263, 'Весы автомобильные М8200Б-30/60-18-ПК-НМ9В-024 (НПКМ 482.404-06)', 48, '35129', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 2 шт. 8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 10 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 18м. 24 швеллер.', '/assets/default/img/no-image.jpg', '1672308', 0),
(264, 'Весы автомобильные М8200Б-60/100-20-ПК-НМ9В-030 (НПКМ 482.404-10)', 48, '35133', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 2 шт. 8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 20 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '2297613', 0),
(265, 'Весы автомобильные М8200Б-60/80-24-ПК-НМ9В-024 (НПКМ 482.404-11)', 48, '35134', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 1 шт Микросим М0808-06 1 шт. 10 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 10 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 24м. 24 швеллер.', '/assets/default/img/no-image.jpg', '2154626', 0),
(266, 'Комплект \"Патриот\" для установки весов на 8 датчиках (АО ТОДЭП) (НПКМ 982.017)', 46, '36714', '', '/assets/default/img/no-image.jpg', '13065', 0),
(267, 'Комплект \"Патриот\" для установки весов на 6 датчиках (НПКМ 982.012)', 46, '35694', 'Комплект предназначен для установки автомобильных весов на 6 датчиках, модельного ряда 2021г на стационарный фундамент. В комплект входят: Пластина крепления датчика (НПКМ 482.401.01.02.001) (8 шт), Упор боковой (4 шт), Нащельник (2 шт). Эти детали монтируются на месте установки весов.', '/assets/default/img/no-image.jpg', '72113', 0),
(268, 'Комплект оснований для установки на плиты - 6 датчиков', 44, '35532', '', '/assets/default/img/no-image.jpg', '52216', 1),
(269, 'Весы автомобильные М8200Б-30/60-20-М06-НМ9В-027 (НПКМ 482.400-10)', 47, '33179', 'Модульные. Одноканальные. Прибор Микросим М0601. 8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось. Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 20 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '2003638', 0),
(270, 'Весы автомобильные М8200Б-60/80-20-М06-НМ9В-027 (НПКМ 482.401-09)', 47, '35118', '8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось Средняя секция 8м. Длина платформы 20м. Швеллер 27У. Ширина платформы весов 3м. Ширина колеи 1м.', '/assets/default/img/no-image.jpg', '1994198', 0),
(271, 'Весы автомобильные М8200Б-60/80-18-ПК-НМ9В-027 (НПКМ 482.404-07)', 48, '35130', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 2 шт. 8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 18 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '1832733', 0),
(272, 'Комплект \"Патриот\" для установки весов на  10 датчиках (НПКМ 982.014)', 46, '35509', 'Комплект предназначен для установки автомобильных весов на 10 датчиках, модельного ряда 2021г на стационарный фундамент. В комплект входят: Пластина крепления датчика (НПКМ 482.401.01.02.001) (10 шт), Упор боковой (4 шт), Нащельник (2 шт). Эти детали монтируются на месте установки весов.', '/assets/default/img/no-image.jpg', '81432', 0),
(273, 'Весы автомобильные М8200Б-60/100-24-М06-НМ9В-027 (НПКМ 482.401-12)', 47, '35121', '10 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 24 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '2337265', 0),
(274, 'Настил-комплект (L=12 м) (Весы 2021) (НПКМ 448.241-01)', 42, '36217', 'Настил для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '93535', 1),
(275, 'Ограждение-комплект 18 м (НПКМ 448.243-02)', 43, '34652', '', '/assets/default/img/no-image.jpg', '114569', 8),
(278, 'Комплект торцов под отсыпку пандуса из щебня (НПКМ 982.020)', 45, '34432', 'Комплект состоит из 2х торцов. В комплект поставки торцов входят клиновые анкеры М16 для крепления к бетонной плите основания', '/exchange/images/00-00034432.png', '129175', 0),
(279, 'Комплект оснований для установки на плиты - 10 датчиков', 44, '35589', '', '/assets/default/img/no-image.jpg', '85636', 0),
(280, 'Настил-комплект (L=18 м) (Весы 2021) (НПКМ 448.241-03)', 42, '33228', 'Настил для весов модельного ряда 2021 длиной 18 метров', '/assets/default/img/no-image.jpg', '138101', 0),
(281, 'Весы автомобильные М8200Б-30/40-12-М06-НМ9В-024 (НПКМ 482.401-01)', 47, '35112', '6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 10 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 12м. 24 швеллер.', '/assets/default/img/no-image.jpg', '1142166', 0),
(282, 'Весы автомобильные М8200Б-60/80-16-М06-НМ9В-030 (НПКМ 482.401-05)', 47, '35116', '6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 16 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '1820965', 0),
(283, 'Весы автомобильные М8200Б-60/80-20-ПК-НМ9В-027 (НПКМ 482.404-09)', 48, '35132', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 2 шт. 8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось Средняя секция 8м. Длина платформы 20м. Швеллер 27У. Ширина платформы весов 3м. Ширина колеи 1м.', '/assets/default/img/no-image.jpg', '1995999', 0),
(284, 'Весы автомобильные М8200Б-60/80-24-М06-НМ9В-024 (НПКМ 482.401-11)', 47, '35120', '10 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 10 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 24м. 24 швеллер.', '/assets/default/img/no-image.jpg', '2119315', 0),
(285, 'Весы автомобильные М8200Б-30/60-18-М06-HM9B-024 (НПКМ 482.401-06)', 47, '34845', '8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 10 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 17750 мм. 24 швеллер.', '/assets/default/img/no-image.jpg', '1636528', 2),
(286, 'Весы автомобильные М8200Б-30/60-12-ПК-НМ9В-027 (НПКМ 482.404-02)', 48, '35125', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-06 1 шт. 6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 12 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '1257525', 0),
(287, 'Весы автомобильные М8200Б-60/80-12-ПК-НМ9В-030 (НПКМ 482.404-03)', 48, '35126', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-06 1 шт. 6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 12 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '1432359', 0),
(288, 'Комплект \"Патриот\" для установки весов на  8 датчиках (НПКМ 982.013)', 46, '35331', 'Комплект предназначен для установки автомобильных весов на 8 датчиках, модельного ряда 2021г на стационарный фундамент. В комплект входят: Пластина крепления датчика (НПКМ 482.401.01.02.001) (8 шт), Упор боковой (4 шт), Нащельник (2 шт). Эти детали монтируются на месте установки весов.', '/assets/default/img/no-image.jpg', '76497', 2),
(289, 'Весы автомобильные М8200Б-60/80-18-М06-НМ9В-027 (НПКМ 482.401-07)', 47, '11249', '8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 18 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '1795599', 3),
(290, 'Настил-комплект (L=12 м) с монтажным креплением (Весы 2021) (НПКМ 448.260-01)', 42, '36369', 'Настил для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '133953', 0),
(291, 'Весы автомобильные М8200Б-60/100-18-М06-НМ9В-030 (НПКМ 482.401-08)', 47, '35117', '8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 18 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '2060549', 0),
(292, 'Комплект оснований для установки на плиты - 4 датчиков', 44, '35691', '', '/assets/default/img/no-image.jpg', '35837', 0),
(293, 'Ограждение-комплект 24 м (НПКМ 448.243-03)', 43, '34653', '', '/assets/default/img/no-image.jpg', '151575', 0),
(294, 'Комплект \"Патриот\" для установки весов на 4 датчиках (НПКМ 982.011)', 46, '35695', 'Комплект предназначен для установки автомобильных весов на 4 датчиках, модельного ряда 2021г на стационарный фундамент. В комплект входят: Пластина крепления датчика (НПКМ 482.401.01.02.001) (8 шт), Упор боковой (4 шт), Нащельник (2 шт). Эти детали монтируются на месте установки весов.', '/assets/default/img/no-image.jpg', '67809', 0),
(295, 'Настил-комплект (L=20 м) (Весы 2021) (НПКМ 448.241-04)', 42, '36219', 'Настил для весов модельного ряда 2021 длиной 20 метров', '/assets/default/img/no-image.jpg', '155564', 0),
(296, 'Настил-комплект (L=18 м) с монтажным креплением (Весы 2021) (НПКМ 448.260-03)', 42, '36826', 'Настил для весов модельного ряда 2021 длиной 12 метров', '/assets/default/img/no-image.jpg', '80478', 0),
(297, 'Весы автомобильные М8200Б-30/40-08-М06-НМ9В-027 (НПКМ 482.401)', 47, '35111', '4 датчика HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 8м. 27 швеллер.', '/assets/default/img/no-image.jpg', '910064', 0),
(298, 'Весы автомобильные М8200Б-60/80-18-М06-НМ9В-027-БФ (Старая конструкция)', 47, '37746', '8 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 18 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '1795522', 0),
(299, 'Весы автомобильные М8200Б-30/40-08-ПК-НМ9В-027 (НПКМ 482.404)', 48, '35123', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-04 1 шт. 4 датчика HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 8м. 27 швеллер.', '/assets/default/img/no-image.jpg', '915773', 0),
(300, 'Весы автомобильные М8200Б-30/60-16-ПК-НМ9В-027 (НПКМ 482.404-04)', 48, '35127', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-06 1 шт. 6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 12 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 16 м. 27 швеллер.', '/assets/default/img/no-image.jpg', '1691051', 0),
(301, 'Весы автомобильные М8200Б-60/80-12-М06-НМ9В-030 (НПКМ 482.401-03)', 47, '35114', '6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 12 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '1425751', 0),
(302, 'Весы автомобильные М8200Б-60/80-16-ПК-НМ9В-030 (НПКМ 482.404-05)', 48, '35128', 'Компьютер не входит в комплект поставки. М62109-24в 1 шт. Микросим М0808-06 1 шт. 6 датчиков HM9B-30t (Zemic) (двухопорная консоль, шарик) сталь с никелевым покрытием IP68. Нагрузка 4 оси по 14 т/ось . Ширина платформы весов 3 м. Ширина колеи 1 м. Длина платформы 16 м. 30 швеллер.', '/assets/default/img/no-image.jpg', '1867146', 0),
(303, 'Комплект металлических пандусов 3 метра', 44, '32929', 'Комплект состоит из 4х трёхметровых пандусов. В комплект поставки пандусов входят клиновые анкеры М16 для крепления к бетонной плите основания', '/assets/default/img/no-image.jpg', '323232', 11),
(312, 'Пандус М4813-12Н-01 (1200мм)', 28, 'р09298', 'Ширина пандуса 1200мм. Подходит для весов М8100-АН2Н, М8100-АН11Н, Модификация пандуса -01 для установки ножек в лапы пандуса.', '/assets/default/img/no-image.jpg', '132803', 0),
(313, 'Микросим-06Д (М0600-Д6-04)', 3, '11287', 'для дозаторов дискретного действия, RS-485, с блоком сопряжения М2606', '/exchange/images/00-00011134.jpg', '52082', 3),
(314, 'Пандус М4813-15Н-01 (1500мм)', 28, 'р09138', 'Ширина пандуса 1500мм. Подходит для весов М8100-АН3Н, М8100-АН4Н, Пандус НЕ связан с весами.', '/assets/default/img/no-image.jpg', '149120', 0),
(315, 'Ограждение-комплект 16 м (НПКМ 448.243-05)', 43, '35764', '', '/assets/default/img/no-image.jpg', '114767', 0),
(316, 'Ограждение-комплект 16 м (НПКМ 448.268)', 43, '38108', 'Ограждение-комплект для весов НПКМ 482.406. Проект Северсталь г. Калуга.', '/exchange/images/00-00038108.jpg', '109209', 0),
(317, 'Настил-комплект (L=16 м) (Весы 2021) (НПКМ 448.267)', 42, '38109', 'Настил-комплект для весов НПКМ 482.406. Проект Северсталь г. Калуга.', '/exchange/images/00-00038109.jpg', '128808', 0),
(320, 'Комплект закладных деталей М8300', 23, 'р14113', 'Комплект закладных деталей для вагонных весов, состоящих из 1 секции длиной 4 метра. Для весов, состоящих из 2х секций необходимо 2 комплекта закладных деталей.', '/exchange/images/00-00013372.jpg', '248494', 0),
(321, 'Комплект закладных деталей М8300', 24, 'р14113', 'Комплект закладных деталей для вагонных весов, состоящих из 1 секции длиной 4 метра. Для весов, состоящих из 2х секций необходимо 2 комплекта закладных деталей.', '/exchange/images/00-00013372.jpg', '248494', 0),
(322, 'Комплект оснований для установки на плиты - 6 датчиков по краям (НПКМ 982.021)', 44, '38181', '', '/assets/default/img/no-image.jpg', '3110', 0),
(323, 'Пандус М4813-15Н (1500мм)', 28, 'р09299', 'Ширина пандуса 1500мм. Подходит для весов М8100-АН3Н, М8100-АН4Н, Пандус НЕ связан с весами.', '/assets/default/img/no-image.jpg', '146114', 0),
(324, 'Ограждение-комплект 20 м (НПКМ 448.243-04)', 43, '35763', '', '/assets/default/img/no-image.jpg', '133289', 0),
(325, 'Пандус М4813-12Н (1200мм)', 28, 'р09297', 'Ширина пандуса 1200мм. Подходит для весов М8100-АН2Н, М8100-АН11Н, Пандус НЕ связан с весами.', '/assets/default/img/no-image.jpg', '136182', 0),
(326, 'Пандус М4813-10Н-01 (1000мм)', 28, 'р09296', 'Ширина пандуса 1000мм. Подходит для весов М8100-АН0Н, М8100-АН1Н, М8100-АН10Н. Модификация пандуса -01 для установки ножек в лапы пандуса.', '/assets/default/img/no-image.jpg', '110358', 0),
(327, 'Пандус М4813-10Н (1000мм)', 28, 'р09295', 'Ширина пандуса 1000мм. Подходит для весов М8100-АН0Н, М8100-АН1Н, М8100-АН10Н. Пандус НЕ связан с весами.', '/assets/default/img/no-image.jpg', '107090', 0),
(328, 'Пандус М4814-10 (НПКМ 448.266) Длина 1959 мм ширина 1000 мм', 18, '36815', 'Пандус для ТРЭК шириной 1000мм высота пандуса 224 мм длина 1959мм  Для въезда с одной стороны нужно 2 пандуса. Для въезда и съезда нужно 4 пандуса.', '/assets/default/img/no-image.jpg', '33126', 0),
(329, 'Микросим-06Д (М0600-Д6-02)', 3, '11276', 'для дозаторов дискретного действия, RS-485, с блоком сопряжения М2604', '/exchange/images/00-00011142.jpg', '49675', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sidebar_user`
--

CREATE TABLE `sidebar_user` (
  `id` int(10) NOT NULL,
  `link` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `svg` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=2048 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sidebar_user`
--

INSERT INTO `sidebar_user` (`id`, `link`, `name`, `svg`) VALUES
(1, '/', 'Главная', '<svg width=\"18\" height=\"18\" viewBox=\"0 0 18 18\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M4.76895 17.0283H1V1H4.86158L8.60712 7.275L12.2371 1H17V17.0283H12.4453V8.3848L8.74589 14.0032L4.76895 8.43111V17.0283Z\" fill=\"#9FA2B4\" stroke=\"#9FA2B4\" stroke-width=\"0.2\" stroke-miterlimit=\"22.9256\"/>\r\n                                </svg>'),
(2, '/catalog', 'Каталог', '<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M11.3333 16H4.66667V15.3333C5.68867 15.0893 6.25733 14.2853 6.33133 13.3333H9.66867C9.74267 14.2847 10.3113 15.0893 11.3333 15.3333V16ZM15.3333 12.6667C15.51 12.6667 15.68 12.5967 15.8047 12.4713C15.93 12.3467 16 12.1767 16 12V0.666667C16 0.49 15.93 0.32 15.8047 0.195333C15.68 0.07 15.51 0 15.3333 0H0.666667C0.49 0 0.32 0.07 0.195333 0.195333C0.07 0.32 0 0.49 0 0.666667V12C0 12.1767 0.07 12.3467 0.195333 12.4713C0.32 12.5967 0.49 12.6667 0.666667 12.6667H15.3333ZM8 10.3873C8.368 10.3873 8.66667 10.686 8.66667 11.054C8.66667 11.422 8.368 11.7207 8 11.7207C7.632 11.7207 7.33333 11.422 7.33333 11.054C7.33333 10.686 7.632 10.3873 8 10.3873ZM14.6667 1.33333H1.33333V9.33333H14.6667V1.33333Z\" fill=\"#9FA2B4\"/>\r\n                                </svg>'),
(3, '/orders', 'Мои заказы', '<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M8.93533 16H0V1.33333H2C2.82067 1.33333 3.454 0.610667 4 0H9.33333C9.88067 0.610667 10.5147 1.33333 11.3333 1.33333H13.3333V7.43333C13.01 7.368 12.6753 7.33333 12.3333 7.33333L12 7.344V2.66667H9.33333L8 4H5.402L4 2.66667H1.33333V14.6667H7.91067C8.17533 15.1673 8.52333 15.618 8.93533 16V16ZM12.3333 8.66667C14.3567 8.66667 16 10.3093 16 12.3333C16 14.3573 14.3567 16 12.3333 16C10.3093 16 8.66667 14.3573 8.66667 12.3333C8.66667 10.3093 10.3093 8.66667 12.3333 8.66667ZM12.3333 10C13.6207 10 14.6667 11.0453 14.6667 12.3333C14.6667 13.6213 13.6207 14.6667 12.3333 14.6667C11.0453 14.6667 10 13.6213 10 12.3333C10 11.0453 11.0453 10 12.3333 10ZM14 12.6667H12V10.6667H12.6667V12H14V12.6667ZM3.89933 9.96533L3.2 9.30933L2.66667 9.858L3.90933 11.042L6 8.914L5.45667 8.37533L3.89933 9.96533V9.96533ZM8 10.6667H6.66667V10H8V10.6667ZM9.33333 9.33333H6.66667V8.66667H9.33333V9.33333ZM3.89933 6.65L3.2 5.99467L2.66667 6.54333L3.90933 7.72733L6 5.59933L5.45667 5.06067L3.89933 6.65ZM9.33333 7.33333H6.66667V6.66667H9.33333V7.33333ZM9.33333 6H6.66667V5.33333H9.33333V6ZM6 2C6 2.368 6.29933 2.66667 6.66667 2.66667C7.03533 2.66667 7.33333 2.368 7.33333 2C7.33333 1.632 7.03533 1.33333 6.66667 1.33333C6.29933 1.33333 6 1.632 6 2Z\" fill=\"#9FA2B4\"/>\r\n                                </svg>'),
(4, '/news', 'Новости', '<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path d=\"M4.66669 6.66667H2.66669V6H4.66669V6.66667ZM8.66669 8H10.6667V7.33333H8.66669V8ZM10.6667 4.66667H2.66669V5.33333H10.6667V4.66667ZM10.6667 8.66667H2.66669V9.33333H10.6667V8.66667ZM10.6667 10H2.66669V10.6667H10.6667V10ZM10.6667 6H8.66669V6.66667H10.6667V6ZM8.00002 8V6H5.33335V8H8.00002ZM7.29669 3.12533L7.45535 3.98133H7.78869L8.12269 2.68733H7.80135L7.63535 3.56733L7.47669 2.68733H7.14869L6.96869 3.584L6.80869 2.68733H6.47202L6.77869 3.98133H7.11602L7.29669 3.12533ZM2.66669 8H4.66669V7.33333H2.66669V8ZM14.96 10.8513C15.082 9.30867 14.6714 9.158 12.768 7.30333C12.882 8.11867 13.12 9.568 13.3754 10.6373C13.4347 10.892 13.098 11.0513 12.9847 10.7807C12.8487 10.4507 12.628 9.046 12.438 7.634C12.3354 6.878 11.3307 6.97067 11.3334 7.752C11.3367 8.96667 11.3354 9.97933 11.3334 11.7793C11.3314 13.3147 12.0307 13.3447 12.546 15.0667C12.634 15.3627 12.71 15.6847 12.772 15.9993L15.3334 15.1067C14.4407 13.3593 14.8714 11.9807 14.96 10.8513V10.8513ZM10.6747 12H2.00002V1.33333H11.3334V6.596C11.764 6.368 12.232 6.41333 12.5847 6.66333L12.6667 6.65133V1C12.6667 0.448 12.2187 0 11.6667 0H1.66669C1.11469 0 0.666687 0.447333 0.666687 1V12.3333C0.666687 12.886 1.11469 13.3333 1.66669 13.3333H10.9827C10.8194 12.99 10.6994 12.584 10.6747 12ZM8.56402 3.736C8.46469 3.736 8.34802 3.70733 8.25335 3.65867L8.23735 3.65L8.17202 3.91533L8.18202 3.92067C8.25002 3.95933 8.39402 4 8.54669 4C8.93402 4 9.07202 3.78133 9.07202 3.59333C9.07202 3.412 8.96469 3.288 8.73402 3.20267C8.56469 3.13867 8.50869 3.106 8.50869 3.038C8.50869 2.97267 8.57535 2.93067 8.67802 2.93067C8.76869 2.93067 8.85535 2.95067 8.93669 2.98933L8.95202 2.99667L9.02335 2.73667L9.01335 2.732C8.91669 2.68867 8.80602 2.66667 8.68335 2.66667C8.38869 2.66667 8.19069 2.826 8.19069 3.062C8.19069 3.23667 8.31135 3.36733 8.54735 3.44933C8.69869 3.50333 8.75002 3.54533 8.75002 3.614C8.75002 3.692 8.68202 3.736 8.56402 3.736V3.736ZM5.01402 3.98133H5.33735V2.68733H5.04535V3.48L4.61869 2.68733H4.26135V3.98133H4.55335V3.09667L5.01402 3.98133V3.98133ZM6.36602 2.95133V2.68733H5.55602V3.98133H6.39269V3.71733H5.87269V3.44667H6.33802V3.18467H5.87269V2.95133H6.36602V2.95133Z\" fill=\"#9FA2B4\"/>\r\n                                </svg>'),
(5, '/tkpcostruct', 'Конструктор ТКП', '<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path d=\"M12 6.68733V2.40533L7.976 0L4 2.37933V6.712L0 8.86133V13.672L4.09067 16L8 13.738L11.9093 16L16 13.672V8.88733L12 6.68733V6.68733ZM11.238 6.71133L8.35733 8.30067V4.99667L11.238 3.304V6.71133ZM7.97467 0.904667L10.8227 2.63533L7.97733 4.308L5.19333 2.60533L7.97467 0.904667V0.904667ZM7.59533 4.994V8.30067L4.762 6.68667V3.264L7.59533 4.994V4.994ZM3.70867 14.8887L0.761333 13.196V9.74533L3.70867 11.4753V14.8887ZM1.19333 9.08733L4.37867 7.40067L7.20333 9.012L4.09133 10.79L1.19333 9.08733V9.08733ZM4.47133 11.4787L7.61933 9.68067V13.0513L4.47133 14.8893V11.4787V11.4787ZM11.5287 14.8887L8.38067 13.0507V9.64L11.5287 11.476V14.8887ZM8.81267 8.98133L11.644 7.388L14.8233 9.11733L11.912 10.79L8.81267 8.98133V8.98133ZM15.238 13.1967L12.2907 14.8893V11.4787L15.238 9.78667V13.1967V13.1967Z\" fill=\"#9FA2B4\"/>\r\n                                </svg>'),
(6, '/addmaterials', 'Доп.материалы', '<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M13.1713 13.4473C12.644 13.7967 12.012 14 11.3333 14C9.49333 14 8 12.5067 8 10.6667C8 8.82666 9.49333 7.33332 11.3333 7.33332C13.1733 7.33332 14.6667 8.82666 14.6667 10.6667C14.6667 11.3453 14.4633 11.9773 14.114 12.5047L16 14.3907L15.0573 15.3333L13.1713 13.4473V13.4473ZM8.06867 14H0V0.666656H4.66667C5.79667 1.96132 6.24733 2.66666 7.33333 2.66666H14.6667V7.40199C13.8193 6.53732 12.6387 5.99999 11.3333 5.99999C8.758 5.99999 6.66667 8.09132 6.66667 10.6667C6.66667 11.972 7.204 13.1527 8.06867 14V14ZM11.3333 8.66666C12.4373 8.66666 13.3333 9.56266 13.3333 10.6667C13.3333 11.7707 12.4373 12.6667 11.3333 12.6667C10.2293 12.6667 9.33333 11.7707 9.33333 10.6667C9.33333 9.56266 10.2293 8.66666 11.3333 8.66666Z\" fill=\"#9FA2B4\"/>\r\n                                </svg>'),
(7, '/academy', 'Академия метра', '<svg width=\"16\" height=\"12\" viewBox=\"0 0 16 12\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M16 12H14L14.6667 10H15.3333L16 12ZM7.34933 8.97133L13.3333 5.92133V10C12.662 11.3607 9.59533 12 7.66667 12C5.55 12 2.74067 11.3373 2 10V5.59067L7.34933 8.97133ZM15.3333 9.33333H14.6667V4.49333L7.38467 8.20533L0 3.53867L8 0L15.3333 4.154V9.33333Z\" fill=\"#9FA2B4\"/>\r\n                                </svg>'),
(8, '/clients', 'Мои клиенты', '<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\r\n                                    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M13.5547 15.3333H8.88866L7.40467 10.9713C7.314 10.7853 7.12466 10.6667 6.91666 10.6667H6.66666V9.99999H9.15266L10.5233 7.50799C10.594 7.39399 10.7133 7.33332 10.8347 7.33332C11.1187 7.33332 11.2953 7.64599 11.146 7.88932L9.98533 9.99999H12.6813L11.5207 7.88932C11.3713 7.64599 11.548 7.33332 11.832 7.33332C11.9533 7.33332 12.0727 7.39399 12.1433 7.50799L13.514 9.99999H16V10.6667H15.7507C15.5427 10.6667 15.3527 10.7853 15.262 10.9727L13.5547 15.3333ZM7.95733 14.6667H-1.55331e-06C-1.55331e-06 14.482 -0.00133489 12.9653 -0.00266822 12.798C-0.00800155 11.3907 0.0526651 10.5853 1.67333 10.2113C3.44866 9.80199 5.54066 9.43466 4.698 7.88132C2.202 3.27732 3.98667 0.666656 6.66733 0.666656C9.29533 0.666656 11.1247 3.18066 8.63533 7.88132L7.908 9.33332H6.66666C6.29867 9.33332 6 9.63199 6 9.99999V10.6667C6 11.0347 6.29867 11.3333 6.66666 11.3333H6.824L7.95733 14.6667ZM10.3213 11.716C10.3213 11.532 10.172 11.3827 9.988 11.3827C9.804 11.3827 9.65467 11.532 9.65467 11.716V13.716C9.65467 13.9 9.804 14.0493 9.988 14.0493C10.172 14.0493 10.3213 13.9 10.3213 13.716V11.716ZM11.6547 11.6667C11.6547 11.4827 11.5053 11.3333 11.3213 11.3333C11.1373 11.3333 10.988 11.4827 10.988 11.6667V13.6667C10.988 13.8507 11.1373 14 11.3213 14C11.5053 14 11.6547 13.8507 11.6547 13.6667V11.6667ZM13.012 11.6667C13.012 11.4827 12.8627 11.3333 12.6787 11.3333C12.4947 11.3333 12.3453 11.4827 12.3453 11.6667V13.6667C12.3453 13.8507 12.4947 14 12.6787 14C12.8627 14 13.012 13.8507 13.012 13.6667V11.6667Z\" fill=\"#9FA2B4\"/>\r\n                                </svg>');

-- --------------------------------------------------------

--
-- Структура таблицы `tkp_auto`
--

CREATE TABLE `tkp_auto` (
  `id` int(10) NOT NULL,
  `name` varchar(512) NOT NULL,
  `type_sensor` varchar(256) NOT NULL,
  `type_instalation` varchar(256) NOT NULL,
  `length` varchar(10) NOT NULL,
  `model` varchar(256) NOT NULL,
  `weight` varchar(10) NOT NULL,
  `path` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tkp_auto`
--

INSERT INTO `tkp_auto` (`id`, `name`, `type_sensor`, `type_instalation`, `length`, `model`, `weight`, `path`) VALUES
(1, 'Кочевник Аналоговые 8м-30-40т', 'Аналоговый', 'Пандус', '8м', 'Кочевник', '30-40т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-8m-30-40t-new.docx'),
(2, 'Кочевник Аналоговые 12м-30-40т', 'Аналоговый', 'Пандус', '12м', 'Кочевник', '30-40т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-12m-30-40t-new.docx'),
(3, 'Кочевник Аналоговые 12м-30-60т', 'Аналоговый', 'Пандус', '12м', 'Кочевник', '30-60т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-12m-30-60t-new.docx'),
(4, 'Кочевник Аналоговые 12м-60-80т', 'Аналоговый', 'Пандус', '12м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-12m-60-80t-new.docx'),
(5, 'Кочевник Аналоговые 16м-30-60т', 'Аналоговый', 'Пандус', '16м', 'Кочевник', '30-60т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-16m-30-60t-new.docx'),
(6, 'Кочевник Аналоговые 16м-60-80т', 'Аналоговый', 'Пандус', '16м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-16m-60-80t-new.docx'),
(7, 'Кочевник Аналоговые 18м-30-60т', 'Аналоговый', 'Пандус', '18м', 'Кочевник', '30-60т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-18m-30-60t-new.docx'),
(8, 'Кочевник Аналоговые 18м-60-80т', 'Аналоговый', 'Пандус', '18м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-18m-60-80t-new.docx'),
(9, 'Кочевник Аналоговые 18м-60-100т', 'Аналоговый', 'Пандус', '18м', 'Кочевник', '60-100т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-18m-60-100t-new.docx'),
(10, 'Кочевник Аналоговые 20м-30-60т', 'Аналоговый', 'Пандус', '20м', 'Кочевник', '30-60т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-20m-30-60t-new.docx'),
(11, 'Кочевник Аналоговые 20м-60-80т', 'Аналоговый', 'Пандус', '20м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-20m-60-80t-new.docx'),
(12, 'Кочевник Аналоговые 20м-60-100т', 'Аналоговый', 'Пандус', '20м', 'Кочевник', '60-100т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-20m-60-100t-new.docx'),
(13, 'Кочевник Аналоговые 24м-60-80т', 'Аналоговый', 'Пандус', '24м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-24m-60-80t-new.docx'),
(14, 'Кочевник Аналоговые 24м-60-100т', 'Аналоговый', 'Пандус', '24м', 'Кочевник', '60-100т', '/automobile/kochevnik/analog/pandus/kochevnik-tkp-analogovye-24m-60-100t-new.docx'),
(15, 'Кочевник Аналогово-цифровые 8м-30-40т', 'Аналогово-цифровой', 'Пандус', '8м', 'Кочевник', '30-40т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-8m-30-40t-new.docx'),
(16, 'Кочевник Аналогово-цифровые 12м-30-40т', 'Аналогово-цифровой', 'Пандус', '12м', 'Кочевник', '30-40т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-12m-30-40t-new.docx'),
(17, 'Кочевник Аналогово-цифровые 12м-30-60т', 'Аналогово-цифровой', 'Пандус', '12м', 'Кочевник', '30-60т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-12m-30-60t-new.docx'),
(18, 'Кочевник Аналогово-цифровые 12м-60-80т', 'Аналогово-цифровой', 'Пандус', '12м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-12m-60-80t-new.docx'),
(19, 'Кочевник Аналогово-цифровые 16м-30-60т', 'Аналогово-цифровой', 'Пандус', '16м', 'Кочевник', '30-60т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-16m-30-60t-new.docx'),
(20, 'Кочевник Аналогово-цифровые 16м-60-80т', 'Аналогово-цифровой', 'Пандус', '16м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-16m-60-80t-new.docx'),
(21, 'Кочевник Аналогово-цифровые 18м-30-60т', 'Аналогово-цифровой', 'Пандус', '18м', 'Кочевник', '30-60т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-18m-30-60t-new.docx'),
(22, 'Кочевник Аналогово-цифровые 18м-60-80т', 'Аналогово-цифровой', 'Пандус', '18м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-18m-60-80t-new.docx'),
(23, 'Кочевник Аналогово-цифровые 18м-60-100т', 'Аналогово-цифровой', 'Пандус', '18м', 'Кочевник', '60-100т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-18m-60-100t-new.docx'),
(24, 'Кочевник Аналогово-цифровые 20м-60-80т', 'Аналогово-цифровой', 'Пандус', '20м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-20m-60-80t-new.docx'),
(25, 'Кочевник Аналогово-цифровые 20м-60-100т', 'Аналогово-цифровой', 'Пандус', '20м', 'Кочевник', '60-100т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-20m-60-100t-new.docx'),
(26, 'Кочевник Аналогово-цифровые 24м-60-80т', 'Аналогово-цифровой', 'Пандус', '24м', 'Кочевник', '60-80т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-24m-60-80t-new.docx'),
(27, 'Кочевник Аналогово-цифровые 24м-60-100т', 'Аналогово-цифровой', 'Пандус', '24м', 'Кочевник', '60-100т', '/automobile/kochevnik/analog-digital/pandus/kochevnik-tkp-analogovo-cifrovye-24m-60-100t-new.docx'),
(28, 'Патриот Аналоговые 8м-30-40т', 'Аналоговый', 'Пандус', '8м', 'Патриот', '30-40т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-8m-30-40t-new.docx'),
(29, 'Патриот Аналоговые 12м-30-40т', 'Аналоговый', 'Пандус', '12м', 'Патриот', '30-40т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-12m-30-40t-new.docx'),
(30, 'Патриот Аналоговые 12м-30-60т', 'Аналоговый', 'Пандус', '12м', 'Патриот', '30-60т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-12m-30-60t-new.docx'),
(31, 'Патриот Аналоговые 12м-60-80т', 'Аналоговый', 'Пандус', '12м', 'Патриот', '60-80т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-12m-60-80t-new.docx'),
(32, 'Патриот Аналоговые 16м-30-60т', 'Аналоговый', 'Пандус', '16м', 'Патриот', '30-60т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-16m-30-60t-new.docx'),
(33, 'Патриот Аналоговые 16м-30-60т', 'Аналоговый', 'Пандус', '16м', 'Патриот', '60-80т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-16m-60-80t-new.docx'),
(34, 'Патриот Аналоговые 16м-60-80т', 'Аналоговый', 'Пандус', '18м', 'Патриот', '30-60т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-18m-30-60t-new.docx'),
(35, 'Патриот Аналоговые 18м-30-60т', 'Аналоговый', 'Пандус', '18м', 'Патриот', '60-80т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-18m-60-80t-new.docx'),
(36, 'Патриот Аналоговые 18м-60-80т', 'Аналоговый', 'Пандус', '18м', 'Патриот', '60-100т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-18m-60-100t-new.docx'),
(37, 'Патриот Аналоговые 20м-30-60т', 'Аналоговый', 'Пандус', '20м', 'Патриот', '30-60т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-20m-30-60t-new.docx'),
(38, 'Патриот Аналоговые 20м-60-80т', 'Аналоговый', 'Пандус', '20м', 'Патриот', '60-80т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-20m-60-80t-new.docx'),
(39, 'Патриот Аналоговые 20м-60-100т', 'Аналоговый', 'Пандус', '20м', 'Патриот', '60-100т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-20m-60-100t-new.docx'),
(40, 'Патриот Аналоговые 24м-60-80т', 'Аналоговый', 'Пандус', '24м', 'Патриот', '60-80т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-24m-60-80t-new.docx'),
(41, 'Патриот Аналоговые 24м-60-100т', 'Аналоговый', 'Пандус', '24м', 'Патриот', '60-100т', '/automobile/patriot/analog/pandus/patriot-tkp-analogovye-24m-60-100t-new.docx'),
(42, 'Патриот Аналоговые 8м-40т приямок', 'Аналоговый', 'Приямок', '8м', 'Патриот', '40т', '/automobile/patriot/analog/pit/patriot-40-08k-analogovye-priyamok.docx'),
(43, 'Патриот Аналоговые 12м-40т приямок', 'Аналоговый', 'Приямок', '12м', 'Патриот', '40т', '/automobile/patriot/analog/pit/patriot-40-12k-analogovye-priyamok.docx'),
(44, 'Патриот Аналоговые 8м-60т приямок', 'Аналоговый', 'Приямок', '8м', 'Патриот', '60т', '/automobile/patriot/analog/pit/patriot-60-08k-analogovye-priyamok.docx'),
(45, 'Патриот Аналоговые 12м-60т приямок', 'Аналоговый', 'Приямок', '12м', 'Патриот', '60т', '/automobile/patriot/analog/pit/patriot-60-12k-analogovye-priyamok.docx'),
(46, 'Патриот Аналоговые 16м-60т приямок', 'Аналоговый', 'Приямок', '16м', 'Патриот', '60т', '/automobile/patriot/analog/pit/patriot-60-16k-analogovye-priyamok.docx'),
(47, 'Патриот Аналоговые 18м-60т приямок', 'Аналоговый', 'Приямок', '18м', 'Патриот', '60т', '/automobile/patriot/analog/pit/patriot-60-18k-analogovye-priyamok.docx'),
(48, 'Патриот Аналоговые 18м-60-80т приямок', 'Аналоговый', 'Приямок', '18м', 'Патриот', '60-80т', '/automobile/patriot/analog/pit/patriot-60-80-18k-analogovye-priyamok.docx'),
(49, 'Патриот Аналоговые 12м-80т приямок', 'Аналоговый', 'Приямок', '12м', 'Патриот', '80т', '/automobile/patriot/analog/pit/patriot-80-12k-analogovye-priyamok.docx'),
(50, 'Патриот Аналоговые 16м-80т приямок', 'Аналоговый', 'Приямок', '16м', 'Патриот', '80т', '/automobile/patriot/analog/pit/patriot-80-16k-analogovye-priyamok.docx'),
(51, 'Патриот Аналоговые 18м-80т приямок', 'Аналоговый', 'Приямок', '18м', 'Патриот', '80т', '/automobile/patriot/analog/pit/patriot-80-18k-analogovye-priyamok.docx'),
(52, 'Патриот Аналоговые 20м-80т приямок', 'Аналоговый', 'Приямок', '20м', 'Патриот', '80т', '/automobile/patriot/analog/pit/patriot-80-20k-analogovye-priyamok.docx'),
(53, 'Патриот Аналоговые 24м-80т приямок', 'Аналоговый', 'Приямок', '24м', 'Патриот', '80т', '/automobile/patriot/analog/pit/patriot-80-24k-analogovye-priyamok.docx'),
(54, 'Патриот Аналоговые 18м-100т приямок', 'Аналоговый', 'Приямок', '18м', 'Патриот', '100т', '/automobile/patriot/analog/pit/patriot-100-18k-analogovye-priyamok.docx'),
(55, 'Патриот Аналоговые 20м-100т приямок', 'Аналоговый', 'Приямок', '20м', 'Патриот', '100т', '/automobile/patriot/analog/pit/patriot-100-20k-analogovye-priyamok.docx'),
(56, 'Патриот Аналоговые 24м-100т приямок', 'Аналоговый', 'Приямок', '20м', 'Патриот', '100т', '/automobile/patriot/analog/pit/patriot-100-24k-analogovye-priyamok.docx'),
(57, 'Патриот Аналогово-цифровые 8м-30-40т', 'Аналогово-цифровой', 'Пандус', '8м', 'Патриот', '30-40т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-8m-30-40t-new.docx'),
(58, 'Патриот Аналогово-цифровые 12м-30-40т', 'Аналогово-цифровой', 'Пандус', '12м', 'Патриот', '30-40т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-12m-30-40t-new.docx'),
(59, 'Патриот Аналогово-цифровые 12м-30-60т', 'Аналогово-цифровой', 'Пандус', '12м', 'Патриот', '30-60т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-12m-30-60t-new.docx'),
(60, 'Патриот Аналогово-цифровые 12м-60-80т', 'Аналогово-цифровой', 'Пандус', '12м', 'Патриот', '60-80т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-12m-60-80t-new.docx'),
(61, 'Патриот Аналогово-цифровые 16м-30-60т', 'Аналогово-цифровой', 'Пандус', '16м', 'Патриот', '30-60т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-16m-30-60t-new.docx'),
(62, 'Патриот Аналогово-цифровые 16м-60-80т', 'Аналогово-цифровой', 'Пандус', '16м', 'Патриот', '60-80т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-16m-60-80t-new.docx'),
(63, 'Патриот Аналогово-цифровые 18м-30-60т', 'Аналогово-цифровой', 'Пандус', '18м', 'Патриот', '30-60т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-18m-30-60t-new.docx'),
(64, 'Патриот Аналогово-цифровые 18м-60-80т', 'Аналогово-цифровой', 'Пандус', '18м', 'Патриот', '60-80т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-18m-60-80t-new.docx'),
(65, 'Патриот Аналогово-цифровые 18м-60-100т', 'Аналогово-цифровой', 'Пандус', '18м', 'Патриот', '60-100т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-18m-60-100t-new.docx'),
(66, 'Патриот Аналогово-цифровые 20м-60-80т', 'Аналогово-цифровой', 'Пандус', '20м', 'Патриот', '60-80т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-20m-60-80t-new.docx'),
(67, 'Патриот Аналогово-цифровые 20м-60-100т', 'Аналогово-цифровой', 'Пандус', '20м', 'Патриот', '60-100т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-20m-60-100t-new.docx'),
(68, 'Патриот Аналогово-цифровые 24м-60-80т', 'Аналогово-цифровой', 'Пандус', '24м', 'Патриот', '60-80т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-24m-60-80t-new.docx'),
(69, 'Патриот Аналогово-цифровые 24м-60-100т', 'Аналогово-цифровой', 'Пандус', '24м', 'Патриот', '60-100т', '/automobile/patriot/analog-digital/pandus/patriot-tkp-analogovo-cifrovye-24m-60-100t-new.docx'),
(70, 'Патриот Аналогово-цифровые 8м-40т приямок', 'Аналогово-цифровой', 'Приямок', '8м', 'Патриот', '40т', '/automobile/patriot/analog-digital/pandus/patriot-40-08-k-analogovo-cifrovye-v-priyamok.docx'),
(71, 'Патриот Аналогово-цифровые 12м-40т приямок', 'Аналогово-цифровой', 'Приямок', '12м', 'Патриот', '40т', '/automobile/patriot/analog-digital/pandus/patriot-40-12-k-analogovo-cifrovye-v-priyamok.docx'),
(72, 'Патриот Аналогово-цифровые 8м-60т приямок', 'Аналогово-цифровой', 'Приямок', '8м', 'Патриот', '60т', '/automobile/patriot/analog-digital/pandus/patriot-60-08-k-analogovo-cifrovye-v-priyamok.docx'),
(73, 'Патриот Аналогово-цифровые 12м-60т приямок', 'Аналогово-цифровой', 'Приямок', '12м', 'Патриот', '60т', '/automobile/patriot/analog-digital/pandus/patriot-60-12-k-analogovo-cifrovye-v-priyamok.docx'),
(74, 'Патриот Аналогово-цифровые 16м-60т приямок', 'Аналогово-цифровой', 'Приямок', '16м', 'Патриот', '60т', '/automobile/patriot/analog-digital/pandus/patriot-60-16-k-analogovo-cifrovye-v-priyamok.docx'),
(75, 'Патриот Аналогово-цифровые 18м-60т приямок', 'Аналогово-цифровой', 'Приямок', '18м', 'Патриот', '60т', '/automobile/patriot/analog-digital/pandus/patriot-60-18-k-analogovo-cifrovye-v-priyamok.docx'),
(76, 'Патриот Аналогово-цифровые 12м-80т приямок', 'Аналогово-цифровой', 'Приямок', '12м', 'Патриот', '80т', '/automobile/patriot/analog-digital/pandus/patriot-80-12-k-analogovo-cifrovye-v-priyamok.docx'),
(77, 'Патриот Аналогово-цифровые 16м-80т приямок', 'Аналогово-цифровой', 'Приямок', '16м', 'Патриот', '80т', '/automobile/patriot/analog-digital/pandus/patriot-80-16-k-analogovo-cifrovye-v-priyamok.docx'),
(78, 'Патриот Аналогово-цифровые 18м-80т приямок', 'Аналогово-цифровой', 'Приямок', '18м', 'Патриот', '80т', '/automobile/patriot/analog-digital/pandus/patriot-80-18-k-analogovo-cifrovye-v-priyamok.docx'),
(79, 'Патриот Аналогово-цифровые 20м-80т приямок', 'Аналогово-цифровой', 'Приямок', '20м', 'Патриот', '80т', '/automobile/patriot/analog-digital/pandus/patriot-80-20-k-analogovo-cifrovye-v-priyamok.docx'),
(80, 'Патриот Аналогово-цифровые 24м-80т приямок', 'Аналогово-цифровой', 'Приямок', '24м', 'Патриот', '80т', '/automobile/patriot/analog-digital/pandus/patriot-80-24-k-analogovo-cifrovye-v-priyamok.docx'),
(81, 'Патриот Аналогово-цифровые 18м-100т приямок', 'Аналогово-цифровой', 'Приямок', '18м', 'Патриот', '100т', '/automobile/patriot/analog-digital/pandus/patriot-100-18-k-analogovo-cifrovye-v-priyamok.docx'),
(82, 'Патриот Аналогово-цифровые 20м-100т приямок', 'Аналогово-цифровой', 'Приямок', '20м', 'Патриот', '100т', '/automobile/patriot/analog-digital/pandus/patriot-100-20-k-analogovo-cifrovye-v-priyamok.docx'),
(83, 'Патриот Аналогово-цифровые 24м-100т приямок', 'Аналогово-цифровой', 'Приямок', '24м', 'Патриот', '100т', '/automobile/patriot/analog-digital/pandus/patriot-100-24-k-analogovo-cifrovye-v-priyamok.docx'),
(84, 'Трек 15-30-04-5т ширина 800', 'Аналоговый', 'Пандус', '4м', 'Трэк', '15-30т', '/automobile/track/analog-digital/pandus/trek-15-30-04-5t-shirina-800.docx'),
(85, 'Трек 15-30-05-5т ширина 800', 'Аналоговый', 'Пандус', '5м', 'Трэк', '15-30т', '/automobile/track/analog-digital/pandus/trek-15-30-05-5t-shirina-800.docx'),
(86, 'Трек 15-30-06-5т ширина 800', 'Аналоговый', 'Пандус', '6м', 'Трэк', '15-30т', '/automobile/track/analog-digital/pandus/trek-15-30-06-5t-shirina-800.docx'),
(87, 'Трек 30-40-06-10т ширина 800', 'Аналоговый', 'Пандус', '6м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-06-10t-shirina-800.docx'),
(88, 'Трек 30-40-07-5т ширина 800', 'Аналоговый', 'Пандус', '7м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-07-5t-shirina-800.docx'),
(89, 'Трек 30-40-07-10т ширина 800', 'Аналоговый', 'Пандус', '7м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-07-10t-shirina-800.docx'),
(90, 'Трек 30-40-08-5т ширина 800', 'Аналоговый', 'Пандус', '8м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-08-5t-shirina-800.docx'),
(91, 'Трек 30-40-08-5т ширина 1000', 'Аналоговый', 'Пандус', '8м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-08-5t-shirina-1000.docx'),
(92, 'Трек 30-40-08-10т ширина 800', 'Аналоговый', 'Пандус', '8м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-08-10t-shirina-800.docx'),
(93, 'Трек 30-40-08-10т ширина 1000', 'Аналоговый', 'Пандус', '8м', 'Трек', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-08-10t-shirina-1000.docx'),
(94, 'Трек 30-40-09-5т ширина 800', 'Аналоговый', 'Пандус', '9м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-09-5t-shirina-800.docx'),
(95, 'Трек 30-40-09-10т ширина 800', 'Аналоговый', 'Пандус', '9м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-09-10t-shirina-800.docx'),
(96, 'Трек 30-40-09-10т ширина 1000', 'Аналоговый', 'Пандус', '9м', 'Трэк', '30-40т', '/automobile/track/analog-digital/pandus/trek-30-40-09-10t-shirina-1000.docx');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_addr` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(2) NOT NULL,
  `confirm_code` int(6) NOT NULL,
  `status_mail` int(2) NOT NULL,
  `restore_token` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chat_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `mail`, `org_name`, `org_addr`, `phone`, `pass`, `status`, `confirm_code`, `status_mail`, `restore_token`, `chat_id`, `admin_status`) VALUES
(3, 'Елена Машкова', 'mashkova_ea@metra.ru', 'ООО НПП \"Метра\"', 'г. Обнинск, ул. Красных Зорь 26', '+79206106746', 'dff223b544fd5c709248a89c5dafe7a4', 1, 8702, 1, 'f9b2e7d7-c2a7-4bdd-bdfc-59587d62b727', NULL, 0),
(4, 'Евгений Батухтин', 'office@ooovist.ru', 'Общество с ограниченной ответственностью «Вист»', '107497, г. Москва, ул. Монтажная, д. 8, стр. 7', '+79858749126', '8280ed7a965134022a0529b761e5d457', 1, 8541, 1, NULL, NULL, 0),
(5, 'Алексей Курноскин', 'A.Kurnoskin@vis-campany.ru', 'ООО\"КОМПАНИЯ-ВИС\"', 'г. Москва', '+79060799140', '054a9ebb6536da4dfbc1f717bcd5db2f', 1, 3316, 0, NULL, NULL, 0),
(6, 'Алексей Курноскин ', 'a.kurnoskin@vis-company.ru', 'ВИС ', 'г. Москва', '+79060799144', '054a9ebb6536da4dfbc1f717bcd5db2f', 1, 5953, 1, NULL, NULL, 0),
(7, 'Ершов Геннадий', 'vestex76@mail.ru', 'ООО ВЕСТЕХ', 'г. Ярославль', '+79056394296', '9c9037071abd8f0f52fb5b902ad85800', 1, 6580, 1, NULL, NULL, 0),
(8, 'Сергей Федин (ООО ПКФ АСК Инжиниринг', 'serg3ifedin@yandex.ru', 'ПКФ АСК Инжиниринг', 'г. Пенза', '+79374483393', '8f6ab858f41b43667afa03a9bd883478', 1, 2374, 1, NULL, NULL, 0),
(9, 'Алексей Верещагин', 'vavu@mail.ru', 'ООО \"Уралточприбор\"', 'г. Екатеринбург', '+79122820049', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, 1, NULL, NULL, 0),
(10, 'Сергей Маркин', 'msa18713@mail.ru', 'ООО \"\"', 'Озерск, Гайдара 48-96', '+79026043283', '4ba175e699d4996462289680190078e4', 1, 5292, 1, '07a970b9-04d7-4afa-bd70-904ef4408364', NULL, 0),
(11, 'Бабалыхян Наталья', 'bonus@businessterminal.ru', 'ООО Бизнес-Терминал', 'г.Ростов-на-Дону', '+79289009698', '2c056c99462685313cd1a52f9fd10808', 1, 435, 1, NULL, NULL, 0),
(13, 'Нестеров Андрей', 'polyshinnel@gmail.com', 'ООО \"Рога и копыта\"', 'Гурьянова', '+79030264456', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 3668, 1, NULL, NULL, 0),
(15, 'Владимир Жариков', 'sales@zskrus.ru', 'ООО ПКФ \"АСК Инжиниринг\"', 'Пензенская область,  г. Пенза, ул. 40 лет Октября, д.19Д., оф.3', '+79085202311', '701ee410906411d67178c3eed2688c79', 1, 1552, 1, NULL, NULL, 0),
(16, 'Петухов ', 'petuhov@metra.ru', 'МЕТРА НПП', 'Обнинск', '+79262221401', '9e6b0826b861b41ba880834efbbd55ab', 1, 1869, 1, NULL, NULL, 0),
(17, 'Евгений Меланин', 'metronom-centr@yandex.ru', 'ООО \"СКЕЙЛ ТЕХНИКС\"', 'г. Краснодар, ул. Северная, д.490, пом.1/1', '+79615191909', 'a3a1a02e8ddbcaac00aadcdadabda6aa', 1, 7491, 1, NULL, NULL, 0),
(18, 'Сергей Кузенко', 'dc-07@mail.ru', 'ИП Кузенко', 'Белгородская обл., п.Майский, ул.Гвардейская,5', '+79103216689', '8bbc5fbf0d75c8e4ffdf8c337cf213b2', 1, 4447, 1, NULL, NULL, 0),
(23, 'Нестеров Андрей', 'polyshinnel@yandex.ru', 'ООО \"Рога и копыта\"', 'Гурьянова', '+79960318410', 'cc03e747a6afbbcbf8be7668acfebee5', 1, 9005, 1, 'F1EE410D-442C-4942-B746-580C47705948', NULL, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_list`
--
ALTER TABLE `admin_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `build_tasks_auto`
--
ALTER TABLE `build_tasks_auto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sidebar_user`
--
ALTER TABLE `sidebar_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tkp_auto`
--
ALTER TABLE `tkp_auto`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_list`
--
ALTER TABLE `admin_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT для таблицы `sidebar_user`
--
ALTER TABLE `sidebar_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `tkp_auto`
--
ALTER TABLE `tkp_auto`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
