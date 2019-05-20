-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 20 2019 г., 18:06
-- Версия сервера: 5.6.41
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2basic`
--

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `Description` varchar(256) NOT NULL,
  `Pictures` blob NOT NULL,
  `Cost` float NOT NULL,
  `review_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `title`, `Description`, `Pictures`, `Cost`, `review_id`) VALUES
(1, 'Персональный компьютер', 'Для работы в офисных предложениях', 0x68747470733a2f2f7777772e696775696465732e72752f75706c6f61642f69626c6f636b2f3363322f33633237663538383064343762306362626133373433316663343931383932612e6a7067, 13000, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `description`) VALUES
(1, 'Домашние компьютера', 'компьютера для домашнего использования ');

-- --------------------------------------------------------

--
-- Структура таблицы `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `username` varchar(256) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `review_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_review`
--

INSERT INTO `product_review` (`id`, `date`, `username`, `user_email`, `review_text`) VALUES
(1, '2020-05-18 21:00:00', 'Иван', 'tets@gmail.com', 'Данный офисный компьютер подходит для решения офисных задача.'),
(2, '2020-05-18 21:00:00', 'Иван', 'tets@gmail.com', 'Данный офисный компьютер подходит для решения офисных задача.'),
(3, '2020-05-18 21:00:00', 'Иван4', 'tets@gmail.com', 'Не плохой ноутбук');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `review_id` (`review_id`);

--
-- Индексы таблицы `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_review` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
