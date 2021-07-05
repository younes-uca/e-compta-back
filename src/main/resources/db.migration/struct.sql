-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 05 juil. 2021 à 21:12
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion-comptabilite`
--

-- --------------------------------------------------------

--
-- Structure de la table `acomptes`
--

DROP TABLE IF EXISTS `acomptes`;
CREATE TABLE IF NOT EXISTS `acomptes` (
  `id` bigint(20) NOT NULL,
  `annee` double NOT NULL,
  `montant` double DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK87o6lmoqas0appjnit75dryo8` (`societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_service`
--

DROP TABLE IF EXISTS `categorie_service`;
CREATE TABLE IF NOT EXISTS `categorie_service` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lien` varchar(255) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `classe_comptable`
--

DROP TABLE IF EXISTS `classe_comptable`;
CREATE TABLE IF NOT EXISTS `classe_comptable` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

DROP TABLE IF EXISTS `comptable`;
CREATE TABLE IF NOT EXISTS `comptable` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compte_comptable`
--

DROP TABLE IF EXISTS `compte_comptable`;
CREATE TABLE IF NOT EXISTS `compte_comptable` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `sous_classe_comptable` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKajf6wdmvrh66jg39vg1aryt4m` (`sous_classe_comptable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `connection`
--

DROP TABLE IF EXISTS `connection`;
CREATE TABLE IF NOT EXISTS `connection` (
  `id` bigint(20) NOT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `societe_login` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlfhr11nhro69n4e5bld37676v` (`societe_login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cpc`
--

DROP TABLE IF EXISTS `cpc`;
CREATE TABLE IF NOT EXISTS `cpc` (
  `id` bigint(20) NOT NULL,
  `date_max_cpc` datetime DEFAULT NULL,
  `date_min_cpc` date DEFAULT NULL,
  `total_charg_ex` double NOT NULL,
  `total_charg_fin` double NOT NULL,
  `total_chargncour` double NOT NULL,
  `total_prod_ex` double NOT NULL,
  `total_prod_fin` double NOT NULL,
  `total_prodncour` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cpc_facture`
--

DROP TABLE IF EXISTS `cpc_facture`;
CREATE TABLE IF NOT EXISTS `cpc_facture` (
  `id` bigint(20) NOT NULL,
  `included` bit(1) DEFAULT NULL,
  `cpc` bigint(20) DEFAULT NULL,
  `facture` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa2y9vg9at9folrxbw0nn19s1t` (`cpc`),
  KEY `FKslhf32qlpslffyy4u3bi8ol9e` (`facture`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `declarationir`
--

DROP TABLE IF EXISTS `declarationir`;
CREATE TABLE IF NOT EXISTS `declarationir` (
  `id` bigint(20) NOT NULL,
  `annee` int(11) DEFAULT NULL,
  `mois` int(11) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKexcs28w0o81k0brx25ryqnew5` (`societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `declarationiremploye`
--

DROP TABLE IF EXISTS `declarationiremploye`;
CREATE TABLE IF NOT EXISTS `declarationiremploye` (
  `id` bigint(20) NOT NULL,
  `montantir` double DEFAULT NULL,
  `salaire_brut` double DEFAULT NULL,
  `salaire_net` double DEFAULT NULL,
  `declarationir` bigint(20) DEFAULT NULL,
  `employe` bigint(20) DEFAULT NULL,
  `taux_ir` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9fi3ikjrqlp51k5b4frxl1lb5` (`declarationir`),
  KEY `FKp4c78i82c7ufslwte6bgy8nwt` (`employe`),
  KEY `FKmgl7m92v5oyrt2fo41jmeu9yg` (`taux_ir`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `declarationis`
--

DROP TABLE IF EXISTS `declarationis`;
CREATE TABLE IF NOT EXISTS `declarationis` (
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
  `taux_is_config` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhrgj9wu6hrtdtm2pe9ilw9b7j` (`etat_declaration`),
  KEY `FKs9d8lt5i9bcq2x98muj6cjw65` (`societe`),
  KEY `FK8ebtmtwn5b3q4qcvnafsyrbcl` (`tauxis`),
  KEY `FK9faw3kaqntoarvd1rtrgjuogt` (`taux_is_config`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `declaration_tva`
--

DROP TABLE IF EXISTS `declaration_tva`;
CREATE TABLE IF NOT EXISTS `declaration_tva` (
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
  PRIMARY KEY (`id`),
  KEY `FK9jik3v4e0359rq2j1r9ek2te3` (`etat_declaration`),
  KEY `FKgwbagwpqe8jdr7jtjbks2ybcm` (`societe`),
  KEY `FKhib9p3529ikvttics1k7pdmpe` (`type_declaration_tva`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

DROP TABLE IF EXISTS `demande`;
CREATE TABLE IF NOT EXISTS `demande` (
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
  PRIMARY KEY (`id`),
  KEY `FK35tpacyr3ixcrt2grr552e9h` (`comptable_traiteur`),
  KEY `FK7708r9d41kh7567t5pjj8fsd` (`comptable_validateur`),
  KEY `FKitfwi36k9h4k8eleltehhh68n` (`etat_demande`),
  KEY `FKn083x4c13po4b1yrut10j0p57` (`societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `details`
--

DROP TABLE IF EXISTS `details`;
CREATE TABLE IF NOT EXISTS `details` (
  `id` bigint(20) NOT NULL,
  `montant_tranche_revenu` double DEFAULT NULL,
  `pourcentage` double DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `declarationiremploye` bigint(20) DEFAULT NULL,
  `taux_ir` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKludujo525y38yicgvacbrisni` (`declarationiremploye`),
  KEY `FKo248o3y4fdvla3nqktjdj25qg` (`taux_ir`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `id` bigint(20) NOT NULL,
  `cin` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `salaire` double DEFAULT NULL,
  `societe_emp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpn7yd0yepktcu4mhb72rip3t6` (`societe_emp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etape`
--

DROP TABLE IF EXISTS `etape`;
CREATE TABLE IF NOT EXISTS `etape` (
  `id` bigint(20) NOT NULL,
  `delai` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `montantcomptable` double NOT NULL,
  `montantfix` double NOT NULL,
  `type_operation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcuegv6uhoe1tkuopignyeddjy` (`type_operation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etat_declaration`
--

DROP TABLE IF EXISTS `etat_declaration`;
CREATE TABLE IF NOT EXISTS `etat_declaration` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etat_demande`
--

DROP TABLE IF EXISTS `etat_demande`;
CREATE TABLE IF NOT EXISTS `etat_demande` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etat_facture`
--

DROP TABLE IF EXISTS `etat_facture`;
CREATE TABLE IF NOT EXISTS `etat_facture` (
  `id` bigint(20) NOT NULL,
  `code` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etat_operation_societe`
--

DROP TABLE IF EXISTS `etat_operation_societe`;
CREATE TABLE IF NOT EXISTS `etat_operation_societe` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etat_paiement`
--

DROP TABLE IF EXISTS `etat_paiement`;
CREATE TABLE IF NOT EXISTS `etat_paiement` (
  `id` bigint(20) NOT NULL,
  `code` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `etat_societe`
--

DROP TABLE IF EXISTS `etat_societe`;
CREATE TABLE IF NOT EXISTS `etat_societe` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id` bigint(20) NOT NULL,
  `annee` double NOT NULL,
  `credit` varchar(255) DEFAULT NULL,
  `date_operation` datetime DEFAULT NULL,
  `debit` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `mois` double NOT NULL,
  `montant_hors_taxe` double NOT NULL,
  `montantttc` double NOT NULL,
  `montanttva` double NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `trim` double NOT NULL,
  `type_operation` varchar(255) DEFAULT NULL,
  `compte_comptable` bigint(20) DEFAULT NULL,
  `declarationir` bigint(20) DEFAULT NULL,
  `declarationis` bigint(20) DEFAULT NULL,
  `declaration_tva` bigint(20) DEFAULT NULL,
  `etat_facture` bigint(20) DEFAULT NULL,
  `etat_paiement` bigint(20) DEFAULT NULL,
  `societe_distination` bigint(20) DEFAULT NULL,
  `societe_source` bigint(20) DEFAULT NULL,
  `tva` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKid737ux65gsmpy3ewqol1vua2` (`compte_comptable`),
  KEY `FK1vhjtkljul7u7sgqnf832qaru` (`declarationir`),
  KEY `FKsjjtqw76htgw0f6xwlwc5bxt6` (`declarationis`),
  KEY `FKsburti4kj44462x058oi43eae` (`declaration_tva`),
  KEY `FKkr3ksts74gennv8v3sftugtj8` (`etat_facture`),
  KEY `FKjve9pyoc84dr4klbv34lvts8f` (`etat_paiement`),
  KEY `FKjyarvuk8jge8frk5fuqsxaxh6` (`societe_distination`),
  KEY `FKcw44mq41ieyb1ohrp1a9wtp3g` (`societe_source`),
  KEY `FKnfg1mkl9rtx7sewcxlpvm91x8` (`tva`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `operation_societe`
--

DROP TABLE IF EXISTS `operation_societe`;
CREATE TABLE IF NOT EXISTS `operation_societe` (
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
  `type_operation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8wgtlqlykqum3aosolcsmm9fr` (`comptable_taiteur`),
  KEY `FKp374pje2pxaftbfbr5vhwjkrv` (`comptable_validateur`),
  KEY `FK236u8q4brd0m5hfs2runxnllh` (`etat_operation_societe`),
  KEY `FKh8or785pap4d7rvigp87o03pg` (`societe`),
  KEY `FK1oawajdyyqiknhmeqqu719i0y` (`type_operation`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `operation_societe_justif`
--

DROP TABLE IF EXISTS `operation_societe_justif`;
CREATE TABLE IF NOT EXISTS `operation_societe_justif` (
  `id` bigint(20) NOT NULL,
  `chemin` varchar(255) DEFAULT NULL,
  `date_justif` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `operation_societe` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh7n12nvkmv27pyd4cyac6qwwt` (`operation_societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` bigint(20) NOT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `montant` double NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `operation_societe` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo2c18i2i34e4e67bhlsaykffk` (`operation_societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `paiement2`
--

DROP TABLE IF EXISTS `paiement2`;
CREATE TABLE IF NOT EXISTS `paiement2` (
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
  `declaration_tva` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKba89emfso68feaugil5uuh3j8` (`declarationir`),
  KEY `FK9l1elts5bmx5y0xisq58dwerv` (`declarationis`),
  KEY `FK4gap6408fj61onal2fcl81bty` (`declaration_tva`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `paiementis`
--

DROP TABLE IF EXISTS `paiementis`;
CREATE TABLE IF NOT EXISTS `paiementis` (
  `id` bigint(20) NOT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `montant_cpt_traiteur` double DEFAULT NULL,
  `montant_cpt_validateur` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `reste` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `declarationis` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdb31e66nvh7gy1jb91mi9pufh` (`declarationis`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

DROP TABLE IF EXISTS `societe`;
CREATE TABLE IF NOT EXISTS `societe` (
  `id` bigint(20) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `age` double DEFAULT NULL,
  `annee_exploitation` int(11) NOT NULL,
  `date_creation` datetime DEFAULT NULL,
  `ice` varchar(255) DEFAULT NULL,
  `raison_sociale` varchar(255) DEFAULT NULL,
  `comptable` bigint(20) DEFAULT NULL,
  `etat_societe` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl8l2m3ml0vgfu4udg8ko2n9k4` (`comptable`),
  KEY `FKd8ac7ipj4ubb260iw4p5mj274` (`etat_societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sous_classe_comptable`
--

DROP TABLE IF EXISTS `sous_classe_comptable`;
CREATE TABLE IF NOT EXISTS `sous_classe_comptable` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` int(11) NOT NULL,
  `classe_comptable` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhacjc0ryy5m37e5fb4cftpsia` (`classe_comptable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tauxis`
--

DROP TABLE IF EXISTS `tauxis`;
CREATE TABLE IF NOT EXISTS `tauxis` (
  `id` bigint(20) NOT NULL,
  `penalite` double DEFAULT NULL,
  `pourcentage` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `resultat_fiscal_max` double DEFAULT NULL,
  `resultat_fiscal_min` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `taux_ir`
--

DROP TABLE IF EXISTS `taux_ir`;
CREATE TABLE IF NOT EXISTS `taux_ir` (
  `id` bigint(20) NOT NULL,
  `pourcentage` double DEFAULT NULL,
  `salaire_max` double DEFAULT NULL,
  `salaire_min` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `taux_is_config`
--

DROP TABLE IF EXISTS `taux_is_config`;
CREATE TABLE IF NOT EXISTS `taux_is_config` (
  `id` bigint(20) NOT NULL,
  `annee_max` int(11) DEFAULT NULL,
  `annee_min` int(11) DEFAULT NULL,
  `cotisation_minimale` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tva`
--

DROP TABLE IF EXISTS `tva`;
CREATE TABLE IF NOT EXISTS `tva` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `valeur` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_declaration_tva`
--

DROP TABLE IF EXISTS `type_declaration_tva`;
CREATE TABLE IF NOT EXISTS `type_declaration_tva` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_operation`
--

DROP TABLE IF EXISTS `type_operation`;
CREATE TABLE IF NOT EXISTS `type_operation` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fraixcomptabletotal` double NOT NULL,
  `fraixfixtotal` double NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `comptable` bigint(20) DEFAULT NULL,
  `societe` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  KEY `FKk5n9ppqkj039vd1skpxu2gxe2` (`comptable`),
  KEY `FKr7m1c7k3ibysqo98lnbff5i3t` (`societe`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
