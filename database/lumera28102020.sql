-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2020 at 11:20 AM
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
('PRD76692911000000', 'Toner', 200000, 5, 1, 'NULL', 'NULL');

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
  `created_by` varchar(40) NOT NULL,
  `updated_by` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `transaction_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
