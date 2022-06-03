-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 03 juin 2022 à 17:29
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
(8, 5, 'Presse');

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
(3, 5, 'Interview du vigneron Cyril De Benoist du Domaine du Nozay', 'https://youtu.be/LYWENUhY0pw'),
(4, 5, 'Installation de la P-Box avec Cyril De Benoist vigneron du Domaine du Nozay', 'https://youtu.be/iiJ879gMDls'),
(5, 5, 'Genodics et la génodique', 'https://youtu.be/_xiawNir6Ok'),
(6, 5, 'La génodique : quand la musique renforce les plantes', 'https://youtu.be/umNKsCKSq10'),
(7, 5, '2013, TV Tours – La musique adoucit la vigne chez Alexandre Monmousseau à Vouvray', 'https://youtu.be/jvdHXt5d_HY'),
(8, 5, '2018, France Info – Réduire les pesticides grâce aux protéodies, Angélique Delahaye', 'https://youtu.be/J4Fh7WHUQ9w'),
(9, 8, 'Vignes : les bonnes pratiques de Christophe Charrier, viticulteur à Cognac', 'https://youtu.be/NJS3fxgPLYA'),
(10, 5, 'La génodique : le soin des plantes et des animaux en musique', 'https://youtu.be/TqIT4o-vmNs'),
(11, 5, 'La musique, un stimulant pour les plantes', 'https://youtu.be/pwvnGITLp2I'),
(12, 5, '2018, France 3 Gard, JT 19/20 le 24 mai – Esca, mildiou et flavescence dorée au Petit Chaumont', 'https://youtu.be/6N8Tj2GT60A'),
(13, 5, 'La fête la musique pourrait également s’adresser aux plantes vertes', 'https://youtu.be/-rU2IB0_fVg'),
(14, 5, '2014, France 3, J.T. 12/13 national le 31 janvier – Stimulation des endives chez Delahaye Maraîcher', 'https://youtu.be/6gaG4t0VZmo'),
(15, 5, '2018, Michel-Edouard Leclerc – La cave de Buzet pour protéger l’environnement', 'https://youtu.be/0mElV-rDTZg'),
(16, 5, '2016, Var Matin – Réduction de la mosaîque des courgettes avec des protéodies', 'https://youtu.be/6f3iMcAZhkM'),
(17, 5, '2016, Télématin – Prévention de la tavelure des pommes avec des protéodies', 'https://youtu.be/Cne2ACbj5wA'),
(18, 5, '2014, TV Suisse, le 12/03 – Réduction du sclérotinia sur des salades à Pont l’Evêque', 'https://youtu.be/yUwdYjuZZY4'),
(19, 5, '2011, Fr 3 Basse-Normandie – Réduction du sclérotinia sur des salades d’hiver', 'https://youtu.be/k8zojVI38jQ'),
(20, 5, '2016, Fr 3 Région Centre – Réduction de l’esca au Domaine Huet à Vouvray', 'https://youtu.be/RTiBMAwv510'),
(21, 5, 'La fête la musique pourrait également s’adresser aux plantes vertes', 'https://youtu.be/GJrd0KlQ1QU'),
(22, 5, 'Jouer de la musique à vos plantes pour les faire pousser – 12:45 sur France 3', 'https://youtu.be/_C5G_5NktXs'),
(23, 5, '2013, M6 le 8 septembre – La musique, médicament pour les vignes, en Champagne', 'https://youtu.be/5oLbiE4BXF0'),
(24, 5, 'Juin 2018 – Dossier « Musique ça pousse » – 19/20 sur France 3', 'https://youtu.be/ZHJd1a-OCCQ');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
