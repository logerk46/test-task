-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 16 2019 г., 10:31
-- Версия сервера: 10.1.36-MariaDB
-- Версия PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cars`
--

-- --------------------------------------------------------

--
-- Структура таблицы `car_composition`
--

CREATE TABLE `car_composition` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `car_composition`
--

INSERT INTO `car_composition` (`id`, `name`) VALUES
(0, 'mitsubishi'),
(1, 'BMW');

-- --------------------------------------------------------

--
-- Структура таблицы `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `comp_id` int(11) NOT NULL,
  `model_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `model`
--

INSERT INTO `model` (`id`, `comp_id`, `model_name`) VALUES
(1, 1, 'x5'),
(2, 0, 'lancer');

-- --------------------------------------------------------

--
-- Структура таблицы `model_modifications`
--

CREATE TABLE `model_modifications` (
  `id` int(11) NOT NULL,
  `mod_name` varchar(255) NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `model_modifications`
--

INSERT INTO `model_modifications` (`id`, `mod_name`, `model_id`) VALUES
(1, 'pro', 1),
(2, 'testpro', 1),
(3, 'test', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `model_year`
--

CREATE TABLE `model_year` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `model_year`
--

INSERT INTO `model_year` (`id`, `year`, `model_id`) VALUES
(0, 2004, 2),
(1, 2005, 1),
(3, 2006, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `car_composition`
--
ALTER TABLE `car_composition`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model_modifications`
--
ALTER TABLE `model_modifications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `model_year`
--
ALTER TABLE `model_year`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
