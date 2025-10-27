-- phpMyAdmin SQL Dump
-- version 6.0.0-dev+20250420.6e017ef599
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 04, 2025 at 11:38 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `clientId` int NOT NULL,
  `addressType` enum('billing','shipping') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `toName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_general_ci,
  `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pincode` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--


-- --------------------------------------------------------

--
-- Table structure for table `advancedeposits`
--

CREATE TABLE `advancedeposits` (
  `id` int NOT NULL,
  `depositAmount` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `advanceid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advancedeposits`
--


-- --------------------------------------------------------

--
-- Table structure for table `advancedeposittokens`
--

CREATE TABLE `advancedeposittokens` (
  `id` int NOT NULL,
  `advanceid` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advanceexemptions`
--

CREATE TABLE `advanceexemptions` (
  `id` int NOT NULL,
  `uid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advanceexemptions`
--


-- --------------------------------------------------------

--
-- Table structure for table `advanceexpenses`
--

CREATE TABLE `advanceexpenses` (
  `id` int NOT NULL,
  `aid` int NOT NULL,
  `uid` int NOT NULL,
  `amount` decimal(12,2) DEFAULT '0.00',
  `expenseremark` longtext COLLATE utf8mb4_general_ci,
  `nonreimburseamount` decimal(12,2) DEFAULT '0.00',
  `returnAmount` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advanceexpenses`
--


-- --------------------------------------------------------

--
-- Table structure for table `advancelimits`
--

CREATE TABLE `advancelimits` (
  `id` int NOT NULL,
  `amount` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advancelimits`
--


-- --------------------------------------------------------

--
-- Table structure for table `advancemiscexpenses`
--

CREATE TABLE `advancemiscexpenses` (
  `id` int NOT NULL,
  `miscExpense` decimal(12,2) DEFAULT NULL,
  `miscRemark` longtext COLLATE utf8mb4_general_ci,
  `advanceid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advancemiscexpenses`
--


-- --------------------------------------------------------

--
-- Table structure for table `advancerecords`
--

CREATE TABLE `advancerecords` (
  `id` int NOT NULL,
  `advanceAmount` decimal(12,2) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `noOfDays` int NOT NULL,
  `noOfEngineers` int DEFAULT NULL,
  `amountPerDay` decimal(12,2) DEFAULT NULL,
  `totalAccommodationAmount` decimal(12,2) DEFAULT NULL,
  `foodExpense` decimal(12,2) DEFAULT NULL,
  `travelExpense` decimal(12,2) DEFAULT NULL,
  `localConvExpense` decimal(12,2) DEFAULT NULL,
  `stationaryExpense` decimal(12,2) DEFAULT NULL,
  `fuelExpense` decimal(12,2) DEFAULT NULL,
  `vehicleExpense` decimal(12,2) DEFAULT NULL,
  `tollTaxExpense` decimal(12,2) DEFAULT NULL,
  `materialPurchase` decimal(12,2) DEFAULT NULL,
  `approvedAmount` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `finalAmount` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_general_ci,
  `remarkByManager` longtext COLLATE utf8mb4_general_ci,
  `engineerRemarks` decimal(12,2) DEFAULT NULL,
  `dept` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `forceclose` tinyint(1) DEFAULT '0',
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `edited_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `p1Id` int NOT NULL,
  `uid` bigint UNSIGNED NOT NULL,
  `mid` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advancerecords`
--


-- --------------------------------------------------------

--
-- Table structure for table `cancelledinvoicepayments`
--

CREATE TABLE `cancelledinvoicepayments` (
  `id` int NOT NULL,
  `payment` decimal(12,2) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `cancelledinvoiceFkId` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancelledinvoicepayments`
--


-- --------------------------------------------------------

--
-- Table structure for table `cancelledinvoiceproducts`
--

CREATE TABLE `cancelledinvoiceproducts` (
  `id` int NOT NULL,
  `productDescription` text COLLATE utf8mb4_general_ci,
  `uom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hsnCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `unitRate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalAmount` decimal(12,2) DEFAULT NULL,
  `invoiceId` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancelledinvoiceproducts`
--


-- --------------------------------------------------------

--
-- Table structure for table `cancelledinvoices`
--

CREATE TABLE `cancelledinvoices` (
  `p2Id` int NOT NULL,
  `clientId` int DEFAULT NULL,
  `billingAddressId` int DEFAULT NULL,
  `shippingAddressId` int DEFAULT NULL,
  `invoiceNumber` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceDate` date DEFAULT NULL,
  `poNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `poDate` date DEFAULT NULL,
  `vendorCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceSubmit` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceDispatch` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceDispatchDetails` longtext COLLATE utf8mb4_general_ci,
  `paymentDetails` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `partOrFullPayment` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `anyDeductByCustomer` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deductionReason` longtext COLLATE utf8mb4_general_ci,
  `amountDeducted` decimal(12,2) DEFAULT NULL,
  `remark` longtext COLLATE utf8mb4_general_ci,
  `clientGst` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` int DEFAULT NULL,
  `gstNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `panNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reverseCharge` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transportMode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicleNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateOfSupply` date DEFAULT NULL,
  `placeOfSupply` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kindAttn` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contactNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customTC` text COLLATE utf8mb4_general_ci,
  `csgst` int DEFAULT NULL,
  `igst` int DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `roff` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalBeforeTax` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalAfterTax` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceType` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `projectsFkId` int DEFAULT NULL,
  `proformaId` int DEFAULT NULL,
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cancelledinvoices`
--


-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `clientGst` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--


-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoiceproducts`
--

CREATE TABLE `invoiceproducts` (
  `id` int NOT NULL,
  `productDescription` text COLLATE utf8mb4_general_ci,
  `uom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hsnCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `unitRate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalAmount` decimal(12,2) DEFAULT NULL,
  `invoiceId` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoiceproducts`
--


-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `p2Id` int NOT NULL,
  `clientId` int DEFAULT NULL,
  `billingAddressId` int DEFAULT NULL,
  `shippingAddressId` int DEFAULT NULL,
  `invoiceNumber` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceDate` date DEFAULT NULL,
  `poNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `poDate` date DEFAULT NULL,
  `vendorCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceSubmit` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceDispatch` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceDispatchDetails` longtext COLLATE utf8mb4_general_ci,
  `paymentDetails` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `partOrFullPayment` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `anyDeductByCustomer` varchar(3) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deductionReason` longtext COLLATE utf8mb4_general_ci,
  `amountDeducted` decimal(12,2) DEFAULT NULL,
  `remark` longtext COLLATE utf8mb4_general_ci,
  `clientGst` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` int DEFAULT NULL,
  `gstNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `panNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reverseCharge` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transportMode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicleNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateOfSupply` date DEFAULT NULL,
  `placeOfSupply` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kindAttn` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contactNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customTC` text COLLATE utf8mb4_general_ci,
  `csgst` int DEFAULT NULL,
  `igst` int DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `roff` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalBeforeTax` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalAfterTax` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceType` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `projectsFkId` int DEFAULT NULL,
  `proformaId` int DEFAULT NULL,
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `isCancelled` tinyint(1) NOT NULL DEFAULT '0',
  `cancelledId` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--


-- --------------------------------------------------------

--
-- Table structure for table `miscadvancedeposits`
--

CREATE TABLE `miscadvancedeposits` (
  `id` int NOT NULL,
  `depositAmount` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `miscadvanceid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `miscadvancedeposits`
--


-- --------------------------------------------------------

--
-- Table structure for table `miscadvancedeposittokens`
--

CREATE TABLE `miscadvancedeposittokens` (
  `id` int NOT NULL,
  `miscadvanceid` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `miscadvanceexpenses`
--

CREATE TABLE `miscadvanceexpenses` (
  `id` int NOT NULL,
  `aid` int NOT NULL,
  `uid` int NOT NULL,
  `amount` decimal(12,2) DEFAULT '0.00',
  `expenseremark` longtext COLLATE utf8mb4_general_ci,
  `nonreimburseamount` decimal(12,2) DEFAULT '0.00',
  `returnAmount` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `miscadvanceexpenses`
--


-- --------------------------------------------------------

--
-- Table structure for table `miscadvancerequests`
--

CREATE TABLE `miscadvancerequests` (
  `id` int NOT NULL,
  `siteLocation` longtext COLLATE utf8mb4_general_ci,
  `customer` longtext COLLATE utf8mb4_general_ci,
  `endCustomer` longtext COLLATE utf8mb4_general_ci,
  `workDescription` longtext COLLATE utf8mb4_general_ci,
  `advanceAmount` decimal(12,2) DEFAULT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `noOfDays` int NOT NULL,
  `noOfEngineers` int DEFAULT NULL,
  `amountPerDay` decimal(12,2) DEFAULT NULL,
  `totalAccommodationAmount` decimal(12,2) DEFAULT NULL,
  `foodExpense` decimal(12,2) DEFAULT NULL,
  `travelExpense` decimal(12,2) DEFAULT NULL,
  `localConvExpense` decimal(12,2) DEFAULT NULL,
  `stationaryExpense` decimal(12,2) DEFAULT NULL,
  `fuelExpense` decimal(12,2) DEFAULT NULL,
  `vehicleExpense` decimal(12,2) DEFAULT NULL,
  `tollTaxExpense` decimal(12,2) DEFAULT NULL,
  `materialPurchase` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `approvedAmount` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `finalAmount` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` longtext COLLATE utf8mb4_general_ci,
  `remarkByManager` longtext COLLATE utf8mb4_general_ci,
  `engineerRemarks` decimal(12,2) DEFAULT NULL,
  `dept` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `forceclose` tinyint(1) DEFAULT '0',
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `edited_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint UNSIGNED NOT NULL,
  `mid` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `miscadvancerequests`
--


-- --------------------------------------------------------

--
-- Table structure for table `miscmiscexpenses`
--

CREATE TABLE `miscmiscexpenses` (
  `id` int NOT NULL,
  `miscExpense` decimal(12,2) DEFAULT NULL,
  `miscRemark` longtext COLLATE utf8mb4_general_ci,
  `miscadvanceid` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `miscmiscexpenses`
--


-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `payment` decimal(12,2) DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `invoiceFkId` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--


-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proformaproducts`
--

CREATE TABLE `proformaproducts` (
  `id` int NOT NULL,
  `productDescription` text COLLATE utf8mb4_general_ci,
  `uom` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hsnCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `unitRate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalAmount` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `proformaId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proformaproducts`
--


-- --------------------------------------------------------

--
-- Table structure for table `proformas`
--

CREATE TABLE `proformas` (
  `id` int NOT NULL,
  `clientId` int DEFAULT NULL,
  `billingAddressId` int DEFAULT NULL,
  `shippingAddressId` int DEFAULT NULL,
  `invoiceNumber` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceDate` date DEFAULT NULL,
  `poNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `poDate` date DEFAULT NULL,
  `vendorCode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` longtext COLLATE utf8mb4_general_ci,
  `code` int DEFAULT NULL,
  `gstNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `panNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reverseCharge` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transportMode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vehicleNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dateOfSupply` date DEFAULT NULL,
  `placeOfSupply` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kindAttn` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contactNo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customTC` text COLLATE utf8mb4_general_ci,
  `csgst` int DEFAULT NULL,
  `igst` int DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `roff` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalBeforeTax` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `totalAfterTax` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invoiceType` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `projectsFkId` int DEFAULT NULL,
  `taxinvoiceId` int DEFAULT NULL,
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proformas`
--


-- --------------------------------------------------------

--
-- Table structure for table `projectassigns`
--

CREATE TABLE `projectassigns` (
  `paId` int NOT NULL,
  `p1Id` int NOT NULL,
  `id` bigint UNSIGNED NOT NULL,
  `activeOnProject` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectassigns`
--


-- --------------------------------------------------------

--
-- Table structure for table `projectcounters`
--

CREATE TABLE `projectcounters` (
  `counterId` int NOT NULL,
  `projectNumber` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectcounters`
--


-- --------------------------------------------------------

--
-- Table structure for table `projectremarks`
--

CREATE TABLE `projectremarks` (
  `id` int NOT NULL,
  `pid` int NOT NULL,
  `uid` bigint UNSIGNED NOT NULL,
  `engineerRemarks` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectremarks`
--


-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `projectNo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `projectType` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `siteIncharge` longtext COLLATE utf8mb4_general_ci,
  `siteInchargeEmail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` longtext COLLATE utf8mb4_general_ci,
  `workDescription` longtext COLLATE utf8mb4_general_ci,
  `customer` longtext COLLATE utf8mb4_general_ci,
  `endCustomer` longtext COLLATE utf8mb4_general_ci,
  `customerContactName` longtext COLLATE utf8mb4_general_ci,
  `customerDetail` longtext COLLATE utf8mb4_general_ci,
  `scopeOfWork` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `challanOut` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `challanIn` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mom` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `feedbackForm` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `projectPoDate` date DEFAULT NULL,
  `testReportPrepared` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `testReportDispatch` longtext COLLATE utf8mb4_general_ci,
  `testReportDelivered` longtext COLLATE utf8mb4_general_ci,
  `projectValue` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `projectCompleted` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `followuptaken` varchar(2) COLLATE utf8mb4_general_ci DEFAULT '0',
  `invoiceIssued` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `momDate` date DEFAULT NULL,
  `uid` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `edited_by` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--


-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` bigint NOT NULL,
  `token` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `uid` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `deleteStatus` tinyint(1) NOT NULL DEFAULT '0',
  `pmsaccess` int NOT NULL DEFAULT '1',
  `customAdvanceLimit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--


-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `user_id` bigint UNSIGNED NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_permissions`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ClientsAddresses` (`clientId`);

--
-- Indexes for table `advancedeposits`
--
ALTER TABLE `advancedeposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advanceid` (`advanceid`);

--
-- Indexes for table `advancedeposittokens`
--
ALTER TABLE `advancedeposittokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advanceexemptions`
--
ALTER TABLE `advanceexemptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advanceexpenses`
--
ALTER TABLE `advanceexpenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advancelimits`
--
ALTER TABLE `advancelimits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advancemiscexpenses`
--
ALTER TABLE `advancemiscexpenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advanceid` (`advanceid`);

--
-- Indexes for table `advancerecords`
--
ALTER TABLE `advancerecords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advance_record_ibfk_1` (`p1Id`),
  ADD KEY `advance_record_ibfk_2` (`uid`),
  ADD KEY `fk_advancerecords_mid` (`mid`);

--
-- Indexes for table `cancelledinvoicepayments`
--
ALTER TABLE `cancelledinvoicepayments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cancelledinvoiceFkId` (`cancelledinvoiceFkId`);

--
-- Indexes for table `cancelledinvoiceproducts`
--
ALTER TABLE `cancelledinvoiceproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancelledinvoiceproducts_ibfk_1` (`invoiceId`),
  ADD KEY `id` (`id`,`invoiceId`);

--
-- Indexes for table `cancelledinvoices`
--
ALTER TABLE `cancelledinvoices`
  ADD PRIMARY KEY (`p2Id`),
  ADD KEY `cancelledinvoicesFK_projectsFkId` (`projectsFkId`),
  ADD KEY `cancelledinvoicesFK_clientsFkId` (`clientId`),
  ADD KEY `cancelledinvoices_ibfk_1` (`billingAddressId`),
  ADD KEY `cancelledinvoices_ibfk_2` (`shippingAddressId`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoiceproducts`
--
ALTER TABLE `invoiceproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoiceproducts_ibfk_1` (`invoiceId`),
  ADD KEY `id` (`id`,`invoiceId`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`p2Id`),
  ADD KEY `FK_projectsFkId` (`projectsFkId`),
  ADD KEY `FK_clientsFkId` (`clientId`),
  ADD KEY `invoices_ibfk_1` (`billingAddressId`),
  ADD KEY `invoices_ibfk_2` (`shippingAddressId`);

--
-- Indexes for table `miscadvancedeposits`
--
ALTER TABLE `miscadvancedeposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miscadvanceid` (`miscadvanceid`);

--
-- Indexes for table `miscadvancedeposittokens`
--
ALTER TABLE `miscadvancedeposittokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miscadvanceexpenses`
--
ALTER TABLE `miscadvanceexpenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miscadvancerequests`
--
ALTER TABLE `miscadvancerequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advance_record_ibfk_2` (`uid`),
  ADD KEY `fk_miscAdvanceRequests_mid` (`mid`);

--
-- Indexes for table `miscmiscexpenses`
--
ALTER TABLE `miscmiscexpenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miscadvanceid` (`miscadvanceid`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_invoiceFkId` (`invoiceFkId`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `proformaproducts`
--
ALTER TABLE `proformaproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proformaproducts_ibfk_1` (`proformaId`);

--
-- Indexes for table `proformas`
--
ALTER TABLE `proformas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_projectsFkId_proforma` (`projectsFkId`),
  ADD KEY `FK_clientsFkId_proforma` (`clientId`),
  ADD KEY `billingAddressId` (`billingAddressId`),
  ADD KEY `shippingAddressId` (`shippingAddressId`);

--
-- Indexes for table `projectassigns`
--
ALTER TABLE `projectassigns`
  ADD PRIMARY KEY (`paId`),
  ADD KEY `project_assigned_ibfk_1` (`p1Id`),
  ADD KEY `project_assigned_ibfk_2` (`id`);

--
-- Indexes for table `projectcounters`
--
ALTER TABLE `projectcounters`
  ADD PRIMARY KEY (`counterId`);

--
-- Indexes for table `projectremarks`
--
ALTER TABLE `projectremarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projectremarks_ibfk_1` (`pid`),
  ADD KEY `projectremarks_ibfk_2` (`uid`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `advancedeposits`
--
ALTER TABLE `advancedeposits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `advancedeposittokens`
--
ALTER TABLE `advancedeposittokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `advanceexemptions`
--
ALTER TABLE `advanceexemptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advanceexpenses`
--
ALTER TABLE `advanceexpenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `advancelimits`
--
ALTER TABLE `advancelimits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advancemiscexpenses`
--
ALTER TABLE `advancemiscexpenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `advancerecords`
--
ALTER TABLE `advancerecords`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `cancelledinvoicepayments`
--
ALTER TABLE `cancelledinvoicepayments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cancelledinvoiceproducts`
--
ALTER TABLE `cancelledinvoiceproducts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `cancelledinvoices`
--
ALTER TABLE `cancelledinvoices`
  MODIFY `p2Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoiceproducts`
--
ALTER TABLE `invoiceproducts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `p2Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `miscadvancedeposits`
--
ALTER TABLE `miscadvancedeposits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `miscadvancedeposittokens`
--
ALTER TABLE `miscadvancedeposittokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `miscadvanceexpenses`
--
ALTER TABLE `miscadvanceexpenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `miscadvancerequests`
--
ALTER TABLE `miscadvancerequests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `miscmiscexpenses`
--
ALTER TABLE `miscmiscexpenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proformaproducts`
--
ALTER TABLE `proformaproducts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proformas`
--
ALTER TABLE `proformas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projectassigns`
--
ALTER TABLE `projectassigns`
  MODIFY `paId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `projectcounters`
--
ALTER TABLE `projectcounters`
  MODIFY `counterId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `projectremarks`
--
ALTER TABLE `projectremarks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK_ClientsAddresses` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `advancedeposits`
--
ALTER TABLE `advancedeposits`
  ADD CONSTRAINT `advancedeposits_ibfk_1` FOREIGN KEY (`advanceid`) REFERENCES `advancerecords` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `advancemiscexpenses`
--
ALTER TABLE `advancemiscexpenses`
  ADD CONSTRAINT `advancemiscexpenses_ibfk_2` FOREIGN KEY (`advanceid`) REFERENCES `advancerecords` (`id`);

--
-- Constraints for table `advancerecords`
--
ALTER TABLE `advancerecords`
  ADD CONSTRAINT `advancerecords_ibfk_1` FOREIGN KEY (`p1Id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `advancerecords_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_advancerecords_mid` FOREIGN KEY (`mid`) REFERENCES `users` (`id`);

--
-- Constraints for table `cancelledinvoicepayments`
--
ALTER TABLE `cancelledinvoicepayments`
  ADD CONSTRAINT `FK_cancelledinvoiceFkId` FOREIGN KEY (`cancelledinvoiceFkId`) REFERENCES `cancelledinvoices` (`p2Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cancelledinvoiceproducts`
--
ALTER TABLE `cancelledinvoiceproducts`
  ADD CONSTRAINT `cancelledinvoiceproducts_ibfk_1` FOREIGN KEY (`invoiceId`) REFERENCES `cancelledinvoices` (`p2Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cancelledinvoices`
--
ALTER TABLE `cancelledinvoices`
  ADD CONSTRAINT `cancelledinvoices_ibfk_1` FOREIGN KEY (`billingAddressId`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cancelledinvoices_ibfk_2` FOREIGN KEY (`shippingAddressId`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cancelledinvoicesFK_clientsFkId` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cancelledinvoicesFK_projectsFkId` FOREIGN KEY (`projectsFkId`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoiceproducts`
--
ALTER TABLE `invoiceproducts`
  ADD CONSTRAINT `invoiceproducts_ibfk_1` FOREIGN KEY (`invoiceId`) REFERENCES `invoices` (`p2Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `FK_clientsFkId` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_projectsFkId` FOREIGN KEY (`projectsFkId`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`billingAddressId`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`shippingAddressId`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `miscadvancedeposits`
--
ALTER TABLE `miscadvancedeposits`
  ADD CONSTRAINT `miscadvancedeposits_ibfk_1` FOREIGN KEY (`miscadvanceid`) REFERENCES `miscadvancerequests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `miscadvancerequests`
--
ALTER TABLE `miscadvancerequests`
  ADD CONSTRAINT `fk_miscAdvanceRequests_mid` FOREIGN KEY (`mid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `miscAdvanceRequests_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `miscmiscexpenses`
--
ALTER TABLE `miscmiscexpenses`
  ADD CONSTRAINT `miscmiscexpenses_ibfk_2` FOREIGN KEY (`miscadvanceid`) REFERENCES `miscadvancerequests` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK_invoiceFkId` FOREIGN KEY (`invoiceFkId`) REFERENCES `invoices` (`p2Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proformaproducts`
--
ALTER TABLE `proformaproducts`
  ADD CONSTRAINT `proformaproducts_ibfk_1` FOREIGN KEY (`proformaId`) REFERENCES `proformas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proformas`
--
ALTER TABLE `proformas`
  ADD CONSTRAINT `FK_clientsFkId_proforma` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_projectsFkId_proforma` FOREIGN KEY (`projectsFkId`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proformas_ibfk_1` FOREIGN KEY (`billingAddressId`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `proformas_ibfk_2` FOREIGN KEY (`shippingAddressId`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `projectassigns`
--
ALTER TABLE `projectassigns`
  ADD CONSTRAINT `projectassigns_ibfk_1` FOREIGN KEY (`p1Id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projectassigns_ibfk_2` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projectremarks`
--
ALTER TABLE `projectremarks`
  ADD CONSTRAINT `projectremarks_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projectremarks_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
