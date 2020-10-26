-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2020 at 06:51 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lumerasystem`
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
  `patients_status` int(11) NOT NULL DEFAULT '1',
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
  `product_stock` int(11) NOT NULL DEFAULT '0',
  `product_status` int(11) NOT NULL DEFAULT '1',
  `created_by` varchar(50) NOT NULL,
  `updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_product`
--

INSERT INTO `master_product` (`product_id`, `product_name`, `product_price`, `product_stock`, `product_status`, `created_by`, `updated_by`) VALUES
('098109390218', 'Serum', 300000, 11, 1, 'NULL', 'NULL'),
('098109390243', 'Toner', 150000, 0, 1, 'NULL', 'NULL'),
('bbc432f7d518d24c80bd8e92e4d5712e', 'Masker', 200000, 0, 0, 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `master_services`
--

CREATE TABLE `master_services` (
  `services_id` varchar(50) NOT NULL,
  `services_name` varchar(200) NOT NULL,
  `services_category` varchar(25) NOT NULL,
  `services_price` int(11) NOT NULL,
  `services_status` int(11) NOT NULL DEFAULT '1',
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
('6', 'Cat Rambut', 'Salon', 890000, 1, 'NULL', 'NULL'),
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
('1', 'John Doe', 'john', 'john', 'Administrator', 1, 'NULL', 'NULL'),
('1c272047233576d77a9b9a1ac', 'Jane Doe', 'jane', 'jane', 'Kasir', 1, 'NULL', 'NULL'),
('2', 'Mimin', 'mimin', 'mimin', 'Kasir', 0, 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` varchar(25) NOT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_amount` int(11) NOT NULL,
  `purchase_type` varchar(20) NOT NULL,
  `purchase_served_by` varchar(25) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `updated_by` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_detail`
--

CREATE TABLE `purchase_detail` (
  `purchase_detail_id` int(11) NOT NULL,
  `purchase_id` varchar(40) NOT NULL,
  `purchase_item` varchar(40) NOT NULL,  `purchase_qty` int(11) NOT NULL,
  `purchase_price` int(11) NOT NULL,
  `purchase_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `purchase_detail`
--
ALTER TABLE `purchase_detail`
  ADD PRIMARY KEY (`purchase_detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `purchase_detail`
--
ALTER TABLE `purchase_detail`
  MODIFY `purchase_detail_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
