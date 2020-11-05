-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 05:49 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
('PRD3828541000000', 'Obeng', 50000, 10, 1, 'NULL', 'NULL'),
('PRD76692911000000', 'Toners', 200000, 5, 1, 'NULL', 'NULL');

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
('SER63672341000000', 'Kritings', 'Salon', 100000, 1, 'NULL', 'NULL');

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
  `transaction_name` varchar(100) NOT NULL,
  `transaction_created_date` date DEFAULT NULL,
  `transaction_updated_date` date DEFAULT NULL,
  `transaction_fixed_date` date DEFAULT NULL,
  `transaction_amount` int(11) NOT NULL,
  `transaction_type` varchar(20) NOT NULL,
  `transaction_status` int(11) DEFAULT 0,
  `transaction_disc` int(11) NOT NULL,
  `transaction_served_by` varchar(25) NOT NULL,
  `transaction_switch` varchar(100) NOT NULL,
  `created_by` varchar(40) NOT NULL,
  `updated_by` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_name`, `transaction_created_date`, `transaction_updated_date`, `transaction_fixed_date`, `transaction_amount`, `transaction_type`, `transaction_status`, `transaction_disc`, `transaction_served_by`, `transaction_switch`, `created_by`, `updated_by`) VALUES
('TRX16439651000000', 'IMAN', '2020-11-04', '2020-11-04', '2020-11-04', 50000, 'TRX', 200, 150000, '', 'Tunai', 'NULL', 'NULL'),
('TRX1891481000000', 'IRA', '2020-11-04', '2020-11-04', '2020-11-04', 50000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX21345171000000', 'IRA', '2020-11-04', '2020-11-04', '2020-11-04', 90000, 'TRX', 200, 10000, '', 'Tunai', 'NULL', 'NULL'),
('TRX27875411000000', 'CHRISDITYRA LENGKEY', '2020-11-04', '2020-11-04', '2020-11-04', 450000, 'TRX', 200, 50000, '', 'Tunai', 'NULL', 'NULL'),
('TRX28397201000000', 'MICHELL', '2020-11-04', '2020-11-04', '2020-11-04', 30000, 'TRX', 200, 20000, '', 'Tunai', 'NULL', 'NULL'),
('TRX28658371000000', 'TES', '2020-11-04', '2020-11-04', '2020-11-04', 200000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX32875341000000', 'IRA', '2020-11-04', '2020-11-04', '2020-11-04', 150000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX33942511000000', 'TS', '2020-11-04', '2020-11-04', '2020-11-04', 100000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX4047961000000', 'IMAN', '2020-11-04', '2020-11-04', '2020-11-04', 200000, 'TRX', 200, 50000, '', 'Tunai', 'NULL', 'NULL'),
('TRX4461251000000', 'IRA', '2020-11-04', '2020-11-04', '2020-11-04', 300000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX47818461000000', 'CLEONART', '2020-11-04', '2020-11-04', '2020-11-04', 100000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX49181791000000', 'TES', '2020-11-01', '2020-11-01', '2020-11-01', 200000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX60190981000000', 'IRA', '2020-11-04', '2020-11-04', '2020-11-04', 300000, 'TRX', 200, 500000, '', 'Tunai', 'NULL', 'NULL'),
('TRX62838031000000', 'CLEONART', '2020-11-01', '2020-11-01', '2020-11-09', 300000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX6413501000000', 'CLEONART', '2020-10-30', '2020-10-30', '2020-10-30', 180000, 'TRX', 200, 20000, '', 'Tunai', 'NULL', 'NULL'),
('TRX69424751000000', 'TES', '2020-11-04', '2020-11-04', '2020-11-04', 200000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX70946151000000', 'STEVEN', '2020-11-04', '2020-11-04', '2020-11-04', 40000, 'TRX', 200, 10000, '', 'Tunai', 'NULL', 'NULL'),
('TRX72192681000000', 'CHRISDITYRA LENGKEY', '2020-11-01', '2020-11-01', '2020-11-01', 600000, 'TRX', 200, 0, '', 'Tunai', 'NULL', 'NULL'),
('TRX75359021000000', 'DEREK', '2020-11-04', '2020-11-04', '2020-11-04', 50000, 'TRX', 200, 50000, '', 'Tunai', 'NULL', 'NULL'),
('TRX76944521000000', 'IRA', '2020-11-04', '2020-11-04', '2020-11-04', 200000, 'TRX', 200, 50000, '', 'Tunai', 'NULL', 'NULL'),
('TRX82443281000000', 'IRA', '2020-11-04', '2020-11-04', '2020-11-04', 200000, 'TRX', 200, 50000, '', 'Tunai', 'NULL', 'NULL');

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
  `transaction_item_category` varchar(100) NOT NULL,
  `transaction_price` int(11) NOT NULL,
  `transaction_total` int(11) NOT NULL,
  `transaction_handler` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`transaction_detail_id`, `transaction_id`, `transaction_item_id`, `transaction_item`, `transaction_qty`, `transaction_item_category`, `transaction_price`, `transaction_total`, `transaction_handler`) VALUES
(119, 'TRX6413501000000', 'PRD76692911000000', 'Toners', 1, 'Produk', 200000, 200000, ''),
(120, 'TRX62838031000000', 'SER63672341000000', 'Kritings', 1, 'Layanan Salon', 100000, 100000, 'STF17990901000000'),
(121, 'TRX62838031000000', 'PRD76692911000000', 'Toners', 1, 'Produk', 200000, 200000, ''),
(122, 'TRX72192681000000', 'PRD76692911000000', 'Toners', 3, 'Produk', 200000, 600000, ''),
(123, 'TRX49181791000000', 'PRD76692911000000', 'Toners', 1, 'Produk', 200000, 200000, ''),
(124, 'TRX47818461000000', 'SER63672341000000', 'Kritings', 1, 'Layanan Salon', 100000, 100000, 'STF17990901000000'),
(126, 'TRX28658371000000', 'PRD76692911000000', 'Toners', 1, 'Produk', 200000, 200000, ''),
(128, 'TRX21345171000000', 'SER63672341000000', 'Kritings', 1, 'Layanan Salon', 100000, 100000, 'STF17990901000000'),
(129, 'TRX33942511000000', 'SER63672341000000', 'Kritings', 1, 'Layanan Salon', 100000, 100000, 'STF79743241000000'),
(130, 'TRX27875411000000', 'SER63672341000000', 'Kritings', 1, 'Layanan Salon', 100000, 100000, 'STF79743241000000'),
(131, 'TRX27875411000000', 'PRD76692911000000', 'Toners', 2, 'Produk', 200000, 400000, ''),
(132, 'TRX16439651000000', 'PRD76692911000000', 'Toners', 1, 'Produk', 200000, 200000, ''),
(133, 'TRX75359021000000', 'PRD3828541000000', 'Obeng', 2, 'Produk', 50000, 100000, ''),
(134, 'TRX4047961000000', 'PRD3828541000000', 'Obeng', 5, 'Produk', 50000, 250000, ''),
(135, 'TRX60190981000000', 'SER63672341000000', 'Kritings', 1, 'Layanan Salon', 100000, 100000, 'STF17990901000000'),
(136, 'TRX60190981000000', 'PRD3828541000000', 'Obeng', 2, 'Produk', 50000, 100000, ''),
(137, 'TRX60190981000000', 'PRD76692911000000', 'Toners', 3, 'Produk', 200000, 600000, ''),
(138, 'TRX4461251000000', 'SER63672341000000', 'Kritings', 1, 'Layanan Salon', 100000, 100000, 'STF79743241000000'),
(139, 'TRX4461251000000', 'PRD76692911000000', 'Toners', 1, 'Produk', 200000, 200000, ''),
(140, 'TRX76944521000000', 'PRD3828541000000', 'Obeng', 5, 'Produk', 50000, 250000, ''),
(141, 'TRX32875341000000', 'PRD3828541000000', 'Obeng', 3, 'Produk', 50000, 150000, ''),
(142, 'TRX70946151000000', 'PRD3828541000000', 'Obeng', 1, 'Produk', 50000, 50000, ''),
(143, 'TRX28397201000000', 'PRD3828541000000', 'Obeng', 1, 'Produk', 50000, 50000, ''),
(144, 'TRX69424751000000', 'PRD76692911000000', 'Toners', 1, 'Produk', 200000, 200000, ''),
(145, 'TRX1891481000000', 'PRD3828541000000', 'Obeng', 1, 'Produk', 50000, 50000, ''),
(146, 'TRX82443281000000', 'PRD3828541000000', 'Obeng', 5, 'Produk', 50000, 250000, '');

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
  MODIFY `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
