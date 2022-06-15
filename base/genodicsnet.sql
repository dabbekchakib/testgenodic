-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 15 juin 2022 à 05:12
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
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `publier` tinyint(1) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `utilisateur_id`, `article_id`, `contenu`, `created_at`, `publier`, `parent_id`) VALUES
(3, 4, 5, '<div>test comment</div>', '2022-06-08 15:05:30', 1, NULL),
(4, 6, 5, '<div>dfg fsghfg</div>', '2022-06-08 15:05:43', 0, NULL),
(5, 7, 5, 'test22', '2022-06-09 18:25:32', 0, NULL),
(6, 10, 5, 'test123', '2022-06-09 18:29:36', 1, NULL),
(7, 6, 5, '<div>fgjgfjfg</div>', '2022-06-15 03:40:30', 1, 3),
(8, 7, 5, 'global', '2022-06-15 04:13:24', 1, NULL),
(9, 7, 5, 'reponse', '2022-06-15 04:15:44', 1, 8),
(10, 7, 5, 'test11', '2022-06-15 04:27:14', 1, 3),
(11, 7, 5, 'yyy', '2022-06-15 04:42:12', 1, 9),
(12, 7, 5, 'gg', '2022-06-15 04:46:46', 1, 6);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BCFB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_67F068BC7294869C` (`article_id`),
  ADD KEY `IDX_67F068BC727ACA70` (`parent_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `commentaire` (`id`),
  ADD CONSTRAINT `FK_67F068BC7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_67F068BCFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
