-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2020 at 11:38 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumera`
--

-- --------------------------------------------------------

--
-- Table structure for table `master_patients`
--

CREATE TABLE `master_patients` (
  `patients_id` varchar(25) NOT NULL,
  `patients_name` varchar(200) NOT NULL,
  `patients_address` varchar(250) NOT NULL,
  `patients_hp` varchar(20) NOT NULL,
  `patients_dob` date NOT NULL,
  `patients_status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_patients`
--

INSERT INTO `master_patients` (`patients_id`, `patients_name`, `patients_address`, `patients_hp`, `patients_dob`, `patients_status`, `created_by`, `updated_by`) VALUES
('12312', 'John Koron', 'Colorado', '081234567890', '2020-04-01', 1, 'NULL', 'NULL'),
('3c90619a88a8ed7a5b4c30ecf', 'Jane Sapa Stou', 'California lingkungan 7', '082929292', '1975-02-14', 1, 'NULL', 'NULL'),
('98572', 'Koro Cok', 'California', '080987654321', '2020-04-01', 1, 'NULL', 'NULL'),
('c0ba0f9f94d88e509a3c3a440', 'John Human', 'California lingkungan 10', '081366672828', '2019-07-29', 1, 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `master_product`
--

CREATE TABLE `master_product` (
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_stock` int(11) NOT NULL DEFAULT 0,
  `product_status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_product`
--

INSERT INTO `master_product` (`product_id`, `product_name`, `product_price`, `product_stock`, `product_status`, `created_by`, `updated_by`) VALUES
('098109390218', 'Serum', 300000, 6, 1, 'NULL', 'NULL'),
('098109390243', 'Toner', 150000, 12, 1, 'NULL', 'NULL'),
('bbc432f7d518d24c80bd8e92e4d5712e', 'Maskers', 200000, 51, 1, 'NULL', 'NULL'),
('PRD16696131000000', 'Hand Sanitizer', 10000, 5, 1, 'NULL', 'NULL'),
('PRD9354271000000', 'Betadine Cina', 30000, 20, 1, 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `master_services`
--

CREATE TABLE `master_services` (
  `services_id` varchar(50) NOT NULL,
  `services_name` varchar(200) NOT NULL,
  `services_category` varchar(25) NOT NULL,
  `services_price` int(11) NOT NULL,
  `services_status` int(11) NOT NULL DEFAULT 1,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_services`
--

INSERT INTO `master_services` (`services_id`, `services_name`, `services_category`, `services_price`, `services_status`, `created_by`, `updated_by`) VALUES
('1', 'Facial 3', 'Klinik', 500000, 1, 'NULL', 'NULL'),
('10', 'Glowing', 'Klinik', 860000, 1, 'NULL', 'NULL'),
('11', 'Slimming', 'Klinik', 2500000, 1, 'NULL', 'NULL'),
('12', 'Suntik Putih', 'Klinik', 2000000, 1, 'NULL', 'NULL'),
('13', 'Tanam Benang', 'Klinik', 3000000, 1, 'NULL', 'NULL'),
('13f98819f38f0ecb2b3dad1e1ed14270', 'Satu', 'Klinik', 100000, 1, 'NULL', 'NULL'),
('14', 'Botox Permanen', 'Klinik', 4000000, 1, 'NULL', 'NULL'),
('15', 'Kase Tinggi Idong', 'Klinik', 5000000, 1, 'NULL', 'NULL'),
('2', 'Gunting, Cuci, Bobaso', 'Salon', 150000, 1, 'NULL', 'NULL'),
('202cb962ac59075b964b07152d234b70', 'Facial Wajan', 'Salon', 100000, 1, 'NULL', 'NULL'),
('37a6259cc0c1dae299a7866489dff0bd', 'Coba123', 'Klinik', 200, 1, 'NULL', 'NULL'),
('3d29de2a932115bb14ae5d3d8153acb5', 'Cuci Muka', 'Salon', 200000, 1, 'NULL', 'NULL'),
('4', 'Mind Blowing', 'Salon', 340000, 1, 'NULL', 'NULL'),
('4c7781d32f6f9ba8f79bc2ff962b4975', 'Botox Promo 1', 'Klinik', 200000, 1, 'NULL', 'NULL'),
('5', 'Catok', 'Salon', 230000, 1, 'NULL', 'NULL'),
('6', 'Cat Rambut', 'Salon', 5000, 1, 'NULL', 'NULL'),
('7', 'Hair Spa', 'Salon', 560000, 1, 'NULL', 'NULL'),
('8', 'Krol', 'Salon', 760000, 1, 'NULL', 'NULL'),
('9', 'Filler', 'Klinik', 760000, 1, 'NULL', 'NULL'),
('9059c367dad2e33b72444ea3f8986e5e', 'Suntik Tampan', 'Klinik', 2000000, 1, 'NULL', 'NULL'),
('db0b99f3c1d16b03f1a6d66910da6d5d', 'Operasi Plastik Kresek', 'Salon', 200000, 1, 'NULL', 'NULL'),
('eb934bd7ae62f2b229c401ba0fd8f2f0', 'Facial Recognition 234', 'Klinik', 100000, 1, 'NULL', 'NULL'),
('f35899dc1bb9c549ce94f918073427b5', 'Cuci Otak', 'Klinik', 400000, 1, 'NULL', 'NULL'),
('null', 'Suntik Ganteng', 'Klinik', 20000000, 1, 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `master_staff`
--

CREATE TABLE `master_staff` (
  `staff_id` varchar(25) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `staff_username` varchar(20) NOT NULL,
  `staff_password` varchar(20) NOT NULL,
  `staff_roles` varchar(25) NOT NULL,
  `staff_status` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_staff`
--

INSERT INTO `master_staff` (`staff_id`, `staff_name`, `staff_username`, `staff_password`, `staff_roles`, `staff_status`, `created_by`, `updated_by`) VALUES
('STF17990901000000', 'Michell Rockefeller', 'micherock', 'michell123', 'Stylist', 1, 'NULL', 'NULL'),
('STF6000021000000', 'Chrisdityra Lengkey', 'chrisdityra', '051099', 'Kasir', 1, 'NULL', 'NULL'),
('STF79743241000000', 'Jamie Grace', 'itsjamie', 'jamie2468', 'Stylist', 1, 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` varchar(25) NOT NULL,
  `transaction_created_date` date DEFAULT NULL,
  `transaction_updated_date` date DEFAULT NULL,
  `transaction_fixed_date` date DEFAULT NULL,
  `transaction_amount` int(11) NOT NULL,
  `transaction_type` varchar(20) NOT NULL,
  `transaction_status` int(11) DEFAULT 0,
  `transaction_served_by` varchar(25) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `updated_by` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_created_date`, `transaction_updated_date`, `transaction_fixed_date`, `transaction_amount`, `transaction_type`, `transaction_status`, `transaction_served_by`, `created_by`, `updated_by`) VALUES
('102-1587498542755714', '2020-04-24', NULL, '0000-00-00', 2250000, 'Produk', 1, '', 'NULL', 'NULL'),
('102-1587498556092415', '2020-04-21', NULL, '0000-00-00', 25950000, 'Produk', 1, '', 'NULL', 'NULL'),
('102-1587743713544567', '2020-04-24', NULL, '0000-00-00', 3000000, 'Produk', 1, '', 'NULL', 'NULL'),
('102-1587743996580677', '2020-04-24', NULL, '0000-00-00', 2000000, 'Produk', 1, '', 'NULL', 'NULL'),
('102-1587746060189493', '2020-04-24', NULL, '0000-00-00', 200000, 'Produk', 1, '', 'NULL', 'NULL'),
('102-1587746233204575', '2020-06-08', NULL, '0000-00-00', 750000, 'Produk', 0, '', 'NULL', 'NULL'),
('102-1587916744774890', '2020-06-20', NULL, '0000-00-00', 750000, 'Produk', 1, '', 'NULL', 'NULL'),
('102-1592623384063707', '2020-06-20', NULL, '0000-00-00', 750000, 'Produk', 0, '', 'NULL', 'NULL'),
('180-1587923468272727', '2020-04-26', NULL, '0000-00-00', 100000, 'Inventaris', 1, '', 'NULL', 'NULL'),
('180-1587923735553405', '2020-05-24', NULL, '0000-00-00', 800000, 'Inventaris', 1, '', 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `transaction_detail_id` int(11) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `transaction_item_id` varchar(50) NOT NULL,
  `transaction_item` varchar(40) NOT NULL,
  `transaction_qty` int(11) NOT NULL,
  `transaction_price` int(11) NOT NULL,
  `transaction_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`transaction_detail_id`, `transaction_id`, `transaction_item_id`, `transaction_item`, `transaction_qty`, `transaction_price`, `transaction_total`) VALUES
(23, '102-1587498556092415', '098109390243', 'Toner', 101, 150000, 15150000),
(24, '102-1587498556092415', '098109390218', 'Serum', 36, 300000, 10800000),
(32, '102-1587743713544567', 'bbc432f7d518d24c80bd8e92e4d5712e', 'Masker', 15, 200000, 3000000),
(51, '102-1587743996580677', 'bbc432f7d518d24c80bd8e92e4d5712e', 'Masker', 10, 200000, 2000000),
(52, '102-1587498542755714', '098109390243', 'Toner', 5, 150000, 750000),
(53, '102-1587498542755714', '098109390218', 'Serum', 5, 300000, 1500000),
(56, '102-1587746060189493', 'bbc432f7d518d24c80bd8e92e4d5712e', 'Masker', 1, 200000, 200000),
(59, '180-1587923468272727', '', 'Pengering', 5, 20000, 100000),
(62, '180-1587923735553405', '', 'Pengering', 40, 20000, 800000),
(63, '102-1587746233204575', '098109390243', 'Toner', 5, 150000, 750000),
(64, '102-1592623384063707', '098109390243', 'Toner', 5, 150000, 750000),
(65, '102-1587916744774890', '098109390243', 'Toner', 5, 150000, 750000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_patients`
--
ALTER TABLE `master_patients`
  ADD PRIMARY KEY (`patients_id`);

--
-- Indexes for table `master_product`
--
ALTER TABLE `master_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `master_services`
--
ALTER TABLE `master_services`
  ADD PRIMARY KEY (`services_id`);

--
-- Indexes for table `master_staff`
--
ALTER TABLE `master_staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`transaction_detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
