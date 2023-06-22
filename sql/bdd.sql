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
(1, 'Nouvelles découvertes en astronomie', 'Des astronomes ont récemment fait une découverte majeure dans le domaine de l\'astronomie.', '# Depuis des siècles, \r\nles astronomes scrutent le ciel à la recherche de nouvelles **planètes et de nouveaux mondes.** Récemment, une équipe d\'astronomes a fait une avancée significative en découvrant une planète unique dans notre vaste univers : la planète Jules.\r\n\r\n## Jules, \r\nnommée en l\'honneur du célèbre astronome Jules Verne, se trouve à une distance impressionnante de notre système solaire, à des millions d\'années-lumière de la Terre. Cette planète fascinante présente des caractéristiques uniques qui la distinguent des autres planètes connues jusqu\'à présent.\r\n\r\nSelon les premières observations, Jules possède une atmosphère dense et complexe, composée principalement de gaz rares et de particules cosmiques. Les astronomes ont également détecté la présence de vastes océans d\'un liquide inconnu, ce qui suscite de nombreuses interrogations quant à la possibilité d\'une forme de vie extraterrestre.\r\n\r\nLes données recueillies jusqu\'à présent indiquent que Jules orbite autour d\'une étoile étrange et puissante, dont la masse et la luminosité dépassent de loin celles de notre Soleil. Cette étoile, nommée Éridan, présente des caractéristiques intrigantes qui intriguent les scientifiques et les poussent à approfondir leurs recherches sur la nature de cette étoile et de son impact sur la planète Jules.\r\n\r\nLes astronomes espèrent que l\'étude approfondie de la planète Jules fournira des informations précieuses sur la formation des planètes, l\'évolution des systèmes stellaires et peut-être même sur la possibilité de vie extraterrestre. Les recherches futures comprendront des observations détaillées à l\'aide de télescopes spatiaux avancés et de missions d\'exploration robotiques.\r\n\r\nEn conclusion, la découverte de la planète Jules constitue une avancée majeure dans le domaine de l\'astronomie. Cette planète mystérieuse offre de nouvelles perspectives passionnantes sur l\'univers et suscite de nombreuses questions sur la possibilité d\'une vie extraterrestre. Les astronomes continueront à étudier Jules de près, dans l\'espoir de percer les secrets de cet autre monde situé au-delà de notre portée actuelle.', '2023-06-14', 1, 1),
(2, 'Les dernières tendances de la mode', 'Découvrez les dernières tendances de la mode pour cette saison.', '**La mode** est en constante évolution, et chaque saison apporte son lot de nouvelles tendances. Cette fois-ci, c\'est le costume jogging tong qui fait sensation. Cette combinaison improbable semble opposer deux mondes différents, mais crée en réalité une harmonie surprenante.\r\n\r\n__Le costume jogging tong est la réponse parfaite à notre quête incessante d\'un confort ultime sans sacrifier le style. Imaginez-vous dans un ensemble de jogging luxueux, avec sa coupe décontractée et ses matières douces qui épousent votre corps. Ajoutez à cela une paire de tongs sophistiquées, aux détails raffinés et à la silhouette élégante.__\r\n\r\n### Cette tendance a été popularisée par des icônes de la mode qui osent repousser les limites et combiner des éléments inattendus. \r\nLe contraste entre le sportswear et la chaussure de plage crée un effet visuel saisissant qui ne manquera pas de faire tourner les têtes.\r\n\r\nLe costume jogging tong peut être porté de différentes manières, en fonction de l\'occasion et de votre propre style. Pour une tenue décontractée, associez-le à un t-shirt basique et à des accessoires minimalistes. Vous obtiendrez ainsi un look urbain et tendance, idéal pour une sortie entre amis ou une journée de détente.\r\n\r\nSi vous souhaitez adopter une approche plus audacieuse, osez le costume jogging tong dans des teintes vives ou avec des motifs originaux. Complétez le look avec des bijoux statement et une pochette chic pour une allure résolument glamour et décontractée à la fois.\r\n\r\nIl est important de noter que cette tendance du costume jogging tong est avant tout une expression de la liberté individuelle en matière de style. Elle encourage chacun à exprimer sa créativité et à repousser les conventions établies.\r\n\r\nEn conclusion, le costume jogging tong est une tendance surprenante qui allie le confort du sportswear avec une touche d\'élégance. Osez cette combinaison inattendue et créez votre propre style en jouant avec les contrastes. La mode est une forme d\'expression personnelle, alors n\'hésitez pas à explorer de nouvelles tendances et à vous amuser avec votre garde-robe.', '2013-06-13', 1, 2),
(3, 'Conseils pour un mode de vie sain', 'Découvrez des conseils simples pour maintenir un mode de vie sain et équilibré.', '# Adoptez une alimentation équilibrée: \r\nPriviégiez une alimentation riche en fruits, légumes, grains entiers, protéines maigres et graisses saines. Évitez les aliments transformés et les excès de sucre, de sel et de matières grasses.\r\n\r\n**Restez hydraté:** Buvez suffisamment d\'eau tout au long de la journée pour maintenir une bonne hydratation. Limitez votre consommation de boissons sucrées et d\'alcool.\r\n\r\nFaites de l\'exercice régulièrement: Pratiquez une activité physique modérée à intense au moins 30 minutes par jour, que ce soit la marche, la course, le vélo, la natation ou toute autre activité qui vous plaît.\r\n\r\nGérez votre stress: Trouvez des techniques de gestion du stress qui vous conviennent, comme la méditation, la respiration profonde, le yoga ou la pratique d\'un passe-temps relaxant.\r\n\r\nDormez suffisamment: Accordez une importance à votre sommeil en visant environ 7 à 8 heures de sommeil de qualité chaque nuit. Créez une routine de sommeil régulière et assurez-vous d\'avoir un environnement propice au repos.\r\n\r\nLimitez votre exposition aux substances nocives: Réduisez votre consommation de tabac, d\'alcool et d\'autres substances nocives pour votre santé. Évitez également l\'exposition à la fumée secondaire et aux polluants environnementaux.\r\n\r\nPrenez des pauses régulières: Si vous travaillez sur un ordinateur ou passez beaucoup de temps assis, faites des pauses fréquentes pour vous étirer, bouger et reposer vos yeux.', '1993-06-12', 2, 2),
(4, 'Les meilleures destinations de voyage', 'Explorez les destinations de voyage les plus populaires et découvrez ce qu\'elles ont à offrir.', 'Le monde regorge de merveilleuses destinations de voyage qui offrent une variété d\'expériences uniques et inoubliables. Que vous soyez un aventurier passionné, un amoureux de la nature ou un fanatique de la culture, il y a une destination qui comblera tous vos désirs. Voici une liste des meilleures destinations de voyage à ne pas manquer.\r\n\r\n# 1. Paris, France\r\nParis, la ville des lumières, est un choix évident pour les amoureux de la culture et de la romance. Des icônes emblématiques telles que la Tour Eiffel, le Louvre et la Cathédrale Notre-Dame vous émerveilleront. Flânez le long de la Seine, dégustez de délicieux croissants dans les cafés pittoresques et imprégnez-vous de l\'atmosphère artistique qui règne dans la capitale française.\r\n\r\n# 2. Tokyo, Japon\r\nTokyo est une métropole animée qui mélange harmonieusement tradition et modernité. Des gratte-ciel scintillants de Shinjuku aux temples sereins de Asakusa, vous découvrirez une ville fascinante. Explorez les quartiers électriques de Shibuya et Akihabara, goûtez aux délices culinaires de la cuisine japonaise et assistez à un spectacle de sumo pour une expérience culturelle inoubliable.\r\n\r\n# 3. Le Cap, Afrique du Sud\r\nLe Cap offre une beauté naturelle à couper le souffle avec son paysage montagneux spectaculaire et ses magnifiques plages. Faites une randonnée jusqu\'au sommet de la Montagne de la Table pour admirer une vue panoramique sur la ville. Explorez les vignobles environnants et dégustez des vins primés, ou partez à la découverte de la faune lors d\'un safari dans la réserve de Kruger.\r\n\r\n# 4. Rio de Janeiro, Brésil\r\nRio de Janeiro est une ville animée et exubérante qui vibre au rythme de la samba. Profitez des célèbres plages de Copacabana et Ipanema, montez au sommet du Mont du Pain de Sucre pour une vue imprenable sur la baie, et visitez le Christ Rédempteur sur le mont du Corcovado. Assistez à un carnaval coloré et laissez-vous emporter par l\'énergie contagieuse de cette ville envoûtante.\r\n\r\n# 5. Queenstown, Nouvelle-Zélande\r\nQueenstown est un paradis pour les amateurs d\'aventure et les amoureux de la nature. Située au bord du lac Wakatipu, entourée de montagnes majestueuses, Queenstown offre une multitude d\'activités passionnantes telles que le saut à l\'élastique, le parapente, le ski et le rafting en eaux vives. Ne manquez pas l\'occasion de visiter les paysages à couper le souffle du parc national de Fiordland, à proximité.', '1983-06-11', 2, NULL),
(5, 'Les nouvelles avancées technologiques', 'Découvrez les dernières avancées technologiques qui façonnent notre avenir.', 'Les avancées technologiques sont à l\'avant-garde de notre société moderne, révolutionnant la façon dont nous vivons, __travaillons et interagissons avec le monde qui nous entoure. Chaque année apporte son lot de découvertes et d\'innovations qui repoussent les limites de ce qui est possible. Voici un aperçu des nouvelles avancées technologiques qui sont en train de façonner notre avenir.__\r\n\r\n# 1. Intelligence Artificielle (IA)\r\nL\'intelligence artificielle est l\'un des domaines technologiques les plus en vogue de nos jours. Les progrès dans ce domaine ont permis de développer des systèmes capables d\'apprentissage automatique, de traitement du langage naturel et de prise de décision autonome. De l\'assistance virtuelle dans nos smartphones aux voitures autonomes, l\'IA est omniprésente et continue d\'évoluer rapidement, offrant des perspectives passionnantes pour l\'avenir.\r\n\r\n# 2. Internet des Objets (IoT)\r\nL\'Internet des Objets désigne la connectivité entre les objets physiques et les réseaux numériques. Grâce à des capteurs et à des dispositifs intelligents, les objets du quotidien peuvent communiquer entre eux et avec les utilisateurs. Les maisons intelligentes, les voitures connectées et les villes intelligentes sont quelques exemples de l\'impact de l\'IoT. Cette technologie ouvre la voie à une meilleure efficacité, à une automatisation accrue et à de nouvelles possibilités dans divers domaines, tels que la santé, les transports et la gestion de l\'énergie.\r\n\r\n# 3. Réalité Virtuelle (RV) et Réalité Augmentée (RA)\r\nLa réalité virtuelle et la réalité augmentée sont en train de révolutionner notre façon d\'interagir avec les environnements virtuels et réels. La réalité virtuelle plonge les utilisateurs dans des mondes entièrement virtuels, offrant des expériences immersives dans des jeux, des simulations et même des formations professionnelles. La réalité augmentée, quant à elle, superpose des éléments virtuels au monde réel, créant ainsi des possibilités passionnantes dans des domaines tels que le commerce, l\'éducation et le divertissement.\r\n\r\n# 4. Blockchain\r\nLa technologie de la blockchain a été popularisée par les cryptomonnaies, mais elle offre bien plus que cela. Cette technologie décentralisée permet de stocker et de vérifier de manière sécurisée des transactions, des contrats et des informations. Elle offre des avantages tels que la transparence, la sécurité et l\'immuabilité des données. La blockchain a le potentiel de révolutionner de nombreux secteurs, notamment la finance, la logistique et l\'administration publique.\r\n\r\n# 5. Impression 3D\r\nL\'impression 3D a fait des progrès significatifs au cours des dernières années. Elle permet la création de modèles physiques à partir de conceptions numériques, ouvrant ainsi de nouvelles perspectives dans la fabrication, le prototypage rapide, la médecine et même la construction. ', '1973-06-10', 3, 1),
(6, 'Recettes faciles pour les amateurs de cuisine', 'Découvrez des recettes simples et délicieuses pour les passionnés de cuisine.', 'La cuisine est un terrain de jeu infini où les amateurs culinaires peuvent laisser libre cours à leur créativité et explorer de nouvelles saveurs. Si vous êtes à la recherche de recettes faciles mais surprenantes, voici quelques idées pour éveiller vos papilles avec des combinaisons atypiques.\r\n\r\n# 1. Toast à l\'avocat avec une touche sucrée\r\nL\'avocat est souvent associé à des plats salés, mais avez-vous déjà envisagé de l\'associer à une touche sucrée ? Préparez un toast à l\'avocat en y ajoutant du miel et une pincée de piment de Cayenne pour un mélange étonnant de saveurs sucrées et épicées. Terminez en saupoudrant quelques graines de sésame pour ajouter une touche de croquant. Vous serez surpris par le mariage délicieux entre le crémeux de l\'avocat et le sucré du miel.\r\n\r\n# 2. Pizza aux fruits\r\nOubliez les pizzas traditionnelles garnies de fromage et de pepperoni. Essayez une pizza aux fruits pour une expérience gustative unique. Étalez une base de pâte à pizza et ajoutez-y des tranches de fruits frais tels que les pêches, les figues ou les fraises. Saupoudrez de fromage de chèvre émietté et de feuilles de basilic pour un contraste surprenant entre le sucré des fruits et le salé du fromage. Cette pizza colorée et originale sera un régal pour vos papilles.\r\n\r\n# 3. Risotto au chocolat\r\nLe risotto est un plat italien crémeux et savoureux généralement préparé avec du riz, du bouillon et divers ingrédients. Ajoutez une touche inattendue à votre risotto en le parfumant avec du chocolat noir. Préparez-le comme d\'habitude en utilisant du bouillon de légumes et du riz Arborio, puis ajoutez du chocolat noir râpé et remuez jusqu\'à ce qu\'il fonde et se mélange harmonieusement. Le résultat est un risotto velouté avec une légère amertume chocolatée qui surprendra vos papilles.', '1963-06-09', 3, 3),
(7, 'Les films les plus attendus de l\'année', 'Découvrez les films les plus attendus qui sortiront prochainement au cinéma.', 'L\'année en cours promet d\'être passionnante pour les cinéphiles du monde entier, avec une liste impressionnante de films très attendus qui vont captiver les spectateurs. Des superproductions hollywoodiennes aux films indépendants novateurs, voici un aperçu des films les plus attendus de l\'année.\r\n\r\n# 1. \"Dune\" - Réalisateur : Denis Villeneuve \r\nAdaptation du célèbre roman de science-fiction de Frank Herbert, \"Dune\" est l\'un des films les plus attendus de l\'année. Réalisé par Denis Villeneuve, ce film épique présente un casting incroyable, avec Timothée Chalamet, Rebecca Ferguson, Oscar Isaac et Zendaya. Plongez dans un univers futuriste et explorez les mystères d\'une planète désertique remplie de conflits politiques et de pouvoirs surnaturels.\r\n\r\n# 2. \"No Time to Die\" - Réalisateur : Cary Joji Fukunaga\r\nLes fans de James Bond attendent avec impatience le dernier opus de la franchise légendaire. \"No Time to Die\" marque la dernière apparition de Daniel Craig dans le rôle emblématique de l\'agent secret britannique. Réalisé par Cary Joji Fukunaga, ce film d\'action promet des scènes palpitantes, des rebondissements captivants et des performances exceptionnelles.\r\n\r\n# 3. \"Spider-Man: No Way Home\" - Réalisateur : Jon Watts \r\nLes fans de super-héros seront ravis de retrouver l\'homme-araignée dans \"Spider-Man: No Way Home\". Ce film tant attendu continue l\'histoire de Peter Parker, interprété par Tom Holland, et promet d\'introduire des éléments multiversels avec le retour de personnages emblématiques des précédentes adaptations de __Spider-Man. Jon Watts revient à la réalisation pour offrir une aventure palpitante et remplie d\'action__.\r\n', '1953-06-08', 4, NULL),
(8, 'Les bienfaits de l\'exercice physique', 'Apprenez les nombreux avantages d\'une activité physique régulière pour la santé et le bien-être.', 'L\'exercice physique est essentiel pour maintenir une bonne santé et améliorer notre bien-être global. Que ce soit sous la forme d\'une activité sportive intense ou d\'une simple marche quotidienne, l\'exercice **régulier présente de nombreux bienfaits pour notre corps et notre esprit. Voici un aperçu des avantages que vous pouvez tirer de l\'exercice physique.**\r\n\r\n# 1. Amélioration de la condition physique\r\nL\'exercice régulier permet de renforcer notre système cardiovasculaire, d\'augmenter notre endurance et d\'améliorer notre force musculaire. En pratiquant des activités physiques telles que la course à pied, la natation ou le vélo, nous améliorons notre capacité à respirer, à maintenir notre rythme cardiaque optimal et à développer une musculature saine. Cela se traduit par une meilleure condition physique générale, une énergie accrue et une capacité à accomplir nos tâches quotidiennes plus facilement.\r\n\r\n2. Gestion du poids\r\nL\'exercice régulier est un allié précieux dans la gestion du poids. En combinant l\'activité physique avec une alimentation équilibrée, nous pouvons brûler des calories, favoriser la perte de graisse et maintenir un poids santé. L\'activité physique aide également à renforcer notre métabolisme, ce qui nous permet de brûler des calories même au repos. Il est important de trouver une activité que vous aimez, car cela vous encouragera à rester régulier et à intégrer l\'exercice dans votre routine quotidienne.\r\n\r\n3. Réduction du stress et de l\'anxiété\r\nL\'exercice physique est un excellent moyen de soulager le stress et l\'anxiété. Lorsque nous nous engageons dans une activité physique, notre corps libère des endorphines, des substances chimiques qui agissent comme des analgésiques naturels et des antidépresseurs. Cela nous procure une sensation de bien-être et de détente. De plus, l\'exercice régulier peut aider à améliorer notre sommeil, à réduire les symptômes de la dépression et à renforcer notre estime de soi.\r\n\r\n# 4. Renforcement des fonctions cognitives\r\nL\'exercice physique n\'a pas seulement des bienfaits physiques, mais aussi des effets positifs sur notre fonctionnement cérébral. Des études ont montré que l\'exercice régulier peut améliorer notre mémoire, notre concentration et notre capacité à résoudre des problèmes. L\'activité physique augmente le débit sanguin vers le cerveau, favorise la croissance de nouvelles cellules cérébrales et stimule la libération de substances chimiques bénéfiques pour le cerveau.', '1943-06-07', 4, 1),
(9, 'Les dernières actualités économiques', 'Restez informé des derniers développements économiques et financiers à travers le monde.', 'L\'économie mondiale est un domaine en constante évolution, influencé par de nombreux facteurs tels que les politiques gouvernementales, les avancées technologiques et les changements sociaux. Voici un aperçu des dernières actualités économiques, mettant en évidence les tendances émergentes et les défis auxquels sont confrontées les entreprises.\r\n\r\n# 1. Ralentissement économique mondial\r\nCes derniers mois, plusieurs économies majeures ont fait face à un ralentissement économique. Des facteurs tels que l\'augmentation des coûts de production, les tensions commerciales internationales et l\'incertitude géopolitique ont contribué à cette situation. Les entreprises doivent s\'adapter à ces conditions économiques changeantes en ajustant leurs stratégies commerciales et en recherchant de nouvelles opportunités de croissance.\r\n\r\n# 2. Transition vers une économie durable\r\nLa durabilité et la responsabilité environnementale sont devenues des préoccupations majeures dans le monde des affaires. Les entreprises sont de plus en plus conscientes de leur impact sur l\'environnement et cherchent à adopter des pratiques commerciales durables. Des initiatives telles que l\'économie circulaire, l\'utilisation d\'énergies renouvelables et la réduction des émissions de carbone sont devenues des priorités pour de nombreuses entreprises soucieuses de l\'avenir de la planète.\r\n\r\n# 3. Transformation numérique\r\nLa transformation numérique continue de remodeler les modèles d\'affaires et les industries. Les avancées technologiques telles que l\'intelligence artificielle, l\'Internet des objets et la blockchain ont ouvert de nouvelles opportunités, tout en créant des défis pour les entreprises. La numérisation des processus, l\'amélioration de l\'expérience client et la gestion efficace des données sont désormais essentielles pour rester compétitif sur le marché mondial.\r\n\r\n# 4. Main-d\'œuvre et automatisation\r\nL\'évolution du marché du travail est un sujet brûlant dans les actualités économiques récentes. L\'automatisation croissante et l\'intelligence artificielle suscitent des interrogations quant à l\'avenir de l\'emploi. Les entreprises doivent trouver un équilibre entre l\'automatisation des tâches répétitives et la valorisation des compétences humaines uniques, tout en veillant à la formation et à l\'adaptation des travailleurs face à ces changements.\r\n\r\n# 5. Commerce international et tensions commerciales\r\nLes tensions commerciales entre les principales puissances économiques ont un impact significatif sur le commerce international. Les récentes escalades des tarifs douaniers et les négociations commerciales tendues ont créé une incertitude pour les entreprises opérant à l\'échelle mondiale. La recherche de nouvelles opportunités sur les marchés émergents et la diversification des chaînes d\'approvisionnement sont des stratégies clés pour atténuer les risques associés à ces tensions.', '1933-06-06', 3, 3),
(10, 'Les tendances en matière de décoration intérieure', 'Découvrez les dernières tendances en matière de décoration pour créer un intérieur moderne et élégant.', 'La décoration intérieure est un domaine en constante évolution, où de nouvelles tendances et idées émergent chaque année pour transformer nos espaces de vie. Cette année, les designers d\'intérieur repoussent les limites de la créativité et de l\'innovation, en proposant des concepts audacieux qui reflètent notre désir de confort, de durabilité et d\'esthétique. Voici un aperçu des tendances émergentes qui redéfinissent la décoration intérieure.\r\n\r\n# Exploration des Couleurs Naturelles\r\nL\'année en cours est marquée par un retour aux sources, avec une utilisation accrue de couleurs naturelles dans la décoration intérieure. Les tons terreux tels que les bruns chauds, les verts mousse et les nuances de sable gagnent en popularité, créant une atmosphère apaisante et organique. Cette tendance met en valeur les matériaux naturels tels que le bois, la pierre et le rotin, offrant une sensation de connexion avec la nature et une harmonie visuelle dans les espaces.\r\n\r\n# Fusion des Styles\r\nLes designers d\'intérieur jouent avec l\'idée de fusionner différents styles pour créer des intérieurs uniques et personnalisés. Des mariages inattendus tels que le mélange du minimalisme avec des éléments bohèmes, ou l\'association du vintage avec des touches industrielles, apportent une dimension éclectique et originale aux espaces. Cette tendance encourage l\'expérimentation et permet de créer des environnements qui reflètent la personnalité et les goûts individuels.\r\n\r\n# L\'Artisanat Fait Main\r\nLe retour à l\'artisanat et à la créativité fait partie intégrante des tendances actuelles en matière de décoration intérieure. Les pièces uniques fabriquées à la main ajoutent une touche d\'authenticité et de caractère aux espaces. Que ce soit à travers des céramiques artisanales, des tissages en macramé ou des meubles sur mesure, l\'accent est mis sur la valeur du travail artisanal et sur la création d\'objets uniques qui racontent une histoire.\r\n\r\n# Durabilité et Éco-responsabilité\r\nLa sensibilisation à l\'environnement influence de plus en plus les choix de décoration intérieure. Les matériaux durables et respectueux de l\'environnement, tels que le bois certifié FSC, le bambou, le liège et les textiles recyclés, gagnent en popularité. Les consommateurs recherchent des produits fabriqués de manière éthique, réduisant ainsi leur empreinte écologique. Cette tendance encourage également la réutilisation et le recyclage des objets, donnant une seconde vie aux meubles et aux accessoires anciens.\r\n\r\n# Focus sur le Bien-Être\r\nLa création d\'espaces qui favorisent le bien-être et la détente est une tendance majeure cette année. Les intérieurs sont conçus pour offrir une atmosphère sereine et harmonieuse, en intégrant des éléments tels que l\'éclairage naturel, les plantes d\'intérieur et les zones de méditation. Les coins cosy avec des tapis moelleux, des coussins confortables et des textures douces sont également privilégiés pour créer des espaces de relaxation et de ressourcement.\r\n\r\n# Technologie Intelligente\r\nLa technologie intelligente continue de se développer et de s\'intégrer dans nos espaces de vie. Des appareils domotiques contrôlés par la voix aux systèmes d\'éclairage et de climatisation intelligents, la technologie facilite la gestion et l\'optimisation de notre environnement intérieur. Les solutions intelligentes offrent confort, sécurité et efficacité énergétique, tout en s\'intégrant harmonieusement à l\'esthétique globale de l\'espace.\r\n\r\nCette année, la décoration intérieure s\'inspire de l\'authenticité, de la durabilité et du bien-être, tout en célébrant la créativité et l\'individualité. Que vous soyez attiré par les couleurs naturelles, les mélanges de styles audacieux ou l\'artisanat fait main, ces tendances vous invitent à repenser votre espace de vie et à créer un environnement qui vous ressemble. Explorez ces idées novatrices et laissez libre cours à votre imagination pour transformer votre intérieur en un lieu qui vous inspire et vous nourrit à la fois sur le plan esthétique et émotionnel.', '2033-06-05', 1, 3),
(11, 'Santé et Bien-être: Les Clés d\'une Vie Équilibrée', 'La santé et le bien-être sont des éléments fondamentaux de notre vie quotidienne. Alors que le monde moderne nous pousse souvent à un rythme effréné, il est essentiel de prendre du temps pour prendre soin de nous-mêmes. Cet article mettra en lumière l\'importance de la santé et du bien-être, en fournissant des conseils pratiques pour cultiver une vie équilibrée et épanouissante.', '#Adoptez une alimentation saine:\r\nUne alimentation équilibrée est la pierre angulaire d\'une bonne santé. Veillez à consommer une variété de fruits et légumes, des protéines maigres, des glucides complexes et des graisses saines. Évitez les aliments transformés riches en sucres et en gras saturés. Boire suffisamment d\'eau est également crucial pour maintenir une bonne hydratation.\r\n\r\n#Faites de l\'exercice régulièrement:\r\nL\'activité physique est essentielle pour renforcer notre corps et notre esprit. Essayez de vous engager dans une activité physique régulière, que ce soit par le biais d\'une routine d\'exercice en salle, de la pratique d\'un sport ou de simples promenades en plein air. L\'exercice libère des endorphines, améliore la circulation sanguine et réduit le stress.\r\n\r\n#Priorisez le sommeil:\r\nLe sommeil est souvent négligé dans notre société moderne, mais il joue un rôle crucial dans notre bien-être global. Établissez une routine de sommeil régulière et veillez à dormir environ 7 à 8 heures par nuit. Créez un environnement propice au sommeil en évitant les distractions, en limitant l\'exposition à la lumière bleue des écrans avant de dormir et en favorisant la relaxation avant de vous coucher.\r\n\r\n#Gérez le stress:\r\nLe stress peut avoir un impact négatif sur notre santé physique et mentale. Trouvez des techniques de gestion du stress qui fonctionnent pour vous, telles que la méditation, la respiration profonde, le yoga ou la pratique d\'un hobby relaxant. Apprenez à vous déconnecter régulièrement, à prendre du temps pour vous et à cultiver des pensées positives.\r\n\r\n#Cultivez des relations saines:\r\nNotre bien-être émotionnel dépend en grande partie de la qualité de nos relations avec les autres. Nourrissez des relations saines et positives avec votre famille, vos amis et votre communauté. Partagez vos joies, vos préoccupations et vos défis avec vos proches et offrez-leur également votre soutien. Ces liens sociaux forts contribuent à notre épanouissement personnel.\r\n\r\n#Prenez soin de votre santé mentale:\r\nLa santé mentale est tout aussi importante que la santé physique. Si vous ressentez des difficultés émotionnelles ou mentales, n\'hésitez pas à demander de l\'aide à un professionnel de la santé mentale. Priorisez l\'auto-soin en pratiquant des activités qui vous apaisent, en accordant du temps pour vous-même et en faisant des choses qui vous procurent du plaisir.', '2023-06-22', 5, 2),
(12, '7 Habitudes pour une Santé optimale', 'La santé et le bien-être sont des aspects essentiels de notre vie quotidienne. Cultiver des habitudes saines peut avoir un impact significatif sur notre qualité de vie. Cet article mettra en avant 7 habitudes clés pour atteindre une santé et un bien-être optimaux, en fournissant des conseils pratiques pour les intégrer dans notre routine quotidienne.', '#Hydratez-vous régulièrement:\r\nLa première habitude essentielle est de boire suffisamment d\'eau tout au long de la journée. L\'eau hydrate notre corps, facilite la digestion, régule la température corporelle et aide à éliminer les toxines. Gardez une bouteille d\'eau à portée de main et fixez-vous l\'objectif de boire au moins 8 verres d\'eau par jour.\r\n\r\n#Adoptez une alimentation équilibrée:\r\nUne alimentation saine et équilibrée est cruciale pour maintenir une bonne santé. Priorisez les fruits et légumes, les céréales complètes, les protéines maigres et les graisses saines. Évitez les aliments transformés riches en sucres ajoutés, en gras saturés et en additifs artificiels. Privilégiez les repas faits maison et planifiez vos menus pour vous assurer une alimentation équilibrée.\r\n\r\n#Faites de l\'exercice régulièrement:\r\nL\'activité physique est bénéfique à la fois pour notre corps et notre esprit. Trouvez une activité qui vous plaît, que ce soit la marche, la course, la natation, le yoga ou la danse. Essayez de faire au moins 30 minutes d\'exercice modéré à intense plusieurs fois par semaine. L\'exercice améliore la condition cardiovasculaire, renforce les muscles, régule le poids et favorise la libération d\'endorphines, les hormones du bonheur.\r\n\r\n#Accordez-vous du temps de récupération:\r\nLe repos et la récupération sont essentiels pour recharger nos batteries. Accordez-vous des moments de détente et de repos, que ce soit en pratiquant des techniques de relaxation, en méditant, en prenant des bains relaxants ou en lisant un bon livre. Écoutez votre corps et respectez ses besoins en matière de sommeil et de repos.\r\n\r\n#Gérez votre stress:\r\nLe stress peut avoir un impact négatif sur notre santé globale. Identifiez les sources de stress dans votre vie et trouvez des stratégies efficaces pour les gérer. Pratiquez la respiration profonde, la méditation, le yoga ou l\'écriture pour soulager le stress. Identifiez également des activités qui vous procurent du plaisir et vous aident à vous détendre, comme écouter de la musique, passer du temps avec des amis ou pratiquer un hobby.\r\n\r\n#Cultivez des relations positives:\r\nLes relations sociales et affectives jouent un rôle crucial dans notre bien-être émotionnel. Entourez-vous de personnes positives qui vous soutiennent et vous inspirent. Nourrissez vos relations en passant du temps de qualité avec vos proches, en partageant des moments de joie et en offrant votre soutien en cas de besoin. Soyez également ouvert à de nouvelles rencontres et à l\'élargissement', '2023-06-22', 5, 1);

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
  `url` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `url`) VALUES
(1, 'banniere.png'),
(2, 'astro.jpg'),
(3, 'festive.jpg'),
(4, 'recette.jpg');

--
-- Structure de la table `image2article`
--

CREATE TABLE `image2article` (
  `article_id` int NOT NULL,
  `image_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `image2article` (`article_id`, `image_id`) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 1),
(5, 1),
(6, 4),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

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
(1, 'Jules Ol D\'air', 'ruluis@gmail.503', 'EFIORJLKGDNJFDF?JKSJFNEJKF?DXJNVSEJIFNJKCVS', NULL, NULL, NULL, NULL, 3),
(2, 'Klem An', 'klem@gmail.com', 'esgrthfgfdfqethyjfghdnbvsqgyjftugfbdvsghtjgkhfnbdvsfbgfhjgh,nfbvc', NULL, NULL, NULL, NULL, 3),
(3, 'Doug Jhonson', 'Jhonson@gmail.com', 'esgrthfgfdfqethyjfghdnbvsqgyjftugfbdvsghtjgkhfnbdvsfbgfhjgh,nfbvc', NULL, NULL, NULL, NULL, 3);

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
