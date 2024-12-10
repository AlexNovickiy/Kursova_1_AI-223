-- phpMyAdmin SQL Dump
-- https://www.phpmyadmin.net/
-- Хост: localhost

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `dinamic-site`
--

-- --------------------------------------------------------

--
-- Структура таблиці `comments`
--

CREATE TABLE `comments` (
  `id` int(12) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `page` int(10) NOT NULL,
  `email` varchar(110) NOT NULL,
  `comment` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `comments`
--

INSERT INTO `comments` (`id`, `status`, `page`, `email`, `comment`, `created_date`) VALUES
(2, 1, 27, 'adept78@gmail.com', '<p>. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sit amet massa feugiat, cursus orci vitae, eleifend urna. Fusce non ultrices felis.Nunc fermentum malesuada lacinia. Etiam sed lectus ut leo tincidunt porttitor sit amet at velit. Morbi mollis justo sit amet finibus auctor. Etiam rutrum scelerisque felis a ullamcorper</p>', '2024-11-27 20:25:33'),
(3, 1, 26, 'abc2@gmail.com', ' PHP (Hypertext Preprocessor) — це популярна мова програмування для створення динамічних веб-сторінок та серверних додатків.', '2024-11-27 20:30:17'),
(6, 1, 24, 'test1@gmail.com', '<p> PHP легко інтегрується з HTML, що робить його зручним для розробників веб-додатків.</p>', '2024-11-27 20:45:50'),
(7, 1, 24, 'test1@gmail.com', ' Вона використовується для інтеграції баз даних, обробки форм, управління сесіями та багатьох інших задач.', '2024-11-28 07:25:30'),
(8, 1, 20, 'test1@gmail.com', '<p>Блог створено студентом AI-223 , Новицький О.М. з метою навчання</p><p>22222222</p>', '2024-11-28 10:14:34'),
(10, 1, 22, 'adept78@gmail.com', 'Його популярність зросла завдяки таким платформам, як WordPress, які базуються на PHP.', '2024-11-28 11:05:27'),
(11, 1, 20, 'test2@gmail.com', '<p> Мова підтримує безліч фреймворків, наприклад, Laravel, Symfony та CodeIgniter</p>', '2024-11-28 12:05:50'),
(12, 0, 20, 'test2@gmail.com', 'Крім того, PHP має вбудовану підтримку для роботи з базами даних, такими як MySQL, PostgreSQL, SQLite та багатьма іншими', '2024-11-28 12:07:13'),
(13, 0, 20, 'test2@gmail.com', 'Не забувайте, що PHP також підтримує роботу з файлами, обробку форм,  аутентифікацію користувачів та багато інших функцій, ', '2024-11-28 13:29:39'),
(14, 0, 20, 'test2@gmail.com', 'PHP має спеціальні методи, як-от __construct, __destruct, __get, __set, які спрощують роботу з об''єктами.', '2024-11-28 13:45:51');

-- --------------------------------------------------------

--
-- Структура таблиці `doc`
--

CREATE TABLE `doc` (
  `id` int(12) NOT NULL,
  `title` varchar(125) NOT NULL,
  `content` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `doc`
--

INSERT INTO `doc` (`id`, `title`, `content`, `created`) VALUES
(1, 'Тест1', '<p>Перший</p><h1>Ut viverra, magna nec semper tristique</h1><p>Donec convallis ligula</p><p>interdum vulputate</p><ul><li>abc</li><li>turpis</li><li>bibendum</li></ul><p> ligula </p><ol><li>lorem </li><li>Nam<ol><li>Maecenas </li><li>tortor</li></ol></li><li>Maecenas </li><li>Donec</li></ol>', '2024-11-29 19:41:10'),
(2, 'Тест2', '<p>Другий</p>', '2024-11-29 19:45:43'),
(3, 'Тест3', '<h2>Третій</h2><p>bibendum</p><ul><li>список</li><li>второй пункт списка<ul><li>подсписок</li><li>подсписок-2</li></ul></li></ul>', '2024-11-29 21:10:23'),
(4, 'Тест4', '<p>Четвертий</p>', '2024-11-29 22:10:31');

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `id` int(12) NOT NULL,
  `id_user` int(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `id_topic` int(12) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `title`, `img`, `content`, `status`, `id_topic`, `created_date`) VALUES
(20, 50, 'PHP або Django?', '1620237923_test1.jpg', '<p>Вибір між PHP і Django (фреймворком для Python) залежить від кількох факторів, таких як вимоги проєкту, ваші знання, та екосистема, у якій плануєте працювати.</p>', 1, 15, '2024-11-29 23:11:44'),
(21, 50, 'Як вам дається ООП в PHP?', '1620237940_test1.jpg', '<p>Об''єктно-орієнтоване програмування (ООП) у PHP реалізовано досить гнучко та доступно</p>', 1, 15, '2024-11-29 23:15:21'),
(22, 50, 'Потрібний матеріал по:', '1620377595_test1.jpg', '<p>Третій</p>', 1, 18, '2024-11-29 23:30:25'),
(23, 50, 'Вирішення складних завдань', '1620239962_second.png', '<p>При вирішенні складних завдань важко помістити рішення в один запит.</p><p>фф</p><p>При вирішенні складних завдань важко помістити рішення в один запит</p>', 1, 15, '2024-11-29 23:15:51'),
(24, 50, '15 корисних команд', '1620374705_PostgreSQL.png', '<p>У мережі багато посібників з PostgreSQL, які описують основні команди. Але занурення глибше у роботу виникають такі практичні питання, котрим потрібні просунуті команди.</p><p>Команди рідко записані у документації</p>', 1, 18, '2024-11-29 23:20:19'),
(26, 51, 'Test user commit', '1621268311_test1.jpg', '<p>Donec convallis ligula at lorem interdum vulputate.<br><br>Donec convallis ligula at lorem interdum vulputate.<br><br>abc</p><h2>bibendum</h2><p><br> Sed tincidunt tempor.<br><br>ewewew<br><br>&adipiscing</p><ul><li>massa</li><li>Suspendisse quis</li><li>Suspendisse quis</li></ul><p><br>Suspendisse quis</p><ul><li>Suspendisse quis</li><li>Suspendisse quis</li><li>lacinia egestas</li></ul><p><br>lacinia egestas</p><ul><li>lacinia egestas</li><li>lacinia egestas</li><li>lacinia egestas</li><li>&nbsp;</li></ul>', 1, 17, '2024-11-29 23:24:20'),
(27, 50, 'Нова стаття', '1621881949_second.png', '<p> dolor sit amet, consectetur adipiscing elit<br>Ut sed risus placerat risus convallis</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare massa eget egestas purus. Nunc consequat interdum varius sit amet mattis vulputate enim. Nunc mi ipsum faucibus vitae aliquet nec. Arcu odio ut sem nulla pharetra diam sit. Ultricies lacus sed turpis tincidunt id aliquet risus. Sit amet est placerat in egestas. Erat pellentesque adipiscing commodo elit at. Quis commodo odio aenean sed. Proin libero nunc consequat interdum varius.</p><p>At volutpat diam ut venenatis tellus. Sit amet volutpat consequat mauris nunc congue nisi vitae suscipit. Nisi est sit amet facilisis magna etiam tempor. Interdum velit euismod in pellentesque massa placerat. Ut morbi tincidunt augue interdum velit euismod. Sed elementum tempus egestas sed. Scelerisque in dictum non consectetur a erat. Sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque eu. Habitant morbi tristique senectus et. At consectetur lorem donec massa sapien faucibus et. Praesent tristique magna sit amet. Enim ut tellus elementum sagittis vitae et leo. Elit pellentesque habitant morbi tristique senectus. Mauris pharetra et ultrices neque ornare aenean euismod elementum nisi.</p><p>Mi bibendum neque egestas congue quisque egestas diam. Vitae tortor condimentum lacinia quis vel eros donec ac. At erat pellentesque adipiscing commodo elit at. Consectetur a erat nam at lectus urna duis convallis. Rhoncus est pellentesque elit ullamcorper dignissim. Non nisi est sit amet facilisis. Tellus orci ac auctor augue mauris augue neque gravida. Ornare aenean euismod elementum nisi quis eleifend quam adipiscing vitae. Mattis enim ut tellus elementum sagittis vitae et. Nec tincidunt praesent semper feugiat. Lacus vel facilisis volutpat est. Fringilla ut morbi tincidunt augue. Condimentum mattis pellentesque id nibh tortor id aliquet lectus proin. Suspendisse interdum consectetur libero id faucibus. Ut diam quam nulla porttitor massa. Sit amet facilisis magna etiam tempor orci. Aenean et tortor at risus. At consectetur lorem donec massa sapien faucibus. Risus feugiat in ante metus dictum at. Ultrices neque ornare aenean euismod.</p>', 1, 17, '2024-11-29 23:30:46');

-- --------------------------------------------------------

--
-- Структура таблиці `topics`
--

CREATE TABLE `topics` (
  `id` int(12) NOT NULL,
  `name` varchar(121) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `topics`
--

INSERT INTO `topics` (`id`, `name`, `description`) VALUES
(15, 'php', 'about php'),
(16, 'uncategory', '...'),
(17, 'IT', 'Життя з IT'),
(18, 'Top', 'Категорія для  статей ');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created`) VALUES
(50, 1, 'Alex', 'novickiisasha78@gmail.com', '$2y$10$mkpLBHXIXJbVcy3N/NJdieHK.JWezPbul4VeMh/malzOO/Ug9IKf2', '2024-11-29 23:44:34'),
(51, 1, 'test1', 'abc@gmail.com', '$2y$10$bsx9bl2pS0sNvBDXLI5ksOyHd8CiXU54FhSNyrevwHksMPB.aistG', '2024-11-29 23:44:34'),
(52, 0, 'test2', 'ert123@gmail.com', '$2y$10$QnMnaL.Uzbi77Y3XaFA1MeofmCh8M31fMCvahekLt0dPBP7twpeq2', '2024-11-29 23:44:34');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `doc`
--
ALTER TABLE `doc`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_topic` (`id_topic`);

--
-- Індекси таблиці `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `doc`
--
ALTER TABLE `doc`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблиці `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_topic`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
