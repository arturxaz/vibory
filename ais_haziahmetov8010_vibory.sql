-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Окт 08 2024 г., 17:21
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_haziahmetov8010_vibory`
--

-- --------------------------------------------------------

--
-- Структура таблицы `candidate`
--

CREATE TABLE `candidate` (
  `id` int NOT NULL,
  `fio` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `candidate`
--

INSERT INTO `candidate` (`id`, `fio`) VALUES
(1, 'Андрей Андреевич Замай'),
(2, 'против всех или недействительный бюллетень'),
(3, 'Сергей Иванович Фургал'),
(4, 'Владимир Владимирович Путин'),
(5, 'Хазиахметов Артур Данисович');

-- --------------------------------------------------------

--
-- Структура таблицы `polling station`
--

CREATE TABLE `polling station` (
  `id` int NOT NULL,
  `id_region` int NOT NULL,
  `number_station` int NOT NULL,
  `number of voters` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `polling station`
--

INSERT INTO `polling station` (`id`, `id_region`, `number_station`, `number of voters`) VALUES
(1, 1, 52, 53),
(2, 2, 0, 1488),
(3, 3, 59, 1337),
(4, 4, 78, 50000),
(5, 1, 1, 3000);

-- --------------------------------------------------------

--
-- Структура таблицы `region`
--

CREATE TABLE `region` (
  `id` int NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `region`
--

INSERT INTO `region` (`id`, `name`) VALUES
(1, 'хмао'),
(2, 'все'),
(3, 'Хабаровск'),
(4, '78');

-- --------------------------------------------------------

--
-- Структура таблицы `results_voteson_section`
--

CREATE TABLE `results_voteson_section` (
  `id` int NOT NULL,
  `id_station` int NOT NULL,
  `id_candidate` int NOT NULL,
  `number_of_voices` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `results_voteson_section`
--

INSERT INTO `results_voteson_section` (`id`, `id_station`, `id_candidate`, `number_of_voices`) VALUES
(1, 1, 1, 2024),
(2, 2, 2, 1488),
(3, 3, 3, 1337),
(4, 4, 4, 50000),
(5, 5, 5, 3000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `polling station`
--
ALTER TABLE `polling station`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`);

--
-- Индексы таблицы `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `results_voteson_section`
--
ALTER TABLE `results_voteson_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_candidate` (`id_candidate`),
  ADD KEY `id_station` (`id_station`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `candidate`
--
ALTER TABLE `candidate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `polling station`
--
ALTER TABLE `polling station`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `region`
--
ALTER TABLE `region`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `results_voteson_section`
--
ALTER TABLE `results_voteson_section`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `polling station`
--
ALTER TABLE `polling station`
  ADD CONSTRAINT `polling station_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `results_voteson_section`
--
ALTER TABLE `results_voteson_section`
  ADD CONSTRAINT `results_voteson_section_ibfk_1` FOREIGN KEY (`id_candidate`) REFERENCES `candidate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `results_voteson_section_ibfk_2` FOREIGN KEY (`id_station`) REFERENCES `polling station` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
