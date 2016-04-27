-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-04-2016 a las 04:25:32
-- Versión del servidor: 10.0.23-MariaDB
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `dboauth`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('3ccf9593348bd39cc65191a86e37f571e0842869', 'admin', NULL, '2016-04-03 01:20:47', NULL),
('57f25dd26eb1a41616b4d3ebe0a1741b7dd960b6', 'admin', NULL, '2016-04-03 00:46:54', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `oauth_authorization_codes`
--

INSERT INTO `oauth_authorization_codes` (`authorization_code`, `client_id`, `user_id`, `redirect_uri`, `expires`, `scope`) VALUES
('a5107f73af6f2319dde4a9529aefc51525d92ca3', 'admin', NULL, NULL, '2016-04-27 04:22:56', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) DEFAULT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('admin', '123456', 'http://localhost/', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_jwt`
--

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('029ac9fa0b099c606b2e487cf87faebef93d4961', 'admin', NULL, '2016-04-17 00:20:47', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `id` int(11) UNSIGNED NOT NULL,
  `token` char(64) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`id`, `token`, `expires`, `created`, `state`) VALUES
(1, 'f286cb7d2688a11569f7c42ee3c6e072778116a4e93275dcd851059c7c6c1f78', NULL, '2016-04-02 17:17:18', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indices de la tabla `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indices de la tabla `oauth_jwt`
--
ALTER TABLE `oauth_jwt`
  ADD PRIMARY KEY (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indices de la tabla `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;