-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2025 at 08:49 AM
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
-- Database: `epanchayat`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_by` varchar(100) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `title`, `description`, `file_path`, `uploaded_by`, `uploaded_at`) VALUES
(3, 'government schools', 'Govt. school building constructed in 2025', 'uploads/1747061365_school_const.pdf', 'vijay', '2025-05-12 14:49:25'),
(4, 'Solar Panel Units	', 'Solar panels installed for street lighting', 'uploads/1747061384_solar_plan.pdf', 'vijay', '2025-05-12 14:49:44');

-- --------------------------------------------------------

--
-- Table structure for table `certificate_requests`
--

CREATE TABLE `certificate_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `certificate_type` varchar(50) NOT NULL,
  `purpose` text NOT NULL,
  `request_date` datetime DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Pending',
  `issued` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `certificate_requests`
--

INSERT INTO `certificate_requests` (`id`, `user_id`, `certificate_type`, `purpose`, `request_date`, `status`, `issued`) VALUES
(11, 9, 'Income', 'i need income certificate for my college admission', '2025-05-13 00:00:00', 'Pending', NULL),
(18, 9, 'ews certificate', 'educational purpose', '2025-05-13 22:13:03', 'Pending', 0);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('Pending','Resolved') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `user_id`, `subject`, `message`, `status`, `created_at`) VALUES
(6, 10, 'Broken Bridge', 'The small bridge near the market is broken and dangerous.', 'Resolved', '2025-05-09 07:42:25'),
(7, 9, 'No Drainage', 'Water logging due to blocked drains in our street.', 'Pending', '2025-05-09 07:42:25'),
(10, 9, 'street light issue', 'due to less number of street lights night travelling has become an issue of concern', 'Pending', '2025-05-13 13:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submit_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','resolved','closed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `title`, `message`, `submit_date`, `status`) VALUES
(13, 9, 'Website Bug Report', 'The form submission button is not working. Please fix it.', '2025-05-07 14:30:00', 'resolved'),
(14, 10, 'Website Bug Report', 'The form submission button is not working. Please fix it.', '2025-05-07 14:30:00', 'closed'),
(16, 12, 'resolve the bug', 'the website has bug during login fix it at earliest', '2025-05-13 19:49:16', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `publish_date` datetime DEFAULT current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `description`, `publish_date`, `status`) VALUES
(1, 'Important Community Meeting', 'Join us for an important community meeting to discuss upcoming projects and initiatives. Your participation is vital!', '2025-05-07 10:00:00', 'inactive'),
(2, 'Health Camp Announcement', 'Free health check-up and vaccination camp will be held on 10th May, 2025. Please mark your calendars.', '2025-05-06 09:00:00', 'active'),
(3, 'New Road Construction', 'Construction of the new road in the northern part of the village will begin on 15th May, 2025. Please be aware of potential traffic disruptions.', '2025-05-05 14:00:00', 'inactive'),
(4, 'Water Supply Maintenance', 'Scheduled maintenance of the water supply system will take place from 20th May to 22nd May. Expect intermittent water supply.', '2025-05-04 16:00:00', 'active'),
(5, 'School Admissions Open', 'Admissions for the new academic year are now open at the village school. Visit the school office for more details.', '2025-05-03 11:30:00', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `report_title` varchar(255) NOT NULL,
  `report_type` enum('manual') NOT NULL,
  `content` text NOT NULL,
  `generated_by` varchar(255) DEFAULT NULL,
  `generate_date` datetime DEFAULT current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active',
  `report_period` date DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `report_title`, `report_type`, `content`, `generated_by`, `generate_date`, `status`, `report_period`, `file_url`) VALUES
(3, 'Village Water Usage', 'manual', 'Water usage report compiled by staff.', 'staff_ravi', '2025-05-12 19:59:23', 'active', '0000-00-00', ''),
(4, 'Census Summary Report', 'manual', 'Census data for current year.', 'staff_vijay', '2025-05-12 19:59:23', 'active', '0000-00-00', 'uploads/census_2024.pdf'),
(5, 'Death & Birth Statistics', '', 'Automated report for births and deaths registered.', NULL, '2025-05-12 19:59:23', 'active', '0000-00-00', 'uploads/statistics_q1_2025.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `schemes`
--

CREATE TABLE `schemes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `eligibility` text NOT NULL,
  `last_date` date DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schemes`
--

INSERT INTO `schemes` (`id`, `name`, `description`, `eligibility`, `last_date`, `status`) VALUES
(1, 'PM Awas Yojana', 'Provides affordable housing to urban and rural poor.', 'Low-income families without a permanent house.', '2025-12-31', 'inactive'),
(2, 'MNREGA', 'Guarantees 100 days of wage employment to rural households.', 'Adult members of rural households willing to do unskilled manual work.', '2025-12-31', 'active'),
(3, 'PM Kisan Samman Nidhi', 'Provides ₹6000 per year to small and marginal farmers.', 'All farmers owning up to 2 hectares of land.', '2025-12-31', 'active'),
(4, 'Ujjwala Yojana', 'Provides LPG connections to women from BPL households.', 'Women from below-poverty-line (BPL) families.', '2025-12-31', 'active'),
(5, 'Ayushman Bharat', 'Health insurance of ₹5 lakh for secondary and tertiary care.', 'Poor and vulnerable families as per SECC database.', '2025-12-31', 'active'),
(6, 'Digital India Mission', 'Transform India into a digitally empowered society.', 'Open to all citizens.', '2025-12-31', 'active'),
(7, 'PM Fasal Bima Yojana', 'Crop insurance for farmers against natural calamities.', 'All farmers growing notified crops.', '2025-12-31', 'active'),
(8, 'Stand-Up India', 'Loans for SC/ST and women entrepreneurs.', 'SC/ST or women above 18 years starting a business.', '2025-12-31', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `scheme_applications`
--

CREATE TABLE `scheme_applications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `scheme_name` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `documents` text DEFAULT NULL,
  `status` enum('pending','approved','rejected','more_info') DEFAULT 'pending',
  `remarks` text DEFAULT NULL,
  `submitted_at` datetime DEFAULT current_timestamp(),
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scheme_applications`
--

INSERT INTO `scheme_applications` (`id`, `user_id`, `scheme_name`, `details`, `documents`, `status`, `remarks`, `submitted_at`, `assigned_to`) VALUES
(1, 10, 'Widow Pension', 'Widow aged 45 requesting pension.', 'doc2.pdf', 'approved', 'amount will be in the account from next month', '2025-05-13 14:01:51', 13),
(2, 10, 'Student Scholarship', 'Scholarship for higher secondary student.', 'doc3.pdf', 'approved', 'Eligible and documents verified.', '2025-05-13 14:01:51', 12),
(3, 9, 'Housing Scheme', 'Low income family requesting house construction support.', 'doc4.pdf', 'rejected', 'Income proof missing.', '2025-05-13 14:01:51', 12),
(4, 9, 'Kisan Yojana', 'Farmer requesting subsidy on irrigation equipment.', 'doc5.pdf', 'more_info', 'Need land ownership proof.', '2025-05-13 14:01:51', 12),
(6, 9, 'Stand-Up India', 'i am women & i want to do business so i need financial assistance', NULL, 'pending', NULL, '2025-05-13 23:30:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `special_codes`
--

CREATE TABLE `special_codes` (
  `id` int(11) NOT NULL,
  `role` enum('admin','staff') NOT NULL,
  `code` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `special_codes`
--

INSERT INTO `special_codes` (`id`, `role`, `code`) VALUES
(1, 'admin', 'ADMIN123'),
(2, 'staff', 'STAFF456');

-- --------------------------------------------------------

--
-- Table structure for table `submitted_documents`
--

CREATE TABLE `submitted_documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `certificate_request_id` int(11) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `status` enum('Pending','Verified','Rejected') DEFAULT 'Pending',
  `remarks` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submitted_documents`
--

INSERT INTO `submitted_documents` (`id`, `user_id`, `certificate_request_id`, `doc_type`, `file_path`, `status`, `remarks`, `submitted_at`) VALUES
(10, 9, NULL, 'aadhar ', 'uploads/documents/1747152860_adhar.pdf', 'Pending', '', '2025-05-13 16:14:20'),
(12, 9, 13, 'aadhar', 'uploads/documents/1747153402_sampledata.pdf', 'Pending', '', '2025-05-13 16:23:22'),
(17, 9, NULL, 'Certificate', 'uploads/adhar.pdf', 'Pending', NULL, '2025-05-13 16:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `tax_payments`
--

CREATE TABLE `tax_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tax_type_id` int(11) NOT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `method` varchar(50) DEFAULT NULL,
  `receipt_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tax_payments`
--

INSERT INTO `tax_payments` (`id`, `user_id`, `tax_type_id`, `amount_paid`, `payment_date`, `method`, `receipt_no`) VALUES
(1, 9, 1, 2500.00, '2025-05-14 01:56:57', 'Bank Transfer', 'RPT20250513-3674'),
(2, 9, 2, 500.00, '2025-05-13 00:00:00', 'online', 'RCPT1747169686'),
(6, 10, 1, 500.00, '2025-05-13 00:00:00', 'online', 'RCPT1747170053'),
(7, 10, 2, 900.00, '2025-05-13 00:00:00', 'cash', 'RCPT1747170118');

-- --------------------------------------------------------

--
-- Table structure for table `tax_types`
--

CREATE TABLE `tax_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` decimal(10,2) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tax_types`
--

INSERT INTO `tax_types` (`id`, `name`, `rate`, `unit`, `status`) VALUES
(1, 'Property Tax', 50.00, 'per sq.ft.', 'active'),
(2, 'Land Tax', 5.00, 'per sq.ft.', 'active'),
(3, 'Water Tax', 100.00, 'per month', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `role` enum('user','admin','staff') NOT NULL DEFAULT 'user',
  `village` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `aadhaar` varchar(20) NOT NULL,
  `special_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `PASSWORD`, `role`, `village`, `mobile`, `aadhaar`, `special_code`) VALUES
(8, 'ram', '2324@ram', 'admin', 'abc', '', '', NULL),
(9, 'janaki', '98865@jaa', 'user', 'abc', '98865192777', '342567589087', NULL),
(10, 'radha', '6364', 'user', 'abc', '', '', NULL),
(12, 'vijay', '090807', 'staff', 'abc', '', '', NULL),
(13, 'raksha', '6768', 'staff', 'abc', '7878656545', '232456097867', 'STAFF456');

-- --------------------------------------------------------

--
-- Table structure for table `user_tax_details`
--

CREATE TABLE `user_tax_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tax_type_id` int(11) NOT NULL,
  `amount_due` decimal(10,2) NOT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('unpaid','paid') DEFAULT 'unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tax_details`
--

INSERT INTO `user_tax_details` (`id`, `user_id`, `tax_type_id`, `amount_due`, `due_date`, `status`) VALUES
(2, 9, 1, 2500.00, '2025-06-01', 'paid'),
(3, 9, 3, 200.00, '2025-06-01', 'unpaid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feedback_ibfk_1` (`user_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schemes`
--
ALTER TABLE `schemes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scheme_applications`
--
ALTER TABLE `scheme_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_codes`
--
ALTER TABLE `special_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `submitted_documents`
--
ALTER TABLE `submitted_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_payments`
--
ALTER TABLE `tax_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tax_type_id` (`tax_type_id`);

--
-- Indexes for table `tax_types`
--
ALTER TABLE `tax_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_tax_details`
--
ALTER TABLE `user_tax_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tax_type_id` (`tax_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schemes`
--
ALTER TABLE `schemes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `scheme_applications`
--
ALTER TABLE `scheme_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `special_codes`
--
ALTER TABLE `special_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `submitted_documents`
--
ALTER TABLE `submitted_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tax_payments`
--
ALTER TABLE `tax_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tax_types`
--
ALTER TABLE `tax_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_tax_details`
--
ALTER TABLE `user_tax_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD CONSTRAINT `certificate_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_payments`
--
ALTER TABLE `tax_payments`
  ADD CONSTRAINT `tax_payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tax_payments_ibfk_2` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`);

--
-- Constraints for table `user_tax_details`
--
ALTER TABLE `user_tax_details`
  ADD CONSTRAINT `user_tax_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_tax_details_ibfk_2` FOREIGN KEY (`tax_type_id`) REFERENCES `tax_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
