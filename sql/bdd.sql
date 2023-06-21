-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : sql
-- Généré le : ven. 16 juin 2023 à 07:11
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
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `resume` varchar(500) DEFAULT NULL,
  `contenu` text,
  `date_crea` date DEFAULT NULL,
  `categ_id` int DEFAULT NULL,
  `author_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `titre`, `resume`, `contenu`, `date_crea`, `categ_id`, `author_id`) VALUES
(1, 'Nouvelles découvertes en astronomie', 'Des astronomes ont récemment fait une découverte majeure dans le domaine de l\'astronomie.', 'Depuis des siècles, les astronomes scrutent le ciel à la recherche de nouvelles planètes et de nouveaux mondes. Récemment, une équipe d\'astronomes a fait une avancée significative en découvrant une planète unique dans notre vaste univers : la planète Jules.\r\n\r\nJules, nommée en l\'honneur du célèbre astronome Jules Verne, se trouve à une distance impressionnante de notre système solaire, à des millions d\'années-lumière de la Terre. Cette planète fascinante présente des caractéristiques uniques qui la distinguent des autres planètes connues jusqu\'à présent.\r\n\r\nSelon les premières observations, Jules possède une atmosphère dense et complexe, composée principalement de gaz rares et de particules cosmiques. Les astronomes ont également détecté la présence de vastes océans d\'un liquide inconnu, ce qui suscite de nombreuses interrogations quant à la possibilité d\'une forme de vie extraterrestre.\r\n\r\nLes données recueillies jusqu\'à présent indiquent que Jules orbite autour d\'une étoile étrange et puissante, dont la masse et la luminosité dépassent de loin celles de notre Soleil. Cette étoile, nommée Éridan, présente des caractéristiques intrigantes qui intriguent les scientifiques et les poussent à approfondir leurs recherches sur la nature de cette étoile et de son impact sur la planète Jules.\r\n\r\nLes astronomes espèrent que l\'étude approfondie de la planète Jules fournira des informations précieuses sur la formation des planètes, l\'évolution des systèmes stellaires et peut-être même sur la possibilité de vie extraterrestre. Les recherches futures comprendront des observations détaillées à l\'aide de télescopes spatiaux avancés et de missions d\'exploration robotiques.\r\n\r\nEn conclusion, la découverte de la planète Jules constitue une avancée majeure dans le domaine de l\'astronomie. Cette planète mystérieuse offre de nouvelles perspectives passionnantes sur l\'univers et suscite de nombreuses questions sur la possibilité d\'une vie extraterrestre. Les astronomes continueront à étudier Jules de près, dans l\'espoir de percer les secrets de cet autre monde situé au-delà de notre portée actuelle.', '2023-06-14', 1, 1),
(2, 'Les dernières tendances de la mode', 'Découvrez les dernières tendances de la mode pour cette saison.', 'La mode est en constante évolution, et chaque saison apporte son lot de nouvelles tendances. Cette fois-ci, c\'est le costume jogging tong qui fait sensation. Cette combinaison improbable semble opposer deux mondes différents, mais crée en réalité une harmonie surprenante.\r\n\r\nLe costume jogging tong est la réponse parfaite à notre quête incessante d\'un confort ultime sans sacrifier le style. Imaginez-vous dans un ensemble de jogging luxueux, avec sa coupe décontractée et ses matières douces qui épousent votre corps. Ajoutez à cela une paire de tongs sophistiquées, aux détails raffinés et à la silhouette élégante.\r\n\r\nCette tendance a été popularisée par des icônes de la mode qui osent repousser les limites et combiner des éléments inattendus. Le contraste entre le sportswear et la chaussure de plage crée un effet visuel saisissant qui ne manquera pas de faire tourner les têtes.\r\n\r\nLe costume jogging tong peut être porté de différentes manières, en fonction de l\'occasion et de votre propre style. Pour une tenue décontractée, associez-le à un t-shirt basique et à des accessoires minimalistes. Vous obtiendrez ainsi un look urbain et tendance, idéal pour une sortie entre amis ou une journée de détente.\r\n\r\nSi vous souhaitez adopter une approche plus audacieuse, osez le costume jogging tong dans des teintes vives ou avec des motifs originaux. Complétez le look avec des bijoux statement et une pochette chic pour une allure résolument glamour et décontractée à la fois.\r\n\r\nIl est important de noter que cette tendance du costume jogging tong est avant tout une expression de la liberté individuelle en matière de style. Elle encourage chacun à exprimer sa créativité et à repousser les conventions établies.\r\n\r\nEn conclusion, le costume jogging tong est une tendance surprenante qui allie le confort du sportswear avec une touche d\'élégance. Osez cette combinaison inattendue et créez votre propre style en jouant avec les contrastes. La mode est une forme d\'expression personnelle, alors n\'hésitez pas à explorer de nouvelles tendances et à vous amuser avec votre garde-robe.', '2013-06-13', 1, NULL),
(3, 'Conseils pour un mode de vie sain', 'Découvrez des conseils simples pour maintenir un mode de vie sain et équilibré.', 'Adoptez une alimentation équilibrée: Priviégiez une alimentation riche en fruits, légumes, grains entiers, protéines maigres et graisses saines. Évitez les aliments transformés et les excès de sucre, de sel et de matières grasses.\r\n\r\nRestez hydraté: Buvez suffisamment d\'eau tout au long de la journée pour maintenir une bonne hydratation. Limitez votre consommation de boissons sucrées et d\'alcool.\r\n\r\nFaites de l\'exercice régulièrement: Pratiquez une activité physique modérée à intense au moins 30 minutes par jour, que ce soit la marche, la course, le vélo, la natation ou toute autre activité qui vous plaît.\r\n\r\nGérez votre stress: Trouvez des techniques de gestion du stress qui vous conviennent, comme la méditation, la respiration profonde, le yoga ou la pratique d\'un passe-temps relaxant.\r\n\r\nDormez suffisamment: Accordez une importance à votre sommeil en visant environ 7 à 8 heures de sommeil de qualité chaque nuit. Créez une routine de sommeil régulière et assurez-vous d\'avoir un environnement propice au repos.\r\n\r\nLimitez votre exposition aux substances nocives: Réduisez votre consommation de tabac, d\'alcool et d\'autres substances nocives pour votre santé. Évitez également l\'exposition à la fumée secondaire et aux polluants environnementaux.\r\n\r\nPrenez des pauses régulières: Si vous travaillez sur un ordinateur ou passez beaucoup de temps assis, faites des pauses fréquentes pour vous étirer, bouger et reposer vos yeux.', '1993-06-12', 2, NULL),
(4, 'Les meilleures destinations de voyage', 'Explorez les destinations de voyage les plus populaires et découvrez ce qu\'elles ont à offrir.', 'Le contenu de l\'article sur les meilleures destinations de voyage...', '1983-06-11', 2, NULL),
(5, 'Les nouvelles avancées technologiques', 'Découvrez les dernières avancées technologiques qui façonnent notre avenir.', 'Le contenu de l\'article sur les nouvelles avancées technologiques...', '1973-06-10', 3, 1),
(6, 'Recettes faciles pour les amateurs de cuisine', 'Découvrez des recettes simples et délicieuses pour les passionnés de cuisine.', 'Le contenu de l\'article sur les recettes faciles pour les amateurs de cuisine...', '1963-06-09', 3, NULL),
(7, 'Les films les plus attendus de l\'année', 'Découvrez les films les plus attendus qui sortiront prochainement au cinéma.', 'Le contenu de l\'article sur les films les plus attendus de l\'année...', '1953-06-08', 4, NULL),
(8, 'Les bienfaits de l\'exercice physique', 'Apprenez les nombreux avantages d\'une activité physique régulière pour la santé et le bien-être.', 'Le contenu de l\'article sur les bienfaits de l\'exercice physique...', '1943-06-07', 4, 1),
(9, 'Les dernières actualités économiques', 'Restez informé des derniers développements économiques et financiers à travers le monde.', 'Le contenu de l\'article sur les dernières actualités économiques...', '1933-06-06', 3, NULL),
(10, 'Les tendances en matière de décoration intérieure', 'Découvrez les dernières tendances en matière de décoration pour créer un intérieur moderne et élégant.', 'Le contenu de l\'article sur les tendances en matière de décoration intérieure...', '2033-06-05', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORIE`
--

CREATE TABLE `categorie` (
  `id` int NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CATEGORIE`
--

INSERT INTO `categorie` (`id`, `titre`, `description`) VALUES
(1, 'Actualité', 'Informations complètes et à jour, compilées à partir de sources d\'actualités du monde entier.'),
(2, 'Evenements', 'Informations sur les evenements dans le grand est.'),
(3, 'Prévention', 'Attention, notre prévention vous vient en aide'),
(4, 'Cuisine', 'Découvrez des recettes délicieuses et des conseils culinaires.'),
(5, 'Santé et bien-être', 'Informations et conseils pour maintenir une bonne santé physique et mentale.'),
(6, 'Voyages', 'Inspiration et conseils pour vos prochaines aventures.'),
(7, 'Technologie', 'Actualités et nouveautés technologiques.'),
(8, 'Sport et fitness', 'Conseils, entraînements et actualités sportives pour rester en forme.');

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int NOT NULL,
  `url` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `image2article`
--

CREATE TABLE `image2article` (
  `article_id` int NOT NULL,
  `image_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Structure de la table `user_status`
--

CREATE TABLE `user_status` (
  `id` int NOT NULL,
  `libelle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user_status`
--

INSERT INTO `user_status` (`id`, `libelle`) VALUES
(1, 'Inscrit'),
(2, 'Inscrit, admin'),
(3, 'Inscrit, auteur'),
(4, 'Inscrit, connecte'),
(5, 'Inscrit, connecte, admin'),
(6, 'Inscrit, connecte, auteur');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
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
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `username`, `email`, `passwd_hash`, `activation_token`, `activation_expires`, `renew_token`, `renew_expires`, `user_status`) VALUES
(1, 'Jules Ol D\'air', 'ruluis@gmail.503', 'EFIORJLKGDNJFDF?JKSJFNEJKF?DXJNVSEJIFNJKCVS', NULL, NULL, NULL, NULL, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categ_id` (`categ_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Index pour la table `CATEGORIE`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image2article`
--
ALTER TABLE `image2article`
  ADD KEY `article_id` (`article_id`),
  ADD KEY `image_id` (`image_id`);


--
-- Index pour la table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_status` (`user_status`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `CATEGORIE`
--
ALTER TABLE `categorie`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `categorie` (`id`),
  ADD CONSTRAINT `article_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `image2article`
--
ALTER TABLE `image2article`
    ADD CONSTRAINT `image2article_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
    ADD CONSTRAINT `image2article_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);
--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`user_status`) REFERENCES `user_status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
