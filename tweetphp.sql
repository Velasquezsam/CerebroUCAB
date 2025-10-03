-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2025 a las 05:21:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tweetphp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(140) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `post_id`, `time`) VALUES
(1, 'Puedes usar photomath para resolverla', 2, 1, '2024-07-02 20:28:55'),
(22, 'si', 17, 2, '2024-07-02 23:57:14'),
(23, 'va', 17, 2, '2024-07-03 00:01:17'),
(24, 'si', 17, 2, '2024-07-03 00:10:20'),
(25, 'si', 8, 2, '2024-07-03 00:40:42'),
(26, 'hey', 8, 3, '2024-07-03 00:41:02'),
(27, 'si', 8, 3, '2024-07-03 00:42:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment_ratings`
--

CREATE TABLE `comment_ratings` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comment_ratings`
--

INSERT INTO `comment_ratings` (`id`, `comment_id`, `user_id`, `rating`) VALUES
(1, 1, 17, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `follow`
--

CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Volcado de datos para la tabla `follow`
--

INSERT INTO `follow` (`id`, `follower_id`, `following_id`, `time`) VALUES
(198, 2, 2, '2024-05-13 22:32:16'),
(200, 4, 2, '2024-06-01 22:04:09'),
(201, 2, 4, '2024-06-01 22:20:20'),
(206, 6, 2, '2024-06-09 20:18:30'),
(208, 6, 4, '2024-06-09 20:18:34'),
(209, 7, 2, '2024-06-10 04:01:22'),
(210, 8, 2, '2024-06-10 04:02:48'),
(211, 9, 2, '2024-06-11 03:32:29'),
(212, 9, 6, '2024-06-11 03:33:43'),
(213, 9, 8, '2024-06-11 03:33:44'),
(218, 10, 2, '2024-06-11 04:41:34'),
(219, 10, 6, '2024-06-11 04:41:37'),
(220, 10, 7, '2024-06-11 04:41:38'),
(221, 10, 8, '2024-06-11 04:41:38'),
(222, 10, 9, '2024-06-11 04:41:44'),
(223, 10, 4, '2024-06-11 04:41:45'),
(233, 11, 2, '2024-06-26 20:13:01'),
(234, 12, 2, '2024-06-26 20:23:15'),
(235, 13, 2, '2024-06-26 20:27:17'),
(236, 14, 2, '2024-06-26 20:37:23'),
(239, 17, 2, '2024-06-28 16:01:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notify_for` int(11) NOT NULL,
  `notify_from` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` enum('follow','like','retweet','qoute','comment','reply','mention') NOT NULL,
  `time` datetime NOT NULL,
  `count` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `notify_for`, `notify_from`, `target`, `type`, `time`, `count`, `status`) VALUES
(1, 17, 2, 1, 'comment', '2024-07-02 20:28:55', 1, 0),
(2, 2, 17, 1, 'like', '2024-07-02 20:29:02', 1, 0),
(3, 17, 2, 2, 'comment', '2024-07-02 20:31:51', 1, 0),
(4, 2, 17, 2, 'like', '2024-07-02 20:31:59', 1, 0),
(5, 2, 17, 2, 'like', '2024-07-02 22:21:05', 1, 0),
(6, 2, 17, 2, 'like', '2024-07-02 22:21:06', 1, 0),
(7, 2, 17, 2, 'like', '2024-07-02 22:21:08', 1, 0),
(8, 2, 17, 2, 'reply', '2024-07-02 22:25:06', 1, 0),
(9, 17, 2, 2, 'comment', '2024-07-02 22:28:36', 1, 0),
(10, 17, 2, 2, 'comment', '2024-07-02 22:28:42', 1, 0),
(11, 17, 2, 2, 'comment', '2024-07-02 22:28:53', 1, 0),
(12, 17, 2, 2, 'comment', '2024-07-02 22:38:37', 1, 0),
(13, 17, 2, 2, 'comment', '2024-07-02 23:00:32', 1, 0),
(14, 17, 2, 2, 'comment', '2024-07-02 23:00:34', 1, 0),
(15, 17, 2, 2, 'comment', '2024-07-02 23:00:36', 1, 0),
(16, 17, 2, 2, 'comment', '2024-07-02 23:01:02', 1, 0),
(17, 17, 2, 2, 'reply', '2024-07-02 23:13:51', 1, 0),
(18, 17, 2, 2, 'comment', '2024-07-02 23:16:09', 1, 0),
(19, 17, 2, 2, 'comment', '2024-07-02 23:26:00', 1, 0),
(20, 17, 2, 2, 'comment', '2024-07-02 23:28:10', 1, 0),
(21, 2, 17, 2, 'like', '2024-07-02 23:35:46', 1, 0),
(22, 2, 17, 2, 'reply', '2024-07-02 23:35:52', 1, 0),
(23, 17, 2, 2, 'comment', '2024-07-02 23:37:45', 1, 0),
(24, 17, 2, 2, 'reply', '2024-07-02 23:38:01', 1, 0),
(25, 2, 17, 2, 'reply', '2024-07-02 23:38:49', 1, 0),
(26, 17, 2, 2, 'like', '2024-07-02 23:38:56', 1, 0),
(27, 2, 17, 2, 'like', '2024-07-02 23:38:58', 1, 0),
(28, 17, 2, 2, 'comment', '2024-07-02 23:43:05', 1, 0),
(29, 17, 2, 2, 'comment', '2024-07-02 23:47:55', 1, 0),
(30, 17, 2, 2, 'comment', '2024-07-02 23:48:44', 1, 0),
(31, 17, 2, 2, 'like', '2024-07-02 23:48:56', 1, 0),
(32, 17, 2, 2, 'reply', '2024-07-02 23:49:09', 1, 0),
(33, 17, 2, 2, 'reply', '2024-07-02 23:49:30', 1, 0),
(34, 2, 17, 2, 'like', '2024-07-02 23:49:51', 1, 0),
(35, 2, 17, 2, 'like', '2024-07-02 23:49:51', 1, 0),
(36, 17, 2, 2, 'comment', '2024-07-02 23:50:28', 1, 0),
(37, 17, 8, 2, 'comment', '2024-07-03 00:40:42', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_on`) VALUES
(1, 17, '2024-07-02 20:28:03'),
(2, 17, '2024-07-02 20:31:25'),
(3, 8, '2024-07-03 00:40:50'),
(4, 8, '2024-07-03 00:50:48'),
(5, 8, '2024-07-03 00:50:53'),
(6, 8, '2024-07-03 00:51:02'),
(7, 2, '2024-07-23 16:43:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` varchar(140) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retweets`
--

CREATE TABLE `retweets` (
  `post_id` int(11) NOT NULL,
  `retweet_msg` varchar(140) DEFAULT NULL,
  `tweet_id` int(11) DEFAULT NULL,
  `retweet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trends`
--

CREATE TABLE `trends` (
  `id` int(11) NOT NULL,
  `hashtag` varchar(140) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tweets`
--

CREATE TABLE `tweets` (
  `post_id` int(11) NOT NULL,
  `status` varchar(140) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Volcado de datos para la tabla `tweets`
--

INSERT INTO `tweets` (`post_id`, `status`, `img`, `category`) VALUES
(1, 'Alguien sabe de aplicaciones que me puedan ayudar a resolver este problema?', 'question-66849b1309961.jpg', 'Académico'),
(2, 'Alguien esta libre mañana a las 2 para acompañarme a ver la feria del libro en la uni?', NULL, 'Social'),
(3, 'como sumo 2+2', NULL, 'Académico'),
(4, 'si', NULL, 'Académico'),
(5, 'no', NULL, 'Social'),
(6, 'wow', 'question-6685cb41730d3.png', 'Académico'),
(7, 'abe', 'question-66a015e39f8cf.jpg', 'Académico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(40) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT 'default.jpg',
  `imgCover` varchar(255) NOT NULL DEFAULT 'cover.png',
  `bio` varchar(140) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `website` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `img`, `imgCover`, `bio`, `location`, `website`) VALUES
(2, 'sevelasquez22', 'sevelasquez.22@est.ucab.edu.ve', '827ccb0eea8a706c4c34a16891f84e7b', 'Samuel V.', 'user-667c9ac4613a2.png', 'cover.png', 'Estudiante de ingenieria informatica', 'Caracas, Venezuela', '@sam'),
(4, 'DanielaaS01', 'ds11.danielasilva@gmail.com', '00c66aaf5f2c3f49946f15c1ad2ea0d3', 'Daniela Silva', 'default.jpg', 'cover.png', '', '', ''),
(6, 'jsilva', 'jsilv7@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Jesus Silva', 'default.jpg', 'cover.png', '', '', ''),
(7, 'andrea123', 'avmendoza.22@est.ucab.edu.ve', '827ccb0eea8a706c4c34a16891f84e7b', 'andrea', 'default.jpg', 'cover.png', '', '', ''),
(8, '1111', 'silva.22@est.ucab.edu.ve', '827ccb0eea8a706c4c34a16891f84e7b', 'a', 'user-667c9bb90929a.png', 'user-667c9bb90929f.jpg', '1', '3', 'samv'),
(9, 'RossM', 'rymedero.22@est.ucab.edu.ve', '827ccb0eea8a706c4c34a16891f84e7b', 'Rosxana Medero', 'default.jpg', 'cover.png', '', '', ''),
(10, 'brosal22', 'brosal2011@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'brizeida', 'default.jpg', 'cover.png', '', '', ''),
(11, 'B', 'ab@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'A', 'default.jpg', 'cover.png', '', '', ''),
(12, '2', 'prueba@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'prueba', 'default.jpg', 'cover.png', '', '', ''),
(13, '3', '3@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '1', 'default.jpg', 'cover.png', '', '', ''),
(14, 'y', 'y@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Fulanito Perez', 'default.jpg', 'cover.png', '', '', ''),
(17, 'dasilva22', 'dasilva.22@est.ucab.edu.ve', '827ccb0eea8a706c4c34a16891f84e7b', 'Daniela Silva', 'user-6684d9bdaf5b4.png', 'cover.png', 'Estudiante de ingenieria informatica', 'Caracas', '@dani');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificacion`
--

CREATE TABLE `verificacion` (
  `idverificacion` int(11) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `codigo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `verificacion`
--

INSERT INTO `verificacion` (`idverificacion`, `correo`, `codigo`) VALUES
(6, 'dasilva.22@est.ucab.edu.ve', '9872');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `comment_ratings`
--
ALTER TABLE `comment_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `following_id` (`following_id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `likes_ibfk_2` (`post_id`);

--
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_ibfk_1` (`notify_for`),
  ADD KEY `notifications_ibfk_2` (`notify_from`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `retweets`
--
ALTER TABLE `retweets`
  ADD PRIMARY KEY (`post_id`) USING BTREE,
  ADD KEY `retweet_id` (`retweet_id`),
  ADD KEY `retweets_ibfk_2` (`tweet_id`);

--
-- Indices de la tabla `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indices de la tabla `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`post_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `verificacion`
--
ALTER TABLE `verificacion`
  ADD PRIMARY KEY (`idverificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `comment_ratings`
--
ALTER TABLE `comment_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `trends`
--
ALTER TABLE `trends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `verificacion`
--
ALTER TABLE `verificacion`
  MODIFY `idverificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comment_ratings`
--
ALTER TABLE `comment_ratings`
  ADD CONSTRAINT `comment_ratings_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  ADD CONSTRAINT `comment_ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes2` FOREIGN KEY (`post_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notify_for`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notify_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `retweets`
--
ALTER TABLE `retweets`
  ADD CONSTRAINT `retweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_3` FOREIGN KEY (`retweet_id`) REFERENCES `retweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
