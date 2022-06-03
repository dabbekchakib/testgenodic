-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 03 juin 2022 à 19:20
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `genodicsnet`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fichier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `auteur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `parent_id`, `label`) VALUES
(5, NULL, 'Media'),
(6, 5, 'Temoignages'),
(7, 5, 'Reportages'),
(8, 5, 'Presse'),
(9, 5, 'Web');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `publier` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220525125744', '2022-05-25 15:00:52', 475),
('DoctrineMigrations\\Version20220525130430', '2022-05-25 15:04:38', 196),
('DoctrineMigrations\\Version20220525130648', '2022-05-25 15:06:54', 35);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `categorie_id`, `titre`, `video_url`) VALUES
(3, 6, 'Interview du vigneron Cyril De Benoist du Domaine du Nozay', '<iframe width=\"100%\" height=\"200px\" src=\"https://www.youtube.com/embed/LYWENUhY0pw\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(4, 5, 'Installation de la P-Box avec Cyril De Benoist vigneron du Domaine du Nozay', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/iiJ879gMDls\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(5, 5, 'Genodics et la génodique', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/_xiawNir6Ok\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(6, 5, 'La génodique : quand la musique renforce les plantes', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/umNKsCKSq10\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(7, 8, '2013, TV Tours – La musique adoucit la vigne chez Alexandre Monmousseau à Vouvray', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/jvdHXt5d_HY\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(8, 8, '2018, France Info – Réduire les pesticides grâce aux protéodies, Angélique Delahaye', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/J4Fh7WHUQ9w\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(9, 8, 'Vignes : les bonnes pratiques de Christophe Charrier, viticulteur à Cognac', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/NJS3fxgPLYA\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(10, 7, 'La génodique : le soin des plantes et des animaux en musique', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/TqIT4o-vmNs\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(11, 7, 'La musique, un stimulant pour les plantes', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/pwvnGITLp2I\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(12, 8, '2018, France 3 Gard, JT 19/20 le 24 mai – Esca, mildiou et flavescence dorée au Petit Chaumont', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/6N8Tj2GT60A\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(13, 8, 'La fête la musique pourrait également s’adresser aux plantes vertes', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/-rU2IB0_fVg\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(14, 6, '2014, France 3, J.T. 12/13 national le 31 janvier – Stimulation des endives chez Delahaye Maraîcher', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/6gaG4t0VZmo\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(15, 6, '2018, Michel-Edouard Leclerc – La cave de Buzet pour protéger l’environnement', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/0mElV-rDTZg\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(16, 7, '2016, Var Matin – Réduction de la mosaîque des courgettes avec des protéodies', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/6f3iMcAZhkM\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(17, 6, '2016, Télématin – Prévention de la tavelure des pommes avec des protéodies', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/Cne2ACbj5wA\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(18, 6, '2014, TV Suisse, le 12/03 – Réduction du sclérotinia sur des salades à Pont l’Evêque', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/yUwdYjuZZY4\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(19, 8, '2011, Fr 3 Basse-Normandie – Réduction du sclérotinia sur des salades d’hiver', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/k8zojVI38jQ\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(20, 8, '2016, Fr 3 Région Centre – Réduction de l’esca au Domaine Huet à Vouvray', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/RTiBMAwv510\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(21, 6, 'La fête la musique pourrait également s’adresser aux plantes vertes', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/GJrd0KlQ1QU\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(22, 8, 'Jouer de la musique à vos plantes pour les faire pousser – 12:45 sur France 3', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/_C5G_5NktXs\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(23, 8, '2013, M6 le 8 septembre – La musique, médicament pour les vignes, en Champagne', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/5oLbiE4BXF0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(24, 5, 'Juin 2018 – Dossier « Musique ça pousse » – 19/20 sur France 3', '<iframe width=\"100%\" height=\"200\" src=\"https://www.youtube.com/embed/ZHJd1a-OCCQ\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(25, 9, 'Portrait radiophonique de Joël Sternheimer et de ses travaux, par Sarah Dirren, dans l\'émission \"Impatience\" de Nancy Ypsilantis diffusée le 25 juin 2012 par la radio 1ère de la Radio-Télévision-Suisse', '<iframe src=\"https://www.rts.ch/play/embed/?urn=urn:rts:audio:4057139\" width=\"100%\" height=\"200\" frameborder=\"0\" allowfullscreen=\"true\" allow=\"fullscreen; geolocation *; autoplay; encrypted-media\" name=\"Joël Sternheimer, musicien des protéines\"></iframe>'),
(26, 9, 'Balade dans les vignes avec Jean-Marie Pelt Emission \"CO2 mon amour\" sur France-Inter, le 23 février 2013 (de 4\'45\" à 12\'55\") Les données statistiques auxquelles Jean-Marie Pelt se réfère dans cette chronique sur la vigne', '<iframe src=\"https://cdn.radiofrance.fr/s3/cruiser-production/static/inter/sons/2013/02/s08/NET_FI_ef16ef78-7275-4850-91c6-fc208ae85380.mp3\" width=\"100%\" height=\"200\" layout=\"responsive\" frameborder=\"0\" scrolling=\"no\"></iframe>');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `url`, `titre`, `description`, `image`) VALUES
(1, 'http://www.bekkoame.ne.jp/~dr.fuk/index.html', 'Protein Music', '<div>Un site en japonais, anglais et français sur les protéodies.&nbsp;</div>', 'Cover1.gif'),
(2, 'http://www.genodics.com/', 'Genodics.com', '<div>Développement d’applications agro-alimentaires et environnementales des protéodies.&nbsp;</div>', 'genodics.png');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `nom`, `prenom`, `photo`) VALUES
(1, 'dabbekchakib@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$UxwE/xNbxygxZGH6RCymcedPcid.YdcmQQATzE8MWW65x.iM8PapS', 'Dabbek1', 'Chakib1', 'leilani-angel-K84vnnzxmTQ-unsplash.jpg'),
(3, 'chakibemploi@hotmail.fr', '{\"1\":\"ROLE_USER\"}', '$2y$13$UxwE/xNbxygxZGH6RCymcedPcid.YdcmQQATzE8MWW65x.iM8PapS	', 'Dabbek2', 'Chakib2', NULL),
(4, 'mhasni.jsk.94j@unnuhol.ga', '[]', '123456', 'test411', 'test411', NULL),
(5, 'contact@kvbvby.de', '[]', '123456', 'test411CC', 'test411CCC', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E66BCF5E72D` (`categorie_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_497DD634727ACA70` (`parent_id`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCFB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_67F068BC7294869C` (`article_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6A2CA10CBCF5E72D` (`categorie_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E66BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `FK_497DD634727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_67F068BCFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10CBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;