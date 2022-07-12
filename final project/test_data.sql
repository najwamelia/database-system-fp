-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2021 at 05:23 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fp_sbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch_store`
--

CREATE TABLE `branch_store` (
  `BS_ID` int(11) NOT NULL,
  `BS_NAME` varchar(255) NOT NULL,
  `BS_ADDRESS` varchar(255) NOT NULL,
  `BS_CITY` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branch_store`
--

INSERT INTO `branch_store` (`BS_ID`, `BS_NAME`, `BS_ADDRESS`, `BS_CITY`) VALUES
(1, 'Toko A', 'Jalan Abe', 'Bekasi'),
(2, 'Toko B', 'Jalan Windy', 'Bali'),
(3, 'Toko C', 'Jalan Awan', 'Ponorogo'),
(4, 'Toko D', 'Jalan Jalan', 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `BYR_ID` int(11) NOT NULL,
  `BYR_FNAME` varchar(100) NOT NULL,
  `BYR_LNAME` varchar(100) NOT NULL,
  `BYR_PHONE` varchar(13) NOT NULL,
  `BYR_ADDRESS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`BYR_ID`, `BYR_FNAME`, `BYR_LNAME`, `BYR_PHONE`, `BYR_ADDRESS`) VALUES
(1, 'Justin', 'Andika', '081423598677', 'Jakarta Barat, Jakarta'),
(2, 'Ariel', 'Putra', '082134335675', 'Bogot, Jawa Barat'),
(3, 'Kevin', 'Surya', '087765656788', 'Surabaya, Jawa TImur'),
(4, 'Mita', 'Putri', '089698123543', 'Sidoarjo, Jawa Timur');

-- --------------------------------------------------------

--
-- Table structure for table `distribution`
--

CREATE TABLE `distribution` (
  `DISTRI_ID` int(11) NOT NULL,
  `BS_ID` int(11) DEFAULT NULL,
  `GOODS_ID` int(11) DEFAULT NULL,
  `WORKER_ID` int(11) DEFAULT NULL,
  `DISTRI_TIME` time DEFAULT NULL,
  `DISTRI_DATE` date DEFAULT NULL,
  `DISTRI_STATUS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `distribution`
--

INSERT INTO `distribution` (`DISTRI_ID`, `BS_ID`, `GOODS_ID`, `WORKER_ID`, `DISTRI_TIME`, `DISTRI_DATE`, `DISTRI_STATUS`) VALUES
(1, 2, 3, 4, '13:30:00', '2021-10-10', 'Delivery'),
(2, 3, 4, 1, '14:52:00', '2021-10-12', 'Accept'),
(3, 4, 1, 2, '16:21:00', '2021-11-21', 'Accept'),
(4, 1, 2, 3, '17:01:00', '2021-12-31', 'Delivery');

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `GOODS_ID` int(11) NOT NULL,
  `WORKER_ID` int(11) NOT NULL,
  `GOODS_NAME` varchar(255) NOT NULL,
  `GOODS_PRICE` float NOT NULL,
  `GOODS_STOCK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`GOODS_ID`, `WORKER_ID`, `GOODS_NAME`, `GOODS_PRICE`, `GOODS_STOCK`) VALUES
(1, 3, 'Merk A', 1000, 100),
(2, 4, 'Merk B', 3000, 150),
(3, 1, 'Merk C', 6000, 200),
(4, 2, 'Merk D', 12000, 400);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `JOB_ID` int(11) NOT NULL,
  `JOB_TITLE` varchar(255) DEFAULT NULL,
  `JOB_SALARY` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`JOB_ID`, `JOB_TITLE`, `JOB_SALARY`) VALUES
(1, 'Employee', 3000000),
(2, 'Cashier', 1000000),
(3, 'Cleaning Service', 500000),
(4, 'Manager', 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ORDER_ID` int(11) NOT NULL,
  `WORKER_ID` int(11) NOT NULL,
  `BYR_ID` int(11) NOT NULL,
  `GOODS_ID` int(11) NOT NULL,
  `ORDER_DATE` date NOT NULL,
  `ORDER_AMOUNT` int(11) NOT NULL,
  `ORDER_TOTAL` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`ORDER_ID`, `WORKER_ID`, `BYR_ID`, `GOODS_ID`, `ORDER_DATE`, `ORDER_AMOUNT`, `ORDER_TOTAL`) VALUES
(1, 1, 2, 4, '2021-11-10', 3, 36000),
(2, 1, 4, 1, '2021-10-21', 2, 2000),
(3, 1, 1, 3, '2021-10-01', 3, 18000),
(4, 1, 3, 2, '2021-11-11', 5, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `order_bs`
--

CREATE TABLE `order_bs` (
  `BSORDER_ID` int(11) NOT NULL,
  `WORKER_ID` int(11) NOT NULL,
  `BS_ID` int(11) NOT NULL,
  `GOODS_ID` int(11) NOT NULL,
  `BSORDER_DATE` date NOT NULL,
  `BSORDER_TOTAL` float NOT NULL,
  `BSORDER_AMOUNT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_bs`
--

INSERT INTO `order_bs` (`BSORDER_ID`, `WORKER_ID`, `BS_ID`, `GOODS_ID`, `BSORDER_DATE`, `BSORDER_TOTAL`, `BSORDER_AMOUNT`) VALUES
(1, 3, 1, 2, '2021-11-11', 9000, 3),
(2, 3, 3, 4, '2021-10-05', 72000, 6),
(3, 3, 4, 3, '2021-11-25', 18000, 3),
(4, 3, 2, 1, '2021-12-01', 2000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment_goods`
--

CREATE TABLE `payment_goods` (
  `PMGOODS_ID` int(11) NOT NULL,
  `PMGOODS_METHOD` varchar(255) DEFAULT NULL,
  `PMGOODS_AMOUNT` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_goods`
--

INSERT INTO `payment_goods` (`PMGOODS_ID`, `PMGOODS_METHOD`, `PMGOODS_AMOUNT`) VALUES
(1, 'Transfer', 15000000),
(2, 'Cash', 25000000),
(3, 'Transfer', 50000000),
(4, 'Transfer', 20000000);

-- --------------------------------------------------------

--
-- Table structure for table `procurement`
--

CREATE TABLE `procurement` (
  `PROC_ID` int(11) NOT NULL,
  `SUP_ID` int(11) NOT NULL,
  `PMGOODS_ID` int(11) NOT NULL,
  `GOODS_ID` int(11) NOT NULL,
  `PROC_TIME` time NOT NULL,
  `PROC_DATE` date NOT NULL,
  `PROC_STOCK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `procurement`
--

INSERT INTO `procurement` (`PROC_ID`, `SUP_ID`, `PMGOODS_ID`, `GOODS_ID`, `PROC_TIME`, `PROC_DATE`, `PROC_STOCK`) VALUES
(1, 2, 4, 1, '13:30:00', '2021-11-15', 300),
(2, 3, 1, 2, '14:15:00', '2021-12-07', 450),
(3, 1, 2, 3, '10:30:00', '2021-10-02', 400),
(4, 4, 3, 4, '11:10:00', '2021-10-05', 800);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SUP_ID` int(11) NOT NULL,
  `SUP_NAME` varchar(255) NOT NULL,
  `SUP_EMAIL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`SUP_ID`, `SUP_NAME`, `SUP_EMAIL`) VALUES
(1, 'Supplier A', 'supplier1@gmail.com'),
(2, 'Supplier B', 'supplier2@gmail.com'),
(3, 'Supplier C', 'supplier3@gmail.com'),
(4, 'Supplier D', 'supplier4@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `worker`
--

CREATE TABLE `worker` (
  `WORKER_ID` int(11) NOT NULL,
  `BS_ID` int(11) DEFAULT NULL,
  `JOB_ID` int(11) DEFAULT NULL,
  `WORKER_FNAME` varchar(255) DEFAULT NULL,
  `WORKER_LNAME` varchar(255) DEFAULT NULL,
  `WORKER_EMAIL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `worker`
--

INSERT INTO `worker` (`WORKER_ID`, `BS_ID`, `JOB_ID`, `WORKER_FNAME`, `WORKER_LNAME`, `WORKER_EMAIL`) VALUES
(1, 2, 3, 'Albert', 'Andika', 'dummy1@gmail.com'),
(2, 3, 4, 'Putu', 'Windy', 'dummy2@gmail.com'),
(3, 4, 1, 'Najwa', 'Amelia', 'dummy3@gmail.com'),
(4, 1, 2, 'Ade', 'Kaka', 'dummy4@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch_store`
--
ALTER TABLE `branch_store`
  ADD PRIMARY KEY (`BS_ID`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`BYR_ID`);

--
-- Indexes for table `distribution`
--
ALTER TABLE `distribution`
  ADD PRIMARY KEY (`DISTRI_ID`),
  ADD UNIQUE KEY `GOODS_ID` (`GOODS_ID`),
  ADD UNIQUE KEY `WORKER_ID` (`WORKER_ID`,`BS_ID`),
  ADD KEY `BS_ID` (`BS_ID`);

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`GOODS_ID`),
  ADD KEY `WORKER_ID` (`WORKER_ID`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD UNIQUE KEY `BYR_ID` (`BYR_ID`),
  ADD UNIQUE KEY `GOODS_ID` (`GOODS_ID`,`WORKER_ID`),
  ADD KEY `WORKER_ID` (`WORKER_ID`);

--
-- Indexes for table `order_bs`
--
ALTER TABLE `order_bs`
  ADD PRIMARY KEY (`BSORDER_ID`),
  ADD KEY `BS_ID` (`BS_ID`),
  ADD KEY `GOODS_ID` (`GOODS_ID`),
  ADD KEY `WORKER_ID` (`WORKER_ID`);

--
-- Indexes for table `payment_goods`
--
ALTER TABLE `payment_goods`
  ADD PRIMARY KEY (`PMGOODS_ID`);

--
-- Indexes for table `procurement`
--
ALTER TABLE `procurement`
  ADD PRIMARY KEY (`PROC_ID`),
  ADD UNIQUE KEY `PMGOODS_ID` (`PMGOODS_ID`),
  ADD KEY `GOODS_ID` (`GOODS_ID`),
  ADD KEY `SUP_ID` (`SUP_ID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SUP_ID`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`WORKER_ID`),
  ADD KEY `BS_ID` (`BS_ID`),
  ADD KEY `JOB_ID` (`JOB_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch_store`
--
ALTER TABLE `branch_store`
  MODIFY `BS_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_bs`
--
ALTER TABLE `order_bs`
  MODIFY `BSORDER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SUP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `distribution`
--
ALTER TABLE `distribution`
  ADD CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`BS_ID`) REFERENCES `branch_store` (`BS_ID`),
  ADD CONSTRAINT `distribution_ibfk_2` FOREIGN KEY (`GOODS_ID`) REFERENCES `goods` (`GOODS_ID`),
  ADD CONSTRAINT `distribution_ibfk_3` FOREIGN KEY (`WORKER_ID`) REFERENCES `worker` (`WORKER_ID`);

--
-- Constraints for table `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`WORKER_ID`) REFERENCES `worker` (`WORKER_ID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`BYR_ID`) REFERENCES `buyer` (`BYR_ID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`GOODS_ID`) REFERENCES `goods` (`GOODS_ID`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`WORKER_ID`) REFERENCES `worker` (`WORKER_ID`);

--
-- Constraints for table `order_bs`
--
ALTER TABLE `order_bs`
  ADD CONSTRAINT `order_bs_ibfk_1` FOREIGN KEY (`BS_ID`) REFERENCES `branch_store` (`BS_ID`),
  ADD CONSTRAINT `order_bs_ibfk_2` FOREIGN KEY (`GOODS_ID`) REFERENCES `goods` (`GOODS_ID`),
  ADD CONSTRAINT `order_bs_ibfk_3` FOREIGN KEY (`WORKER_ID`) REFERENCES `worker` (`WORKER_ID`);

--
-- Constraints for table `procurement`
--
ALTER TABLE `procurement`
  ADD CONSTRAINT `procurement_ibfk_1` FOREIGN KEY (`GOODS_ID`) REFERENCES `goods` (`GOODS_ID`),
  ADD CONSTRAINT `procurement_ibfk_2` FOREIGN KEY (`SUP_ID`) REFERENCES `suppliers` (`SUP_ID`),
  ADD CONSTRAINT `procurement_ibfk_3` FOREIGN KEY (`PMGOODS_ID`) REFERENCES `payment_goods` (`PMGOODS_ID`);

--
-- Constraints for table `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`BS_ID`) REFERENCES `branch_store` (`BS_ID`),
  ADD CONSTRAINT `worker_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`JOB_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
