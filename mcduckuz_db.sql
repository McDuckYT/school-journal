-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 06 2024 г., 21:03
-- Версия сервера: 10.5.24-MariaDB-cll-lve
-- Версия PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mcduckuz_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bookmark`
--

CREATE TABLE `bookmark` (
  `user_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `content_id`, `user_id`, `tutor_id`, `comment`, `date`) VALUES
('lEXNFYUjEuAE9oWywdaN', 'ls5P4c8N2OxSuRNR7dlP', 'PJyos1MoKeCUeA1nyMss', 'XvC11ThahZvAZOs9OYKg', 'wooow', '2024-04-15');

-- --------------------------------------------------------

--
-- Структура таблицы `contact`
--

CREATE TABLE `contact` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` int(10) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `content`
--

CREATE TABLE `content` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `video` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `content`
--

INSERT INTO `content` (`id`, `tutor_id`, `playlist_id`, `title`, `description`, `video`, `thumb`, `date`, `status`) VALUES
('ls5P4c8N2OxSuRNR7dlP', 'XvC11ThahZvAZOs9OYKg', 'to8y3kBzu0rK1KwVRrvd', '1223', '1234', '4PfE1BOKgIvibdr3h6sk.mov', 'sHFbq6bOicEuxyd6TNNt.png', '2024-04-13', 'active'),
('ExrFOrTM6EPrQM9GfFXD', 'uqHRwCZJyYu9KGDgorK0', 'IddX6ZZqojVRX4l4i0HV', 'fgagafs', 'gdfgdgdfg', 'ronpE69bUohZnNihmUkI.mp4', 'qKBJnwHPP58u4eGC7Sns.png', '2024-04-14', 'active');

-- --------------------------------------------------------

--
-- Структура таблицы `grades_math`
--

CREATE TABLE `grades_math` (
  `id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `grade` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `grades_math`
--

INSERT INTO `grades_math` (`id`, `student_id`, `subject`, `date`, `grade`) VALUES
(70, '123', '', '2024-04-02', '5'),
(71, '123', '', '2024-04-03', '5'),
(72, '123', '', '2024-04-04', '2'),
(73, '123', '', '2024-04-05', '5'),
(74, '1234', '', '2024-04-09', '5'),
(75, '123', '', '2024-04-07', '2'),
(76, '1234', '', '2024-04-04', '5'),
(77, '1234', '', '2024-04-05', '5'),
(78, '123', '', '2024-04-06', '2'),
(79, '1234', '', '2024-04-03', '5'),
(80, '123', '', '2024-04-01', '5'),
(81, '123', '', '2024-04-15', '2'),
(82, '1234', '', '2024-04-06', '5'),
(83, '1234', '', '2024-04-08', '5'),
(84, '123', '', '2024-04-08', '5'),
(85, '1234', '', '2024-04-07', '5'),
(86, '123', '', '2024-04-13', '2'),
(87, '123', '', '2024-04-09', '2'),
(88, '123', '', '2024-04-10', '2'),
(89, '1234', '', '2024-04-10', '5'),
(90, '12323', '', '2024-04-07', '5'),
(91, '1234', '', '2024-04-11', '5'),
(92, 'Z33Mtuzbr8wDaK4Z2N41', '', '2024-04-07', '5'),
(93, '12323', '', '2024-04-10', '5'),
(94, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-15', '5'),
(95, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-07', '2'),
(96, 'v4SXMaAxV5NTrP74XQT3', '', '2024-04-03', '4'),
(97, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-06', '4'),
(98, 'v4SXMaAxV5NTrP74XQT3', '', '2024-04-19', '5'),
(99, '12323', '', '2024-04-08', '5'),
(100, 'LJnEvlHNDUkwPLptzOt9', '', '2024-04-08', '5'),
(101, '2143', '', '2024-04-07', '4'),
(102, 'qRf5eWxBASVZ6cStaJT6', '', '2024-04-10', '4'),
(103, '12323', '', '2024-04-11', '2'),
(104, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-11', '2'),
(105, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-12', '5'),
(106, '12323', '', '2024-04-12', '5'),
(107, 'LJnEvlHNDUkwPLptzOt9', '', '2024-04-11', '3'),
(108, '2143', '', '2024-04-08', '2'),
(109, 'qRf5eWxBASVZ6cStaJT6', '', '2024-04-12', '5'),
(110, '2143', '', '2024-04-30', '3'),
(111, '12323', '', '2024-04-15', '5'),
(112, '12323', '', '2024-04-03', '4'),
(113, '1234', '', '2024-04-01', '5'),
(114, '1234', '', '2024-04-02', '5'),
(115, '123', '', '2024-04-30', '2'),
(116, '1234', '', '2024-04-30', '5'),
(117, '12323', '', '2024-04-16', '4'),
(118, '2143', '', '2024-04-10', '5'),
(119, '123', '', '2024-04-17', '4'),
(120, 'LJnEvlHNDUkwPLptzOt9', '', '2024-04-15', '4'),
(121, '12323', '', '2024-04-13', '5'),
(122, '12323', '', '2024-04-04', '2'),
(123, '2143', '', '2024-04-17', '2'),
(124, 'LJnEvlHNDUkwPLptzOt9', '', '2024-04-14', '5'),
(125, 'qRf5eWxBASVZ6cStaJT6', '', '2024-04-14', '5'),
(126, '12323', '', '2024-04-22', '5'),
(127, '2143', '', '2024-04-01', '5'),
(128, '12323', '', '2024-04-17', '2'),
(129, '12323', '', '2024-04-21', '2'),
(130, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-02', '5'),
(131, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-08', '2'),
(132, '123', '', '2024-04-14', '2'),
(133, '1234', '', '2024-04-17', '5'),
(134, '123', '', '2024-04-12', '2'),
(135, '123', '', '2024-04-18', '2'),
(136, '123', '', '2024-04-22', '2'),
(137, '123', '', '2024-04-26', '2'),
(138, '123', '', '2024-04-29', '2'),
(139, '1234', '', '2024-04-12', '5'),
(140, 'LJnEvlHNDUkwPLptzOt9', '', '2024-04-21', '5'),
(141, '12323', '', '2024-04-18', '5'),
(142, '2143', '', '2024-04-25', '5'),
(143, '123', '', '2024-04-20', '2'),
(144, '123', '', '2024-04-19', '2'),
(145, '1234', '', '2024-04-22', '5'),
(146, 'qRf5eWxBASVZ6cStaJT6', '', '2024-04-27', '5'),
(147, '12323', '', '2024-04-20', '5'),
(148, '2143', '', '2024-04-12', '2'),
(149, '123', '', '2024-04-23', '2'),
(150, '123', '', '2024-04-24', '2'),
(151, '2143', '', '2024-04-19', '3'),
(152, 'qRf5eWxBASVZ6cStaJT6', '', '2024-04-21', '4'),
(153, 'PJyos1MoKeCUeA1nyMss', '', '2024-04-14', '5'),
(154, 'PJyos1MoKeCUeA1nyMss', '', '2024-04-21', '3'),
(155, 'qRf5eWxBASVZ6cStaJT6', '', '2024-04-09', '5'),
(156, '12323', '', '2024-04-09', '5'),
(157, 'XGjPnsDAXOEXyJZHuftf', '', '2024-04-01', '3'),
(158, 'NuYB5ppVxlGMSwI1j5m0', '', '2024-04-01', '1'),
(159, 'NuYB5ppVxlGMSwI1j5m0', '', '2024-04-08', '5'),
(160, '1234', '', '2024-04-16', '5'),
(161, '2143', '', '2024-04-04', '1'),
(162, 'qRf5eWxBASVZ6cStaJT6', '', '2024-04-04', '5'),
(163, 'PJyos1MoKeCUeA1nyMss', '', '2024-04-16', '3');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`user_id`, `tutor_id`, `content_id`) VALUES
('qRf5eWxBASVZ6cStaJT6', 'uqHRwCZJyYu9KGDgorK0', 'ExrFOrTM6EPrQM9GfFXD'),
('NuYB5ppVxlGMSwI1j5m0', 'XvC11ThahZvAZOs9OYKg', 'ls5P4c8N2OxSuRNR7dlP');

-- --------------------------------------------------------

--
-- Структура таблицы `playlist`
--

CREATE TABLE `playlist` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `playlist`
--

INSERT INTO `playlist` (`id`, `tutor_id`, `title`, `description`, `thumb`, `date`, `status`) VALUES
('to8y3kBzu0rK1KwVRrvd', 'XvC11ThahZvAZOs9OYKg', '123', '123', 'mTPzD0OLxnixYzY3Hyur.png', '2024-04-13', 'active'),
('IddX6ZZqojVRX4l4i0HV', 'uqHRwCZJyYu9KGDgorK0', 'srfdfsfd', 'ssdfsdfsdfsdf', 'oFu0MJsnCO3sbRFboFfo.png', '2024-04-14', 'active'),
('WrmaEuqJoFz3qDdRsXza', '4dZmLDARO57d93ido8Ru', 'Math 1vtn1', 'Math homework', 'VT2WYnQrANnD881GD5HR.png', '2024-04-26', 'active');

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `tutors`
--

CREATE TABLE `tutors` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `tutors`
--

INSERT INTO `tutors` (`id`, `name`, `profession`, `email`, `password`, `image`) VALUES
('1', '1', 'tutor', '1@1', '1', '1'),
('XvC11ThahZvAZOs9OYKg', 'McDuck', 'developer', 'mcduckguitar@gmail.c', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'OluG6TRc8aE4FsRyPEuh.jpg'),
('uqHRwCZJyYu9KGDgorK0', 'Poly Factor', 'developer', 'marufbekmahammatov@g', 'd38fe7df7147ea4e09f339017ac159b2253c21ec', 'TpEdDnvGX69J1oBn7A1m.jpg'),
('4dZmLDARO57d93ido8Ru', 'mcfuck', 'teacher', 'mcfuck@gmail.com', '0e6d5f035eb98d30e813ab3c24530a171577fb07', 'hUjI6KCxRhzJxbpEk1Ag.jpg'),
('wKEYiAJ3qMe9l0AwT4sR', 'mcmc', 'teacher', 'mcmc@gmail.com', 'a946650c94ea8798eadf5da42941e0764a3956b2', '1m811m7BJ7umKNoVrvsS.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `group` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `group`, `email`, `password`, `image`) VALUES
('123', 'Саид', '1vtn1', 'aoao@aoao', '22841c84455a209585f7956eef471d86f8f421f1', 'aoao'),
('1234', 'Фариза', '1vtn1', 'fff@fff', '22841c84455a209585f7956eef471d86f8f421f1', 'fff'),
('XGjPnsDAXOEXyJZHuftf', 'Duck', '1vtn1', 'mcduckguitar@gmail.com', '22841c84455a209585f7956eef471d86f8f421f1', 'tUAvIY0iMBOL7lvgUGS1.jpg'),
('12323', 'Лев Толстой', '1vtn1', 'lev@gmail.com', '22841c84455a209585f7956eef471d86f8f421f1', 'aaa'),
('LJnEvlHNDUkwPLptzOt9', 'Aoaoao', '1vtn1', 'aoaoao@aoaoao', '22841c84455a209585f7956eef471d86f8f421f1', 'bhP5cM4okZs8xzwAYZkB.JPG'),
('2143', 'Ку-ка-ре-куу', '1vtn1', 'aaa@ooo', '22841c84455a209585f7956eef471d86f8f421f1', '111'),
('qRf5eWxBASVZ6cStaJT6', 'test', '1vtn1', 'test@test', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'L431gyGoUKgiUFmLMrHU.png'),
('PJyos1MoKeCUeA1nyMss', 'ssd', '1vtn1', '111@22222', '8cb2237d0679ca88db6464eac60da96345513964', 'SNhUJliIk28eAAtBiqR9.gif'),
('NuYB5ppVxlGMSwI1j5m0', 'gffg', '1vtn1', 'fgnbfg@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'f87RgqxQjRGGWJuHEYHm.jpg'),
('0r5HSSD7sdfbt0Cx6Ig1', 'Nuriddinov Nodirbek', '1vtn1', 'nodbek@gmail.com', '601f1889667efaebb33b8c12572835da3f027f78', '5Nts3YYlMqchDDr6tlxh.jfif');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `grades_math`
--
ALTER TABLE `grades_math`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `grades_math`
--
ALTER TABLE `grades_math`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
