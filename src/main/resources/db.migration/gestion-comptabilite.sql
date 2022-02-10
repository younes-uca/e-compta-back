-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 10 fév. 2022 à 13:56
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion-comptabilite`
--

-- --------------------------------------------------------

--
-- Structure de la table `acomptes`
--

CREATE TABLE `acomptes` (
  `id` bigint(20) NOT NULL,
  `annee` double NOT NULL,
  `montant` double DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `acomptes`
--

INSERT INTO `acomptes` (`id`, `annee`, `montant`, `numero`, `societe`) VALUES
(418, 2021, 1004, 2, 7);

-- --------------------------------------------------------

--
-- Structure de la table `categorie_service`
--

CREATE TABLE `categorie_service` (
  `id` bigint(20) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `indice_affichage` int(11) DEFAULT NULL,
  `lien` varchar(255) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `texte_button` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `detail` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_service`
--

INSERT INTO `categorie_service` (`id`, `icon`, `indice_affichage`, `lien`, `montant`, `texte_button`, `titre`, `description`, `detail`) VALUES
(388, 'bi bi-file-plus-fill', 1, 'societe-create', 300, 'Commencer la Création', 'Création d\'une société', 'La création d\'une société permet à des associés de mettre en commun leurs moyens pour atteindre un objectif commun. La création de société peut intervenir dans un but purement patrimonial (SCI), ou dans un but commercial ou libéral (SAS, SARL).', NULL),
(390, 'bi bi-newspaper', 3, 'liquidation', 100, 'Commencer la liquidation', 'Liquidation d\'une société', 'La liquidation d’une société est la procédure qui consiste à vendre les actifs de la société afin de rembourser ses dettes. A l’issue de cette opération, un bilan de liquidation est établi pour démontrer que tous les actifs de la société ont été liquidés.', NULL),
(391, 'bi bi-file-earmark-bar-graph', 4, '/societe/demande-tva/create', 350, 'Commencer la Déclaration TVA', 'Déclaration TVA', 'La déclaration TVA est un document qui récapitule le montant de taxe sur la valeur ajoutée dû par les entreprises à l’administration fiscale. Il s’agit d’un formulaire que le dirigeant doit compléter en s’appuyant sur la comptabilité de son entreprise.', ' <h5><i class=\"fab fa-squarespace fa-2x\"></i>Qu’est-ce qu’une déclaration de TVA?</h5>\r\n        <div class=\"paragraph\">\r\n            La déclaration de TVA est un document qui récapitule le montant de taxe sur la valeur ajoutée dû par les entreprises assujetties à l’administration fiscale. Il s’agit d’un formulaire administratif que le dirigeant doit compléter en s’appuyant sur la comptabilité de son entreprise. La déclaration de TVA recense notamment:\r\n            <ul>\r\n                <li><b>TVA brute:</b> il s’agit de l’ensemble de la TVA récupérée par l’entreprise sur les biens et services qu’elle a facturé à ses clients. On parle également de la TVA collectée.</li>\r\n                <li><b>La TVA déductible:</b> l’entreprise assujettie peut déduire la TVA qu’elle a payée lors des dépenses engagées pour l’exercice de l’activité (achat de matériel, de matière première, etc.). La TVA déductible correspond donc au montant de taxe payé par l’entreprise à ses différents fournisseurs et prestataires. Attention, pour pouvoir déduire la TVA, il est essentiel que l’ensemble des factures justifiant des dépenses soient conservées par l’entreprise. N\'hésitez pas à consulter notre fiche pour en savoir plus sur la récupération de la TVA sur l\'essence.</li>\r\n                <li><b>La TVA nette:</b> il s’agit de la somme qui doit être reversée à l’administration fiscale. Elle se calcule par la différence entre la TVA brute et la TVA déductible. Si le solde est positif, l’entreprise doit reverser le montant correspondant à l’administration fiscale. À l’inverse, si le montant est négatif, l’entreprise dispose d’un crédit de TVA qu’elle est en droit de se faire rembourser par le trésor public.</li>\r\n            </ul>\r\n            La TVA nette: il s’agit de la somme qui doit être reversée à l’administration fiscale. Elle se calcule par la différence entre la TVA brute et la TVA déductible. Si le solde est positif, l’entreprise doit reverser le montant correspondant à l’administration fiscale. À l’inverse, si le montant est négatif, l’entreprise dispose d’un crédit de TVA qu’elle est en droit de se faire rembourser par le trésor public.\r\n        </div>\r\n        <h5><i class=\"fab fa-squarespace fa-2x\"></i>Comment faire sa déclaration de TVA?</h5>\r\n        <div class=\"paragraph\">\r\n            Les modalités de déclaration varient selon le régime de TVA de l’entreprise. Aussi, il n’existe pas de déclaration de TVA auto-entrepreneur puisque celle-ci dépend du régime applicable à l’auto-entreprise. Selon le régime de TVA, la déclaration doit être faite de la manière suivante:\r\n            <ul>\r\n                <li><b>Le régime réel normal de TVA:</b> l’entreprise doit obligatoirement procéder à la déclaration de TVA en ligne via son compte fiscal ou par le biais d’un prestataire.</li>\r\n                <li><b>Le régime réel simplifié de TVA:</b> l’entreprise doit procéder à sa déclaration de TVA via l’imprimé 3517-S-CA 12 qu’elle doit impérativement transmettre en ligne.\r\n                    <br>\r\n                    Attention, comme toutes sociétés (prenons l\'exemple de la TVA en SARL), si la société dépasse les seuils conditionnant l’accès au régime réel simplifié, elle doit, dès la fin du mois, procéder à la déclaration de TVA CA3. Cette déclaration récapitule l’ensemble des opérations réalisées à compter du début de l’exercice social jusqu’au mois de dépassement inclus.\r\n                </li>\r\n                <li><b>Le régime de franchise de TVA:</b> l’entreprise est exonérée de déclarer et de payer la TVA sur les prestations et ventes qu’elle réalise. Il n’y a donc aucune déclaration à effectuer.</li>\r\n            </ul>\r\n            <hr>\r\n            <h5><i class=\"fab fa-squarespace fa-2x\"></i>Comment déclarer l’autoliquidation sur la déclaration de TVA?</h5>\r\n            <div class=\"paragraph\">\r\n                L’autoliquidation est un mécanisme de TVA applicable dans le secteur du bâtiment et des travaux publics (BTP). Il contraint le donneur d’ordre d’acquitter la TVA due au titre des travaux de construction réalisés par un sous-traitant. Ainsi:\r\n                <ul>\r\n                    <li>Le sous-traitant n’a pas à déclarer, ni à payer la TVA due au titre des opérations de sous-traitance. Dans sa déclaration de TVA, l’autoliquidation doit en revanche apparaître dans la rubrique “autres opérations non imposables”.</li>\r\n                    <li>Le donneur d’ordre doit, quant à lui, inscrire l’autoliquidation dans la rubrique “autres opérations imposables” de sa déclaration de TVA.</li>\r\n                </ul>\r\n            </div>\r\n        </div>\r\n        <hr>\r\n        <h5><i class=\"fab fa-squarespace fa-2x\"></i>Quand transmettre sa déclaration de TVA?</h5>\r\n        <div class=\"paragraph\">\r\n            La date limite de déclaration de TVA varie, elle aussi, selon le régime applicable. Ainsi:\r\n            <ul>\r\n                <li><b>Le régime réel normal:</b> lorsque la société est soumise au régime réel normal de TVA, il convient de procéder à la déclaration et au paiement de la TVA sur une base mensuelle. Par exception, si le montant de TVA payé annuellement par la société est inférieur à 4.000€, il est possible d’opter pour une déclaration et, un versement, trimestriel.</li>\r\n                <li><b>Le régime réel simplifié:</b> la déclaration de TVA s’effectue sur une base annuelle. Elle doit intervenir au plus tard le 2ᵉ jour ouvré suivant le 1er mai. Toutefois, si l’exercice social de l’entreprise ne coïncide pas avec l’année civile, l’entreprise doit déposer sa déclaration dans les 3 mois qui suivent la clôture de son exercice.</li>\r\n            </ul>\r\n            Bon à savoir: le formulaire de déclaration rectificative de TVA permet à l’entreprise de modifier sa déclaration en cas d’erreurs ou d’omissions. Il a pour effet d’annuler et de remplacer la déclaration précédente. En revanche, la transmission d’un tel formulaire n’annule pas les paiements déjà effectués.\r\n        </div>\r\n        <hr>\r\n        <h5> <i class=\"fab fa-squarespace fa-2x\"></i>Retard de déclaration de TVA: quelles conséquences?</h5>\r\n        <div class=\"paragraph\">\r\n            En cas de retard ou de manquement dans la déclaration de TVA, l’entreprise s’expose aux sanctions et pénalités suivantes:\r\n            <ul>\r\n                <li>Les intérêts de retard de 0,4% par mois de retard s’appliquent dès lors qu’il y a un retard dans la déclaration de TVA, et ce, même si l’entreprise est de bonne foi;</li>\r\n                <li>Une majoration de 40% s’applique en cas de d’oubli, d’erreur ou de manquement délibéré d’information de la part de l’entreprise. En pratique, l’administration fiscale retient très souvent cette qualification;</li>\r\n                <li>Une majoration de 80% en cas de d’oublis, d’erreurs ou de manquements graves et répétés de la part de l’entreprise. On parle alors de manœuvres frauduleuses.</li>\r\n            </ul>\r\n            Remplir sa déclaration de TVA peut s’avérer fastidieux. C’est pourquoi vous pouvez faire appel à un expert-comptable ou à une plateforme de gestion de comptabilité en ligne, telle que <b style=\"color: #7e6832;\">E-COMPTA</b>, pour vous accompagner dans vos démarches.\r\n         </div>'),
(392, 'bi bi-file-earmark-bar-graph', 5, 'declaration-ir', 500, 'Commencer la Déclaration IR', 'Déclaration IR', 'L’impôt sur le revenu se définit comme une charge prélevée directement du bénéfice perçu par l’entreprise. Chaque année, les entreprises effectuent la déclaration de leurs revenus effectifs dans le but de calculer le montant de l’IR.', NULL),
(393, 'bi bi-file-earmark-bar-graph', 6, '/societe/demande-is', 550, 'Commencer la Déclaration IS', 'Déclaration IS', 'L\'impôt sur les sociétés est un impôt calculé sur l\'assiette des bénéfices réalisés par une entreprise ayant son activité commerciale. Il concerne les sociétés en commandite par actions et les SARL n\'ayant pas opté pour le régime fiscal des sociétés.', NULL),
(389, 'bi bi-pencil-square', 2, 'facture', 600, 'Commencer la Modification', 'Modification Statut', 'Il s\'agit d\'un changement de dénomination sociale, de forme (SA, SARL...), de siège social, d\'objet social, de gérant ou de capital. Vous devez obtenir l\'accord des associés. La procédure varie en fonction du type de votre société et de sa modification.', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `classe_comptable`
--

CREATE TABLE `classe_comptable` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classe_comptable`
--

INSERT INTO `classe_comptable` (`id`, `libelle`, `numero`) VALUES
(2, 'COMPTES D\'ACTIF IMMOBILISE', 2),
(1, 'COMPTES DE FINANCEMENT PERMANENT', 1),
(3, 'COMPTES D\'ACTIF CIRCULANT (HORS TRESORERIE)', 3),
(4, 'COMPTES DU PASSIF CIRCULANT (HORS TRESORERIE)', 4),
(5, 'COMPTES DE TRESORERIE', 5),
(6, 'COMPTES DE CHARGES', 6),
(7, 'COMPTES DE PRODUITS', 7);

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE `comptable` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `type_traitant` bit(1) DEFAULT NULL,
  `type_validateur` bit(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`id`, `code`, `nom`, `type`, `prenom`, `telephone`, `type_traitant`, `type_validateur`) VALUES
(3, 'a3', 'oussama', 'Comptable validateur', 'oussama', '0621345678', NULL, b'1'),
(2, 'a2', 'badr', 'Comptable traiteur', 'badr', '0612345676', b'1', NULL),
(1, 'a1', 'yassar', 'Comptable traiteur', 'yassar', '0612345698', b'1', NULL),
(4, 'a4', 'achraf', 'Comptable validateur', 'achraf', '0632458788', NULL, b'1'),
(5, 'a5', 'hind', 'Comptable validateur', 'hind', '0612211243', NULL, b'1'),
(6, 'a6', 'ibtissam', 'Comptable traiteur', 'ibtissam', '0543567644', b'1', NULL),
(16, 'a7', 'zahraa', 'Comptable validateur', 'zahraa', '0612431207', NULL, b'1'),
(17, 'a8', 'leila', 'Comptable validateur', 'leila', '0566987432', NULL, b'1'),
(18, 'a9', 'zakaria', 'Comptable traiteur', 'zakaria', '0743213455', b'1', NULL),
(19, 'a12', 'saad', 'Comptable validateur', 'saad', '0677865412', NULL, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `compte_comptable`
--

CREATE TABLE `compte_comptable` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `sous_classe_comptable` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `compte_comptable`
--

INSERT INTO `compte_comptable` (`id`, `code`, `libelle`, `sous_classe_comptable`) VALUES
(1, '111', 'Capital social ou personnel', 11),
(2, '1111', 'Capital social', 11),
(3, '1112', 'Fonds de dotation', 11),
(4, '1117', 'Capital personnel', 11),
(5, '11171', 'Capital individuel', 11),
(6, '11175', 'Compte de l\'exploitant', 11),
(7, '1119', 'Actionnaires, capital souscrit-non appelé', 11),
(8, '112', 'Primes d\'émission, de fusion et d\'apport', 11),
(9, '1121', 'Primes d\'émission', 11),
(10, '1122', 'Primes de fusion', 11),
(11, '1123', 'Primes d\'apport', 11),
(12, '113', 'Ecarts de réévaluation', 11),
(13, '1130', 'Ecarts de réévaluation', 11),
(14, '114', 'Réserve légale', 11),
(15, '1140', 'Réserve légale', 11),
(16, '115', 'Autres réserves', 11),
(17, '1151', 'Réserves statutaires ou contractuelles', 11),
(18, '1152', 'Réserves facultatives', 11),
(19, '1155', 'Réserves réglementées', 11),
(20, '116', 'Report à nouveau', 11),
(21, '1161', 'Report à nouveau (solde créditeur)', 11),
(22, '1169', 'Report à nouveau (solde débiteur)', 11),
(23, '118', 'Résultats nets en instance d\'affectation', 11),
(24, '1181', 'Résultats nets en instance d\'affectation (solde créditeur)', 11),
(25, '1189', 'Résultats nets en instance d\'affectation (solde débiteur)', 11),
(26, '119', 'Résultat net de l\'exercice', 11),
(27, '1191', 'Résultat net de l\'exercice (solde créditeur)', 11),
(28, '1199', 'Résultat net de l\'exercice (solde débiteur)', 11),
(29, '131', 'Subventions d\'investissement', 13),
(30, '1311', 'Subventions d\'investissement reçues', 13),
(31, '1319', 'Subventions d\'investissement inscrites au CPC', 13),
(32, '135', 'Provisions réglementées', 13),
(33, '1351', 'Provisions pour amortissements dérogatoires', 13),
(34, '1352', 'Provisions pour plus-values en instance d\'imposition', 13),
(35, '1354', 'Provisions pour investissements', 13),
(36, '1355', 'Provisions pour reconstitution des gisements', 13),
(37, '1356', 'Provisions pour acquisition et construction de logements', 13),
(38, '1358', 'Autres provisions réglementées', 13),
(39, '141', 'Emprunts obligataires', 14),
(40, '1410', 'Emprunts obligataires', 14),
(41, '148', 'Autres dettes de financement', 14),
(42, '1481', 'Emprunts auprès des établissements de crédit', 14),
(43, '1482', 'Avances de l\'Etat', 14),
(44, '1483', 'Dettes rattachées à des participations', 14),
(45, '1484', 'Billets de fonds', 14),
(46, '1485', 'Avances reçues et comptes courants bloqués', 14),
(47, '1486', 'Fournisseurs d\'immobilisation', 14),
(48, '1487', 'Dépôts et cautionnements reçues', 14),
(49, '1488', 'Dettes de financement diverses', 14),
(50, '151', 'Provisions pour risques', 15),
(51, '1511', 'Provisions pour litiges', 15),
(52, '1512', 'Provisions pour garanties données aux clients', 15),
(53, '1513', 'Provisions pour propre assureur', 15),
(54, '1514', 'Provision pour pertes sur marchés à terme', 15),
(55, '1515', 'Provisions pour amendes, double droits, pénalités', 15),
(56, '1516', 'Provisions pour pertes de change', 15),
(57, '1518', 'Autres provisions pour risques', 15),
(58, '155', 'Provisions pour charges', 15),
(59, '1551', 'Provisions pour impôts', 15),
(60, '1552', 'Provisions pour pensions de retraite et obligations similaires', 15),
(61, '1555', 'Provisions pour charges à répartir sur plusieurs exercices', 15),
(62, '1558', 'Autres provisions pour charges', 15),
(63, '160', 'Comptes de liaison des établissements et succursales', 16),
(64, '1601', 'Comptes de liaison du siège', 16),
(65, '1605', 'Comptes de liaison des établissements', 16),
(66, '171', 'Augmentation des créances immobilisées', 17),
(67, '1710', 'Augmentation des créances immobilisées', 17),
(68, '172', 'Diminution des dettes de financement', 17),
(69, '1720', 'Diminution des dettes de financement', 17),
(70, '211', 'Frais préliminaires', 21),
(71, '2111', 'Frais de constitution', 21),
(72, '2112', 'Frais préalables au démarrage', 21),
(73, '2113', 'Frais d\'augmentation du capital', 21),
(74, '2114', 'Frais sur opérations de fusions, scissions et transformations', 21),
(75, '2116', 'Frais de prospection', 21),
(76, '2117', 'Frais de publicité', 21),
(77, '2118', 'Autres frais préliminaires', 21),
(78, '212', 'Charges à répartir sur plusieurs exercices', 21),
(79, '2121', 'Frais d\'acquisitition des immobilisations', 21),
(80, '2125', 'Frais d\'émission des emprunts', 21),
(81, '2128', 'Autres charges à répartir', 21),
(82, '213', 'Primes de remboursement des obligations', 21),
(83, '2130', 'Primes de remboursement des obligations', 21),
(84, '221', 'Immobilisation en recherche et développement', 22),
(85, '2210', 'Immobilisation en recherche et développement', 22),
(86, '222', 'Brevets, marques, droits et valeurs similaires', 22),
(87, '2220', 'Brevets, marques, droits et valeurs similaires', 22),
(88, '223', 'Fonds commercial', 22),
(89, '2230', 'Fonds commercial', 22),
(90, '228', 'Autres immobilisations incorporelles', 22),
(91, '2285', 'Autres immobilisations incorporelles', 22),
(92, '231', 'Terrains', 23),
(93, '2311', 'Terrains nus', 23),
(94, '2312', 'Terrains aménagés', 23),
(95, '2313', 'Terrains bâtis', 23),
(96, '2314', 'Terrains de gisement', 23),
(97, '2316', 'Agencements et aménagements de terrains', 23),
(98, '2318', 'Autres terrains', 23),
(99, '232', 'Constructions', 23),
(100, '2321', 'Bâtiments', 23),
(101, '23211', 'Bâtiments industriels (A,B,,,)', 23),
(102, '23214', 'Bâtiments administratifs et commerciaux (A,B,,,)', 23),
(103, '23218', 'Autres bâtiments', 23),
(104, '2323', 'Constructions sur terrains d\'autrui', 23),
(105, '2325', 'Ouvrages d\'infrastructure', 23),
(106, '2327', 'Agencements et aménagements des constructions', 23),
(107, '2328', 'Autres constructions', 23),
(108, '233', 'Installations techniques, matériel et outillage', 23),
(109, '2331', 'Installations techniques', 23),
(110, '2332', 'Matériel et outillage', 23),
(111, '23321', 'Matériel', 23),
(112, '23324', 'Outillage', 23),
(113, '2333', 'Emballages récupérables identifiables', 23),
(114, '2338', 'Autres installations techniques, matériel et outillage', 23),
(115, '234', 'Matériel de transport', 23),
(116, '2340', 'Matériel de transport', 23),
(117, '235', 'Mobilier, matériel de bureau et aménagements divers', 23),
(118, '2351', 'Mobilier de bureau', 23),
(119, '2352', 'Matériel de bureau', 23),
(120, '2355', 'Matériel informatique', 23),
(121, '2356', 'Agencements, installations et aménagements divers (biens n\'appartenant pas à l\'entreprise)', 23),
(122, '2358', 'Autres mobilier, matériel de bureau et aménagements divers', 23),
(123, '238', 'Autres immobilisations corporelles', 23),
(124, '2380', 'Autres immobilisations corporelles', 23),
(125, '239', 'Immobilisations corporelles en cours', 23),
(126, '2392', 'Immobilisations corporelles en cours des terrains et constructions', 23),
(127, '2393', 'Immobilisations corporelles en cours des installations techniques, matériel et outillage', 23),
(128, '2394', 'Immobilisations corporelles en cours de matériel de transport', 23),
(129, '2395', 'Immobilisations corporelles en cours de mobilier, matériel de bureau et aménagements divers', 23),
(130, '2397', 'Avances et acomptes versés sur commandes d\'immobilisations corporelles', 23),
(131, '2398', 'Autres immobilisations corporelles en cours', 23),
(132, '241', 'Prêts immobilsés', 24),
(133, '2441', 'Prêts au personnel', 24),
(134, '2415', 'Prêts aux associés', 24),
(135, '2416', 'Billets de fonds', 24),
(136, '2418', 'Autres prêts', 24),
(137, '248', 'Autres créances financières', 24),
(138, '2481', 'Titres immobilisés (droits de créance)', 24),
(139, '24811', 'Obligations', 24),
(140, '24813', 'Bons d\'équipement', 24),
(141, '24818', 'Bons divers', 24),
(142, '2483', 'Créances rattachées à des participations', 24),
(143, '2486', 'Dépôts et cautionnements versés', 24),
(144, '24861', 'Dépôts', 24),
(145, '24864', 'Cautionnements', 24),
(146, '2487', 'Créances immobilisées', 24),
(147, '2488', 'Créances financères diverses', 24),
(148, '251', 'Titres de participation', 25),
(149, '2510', 'Titres de participation', 25),
(150, '258', 'Autres titres immobilisés', 25),
(151, '2581', 'Actions', 25),
(152, '2588', 'Titres divers', 25),
(153, '271', 'Diminution des créances immobilisées', 27),
(154, '2710', 'Diminution des créances immobilisées', 27),
(155, '272', 'Augmentation des dettes de financement', 27),
(156, '2720', 'Augmentation des dettes de financement', 27),
(157, '281', 'Amortissements des non-valeurs', 28),
(158, '2811', 'Amortissements des frais préliminaires', 28),
(159, '28111', 'Amortissements des frais de constitution', 28),
(160, '28112', 'Amortissements des frais préliminaires au démarrage', 28),
(161, '28113', 'Amortissements des frais d\'augmentation du capital', 28),
(162, '28114', 'Amortissements des frais sur opérations de fusions, scissions, et transformations', 28),
(163, '28116', 'Amortissements des frais de prospection', 28),
(164, '28117', 'Amortissements des frais de publicité', 28),
(165, '28118', 'Amortissements des autres frais préliminaires', 28),
(166, '2812', 'Amortissements des charges à répartir', 28),
(167, '28121', 'Amortissements des frais d\'acquisition des immobilisations', 28),
(168, '28125', 'Amortissements des frais d\'émission des emprunts', 28),
(169, '28128', 'Amortissements des autres charges à répartir', 28),
(170, '2813', 'Amortissements des primes de remboursement des obligations', 28),
(171, '282', 'Amortissements des immobilisations incorporelles', 28),
(172, '2821', 'Amortissements de l\'immobilisation en recherche et développement', 28),
(173, '2822', 'Amortissements des brevets, marques, droits et valeurs similaires', 28),
(174, '2823', 'Amortissements du fonds commercial', 28),
(175, '2828', 'Amortissements des autres immobilisations incorporelles', 28),
(176, '283', 'Amortissements des immobilisations corporelles', 28),
(177, '2831', 'Amortissements des terrains', 28),
(178, '28311', 'Amortissements des terrains nus', 28),
(179, '28312', 'Amortissements des terrains aménagés', 28),
(180, '28313', 'Amortissements des terrains bâtis', 28),
(181, '28314', 'Amortissements des terrains de gisement', 28),
(182, '28136', 'Amortissements des agencements et aménagements de terrains', 28),
(183, '28138', 'Amortissements des autres terrains', 28),
(184, '2832', 'Amortissements des constructions', 28),
(185, '28321', 'Amortissements des bâtiments', 28),
(186, '28323', 'Amortissements des constructions sur terrains d\'autrui', 28),
(187, '28325', 'Amortissements des ouvrages d\'infrastructure', 28),
(188, '28327', 'Amortissements des installations, agencements et aménagements des constructions', 28),
(189, '28328', 'Amortissements des autres constructions', 28),
(190, '2833', 'Amortissements des installations techniques, matériel et outillage', 28),
(191, '28331', 'Amortissements des installations techniques', 28),
(192, '28332', 'Amortissements du matériel et outillage', 28),
(193, '28333', 'Amortissements des emballages récupérables ident ifiables', 28),
(194, '28338', 'Amortissements des autres installations techniques, matériel et outillage', 28),
(195, '2834', 'Amortissements du matériel de transport', 28),
(196, '2835', 'Amortissements du mobilier, matériel de bureau et aménagements divers', 28),
(197, '28351', 'Amortissements du mobilier de bureau', 28),
(198, '28352', 'Amortissements du matériel de bureau', 28),
(199, '28355', 'Amortissements du matériel informatique', 28),
(200, '28356', 'Amortissements des agencements, installations et aménagements divers', 28),
(201, '28358', 'Amortissements des autres mobilier, matériel de bureau et aménagements divers', 28),
(202, '2838', 'Amortissements des autres immobilisations corporelles', 28),
(203, '292', 'Provisions pour dépréciation des immobilisations incorporelles', 29),
(204, '2920', 'Provisions pour dépréciation des immobilisations incorporelles', 29),
(205, '293', 'Provisions pour dépréciation des immobilisations corporelles', 29),
(206, '2930', 'Provisions pour dépréciation des immobilisations corporelles', 29),
(207, '294', 'Provisions pour dépréciation des immobilisations financières', 29),
(208, '2941', 'Provisions pour dépréciation des prêts immobilisés', 29),
(209, '2948', 'Provisions pour dépréciation des autres créances financières', 29),
(210, '295', 'Provisions pour dépréciation des immobilisations financières', 29),
(211, '2951', 'Provisions pour dépréciation des titres de participation', 29),
(212, '2958', 'Provisions pour dépréciation des autres titres immobilisés', 29),
(213, '311', 'Marchandises', 31),
(214, '3111', 'Marchandises (groupe A)', 31),
(215, '3112', 'Marchandises (groupe B)', 31),
(216, '3116', 'Marchandises en cours de route', 31),
(217, '3118', 'Autres marchandises', 31),
(218, '312', 'Matières et fournitures consommables', 31),
(219, '3121', 'Matières premières', 31),
(220, '31211', 'Matières premières (groupe A)', 31),
(221, '31212', 'Matières premières (groupe B)', 31),
(222, '3122', 'Matières et fournitures consommables', 31),
(223, '31221', 'Matières consommables (groupe A)', 31),
(224, '31222', 'Matières consommables (groupe B)', 31),
(225, '31223', 'Combustibles', 31),
(226, '31224', 'Produits d\'entretien', 31),
(227, '31225', 'Fournitures d\'atelier et d\'usine', 31),
(228, '31226', 'Fournitures de magasin', 31),
(229, '31227', 'Fournitures de bureau', 31),
(230, '3123', 'Emballages', 31),
(231, '31231', 'Emballages perdus', 31),
(232, '31232', 'Emballages récupérables non identifiables', 31),
(233, '31233', 'Emballages à usage mixte', 31),
(234, '3126', 'Matières et fournitures consommables en cours de route', 31),
(235, '3128', 'Autres matières et fournitures consommables', 31),
(236, '313', 'Produits en cours', 31),
(237, '3131', 'Biens en cours', 31),
(238, '31311', 'Biens produits en cours', 31),
(239, '31312', 'Biens intermédiaires en cours', 31),
(240, '31317', 'Biens résiduels en cours', 31),
(241, '3134', 'Services en cours', 31),
(242, '31341', 'Travaux en cours', 31),
(243, '31342', 'Etudes en cours', 31),
(244, '31343', 'Prestations en cours', 31),
(245, '3138', 'Autres produits en cours', 31),
(246, '314', 'Produits intermédiaires et produits résiduels', 31),
(247, '3141', 'Produits intermédiaires', 31),
(248, '31411', 'Produits intermédiaires (groupe A)', 31),
(249, '31412', 'Produits intermédiaires (groupe B)', 31),
(250, '3145', 'Produits résiduels (ou matières de récupération)', 31),
(251, '31451', 'Déchets', 31),
(252, '31452', 'Rebuts', 31),
(253, '31453', 'Matières de récupération', 31),
(254, '3148', 'Autres produits intermédiaires et produits résiduels', 31),
(255, '315', 'Produits finis', 31),
(256, '3151', 'Produits finis (groupe A)', 31),
(257, '3152', 'Produits finis (groupe B)', 31),
(258, '3156', 'Produits finis en cours de route', 31),
(259, '3158', 'Autres produits finis', 31),
(260, '341', 'Fournisseurs débiteurs, avances et acomptes', 34),
(261, '3411', 'Fournisseurs - avances et acomptes versés sur commandes d\'exploitation', 34),
(262, '3413', 'Fournisseurs - créances pour emballages et matériel à rendre', 34),
(263, '3417', 'Rabais, remises et ristournes à obtenir - avoirs non encore reçus', 34),
(264, '3418', 'Autres fournisseurs débiteurs', 34),
(265, '342', 'Clients et comptes rattachés', 34),
(266, '3421', 'Clients', 34),
(267, '34211', 'Clients - catégorie A', 34),
(268, '34212', 'Clients - catégorie B', 34),
(269, '3423', 'Clients - retenues de garantie', 34),
(270, '3424', 'Clients douteux ou litigieux', 34),
(271, '3425', 'Clients - effets à recevoir', 34),
(272, '3427', 'Clients - factures à établir et créances sur travaux non encore facturés', 34),
(273, '34271', 'Clients - factures à établir', 34),
(274, '34272', 'Créances sur travaux non encore facturables', 34),
(275, '3428', 'Autres clients et comptes rattachés', 34),
(276, '343', 'Personnel - débiteur', 34),
(277, '3431', 'Avances et acomptes au personnel', 34),
(278, '3438', 'Personnel - autres débiteurs', 34),
(279, '345', 'Etat - débiteur', 34),
(280, '3451', 'Subventions à recevoir', 34),
(281, '34511', 'Subventions d\'investissement à recevoir', 34),
(282, '34512', 'Subventions d\'exploitation à recevoir', 34),
(283, '34513', 'Subventions d\'équilibre à recevoir', 34),
(284, '3453', 'Acomptes sur impôts sur les résultats', 34),
(285, '3455', 'Etat - TVA récupérable', 34),
(286, '34551', 'Etat - TVA récupérable sur immobilisations', 34),
(287, '34552', 'Etat - TVA récupérable sur charges', 34),
(288, '3456', 'Etat - crédit de TVA (suivant déclaration)', 34),
(289, '3458', 'Etat - autres comptes débiteurs', 34),
(290, '346', 'Comptes d\'associés - débiteurs', 34),
(291, '3461', 'Associés - comptes d\'apport en société', 34),
(292, '3462', 'Actionnaires - capital souscrit et appelé non versé', 34),
(293, '3463', 'Comptes courants des associés débiteurs', 34),
(294, '3464', 'Associés - opérations faites en commun', 34),
(295, '3467', 'Créances rattachées aux comptes d\'associés', 34),
(296, '3468', 'Autres comptes d\'associés débiteurs', 34),
(297, '348', 'Autres débiteurs', 34),
(298, '3481', 'Créances sur cessions d\'immobilisations', 34),
(299, '3482', 'Créances sur cessions d\'éléments d\'actif circulant', 34),
(300, '3487', 'Créances rattachées aux autres débiteurs', 34),
(301, '3488', 'Divers débiteurs', 34),
(302, '349', 'Comptes de régularisation - actif', 34),
(303, '3491', 'Charges constatées d\'avance', 34),
(304, '3493', 'Intérêts courus et non échus à percevoir', 34),
(305, '3495', 'Comptes de répartition périodique des charges', 34),
(306, '3497', 'Comptes transitoires ou d\'attente - débiteurs', 34),
(307, '350', 'Titres et valeurs de placement', 35),
(308, '3501', 'Actions, partie libérée', 35),
(309, '3502', 'Actions, partie non libérée', 35),
(310, '3504', 'Obligations', 35),
(311, '3506', 'Bons de caisse et bons de trésor', 35),
(312, '35061', 'Bons de caisse', 35),
(313, '35062', 'Bons de trésor', 35),
(314, '3508', 'Autres titres et valeurs de placement similaires', 35),
(315, '370', 'Ecart de conversion - Actif (éléments circulants)', 37),
(316, '3701', 'Diminution des créances circulantes', 37),
(317, '3702', 'Augmentation des dettes circulantes', 37),
(318, '391', 'Provisions pour dépréciation des stocks', 39),
(319, '3911', 'Provisions pour dépréciation des marchandises', 39),
(320, '3912', 'Provisions pour dépréciation des matières et fournitures', 39),
(321, '3913', 'Provisions pour dépréciation des produits en cours', 39),
(322, '3914', 'Provisions pour dépréciation des produits intermédiaires', 39),
(323, '3915', 'Provisions pour dépréciation des produits finis', 39),
(324, '394', 'Provisions pour dépréciation des créances de l\'actif circulant', 39),
(325, '3941', 'Provisions pour dépréciation - fournisseurs débiteurs, avances et acomptes', 39),
(326, '3942', 'Provisions pour dépréciation des clients et comptes rattachés', 39),
(327, '3943', 'Provisions pour dépréciation du personnel - débiteur', 39),
(328, '3946', 'Provisions pour dépréciation des comptes d\'associés débiteurs', 39),
(329, '3948', 'Provisions pour dépréciation des autres débiteurs', 39),
(330, '395', 'Provisions pour dépréciation des titres et valeurs de placement', 39),
(331, '3950', 'Provisions pour dépréciation des titres et valeurs de placement', 39),
(332, '441', 'Fournisseurs et comptes rattachés', 44),
(333, '4411', 'Fournisseurs', 44),
(334, '44111', 'Fournisseurs - catégorie A', 44),
(335, '44112', 'Fournisseurs - catégorie B', 44),
(336, '4413', 'Fournisseurs - retenues de garantie', 44),
(337, '4415', 'Fournisseurs - effets à payer', 44),
(338, '4417', 'Fournisseurs - factures non parvenues', 44),
(339, '4418', 'Autres fournisseurs et comptes rattachés', 44),
(340, '442', 'Clients créditeurs, avances et acomptes', 44),
(341, '4421', 'Clients - avances et acomptes reçus sur commandes en cours', 44),
(342, '4425', 'Clients - dettes pour emballages et matériel consignés', 44),
(343, '4427', 'Rabais, remises et ristournes à accorder - avoirs à établir', 44),
(344, '4428', 'Autres clients créditeurs', 44),
(345, '443', 'Personnel - créditeur', 44),
(346, '4432', 'Rémunérations dues au personnel', 44),
(347, '4433', 'Dépôts du personnel créditeurs', 44),
(348, '4434', 'Oppositions sur salaires', 44),
(349, '4437', 'Charges du personnel à payer', 44),
(350, '4438', 'Personnel - autres créditeurs', 44),
(351, '444', 'Organismes sociaux', 44),
(352, '4441', 'Caisse Nationale de la Sécurité Sociale', 44),
(353, '4443', 'Caisses de retraite', 44),
(354, '4445', 'Mutuelles', 44),
(355, '4447', 'Charges sociales à payer', 44),
(356, '4448', 'Autres organismes sociaux', 44),
(357, '445', 'Etat - créditeur', 44),
(358, '4452', 'Etat Impôts, taxes et assimilés', 44),
(359, '44521', 'Etat, taxe urbaine et taxe d\'édilité', 44),
(360, '44522', 'Etat, patente', 44),
(361, '44525', 'Etat, IGR', 44),
(362, '4453', 'Etat, impôts sur les résultats', 44),
(363, '4455', 'Etat, TVA facturée', 44),
(364, '4456', 'Etat, TVA due (suivant déclarations)', 44),
(365, '4457', 'Etat, impôts et taxes à payer', 44),
(366, '4458', 'Etat - autres comptes créditeurs', 44),
(367, '446', 'Comptes d\'associés - créditeurs', 44),
(368, '4461', 'Associés - capital à rembourser', 44),
(369, '4462', 'Associés - versements reçus sur augmentation de capital', 44),
(370, '4463', 'Comptes courants des associés créditeurs', 44),
(371, '4464', 'Associés - opérations faites en commun', 44),
(372, '4465', 'Associés - dividendes à payer', 44),
(373, '4468', 'Autres comptes d\'associés - créditeurs', 44),
(374, '448', 'Autres créanciers', 44),
(375, '4481', 'Dettes sur acquisitions d\'immobilisations', 44),
(376, '4483', 'Dettes sur acquisitions de titres et valeurs de placement', 44),
(377, '4484', 'Obligations échues à rembourser', 44),
(378, '4485', 'Obligations, coupons à payer', 44),
(379, '4487', 'Dettes rattachées aux autres créanciers', 44),
(380, '4488', 'Divers créanciers', 44),
(381, '449', 'Comptes de régularisation - passif', 44),
(382, '4491', 'Produits constatés d\'avance', 44),
(383, '4493', 'Intérêts courus et non échus à payer', 44),
(384, '4495', 'Comptes de répartition périodique des produits', 44),
(385, '4497', 'Comptes transitoires ou d\'attente - créditeurs', 44),
(386, '450', 'Autres provisions pour risques et charges', 45),
(387, '4501', 'Provisions pour litiges', 45),
(388, '4502', 'Provisions pour garanties données aux clients', 45),
(389, '4505', 'Provisions pour amendes, doubles droits et pénalités', 45),
(390, '4506', 'Provisions pour pertes de change', 45),
(391, '4507', 'Provisions pour impôts', 45),
(392, '4508', 'Autres provisions pour risques et charges', 45),
(393, '470', 'Ecarts de conversion - passif (Eléments circulants)', 47),
(394, '4701', 'Augmentation des créances circulantes', 47),
(395, '4702', 'Diminution des dettes circulantes', 47),
(396, '511', 'Chèques et valeurs à encaisser', 51),
(397, '5111', 'Chèques à encaisser ou à l\'encaissement', 51),
(398, '51111', 'Chèques en portefeuille', 51),
(399, '51112', 'Chèques à l\'encaissement', 51),
(400, '5113', 'Effets à encaisser ou à l\'encaissement', 51),
(401, '51131', 'Effets échus à encaisser', 51),
(402, '51132', 'Effets à l\'encaissement', 51),
(403, '5115', 'Virement de fonds', 51),
(404, '5118', 'Autres valeurs à encaisser', 51),
(405, '514', 'Banques, Trésorerie Générale et chèques postaux débiteurs', 51),
(406, '5141', 'Banques (solde débiteur)', 51),
(407, '5143', 'Trésorerie Générale', 51),
(408, '5146', 'Chèques postaux', 51),
(409, '5148', 'Autres établissements financiers et assimilés (soldes débiteurs)', 51),
(410, '516', 'Caisses, régies d\'avances et accréditifs', 51),
(411, '5161', 'Caisses', 51),
(412, '51611', 'Caisse Centrale', 51),
(413, '51613', 'Caisse (succursale ou agence A)', 51),
(414, '51614', 'Caisse (succursale ou agence B)', 51),
(415, '5165', 'Régies d\'avances et accréditifs', 51),
(416, '552', 'Crédits d\'escompte', 55),
(417, '5520', 'Crédits d\'escompte', 55),
(418, '553', 'Crédits de trésorerie', 55),
(419, '5530', 'Crédits de trésorerie', 55),
(420, '554', 'Banques (solde créditeur)', 55),
(421, '5541', 'Banques (solde créditeur)', 55),
(422, '5548', 'Autres établissements financiers et assimilés (soldes créditeurs)', 55),
(423, '590', 'Provisions pour dépréciation des comptes de trésorerie', 59),
(424, '5900', 'Provisions pour dépréciation des comptes de trésorerie', 59),
(425, '611', 'Achats revendus de marchandises', 61),
(426, '6111', 'Achats de marchandises \'groupe A\'', 61),
(427, '6112', 'Achats de marchandises \'groupe B\'', 61),
(428, '6114', 'Variation de stocks de marchandises', 61),
(429, '6118', 'Achats revendus de marchandises des exercices antérieurs', 61),
(430, '6119', 'Rabais, remises et ristournes obtenus sur achats de marchandises', 61),
(431, '612', 'Achats consommés de matières et fournitures', 61),
(432, '6121', 'Achats de matières premières', 61),
(433, '61211', 'Achats de matières premières A', 61),
(434, '61212', 'Achats de matières premières B', 61),
(435, '6122', 'Achats de matières et fournitures consommables', 61),
(436, '61221', 'Achats de matières et fournitures A', 61),
(437, '61222', 'Achats de matières et fournitures B', 61),
(438, '61223', 'Achats de combustibles', 61),
(439, '61224', 'Achats de produits d\'entretien', 61),
(440, '61225', 'Achats de fournitures d\'atelier et d\'usine', 61),
(441, '61226', 'Achats de fournitures de magasin', 61),
(442, '61227', 'Achats de fournitures de bureau', 61),
(443, '6123', 'Achats d\'emballages', 61),
(444, '51231', 'Achats d\'emballages perdus', 51),
(445, '61232', 'Achats d\'emballages récupérables non identifiables', 61),
(446, '61233', 'Achats d\'emballages à usage mixte', 61),
(447, '6124', 'Variation des stocks de matières et fournitures', 61),
(448, '61241', 'Variation des stocks de matières premières', 61),
(449, '61242', 'Variation des stocks de matières et fournitures consommables', 61),
(450, '61243', 'Variation des stocks des emballages', 61),
(451, '6125', 'Achats non stockés de matières et fournitures', 61),
(452, '61251', 'Achats de fournitures non stockables (eau, électricité,,)', 61),
(453, '61252', 'Achats de fournitures d\'entretien', 61),
(454, '61253', 'Achats de petit outillage et petit équipement', 61),
(455, '61254', 'Achats de fournitures de bureau', 61),
(456, '6126', 'Achats de travaux, études et prestations de service', 61),
(457, '61261', 'Achats des travaux', 61),
(458, '61262', 'Achats des études', 61),
(459, '61263', 'Achats des prestations de service', 61),
(460, '6128', 'Achats de matières et de fournitures des exercices antérieurs', 61),
(461, '6129', 'Rabais, remises et ristournes obtenus sur achats consommés de matières et fournitures', 61),
(462, '61291', 'Rabais, remises et ristournes obtenus sur achats de matières premières', 61),
(463, '61292', 'Rabais, remises et ristournes obtenus sur achats de matières et fournitures consommables', 61),
(464, '61293', 'Rabais, remises et ristournes obtenus sur achats des emballages', 61),
(465, '61295', 'Rabais, remises et ristournes obtenus sur achats non stockés', 61),
(466, '61296', 'Rabais, remises et ristournes obtenus sur achats de travaux, études et prestations de service', 61),
(467, '61298', 'Rabais, remises et ristournes obtenus sur achats de matières et fournitures des exercices antérieurs', 61),
(468, '613', 'Autres charges externes', 61),
(469, '6131', 'Locations et charges locatives', 61),
(470, '61311', 'Locations de terrains', 61),
(471, '61312', 'Locations de constructions', 61),
(472, '61313', 'Locations de matériel et d\'outillage', 61),
(473, '61314', 'Locations de mobilier et de matériel de bureau', 61),
(474, '61315', 'Locations de matériel informatique', 61),
(475, '61316', 'Locations de matériel de transport', 61),
(476, '61317', 'Malis sur emballages rendus', 61),
(477, '61318', 'Locations et charges locatives diverses', 61),
(478, '6132', 'Redevances de crédit-bail', 61),
(479, '61321', 'Redevances de crédit-bail - mobilier et matériel', 61),
(480, '6133', 'Entretien et réparations', 61),
(481, '61331', 'Entretien et réparations des biens immobiliers', 61),
(482, '61332', 'Entretien et réparations des biens mobiliers', 61),
(483, '61335', 'Maintenance', 61),
(484, '6134', 'Primes d\'assurances', 61),
(485, '61341', 'Assurances multirisque (vol, incendie,R,C,)', 61),
(486, '61343', 'Assurances - risques d\'exploitation', 61),
(487, '61345', 'Assurances - Matériel de transport', 61),
(488, '61348', 'Autres assurances', 61),
(489, '6135', 'Rémunérations du personnel extérieur à l\'entreprise', 61),
(490, '61351', 'Rémunérations du personnel occasionnel', 61),
(491, '61352', 'Rémunérations du personnel intérimaire', 61),
(492, '61353', 'Rémunérations du personnel détaché ou prêté à l\'entreprise', 61),
(493, '6136', 'Rémunérations d\'intermédiaires et honoraires', 61),
(494, '61361', 'Commissions et courtages', 61),
(495, '61365', 'Honoraires', 61),
(496, '61367', 'Frais d\'actes et de contentieux', 61),
(497, '6137', 'Redevances pour brevets, marques, droits et valeurs similaires', 61),
(498, '61371', 'Redevances pour brevets', 61),
(499, '61378', 'Autres redevances', 61),
(500, '614', 'Autres charges externes', 61),
(501, '6141', 'Etudes, recherches et documentation', 61),
(502, '61411', 'Etudes générales', 61),
(503, '61413', 'Recherches', 61),
(504, '61415', 'Documentation générale', 61),
(505, '61416', 'Documentation technique', 61),
(506, '6142', 'Transports', 61),
(507, '61421', 'Transports du personnel', 61),
(508, '61425', 'Transports sur achats', 61),
(509, '61426', 'Transports sur ventes', 61),
(510, '61428', 'Autres transports', 61),
(511, '6143', 'Déplacements, missions et réceptions', 61),
(512, '61431', 'Voyages et déplacements', 61),
(513, '61433', 'Frais de déménagement', 61),
(514, '61435', 'Missions', 61),
(515, '61436', 'Réceptions', 61),
(516, '6144', 'Publicité, publications et relations publiques', 61),
(517, '61441', 'Annoces et insertions', 61),
(518, '61442', 'Echantillons, catalogues et imprimés publicitaires', 61),
(519, '61443', 'Foires et expositions', 61),
(520, '61444', 'Primes de publicité', 61),
(521, '61446', 'Publications', 61),
(522, '61447', 'Cadeaux à la clientèle', 61),
(523, '61448', 'Autres charges de publicité et relations publiques', 61),
(524, '6145', 'Frais postaus et frais de télécommunications', 61),
(525, '61451', 'Frais postaux', 61),
(526, '61455', 'Frais de téléphone', 61),
(527, '61456', 'Frais de télex et de télégrammes', 61),
(528, '6146', 'Cotisations et dons', 61),
(529, '61461', 'Cotisations', 61),
(530, '61462', 'Dons', 61),
(531, '6147', 'Services bancaires', 61),
(532, '61471', 'Frais d\'achat et de vente des titres', 61),
(533, '61472', 'Frais sur effets de commerce', 61),
(534, '61473', 'Frais et commisions sur services bancaires', 61),
(535, '6148', 'Autres charges externes des exercices antérieurs', 61),
(536, '6149', 'Rabais, remises et ristournes obtenus sur autres charges externes', 61),
(537, '616', 'Impôts et taxes', 61),
(538, '6161', 'Impôts et taxes directs', 61),
(539, '61611', 'Taxe urbaine et taxe d\'édilité', 61),
(540, '61612', 'Patente', 61),
(541, '61615', 'Taxes locales', 61),
(542, '6165', 'Impôts et taxes directs', 61),
(543, '6167', 'Impôts, taxes et droits assimilés', 61),
(544, '61671', 'Droits d’enregistrement et de timbre', 61),
(545, '61673', 'Taxes sur les véhicules', 61),
(546, '61678', 'Autres impôts, taxes et droits assimilés', 61),
(547, '6168', 'Impôts et taxes des exercices antérieurs', 61),
(548, '617', 'Charges de personnel', 61),
(549, '6171', 'Rémunérations du personnel', 61),
(550, '61711', 'Appointements et salaires', 61),
(551, '61712', 'Primes et gratifications', 61),
(552, '61713', 'Indemnités et avantages divers', 61),
(553, '61714', 'Commissions au personnel', 61),
(554, '61715', 'Rémunérations des administrateurs, gérants et associés', 61),
(555, '6174', 'Charges sociales', 61),
(556, '61741', 'Cotisations de sécurité sociale', 61),
(557, '61742', 'Cotisations aux caisses de retraite', 61),
(558, '61743', 'Cotisations aux mutuelles', 61),
(559, '61744', 'Prestations familiales', 61),
(560, '61745', 'Assurances accidents de travail', 61),
(561, '6176', 'Charges sociales diverses', 61),
(562, '61761', 'Assurances groupe', 61),
(563, '61762', 'Prestations de retarites', 61),
(564, '61763', 'Allocations aux œuvres sociales', 61),
(565, '61764', 'Habillement et vêtements de travail', 61),
(566, '61765', 'Indemnités de préavis et de licenciement', 61),
(567, '61766', 'Médecine de travail, pharmacie', 61),
(568, '61768', 'Autres charges sociales diverses', 61),
(569, '6177', 'Rémunération de l\'exploitant', 61),
(570, '61771', 'Appointements et salaires', 61),
(571, '61774', 'Charges sociales sur appointements et salaires de l’exploitant', 61),
(572, '6178', 'Charges du personnel des exercices antérieurs', 61),
(573, '618', 'Autres charges d\'exploitation', 61),
(574, '6181', 'Jetons de présence', 61),
(575, '6182', 'Pertes sur créances irrécouvrables', 61),
(576, '6185', 'Pertes sur opérations faites en commun', 61),
(577, '6186', 'Transfert de profits sur opérations faites en commun', 61),
(578, '6188', 'Autres charges d’exploitation des exercices antérieurs', 61),
(579, '619', 'Dotations d’exploitation', 61),
(580, '6191', 'Dotations d’exploitation aux amortissements de l’immobilisation en non valeur', 61),
(581, '61911', 'D.E.A. des frais préliminaires', 61),
(582, '61912', 'D.E.A. des charges à répartir', 61),
(583, '6192', 'Dotations d’exploitation aux amortissements des immobilisations incorporelles', 61),
(584, '61921', 'D.E.A. de l’immobilisation en recherche et développement', 61),
(585, '61922', 'D.E.A. des brevets, marques, droits et valeurs similaires', 61),
(586, '61923', 'D.E.A. du fonds commercial', 61),
(587, '61928', 'D.E.A. des autres immobilisations incorporelles', 61),
(588, '6193', 'Dotations d’exploitation aux amortissements des immobilisations corporelles', 61),
(589, '61931', 'D.E.A. des terrains', 61),
(590, '61932', 'D.E.A. des constructions', 61),
(591, '61933', 'D.E.A. des installations techniques, matériel et outillage', 61),
(592, '61934', 'D.E.A. du matériel de transport', 61),
(593, '61935', 'D.E.A. des mobiliers, matériels de bureau et aménagements divers', 61),
(594, '61938', 'D.E.A. des autres immobilisations corporelles', 61),
(595, '6194', 'Dotations d’exploitation aux provisions pour dépréciation des immobilisations', 61),
(596, '61942', 'D.E.P. pour dépréciation des immobilisations incorporelles', 61),
(597, '61943', 'D.E.P. pour dépréciation des immobilisations corporelles', 61),
(598, '6195', 'Dotations d’exploitation aux provisions pour risques et charges', 61),
(599, '61955', 'D.E.P. pour risques et charges durables', 61),
(600, '61957', 'D.E.P. pour risques et charges momentanés', 61),
(601, '6196', 'Dotations d’exploitation aux provisions pour dépréciations de l’actif circulant', 61),
(602, '61961', 'D.E.P. pour dépréciation des stocks', 61),
(603, '61964', 'D.E.P. pour dépréciation des créances de l’actif circulant', 61),
(604, '6198', 'Dotations d’exploitation des exercices antérieurs', 61),
(605, '61981', 'D.E. aux amortissements des exercices antérieurs', 61),
(606, '61984', 'D.E. aux provisions des exercices antérieurs', 61),
(608, '631', 'Charges d’intérêts', 63),
(609, '6311', 'Intérêts des emprunts et dettes', 63),
(610, '63111', 'Intérêts des emprunts', 63),
(611, '63113', 'Intérêts des dettes rattachées à des participations', 63),
(612, '63114', 'Intérêts des comptes courants et dépôts créditeurs', 63),
(613, '63115', 'Intérêts bancaires et sur opérations de financement', 63),
(614, '63118', 'Autres intérêts des emprunts et dettes', 63),
(615, '6318', 'Charges d’intérêts des exercices antérieurs', 63),
(616, '633', 'Pertes de change', 63),
(617, '6331', 'Pertes de change propres à l’exercice', 63),
(618, '6338', 'Pertes de change des exercices antérieurs', 63),
(619, '638', 'Autres charges financières', 63),
(620, '6382', 'Pertes sur créances liées à des participations', 63),
(621, '6385', 'Charges nettes sur cession de titres et valeurs de placement', 63),
(622, '6386', 'Escomptes accordés', 63),
(623, '6388', 'Autres charges financières des exercices antérieurs', 63),
(624, '639', 'Dotations financières', 63),
(625, '6391', 'Dotations aux amortissements des primes de remboursement des obligations', 63),
(626, '6392', 'Dotations aux provisions pour dépréciations des immobilisations financières', 63),
(627, '6393', 'Dotations aux provisions pour risques et charges financières', 63),
(628, '6394', 'Dotation aux provisions pour dépréciation des titres et valeurs de placement', 63),
(629, '6396', 'Dotations aux provisions pour dépréciation des compte de trésoreie', 63),
(630, '6398', 'Dotations financières des exercices antérieurs', 63),
(632, '651', 'Valeurs nettes d’amortissements des immobilisations cédées ( V.N.A )', 65),
(633, '6512', 'VNA des immobilisations incorporelles cédées', 65),
(634, '6513', 'VNA des immobilisations corporelles cédées', 65),
(635, '6514', 'VNA provisions des immobilisations financières cédées (droits de propriété)', 65),
(636, '6518', 'VNA des immobilisations cédées des exercices antérieurs', 65),
(637, '656', 'Subventions accordées', 65),
(638, '6561', 'Subventions accordées de l’exercice', 65),
(639, '6568', 'Subventions accordées des exercices antérieurs', 65),
(640, '658', 'Autres charges non courantes', 65),
(641, '6581', 'Pénalités sur marchés et dédits', 65),
(642, '65811', 'Pénalités sur marchés', 65),
(643, '65812', 'Dédits', 65),
(644, '6582', 'Rappels d’impôts (autres qu’impôts sur les résultats)', 65),
(645, '6583', 'Pénalités et amendes fiscales ou pénales', 65),
(646, '65831', 'Pénalités et amendes fiscales', 65),
(647, '65833', 'Pénalités et amendes pénales', 65),
(648, '6585', 'Créances devenues irrécouvrables', 65),
(649, '6586', 'Dons, libéralités et lots', 65),
(650, '65861', 'Dons', 65),
(651, '65862', 'Libéralités', 65),
(652, '65863', 'Lots', 65),
(653, '6588', 'Autres charges non courantes des exercices antérieurs', 65),
(654, '659', 'Dotations non courantes', 65),
(655, '6591', 'Dotations aux amortissements exceptionnels des immobilisations', 65),
(656, '65911', 'D.A.E. de l’immobilisation en non-valeurs', 65),
(657, '65912', 'D.A.E. des immobilisations incorporelles', 65),
(658, '65913', 'D.A.E. des immobilisations corporelles', 65),
(659, '6594', 'Dotations non courantes aux provisions réglementées', 65),
(660, '65941', 'D.N.C. pour amortissements dérogatoires', 65),
(661, '65942', 'D.N.C. pour plus-values en instance d\'imposition', 65),
(662, '65944', 'D.N.C. pour investissements', 65),
(663, '65945', 'D.N.C. pour reconstitution de gisements', 65),
(664, '65946', 'D.N.C. pour acquisition et construction de logements', 65),
(665, '6595', 'Dotations non courantes aux provisions pour risques et charges', 65),
(666, '65955', 'D.N.C. aux provisions pour risques et charges durables', 65),
(667, '65957', 'D.N.C. aux provisions pour risques et charges momentanés', 65),
(668, '6596', 'Dotations non courantes aux provisions pour dépréciation', 65),
(669, '65962', 'D.N.C. aux provisions pour dépréciation de l’actif immobilisé', 65),
(670, '65963', 'D.N.C. aux provisions pour dépréciation de l’actif circulant', 65),
(671, '6598', 'Dotations non courantes des exercices antérieurs', 65),
(672, '670', 'Impôts sur les résulatats', 67),
(673, '6701', 'Impôts sur les bénéfices', 67),
(674, '6705', 'Imposition minimale annuelle des sociétés', 67),
(675, '6708', 'Rappels et dégrèvements d’impôts sur les résultats', 67),
(676, '711', 'Ventes de marchandises', 71),
(677, '7111', 'Ventes de marchandises au Maroc', 71),
(678, '7113', 'Ventes de marchandises à l’étranger', 71),
(679, '7118', 'Ventes de marchandises des exercices antérieurs', 71),
(680, '7119', 'Rabais, remises et ristournes accordés par l’entreprise', 71),
(681, '712', 'Ventes de biens et services produits', 71),
(682, '7121', 'Ventes de biens produits au Maroc', 71),
(683, '71211', 'Ventes de produits finis', 71),
(684, '71212', 'Ventes de produits intermédiaires', 71),
(685, '71217', 'Ventes de produits résiduels', 71),
(686, '7122', 'Ventes de biens produits à l’étranger', 71),
(687, '71221', 'Ventes de produits finis', 71),
(688, '71222', 'Ventes de produits intermédiaires', 71),
(689, '7124', 'Ventes de services produits au Maroc', 71),
(690, '71241', 'Travaux', 71),
(691, '71242', 'Etudes', 71),
(692, '71243', 'Prestations de services', 71),
(693, '7125', 'Ventes de services produits à l\'étranger', 71),
(694, '71251', 'Travaux', 71),
(695, '71252', 'Etudes', 71),
(696, '71253', 'Prestations de services', 71),
(697, '7126', 'Redevances pour brevets, marques, droits et valeurs similaires', 71),
(698, '7127', 'Ventes de produits accessoires', 71),
(699, '71271', 'Locations divers es reçues', 71),
(700, '71272', 'Commissions et courtages reçus', 71),
(701, '71273', 'Produits de services exploités dans l\'intérêt du personnel', 71),
(702, '71275', 'Bonis sur reprises d\'emballages consignés', 71),
(703, '71276', 'Ports et frais accessoires facturés', 71),
(704, '71278', 'Autres ventes et produits accessoires', 71),
(705, '7128', 'Ventes de biens et services produits des exercices antérieurs', 71),
(706, '7129', 'Rabais, remises et ristournes accordés par l’entreprise', 71),
(707, '71291', 'R,R,R accordées sur ventes au Maroc des biens produits', 71),
(708, '71292', 'R,R,R accordées sur ventes à l\'étranger des biens produits', 71),
(709, '71294', 'R,R,R accordées sur ventes au Maroc des services produits', 71),
(710, '71295', 'R,R,R accordées sur ventes à l\'étranger des services produits', 71),
(711, '71298', 'Rabais, remises et ristournes accordés sur ventes de B & S produits des exercices antérieurs', 71),
(712, '713', 'Variation des stocks de produits', 71),
(713, '7131', 'Variation des stocks de produits en cours', 71),
(714, '71311', 'Variation des stocks de biens produits en cours', 71),
(715, '71312', 'Variation des stocks de produits intermédiaires en cours', 71),
(716, '71317', 'Variation des stocks de produits résiduels en cours', 71),
(717, '7132', 'Variation des stocks de biens produits', 71),
(718, '71321', 'Variation des stocks de produits finis', 71),
(719, '71322', 'Variation des stocks de produits intermédiaires', 71),
(720, '71327', 'Variation des stocks de produits résiduels', 71),
(721, '7134', 'Variation des stocks de services en cours', 71),
(722, '71341', 'Variation des stocks de travaux en cours', 71),
(723, '71342', 'Variation des stocks d\'études en cours', 71),
(724, '71343', 'Variation des stocks de prestations en cours', 71),
(725, '714', 'Immobilisations produites par l’entreprise pour elle même', 71),
(726, '7141', 'Immobilisation en non valeurs produite', 71),
(727, '7142', 'Immobilisations incorporelles produites', 71),
(728, '7143', 'Immobilisations corporelles produites', 71),
(729, '7148', 'Immobilisations produites des exercices antérieurs', 71),
(730, '716', 'Subventions d’exploitation', 71),
(731, '7161', 'Subventions d’exploitations reçues de l’exercice', 71),
(732, '7168', 'Subventions d’exploitation reçues des exercices antérieurs', 71),
(733, '718', 'Autres produits d’exploitation', 71),
(734, '7181', 'Jetons de présence reçus', 71),
(735, '7182', 'Revenus des immeubles non affectés à l’exploitation', 71),
(736, '7185', 'Profits sur opérations faites en commun', 71),
(737, '7186', 'Transfert de pertes sur opérations faites en commun', 71),
(738, '7188', 'Autres produits d’exploitation des exercices antérieurs', 71),
(739, '719', 'Reprise d’exploitation, transferts de charges', 71),
(740, '7191', 'Reprises sur amortissements de l’immobilisation en non valeurs', 71),
(741, '7192', 'Reprises sur amortissements des immobilisations incorporelles', 71),
(742, '7193', 'Reprises sur amortissements des immobilisations corporelles', 71),
(743, '7194', 'Reprises sur provisions pour dépréciation des immobilisations', 71),
(744, '7195', 'Reprises sur provisions pour risques et charges', 71),
(745, '7196', 'Reprises sur provisions pour dépréciation de l’actif circulant', 71),
(746, '7197', 'Transferts des charges d’exploitation', 71),
(747, '71971', 'T,C,E - Achats de marchandises', 71),
(748, '71972', 'T,C,E - Achats consommés de matières et fournitures', 71),
(749, '71973', 'T,C,E - Autes charges externes', 71),
(750, '71975', 'T,C,E - Impôts et taxes', 71),
(751, '71976', 'T,C,E - Charges de personnel', 71),
(752, '71978', 'T,C,E - Autres charges d\'exploitation', 71),
(753, '7198', 'Reprises sur amortissements et provisions des exercices antérieurs', 71),
(754, '71981', 'Reprises sur amortissements des exercices antérieurs', 71),
(755, '71984', 'Reprises sur provisions des exercices antérieurs', 71),
(756, '732', 'Produits des titres de participation et des autres titres immobilisés', 73),
(757, '7321', 'Revenus des titres de participation', 73),
(758, '7325', 'Revenus des titres immobilisés', 73),
(759, '7328', 'Produits des titres de participation et des autres titres immobilisés des exercices antérieurs', 73),
(760, '733', 'Gains de change', 73),
(761, '7331', 'Gains de change propres à l’exercice', 73),
(762, '7338', 'Gains de change des exercices antérieurs', 73),
(763, '738', 'Intérêts et autres produits financiers', 73),
(764, '7381', 'Intérêts et produits assimilés', 73),
(765, '73811', 'Intérêts des prêts', 73),
(766, '73813', 'Revenus des autres créances financières', 73),
(767, '7383', 'Revenus des créances rattachées à des participations', 73),
(768, '7384', 'Revenus des titres et valeurs de placement', 73),
(769, '7385', 'Produits nets sur cessions de titres et valeurs de placement', 73),
(770, '7386', 'Escomptes obtenus', 73),
(771, '7388', 'Intérêts et autres produits financiers des exercices antérieurs', 73),
(772, '739', 'Reprises financières, transferts de charges', 73),
(773, '7391', 'Reprises sur amortissements des primes de remboursement des obligations', 73),
(774, '7392', 'Reprises sur provisions pour dépréciation des immobilisations financières', 73),
(775, '7393', 'Reprises sur provisions pour risques et charges financières', 73),
(776, '7394', 'Reprise sur provisions pour dépréciation des titres et valeurs de placement', 73),
(777, '7396', 'Reprises sur provisions pour dépréciation des comptes de trésorerie', 73),
(778, '7397', 'Transfert de charges financières', 73),
(779, '73971', 'Transfert - Charges d\'intérêts', 73),
(780, '73973', 'Transfert - Pertes de change', 73),
(781, '73978', 'Transfert - Autres charges financières', 73),
(782, '7398', 'Reprises sur dotations financières des exercices antérieurs', 73),
(783, '751', 'Produits des cessions d’immobilisations', 75),
(784, '7512', 'Produits des cessions des immobilisations incorporelles', 75),
(785, '7513', 'Produits des cessions des immobilisations corporelles', 75),
(786, '7514', 'Produits des cessions des immobilisations financières (droits de propriété)', 75),
(787, '7518', 'Produits des cessions des immobilisations des exercices antérieurs', 75),
(788, '756', 'Subventions d’équilibre', 75),
(789, '7561', 'Subventions d’équilibre reçues de l’exercice', 75),
(790, '7568', 'Subventions d’équilibre reçues des exercices antérieurs', 75),
(791, '757', 'Reprise sur subventions d’investissements', 75),
(792, '7577', 'Reprises sur subventions d’investissement de l’exercice', 75),
(793, '7578', 'Reprises sur subventions d’investissement des exercices antérieurs', 75),
(794, '758', 'Autres produits non courants', 75),
(795, '7581', 'Pénalités et dédits reçus', 75),
(796, '75811', 'Pénalités reçues sur marchés', 75),
(797, '75812', 'Dédits reçus', 75),
(798, '7582', 'Dégrèvement d’impôts (autres qu’impôts sur les résultats)', 75),
(799, '7585', 'Rentrées sur créances soldées', 75),
(800, '7586', 'Dons, libéralités et lots reçus', 75),
(801, '75861', 'Dons', 75),
(802, '75862', 'Libéralités', 75),
(803, '75863', 'Lots', 75),
(804, '7588', 'Autres produits non courants des exercices antérieurs', 75),
(805, '7591', 'Reprises non courantes sur amortissements exceptionnels des immobilisations', 75),
(806, '75911', 'R,A,E de l\'mmobilisation en non valeurs', 75),
(807, '75912', 'R,A,E des immobilisations incorporelles', 75),
(808, '75913', 'R,A,E des immobilisations corporelles', 75),
(809, '7594', 'Reprises non courantes sur provisions réglementées', 75),
(810, '75941', 'Reprises sur amortissements dérogatoires', 75),
(811, '75942', 'Reprises sur plus-values en instance d\'imposition', 75),
(812, '75944', 'Reprises sur provisions pour investissements', 75),
(813, '75945', 'Reprises sur provisions pour reconstitution de gisements', 75),
(814, '75946', 'Reprises sur provisions pour acquisition et construction de logements', 75),
(815, '7595', 'Reprises non courantes sur provisions pour risques et charges', 75),
(816, '75955', 'Reprises sur provisions pour risques et charges durables', 75),
(817, '75957', 'Reprises sur provisions pour risques et charges momentanés', 75),
(818, '7596', 'Reprises non courantes sur provisions pour dépréciation', 75),
(819, '75962', 'R,N,C sur provisions pour dépréciation de l\'actif immobilisé', 75),
(820, '75963', 'R,N,C sur provisions pour dépréciation de l\'actif circulant', 75),
(821, '7598', 'Reprises non courantes des exercices antérieurs.', 75),
(822, '7597', 'Transferts de charges non courantes', 75);

-- --------------------------------------------------------

--
-- Structure de la table `connection`
--

CREATE TABLE `connection` (
  `id` bigint(20) NOT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `societe_login` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cpc`
--

CREATE TABLE `cpc` (
  `id` bigint(20) NOT NULL,
  `date_max_cpc` datetime DEFAULT NULL,
  `date_min_cpc` date DEFAULT NULL,
  `total_charg_ex` double NOT NULL,
  `total_charg_fin` double NOT NULL,
  `total_chargncour` double NOT NULL,
  `total_prod_ex` double NOT NULL,
  `total_prod_fin` double NOT NULL,
  `total_prodncour` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cpc_facture`
--

CREATE TABLE `cpc_facture` (
  `id` bigint(20) NOT NULL,
  `included` bit(1) DEFAULT NULL,
  `cpc` bigint(20) DEFAULT NULL,
  `facture` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `create_societe_page`
--

CREATE TABLE `create_societe_page` (
  `id` bigint(20) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `lien` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `create_societe_page`
--

INSERT INTO `create_societe_page` (`id`, `color`, `description`, `libelle`, `lien`) VALUES
(1, '#9cd7fb', 'permet de protéger vos biens personnels, de récupérer la TVA et de déduire vos charges.', 'SARL', '/societe/societe-create1'),
(2, '#6dc4f9', 'est la structure préférée des entrepreneurs français. Réputée pour sa flexibilité, elle vous permet de mettre à l\'abri vos biens personnels', 'SAS', '/societe/societe-create1'),
(3, '#3eb1f7', 'est une SAS avec un associé unique. Elle permet d\'organiser votre entreprise très librement et de limiter votre responsabilité.', 'SASU', '/societe/societe-create1'),
(4, '#0f9ef5', '(Entreprise Unipersonnelle à Responsabilité Limitée) est une forme juridique populaire chez les entrepreneurs qui se lancent seuls. L’un des avantages principaux de l’EURL réside dans la possibilité d’optimiser ses charges sociales facilement.', 'EURL', '/societe/societe-create1'),
(5, '#0782cc', '(Société Civile Immobilière) présente de nombreux avantages pour acquérir et gérer des biens immobiliers : avantages fiscaux, déduction des charges ou encore facilité de gestion. ', 'SCI', '/societe/societe-create1'),
(6, '#06649d', 'est une organisation dont l’objectif n’est pas de réaliser des bénéfices. C’est une structure qui peut être utilisée dans des domaines divers et variés (sport, culture, art, humanitaire).', 'ASSOCIATION', '/societe/societe-create1'),
(7, '#04466d', 'statut d’ est choisi par des milliers d’entrepreneurs qui souhaitent devenir indépendant.', 'AUTO-ENTREPRISE', '/societe/societe-create1');

-- --------------------------------------------------------

--
-- Structure de la table `declarationir`
--

CREATE TABLE `declarationir` (
  `id` bigint(20) NOT NULL,
  `annee` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `declarationir`
--

INSERT INTO `declarationir` (`id`, `annee`, `mois`, `ref`, `total`, `societe`) VALUES
(106, 2021, 12, 'hd', 1132.6, 7),
(23, 2021, 11, 'd11', 2364.5, 7),
(31, 2021, 10, 'd10', 2264.6, 7),
(38, 2021, 9, 'd9', 1665.2, 7),
(42, 2021, 8, 'd8', 1531.9, 7),
(48, 2021, 7, 'd7', 2164.7, 7),
(54, 2021, 6, 'd6', 2164.7, 7),
(60, 2021, 5, 'd5', 1531.9, 7),
(65, 2021, 4, 'd4', 2364.5, 7),
(73, 2021, 3, 'd3', 1332.1, 7),
(77, 2021, 2, 'd2', 1531.9, 7),
(83, 2021, 1, 'd1', 1765.1, 7),
(127, 2022, 1, 'testa', 3197.1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `declarationiremploye`
--

CREATE TABLE `declarationiremploye` (
  `id` bigint(20) NOT NULL,
  `montantir` double DEFAULT NULL,
  `salaire_brut` double DEFAULT NULL,
  `salaire_net` double DEFAULT NULL,
  `declarationir` bigint(20) DEFAULT NULL,
  `employe` bigint(20) DEFAULT NULL,
  `taux_ir` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `declarationiremploye`
--

INSERT INTO `declarationiremploye` (`id`, `montantir`, `salaire_brut`, `salaire_net`, `declarationir`, `employe`, `taux_ir`) VALUES
(20, 832.6, 7000, 6167.4, 19, 69, NULL),
(21, 499.5, 5000, 4500.5, 19, 71, NULL),
(22, 832.6, 15000, 14167.4, 19, 337, NULL),
(24, 99.9, 3500, 3400.1, 23, 56, NULL),
(25, 99.9, 3500, 3400.1, 23, 60, NULL),
(26, 0, 200, 200, 23, 59, NULL),
(27, 832.6, 7000, 6167.4, 23, 69, NULL),
(28, 0, 3, 3, 23, 70, NULL),
(29, 499.5, 5000, 4500.5, 23, 71, NULL),
(30, 832.6, 15000, 14167.4, 23, 337, NULL),
(32, 99.9, 3500, 3400.1, 31, 56, NULL),
(33, 0, 200, 200, 31, 59, NULL),
(34, 832.6, 7000, 6167.4, 31, 69, NULL),
(35, 0, 3, 3, 31, 70, NULL),
(36, 499.5, 5000, 4500.5, 31, 71, NULL),
(37, 832.6, 15000, 14167.4, 31, 337, NULL),
(39, 0, 200, 200, 38, 59, NULL),
(40, 832.6, 7000, 6167.4, 38, 69, NULL),
(41, 832.6, 15000, 14167.4, 38, 337, NULL),
(43, 99.9, 3500, 3400.1, 42, 56, NULL),
(44, 99.9, 3500, 3400.1, 42, 60, NULL),
(45, 0, 3, 3, 42, 70, NULL),
(46, 499.5, 5000, 4500.5, 42, 71, NULL),
(47, 832.6, 15000, 14167.4, 42, 337, NULL),
(49, 0, 200, 200, 48, 59, NULL),
(50, 832.6, 7000, 6167.4, 48, 69, NULL),
(51, 0, 3, 3, 48, 70, NULL),
(52, 499.5, 5000, 4500.5, 48, 71, NULL),
(53, 832.6, 15000, 14167.4, 48, 337, NULL),
(55, 0, 200, 200, 54, 59, NULL),
(56, 832.6, 7000, 6167.4, 54, 69, NULL),
(57, 0, 3, 3, 54, 70, NULL),
(58, 499.5, 5000, 4500.5, 54, 71, NULL),
(59, 832.6, 15000, 14167.4, 54, 337, NULL),
(61, 99.9, 3500, 3400.1, 60, 56, NULL),
(62, 99.9, 3500, 3400.1, 60, 60, NULL),
(63, 499.5, 5000, 4500.5, 60, 71, NULL),
(64, 832.6, 15000, 14167.4, 60, 337, NULL),
(66, 99.9, 3500, 3400.1, 65, 56, NULL),
(67, 99.9, 3500, 3400.1, 65, 60, NULL),
(68, 0, 200, 200, 65, 59, NULL),
(69, 832.6, 7000, 6167.4, 65, 69, NULL),
(70, 0, 3, 3, 65, 70, NULL),
(71, 499.5, 5000, 4500.5, 65, 71, NULL),
(72, 832.6, 15000, 14167.4, 65, 337, NULL),
(74, 0, 3, 3, 73, 70, NULL),
(75, 499.5, 5000, 4500.5, 73, 71, NULL),
(76, 832.6, 15000, 14167.4, 73, 337, NULL),
(78, 99.9, 3500, 3400.1, 77, 56, NULL),
(79, 99.9, 3500, 3400.1, 77, 60, NULL),
(80, 0, 200, 200, 77, 59, NULL),
(81, 832.6, 7000, 6167.4, 77, 69, NULL),
(82, 499.5, 5000, 4500.5, 77, 71, NULL),
(84, 99.9, 3500, 3400.1, 83, 56, NULL),
(85, 0, 200, 200, 83, 59, NULL),
(86, 832.6, 7000, 6167.4, 83, 69, NULL),
(87, 0, 3, 3, 83, 70, NULL),
(88, 832.6, 15000, 14167.4, 83, 337, NULL),
(97, 99.9, 3500, 3400.1, 96, 56, NULL),
(98, 99.9, 3500, 3400.1, 96, 60, NULL),
(99, 0, 200, 200, 96, 59, NULL),
(100, 832.6, 7000, 6167.4, 96, 69, NULL),
(101, 0, 3, 3, 96, 70, NULL),
(102, 499.5, 5000, 4500.5, 96, 71, NULL),
(103, 832.6, 15000, 14167.4, 96, 337, NULL),
(104, 30, 2030, 2030, 96, 93, NULL),
(107, 832.6, 15000, 14167.4, 106, 337, NULL),
(108, 0, 2030, 2030, 106, 93, NULL),
(112, 832.6, 15000, 14167.4, 111, 337, NULL),
(113, 0, 2030, 2030, 111, 93, NULL),
(114, 0, 2300, 2300, 111, 105, NULL),
(115, 300, 9000, 159, 111, 110, NULL),
(117, 99.9, 3500, 3400.1, 116, 56, NULL),
(118, 99.9, 3500, 3400.1, 116, 60, NULL),
(119, 0, 200, 200, 116, 59, NULL),
(120, 832.6, 7000, 6167.4, 116, 69, NULL),
(121, 0, 3, 3, 116, 70, NULL),
(122, 499.5, 5000, 4500.5, 116, 71, NULL),
(123, 832.6, 15000, 14167.4, 116, 337, NULL),
(124, 0, 2030, 2030, 116, 93, NULL),
(125, 0, 2300, 2300, 116, 105, NULL),
(126, 832.6, 9000, 8167.4, 116, 110, NULL),
(128, 99.9, 3500, 3400.1, 127, 56, 17),
(129, 99.9, 3500, 3400.1, 127, 60, 17),
(130, 0, 200, 200, 127, 59, 16),
(131, 832.6, 7000, 6167.4, 127, 69, 19),
(132, 0, 3, 3, 127, 70, 16),
(133, 499.5, 5000, 4500.5, 127, 71, 18),
(134, 832.6, 15000, 14167.4, 127, 337, 19),
(135, 0, 2030, 2030, 127, 93, 16),
(136, 0, 2300, 2300, 127, 105, 16),
(137, 832.6, 9000, 8167.4, 127, 110, 19);

-- --------------------------------------------------------

--
-- Structure de la table `declarationis`
--

CREATE TABLE `declarationis` (
  `id` bigint(20) NOT NULL,
  `annee` double NOT NULL,
  `montantiscalcule` double DEFAULT NULL,
  `montantispaye` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `totalhtcharge` double DEFAULT NULL,
  `totalhtdiff` double DEFAULT NULL,
  `totalhtgain` double DEFAULT NULL,
  `total_paye` double DEFAULT NULL,
  `etat_declaration` bigint(20) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL,
  `tauxis` bigint(20) DEFAULT NULL,
  `taux_is_config` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `declarationis`
--

INSERT INTO `declarationis` (`id`, `annee`, `montantiscalcule`, `montantispaye`, `ref`, `totalhtcharge`, `totalhtdiff`, `totalhtgain`, `total_paye`, `etat_declaration`, `societe`, `tauxis`, `taux_is_config`) VALUES
(389, 2020, 169913.2, 169913.2, '1623587181699', 8500434, 999566, 9500000, 170413.2, 100, 8, 5, 1),
(390, 2021, 1.1, 3000, '1623587192023', 0, 11, 11, 3500, 101, 8, 4, 1),
(385, 2020, 170000, 0, '1623587146347', 8000000, 1000000, 9000000, NULL, 100, 10, 6, 1),
(409, 2020, 1162000, 1162000, '1623865919651', 4100000, 4200000, 8300000, 1162500, 100, 9, 6, 1),
(446, 2020, 1490637.82, 1490637.82, '1624391082952', 5100066, 5260122, 10360188, 1491137.82, 100, 7, 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `declaration_tva`
--

CREATE TABLE `declaration_tva` (
  `id` bigint(20) NOT NULL,
  `annee` double NOT NULL,
  `difftva` double NOT NULL,
  `mois` double NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `trim` double NOT NULL,
  `tvacollecter` double NOT NULL,
  `tvaperdue` double NOT NULL,
  `etat_declaration` bigint(20) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL,
  `type_declaration_tva` bigint(20) DEFAULT NULL,
  `ref_demande` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `declaration_tva`
--

INSERT INTO `declaration_tva` (`id`, `annee`, `difftva`, `mois`, `ref`, `trim`, `tvacollecter`, `tvaperdue`, `etat_declaration`, `societe`, `type_declaration_tva`, `ref_demande`) VALUES
(283, 2004, 0, 0, '1640890179999', 4, 0, 0, NULL, 7, 13, '1640888899643'),
(284, 2004, 0, 0, '1640890998015', 4, 0, 0, 453, 7, 13, '1640888899643'),
(285, 2002, 0, 0, '1641074145974', 4, 0, 0, NULL, 7, 13, '1630916522075');

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `id` bigint(20) NOT NULL,
  `annee` double NOT NULL,
  `date_demande` datetime DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `trimestre` int(11) DEFAULT NULL,
  `comptable_traiteur` bigint(20) DEFAULT NULL,
  `comptable_validateur` bigint(20) DEFAULT NULL,
  `etat_demande` bigint(20) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL,
  `enable_btn` bit(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`id`, `annee`, `date_demande`, `mois`, `operation`, `ref`, `trimestre`, `comptable_traiteur`, `comptable_validateur`, `etat_demande`, `societe`, `enable_btn`) VALUES
(250, 2002, '2021-09-14 13:32:55', 0, 'Declaration TVA', '1630916522075', 4, 1, 3, 364, 7, b'0'),
(263, 2016, '2021-09-14 19:55:59', 4, 'Declaration IS', '1631649107799', 2, 1, 3, 358, 7, b'1'),
(266, 2021, '2021-09-17 11:07:37', 1, 'Declaration IS', '1631876821928', 1, 1, 3, 358, 9, b'1'),
(273, 2004, '2021-12-30 18:30:24', 0, 'Declaration TVA', '1640888899643', 4, 2, 3, 367, 7, b'0'),
(286, 2008, '2022-01-02 16:26:46', 0, 'Declaration TVA', '1641140806358', 4, NULL, NULL, 358, 7, b'1'),
(289, 2009, '2022-01-02 16:48:49', 2, 'Declaration IS', '1641142129161', 1, NULL, NULL, 358, 7, b'1'),
(292, 2006, '2022-02-10 08:38:52', 0, 'Declaration TVA', '1644482332404', 4, NULL, NULL, 358, 7, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `details`
--

CREATE TABLE `details` (
  `id` bigint(20) NOT NULL,
  `montant_tranche_revenu` double DEFAULT NULL,
  `pourcentage` double DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `declarationiremploye` bigint(20) DEFAULT NULL,
  `taux_ir` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` bigint(20) NOT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `salaire` double DEFAULT NULL,
  `societe_emp` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `cin`, `nom`, `prenom`, `salaire`, `societe_emp`) VALUES
(72, 'F78785', 'dukali', 'aziz', 9000, 10),
(71, 'F7819785', 'snik', 'aziz', 5000, 7),
(70, 'F7800785', 'ramzi', 'abdeljalil', 3, 7),
(69, 'F7800985', 'rami', 'abdellah', 7000, 7),
(68, 'FF00985', 'bertaouch', 'ayoub', 67000, 9),
(67, 'FF00785', 'Shita', 'Youness', 65000, 9),
(66, 'FF30785', 'ben', 'Badr', 65000, 9),
(65, 'FF37785', 'dali', 'keltoum', 4000, 9),
(64, 'FF97785', 'Reda', 'Razi', 20000, 9),
(63, 'FF99785', 'msika', 'Achraf', 8000, 9),
(62, 'FF09785', 'aitdari', 'salma', 8000, 9),
(61, 'FF489785', 'dabachi', 'ayoub', 10000, 9),
(59, 'EF48985', 'lkhder', 'oussama', 200, 7),
(60, 'EF489785', 'lkhder', 'Asmae', 3500, 7),
(56, 'EE7895', 'BENKHAZRA', 'Mohammed', 3500, 7),
(73, 'RF78785', 'dukali', 'marwa', 9000, 10),
(74, 'RF878785', 'azir', 'marwa', 9000, 10),
(75, 'RF7870085', 'ldari', 'marwa', 10000, 11),
(76, 'RF781085', 'adri', 'ibtissam', 10000, 11),
(337, 'AA9999', 'titoos', 'rachid', 15000, 7),
(93, 'E0000', 'JDID', 'JDIDA', 2030, 7),
(105, 'fgjh', 'qsdf', 'azer', 2300, 7),
(110, 'hhh555', 'chlibidich', 'gsdg', 9000, 7);

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

CREATE TABLE `etape` (
  `id` bigint(20) NOT NULL,
  `delai` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `montantcomptable` double NOT NULL,
  `montantfix` double NOT NULL,
  `type_operation` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etat_declaration`
--

CREATE TABLE `etat_declaration` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_declaration`
--

INSERT INTO `etat_declaration` (`id`, `libelle`, `ref`) VALUES
(100, 'valider', 'etat1'),
(101, 'brouillon', 'etat2'),
(453, 'Valider', 'Valider');

-- --------------------------------------------------------

--
-- Structure de la table `etat_demande`
--

CREATE TABLE `etat_demande` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `couleur` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_demande`
--

INSERT INTO `etat_demande` (`id`, `libelle`, `ref`, `couleur`) VALUES
(359, 'traitée', 'e1', '#0000ff'),
(360, 'en cours de traitement', 'e2', '#5499C7'),
(361, 'rejetée', 'e3', '#ff0000'),
(362, 'acceptée', 'e4', '#00ff00'),
(363, 'en attente de réponse', 'e5', '#8E44AD'),
(358, 'Initialisée par société', 'e0', '#C99E2F'),
(364, 'traitement finale', 'e6', '#138D75'),
(365, 'brouillant comptable traitent', 'e7', '#C0392B'),
(366, 'Brouillant comptable validateur', 'e8', '#943126'),
(367, 'Validation finale ', 'e9', '#27AE60');

-- --------------------------------------------------------

--
-- Structure de la table `etat_facture`
--

CREATE TABLE `etat_facture` (
  `id` bigint(20) NOT NULL,
  `code` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_facture`
--

INSERT INTO `etat_facture` (`id`, `code`, `libelle`) VALUES
(103, 1, 'Initialisé par société'),
(104, 2, 'Controlé'),
(105, 3, 'Validé');

-- --------------------------------------------------------

--
-- Structure de la table `etat_operation_societe`
--

CREATE TABLE `etat_operation_societe` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etat_paiement`
--

CREATE TABLE `etat_paiement` (
  `id` bigint(20) NOT NULL,
  `code` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_paiement`
--

INSERT INTO `etat_paiement` (`id`, `code`, `libelle`) VALUES
(106, 1, 'payée'),
(107, 2, 'partiellement payée'),
(108, 3, 'non payée');

-- --------------------------------------------------------

--
-- Structure de la table `etat_societe`
--

CREATE TABLE `etat_societe` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat_societe`
--

INSERT INTO `etat_societe` (`id`, `libelle`, `ref`) VALUES
(1, 'etat1', 'ref1'),
(2, 'etat2', 'ref2');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id` bigint(20) NOT NULL,
  `annee` double NOT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `date_operation` datetime DEFAULT NULL,
  `debit` varchar(255) DEFAULT NULL,
  `mois` double NOT NULL,
  `montant_hors_taxe` double NOT NULL,
  `montantttc` double NOT NULL,
  `montanttva` double NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `trim` double NOT NULL,
  `compte_comptable` bigint(20) DEFAULT NULL,
  `declarationir` bigint(20) DEFAULT NULL,
  `declarationis` bigint(20) DEFAULT NULL,
  `declaration_tva` bigint(20) DEFAULT NULL,
  `demande` bigint(20) DEFAULT NULL,
  `etat_facture` bigint(20) DEFAULT NULL,
  `etat_paiement` bigint(20) DEFAULT NULL,
  `societe_distination` bigint(20) DEFAULT NULL,
  `societe_source` bigint(20) DEFAULT NULL,
  `tva` bigint(20) DEFAULT NULL,
  `type_operation` bigint(20) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `fichier_nom` varchar(255) DEFAULT NULL,
  `classe_comptable` bigint(20) DEFAULT NULL,
  `facture_piece_jointe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id`, `annee`, `credit`, `date_operation`, `debit`, `mois`, `montant_hors_taxe`, `montantttc`, `montanttva`, `ref`, `trim`, `compte_comptable`, `declarationir`, `declarationis`, `declaration_tva`, `demande`, `etat_facture`, `etat_paiement`, `societe_distination`, `societe_source`, `tva`, `type_operation`, `libelle`, `fichier_nom`, `classe_comptable`, `facture_piece_jointe`) VALUES
(264, 2021, '2713.52 DH', '2021-09-11 00:00:00', '-', 9, 2536, 2713.52, 177.52, 'jgbzjdvdnf', 3, NULL, NULL, NULL, NULL, 263, NULL, NULL, 8, 7, 102, 1, 'jgbzjdvdnf', NULL, NULL, 265),
(259, 2021, '-', '2021-09-08 00:00:00', '268.8 DH', 9, 256, 268.8, 12.8, 'vvvvvvvvvvvv', 3, NULL, NULL, NULL, NULL, 250, 103, 106, 8, 7, 101, 2, 'vvvvvvvvvvvv', '1631646850519.PNG', NULL, 260),
(261, 2021, '-', '2021-09-08 00:00:00', '2713.52 DH', 9, 2536, 2713.52, 177.52, 'mmmmmmmmm', 3, 4, NULL, NULL, NULL, 250, 104, 107, 8, 7, 102, 2, 'mmmmmmmmm', '1631647018529.PNG', 1, 262),
(267, 2021, '2612.08 DH', '2021-09-22 00:00:00', '-', 9, 2536, 2612.08, 76.08, 'ggggggagaggag', 3, NULL, NULL, NULL, NULL, 266, NULL, NULL, 7, 9, 100, 1, 'ggggggagaggag', NULL, NULL, 269),
(268, 2021, '2713.52 DH', '2021-09-08 00:00:00', '-', 9, 2536, 2713.52, 177.52, 'bgnhf', 3, NULL, NULL, NULL, NULL, 266, NULL, NULL, 7, 9, 102, 1, 'ghgjf', NULL, NULL, 270),
(274, 2021, '260.59 DH', '2021-12-13 00:00:00', '-', 12, 253, 260.59, 7.59, 'dmd-TVA', 4, NULL, NULL, NULL, NULL, 273, NULL, NULL, 8, 7, 100, 1, 'dmd-TVA', NULL, NULL, 277),
(275, 2021, '-', '2021-12-07 00:00:00', '1.05 DH', 12, 1, 1.07, 0.07, 'facture-1', 4, NULL, NULL, NULL, NULL, 273, NULL, NULL, 8, 7, 102, 2, 'facture-1', NULL, NULL, 276),
(281, 2021, '-', '2021-12-17 00:00:00', '2662.8 DH', 12, 2536, 2662.8, 126.8, 'tttttcva', 4, NULL, NULL, NULL, NULL, 273, 104, 107, 8, 7, 101, 2, 'zxcvbn', NULL, 1, 282),
(287, 2021, '271378.75 DH', '2021-08-12 00:00:00', '-', 8, 253625, 271378.75, 17753.75, 'fa', 3, NULL, NULL, NULL, NULL, 286, NULL, NULL, 8, 7, 102, 1, 'fa', NULL, NULL, 288),
(290, 2022, '273.92 DH', '2022-01-14 00:00:00', '-', 1, 256, 273.92, 17.92, 'iss', 1, NULL, NULL, NULL, NULL, 289, NULL, NULL, 8, 7, 102, 1, 'iss', NULL, NULL, 291),
(293, 2022, '-', '2022-02-18 00:00:00', '2713.52 DH', 2, 2536, 2713.52, 177.52, 'zxcvbnm', 1, NULL, NULL, NULL, NULL, 292, NULL, NULL, 8, 7, 102, 2, 'zxcvbnm', NULL, NULL, 294);

-- --------------------------------------------------------

--
-- Structure de la table `facture_piece_jointe`
--

CREATE TABLE `facture_piece_jointe` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `contenu` tinyblob DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `facture` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture_piece_jointe`
--

INSERT INTO `facture_piece_jointe` (`id`, `name`, `path`, `contenu`, `size`, `type`, `facture`) VALUES
(270, '1631876822952.PNG', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1631876822952.PNG', NULL, NULL, NULL, NULL),
(269, '1631876822952.PNG', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1631876822952.PNG', NULL, NULL, NULL, NULL),
(265, '1631649108216.PNG', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1631649108216.PNG', NULL, NULL, NULL, NULL),
(260, '1631646850519.PNG', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1631646850519.PNG', NULL, NULL, NULL, NULL),
(262, '1631647018529.PNG', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1631647018529.PNG', NULL, NULL, NULL, NULL),
(276, '1640888901580.csv', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1640888901580.csv', NULL, NULL, NULL, NULL),
(277, '1640888903647.csv', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1640888903647.csv', NULL, NULL, NULL, NULL),
(282, '1640889876831.csv', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1640889876831.csv', NULL, NULL, NULL, NULL),
(288, '1641140807296.csv', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1641140807296.csv', NULL, NULL, NULL, NULL),
(291, '1641142129584.csv', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1641142129584.csv', NULL, NULL, NULL, NULL),
(294, '1644482334515.pdf', 'C:\\Users\\LEILA\\facture-pieces-jointes\\1644482334515.pdf', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(295),
(295),
(455);

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `operation_societe`
--

CREATE TABLE `operation_societe` (
  `id` bigint(20) NOT NULL,
  `date_operation_societe` datetime DEFAULT NULL,
  `fraix_comptable` double NOT NULL,
  `fraix_fix` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `comptable_taiteur` bigint(20) DEFAULT NULL,
  `comptable_validateur` bigint(20) DEFAULT NULL,
  `etat_operation_societe` bigint(20) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL,
  `type_operation` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `operation_societe_justif`
--

CREATE TABLE `operation_societe_justif` (
  `id` bigint(20) NOT NULL,
  `chemin` varchar(255) DEFAULT NULL,
  `date_justif` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `operation_societe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `id` bigint(20) NOT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `montant` double NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `operation_societe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `paiement2`
--

CREATE TABLE `paiement2` (
  `id` bigint(20) NOT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `montant_cpt_traiteur` double DEFAULT NULL,
  `montant_cpt_validateur` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `reste` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `type_tva` double NOT NULL,
  `declarationir` bigint(20) DEFAULT NULL,
  `declarationis` bigint(20) DEFAULT NULL,
  `declaration_tva` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `paiement2`
--

INSERT INTO `paiement2` (`id`, `date_paiement`, `montant_cpt_traiteur`, `montant_cpt_validateur`, `ref`, `reste`, `total`, `type_tva`, `declarationir`, `declarationis`, `declaration_tva`) VALUES
(449, '2020-04-11 00:00:00', 20, 10, 'paiement1', 120, 150, 0, NULL, 389, NULL),
(450, '2020-05-05 00:00:00', 100, 200, 'p2', 200, 500, 0, NULL, 446, NULL),
(454, '2020-06-06 00:00:00', 44, 45, 'WW', 111, 200, 1, NULL, NULL, 448);

-- --------------------------------------------------------

--
-- Structure de la table `paiementis`
--

CREATE TABLE `paiementis` (
  `id` bigint(20) NOT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `montant_cpt_traiteur` double DEFAULT NULL,
  `montant_cpt_validateur` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `reste` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `declarationis` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `paiementis`
--

INSERT INTO `paiementis` (`id`, `date_paiement`, `montant_cpt_traiteur`, `montant_cpt_validateur`, `ref`, `reste`, `total`, `declarationis`) VALUES
(407, '2020-09-11 00:00:00', 300, 100, 'string', 600, 1000, 406),
(408, '2021-09-23 00:00:00', 500, 200, 'p2', 1300, 2000, 384);

-- --------------------------------------------------------

--
-- Structure de la table `piece_joint_societe`
--

CREATE TABLE `piece_joint_societe` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `piece_joint_societe`
--

INSERT INTO `piece_joint_societe` (`id`, `description`, `name`, `path`, `societe`) VALUES
(57, NULL, '1631789993145.java', 'C:\\Users\\HPELITEBOOK\\societe-pieces-jointes\\1631789993145.java', 55),
(64, 'rtyuio', 'lkjio', 'C:\\Users\\HPELITEBOOK\\societe-pieces-jointes\\1631790717774.java', 62);

-- --------------------------------------------------------

--
-- Structure de la table `president_societe`
--

CREATE TABLE `president_societe` (
  `id` bigint(20) NOT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `president_societe`
--

INSERT INTO `president_societe` (`id`, `cin`, `email`, `nom`, `prenom`, `telephone`) VALUES
(66, 'Fatima ezzahra ZAIZI', 'fatmazahrazaizi@gmail.com', 'ZAIZI', 'Fatima', 618084906),
(65, 'Fatima ezzahra ZAIZI', 'fatmazahrazaizi@gmail.com', 'ZAIZI', 'Fatima', 618084906),
(67, 'Fatima ezzahra ZAIZI', 'fatmazahrazaizi@gmail.com', 'ZAIZI', 'Fatima', 618084906),
(61, 'FatihrZI', 'fatmazahrazaizi@gmail.com', 'ZAIZI', 'Fatima', 618084906),
(58, 'FIZI', 'fatmazahrazaizi@gmail.com', 'ZAIZI', 'Fatima', 618084906),
(54, 'Fatifd ZAIZI', 'fatmazahrazaizi@gmail.com', 'ZAIZI', 'Fatima', 618084906);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(4, 'ROLE_SOCIETE'),
(5, 'ROLE_COMPTABLE'),
(6, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE `societe` (
  `id` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `age` double DEFAULT NULL,
  `annee_exploitation` int(11) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `ice` varchar(255) DEFAULT NULL,
  `nom_societe` varchar(255) DEFAULT NULL,
  `raison_sociale` varchar(255) DEFAULT NULL,
  `comptable` bigint(20) DEFAULT NULL,
  `etat_societe` bigint(20) DEFAULT NULL,
  `capital_sociale` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `raison_sociale_socondaire` varchar(255) DEFAULT NULL,
  `president_societe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `societe`
--

INSERT INTO `societe` (`id`, `adresse`, `age`, `annee_exploitation`, `date_creation`, `ice`, `nom_societe`, `raison_sociale`, `comptable`, `etat_societe`, `capital_sociale`, `description`, `raison_sociale_socondaire`, `president_societe`) VALUES
(7, 'USA', 10, 0, '2021-04-15 22:07:19', '2', 'societe', 'google', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'england', 6, 0, '2020-11-11 22:08:05', '3', 'societe1', 'microsoft', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'usa', 15, 0, '2021-04-20 22:08:35', '4', 'societe2', 'facebook', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'france', 30, 0, '2021-04-24 22:08:39', '5', 'societe3', 'airbus', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'france', 12, 0, '2021-04-13 22:08:55', '6', 'societe4', 'michlon', NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'casablanca', 20, 0, '2000-12-13 00:00:00', '7', 'societe5', 'safron', NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'Marrakech', 19, 0, '2000-12-13 00:00:00', '8', 'societe6', 'MenaraPrefa', NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'BERRADI 3 N°512', 0, 0, '2021-06-28 00:00:00', '1425', NULL, 'vrhdjabgljks', NULL, NULL, NULL, NULL, NULL, NULL),
(74, NULL, NULL, 0, NULL, '586', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'jjbjbjkhjkn', 7, 0, '2014-01-16 00:00:00', '3658', NULL, 'gvhhb', NULL, NULL, NULL, NULL, NULL, NULL),
(272, 'BERRADI 3 N°512', 14, 0, '2007-06-11 00:00:00', '253697', NULL, '3256', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sous_classe_comptable`
--

CREATE TABLE `sous_classe_comptable` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `classe_comptable` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sous_classe_comptable`
--

INSERT INTO `sous_classe_comptable` (`id`, `libelle`, `numero`, `classe_comptable`) VALUES
(11, 'CAPITAUX PROPRES', 11, 1),
(13, 'CAPITAUX PROPRES ASSIMILES', 13, 1),
(14, 'DETTES DE FINANCEMENT', 14, 1),
(15, 'PROVISIONS DURABLES POUR RISQUES ET CHARGES', 15, 1),
(16, 'COMPTES DE LIAISON DES ETABLISSEMENTS ET SUCCURSALES', 16, 1),
(17, 'ECARTS DE CONVERSION - PASSIF', 17, 1),
(21, 'IMMOBILISATIONS EN NON-VALEURS', 21, 2),
(22, 'IMMOBILISATIONS INCORPORELLES', 22, 2),
(23, 'IMMOBILISATIONS CORPORELLES', 23, 2),
(24, 'IMMOBILSATIONS FINANCIERES', 24, 2),
(25, 'IMMOBILSATIONS FINANCIERES', 25, 2),
(27, 'ECARTS DE CONVERSION - ACTIF', 27, 2),
(28, 'AMORTISSEMENTS DES IMMOBILISATIONS', 28, 2),
(29, 'PROVISIONS POUR DEPRECIATION DES IMMOBILISATIONS', 29, 2),
(31, 'STOCKS', 31, 3),
(34, 'CREANCES DE L\'ACTIF CIRCULANT', 34, 3),
(35, 'TITRES ET VALEURS DE PLACEMENT', 35, 3),
(37, 'ECART DE CONVERSION - ACTIF (ELÉMENTS CIRCULANTS)', 37, 3),
(39, 'PROVISIONS POUR DEPRECIATION DES COMPTES DE L\'ACTIF CIRCULANT', 39, 3),
(44, 'DETTES DU PASSIF CIRCULANT', 44, 4),
(45, 'AUTRES PROVISIONS POUR RISQUES ET CHARGES', 45, 4),
(47, 'ECARTS DE CONVERSION - PASSIF (ELÉMENTS CIRCULANTS)', 47, 4),
(51, 'TRESORERIE - ACTIF', 51, 5),
(55, 'TRESORERIE - PASSIF', 55, 5),
(59, 'PROVISIONS POUR DEPRECIATION DES COMPTES DE TRESORERIE', 59, 5),
(61, 'CHARGES D’EXPLOITATION', 61, 6),
(63, 'CHARGES FINANCIERES', 63, 6),
(65, 'CHARGES NON COURANTES', 65, 6),
(67, 'IMPOTS SUR LES RESULTATS', 67, 6),
(71, 'PRODUITS D’EXPLOITATION', 71, 7),
(73, 'PRODUITS FINANCIERS', 73, 7),
(75, 'PRODUITS NON COURANTS', 75, 7);

-- --------------------------------------------------------

--
-- Structure de la table `tauxis`
--

CREATE TABLE `tauxis` (
  `id` bigint(20) NOT NULL,
  `penalite` double DEFAULT NULL,
  `pourcentage` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `resultat_fiscal_max` double DEFAULT NULL,
  `resultat_fiscal_min` double DEFAULT NULL,
  `taux_is_config` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tauxis`
--

INSERT INTO `tauxis` (`id`, `penalite`, `pourcentage`, `ref`, `resultat_fiscal_max`, `resultat_fiscal_min`, `taux_is_config`) VALUES
(4, 500, 10, 't1', 300000, 0, 1),
(5, 500, 20, 't2', 1000000, 300000, 1),
(6, 500, 31, 't3', NULL, 1000000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `taux_ir`
--

CREATE TABLE `taux_ir` (
  `id` bigint(20) NOT NULL,
  `pourcentage` double DEFAULT NULL,
  `salaire_max` double DEFAULT NULL,
  `salaire_min` double DEFAULT NULL,
  `taux_ir_config` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `taux_ir`
--

INSERT INTO `taux_ir` (`id`, `pourcentage`, `salaire_max`, `salaire_min`, `taux_ir_config`) VALUES
(16, 0, 2500, 0, 2),
(17, 10, 4166, 2501, 2),
(18, 20, 5000, 4167, 2),
(19, 30, 6666, 5001, 2);

-- --------------------------------------------------------

--
-- Structure de la table `taux_ir_config`
--

CREATE TABLE `taux_ir_config` (
  `id` bigint(20) NOT NULL,
  `cotisation_minimale` double DEFAULT NULL,
  `date_max` datetime DEFAULT NULL,
  `date_min` datetime DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `taux_ir_config`
--

INSERT INTO `taux_ir_config` (`id`, `cotisation_minimale`, `date_max`, `date_min`, `ref`) VALUES
(2, 3000, '2022-12-01 00:00:00', '2016-01-01 00:00:00', 'ir1'),
(1, 2500, '2022-12-01 00:00:00', '2016-01-01 00:00:00', 'ir2');

-- --------------------------------------------------------

--
-- Structure de la table `taux_is_config`
--

CREATE TABLE `taux_is_config` (
  `id` bigint(20) NOT NULL,
  `cotisation_minimale` double DEFAULT NULL,
  `date_max` datetime DEFAULT NULL,
  `date_min` datetime DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `annee_max` int(11) DEFAULT NULL,
  `annee_min` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `taux_is_config`
--

INSERT INTO `taux_is_config` (`id`, `cotisation_minimale`, `date_max`, `date_min`, `ref`, `annee_max`, `annee_min`) VALUES
(1, 3000, '2022-12-01 19:55:32', '2017-12-01 19:55:32', 'cm1', NULL, NULL),
(2, 1500, '2017-12-31 19:55:32', '2015-01-01 19:55:32', 'cm2', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

CREATE TABLE `tva` (
  `id` bigint(20) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `valeur` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tva`
--

INSERT INTO `tva` (`id`, `ref`, `valeur`, `libelle`) VALUES
(100, 'TVA1', 3, NULL),
(101, 'TVA2', 5, NULL),
(102, 'TVA3', 7, NULL),
(103, 'TVA4', 20, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `type_declaration_tva`
--

CREATE TABLE `type_declaration_tva` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_declaration_tva`
--

INSERT INTO `type_declaration_tva` (`id`, `libelle`, `ref`) VALUES
(13, 'trimestrielle', 'TDTV1'),
(14, 'mensuelle', 'TDTV2');

-- --------------------------------------------------------

--
-- Structure de la table `type_operation`
--

CREATE TABLE `type_operation` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fraixcomptabletotal` double NOT NULL,
  `fraixfixtotal` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_operation_facture`
--

CREATE TABLE `type_operation_facture` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `type_operation_societe` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_operation_facture`
--

INSERT INTO `type_operation_facture` (`id`, `libelle`, `type_operation_societe`) VALUES
(1, 'CREDIT', 'ACHAT'),
(2, 'DEBIT', 'VENTE');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `comptable` bigint(20) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `username`, `comptable`, `societe`) VALUES
(1, 'admin@gmail.com', '$2a$10$lo8LF4pAnp3ummEgCRggxuP9a66.jjO82a8bBIlCi5nAH.rgQEmzu', 'admin', NULL, NULL),
(2, 'societe@gmail.com', '$2a$10$SKsbz8k2ZFv303rrfHZfbu2Zzs3hHMKfQ/m.7lj.aM2rMKMy43b.S', 'societe', NULL, 7),
(3, 'comptable@gmail.com', '$2a$10$fOGkPJm0J9aZOFM9s5ZbvObKW/XkE0ZAmCNiEPjq/l7KuNSAkM4e6', 'comptable', 1, NULL),
(4, 'comptable2@gmail.com', '$2a$10$9CS0ujIauY.TdJpwZ3Y6QeK/aP7RUPZQ20wXsx7doXlv9dbRYnA4q', 'comptable2', 2, NULL),
(5, 'comptable3@gmail.com', '$2a$10$7tT.4L0VagCsyPTC.wowvO7T0fiNx5W67Xhz37U56f78C8/SxaPb6', 'comptable3', 3, NULL),
(6, 'comptable4@gmail.com', '$2a$10$djRFylgVZF8wFSvAhGfSg.Q7LorWYFiktuoxjSIM/YYzgwIgRDZzS', 'comptable4', 4, NULL),
(7, 'comptable5@gmail.com', '$2a$10$gSXR7WsPi7YKX.Zyu.jsC.sZ/GH711a7bY30OTXQuFBhZonhwgpoC', 'comptable5', 5, NULL),
(8, 'comptable6@gmail.com', '$2a$10$4rdeV6ua//2sN2OOVkpNX.Dkg7Ws.mlv8GbHRGTa3LaXWT2DVK8Hy', 'comptable6', 6, NULL),
(9, 'societe2@gmail.com', '$2a$10$T2VkAWBUMV48/Cu0KyOSG.wc5irdkJ/.Psz/w5XlSoxLUS9k9IIGG', 'societe2', NULL, 9),
(10, 'societe3@gmail.com', '$2a$10$BM9iJFQXY0D3tLrXHWMhVuMOaWuTqFe2x2HrCxuIzHTbgBSqJWBfC', 'societe3', NULL, 10),
(11, 'jasmine@gmail.com', '$2a$10$B6g5wRi1SE7n4oFBE4y9muHdAAsZaTbcl7r.w6npCMOtYOcgg3BzC', 'jasmine', NULL, NULL),
(13, 'fatimazahrazaizi@gmail.com', '$2a$10$.38YCpr2wdmnT2lJw4fYIOdxUl4iZCBO3gnMQdEi1PQ02Zy3HofOi', 'zaizi', NULL, NULL),
(14, 's.x@gmail.com', '$2a$10$qG65TYTALnz0bD/gH2j1EOV/p7pk28m3JWOXF7DtAmM3zS2tdc2mi', 'societeX', NULL, NULL),
(15, 'ssssssss@gmail.com', '$2a$10$hTIqR96rQizNLh5ytAlm8.P2ObBnUDQvZFoGYQJKdGdfr07Uksydu', 'ssssssss', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 6),
(2, 4),
(3, 5),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 4),
(10, 4),
(11, 6),
(12, 4),
(13, 4),
(14, 4),
(15, 4);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acomptes`
--
ALTER TABLE `acomptes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK87o6lmoqas0appjnit75dryo8` (`societe`);

--
-- Index pour la table `categorie_service`
--
ALTER TABLE `categorie_service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classe_comptable`
--
ALTER TABLE `classe_comptable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `compte_comptable`
--
ALTER TABLE `compte_comptable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKajf6wdmvrh66jg39vg1aryt4m` (`sous_classe_comptable`);

--
-- Index pour la table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlfhr11nhro69n4e5bld37676v` (`societe_login`);

--
-- Index pour la table `cpc`
--
ALTER TABLE `cpc`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cpc_facture`
--
ALTER TABLE `cpc_facture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa2y9vg9at9folrxbw0nn19s1t` (`cpc`),
  ADD KEY `FKslhf32qlpslffyy4u3bi8ol9e` (`facture`);

--
-- Index pour la table `create_societe_page`
--
ALTER TABLE `create_societe_page`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `declarationir`
--
ALTER TABLE `declarationir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKexcs28w0o81k0brx25ryqnew5` (`societe`);

--
-- Index pour la table `declarationiremploye`
--
ALTER TABLE `declarationiremploye`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9fi3ikjrqlp51k5b4frxl1lb5` (`declarationir`),
  ADD KEY `FKp4c78i82c7ufslwte6bgy8nwt` (`employe`),
  ADD KEY `FKmgl7m92v5oyrt2fo41jmeu9yg` (`taux_ir`);

--
-- Index pour la table `declarationis`
--
ALTER TABLE `declarationis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhrgj9wu6hrtdtm2pe9ilw9b7j` (`etat_declaration`),
  ADD KEY `FKs9d8lt5i9bcq2x98muj6cjw65` (`societe`),
  ADD KEY `FK8ebtmtwn5b3q4qcvnafsyrbcl` (`tauxis`),
  ADD KEY `FK9faw3kaqntoarvd1rtrgjuogt` (`taux_is_config`);

--
-- Index pour la table `declaration_tva`
--
ALTER TABLE `declaration_tva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9jik3v4e0359rq2j1r9ek2te3` (`etat_declaration`),
  ADD KEY `FKgwbagwpqe8jdr7jtjbks2ybcm` (`societe`),
  ADD KEY `FKhib9p3529ikvttics1k7pdmpe` (`type_declaration_tva`);

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK35tpacyr3ixcrt2grr552e9h` (`comptable_traiteur`),
  ADD KEY `FK7708r9d41kh7567t5pjj8fsd` (`comptable_validateur`),
  ADD KEY `FKitfwi36k9h4k8eleltehhh68n` (`etat_demande`),
  ADD KEY `FKn083x4c13po4b1yrut10j0p57` (`societe`);

--
-- Index pour la table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKludujo525y38yicgvacbrisni` (`declarationiremploye`),
  ADD KEY `FKo248o3y4fdvla3nqktjdj25qg` (`taux_ir`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpn7yd0yepktcu4mhb72rip3t6` (`societe_emp`);

--
-- Index pour la table `etape`
--
ALTER TABLE `etape`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcuegv6uhoe1tkuopignyeddjy` (`type_operation`);

--
-- Index pour la table `etat_declaration`
--
ALTER TABLE `etat_declaration`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat_demande`
--
ALTER TABLE `etat_demande`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat_facture`
--
ALTER TABLE `etat_facture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat_operation_societe`
--
ALTER TABLE `etat_operation_societe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat_paiement`
--
ALTER TABLE `etat_paiement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat_societe`
--
ALTER TABLE `etat_societe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk0dr0i62svcoj2ba1wldr2qtb` (`classe_comptable`),
  ADD KEY `FKid737ux65gsmpy3ewqol1vua2` (`compte_comptable`),
  ADD KEY `FK1vhjtkljul7u7sgqnf832qaru` (`declarationir`),
  ADD KEY `FKsjjtqw76htgw0f6xwlwc5bxt6` (`declarationis`),
  ADD KEY `FKsburti4kj44462x058oi43eae` (`declaration_tva`),
  ADD KEY `FK96tbkpnhc0fs6ic6vh7440asj` (`demande`),
  ADD KEY `FKkr3ksts74gennv8v3sftugtj8` (`etat_facture`),
  ADD KEY `FKjve9pyoc84dr4klbv34lvts8f` (`etat_paiement`),
  ADD KEY `FKmkxr40fqoaf2pdtelr3aoqtpi` (`facture_piece_jointe`),
  ADD KEY `FKjyarvuk8jge8frk5fuqsxaxh6` (`societe_distination`),
  ADD KEY `FKcw44mq41ieyb1ohrp1a9wtp3g` (`societe_source`),
  ADD KEY `FKnfg1mkl9rtx7sewcxlpvm91x8` (`tva`),
  ADD KEY `FKtmcyddm2pg2u8n13e2sorm22o` (`type_operation`);

--
-- Index pour la table `facture_piece_jointe`
--
ALTER TABLE `facture_piece_jointe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa48he59guotsc986svp315p6t` (`facture`);

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `operation_societe`
--
ALTER TABLE `operation_societe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8wgtlqlykqum3aosolcsmm9fr` (`comptable_taiteur`),
  ADD KEY `FKp374pje2pxaftbfbr5vhwjkrv` (`comptable_validateur`),
  ADD KEY `FK236u8q4brd0m5hfs2runxnllh` (`etat_operation_societe`),
  ADD KEY `FKh8or785pap4d7rvigp87o03pg` (`societe`),
  ADD KEY `FK1oawajdyyqiknhmeqqu719i0y` (`type_operation`);

--
-- Index pour la table `operation_societe_justif`
--
ALTER TABLE `operation_societe_justif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh7n12nvkmv27pyd4cyac6qwwt` (`operation_societe`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKo2c18i2i34e4e67bhlsaykffk` (`operation_societe`);

--
-- Index pour la table `paiement2`
--
ALTER TABLE `paiement2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKba89emfso68feaugil5uuh3j8` (`declarationir`),
  ADD KEY `FK9l1elts5bmx5y0xisq58dwerv` (`declarationis`),
  ADD KEY `FK4gap6408fj61onal2fcl81bty` (`declaration_tva`);

--
-- Index pour la table `paiementis`
--
ALTER TABLE `paiementis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdb31e66nvh7gy1jb91mi9pufh` (`declarationis`);

--
-- Index pour la table `piece_joint_societe`
--
ALTER TABLE `piece_joint_societe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjb80v3ncwgyukwxp11sbploo3` (`societe`);

--
-- Index pour la table `president_societe`
--
ALTER TABLE `president_societe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl8l2m3ml0vgfu4udg8ko2n9k4` (`comptable`),
  ADD KEY `FKd8ac7ipj4ubb260iw4p5mj274` (`etat_societe`),
  ADD KEY `FKqdmtlhrumc5xx6yu6m5qgg12w` (`president_societe`);

--
-- Index pour la table `sous_classe_comptable`
--
ALTER TABLE `sous_classe_comptable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhacjc0ryy5m37e5fb4cftpsia` (`classe_comptable`);

--
-- Index pour la table `tauxis`
--
ALTER TABLE `tauxis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4srwqmafhimh04h0ti99uysb2` (`taux_is_config`);

--
-- Index pour la table `taux_ir`
--
ALTER TABLE `taux_ir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKin6ui53dkppra0s6vvovn62qs` (`taux_ir_config`);

--
-- Index pour la table `taux_ir_config`
--
ALTER TABLE `taux_ir_config`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `taux_is_config`
--
ALTER TABLE `taux_is_config`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_declaration_tva`
--
ALTER TABLE `type_declaration_tva`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_operation`
--
ALTER TABLE `type_operation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_operation_facture`
--
ALTER TABLE `type_operation_facture`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD KEY `FKk5n9ppqkj039vd1skpxu2gxe2` (`comptable`),
  ADD KEY `FKr7m1c7k3ibysqo98lnbff5i3t` (`societe`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
