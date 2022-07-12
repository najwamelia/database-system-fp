-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2021 at 12:41 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b3_sbd`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_distributor`
--

CREATE TABLE `data_distributor` (
  `id_distributor` int(11) NOT NULL,
  `nama_distributor` varchar(80) DEFAULT NULL,
  `alamat_distributor` varchar(225) NOT NULL,
  `telp_distributor` varchar(30) NOT NULL,
  `email_distributor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_distributor`
--

INSERT INTO `data_distributor` (`id_distributor`, `nama_distributor`, `alamat_distributor`, `telp_distributor`, `email_distributor`) VALUES
(1, 'Wanmin', 'Liyue Harbor, Sea of Clouds, Liyue', '021-789152', 'wanmin@gmail.com'),
(2, 'Uyuu', 'Inazuma City, Narukami Island, Inazuma', '021-164792', 'uyuu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `data_petugas`
--

CREATE TABLE `data_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(80) DEFAULT NULL,
  `email_petugas` varchar(50) NOT NULL,
  `alamat_petugas` varchar(255) NOT NULL,
  `telp_petugas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_petugas`
--

INSERT INTO `data_petugas` (`id_petugas`, `nama_petugas`, `email_petugas`, `alamat_petugas`, `telp_petugas`) VALUES
(1, 'Raiden', 'raiden@gmail.com', 'Tenshukaku, Inazuma City, Narukami Island', '081-884-123-554'),
(2, 'Yae', 'yae@gmail.com', 'Grand Narukami Shrine, Mt. Yougou, Narukami Island', '085-343-124-665'),
(3, 'Sara', 'sara@gmail.com', ' Kujou Estate, Inazuma City, Narukami Island', '087-879-342-653');

-- --------------------------------------------------------

--
-- Table structure for table `data_produk`
--

CREATE TABLE `data_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(80) DEFAULT NULL,
  `stok_produk` int(11) NOT NULL,
  `harga_produk` decimal(10,2) NOT NULL,
  `id_distributor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_produk`
--

INSERT INTO `data_produk` (`id_produk`, `nama_produk`, `stok_produk`, `harga_produk`, `id_distributor`) VALUES
(1, 'Dango Milk', 56, '13889.00', 2),
(2, 'Almond Tofu', 14, '6889.00', 1),
(3, 'Bird Egg Sushi', 15, '3000.00', 2),
(4, 'Golden Crab', 12, '21889.00', 1),
(5, 'Goulash', 3, '16889.00', 1),
(6, 'Adeptus Temptation', 7, '23889.00', 1),
(7, 'Miso Soup', 13, '11889.00', 2),
(8, 'Lotus Flower Crisp', 15, '10889.00', 1),
(9, 'Matsutake Meat Rolls', 21, '15889.00', 1),
(10, 'Onigiri', 22, '2889.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `data_transaksi`
--

CREATE TABLE `data_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_transaksi`
--

INSERT INTO `data_transaksi` (`id_transaksi`, `id_petugas`, `tanggal`, `total`) VALUES
(1, 3, '2021-11-09', 95000),
(2, 1, '2021-11-10', 43000),
(3, 2, '2021-11-11', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `id_transaksi`, `id_produk`, `jumlah`) VALUES
(1, 1, 1, 5),
(2, 1, 10, 5),
(3, 2, 2, 1),
(4, 2, 4, 1),
(5, 2, 8, 1),
(6, 3, 6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_distributor`
--
ALTER TABLE `data_distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indexes for table `data_petugas`
--
ALTER TABLE `data_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `data_produk`
--
ALTER TABLE `data_produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_distributor` (`id_distributor`);

--
-- Indexes for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_petugas` (`id_petugas`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_distributor`
--
ALTER TABLE `data_distributor`
  MODIFY `id_distributor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `data_petugas`
--
ALTER TABLE `data_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_produk`
--
ALTER TABLE `data_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_produk`
--
ALTER TABLE `data_produk`
  ADD CONSTRAINT `id_distributor` FOREIGN KEY (`id_distributor`) REFERENCES `data_distributor` (`id_distributor`);

--
-- Constraints for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD CONSTRAINT `id_petugas` FOREIGN KEY (`id_petugas`) REFERENCES `data_petugas` (`id_petugas`);

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `data_transaksi` (`id_transaksi`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `data_produk` (`id_produk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
