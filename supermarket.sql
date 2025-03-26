-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 26 2025 г., 23:25
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `supermarket`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Category`
--

CREATE TABLE `Category` (
  `id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Category`
--

INSERT INTO `Category` (`id`, `Name`) VALUES
(1, 'Электроника'),
(2, 'Одежда'),
(3, 'Книги'),
(4, 'Спорт'),
(5, 'Косметика');

-- --------------------------------------------------------

--
-- Структура таблицы `Customer`
--

CREATE TABLE `Customer` (
  `id` int NOT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Discount` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Customer`
--

INSERT INTO `Customer` (`id`, `Surname`, `Name`, `Discount`) VALUES
(1, 'Никитина', 'Есшуна', '10.00'),
(2, 'Павлов', 'Шун', '5.00'),
(3, 'Сеченов', 'Эйс', '15.00'),
(4, 'Нечаева', 'Джули', '0.00'),
(5, 'Никифорова', 'Мира', '20.00');

-- --------------------------------------------------------

--
-- Структура таблицы `Manufacturer`
--

CREATE TABLE `Manufacturer` (
  `id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `City` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Manufacturer`
--

INSERT INTO `Manufacturer` (`id`, `Name`, `City`) VALUES
(1, 'Экотехно', 'Москва'),
(2, 'Одёжкин', 'Санкт-Петербург'),
(3, 'Буквоед', 'Екатеринбург'),
(4, 'СпортикOFF', 'Казань'),
(5, 'Beauty-ER', 'Новосибирск');

-- --------------------------------------------------------

--
-- Структура таблицы `Product`
--

CREATE TABLE `Product` (
  `id` int NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Manufacturer_id` int DEFAULT NULL,
  `Category_id` int DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Release_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Product`
--

INSERT INTO `Product` (`id`, `Name`, `Manufacturer_id`, `Category_id`, `Price`, `Release_date`) VALUES
(1, 'Телевизор', 1, 1, '45000.00', '2023-01-15'),
(2, 'Футболка', 2, 2, '1500.00', '2022-06-20'),
(3, 'Роман', 3, 3, '500.00', '2022-05-10'),
(4, 'Лыжи', 4, 4, '25000.00', '2021-12-01'),
(5, 'Помада', 5, 5, '800.00', '2023-03-18');

-- --------------------------------------------------------

--
-- Структура таблицы `Sales`
--

CREATE TABLE `Sales` (
  `id` int NOT NULL,
  `Product_id` int NOT NULL,
  `Customer_id` int NOT NULL,
  `Salesman_id` int NOT NULL,
  `Date_of_sale` datetime(6) NOT NULL,
  `Full_price` decimal(13,2) NOT NULL,
  `Count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Sales`
--

INSERT INTO `Sales` (`id`, `Product_id`, `Customer_id`, `Salesman_id`, `Date_of_sale`, `Full_price`, `Count`) VALUES
(1, 1, 1, 3, '2023-10-16 00:00:00.000000', '45000.00', 1),
(2, 3, 2, 4, '2023-10-17 00:00:00.000000', '1500.00', 3),
(3, 2, 3, 5, '2023-10-18 00:00:00.000000', '3000.00', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Salesman`
--

CREATE TABLE `Salesman` (
  `id` int NOT NULL,
  `Surname` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Current_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Salesman`
--

INSERT INTO `Salesman` (`id`, `Surname`, `Name`, `Address`, `Current_account`, `Phone_number`) VALUES
(1, 'Лущикова', 'Анастасия', 'Москва, ул. Ленинградская, д. 10', '40702810730000000000', '89001234567'),
(2, 'Храмцов', 'Ярослав', 'Санкт-Петербург, ул. Невский, д. 25', '40702810730000000001', '89007654321'),
(3, 'Паршова', 'Юлия', 'Екатеринбург, ул. Красноармейская, д. 5', '40702810730000000002', '89009998877'),
(4, 'Тарасов', 'Данила', 'Казань, ул. Муса Джалиля, д. 8', '40702810730000000003', '89005557744'),
(5, 'Саитбаталов', 'Руслан', 'Новосибирск, ул. Ленина, д. 12', '40702810730000000004', '89004443322');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Manufacturer`
--
ALTER TABLE `Manufacturer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Manufacturer` (`Manufacturer_id`),
  ADD KEY `Category` (`Category_id`);

--
-- Индексы таблицы `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Product_id` (`Product_id`,`Customer_id`,`Salesman_id`),
  ADD KEY `Customer_id` (`Customer_id`),
  ADD KEY `Salesman_id` (`Salesman_id`);

--
-- Индексы таблицы `Salesman`
--
ALTER TABLE `Salesman`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Manufacturer`
--
ALTER TABLE `Manufacturer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `Sales`
--
ALTER TABLE `Sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Salesman`
--
ALTER TABLE `Salesman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Manufacturer_id`) REFERENCES `Manufacturer` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`Category_id`) REFERENCES `Category` (`id`);

--
-- Ограничения внешнего ключа таблицы `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`id`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`Salesman_id`) REFERENCES `Salesman` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
