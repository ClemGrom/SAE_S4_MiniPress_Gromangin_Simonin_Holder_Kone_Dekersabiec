-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : sql
-- Généré le : jeu. 15 juin 2023 à 08:32
-- Version du serveur : 8.0.33
-- Version de PHP : 8.1.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `minipress`
--

-- --------------------------------------------------------

--
-- Structure de la table `ARTICLE`
--

CREATE TABLE `ARTICLE` (
  `id` int NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `resume` varchar(500) DEFAULT NULL,
  `contenu` text,
  `date_crea` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORIE`
--

CREATE TABLE `CATEGORIE` (
  `id` int NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CATEGORIE`
--

INSERT INTO `CATEGORIE` (`id`, `titre`, `description`) VALUES
(1, 'Actualité', "Informations complètes et à jour, compilées à partir de sources d'actualités du monde entier."),
(2, 'Evenements', 'Informations sur les evenements dans le grand est.'),
(3, 'Prévention', 'Attention, notre prévention vous vient en aide');

-- --------------------------------------------------------

--
-- Structure de la table `IMAGE`
--

CREATE TABLE `IMAGE` (
  `id` int NOT NULL,
  `categ_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `USER_STATUS`
--

CREATE TABLE `USER_STATUS` (
  `id` int NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `UTILISATEUR`
--

CREATE TABLE `UTILISATEUR` (
  `id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `passwd_hash` varchar(256) DEFAULT NULL,
  `activation_token` varchar(128) DEFAULT NULL,
  `activation_expires` timestamp NULL DEFAULT NULL,
  `renew_token` varchar(128) DEFAULT NULL,
  `renew_expires` timestamp NULL DEFAULT NULL,
  `user_status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ARTICLE`
--
ALTER TABLE `ARTICLE`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `CATEGORIE`
--
ALTER TABLE `CATEGORIE`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `IMAGE`
--
ALTER TABLE `IMAGE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categ_id` (`categ_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Index pour la table `USER_STATUS`
--
ALTER TABLE `USER_STATUS`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_status` (`user_status`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `IMAGE`
--
ALTER TABLE `IMAGE`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `CATEGORIE` (`id`),
  ADD CONSTRAINT `image_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `UTILISATEUR` (`id`);

--
-- Contraintes pour la table `UTILISATEUR`
--
ALTER TABLE `UTILISATEUR`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`user_status`) REFERENCES `USER_STATUS` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
