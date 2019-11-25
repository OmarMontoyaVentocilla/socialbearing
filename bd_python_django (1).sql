-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2019 a las 01:26:21
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_python_django`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add auto', 7, 'add_auto'),
(20, 'Can change auto', 7, 'change_auto'),
(21, 'Can delete auto', 7, 'delete_auto'),
(22, 'Can add facebook', 8, 'add_facebook'),
(23, 'Can change facebook', 8, 'change_facebook'),
(24, 'Can delete facebook', 8, 'delete_facebook'),
(25, 'Can add github', 9, 'add_github'),
(26, 'Can change github', 9, 'change_github'),
(27, 'Can delete github', 9, 'delete_github'),
(28, 'Can add google', 10, 'add_google'),
(29, 'Can change google', 10, 'change_google'),
(30, 'Can delete google', 10, 'delete_google'),
(31, 'Can add instagram', 11, 'add_instagram'),
(32, 'Can change instagram', 11, 'change_instagram'),
(33, 'Can delete instagram', 11, 'delete_instagram'),
(34, 'Can add persona redes', 12, 'add_personaredes'),
(35, 'Can change persona redes', 12, 'change_personaredes'),
(36, 'Can delete persona redes', 12, 'delete_personaredes'),
(37, 'Can add twitter', 13, 'add_twitter'),
(38, 'Can change twitter', 13, 'change_twitter'),
(39, 'Can delete twitter', 13, 'delete_twitter'),
(40, 'Can add persona', 14, 'add_persona'),
(41, 'Can change persona', 14, 'change_persona'),
(42, 'Can delete persona', 14, 'delete_persona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$100000$KhQw1TNh1fuA$4cNNkaBHCUeaZtAMTyPvi5awuKKt8ngnm0HMEW4BKqQ=', '2018-09-05 02:53:29.883285', 1, 'omar', 'montoya', 'casafranca', 'omarx372@hotmail.com', 1, 1, '2018-07-28 00:33:29.193935'),
(2, 'pbkdf2_sha256$100000$KVnYQNP88idu$7UUXIiGoFBpBFPwIcKbzunE0q0nHg8tJr7Xw+wzpf+c=', NULL, 1, 'lili', 'vilca', 'casafranca', 'lili@hotmail.com', 1, 1, '2018-07-28 00:34:16.982751'),
(3, 'pbkdf2_sha256$100000$sgvO8RwjuSUT$dLYnAIlUn9xiuM3h6at8VhN2ofC6uRrDT2PqQll3s5Q=', '2018-10-16 21:26:14.632726', 1, 'omarx372', 'montoya', 'casafranca', 'ommm@hotmail.com', 1, 1, '2018-10-16 18:14:45.280218'),
(6, 'pbkdf2_sha256$100000$BhjTEednVA3S$nq7QIKbxbshFJ0EA/Wk7hbKg0iPtM3iTgZZMVyexNMU=', NULL, 1, 'juan', 'montoya', 'ventocilla', 'juan123@hotmail.com', 1, 1, '2018-10-17 01:39:59.000000'),
(7, 'pbkdf2_sha256$100000$jKRPpXqMRR6u$q0OniS+/b3ACmdLB3A/2+F/IABio8FV/+EHCYoVqYls=', NULL, 0, 'tytyty1212', 'sfsdfsdf', 'sfsdfsdfsdfds', 'afafafafasf@hotmail.com', 0, 1, '2018-10-17 01:56:21.857953'),
(8, 'pbkdf2_sha256$100000$euvrP4qirXRy$bn/jggzBrdqMnXJcLrMUXET30k6JyuhpuLnLL6FOTyM=', '2019-10-27 03:35:57.625326', 1, 'admin', '', '', '', 1, 1, '2019-10-27 03:35:56.429516'),
(9, 'pbkdf2_sha256$100000$XJFfhP074Zrd$E8eQAXaCYlfe2OZ+wyK27DOp3iP/db7ifhjQ3oE2NVA=', '2019-11-04 05:52:42.092099', 1, 'admin1', '', '', '', 1, 1, '2019-10-27 05:50:31.628020'),
(10, 'pbkdf2_sha256$100000$71ybHKlivBbF$oKJXG4Ajy/5sLf02tften8kRJb8m/ap63BaWl2hnWkY=', '2019-11-11 00:08:52.868034', 1, 'admin3', '', '', '', 1, 1, '2019-11-11 00:08:50.544487'),
(11, 'pbkdf2_sha256$100000$Qqu1ViC111ev$5wFqWTXHiOsGfJx9ECcc7vKL5vq/To6yXEFtscgW3t4=', '2019-11-16 18:04:15.704352', 0, 'admin4', '', '', '', 0, 1, '2019-11-16 18:03:22.428496'),
(12, 'pbkdf2_sha256$100000$Gs2ttPSKVjbj$UiIePple1naolYTVS7gbMiUgn83R6YSWQZ4NF9rc9Bo=', '2019-11-24 16:34:37.839225', 0, 'sac', '', '', '', 0, 1, '2019-11-24 16:33:27.223558');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-10-27 06:01:52.539201', '6', 'juan', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 4, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'persona', 'persona'),
(7, 'search', 'auto'),
(8, 'search', 'facebook'),
(9, 'search', 'github'),
(10, 'search', 'google'),
(11, 'search', 'instagram'),
(12, 'search', 'personaredes'),
(13, 'search', 'twitter'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-07-28 00:11:44.594860'),
(2, 'auth', '0001_initial', '2018-07-28 00:12:06.779918'),
(3, 'admin', '0001_initial', '2018-07-28 00:12:09.410808'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-07-28 00:12:09.498806'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-07-28 00:12:11.402985'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-07-28 00:12:13.323152'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-07-28 00:12:15.610604'),
(8, 'auth', '0004_alter_user_username_opts', '2018-07-28 00:12:15.774676'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-07-28 00:12:16.802704'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-07-28 00:12:16.966704'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-07-28 00:12:17.066705'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-07-28 00:12:19.291107'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2018-07-28 00:12:20.835209'),
(14, 'persona', '0001_initial', '2018-07-28 00:12:21.447834'),
(15, 'persona', '0002_auto_20180525_1903', '2018-07-28 00:12:23.123308'),
(16, 'search', '0001_initial', '2018-07-28 00:12:38.546567'),
(17, 'sessions', '0001_initial', '2018-07-28 00:12:39.450587'),
(18, 'search', '0002_auto_20181017_0058', '2018-10-17 05:58:37.245231');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9nd31cp72antmxy33611x7r5nlua26r5', 'OWI0YTM3YzdjYjQ5MTExMjliNWJmNWM0NDE2MjM4N2E4OWNiZDljOTp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjdjMzNmNjM3MGYwY2FmZmQyMWMxZGE4YzRiMTY4ZGI4MjY1NDY1OCIsImlkX3VzZXIiOjEyfQ==', '2019-12-08 16:34:37.900270');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_persona`
--

CREATE TABLE `persona_persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apodo` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `tiempo_registro` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona_persona`
--

INSERT INTO `persona_persona` (`id`, `nombre`, `apodo`, `estado`, `tiempo_registro`) VALUES
(1, 'omar anthony montoya ventocilla', 'camarada', '1', '2018-07-28 00:47:26.991306'),
(2, 'liliana ventocilla casafranca', 'huevca', '1', '2018-07-28 00:47:52.135811'),
(3, 'juan', 'camotes', '1', '2019-10-27 05:44:28.768716');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_auto`
--

CREATE TABLE `search_auto` (
  `id` int(11) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `descripcion_vida` longtext NOT NULL,
  `edad` int(11) NOT NULL,
  `tiempo_registro` datetime(6) NOT NULL,
  `cantidad_dinero` decimal(5,2) NOT NULL,
  `thumb` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_facebook`
--

CREATE TABLE `search_facebook` (
  `id` int(11) NOT NULL,
  `idfb` varchar(17) DEFAULT NULL,
  `nombres` varchar(100) NOT NULL,
  `biografia` longtext NOT NULL,
  `foto` longtext NOT NULL,
  `url` longtext NOT NULL,
  `trabajo` varchar(300) NOT NULL,
  `lugar` varchar(300) NOT NULL,
  `estudio` varchar(300) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `search_facebook`
--

INSERT INTO `search_facebook` (`id`, `idfb`, `nombres`, `biografia`, `foto`, `url`, `trabajo`, `lugar`, `estudio`, `estado`) VALUES
(1, '100011847034554', 'Omar Cherkaoui', 'No existe biografia', 'https://graph.facebook.com/100011847034554/picture?type=large', 'https://www.facebook.com/cherkom.1971', 'No existe empleo', 'Rabat', 'No existe estudios', '1'),
(2, '100005465018106', 'Omar Chaparro', 'No todo en la vida es trabajar, pero se requiere trabajar para tenerlo todo en la vida', 'https://graph.facebook.com/100005465018106/picture?type=large', 'https://www.facebook.com/OfficialOmarChaparro', 'Fundación Televisa', 'Ciudad de México', 'Administracion de Empresas', '1'),
(3, '691586590', 'Omar Ceballos Moreno', 'No hay información adicional para mostrar', 'https://graph.facebook.com/691586590/picture?type=large', 'https://www.facebook.com/omar.ceballosmoreno', 'Independiente,Profesor De Taekwondo', 'Zapotiltic', 'Instituto Tecnológico de Ciudad Guzmán,Nezahualcóyotl,nezahualcoyolt', '1'),
(4, '100001600991606', 'Omar Galvan', 'Instagram: Omar_galvan  Twitter: @omarrgalvan  Snapchat: Omar.galvan', 'https://graph.facebook.com/100001600991606/picture?type=large', 'https://www.facebook.com/omar.galvanagaton', 'New Icon Model Management,Omar Galvan', 'Ciudad de México', 'No existe estudios', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_github`
--

CREATE TABLE `search_github` (
  `id` int(11) NOT NULL,
  `biografia_github` longtext NOT NULL,
  `email_github` varchar(100) NOT NULL,
  `img_github` varchar(250) NOT NULL,
  `nick_github` varchar(100) NOT NULL,
  `nombre_github` varchar(150) NOT NULL,
  `pagina_github` longtext NOT NULL,
  `pais_github` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `search_github`
--

INSERT INTO `search_github` (`id`, `biografia_github`, `email_github`, `img_github`, `nick_github`, `nombre_github`, `pagina_github`, `pais_github`, `estado`) VALUES
(1, 'No existe biografia', 'omar@users.noreply.github.com', 'https://avatars3.githubusercontent.com/u/196368?s=96&v=4', 'https://github.com/omar', 'Omar Khudeira', 'http://omar.io', 'Chicago, IL', '1'),
(2, 'No existe biografia', 'oswald.hurlem@gmail.com', 'https://avatars1.githubusercontent.com/u/8225057?s=96&v=4', 'https://github.com/ocornut', 'omar', 'http://www.miracleworld.net', 'Paris, France', '1'),
(3, '????????????? WWDC18 scholar \r\n???? mobile developer \r\n???? lifelong learner \r\n??????????????????? dad and husband', 'omaralbeik@gmail.com', 'https://avatars0.githubusercontent.com/u/8127757?s=96&v=4', 'https://github.com/omaralbeik', 'Omar Albeik', 'https://omaralbeik.com', 'Istanbul, Turkey', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_google`
--

CREATE TABLE `search_google` (
  `id` int(11) NOT NULL,
  `nombre_google` varchar(150) NOT NULL,
  `url_google` longtext NOT NULL,
  `img_google` longtext NOT NULL,
  `info_google` longtext NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `search_google`
--

INSERT INTO `search_google` (`id`, `nombre_google`, `url_google`, `img_google`, `info_google`, `estado`) VALUES
(1, 'Mohamed Omar', 'https://plus.google.com/113893176200134039740', 'https://lh3.googleusercontent.com/-sdiTTog_UiI/AAAAAAAAAAI/AAAAAAABjeY/lDI3WPacodI/s90-p-k-no/photo.jpg', 'Media Partnerships Consultant @TwitterMENA | Formerly managed @FilFan @CinemaGuide #LoveWhereYouWork ?? #OneTeam???? #HeForShe????', '1'),
(2, 'Omar Castaneda', 'https://plus.google.com/110071724989580113044', 'https://lh3.googleusercontent.com/--ecFSjIZztc/AAAAAAAAAAI/AAAAAAAACcs/FYhjQxO_ucs/s90-p-k-no/photo.jpg', 'Educación, Tecnología, Software, Social Media y mas...', '1'),
(3, 'Omar Loisel', 'https://plus.google.com/104130498407390053503', 'https://lh3.googleusercontent.com/-qdr7JQSnqUM/AAAAAAAAAAI/AAAAAAABECw/75J6FOHvhuk/s90-p-k-no/photo.jpg', 'Amateur astronomy, cosmology, astrophysics and physics in general, music, film, photography, painting, sports and many other things - Amateur d\'astronomie, de cosmologie, d\'astrophysique et de physique en général, de musique, de cinéma, de photo, de peinture, de sport ainsi que de beaucoup d\'autres choses', '1'),
(4, 'Omar Ha-Redeye', 'https://plus.google.com/110664384410751586450', 'https://lh3.googleusercontent.com/-hj6d6LsCCK4/AAAAAAAAAAI/AAAAAAAADAI/bTHqiYfZ5qM/s90-p-k-no/photo.jpg', 'Toronto Lawyer', '1'),
(5, 'Omar Arnaout', 'https://plus.google.com/113126694032371300875', 'https://lh3.googleusercontent.com/-nbSW6vprkwk/AAAAAAAAAAI/AAAAAAAADAY/XXyvc3VTCWc/s90-p-k-no/photo.jpg', 'Omar Arnaout ', '1'),
(6, 'Omar Hernández Photography', 'https://plus.google.com/111209214525830037701', 'https://lh3.googleusercontent.com/-zgrUnQmq0j0/AAAAAAAAAAI/AAAAAAAAYWw/_KppBbDEZ3M/s90-p-k-no/photo.jpg', 'No hay info', '1'),
(7, 'Omar El-Shenety (???? ?????????)', 'https://plus.google.com/109945873073491065993', 'https://lh3.googleusercontent.com/-5SwGu-WZKzA/AAAAAAAAAAI/AAAAAAAALUc/aE8-5MEXxw0/s90-p-k-no/photo.jpg', 'Belief, Patience & Persistence...', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_instagram`
--

CREATE TABLE `search_instagram` (
  `id` int(11) NOT NULL,
  `nombre_instagram` longtext NOT NULL,
  `usuario_instagram` varchar(150) NOT NULL,
  `url_instagram` varchar(250) NOT NULL,
  `foto_instagram` varchar(280) NOT NULL,
  `seguidores_instagram` varchar(150) NOT NULL,
  `post_instagram` varchar(150) NOT NULL,
  `siguiendo_instagram` varchar(150) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `search_instagram`
--

INSERT INTO `search_instagram` (`id`, `nombre_instagram`, `usuario_instagram`, `url_instagram`, `foto_instagram`, `seguidores_instagram`, `post_instagram`, `siguiendo_instagram`, `estado`) VALUES
(1, '??Omarion ??', 'omarion', 'https://www.instagram.com/omarion/', 'https://scontent-iad3-1.cdninstagram.com/vp/3596b9b15026617a227c61ff7209762b/5C134CC2/t51.2885-19/s150x150/26872097_808287556044886_2256255726290731008_n.jpg', '3,305,404', '446', '213', '1'),
(2, '??? ????? ????', 'omarbelmir', 'https://www.instagram.com/omarbelmir/', 'https://scontent-iad3-1.cdninstagram.com/vp/d914486a009bb4578d536045d0e5ed5d/5BDC893F/t51.2885-19/s150x150/37422274_2166004697017912_1447461389579845632_n.jpg', '2,186,857', '1,364', '74', '1'),
(3, 'Omarov Kurban', 'zimamoscow', 'https://www.instagram.com/zimamoscow/', 'https://scontent-iad3-1.cdninstagram.com/vp/d1220be760fbecb0ead9cbb108c9db07/5BEFF28F/t51.2885-19/s150x150/28753349_177380073067987_2038803104052281344_n.jpg', '1,945,642', '1,839', '85', '1'),
(4, 'Omar', 'omarayuso', 'https://www.instagram.com/omarayuso/', 'https://scontent-iad3-1.cdninstagram.com/vp/694b3618d87e629d3001f79096a90097/5C48B52F/t51.2885-19/s150x150/41955934_1104536126389228_453734759059685376_n.jpg', '381,546', '95', '632', '1'),
(5, 'Omar', 'tanomarr', 'https://www.instagram.com/tanomarr/', 'https://scontent-iad3-1.cdninstagram.com/vp/113b15a69d64b3f9557629d7dbc6d16a/5C4F05E1/t51.2885-19/s150x150/34706125_910797482425728_248603839647711232_n.jpg', '28,135', '39', '32', '1'),
(6, 'Omar', 'oamaz7', 'https://www.instagram.com/oamaz7/', 'https://scontent-iad3-1.cdninstagram.com/vp/d9d00bbb283feeebd16644abd3a63cbe/5C4E1C11/t51.2885-19/11909382_876781989069353_214738425_a.jpg', '13,921', '44', '52', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_personaredes`
--

CREATE TABLE `search_personaredes` (
  `id` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `idfb_id` int(11) DEFAULT NULL,
  `idgithub_id` int(11) DEFAULT NULL,
  `idgoogle_id` int(11) DEFAULT NULL,
  `idinstagram_id` int(11) DEFAULT NULL,
  `idpersona_id` int(11) NOT NULL,
  `idtw_id` int(11) DEFAULT NULL,
  `idusuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `search_personaredes`
--

INSERT INTO `search_personaredes` (`id`, `estado`, `idfb_id`, `idgithub_id`, `idgoogle_id`, `idinstagram_id`, `idpersona_id`, `idtw_id`, `idusuario_id`) VALUES
(1, '1', 2, 1, 3, 2, 1, 3, 1),
(2, '1', 2, 1, 3, 3, 1, 3, 1),
(3, '1', 3, 1, 3, 3, 1, 4, 1),
(4, '1', 3, 1, 3, 3, 2, 4, 1),
(5, '1', 2, 2, 3, 2, 2, 6, 1),
(6, '1', 2, 2, 2, 2, 2, 6, 1),
(7, '1', 1, 2, 2, 2, 2, 6, 1),
(8, '1', 1, 2, 2, 3, 2, 6, 1),
(9, '1', 4, 2, 2, 3, 2, 6, 1),
(10, '1', 2, 2, 3, 3, 1, 4, 1),
(11, '0', 2, 1, 3, 1, 1, 3, 3),
(12, '1', 2, 1, 3, 3, 1, 4, 3),
(13, '1', 1, 2, 4, 5, 1, 3, 3),
(14, '1', NULL, 2, 5, 4, 1, 3, 3),
(15, '0', 1, NULL, NULL, NULL, 1, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `search_twitter`
--

CREATE TABLE `search_twitter` (
  `id` int(11) NOT NULL,
  `inicio_tw` varchar(100) NOT NULL,
  `cant_tw` varchar(50) NOT NULL,
  `url` longtext NOT NULL,
  `img_tw` longtext NOT NULL,
  `nombre_tw` varchar(50) NOT NULL,
  `nombre_cuenta_tw` varchar(150) NOT NULL,
  `pagina_web` longtext NOT NULL,
  `biografia` longtext NOT NULL,
  `seguidores` varchar(50) NOT NULL,
  `siguiendo` varchar(50) NOT NULL,
  `tweets` varchar(50) NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `likes` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `search_twitter`
--

INSERT INTO `search_twitter` (`id`, `inicio_tw`, `cant_tw`, `url`, `img_tw`, `nombre_tw`, `nombre_cuenta_tw`, `pagina_web`, `biografia`, `seguidores`, `siguiendo`, `tweets`, `ubicacion`, `likes`, `estado`) VALUES
(1, 'Se unió en febrero de 2010', '21', 'https://twitter.com/LuisOmarTapia', 'https://pbs.twimg.com/profile_images/1021441165386711043/MZHg0iS8_bigger.jpg', '@LuisOmarTapia', '\n      Luis Omar Tapia', 'http://www.deportes.univision.com', 'Comienzan 90 Minutos del deporte más hermoso del mundo\n24 años de #UCL . @univisionsports . \nFB: LuisOmarTapiaOFICIAL. \nIG: LuisOmarTapia.', '747 mil', '4.603', '42,6 mil', 'Ninguna', '564', '1'),
(2, 'Se unió en marzo de 2013', '20', 'https://twitter.com/OmarSy', 'https://pbs.twimg.com/profile_images/901205210902745089/uGtqyqg3_bigger.jpg', '@OmarSy', '\n      Omar Sy', 'http://www.facebook.com/OmarSy.fans', 'Actor - Producer / IG : @OmarSyOfficial', '3,02 M', '379', '8.134', 'Ninguna', '9.768', '1'),
(3, 'Se unió en agosto de 2011', '20', 'https://twitter.com/OmarChehadeMoya', 'https://pbs.twimg.com/profile_images/3527918618/4ee2ac5283fce730caca88cb19fd0d2f_bigger.jpeg', '@OmarChehadeMoya', '\n      Omar Chehade Moya', 'http://omarchehade.pe', 'Abogado de Profesion.\nEx Vicepresidente y Congresista de la Republica.\nJefe de Extradiciones de la Procuradoria Anticorrupcion (2005-2008).', '25,4 mil', '477', '1.693', 'Ninguna', '669', '1'),
(4, 'Se unió en octubre de 2008', '21', 'https://twitter.com/OMARCHAPARRO', 'https://pbs.twimg.com/profile_images/922690835111661568/BuPEflp9_bigger.jpg', '@OMARCHAPARRO', '\n      Omar Rafael Chaparro', 'Ninguna', 'Actor, Entretenedor y Cuchara  Contact @talentontheroad @nadirassis', '6,87 M', '1.448', '27 mil', 'Ninguna', '6.355', '1'),
(5, 'Se unió en julio de 2015', '20', 'https://twitter.com/OmarBarbozaDip', 'https://pbs.twimg.com/profile_images/848887662375313412/MiocLSw__bigger.jpg', '@OmarBarbozaDip', '\n      Omar Barboza', 'Ninguna', 'Zuliano | Presidente de la Asamblea Nacional |', '22,7 mil', '710', '1.235', 'Ninguna', '497', '1'),
(6, 'Se unió en julio de 2010', '20', 'https://twitter.com/muelanblue', 'https://pbs.twimg.com/profile_images/1018034163784417281/2rvaQas0_bigger.jpg', '@muelanblue', '\n      Omar Mendoza', 'Ninguna', 'Futbolista Profesional de @xolos  instagram: om28_', '22,2 mil', '64', '248', 'Ninguna', '997', '1'),
(7, 'Se unió en marzo de 2015', '21', 'https://twitter.com/omargaber', 'https://pbs.twimg.com/profile_images/989748500119224326/xyucpbkU_bigger.jpg', '@omargaber', '\n      Omar Gaber', 'https://www.facebook.com/OmaarGabeer', 'The official account of LAFC’s and Egyptian International Omar Gaber. Instagram: OmarGaber_4', '1,27 M', '215', '639', 'Ninguna', '1.130', '1'),
(8, 'Se unió en julio de 2010', '20', 'https://twitter.com/omarlyefookMBE', 'https://pbs.twimg.com/profile_images/803972983119343616/bl8UcSil_bigger.jpg', '@omarlyefookMBE', '\n      Omar lyefook MBE', 'http://www.omarmusic.co.uk', 'Musician, Producer, Arranger, Actor http://en.wikipedia.org/wiki/Omar_Lye-Fook … Contact info@omarmusic.net https://m.facebook.com/omarofficialuk ', '10,6 mil', '1.137', '7.615', 'Ninguna', '4.110', '1'),
(9, 'Se unió en abril de 2010', '20', 'https://twitter.com/Omar4Gonzalez', 'https://pbs.twimg.com/profile_images/915665841882058753/pTAlFBG0_bigger.jpg', '@Omar4Gonzalez', '\n      Omar Gonzalez', 'Ninguna', '#14 Centerback for Atlas FC', '186 mil', '492', '2.734', 'Ninguna', '836', '1'),
(10, 'Se unió en agosto de 2007', '20', 'https://twitter.com/EscapeTheFate', 'https://pbs.twimg.com/profile_images/964171030938845184/gl1H9ZG7_bigger.jpg', '@EscapeTheFate', '\n      EscapeTheFate', 'http://www.escapethefate.com', 'New album #IAmHuman out now!', '447 mil', '463', '5.106', 'Ninguna', '1.351', '1'),
(11, 'Se unió en mayo de 2010', '20', 'https://twitter.com/rnanita3', 'https://pbs.twimg.com/profile_images/974028698797174786/Tfz3EV3i_bigger.jpg', '@rnanita3', '\n      Ricardo Nanita', '\n    en.wikipedia.org/wiki/Ricardo_N…\n  ', 'Comentame,oioioi, Lo que sucede conviene!!!, Siempre Pro, Oi3, Mantente Pro, Solamente Asi', '21,8 mil', '2.399', '1.167', 'Ninguna', '1.496', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `persona_persona`
--
ALTER TABLE `persona_persona`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `search_auto`
--
ALTER TABLE `search_auto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`);

--
-- Indices de la tabla `search_facebook`
--
ALTER TABLE `search_facebook`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idfb` (`idfb`);

--
-- Indices de la tabla `search_github`
--
ALTER TABLE `search_github`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `search_google`
--
ALTER TABLE `search_google`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `search_instagram`
--
ALTER TABLE `search_instagram`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `search_personaredes`
--
ALTER TABLE `search_personaredes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_personaredes_idpersona_id_ce508ef3_fk_persona_persona_id` (`idpersona_id`),
  ADD KEY `search_personaredes_idfb_id_06a980e1_fk_search_facebook_id` (`idfb_id`),
  ADD KEY `search_personaredes_idgithub_id_a4f1ca61_fk_search_github_id` (`idgithub_id`),
  ADD KEY `search_personaredes_idgoogle_id_eea82975_fk_search_google_id` (`idgoogle_id`),
  ADD KEY `search_personaredes_idinstagram_id_b836fb74_fk_search_in` (`idinstagram_id`),
  ADD KEY `search_personaredes_idtw_id_8673ab52_fk_search_twitter_id` (`idtw_id`),
  ADD KEY `search_personaredes_idusuario_id_55a54a4a_fk_auth_user_id` (`idusuario_id`);

--
-- Indices de la tabla `search_twitter`
--
ALTER TABLE `search_twitter`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `persona_persona`
--
ALTER TABLE `persona_persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `search_auto`
--
ALTER TABLE `search_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `search_facebook`
--
ALTER TABLE `search_facebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `search_github`
--
ALTER TABLE `search_github`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `search_google`
--
ALTER TABLE `search_google`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `search_instagram`
--
ALTER TABLE `search_instagram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `search_personaredes`
--
ALTER TABLE `search_personaredes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `search_twitter`
--
ALTER TABLE `search_twitter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `search_personaredes`
--
ALTER TABLE `search_personaredes`
  ADD CONSTRAINT `search_personaredes_idfb_id_06a980e1_fk_search_facebook_id` FOREIGN KEY (`idfb_id`) REFERENCES `search_facebook` (`id`),
  ADD CONSTRAINT `search_personaredes_idgithub_id_a4f1ca61_fk_search_github_id` FOREIGN KEY (`idgithub_id`) REFERENCES `search_github` (`id`),
  ADD CONSTRAINT `search_personaredes_idgoogle_id_eea82975_fk_search_google_id` FOREIGN KEY (`idgoogle_id`) REFERENCES `search_google` (`id`),
  ADD CONSTRAINT `search_personaredes_idinstagram_id_b836fb74_fk_search_in` FOREIGN KEY (`idinstagram_id`) REFERENCES `search_instagram` (`id`),
  ADD CONSTRAINT `search_personaredes_idpersona_id_ce508ef3_fk_persona_persona_id` FOREIGN KEY (`idpersona_id`) REFERENCES `persona_persona` (`id`),
  ADD CONSTRAINT `search_personaredes_idtw_id_8673ab52_fk_search_twitter_id` FOREIGN KEY (`idtw_id`) REFERENCES `search_twitter` (`id`),
  ADD CONSTRAINT `search_personaredes_idusuario_id_55a54a4a_fk_auth_user_id` FOREIGN KEY (`idusuario_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
