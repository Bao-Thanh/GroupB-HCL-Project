-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2022 at 07:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `selling technology stuff`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `id` bigint(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `role`, `status`) VALUES
(1, 'baothanh1', 'Admin1@123', 'admin', 'Activate'),
(2, 'ducmanh123', 'manh@123', 'user', 'Active'),
(3, 'hoangngo1', 'hoang@123', 'user', 'Active'),
(4, 'khanhvan12', 'van@123', 'user', 'Active'),
(5, 'sontruong123', 'son@123', 'user', 'Unactive');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `status` varchar(255) NOT NULL,
  `parent_category` bigint(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `status`, `parent_category`) VALUES
(1, 'Keyboard', 'Keyboard', 'Available', 1),
(2, 'Laptop gaming', 'Laptop for gamers ', 'Available', 2),
(3, 'Mouse', 'Mouse\' type wireless use for gaming, office...', 'Available', 3);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `evaluate` varchar(255) NOT NULL,
  `product_id` bigint(100) NOT NULL,
  `customer_id` bigint(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cmt_customer_id_fk` (`customer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `evaluate`, `product_id`, `customer_id`) VALUES
(1, 'i love it', '5', 1, 1),
(2, 'It works very well.', '5', 7, 2),
(3, 'It\'s so bad with me', '2', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` bigint(100) NOT NULL,
  `account_id` bigint(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(20) NOT NULL,
  `gener` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cus_account_id_fk` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `account_id`, `name`, `age`, `gener`, `address`, `phone`, `email`, `type`, `status`) VALUES
(1, 4, 'Khanh Van', 18, 'Male', '110, Le Thanh, Thu Dau Mot City , Viet Nam', '0125458744', 'van123@gmail.com', 'VIP', 'Active'),
(2, 5, 'Ly Truong Son', 18, 'Male', '333, Xo Viet Nghe Tinh, Binh Thanh District, Ho Chi Minh city, Viet Nam', '0981761930', 'sontruong4200@gmail.com', 'Normal', 'Unactive'),
(3, 3, 'Ngo Minh Hoang', 18, 'Male', '223, Nguyen Trai, Binh Thanh, Ho Chi Minh city, Viet Nam', '0967107960', 'ngohoang@gmail.com', 'Normal', 'Active'),
(4, 2, 'Nguyen Duc Manh', 18, 'Male', '123, Ho Xuan Huong, Ha Noi, Viet Nam', '0968746560', 'ducmanh@gmail.com', 'Normal', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `orderDate` datetime NOT NULL,
  `vat` varchar(255) NOT NULL,
  `safeOff` float NOT NULL,
  `status` varchar(255) NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 NOT NULL,
  `totalPrice` double NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `account_id` bigint(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `od_customer_id_fk` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `address`, `phone`, `orderDate`, `vat`, `safeOff`, `status`, `state`, `totalPrice`, `payment_type`, `account_id`) VALUES
(1, '110, Le Thanh, Thu Dau Mot City , Viet Nam', '0125458744', '2022-11-01 19:44:48', '0', 0, 'Pending', 'Pending', 127.09, 'Visa Card', 1),
(2, '123, Ho Xuan Huong, Ha Noi, Viet Nam', '0968746560', '2021-11-12 19:50:12', '0', 0, 'Completed', 'Successful', 176, 'Visa Card', 3),
(3, '230, Doan Van Bo, 4 District, Ho Chi Minh City, Viet Nam', '0987145255', '2022-11-01 07:38:55', '0', 0, 'Processing', 'Delivering', 1650, 'Visa Card', 3),
(4, '320, Le Van Si street, Binh Tan District, Ho Chi Minh City, Viet Nam ', '0987145245', '2022-10-08 19:33:03', '0', 0, 'Completed', 'Successful', 63.54, 'Internet Banking', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE IF NOT EXISTS `orderdetail` (
  `id` bigint(100) NOT NULL,
  `order_id` bigint(100) NOT NULL,
  `product_id` bigint(100) NOT NULL,
  `amount` int(10) NOT NULL,
  `productPrice` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `odd_order_id_fk` (`order_id`),
  KEY `odd_product_id_fk` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`id`, `order_id`, `product_id`, `amount`, `productPrice`) VALUES
(1, 1, 2, 1, 18.1),
(2, 4, 9, 2, 31.77),
(3, 1, 5, 1, 49),
(4, 1, 4, 1, 59.99),
(5, 1, 1, 1, 176),
(6, 3, 8, 1, 800),
(7, 3, 11, 1, 850);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `safeOff` float DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `amount` int(10) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `category_id` bigint(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `safeOff`, `status`, `image`, `amount`, `description`, `category_id`) VALUES
(1, 'Logitech G Pro X Superlight Wireless Red', 176, 0, 'Unavailable', 'https://asset.cloudinary.com/doj6jxrnf/ef5476e46707314671f4f49edc6b67f0', 0, 'Logitech G Pro X Superlight Wireless Red', 3),
(2, 'Fuhlen G90 Pro X', 18.1, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/caae5b2281b1ff19ea28fabeb0d1447a', 100, 'Fuhlen, a gaming gear brand that is trusted by many gamers thanks to its perfection and affordable price segment. And in the gaming mouse segment, Fuhlen made a strong impression with G90 and G90 Pro products', 1),
(3, 'Laptop ASUS TUF Gaming F15 FX506HC HN144W', 899.95, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/ad65051b7af2b364c718fe0056ca36c3', 10, 'ASUS TUF Gaming F15 FX506HC HN144W laptop has a very unique design with mysterious Graphite Black color. Equipped with a great configuration from top components for a great product. This promises to be a product that bombards the upcoming gamer market.', 2),
(4, 'CoolerMaster MM711 Retro', 59.99, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/91b1aa0f4e5211df7c7fcf8f0afdd681', 1, 'Limited production', 3),
(5, 'AKKO RG325 Dragon Ball Z – Goku', 49, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/65727c10772b11976d25d4caeb5726c1', 50, 'Akko\'s collaboration with Toei Animation author on the character Goku. The cheap gaming mouse model RG325 with SONGOKU version brings the color tone of the extremely lovely Songoku baby monkey.', 3),
(6, 'HyperX Alloy Origins 60 Pink Machanical Keyboard', 99.95, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/4829992e42c1f848f7874a9713612cc7', 50, 'Manufacturer Kingston, Model HyperX Alloy Origins 60 Pink Layout 60% key Pink', 1),
(7, 'Laptop gaming MSI GF63 Thin 11SC 665VN', 683.99, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/394b00c01f1e4877eb9b5dd622168e58', 5, 'The MSI GF63 Thin 11SC-665VN gaming laptop has a surprisingly thin and light design, which is rare on conventional gaming laptops. This helps to strip away the aggressive look and replace it with a luxurious and gaming beauty.', 2),
(8, 'Laptop gaming Acer Aspire 7 A715 75G 58U4', 800, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/394b00c01f1e4877eb9b5dd622168e58', 3, 'As the best cheap gaming laptop in the segment, Acer Aspire 7 A715 75G 58U4 is equipped with GTX 1650 4GB GDDR6 graphics card, 10th generation Intel Core i5 processor', 2),
(9, 'Fuhlen Eraser Mechanical Keyboard', 31.77, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/2d2e3ca6da43a0114d2479c72580c2cd', 20, 'Fuhlen is one of the famous brands when it comes to bringing to consumers genuine, quality gaming gear products at very reasonable prices. With product lines that have created brands such as fuhlen mice, gaming headsets, mouse pads and keyboard lines. In ', 3),
(10, 'Mechanical Keyboard Fuhlen D87s RGB', 33.5, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/2b8ea2dff88b853493c94cf349b8f230', 11, 'Fuhlen D87s RGB is one of the cheap mechanical keyboards for students - students and general users. With a compact Tenkeyless design, RGB led lighting system with many different sparkling effects, etc. To fully immerse players in the game Fuhlen D87s RGB ', 1),
(11, 'Laptop gaming HP Victus 16 d0294TX 5Z9R5PA', 850, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/1ea3ffaed0b13b36698661d63a667c8c', 8, 'HP Victus 16 d0294TX 5Z9R5PA gaming laptop has just released technology with an impressive appearance and super performance.', 2),
(12, 'Machanical Keyboard Corsair K100 RGB', 249.5, 0, 'Available', 'https://asset.cloudinary.com/doj6jxrnf/1cde60e92be9561bdb1340d375edbadb', 30, 'Corsair K100 RGB mechanical gaming keyboard has a metal keyboard frame, the surface is covered with a layer of scratched aluminum, skillfully and delicately machined to fit the switch pins, creating a comfortable and solid feeling. , good protection for t', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `parent_id` FOREIGN KEY (`parent_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `cmt_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cmt_prodcut_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `cus_account_id_fk` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `od_customer_id_fk` FOREIGN KEY (`account_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `odd_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `odd_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `p_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
