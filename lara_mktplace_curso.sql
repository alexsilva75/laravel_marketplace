-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Fev-2022 às 16:27
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lara_mktplace_curso`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Computadores', NULL, 'computadores', '2022-02-04 17:28:01', '2022-02-04 17:28:01'),
(2, 'Games', NULL, 'games', '2022-02-04 17:28:01', '2022-02-04 17:28:01'),
(3, 'Notebooks', NULL, 'notebooks', '2022-02-04 17:28:01', '2022-02-04 17:28:01'),
(4, 'Vestuário', 'Roupas e moda', 'vestuario', '2022-02-16 18:08:08', '2022-02-16 18:08:08'),
(5, 'Mobile', 'Dispositivos móveis,   celulares', 'mobile', '2022-02-16 18:28:10', '2022-02-16 18:28:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `category_product`
--

CREATE TABLE `category_product` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `category_product`
--

INSERT INTO `category_product` (`product_id`, `category_id`) VALUES
(41, 1),
(41, 3),
(67, 2),
(67, 5),
(68, 4),
(68, 5),
(69, 5),
(70, 5),
(71, 2),
(71, 5),
(72, 2),
(72, 5),
(73, 2),
(73, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_02_02_144411_create_table_store', 1),
(26, '2022_02_02_145745_create_products_table', 1),
(27, '2022_02_04_124617_create_categories_table', 1),
(28, '2022_02_04_124902_create_category_product_table', 2),
(29, '2022_02_16_174820_create_products_photos_table', 3),
(30, '2022_02_16_175013_alter_table_stores_add_column_logo', 3),
(31, '2022_02_17_125657_alter_table_products_photos_alter_column_featured_to_nullable', 4),
(32, '2022_02_24_130621_create_user_order_table', 5),
(33, '2022_02_26_131750_create_order_store_table', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `order_store`
--

CREATE TABLE `order_store` (
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `order_store`
--

INSERT INTO `order_store` (`store_id`, `order_id`) VALUES
(45, 3),
(44, 3),
(44, 4),
(1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `store_id`, `name`, `description`, `body`, `price`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ms. Kaelyn Watsica', 'Est nemo et distinctio beatae repellat.', 'Consectetur est a sequi et id tempora laudantium. Quo laudantium cupiditate suscipit fuga exercitationem qui. Porro laboriosam voluptas consequatur aspernatur aut. Beatae eveniet voluptate non quasi assumenda quia.', '1974.76', 'sint-sapiente-perferendis-ea-voluptatem', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(2, 2, 'Carmel Graham', 'Minima velit nulla error temporibus nisi.', 'Vel dolores consequatur et adipisci est rerum. Similique illo dolores unde quia possimus vel. Minus aut nam laborum nisi nisi illo. Unde possimus cupiditate cum est. Molestias similique quo commodi et ratione laboriosam.', '7875.81', 'debitis-beatae-quaerat-ut', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(3, 3, 'Lempi Tillman', 'Saepe totam voluptatibus est ab vero tempora.', 'Aliquam non nesciunt expedita libero assumenda asperiores. Dolor quas iste voluptas dicta. Eligendi temporibus necessitatibus quae iure velit. Magni quas libero autem cupiditate vel iusto minus. Asperiores aut sapiente beatae a veniam qui amet.', '10.00', 'est-est-voluptatem-adipisci-harum', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(4, 4, 'Dr. Christian Skiles', 'Consequuntur officia inventore rerum modi unde molestias voluptas.', 'Consectetur voluptatibus doloremque omnis officia eveniet. Recusandae eos totam provident autem voluptatibus ea. Officiis totam recusandae voluptas cupiditate. Autem id est velit veniam. Beatae tempora dignissimos modi quae laborum.', '38.60', 'quam-necessitatibus-cupiditate-corrupti-aut-sunt-molestiae-magni', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(5, 5, 'Dr. Vaughn Murphy', 'Explicabo qui omnis alias quod esse consequuntur.', 'Animi at facere autem perspiciatis. Doloremque consequuntur officiis molestiae iusto. Dolores illum eligendi sit. Sit commodi ut omnis consectetur laboriosam. Et reprehenderit numquam quia quia placeat. Suscipit molestiae nulla quia in doloremque. Similique est enim rem dignissimos laudantium ea eum.', '30.84', 'maxime-quo-fugit-aut-et', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(6, 6, 'Elvera Murray', 'Ut incidunt omnis cum.', 'Eum dolore omnis cum aut aperiam repellendus ipsam. Explicabo et molestiae iste repellat aliquam qui consequatur. Enim aut consequuntur modi iure ad. Maxime ut sed neque voluptatem quis veritatis. Beatae numquam quia labore. Blanditiis temporibus et est debitis.', '347.69', 'ea-consectetur-est-dolorem-facere-optio-nesciunt-error', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(7, 7, 'Miss Andreanne Reichert', 'Enim vitae recusandae ipsum quis.', 'Fuga voluptatem suscipit facilis optio voluptas nemo aliquam. Dignissimos voluptatum et eum minus totam quaerat voluptatem. Molestiae odit asperiores ab. Optio recusandae quibusdam ut ut sunt ut. Officia consectetur beatae dolores praesentium. Et voluptatem tempora aliquam illum quis.', '169.60', 'possimus-autem-natus-amet-est-omnis-dolorem', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(9, 9, 'Mr. Lourdes Metz', 'Accusamus accusamus omnis et quibusdam.', 'Aspernatur quo deleniti non iusto unde. Ipsam repudiandae dolorem omnis totam. Beatae eveniet animi aperiam ea natus et. Adipisci animi rem voluptates placeat voluptatem fuga.', '13.79', 'veniam-corporis-quae-aut-architecto-sed-fugit-sit-sint', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(10, 10, 'Gianni Kassulke', 'Ut temporibus molestiae facere.', 'Perspiciatis repudiandae repellat sit nihil vero voluptatem amet quod. Magni magni ex quia consequatur aut pariatur. Est sapiente non deleniti labore laborum ut est. A temporibus non ut nemo assumenda repellat in rerum.', '1214444.54', 'dolore-vitae-corrupti-officia-fugiat', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(11, 11, 'Abel Becker', 'Non maiores asperiores ea illum sed.', 'Ducimus laborum similique ipsum distinctio. Excepturi est temporibus in et dicta et rem. Ut nobis quibusdam asperiores dolor. Est magnam iusto velit laborum. Deleniti esse libero iusto doloremque. Omnis eveniet eos aut. Itaque dolores molestias voluptatem vitae placeat sequi.', '3070.82', 'ducimus-est-qui-perferendis-vero-odio-et-libero', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(12, 12, 'Maryjane Wiegand', 'Soluta tempora accusamus laudantium nihil veniam.', 'Ea praesentium recusandae tempore eum. Aut et sint pariatur quo mollitia dolorum. Provident voluptate quasi assumenda cupiditate ipsam sapiente. Voluptatum a mollitia qui omnis debitis. Expedita ducimus est quam suscipit quae. Voluptatem molestiae libero aut et voluptas dolorem sit. Delectus deleniti alias est qui.', '6476111.54', 'ea-nostrum-perferendis-rerum-dolores-sunt', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(13, 13, 'Audrey Kirlin', 'Voluptas vero earum iusto unde cupiditate itaque.', 'A sed dolor eum et excepturi illum. Dolores est vel quas aspernatur delectus pariatur quo sit. Tenetur et eos et et excepturi doloribus laudantium. Ratione vel beatae debitis. Voluptatum et nisi placeat hic tempora placeat rerum. Inventore est quaerat suscipit neque. Saepe dolor et dolor temporibus iure nihil repudiandae.', '10.00', 'voluptates-explicabo-minus-ipsum-non-blanditiis-cumque', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(14, 14, 'Prof. Jessica Halvorson DDS', 'Qui sed et amet facilis provident optio.', 'Consequatur eum consequuntur non unde voluptates quod. Omnis amet minus est illum optio dolore. Minima aut et fuga eos. Corrupti ipsa fugiat maxime ex enim rerum. Quod quisquam sapiente tempore fugit tempora.', '24378.67', 'et-aut-saepe-est-rerum', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(15, 15, 'Miss Magnolia Reinger', 'Aut tempore voluptatibus sint.', 'Facere dignissimos beatae aut ipsum doloribus natus. Ipsum nesciunt omnis placeat aperiam esse dicta aperiam. Alias reiciendis rem aliquam deleniti aut voluptatum at maxime. Eos fugit nulla corrupti quia.', '35755.56', 'non-porro-hic-minima-eius', '2022-02-04 16:55:36', '2022-02-04 16:55:36'),
(16, 1, 'Marcel Gleason', 'Neque quia similique doloribus molestiae cumque.', 'Aspernatur tempore magni debitis omnis. Animi provident explicabo autem dolores commodi sit et explicabo. Non et praesentium autem cumque. Eum est assumenda tempore suscipit rerum. Voluptas qui doloremque aut modi. Maiores natus aut nisi laboriosam consectetur illo vitae. Ut sapiente vero quasi laborum sed veniam.', '28643931.96', 'eum-error-ut-mollitia-cumque-alias-ut-quo', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(17, 2, 'Alice Block', 'Libero consectetur autem ut quibusdam.', 'Adipisci mollitia inventore debitis qui ab blanditiis repudiandae provident. Explicabo ut nisi expedita neque id. Non consequuntur voluptate quas sint. Culpa est earum nisi omnis. Aut explicabo est voluptates voluptatem facere. Occaecati architecto tempora et tenetur provident ipsam voluptates.', '7839698.03', 'veritatis-dolores-nisi-provident-et-dolorem-est-fuga', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(18, 3, 'Khalil Ritchie', 'Asperiores explicabo ipsam est labore provident velit sapiente.', 'Maiores qui quis dolore. Quis quia harum amet omnis accusamus tempore doloremque. Similique veritatis eos optio mollitia magni. In sed aliquid accusamus nam excepturi nostrum. Ab in sit perferendis laudantium corporis.', '4040986.30', 'fuga-eius-sit-nemo-accusamus', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(19, 4, 'Dr. Korey Larson', 'Rerum a id consequatur sequi tenetur ipsam.', 'Eligendi provident nisi cupiditate voluptatem quo voluptates temporibus. Blanditiis voluptatem est delectus corrupti aliquam numquam enim. Sequi dolor ut nostrum suscipit id quia. Et nihil explicabo deleniti quia. Et veniam est sunt dolor quia veritatis officia.', '2194482.79', 'provident-illum-rerum-nihil-quis-voluptatem-quis-at-tenetur', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(20, 5, 'Kay Keeling Sr.', 'Ut et ratione eligendi eos nihil quasi sint.', 'Repudiandae debitis laudantium voluptas a maiores in et. Natus quo voluptatem dolor at. Quasi sed dolore et. Ipsam possimus rem molestias voluptatem dolore qui. Quis necessitatibus sed animi perferendis vel voluptas praesentium. Voluptas esse beatae ipsum in.', '2.34', 'dolore-et-in-amet-dignissimos', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(21, 6, 'Zula Ruecker', 'Ipsa repellat quidem fugiat possimus enim.', 'Quo possimus corrupti et quasi porro. Temporibus praesentium quod aut consequatur dolore non officia. Rerum sint ex et dignissimos recusandae cumque accusamus. In delectus cumque sed excepturi. Id nisi error animi reprehenderit quia cum. Consectetur illum ut dolor quis labore dolor eum. Molestias rerum nesciunt aut quasi itaque veritatis quia in.', '8441457.64', 'porro-dolorum-asperiores-voluptas-explicabo', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(22, 7, 'Elna Rowe', 'Blanditiis et qui natus sunt unde iste voluptates.', 'Ut sint fuga amet neque dolor sint vero. Voluptas ducimus omnis quas deleniti et accusamus magni. Ex quam vitae sed dolores nemo et. Sit delectus beatae et. Voluptatem tempore impedit omnis aut aspernatur. Laborum qui quos delectus qui omnis nihil occaecati. Qui rerum voluptatum est rerum autem qui nisi soluta.', '14687.28', 'inventore-ut-voluptas-amet-magni-aut-ut', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(23, 8, 'Ernest Hessel', 'Voluptatem ipsam labore quis vitae.', 'Hic sit officiis aut et velit quia et. Impedit labore doloribus officia in delectus quasi. Laudantium beatae ab deleniti et. Aut ut ipsum est dicta.', '11278640.59', 'est-eum-ab-et-iste-rerum-id', '2022-02-04 16:57:00', '2022-02-04 16:57:00'),
(24, 1, 'Leonel Miller V', 'Ut est deleniti dolorem et hic voluptatum.', 'Repudiandae doloribus natus laudantium dolorem. Amet consequatur natus quia cupiditate. Odio cum quisquam qui facilis iure molestias. Consequatur beatae accusamus ea odio velit temporibus. Ut quia quia earum sit.', '7.53', 'eos-eum-enim-dolor-nihil', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(25, 2, 'Dr. Destin Mitchell Jr.', 'Aut quam natus est voluptate id dolore.', 'Magnam est inventore rem explicabo consequatur omnis sit. Corrupti hic et consequatur aut ipsum sapiente. Temporibus fugiat cumque quasi dolorum minima eius. Similique nisi earum cumque et veniam eum. Itaque minima neque quis ut qui ut vero sint. Dolores quos provident deserunt.', '7.04', 'sapiente-qui-distinctio-velit-quam-sapiente-cupiditate-labore', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(26, 3, 'Candace Torp', 'Possimus molestiae modi minima omnis modi consequatur quia.', 'Aliquid quia qui voluptatem suscipit quo officia sint. Velit praesentium fugiat nostrum eum. Ad sint laboriosam velit molestiae deleniti. Et voluptatibus ad eos dolores eaque recusandae. Ab omnis at consequatur qui excepturi quas. Quia quia sit ea accusantium vero iusto numquam. Et qui in nisi optio sed odio aspernatur ullam.', '8.42', 'culpa-nam-totam-accusamus-corrupti-quis-beatae-laboriosam', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(27, 4, 'Newton Johns', 'Et tempore sed facilis aut rerum commodi natus architecto.', 'Excepturi ducimus consequatur dolore reprehenderit ipsa. Aliquid qui rerum doloremque. Fuga veniam sunt voluptatem provident quis earum dolorem. Facere explicabo ut provident perspiciatis.', '2.75', 'molestiae-enim-ut-sint-animi', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(28, 5, 'Ismael Hermiston Jr.', 'Ut voluptatem hic quasi inventore possimus repellendus facilis non.', 'Minus sed reprehenderit eius dicta. Ad numquam omnis quibusdam. Tempora et cupiditate temporibus omnis. Dolorem et dicta optio mollitia cum harum harum. Perferendis minima veritatis itaque quia omnis.', '5.70', 'earum-suscipit-eos-dolores-rem', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(29, 6, 'Jaime Wilderman II', 'Voluptate iusto earum velit quisquam perspiciatis.', 'Minus doloribus ipsum aut sint. Sint iure facilis aspernatur enim vel enim molestias. Voluptatibus velit molestiae odit sapiente sit. Qui harum qui at repellat voluptas cupiditate. Et sed asperiores dolor. Eos ut amet quibusdam unde et placeat rem. Aut rerum debitis pariatur minus autem et facilis.', '6.07', 'officia-quibusdam-ut-at-in-reprehenderit-quos', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(30, 7, 'Mae O\'Connell', 'In voluptatum earum odit culpa sunt voluptas.', 'Qui temporibus exercitationem non in et iste sint. Sunt rerum expedita modi. Ab tempora doloremque delectus dolorem fuga et. Modi eligendi harum sit quos aut. Suscipit voluptate amet dolorem aperiam repellendus quod.', '9.28', 'consequatur-nulla-incidunt-dolor-tempora-quas-odio-nisi', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(31, 8, 'Birdie Schaden', 'Aut vel enim quidem et dolores.', 'Magnam accusamus in aperiam sapiente eum. Placeat autem consequatur aut dignissimos sunt. Eaque cupiditate a molestias ea ipsa autem eos. Dignissimos doloremque sed tempora. Et est ea voluptas atque nobis eos qui.', '9.70', 'similique-commodi-et-consequatur-sint-quas-atque-provident', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(32, 9, 'Adriel Hammes', 'Modi quidem et explicabo praesentium deleniti sunt.', 'Occaecati accusamus optio aut ut ut omnis expedita. Exercitationem repudiandae consequatur sint veniam voluptatem aut. Vero harum nam autem quia doloremque voluptates. Omnis nihil porro unde rem illo eum. Est ut aperiam possimus ea quasi officiis eaque. Placeat sit nostrum qui amet. Atque eum qui vel aut quis.', '7.95', 'exercitationem-delectus-doloribus-qui-unde-eaque-est-neque-atque', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(33, 10, 'Joe Parker', 'Itaque rerum velit sint maiores amet voluptatem.', 'Rerum corrupti voluptate eos qui autem. Omnis voluptatem qui eligendi neque deleniti pariatur consequatur est. Nobis nemo alias sit et. Ex dolor aspernatur quidem veniam error dolor et. Sunt rerum nesciunt natus unde sapiente. Velit praesentium et nobis corporis dolor placeat. Accusamus ut qui laborum iste.', '7.99', 'tenetur-eos-est-sit-sequi', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(34, 11, 'Lavina Kertzmann', 'Et consequuntur consequatur quis.', 'Fugiat laborum soluta sequi itaque. Dolorem maiores odio dolore ut rem dolore a. Perspiciatis vero maxime asperiores dignissimos nobis neque. Asperiores eius enim explicabo voluptatibus quidem sed. Quia cumque accusamus provident ut consectetur cupiditate. Voluptas in in quisquam necessitatibus aperiam rem ipsam. Suscipit vero nam temporibus voluptatem eos nostrum.', '6.13', 'sunt-et-qui-nam-velit-perferendis-vel', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(35, 12, 'Ariel Robel', 'Animi aut hic in et non.', 'Adipisci inventore itaque quis et voluptatum consequatur dicta. Necessitatibus dolor animi eligendi cupiditate quo quod. At voluptatem harum repellendus aut consequuntur dolorem voluptatem quia. Qui nulla et reiciendis deserunt minima.', '4.63', 'in-iste-facilis-nisi-omnis-possimus', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(36, 13, 'Mrs. Krystel Cormier', 'Aut vitae aliquid natus maiores quia laudantium reprehenderit inventore.', 'Totam dicta itaque qui ut ratione sed labore. Rerum repellendus et quas eos iste nihil pariatur. Inventore culpa aperiam minus deleniti molestiae eos fugiat expedita. Sit exercitationem aspernatur veniam voluptatem. Illum nobis at sunt eveniet recusandae eius vel.', '1.31', 'quis-nihil-mollitia-qui', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(37, 14, 'Micah King Sr.', 'Recusandae tenetur illum aliquid optio quod.', 'Ut facilis similique consequatur eum ea autem qui et. Aut quam a aut corporis voluptatem culpa aut fugit. Cupiditate ea perferendis pariatur vitae ut. Corporis hic in culpa aliquam laboriosam. Aut voluptatem deleniti consequuntur et commodi. Vero ea excepturi minus velit.', '8.86', 'doloribus-non-aliquid-deserunt-quaerat-voluptatem-blanditiis-atque-impedit', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(38, 15, 'Ms. Millie Emard DVM', 'Modi fuga fugit molestias et.', 'Cum iste et consequatur blanditiis laboriosam enim. Saepe explicabo quia voluptatem sed. Aut necessitatibus qui harum. Quos asperiores officiis architecto ipsam ullam. Eaque error libero ex soluta assumenda nihil aut.', '9.15', 'modi-aspernatur-magni-numquam-amet-minima-aperiam-inventore-ipsum', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(39, 16, 'Dr. Ramona Bergstrom', 'Et sed suscipit libero unde voluptas iure.', 'Vel repudiandae delectus et sint ut. A eligendi amet cumque repudiandae ducimus enim dolorem. Ut sit animi perferendis labore cum quaerat asperiores expedita. Neque autem facilis est veniam aspernatur ut. Qui doloremque neque voluptas earum. Facere laboriosam ut dicta veniam nobis velit. Explicabo totam soluta omnis dolores itaque nisi.', '4.03', 'quo-maxime-id-unde-id-aut-sint-assumenda-eligendi', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(40, 17, 'Mr. Leone Ernser', 'Eum autem earum minima sapiente eius illum.', 'Veniam temporibus dolor eligendi qui iste. Aliquam laudantium dolorem sed ea. Odio dolorem deleniti minima enim aspernatur rerum odit. Ipsa temporibus ab ipsam labore repellat. Molestiae voluptas consequatur occaecati nemo. Quidem praesentium voluptates quidem illo alias.', '7.95', 'hic-voluptates-veniam-est-sapiente-ducimus-sunt-aspernatur', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(41, 18, 'Glenda Bogisich', 'Facilis neque nihil nobis quae sint.', 'Vel et ullam corrupti et nostrum voluptas. Distinctio sed perferendis repellat earum. Quia animi atque est a. Non dolor corrupti ea illum consequatur fugit eligendi. Voluptatem modi animi rerum. Nihil maiores magni illum pariatur at et. Debitis minus cupiditate aut fugit architecto.', '2.25', 'dolor-et-earum-voluptatibus-dolores-illo-qui', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(42, 19, 'Alexandrine Gutmann', 'Vel asperiores veniam quis veritatis sunt sit libero dolor.', 'Omnis dolorem vitae aut dolor iure. Repellendus delectus sed fugit aut. Aut dicta ut quam aut omnis non. Sit amet adipisci harum accusantium.', '8.66', 'laudantium-ut-aut-saepe-esse-dolorem-asperiores', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(43, 20, 'Chelsey Hoppe', 'Eaque sed vel in.', 'Neque aut est vitae veniam. Enim occaecati molestiae explicabo et laborum. Deserunt eos eveniet omnis sunt non sed quis. Explicabo sit accusantium dolorum qui sequi. Saepe velit optio ut excepturi autem itaque esse. Minus quasi est vitae sed. Vel ipsa consequatur repudiandae et eius facere.', '1.71', 'deleniti-eligendi-voluptatem-et-soluta-maiores-occaecati-velit', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(44, 21, 'Prof. Jaylin Zieme II', 'Voluptatem cumque odio voluptatem quaerat quaerat.', 'Ipsam accusamus tempore non sunt esse molestias nesciunt. Culpa consequuntur dicta odio dolore ut. Provident voluptatem consectetur inventore distinctio. Dolore ab quidem magni deleniti autem et. Ducimus vero eligendi voluptas voluptates vitae facere. Excepturi repellat optio tenetur eligendi ut quasi sequi nulla.', '9.15', 'alias-porro-minus-voluptatem-et-ea', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(45, 22, 'Velda Crona', 'Excepturi facere cum architecto sunt.', 'Et nobis voluptatem quisquam maiores amet earum excepturi. Ab sed alias porro ut optio consectetur voluptate sit. Aperiam cum illo tenetur quod. Qui voluptas quia vero dolor pariatur aut maxime.', '8.80', 'sit-voluptatem-adipisci-possimus-molestiae-culpa-hic', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(46, 23, 'Dr. Lucile Little', 'Vel et qui quae rerum facere nobis.', 'Velit voluptatem fugiat qui tempora. Ratione aperiam ex molestiae aut doloremque voluptatum ducimus. Cum alias id harum a. Quaerat et nesciunt deleniti temporibus. Dolor iure eligendi maiores nostrum veniam consequatur. Sit beatae sequi neque facere sunt.', '8.81', 'suscipit-voluptatibus-fugit-quae-eaque-placeat-non', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(47, 24, 'Maybell Senger', 'Nemo alias sit et enim.', 'Et nostrum in autem. Et id et aliquid libero. Nesciunt iste eos cumque soluta molestiae voluptas. Quaerat ratione amet aut. Molestiae nihil cupiditate dignissimos id. Quisquam sit et voluptates error voluptate error.', '5.74', 'esse-nostrum-doloremque-sed-velit-veritatis-soluta-ab-nostrum', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(48, 25, 'Melyna Marks', 'Natus laboriosam error voluptatem nihil totam facere.', 'Beatae illum quibusdam quo exercitationem explicabo id nihil. Aperiam vero commodi esse voluptas quod eum. A et saepe assumenda architecto placeat ratione nemo. Illo expedita fugit magnam officia. Assumenda officiis consectetur esse qui. Error minus aut autem officiis qui nisi eum.', '9.68', 'mollitia-ut-voluptas-consequuntur-sed-est-rerum-reprehenderit', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(49, 26, 'Mr. Neil Emmerich Sr.', 'Voluptas quae in eius est iure in blanditiis.', 'Praesentium omnis qui mollitia sit sit totam. Molestiae omnis porro nulla odio sapiente. Ut non ut error quam libero atque esse. Qui expedita sit non et quidem dolorem aut. Qui qui eligendi dolor doloribus nobis delectus aut. Modi qui vel omnis et quis.', '6.89', 'aperiam-deserunt-tempora-sit-eius-unde-sint', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(50, 27, 'Christine Miller', 'Doloribus nulla quibusdam nostrum et earum maxime.', 'Voluptatem minus ut numquam tempora. Quis a dolor eveniet commodi et delectus. Non sunt sit laborum dolorem. Aut pariatur culpa qui fugit aut minus.', '2.61', 'quibusdam-aperiam-quaerat-quisquam-eos-vel-quia', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(51, 28, 'Omari Bins', 'Harum ducimus sint iure dignissimos quam.', 'Id provident ea voluptatem soluta similique beatae fuga. Consequuntur nisi tempora officia omnis consequuntur quod. Expedita eos adipisci perferendis nemo et nisi. Praesentium sed alias nam nihil. Qui non et est blanditiis enim accusantium nam.', '6.50', 'cum-vel-nulla-quo-dolorem-consectetur', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(52, 29, 'Dr. Giovanny Mayer Sr.', 'Repellat velit veritatis minus nulla.', 'Et sed eum illo molestiae eaque. Odit vel voluptatem voluptatum corrupti ipsum quia et. Eum pariatur delectus error debitis provident sed eaque eos. Nihil officiis delectus sequi ab.', '4.18', 'eligendi-qui-ipsam-aperiam-deserunt-officia-qui-omnis', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(53, 30, 'Bernita Kuhic', 'Qui quam doloremque et voluptate rerum.', 'Nisi consequuntur maxime ut aliquam. Autem reprehenderit sed in voluptate architecto laborum deserunt. Officiis illo unde reprehenderit temporibus necessitatibus corrupti mollitia. Ad quo distinctio doloribus molestiae. Reiciendis rerum et ipsam et in ea. Qui qui consectetur reiciendis natus qui.', '3.00', 'mollitia-ut-dolorem-dolorum-repellat-amet-sunt-minima', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(54, 31, 'Fabiola Gleason', 'Odit quis est eius et quod a ut.', 'Quidem voluptatibus facere ipsam aspernatur eaque dolorem nesciunt. Totam voluptatem quod qui sed commodi ut ipsam. Impedit omnis dolorum vel iusto nisi non in. Eius modi labore quia molestias rerum. Et quae ex totam unde. Deleniti quasi vitae facere explicabo vero. Mollitia dolor quidem quis perferendis dolores.', '2.62', 'sit-minus-est-enim-labore-et-consectetur-nostrum', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(55, 32, 'Samson Conn', 'Natus eum reprehenderit aut alias quis.', 'Voluptas quae quia impedit culpa sunt rem non quas. Sunt enim temporibus architecto. Sunt sed laboriosam aut autem voluptatem consequatur ipsa labore. Totam voluptatem reiciendis dicta quod sunt possimus dicta.', '5.73', 'non-impedit-quae-excepturi-quas-officiis-placeat-ipsam', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(56, 33, 'Mrs. Teagan Thiel III', 'Ut est consectetur velit dolores omnis voluptatem.', 'Modi in consequatur rerum porro et. Maiores est dolorum dolorem reprehenderit id inventore et. Nisi maxime ut delectus modi molestias excepturi mollitia. Ducimus architecto dicta non est nihil quibusdam. Sed velit sint cumque tenetur. Et eligendi ullam voluptatum.', '5.15', 'molestiae-maxime-vel-aspernatur-maxime-omnis-reiciendis', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(57, 34, 'Mr. Sam Tremblay', 'Aliquid esse quo at tenetur.', 'Recusandae ut et illo. Molestiae temporibus aliquid voluptas quaerat dolorem blanditiis. Ea quasi dolorum impedit fugiat eum quis. Nobis et culpa aut enim. Ducimus quod sit labore eligendi molestiae. Ad a rem dolorem corporis doloribus quam. Reprehenderit est vel maxime dolor et molestiae.', '6.87', 'non-quaerat-molestiae-nisi-dolor-eius-est', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(58, 35, 'Rebeca Shanahan', 'Facilis iure ut nulla aliquid ea.', 'Velit harum rerum rerum provident consequatur veniam cum qui. Non nobis quia ab. Pariatur vel aut et quos omnis. Laudantium amet architecto enim consequatur provident sapiente aut hic. Modi assumenda fugiat quisquam suscipit et. Ullam inventore molestias dolores soluta in.', '8.13', 'voluptatum-nemo-consequatur-aut-occaecati', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(59, 36, 'Dr. Gerson Toy', 'Suscipit necessitatibus voluptates itaque et facere minima.', 'Aut qui quia voluptas modi nam necessitatibus ut. Voluptatum asperiores aut inventore neque et. Debitis nostrum tempore dolore iure eveniet fugit. Perspiciatis est ducimus commodi ullam quis voluptas dolorem.', '3.10', 'ut-soluta-earum-natus-quo-ducimus', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(60, 37, 'Prof. Elta Schinner', 'Eum omnis deleniti corrupti quidem harum qui.', 'Molestias laboriosam sint ducimus beatae culpa. Eius voluptate tenetur aliquam fuga sint qui blanditiis nesciunt. Hic ut et impedit quibusdam consequatur omnis. Unde veritatis laudantium modi consectetur.', '2.76', 'optio-fuga-tempora-earum-accusantium-nam-deleniti-non', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(61, 38, 'Miss Laney Legros PhD', 'Odit nam reiciendis et consequuntur dolore sed quaerat.', 'Excepturi aut expedita ad. Autem veniam voluptate quos possimus quia. Aut asperiores omnis modi enim sed. Harum omnis modi in. Et ratione architecto aut amet. Assumenda vel repudiandae molestiae voluptatibus corporis aliquam aut. Nulla non commodi sequi dolorem.', '2.28', 'nihil-quis-rem-error-omnis-ipsa-nemo', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(62, 39, 'Tevin Adams', 'Sit fuga vel accusamus autem ratione expedita eum et.', 'Harum enim rerum laboriosam qui hic. Ab et et esse sunt id. Dolorem rerum molestiae alias voluptas ab. Rerum sint quam et accusamus dolorum tempora. Magnam voluptatibus provident ab cumque ea odit iste dignissimos. Voluptas vel nesciunt totam dicta libero.', '6.97', 'quam-illum-debitis-necessitatibus-ut-commodi-odio-assumenda', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(63, 40, 'Brandi Heidenreich', 'Inventore voluptas voluptatem sint ipsam.', 'Autem velit mollitia nesciunt sed. Expedita autem dolore esse aut voluptatem facere aut. Pariatur eaque impedit voluptatem dolore. In beatae omnis nisi harum nisi. Cumque nemo unde dolores asperiores ipsam qui ipsum. Rerum recusandae aliquid voluptatem voluptatem facere.', '6.74', 'eveniet-quia-mollitia-reprehenderit-cupiditate-id-aut', '2022-02-04 17:02:22', '2022-02-04 17:02:22'),
(64, 41, 'Notebook Dell', 'CORE i5 12GB RAM', 'whatever...', '7000.00', 'notebook-dell', '2022-02-04 17:21:26', '2022-02-04 17:21:26'),
(65, 19, 'Smart Speaker com Alexa', 'Smart Speaker com Alexa Original', 'Smart Speaker com Alexa', '350.00', 'smart-speaker-com-alexa', '2022-02-08 20:45:52', '2022-02-08 20:46:17'),
(66, 44, 'Mouse USB Sem fio', 'Mouse USB Sem fio', 'Mouse USB Sem fio', '30.00', 'mouse-usb-sem-fio', '2022-02-12 17:48:00', '2022-02-12 17:48:00'),
(67, 44, 'Celular LG K200+', 'Celular LG K200+', 'Celular LG K200+', '900.00', 'celular-lg-k200-plus', '2022-02-16 20:14:06', '2022-02-16 20:14:06'),
(68, 44, 'Smartwatch W27 PRO Series 7 NFC Tela Infinita 1.81\" - Preto', 'Smartwatch W27 PRO Series 7 NFC Tela Infinita 1.81\" - Preto', 'Especificações\r\n\r\nTela 2.5D HD, 1.81 polegadas, tft, 320 x 390 pixels\r\n\r\nCompatibilidade: Android e iOS\r\n\r\nCPU: HS6621\r\n\r\nFrequência básica: 128mhz\r\n\r\nMemória: ram: 256kb; rom: 8mb + 128mb\r\n\r\nBateria: 380mAH (2horas de carregamento, duração de 3 a 5 dias)\r\n\r\nCarregamento: Indução\r\n\r\nBluetooth: 3.0 + 5.0\r\n\r\nIdiomas suportados: Linguagem em português, assim como o aplicativo', '200.00', 'smartwatch-w27-proseries', '2022-02-17 15:15:05', '2022-02-17 15:15:05'),
(69, 44, 'Kindle 10a. geração com bateria de longa duração - Cor Preta', 'Kindle 10a. geração com bateria de longa duração - Cor Preta', 'Kindle 10a. geração com bateria de longa duração - Cor Preta', '400.00', 'kindle', '2022-02-17 15:18:22', '2022-02-17 15:18:22'),
(70, 44, 'Capa de tecido para Novo Kindle Paperwhite (11ª geração - 2021) - Cor Preta', 'Capa de tecido para Novo Kindle Paperwhite (11ª geração - 2021) - Cor Preta', 'Capa de tecido para Novo Kindle Paperwhite (11ª geração - 2021) - Cor Preta', '99.00', 'capa-kindle', '2022-02-17 15:52:37', '2022-02-17 15:52:37'),
(71, 44, 'Xiaomi Redmi Note 10S 128gb 6gb RAM', 'Xiaomi Redmi Note 10S 128gb 6gb RAM', 'Xiaomi Redmi Note 10S 128gb 6gb RAM', '1500.00', 'celular-xiaomi-redmi-note-s10', '2022-02-17 15:55:42', '2022-02-17 15:55:42'),
(72, 44, 'Xiaomi Redmi Note 10S 128gb 6gb RAM', 'Xiaomi Redmi Note 10S 128gb 6gb RAM', 'Xiaomi Redmi Note 10S 128gb 6gb RAM', '1500.00', 'celular-xiaomi-redmi-note-s10', '2022-02-17 16:01:00', '2022-02-17 16:01:00'),
(73, 45, 'Celular Xiaomi Note 8 64GB Rom 4GB Ram Dual Versión Global Space Black', 'Celular Xiaomi Note 8 64GB Rom 4GB Ram Dual Versión Global Space Black', 'Celular Xiaomi Note 8 64GB Rom 4GB Ram Dual Versión Global Space Black', '1500.00', 'celular-xiaomi-note-8-64gb-rom-4gb-ram-dual-version-global-space-black', '2022-02-18 15:36:20', '2022-02-18 15:36:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_photos`
--

CREATE TABLE `products_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `products_photos`
--

INSERT INTO `products_photos` (`id`, `product_id`, `image`, `featured`, `created_at`, `updated_at`) VALUES
(2, 70, 'products/BXvGQH2j6t4F2EHUz67CSMw6LPhZv2MumxRrCRc8.jpg', NULL, '2022-02-17 16:12:13', '2022-02-17 16:12:13'),
(8, 72, 'products/6vBI3ZkKKsDkUr1UXGbLZ2Ahu9CiTMh3YkgElBPc.jpg', NULL, '2022-02-17 17:46:17', '2022-02-17 17:46:17'),
(9, 72, 'products/qH5iOTaqjgEjbu1PzIfzQKti7MTdfYfkED9drQ1g.jpg', NULL, '2022-02-17 17:48:54', '2022-02-17 17:48:54'),
(12, 70, 'products/oLMFyXtsqksqfXTKNADhspewunKzfLddmnHrhDBh.jpg', NULL, '2022-02-17 18:05:08', '2022-02-17 18:05:08'),
(13, 70, 'products/4ZrdJxeeYNROvDsydB8rbYlT0fhMaqNYshZngMqj.jpg', NULL, '2022-02-17 18:05:08', '2022-02-17 18:05:08'),
(14, 73, 'products/3mbIgY7QQP5kz4gqknXjo61o8bTU1nLbZh78Co9F.jpg', NULL, '2022-02-18 15:36:20', '2022-02-18 15:36:20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `stores`
--

INSERT INTO `stores` (`id`, `user_id`, `name`, `description`, `phone`, `mobile_phone`, `slug`, `created_at`, `updated_at`, `logo`) VALUES
(1, 1, 'Earlene Rempel PhD', 'Amet voluptas dolores consectetur placeat nihil beatae.', '480.689.0226', '929.436.2909', 'odit-eius-reiciendis-nobis-ut-iste-laboriosam', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(2, 2, 'Nova Loja OK', 'Possimus ut corporis aut voluptatem.', '267-476-5862', '262.527.3759', 'quisquam-rem-voluptate-nihil-velit-recusandae-inventore', '2022-02-04 16:49:26', '2022-02-05 22:24:17', NULL),
(3, 3, 'Alphonso Orn', 'Reprehenderit velit doloribus facere similique.', '+1-541-556-1246', '283.228.6674', 'et-corrupti-quia-eum-ea-distinctio-eum-impedit', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(4, 4, 'Jaylan Roob Jr.', 'Nulla optio est quod odio.', '(636) 734-9789', '+1-949-478-0841', 'mollitia-iste-molestias-assumenda-provident-neque-sed', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(5, 5, 'Miss Fiona Rowe', 'Rerum temporibus recusandae velit incidunt omnis.', '+1 (602) 761-7497', '+12234215935', 'facilis-sit-voluptatem-atque', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(6, 6, 'Kyra Adams IV', 'Nostrum velit sunt est libero necessitatibus.', '1-409-765-1387', '+19165007894', 'optio-non-id-sit-necessitatibus-facere-sapiente', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(7, 7, 'Dr. Jonathon Pollich', 'Laudantium explicabo temporibus autem at laboriosam numquam doloremque quia.', '832-212-0960', '732.388.2948', 'qui-modi-dolor-suscipit-quis', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(8, 8, 'Antoinette Howe', 'Iure qui cum commodi natus consequatur non dignissimos.', '+18387908695', '970-673-7945', 'rerum-voluptatem-illo-id-repellat-eum', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(9, 9, 'Pedro Krajcik', 'Provident repudiandae excepturi est quia consequatur earum illo.', '+1.458.920.4808', '682.473.3145', 'aspernatur-tempore-ea-possimus', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(10, 10, 'Mathilde Mohr', 'Facilis illum qui saepe accusamus.', '+1 (586) 357-6026', '726.417.6615', 'quia-fugit-quam-earum', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(11, 11, 'Camilla Homenick', 'Deleniti sunt aliquid et distinctio corporis dicta aut reprehenderit.', '1-817-772-6366', '1-863-879-9713', 'corporis-aut-explicabo-laborum-amet-neque', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(12, 12, 'Joyce Monahan', 'Blanditiis aut laborum illo deleniti libero aut iusto.', '903-693-3665', '+1-716-268-1827', 'aspernatur-quo-rerum-libero-fuga-aut', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(13, 13, 'Jimmy Schulist', 'Repudiandae ipsam et quas non dolor dignissimos alias at.', '1-912-826-9478', '+1-351-615-8144', 'aliquid-laudantium-nemo-fuga', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(14, 14, 'Mario Johns', 'Dignissimos excepturi recusandae tempora magni saepe.', '610-965-7322', '+16023850248', 'ratione-error-saepe-quae-molestiae', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(15, 15, 'Krista Mueller', 'Dicta laboriosam ab est voluptas.', '484-609-2026', '+1-234-326-0098', 'et-ut-nesciunt-libero-quis', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(16, 16, 'Oceane Stroman', 'Dolorem voluptatem tempore laudantium quam impedit recusandae molestiae.', '+1-832-228-0901', '(515) 440-2225', 'officiis-adipisci-laborum-rem-quis-ut', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(17, 17, 'Gunnar Considine DVM', 'Animi nemo vel aperiam.', '618.320.9115', '806.985.3588', 'illum-non-deserunt-quia-distinctio-aut-officia-eum', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(18, 18, 'Deion Hand', 'Totam repudiandae nulla ipsa facilis rerum provident assumenda.', '(463) 529-2944', '+1-651-842-7100', 'corrupti-ut-dolores-maiores-quis', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(19, 19, 'Prof. Shaun Beer DDS', 'Repellat ut voluptatem aut deleniti delectus.', '(680) 865-4625', '+1-629-605-1475', 'et-numquam-aliquam-fugiat-id-ut-eveniet', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(20, 20, 'Prof. Casandra Romaguera', 'Quia nihil repellat magnam quo.', '+1.443.234.5608', '+12402318626', 'debitis-amet-reiciendis-suscipit-molestiae-ut-cupiditate-ipsam', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(21, 21, 'Gianni Dibbert', 'Voluptas quae rem et et ut.', '628.276.0450', '678.230.4551', 'quia-ut-explicabo-temporibus-molestiae-sit-exercitationem-exercitationem-minima', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(22, 22, 'Americo Baumbach', 'Quae libero a amet voluptatem neque facilis quam.', '+1-845-915-5161', '(231) 384-7693', 'et-et-deserunt-est-velit', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(23, 23, 'Rosa Cassin', 'Suscipit sunt sed minima iste et saepe.', '1-559-625-7520', '1-503-846-2981', 'nisi-minus-dolores-omnis-adipisci-animi-non-dolores', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(24, 24, 'Dr. Claud Raynor', 'Qui voluptatem quisquam sapiente deleniti repudiandae voluptas id molestiae.', '+12025104629', '+1.762.973.0909', 'qui-nisi-eveniet-rerum-rerum', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(25, 25, 'Lulu Raynor', 'Qui dolorum quia dolorem vel nostrum ab totam.', '781-851-3633', '1-470-804-2984', 'et-ducimus-quibusdam-et-eum-ea-voluptate', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(26, 26, 'Anthony Predovic II', 'Et velit ducimus maxime omnis quia fuga.', '+1 (657) 525-4849', '769.676.4593', 'culpa-soluta-cum-numquam-consequatur-ratione-et', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(27, 27, 'Dr. Clark Sawayn', 'Amet magnam molestiae ipsam ea officia ullam ipsa.', '(406) 831-6418', '928-500-0293', 'laudantium-explicabo-inventore-tenetur-sed-omnis-veniam', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(28, 28, 'Cayla Torp', 'Debitis non temporibus consequatur eum.', '928.997.8648', '(928) 410-6636', 'et-vero-beatae-harum-accusantium-nesciunt', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(29, 29, 'Maverick Breitenberg', 'Sit impedit eaque ullam dolor eum ut aut.', '+1 (906) 249-6448', '540.979.6460', 'inventore-quas-expedita-totam-quos-ut', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(30, 30, 'Juana Jakubowski', 'Velit nemo consectetur perspiciatis dolor dolores eveniet.', '(601) 684-9860', '424-267-5603', 'autem-modi-unde-saepe-non-vel-quos-eveniet', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(31, 31, 'Yasmeen Hagenes', 'Unde sint ut alias ad enim.', '820.936.9802', '+18489325849', 'voluptas-et-reprehenderit-nostrum-eius-blanditiis', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(32, 32, 'Jacques Kulas', 'Enim quisquam esse beatae ex.', '930-464-4842', '609.318.4334', 'voluptatem-sit-quaerat-aut-sequi', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(33, 33, 'Stanford Carter', 'Sunt id corporis modi ipsam.', '551.999.6764', '(667) 315-8821', 'fugiat-ipsa-recusandae-optio', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(34, 34, 'Alanis Schiller Store', 'Maiores dolores aut laboriosam consequatur et ullam totam.', '820.440.0131', '559-323-4573', 'laudantium-tempora-iste-est-ut', '2022-02-04 16:49:26', '2022-02-08 15:13:49', NULL),
(35, 35, 'Easter Pacocha IV', 'Atque at et qui est non.', '(364) 366-9199', '1-814-223-5685', 'quia-aut-adipisci-cum-nihil-ut-inventore-in', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(36, 36, 'Samantha Watsica', 'Ad cupiditate ut quis rerum iste.', '479.313.5333', '+1-717-799-3610', 'quis-incidunt-rem-vitae-nihil-quidem', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(37, 37, 'Emmet Kemmer', 'Et vel recusandae porro possimus non illum.', '+16504309662', '1-678-702-7606', 'repudiandae-voluptatem-fugiat-velit-eum-iure-nisi-rerum', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(38, 38, 'Constance Dickinson', 'Labore ea et aperiam recusandae.', '573.716.3518', '+1-463-652-9898', 'molestiae-distinctio-necessitatibus-consequatur-delectus-sunt-sequi-corporis', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(39, 39, 'Bernice Fadel', 'Velit et hic ut veritatis quia exercitationem.', '445.343.4272', '980.766.4264', 'magnam-libero-eaque-aut-nemo-porro-illo', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(40, 40, 'Miss Lorine Hane Sr.', 'Iusto consectetur ut consequatur sed est repudiandae consequatur.', '1-341-531-7838', '+17708230151', 'aut-illum-voluptatum-dolor-veritatis-rerum-sed-sit', '2022-02-04 16:49:26', '2022-02-04 16:49:26', NULL),
(41, 10, 'Loja Teste', 'loja Teste de produtos de informatica', '77-7777-7777', '77-77777-7777', 'loja-teste', '2022-02-04 17:16:07', '2022-02-04 17:16:07', NULL),
(42, 6, 'Primeira Loja', 'teste', '777-777-7777', '777777', 'primeira-loja', '2022-02-04 22:44:07', '2022-02-04 22:44:07', NULL),
(43, 20, 'Loja teste com mensagens Flash', 'Loja teste com mensagem', '999999999', '999999999', 'loja-teste-com-mensagem', '2022-02-08 15:12:49', '2022-02-08 15:12:49', NULL),
(44, 41, 'Loja teste com usuario autenticado', 'Loja teste com usuario autenticado', '177879577', '+5575981270769', 'loja-teste-com-usuario-autenticado', '2022-02-11 16:56:00', '2022-02-17 18:03:40', 'stores/MR1RVKagbIG1Hx9yJrRSpVmvLUCJNlv8e65GYCX3.png'),
(45, 43, 'Vanny Sport Wear', 'Vanny Sport Wear - A sua Loja de artigos esportivos', '+5575981270769', '+5575981270769', 'vanny-sport-wear', '2022-02-18 15:35:04', '2022-02-18 15:35:04', 'stores/PcQWwBqoG0FWKG7Tm9N42EZppPShF5BjIjUtJTeC.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Odell Botsford', 'ghalvorson@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hLCoy0BnIS', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(2, 'Amelie Kassulke', 'ugrady@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '77XsrCKBuB', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(3, 'Juliana Torp', 'bednar.carmella@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BY9gSrrmrG', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(4, 'Prof. Albin Runolfsdottir', 'fadams@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '7Va1UT0MuM', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(5, 'Miss Francisca Koelpin PhD', 'zelma.robel@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MT3VxitAfD', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(6, 'Jazlyn Pollich', 'maiya.prohaska@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lpaYoJ7FXm', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(7, 'Mrs. Clotilde Jerde', 'jaida.bartoletti@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sRXlddjwCH', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(8, 'Vince Crona', 'rippin.myles@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'x8y4sW0XyA', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(9, 'Mr. Michale Jacobi DDS', 'tyreek69@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'D6vj4GGkPd', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(10, 'Mr. Jules Purdy MD', 'burdette.kreiger@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5k5lYD9HJT', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(11, 'Madaline Carroll', 'bbreitenberg@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WuQhQCFot7', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(12, 'Amari Harvey', 'fparisian@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8ccutLiYnp', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(13, 'Prof. Ida Skiles DDS', 'kpurdy@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gZzY4lxDcg', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(14, 'Jack Weber', 'chanel.ankunding@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HbV9WGHVzJ', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(15, 'Koby King', 'johnston.felipa@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sBAwg8afBy', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(16, 'Cade Baumbach V', 'efrain.marvin@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wZA93HDuoQ', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(17, 'Mose Nienow', 'ramon.schuppe@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cmNQ5sIKDw', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(18, 'Emie Kovacek', 'barbara11@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EzcMddtoUF', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(19, 'Myriam Schmidt', 'klubowitz@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'T5Mrw41zET', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(20, 'Prof. Kali Gutkowski', 'mking@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0wFF5vaYHu', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(21, 'Destini Klocko', 'jhirthe@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hfTHF9Sx3K', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(22, 'Prof. Rosendo Tremblay', 'pkreiger@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bQSkuFKR8n', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(23, 'Ms. Rozella Boyer', 'giovanny.lang@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Iz4x1RZEBr', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(24, 'Arch Lynch', 'ymedhurst@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'moXToobobP', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(25, 'Stephania Strosin', 'bbruen@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jcOJ2lO9vU', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(26, 'Prof. Deshawn Price DVM', 'prohaska.stone@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0nu3hbdRDG', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(27, 'Lera Pacocha', 'jerde.geovany@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Dv7hWNx9G3', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(28, 'Perry Koepp', 'leuschke.julia@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oxcYUZGZ5G', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(29, 'Miss Teresa Gusikowski MD', 'ivory.conn@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ucYxo1ZQzA', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(30, 'Ms. Larissa Wuckert', 'hyatt.cassie@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gBeX1jlSgl', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(31, 'Jacinto Abbott', 'reichel.tyrel@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'NVmpVA8WbX', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(32, 'Jo Mayer', 'pagac.vallie@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CBwCd8RoNU', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(33, 'Dr. Roselyn Grant MD', 'kuhic.stacey@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'aMOiNYNrlK', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(34, 'Prof. Zion Greenholt', 'rosamond10@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'f7z7fgEHjE', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(35, 'Constance Powlowski', 'marcia01@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9333SVuZIx', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(36, 'Kayleigh Kihn', 'carroll.von@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'borpkGS0Xc', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(37, 'Alexane Carroll', 'balistreri.danny@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FlAgh2w7FC', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(38, 'Filiberto Jacobson', 'nhermiston@example.org', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AAuCalXzgd', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(39, 'Ernestine Durgan', 'maya60@example.com', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5bzqsDVzJw', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(40, 'Mr. Clemens Wolff PhD', 'simonis.dwight@example.net', '2022-02-04 16:49:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'QKfaMcX2Yn', '2022-02-04 16:49:26', '2022-02-04 16:49:26'),
(41, 'Alexsandro Silva', 'alexsandro.silva77@outlook.com', NULL, '$2y$10$M4Fk3DsarYfQqXE6aLcld.rMedyIHqf77hy5tXChU71F2L5jo.9hW', NULL, '2022-02-11 15:34:34', '2022-02-11 15:34:34'),
(42, 'Rayssa de Santana Silva Santos', 'rayssa.ssantos75@gmail.com', NULL, '$2y$10$rIbAlZjG/UQ.3hKLAtIUuuPPkpyeDg.zmdRAxaprEnsDuNJpaSyqW', NULL, '2022-02-18 14:32:39', '2022-02-18 14:32:39'),
(43, 'Ivanildes de Santana Silva Santos', 'vanny.ssantos75@gmail.com', NULL, '$2y$10$WyNdk5BgoY94FT2wVVvu4.Tev0nLg0upLBMVgFOI4PNJVtF0sAB1a', NULL, '2022-02-18 14:35:39', '2022-02-18 14:35:39');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_orders`
--

CREATE TABLE `user_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagseguro_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagseguro_status` int(11) NOT NULL,
  `items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `user_orders`
--

INSERT INTO `user_orders` (`id`, `user_id`, `store_id`, `reference`, `pagseguro_code`, `pagseguro_status`, `items`, `created_at`, `updated_at`) VALUES
(1, 43, 42, 'XPTO', '97375F33-D7EC-4A90-91CE-6FBE3C852B4E', 1, 'a:1:{i:0;a:4:{s:4:\"name\";s:64:\"Kindle 10a. geração com bateria de longa duração - Cor Preta\";s:5:\"price\";s:6:\"400.00\";s:4:\"slug\";s:6:\"kindle\";s:6:\"amount\";s:1:\"1\";}}', '2022-02-24 16:46:08', '2022-02-24 16:46:08'),
(2, 43, 42, 'XPTO', 'FBCB52F5-539C-4E44-BEFF-3D12CA6422D7', 1, 'a:1:{i:0;a:4:{s:4:\"name\";s:71:\"Celular Xiaomi Note 8 64GB Rom 4GB Ram Dual Versión Global Space Black\";s:5:\"price\";s:7:\"1500.00\";s:4:\"slug\";s:70:\"celular-xiaomi-note-8-64gb-rom-4gb-ram-dual-version-global-space-black\";s:6:\"amount\";s:1:\"1\";}}', '2022-02-24 21:38:53', '2022-02-24 21:38:53'),
(3, 43, 42, 'XPTO', '7FBE2242-E246-4ED8-A8CE-F80EE821C708', 1, 'a:2:{i:0;a:5:{s:4:\"name\";s:71:\"Celular Xiaomi Note 8 64GB Rom 4GB Ram Dual Versión Global Space Black\";s:5:\"price\";s:7:\"1500.00\";s:8:\"store_id\";i:45;s:4:\"slug\";s:70:\"celular-xiaomi-note-8-64gb-rom-4gb-ram-dual-version-global-space-black\";s:6:\"amount\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:59:\"Smartwatch W27 PRO Series 7 NFC Tela Infinita 1.81\" - Preto\";s:5:\"price\";s:6:\"200.00\";s:8:\"store_id\";i:44;s:4:\"slug\";s:24:\"smartwatch-w27-proseries\";s:6:\"amount\";s:1:\"1\";}}', '2022-02-26 17:32:42', '2022-02-26 17:32:42'),
(4, 43, 42, 'XPTO', '52410076-B32A-429D-AC29-93DD5412AFD1', 1, 'a:2:{i:0;a:5:{s:4:\"name\";s:78:\"Capa de tecido para Novo Kindle Paperwhite (11ª geração - 2021) - Cor Preta\";s:5:\"price\";s:5:\"99.00\";s:8:\"store_id\";i:44;s:4:\"slug\";s:11:\"capa-kindle\";s:6:\"amount\";s:1:\"1\";}i:1;a:5:{s:4:\"name\";s:15:\"Leonel Miller V\";s:5:\"price\";s:4:\"7.53\";s:8:\"store_id\";i:1;s:4:\"slug\";s:24:\"eos-eum-enim-dolor-nihil\";s:6:\"amount\";s:1:\"1\";}}', '2022-02-26 17:35:51', '2022-02-26 17:35:51');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `category_product`
--
ALTER TABLE `category_product`
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `order_store`
--
ALTER TABLE `order_store`
  ADD KEY `order_store_store_id_foreign` (`store_id`),
  ADD KEY `order_store_order_id_foreign` (`order_id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_store_id_foreign` (`store_id`);

--
-- Índices para tabela `products_photos`
--
ALTER TABLE `products_photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_photos_product_id_foreign` (`product_id`);

--
-- Índices para tabela `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stores_user_id_foreign` (`user_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Índices para tabela `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_orders_user_id_foreign` (`user_id`),
  ADD KEY `user_orders_store_id_foreign` (`store_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de tabela `products_photos`
--
ALTER TABLE `products_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Limitadores para a tabela `order_store`
--
ALTER TABLE `order_store`
  ADD CONSTRAINT `order_store_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `user_orders` (`id`),
  ADD CONSTRAINT `order_store_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Limitadores para a tabela `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`);

--
-- Limitadores para a tabela `products_photos`
--
ALTER TABLE `products_photos`
  ADD CONSTRAINT `products_photos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Limitadores para a tabela `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `user_orders_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `user_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
