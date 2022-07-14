-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 14 2022 г., 08:00
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `films`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actor`
--

CREATE TABLE `actor` (
  `ID_Actor` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `actor`
--

INSERT INTO `actor` (`ID_Actor`, `name`) VALUES
(7, 'Actor1'),
(8, 'Actor2'),
(9, 'Actor3'),
(10, 'Actor4'),
(11, 'Actor5'),
(12, 'Actor6'),
(13, 'Actor7');

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `ID_Film` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` date NOT NULL,
  `country` text NOT NULL,
  `quality` int(11) NOT NULL,
  `resolution` text NOT NULL,
  `codec` text NOT NULL,
  `producer` text NOT NULL,
  `director` text NOT NULL,
  `carrier` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`ID_Film`, `name`, `date`, `country`, `quality`, `resolution`, `codec`, `producer`, `director`, `carrier`) VALUES
(3, 'Film1', '2022-07-13', 'Country1', 5, '1080p', 'Codec1', 'Producer1', 'Director1', 'DVD'),
(4, 'Film2', '2022-07-12', 'Country2', 4, '1080p', 'Codec2', 'Producer2', 'Director1', 'CD'),
(5, 'Film3', '2022-06-22', 'Country3', 5, '1080p', 'Codec3', 'Producer1', 'Director2', 'Floppy'),
(6, 'Film4', '2022-07-28', 'Country4', 4, '1080p', 'Codec2', 'Producer2', 'Director2', 'DVD');

-- --------------------------------------------------------

--
-- Структура таблицы `film_actor`
--

CREATE TABLE `film_actor` (
  `FID_Film` int(11) NOT NULL,
  `FID_Actor` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `film_actor`
--

INSERT INTO `film_actor` (`FID_Film`, `FID_Actor`, `id`) VALUES
(3, 7, 7),
(3, 8, 8),
(3, 9, 9),
(3, 10, 10),
(4, 8, 11),
(3, 9, 12),
(4, 10, 13),
(4, 11, 14),
(5, 9, 15),
(5, 10, 16),
(5, 11, 17),
(5, 12, 18),
(6, 13, 19),
(6, 8, 20),
(6, 10, 21),
(6, 7, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `film_genre`
--

CREATE TABLE `film_genre` (
  `id` int(11) NOT NULL,
  `FID_Film` int(11) NOT NULL,
  `FID_Genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `film_genre`
--

INSERT INTO `film_genre` (`id`, `FID_Film`, `FID_Genre`) VALUES
(4, 3, 4),
(5, 4, 4),
(6, 5, 5),
(7, 6, 6),
(8, 3, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `ID_Genre` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`ID_Genre`, `title`) VALUES
(4, 'Genre1'),
(5, 'Genre2'),
(6, 'Genre3');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`ID_Actor`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`ID_Film`);

--
-- Индексы таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FID_Film` (`FID_Film`),
  ADD KEY `FID_Actor` (`FID_Actor`);

--
-- Индексы таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FID_Film` (`FID_Film`),
  ADD KEY `FID_Film_2` (`FID_Film`),
  ADD KEY `FID_Genre` (`FID_Genre`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID_Genre`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `actor`
--
ALTER TABLE `actor`
  MODIFY `ID_Actor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `ID_Film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `film_actor`
--
ALTER TABLE `film_actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `film_genre`
--
ALTER TABLE `film_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `ID_Genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `film_actor`
--
ALTER TABLE `film_actor`
  ADD CONSTRAINT `film_actor_ibfk_1` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_Film`),
  ADD CONSTRAINT `film_actor_ibfk_2` FOREIGN KEY (`FID_Actor`) REFERENCES `actor` (`ID_Actor`);

--
-- Ограничения внешнего ключа таблицы `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `film_genre_ibfk_1` FOREIGN KEY (`FID_Genre`) REFERENCES `genre` (`ID_Genre`),
  ADD CONSTRAINT `film_genre_ibfk_2` FOREIGN KEY (`FID_Film`) REFERENCES `film` (`ID_Film`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
