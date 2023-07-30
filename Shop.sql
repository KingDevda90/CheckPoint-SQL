-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 30 juil. 2023 à 17:39
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `Customers`
--

CREATE TABLE `Customers` (
  `Id_Customer` int(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Orders`
--

CREATE TABLE `Orders` (
  `Id_Order` int(50) NOT NULL,
  `Id_Customers` int(50) NOT NULL,
  `Id_Product` int(50) NOT NULL,
  `Quantity` int(100) NOT NULL,
  `Order_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Products`
--

CREATE TABLE `Products` (
  `Id_Product` int(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` decimal(65,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`Id_Customer`);

--
-- Index pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`Id_Order`),
  ADD KEY `Id_Customers` (`Id_Customers`),
  ADD KEY `Id_Product` (`Id_Product`);

--
-- Index pour la table `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`Id_Product`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Id_Customers`) REFERENCES `Customers` (`Id_Customer`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Id_Product`) REFERENCES `Products` (`Id_Product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
