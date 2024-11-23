-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 23 2024 г., 17:40
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Tbase`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Behavitor`
--

CREATE TABLE `Behavitor` (
  `Id` int NOT NULL,
  `User_id` int NOT NULL,
  `Average_income` int NOT NULL,
  `Average_Expense` int NOT NULL,
  `Risk_Score` int NOT NULL,
  `Last_Update` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Category`
--

CREATE TABLE `Category` (
  `Id` int NOT NULL,
  `Name` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Credit_Analysis`
--

CREATE TABLE `Credit_Analysis` (
  `Id` int NOT NULL,
  `User_id` int NOT NULL,
  `Total_debt` int NOT NULL,
  `Monthly_Payment` int NOT NULL,
  `Credit_Score` int NOT NULL,
  `Last_Update` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Credit_Recomend`
--

CREATE TABLE `Credit_Recomend` (
  `Id` int NOT NULL,
  `User_id` int NOT NULL,
  `Recommendation` text COLLATE utf8mb4_general_ci NOT NULL,
  `Offers_id` int DEFAULT NULL,
  `Priority` int NOT NULL,
  `Date_create` date NOT NULL,
  `Used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Debt_Recommend`
--

CREATE TABLE `Debt_Recommend` (
  `Id` int NOT NULL,
  `User_id` int NOT NULL,
  `Recommendation_text` text COLLATE utf8mb4_general_ci NOT NULL,
  `Priority` int NOT NULL,
  `Offers_id` int DEFAULT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Goals`
--

CREATE TABLE `Goals` (
  `Id` int NOT NULL,
  `User_id` int NOT NULL,
  `Name` int NOT NULL,
  `Target_Amount` int DEFAULT NULL,
  `Save_Amount` int DEFAULT NULL,
  `Status` tinyint(1) NOT NULL,
  `Deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Offers`
--

CREATE TABLE `Offers` (
  `Id` int NOT NULL,
  `User_id` int NOT NULL,
  `Name` text COLLATE utf8mb4_general_ci NOT NULL,
  `Description` text COLLATE utf8mb4_general_ci NOT NULL,
  `Conditions` json NOT NULL,
  `Paratner_Shares_Id` int NOT NULL,
  `Category_id` int NOT NULL,
  `Used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Paratner_Shares`
--

CREATE TABLE `Paratner_Shares` (
  `Id` int NOT NULL,
  `Name` int NOT NULL,
  `Category_id` int NOT NULL,
  `Repeatability` tinyint(1) NOT NULL,
  `Price` int DEFAULT NULL,
  `Description` text COLLATE utf8mb4_general_ci NOT NULL,
  `Valid_From` date NOT NULL,
  `Valid_To` date NOT NULL,
  `Img` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Transactions`
--

CREATE TABLE `Transactions` (
  `Id` int NOT NULL,
  `Balance` int NOT NULL,
  `Wallet_id` int NOT NULL,
  `Category_id` int NOT NULL,
  `Type` tinyint(1) NOT NULL,
  `Data` json DEFAULT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `Id` int NOT NULL,
  `Nickname` int NOT NULL,
  `Login` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `Passwond` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `Session` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Wallet`
--

CREATE TABLE `Wallet` (
  `Id` int NOT NULL,
  `User_id` int NOT NULL,
  `Name` varchar(256) COLLATE utf8mb4_general_ci NOT NULL,
  `Balance` int NOT NULL,
  `Eda_data` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Behavitor`
--
ALTER TABLE `Behavitor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User` (`User_id`);

--
-- Индексы таблицы `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Credit_Analysis`
--
ALTER TABLE `Credit_Analysis`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_id` (`User_id`);

--
-- Индексы таблицы `Credit_Recomend`
--
ALTER TABLE `Credit_Recomend`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Offers_id` (`Offers_id`);

--
-- Индексы таблицы `Debt_Recommend`
--
ALTER TABLE `Debt_Recommend`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Offers_id` (`Offers_id`);

--
-- Индексы таблицы `Goals`
--
ALTER TABLE `Goals`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_id` (`User_id`);

--
-- Индексы таблицы `Offers`
--
ALTER TABLE `Offers`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User` (`User_id`),
  ADD KEY `Category` (`Category_id`),
  ADD KEY `Paratner_Shares_Id` (`Paratner_Shares_Id`);

--
-- Индексы таблицы `Paratner_Shares`
--
ALTER TABLE `Paratner_Shares`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Category_id` (`Category_id`);

--
-- Индексы таблицы `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Category_id` (`Category_id`),
  ADD KEY `Wallet_id` (`Wallet_id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Wallet`
--
ALTER TABLE `Wallet`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `User_id` (`User_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Behavitor`
--
ALTER TABLE `Behavitor`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Category`
--
ALTER TABLE `Category`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Credit_Analysis`
--
ALTER TABLE `Credit_Analysis`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Credit_Recomend`
--
ALTER TABLE `Credit_Recomend`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Debt_Recommend`
--
ALTER TABLE `Debt_Recommend`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Goals`
--
ALTER TABLE `Goals`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Offers`
--
ALTER TABLE `Offers`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Paratner_Shares`
--
ALTER TABLE `Paratner_Shares`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Transactions`
--
ALTER TABLE `Transactions`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Wallet`
--
ALTER TABLE `Wallet`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Behavitor`
--
ALTER TABLE `Behavitor`
  ADD CONSTRAINT `behavitor_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Credit_Analysis`
--
ALTER TABLE `Credit_Analysis`
  ADD CONSTRAINT `credit_analysis_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Credit_Recomend`
--
ALTER TABLE `Credit_Recomend`
  ADD CONSTRAINT `credit_recomend_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `credit_recomend_ibfk_2` FOREIGN KEY (`Offers_id`) REFERENCES `Offers` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Debt_Recommend`
--
ALTER TABLE `Debt_Recommend`
  ADD CONSTRAINT `debt_recommend_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `debt_recommend_ibfk_2` FOREIGN KEY (`Offers_id`) REFERENCES `Offers` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Goals`
--
ALTER TABLE `Goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Offers`
--
ALTER TABLE `Offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `offers_ibfk_2` FOREIGN KEY (`Category_id`) REFERENCES `Category` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `offers_ibfk_3` FOREIGN KEY (`Paratner_Shares_Id`) REFERENCES `Paratner_Shares` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Paratner_Shares`
--
ALTER TABLE `Paratner_Shares`
  ADD CONSTRAINT `paratner_shares_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `Category` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`Category_id`) REFERENCES `Category` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`Wallet_id`) REFERENCES `Wallet` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Wallet`
--
ALTER TABLE `Wallet`
  ADD CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
