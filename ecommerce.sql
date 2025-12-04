-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2025 at 10:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productDescription` text NOT NULL,
  `productPrice` decimal(10,2) NOT NULL,
  `productStock` int(11) NOT NULL,
  `productCategory` varchar(50) NOT NULL,
  `productImage` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productName`, `productDescription`, `productPrice`, `productStock`, `productCategory`, `productImage`, `createdAt`, `updatedAt`) VALUES
(1, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops', 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 109.95, 30, 'men\'s clothing', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(2, 'Mens Casual Premium Slim Fit T-Shirts', 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, lightweight & soft fabric for breathable and comfortable wearing.', 22.30, 40, 'men\'s clothing', 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(3, 'Mens Cotton Jacket', 'Great outerwear jacket for Spring/Autumn/Winter, suitable for many occasions: hiking, camping, climbing, or travel.', 55.99, 25, 'men\'s clothing', 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(4, 'Mens Casual Slim Fit', 'The color could be slightly different between on the screen and in practice. Please note that body builds vary by person.', 15.99, 35, 'men\'s clothing', 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(5, 'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet', 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl.', 695.00, 20, 'jewelery', 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(6, 'Solid Gold Petite Micropave', 'Satisfaction guaranteed. Return or exchange any order within 30 days. Designed and sold by Hafeez Center USA.', 168.00, 15, 'jewelery', 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(7, 'White Gold Plated Princess', 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her.', 9.99, 50, 'jewelery', 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(8, 'Pierced Owl Rose Gold Plated Stainless Steel Double', 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel.', 10.99, 40, 'jewelery', 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(9, 'WD 2TB Elements Portable External Hard Drive - USB 3.0', 'USB 3.0 and USB 2.0 Compatibility. Fast data transfers. Improve PC Performance. High Capacity.', 64.00, 25, 'electronics', 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(10, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', 'Easy upgrade for faster boot up, shutdown, and application load. Read/write speeds up to 535MB/s and 450MB/s.', 109.00, 30, 'electronics', 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(11, 'Silicon Power 256GB SSD 3D NAND A55', '3D NAND flash with SLC Cache Technology for faster performance and longer lifespan.', 109.00, 22, 'electronics', 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(12, 'WD 4TB Gaming Drive Works with Playstation 4', 'Expand your PS4 gaming experience with a sleek portable external hard drive.', 114.00, 15, 'electronics', 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(13, 'Acer SB220Q bi 21.5 inches Full HD IPS Ultra-Thin', '21.5-inch Full HD (1920x1080) widescreen IPS display with Radeon FreeSync and 75Hz refresh rate.', 599.00, 10, 'electronics', 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(14, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor', '49-inch ultrawide curved gaming monitor with HDR and Quantum Dot technology.', 999.99, 12, 'electronics', 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(15, 'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats', '3-in-1 detachable design, waterproof, warm fleece inner liner for cold weather.', 56.99, 20, 'women\'s clothing', 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(16, 'Lock and Love Women\'s Removable Hooded Faux Leather Moto Jacket', 'Faux leather material for style and comfort, detachable hood, stylish design.', 29.95, 30, 'women\'s clothing', 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(17, 'Rain Jacket Women Windbreaker Striped Climbing Raincoats', 'Lightweight with adjustable drawstring waist and cotton-lined hood. Perfect for travel.', 39.99, 28, 'women\'s clothing', 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(18, 'MBJ Women\'s Solid Short Sleeve Boat Neck V', 'Lightweight stretch fabric with ribbed sleeves and neckline, perfect for casual wear.', 9.85, 50, 'women\'s clothing', 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(19, 'Opna Women\'s Short Sleeve Moisture T-Shirt', 'Lightweight polyester interlock, moisture wicking, pre-shrunk for great fit.', 7.95, 45, 'women\'s clothing', 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(20, 'DANVOUY Womens T Shirt Casual Cotton Short', 'Soft cotton blend casual short sleeve tee with letter print design.', 12.99, 32, 'women\'s clothing', 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png', '2025-11-06 17:17:43', '2025-11-06 17:17:43'),
(21, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Lap', 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 109.95, 30, 'men\'s clothing', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(22, 'Mens Casual Premium Slim Fit T-Shirts', 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, lightweight & soft fabric for breathable and comfortable wearing.', 22.30, 40, 'men\'s clothing', 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(23, 'Mens Cotton Jacket', 'Great outerwear jacket for Spring/Autumn/Winter, suitable for many occasions: hiking, camping, climbing, or travel.', 55.99, 25, 'men\'s clothing', 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(24, 'Mens Casual Slim Fit', 'The color could be slightly different between on the screen and in practice. Please note that body builds vary by person.', 15.99, 35, 'men\'s clothing', 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(25, 'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet', 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl.', 695.00, 20, 'jewelery', 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(26, 'Solid Gold Petite Micropave', 'Satisfaction guaranteed. Return or exchange any order within 30 days. Designed and sold by Hafeez Center USA.', 168.00, 15, 'jewelery', 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(27, 'White Gold Plated Princess', 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her.', 9.99, 50, 'jewelery', 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(28, 'Pierced Owl Rose Gold Plated Stainless Steel Double', 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel.', 10.99, 40, 'jewelery', 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(29, 'WD 2TB Elements Portable External Hard Drive - USB 3.0', 'USB 3.0 and USB 2.0 Compatibility. Fast data transfers. Improve PC Performance. High Capacity.', 64.00, 25, 'electronics', 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(30, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', 'Easy upgrade for faster boot up, shutdown, and application load. Read/write speeds up to 535MB/s and 450MB/s.', 109.00, 30, 'electronics', 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(31, 'Silicon Power 256GB SSD 3D NAND A55', '3D NAND flash with SLC Cache Technology for faster performance and longer lifespan.', 109.00, 22, 'electronics', 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(32, 'WD 4TB Gaming Drive Works with Playstation 4', 'Expand your PS4 gaming experience with a sleek portable external hard drive.', 114.00, 15, 'electronics', 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(33, 'Acer SB220Q bi 21.5 inches Full HD IPS Ultra-Thin', '21.5-inch Full HD (1920x1080) widescreen IPS display with Radeon FreeSync and 75Hz refresh rate.', 599.00, 10, 'electronics', 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(34, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor', '49-inch ultrawide curved gaming monitor with HDR and Quantum Dot technology.', 999.99, 12, 'electronics', 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(35, 'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats', '3-in-1 detachable design, waterproof, warm fleece inner liner for cold weather.', 56.99, 20, 'women\'s clothing', 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(36, 'Lock and Love Women\'s Removable Hooded Faux Leather Moto Jacket', 'Faux leather material for style and comfort, detachable hood, stylish design.', 29.95, 30, 'women\'s clothing', 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(37, 'Rain Jacket Women Windbreaker Striped Climbing Raincoats', 'Lightweight with adjustable drawstring waist and cotton-lined hood. Perfect for travel.', 39.99, 28, 'women\'s clothing', 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(38, 'MBJ Women\'s Solid Short Sleeve Boat Neck V', 'Lightweight stretch fabric with ribbed sleeves and neckline, perfect for casual wear.', 9.85, 50, 'women\'s clothing', 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(39, 'Opna Women\'s Short Sleeve Moisture T-Shirt', 'Lightweight polyester interlock, moisture wicking, pre-shrunk for great fit.', 7.95, 45, 'women\'s clothing', 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(40, 'DANVOUY Womens T Shirt Casual Cotton Short', 'Soft cotton blend casual short sleeve tee with letter print design.', 12.99, 32, 'women\'s clothing', 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png', '2025-11-17 15:44:08', '2025-11-17 15:44:08'),
(41, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Lap', 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 109.95, 30, 'men\'s clothing', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(42, 'Mens Casual Premium Slim Fit T-Shirts', 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, lightweight & soft fabric for breathable and comfortable wearing.', 22.30, 40, 'men\'s clothing', 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(43, 'Mens Cotton Jacket', 'Great outerwear jacket for Spring/Autumn/Winter, suitable for many occasions: hiking, camping, climbing, or travel.', 55.99, 25, 'men\'s clothing', 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(44, 'Mens Casual Slim Fit', 'The color could be slightly different between on the screen and in practice. Please note that body builds vary by person.', 15.99, 35, 'men\'s clothing', 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(45, 'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet', 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl.', 695.00, 20, 'jewelery', 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(46, 'Solid Gold Petite Micropave', 'Satisfaction guaranteed. Return or exchange any order within 30 days. Designed and sold by Hafeez Center USA.', 168.00, 15, 'jewelery', 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(47, 'White Gold Plated Princess', 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her.', 9.99, 50, 'jewelery', 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(48, 'Pierced Owl Rose Gold Plated Stainless Steel Double', 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel.', 10.99, 40, 'jewelery', 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(49, 'WD 2TB Elements Portable External Hard Drive - USB 3.0', 'USB 3.0 and USB 2.0 Compatibility. Fast data transfers. Improve PC Performance. High Capacity.', 64.00, 25, 'electronics', 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(50, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', 'Easy upgrade for faster boot up, shutdown, and application load. Read/write speeds up to 535MB/s and 450MB/s.', 109.00, 30, 'electronics', 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(51, 'Silicon Power 256GB SSD 3D NAND A55', '3D NAND flash with SLC Cache Technology for faster performance and longer lifespan.', 109.00, 22, 'electronics', 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(52, 'WD 4TB Gaming Drive Works with Playstation 4', 'Expand your PS4 gaming experience with a sleek portable external hard drive.', 114.00, 15, 'electronics', 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(53, 'Acer SB220Q bi 21.5 inches Full HD IPS Ultra-Thin', '21.5-inch Full HD (1920x1080) widescreen IPS display with Radeon FreeSync and 75Hz refresh rate.', 599.00, 10, 'electronics', 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(54, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor', '49-inch ultrawide curved gaming monitor with HDR and Quantum Dot technology.', 999.99, 12, 'electronics', 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(55, 'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats', '3-in-1 detachable design, waterproof, warm fleece inner liner for cold weather.', 56.99, 20, 'women\'s clothing', 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(56, 'Lock and Love Women\'s Removable Hooded Faux Leather Moto Jacket', 'Faux leather material for style and comfort, detachable hood, stylish design.', 29.95, 30, 'women\'s clothing', 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(57, 'Rain Jacket Women Windbreaker Striped Climbing Raincoats', 'Lightweight with adjustable drawstring waist and cotton-lined hood. Perfect for travel.', 39.99, 28, 'women\'s clothing', 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(58, 'MBJ Women\'s Solid Short Sleeve Boat Neck V', 'Lightweight stretch fabric with ribbed sleeves and neckline, perfect for casual wear.', 9.85, 50, 'women\'s clothing', 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(59, 'Opna Women\'s Short Sleeve Moisture T-Shirt', 'Lightweight polyester interlock, moisture wicking, pre-shrunk for great fit.', 7.95, 45, 'women\'s clothing', 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(60, 'DANVOUY Womens T Shirt Casual Cotton Short', 'Soft cotton blend casual short sleeve tee with letter print design.', 12.99, 32, 'women\'s clothing', 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png', '2025-11-17 15:51:04', '2025-11-17 15:51:04'),
(61, 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Lap', 'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday', 109.95, 30, 'men\'s clothing', 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(62, 'Mens Casual Premium Slim Fit T-Shirts', 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket, lightweight & soft fabric for breathable and comfortable wearing.', 22.30, 40, 'men\'s clothing', 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(63, 'Mens Cotton Jacket', 'Great outerwear jacket for Spring/Autumn/Winter, suitable for many occasions: hiking, camping, climbing, or travel.', 55.99, 25, 'men\'s clothing', 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(64, 'Mens Casual Slim Fit', 'The color could be slightly different between on the screen and in practice. Please note that body builds vary by person.', 15.99, 35, 'men\'s clothing', 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(65, 'John Hardy Women\'s Legends Naga Gold & Silver Dragon Station Chain Bracelet', 'From our Legends Collection, the Naga was inspired by the mythical water dragon that protects the ocean\'s pearl.', 695.00, 20, 'jewelery', 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(66, 'Solid Gold Petite Micropave', 'Satisfaction guaranteed. Return or exchange any order within 30 days. Designed and sold by Hafeez Center USA.', 168.00, 15, 'jewelery', 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(67, 'White Gold Plated Princess', 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her.', 9.99, 50, 'jewelery', 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(68, 'Pierced Owl Rose Gold Plated Stainless Steel Double', 'Rose Gold Plated Double Flared Tunnel Plug Earrings. Made of 316L Stainless Steel.', 10.99, 40, 'jewelery', 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(69, 'WD 2TB Elements Portable External Hard Drive - USB 3.0', 'USB 3.0 and USB 2.0 Compatibility. Fast data transfers. Improve PC Performance. High Capacity.', 64.00, 25, 'electronics', 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(70, 'SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s', 'Easy upgrade for faster boot up, shutdown, and application load. Read/write speeds up to 535MB/s and 450MB/s.', 109.00, 30, 'electronics', 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(71, 'Silicon Power 256GB SSD 3D NAND A55', '3D NAND flash with SLC Cache Technology for faster performance and longer lifespan.', 109.00, 22, 'electronics', 'https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(72, 'WD 4TB Gaming Drive Works with Playstation 4', 'Expand your PS4 gaming experience with a sleek portable external hard drive.', 114.00, 15, 'electronics', 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(73, 'Acer SB220Q bi 21.5 inches Full HD IPS Ultra-Thin', '21.5-inch Full HD (1920x1080) widescreen IPS display with Radeon FreeSync and 75Hz refresh rate.', 599.00, 10, 'electronics', 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(74, 'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor', '49-inch ultrawide curved gaming monitor with HDR and Quantum Dot technology.', 999.99, 12, 'electronics', 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(75, 'BIYLACLESEN Women\'s 3-in-1 Snowboard Jacket Winter Coats', '3-in-1 detachable design, waterproof, warm fleece inner liner for cold weather.', 56.99, 20, 'women\'s clothing', 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(76, 'Lock and Love Women\'s Removable Hooded Faux Leather Moto Jacket', 'Faux leather material for style and comfort, detachable hood, stylish design.', 29.95, 30, 'women\'s clothing', 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(77, 'Rain Jacket Women Windbreaker Striped Climbing Raincoats', 'Lightweight with adjustable drawstring waist and cotton-lined hood. Perfect for travel.', 39.99, 28, 'women\'s clothing', 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(78, 'MBJ Women\'s Solid Short Sleeve Boat Neck V', 'Lightweight stretch fabric with ribbed sleeves and neckline, perfect for casual wear.', 9.85, 50, 'women\'s clothing', 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(79, 'Opna Women\'s Short Sleeve Moisture T-Shirt', 'Lightweight polyester interlock, moisture wicking, pre-shrunk for great fit.', 7.95, 45, 'women\'s clothing', 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51'),
(80, 'DANVOUY Womens T Shirt Casual Cotton Short', 'Soft cotton blend casual short sleeve tee with letter print design.', 12.99, 32, 'women\'s clothing', 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_t.png', '2025-12-01 15:45:51', '2025-12-01 15:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'user',
  `status` varchar(20) DEFAULT 'inactive',
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `role`, `status`, `phone`, `address`, `otp`, `createdAt`, `updatedAt`) VALUES
(1, 'abdul qadeer', 'qadeer', 'qmian2117@gmail.com', '$2b$10$zM1/29WWmO6DtrLq/vSG/OK7DP53EHefpERhzuPbUTZvNSHPOp5em', 'user', 'deactive', NULL, NULL, '327792', '2025-11-17 15:22:55', '2025-11-17 15:22:55'),
(2, 'abdul quyyom', 'quyyom', 'mianmassom411@gmail.com', '$2b$10$4Dp.6wvkf2ZiwdgJlnxIkeUo/aMZl7ip3Ird3LyZV2yLEiRvo.o7K', 'user', 'deactive', NULL, NULL, '748352', '2025-11-17 15:33:12', '2025-11-17 15:33:12'),
(3, 'uamr', 'umar1122', 'umar1122@gmail.com', '$2b$10$2W3AAzRbxIEf/pQvWzVZWetbKj56cK1DatCSh0N9i1dzoTKv/if3S', 'user', 'deactive', NULL, NULL, '222565', '2025-12-01 10:10:34', '2025-12-01 10:10:34'),
(4, 'aaa', 'bb', 'qmian2110@gmail.com', '$2b$10$7bsLIeMW5Bn.mcfVkr7T/O30r1m1Ym/INSnlV8BCfQB7YJUYm0ZxK', 'user', 'deactive', NULL, NULL, '579158', '2025-12-02 10:07:04', '2025-12-02 10:07:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
