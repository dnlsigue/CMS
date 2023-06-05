-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 05, 2023 at 09:19 PM
-- Server version: 8.0.33
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ytoovumw_bscs3a`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_admins`
--

CREATE TABLE `cms_admins` (
  `id` int NOT NULL,
  `school_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_admins`
--

INSERT INTO `cms_admins` (`id`, `school_id`, `first_name`, `last_name`, `status`) VALUES
(58, 'admin', 'Jiwoo', 'Gabriel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_assignments`
--

CREATE TABLE `cms_assignments` (
  `id` int NOT NULL,
  `topic_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(256) NOT NULL,
  `due_date` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_attendance_logs`
--

CREATE TABLE `cms_attendance_logs` (
  `id` int NOT NULL,
  `school_id` varchar(100) NOT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `total_hours` decimal(4,2) DEFAULT NULL,
  `last_tap_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_classes`
--

CREATE TABLE `cms_classes` (
  `class_id` int NOT NULL,
  `class_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_classes`
--

INSERT INTO `cms_classes` (`class_id`, `class_code`, `subject`, `created_at`) VALUES
(182, 'MTH-111-esYm68', ' COLLEGE ALGEBRA', '2023-05-26 01:32:00'),
(185, 'A2-M5NYaH', ' ARGUMENTATION AND DEBATE', '2023-05-26 02:21:21'),
(188, 'A2-o6jETY', ' ARGUMENTATION AND DEBATE', '2023-05-26 04:24:31'),
(189, 'CCS-113-bVx6mR', ' INFORMATION ASSURANCE AND SECURITY 1', '2023-05-26 05:17:57'),
(190, 'ABC-321-haIPWV', ' RISK, DISASTER & HUMANITARIAN COMM.', '2023-05-26 06:09:46'),
(195, 'CCS-106-FrgH8D', ' APPLICATION DEVELOPMENT AND EMERGING TECHNOLOGIES', '2023-05-31 01:11:53'),
(196, 'CCS-107-EBIU3D', ' WEB SYSTEMS AND TECHNOLOGY', '2023-05-31 01:12:08'),
(197, 'CCS-103-nTm4nN', ' COMPUTER PROGRAMMING 2', '2023-05-31 01:12:35'),
(198, 'CCS-108-FviFjM', ' TECHNICAL COMPUTER CONCEPT', '2023-05-31 01:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `cms_classrooms`
--

CREATE TABLE `cms_classrooms` (
  `classroom_id` int NOT NULL,
  `class_id` varchar(100) DEFAULT NULL,
  `subject_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `school_id` varchar(100) DEFAULT NULL,
  `sections` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_classrooms`
--

INSERT INTO `cms_classrooms` (`classroom_id`, `class_id`, `subject_code`, `school_id`, `sections`, `status`, `created_at`) VALUES
(74, '195', 'CCS-106', 'instructor1', 'BSCS-1A', 1, '2023-05-31 01:11:53'),
(75, '196', 'CCS-107', 'instructor1', 'BSCS-1A', 1, '2023-05-31 01:12:08'),
(76, '197', 'CCS-103', 'instructor1', 'BSCS-1A', 1, '2023-05-31 01:12:35'),
(77, '198', 'CCS-108', 'instructor1', 'BSCS-1A', 1, '2023-05-31 01:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `cms_coordinators`
--

CREATE TABLE `cms_coordinators` (
  `id` int NOT NULL,
  `school_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_coordinators`
--

INSERT INTO `cms_coordinators` (`id`, `school_id`, `first_name`, `last_name`, `status`) VALUES
(16, 'coordinator1', 'Daniel', 'Sigue', 1),
(17, 'coordinator2', 'Jayson', 'Tatum', 1),
(18, 'coordinator3', 'Jaylen', 'Brown', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_grades`
--

CREATE TABLE `cms_grades` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `classroom_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `grade` float NOT NULL,
  `term` int NOT NULL,
  `year` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_instructors`
--

CREATE TABLE `cms_instructors` (
  `id` int NOT NULL,
  `school_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_instructors`
--

INSERT INTO `cms_instructors` (`id`, `school_id`, `first_name`, `last_name`, `status`) VALUES
(38, 'instructor2', 'Mike', 'Lenard', 1),
(41, 'instructor1', 'Bam', 'Adebayo', 1),
(42, 'instructor3', 'Caleb', 'Martin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_instructors_topics`
--

CREATE TABLE `cms_instructors_topics` (
  `instructors_topics_id` int NOT NULL,
  `classroom_id` int NOT NULL,
  `topic_name` varchar(100) NOT NULL,
  `topic_description` varchar(155) NOT NULL,
  `term` varchar(10) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_instructors_topics`
--

INSERT INTO `cms_instructors_topics` (`instructors_topics_id`, `classroom_id`, `topic_name`, `topic_description`, `term`, `status`, `created_at`) VALUES
(3, 61, 'BINARY NUMBERS', 'Introduction to binary numbers', 'Midterm', 1, '2023-05-26 09:40:09'),
(4, 63, 'Binary System', 'Introduction', 'Prelim', 1, '2023-05-26 10:10:05'),
(5, 64, 'data', 'desp', 'Prelim', 1, '2023-05-26 10:42:53'),
(6, 65, 'hello', 'hello', 'Prelim', 1, '2023-05-26 11:03:08'),
(7, 67, 'poll', 'pollik', 'Prelim', 1, '2023-05-26 13:27:59'),
(8, 64, 'Midter', 'Midterm\r\n', 'Midterm', 1, '2023-05-26 14:08:28'),
(9, 72, 'intro', 'intro', 'Prelim', 1, '2023-05-26 16:37:06');

-- --------------------------------------------------------

--
-- Table structure for table `cms_instructors_topics_activities`
--

CREATE TABLE `cms_instructors_topics_activities` (
  `instructors_topics_activities_id` int NOT NULL,
  `instructors_topics_id` int DEFAULT NULL,
  `activity_submission_start` datetime DEFAULT NULL,
  `activity_submission_deadline` datetime DEFAULT NULL,
  `activity_file_path` varchar(510) DEFAULT NULL,
  `activity_name` varchar(100) DEFAULT NULL,
  `activity_description` varchar(510) DEFAULT NULL,
  `activity_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `activity_allow_submission` tinyint(1) DEFAULT NULL,
  `activity_items` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_instructors_topics_assignments`
--

CREATE TABLE `cms_instructors_topics_assignments` (
  `instructors_topics_assignments_id` int NOT NULL,
  `instructors_topics_id` int DEFAULT NULL,
  `assignment_submission_start` datetime DEFAULT NULL,
  `assignment_submission_deadline` datetime DEFAULT NULL,
  `assignment_file_path` varchar(510) DEFAULT NULL,
  `assignment_name` varchar(100) DEFAULT NULL,
  `assignment_description` varchar(510) DEFAULT NULL,
  `assignment_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `assignment_allow_submission` tinyint(1) DEFAULT NULL,
  `assignment_items` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_instructors_topics_exam`
--

CREATE TABLE `cms_instructors_topics_exam` (
  `instructors_topics_exam_id` int NOT NULL,
  `instructors_topics_id` int DEFAULT NULL,
  `exam_submission_start` datetime DEFAULT NULL,
  `exam_submission_deadline` datetime DEFAULT NULL,
  `exam_file_path` varchar(510) DEFAULT NULL,
  `exam_name` varchar(100) DEFAULT NULL,
  `exam_description` varchar(510) DEFAULT NULL,
  `exam_created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `exam_allow_submission` tinyint(1) DEFAULT NULL,
  `exam_items` int DEFAULT NULL,
  `exam_percent` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_instructors_topics_lesson_materials`
--

CREATE TABLE `cms_instructors_topics_lesson_materials` (
  `instructors_topics_lessonMaterials_id` bigint UNSIGNED NOT NULL,
  `instructors_topics_id` int DEFAULT NULL,
  `lessonMaterials_file_path` varchar(510) DEFAULT NULL,
  `lessonMaterials_title` varchar(100) DEFAULT NULL,
  `lessonMaterials_description` varchar(510) DEFAULT NULL,
  `lessonMaterials_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_instructors_topics_quizzes`
--

CREATE TABLE `cms_instructors_topics_quizzes` (
  `instructors_topics_quizzes_id` int NOT NULL,
  `instructors_topics_id` int NOT NULL,
  `quiz_submission_start` datetime NOT NULL,
  `quiz_submission_deadline` datetime NOT NULL,
  `quiz_file_path` varchar(510) NOT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `quiz_description` varchar(510) NOT NULL,
  `quiz_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `quiz_allow_submission` tinyint(1) NOT NULL,
  `quiz_items` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_lesson_materials`
--

CREATE TABLE `cms_lesson_materials` (
  `id` int NOT NULL,
  `topic_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(256) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_profileimg`
--

CREATE TABLE `cms_profileimg` (
  `id` int NOT NULL,
  `school_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_profileimg`
--

INSERT INTO `cms_profileimg` (`id`, `school_id`, `status`) VALUES
(124, 'admin', 0),
(204, 'coordinator1', 0),
(205, 'student1', 0),
(207, 'instructor2', 0),
(210, 'instructor1', 0),
(211, 'instructor3', 1),
(212, 'student2', 1),
(213, 'student3', 1),
(214, 'coordinator2', 1),
(215, 'coordinator3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_pwdReset`
--

CREATE TABLE `cms_pwdReset` (
  `pwdResetId` int NOT NULL,
  `pwdResetUserID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `pwdResetEmail` text NOT NULL,
  `pwdResetSelector` text NOT NULL,
  `pwdResetToken` longtext NOT NULL,
  `pwdResetExpires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_pwdreset`
--

CREATE TABLE `cms_pwdreset` (
  `pwdResetId` int NOT NULL,
  `pwdResetUserID` text,
  `pwdResetEmail` text NOT NULL,
  `pwdResetSelector` text NOT NULL,
  `pwdResetToken` longtext NOT NULL,
  `pwdResetExpires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_quizzes`
--

CREATE TABLE `cms_quizzes` (
  `id` int NOT NULL,
  `topic_id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_quizzes_answers`
--

CREATE TABLE `cms_quizzes_answers` (
  `id` int NOT NULL,
  `quiz_question_id` int NOT NULL,
  `answer` varchar(100) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_quizzes_questions`
--

CREATE TABLE `cms_quizzes_questions` (
  `id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `question` varchar(256) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_schedule`
--

CREATE TABLE `cms_schedule` (
  `id` int NOT NULL,
  `school_id` varchar(100) DEFAULT NULL,
  `subject_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `classroom_id` varchar(100) DEFAULT NULL,
  `schedule_day` varchar(100) DEFAULT NULL,
  `schedule_start` time DEFAULT NULL,
  `schedule_end` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_schedule`
--

INSERT INTO `cms_schedule` (`id`, `school_id`, `subject_code`, `classroom_id`, `schedule_day`, `schedule_start`, `schedule_end`) VALUES
(13, 'OP-Gomu Gomu no Mi', 'MTH-111', '61', 'Sunday', '09:30:00', '10:30:00'),
(14, 'instructor001', 'A2', '64', 'Wednesday', '10:22:00', '22:22:00'),
(15, 'instructor2', 'ABC-223', '65', 'Wednesday', '10:37:00', '15:38:00'),
(16, 'instructor2', 'ABC-322', '66', 'Monday', '11:01:00', '12:01:00'),
(17, '1161090', 'A2', '67', 'Tuesday', '10:00:00', '11:00:00'),
(18, '1161090', 'CCS-113', '68', 'Monday', '10:00:00', '13:00:00'),
(19, 'instructor001', 'ABC-321', '69', 'Tuesday', '10:30:00', '11:30:00'),
(20, 'instructor2', 'ABC-322', '70', 'Monday', '10:00:00', '11:00:00'),
(21, '1161090', 'ACC-111', '71', 'Wednesday', '10:30:00', '22:50:00'),
(22, 'instructor001', 'ABC-412', '72', 'Friday', '14:30:00', '17:00:00'),
(23, 'instructor2', 'A2', '63', 'Monday', '10:30:00', '11:30:00'),
(24, 'instructor1', 'CCS-107', '75', 'Monday', '08:30:00', '09:30:00'),
(25, 'instructor1', 'CCS-106', '74', 'Tuesday', '09:30:00', '10:30:00'),
(26, 'instructor1', 'CCS-103', '76', 'Wednesday', '10:30:00', '11:30:00'),
(27, 'instructor1', 'CCS-108', '77', 'Thursday', '11:30:00', '12:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `cms_scores`
--

CREATE TABLE `cms_scores` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `classroom_id` int NOT NULL,
  `assignment_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `score` int NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_sectionList`
--

CREATE TABLE `cms_sectionList` (
  `id` int NOT NULL,
  `sections` varchar(100) DEFAULT NULL,
  `school_id` varchar(100) DEFAULT NULL COMMENT 'student_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_sectionList`
--

INSERT INTO `cms_sectionList` (`id`, `sections`, `school_id`) VALUES
(24, 'BPA-2A', 'student1');

-- --------------------------------------------------------

--
-- Table structure for table `cms_sections`
--

CREATE TABLE `cms_sections` (
  `id` int NOT NULL,
  `course` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `section` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_sections`
--

INSERT INTO `cms_sections` (`id`, `course`, `section`) VALUES
(27, 'BSCS', '1A'),
(28, 'BSCS', '2A'),
(29, 'BSCS', '3A'),
(30, 'BSCS', '4A');

-- --------------------------------------------------------

--
-- Table structure for table `cms_students`
--

CREATE TABLE `cms_students` (
  `id` int NOT NULL,
  `school_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `assigned` varchar(10) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `term` int DEFAULT NULL,
  `year` year DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_students`
--

INSERT INTO `cms_students` (`id`, `school_id`, `first_name`, `last_name`, `assigned`, `status`, `term`, `year`) VALUES
(69, 'student1', 'Lebron', 'James', 'YES', 1, NULL, NULL),
(71, 'student2', 'Jimmy', 'Butler', 'NO', 1, NULL, NULL),
(72, 'student3', 'Gabe', 'Vincent', 'NO', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_students_activities_submission`
--

CREATE TABLE `cms_students_activities_submission` (
  `students_activities_submission_id` int NOT NULL,
  `instructors_topics_activities_id` int DEFAULT NULL,
  `school_id` varchar(100) DEFAULT NULL,
  `activity_submitted_time` datetime DEFAULT NULL,
  `activity_status` varchar(100) DEFAULT NULL,
  `activity_file_path_submission` varchar(510) DEFAULT NULL,
  `activity_score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_students_assignments_submission`
--

CREATE TABLE `cms_students_assignments_submission` (
  `students_assignments_submission_id` int NOT NULL,
  `instructors_topics_assignments_id` int DEFAULT NULL,
  `school_id` varchar(100) DEFAULT NULL,
  `assignment_submitted_time` datetime DEFAULT NULL,
  `assignment_status` varchar(100) DEFAULT NULL,
  `assignment_file_path_submission` varchar(510) DEFAULT NULL,
  `assignment_score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_students_exam_submission`
--

CREATE TABLE `cms_students_exam_submission` (
  `students_exam_submission_id` int NOT NULL,
  `instructors_topics_exam_id` int DEFAULT NULL,
  `school_id` varchar(100) DEFAULT NULL,
  `exam_submitted_time` datetime DEFAULT NULL,
  `exam_status` varchar(100) DEFAULT NULL,
  `exam_file_path_submission` varchar(510) DEFAULT NULL,
  `exam_score` int DEFAULT NULL,
  `exam_percent` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_students_quizzes_submission`
--

CREATE TABLE `cms_students_quizzes_submission` (
  `students_quizzes_submission_id` int NOT NULL,
  `instructors_topics_quizzes_id` int DEFAULT NULL,
  `school_id` varchar(100) DEFAULT NULL,
  `quiz_submitted_time` datetime DEFAULT NULL,
  `quiz_status` varchar(100) DEFAULT NULL,
  `quiz_file_path_submission` varchar(510) DEFAULT NULL,
  `quiz_score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_student_assignments`
--

CREATE TABLE `cms_student_assignments` (
  `id` int NOT NULL,
  `assignment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `submitted_at` datetime NOT NULL,
  `score` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_subjects`
--

CREATE TABLE `cms_subjects` (
  `id` int NOT NULL,
  `subject` varchar(87) DEFAULT NULL,
  `subject_code` varchar(10) DEFAULT NULL,
  `course` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cms_subjects`
--

INSERT INTO `cms_subjects` (`id`, `subject`, `subject_code`, `course`) VALUES
(1, 'CALCULUS I', 'MCC-121', 'BSMATH'),
(2, 'FUNDAMENTAL CONCEPTS OF MATHEMATICS', 'MCC-122', 'BSMATH'),
(3, 'UNDERSTANDING THE SELF', 'GEC-001', 'BSMATH'),
(4, 'READINGS IN PHILIPPINE HISTORY', 'GEC-002', 'BSMATH'),
(5, 'LIVING IN THE IT ERA', 'GEE-002', 'BSMATH'),
(6, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSMATH'),
(7, 'NSTP-CWTS 2', 'NSTP-122', 'BSMATH'),
(8, 'CALCULUS III', 'MCC-221', 'BSMATH'),
(9, 'PROBABILITY', 'MCC-222', 'BSMATH'),
(10, 'MATHEMATICS OF INVESTMENT', 'MFE-223', 'BSMATH'),
(11, 'QUANTITATIVE METHODS', 'MFE-224', 'BSMATH'),
(12, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSMATH'),
(13, 'ETHICS', 'GEC-008', 'BSMATH'),
(14, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSMATH'),
(15, 'ADVANCED CALCULUS II', 'MCC-321', 'BSMATH'),
(16, 'NUMERICAL ANALYSIS', 'MCC-322', 'BSMATH'),
(17, 'MODERN GEOMETRY (PROJECTIVE GEOMETRY)', 'MCC-323', 'BSMATH'),
(18, 'ABSTRACT ALGEBRA 1', 'MCC-324', 'BSMATH'),
(19, 'FUNDEMENTALS OF COMPUTING I', 'MCC-325', 'BSMATH'),
(20, 'GRAPH THEORY AND APPLICATIONS', 'QEC-326', 'BSMATH'),
(21, 'GENERAL PHYSICS (MECHANICS W/ LABORATORY)', 'NFC-002', 'BSMATH'),
(22, 'TEAM SPORTS', 'PE-004', 'BSMATH'),
(23, 'ON-THE-JOB TRAINING', 'OJT-421', 'BSMATH'),
(24, 'FLUID MECHANICS', 'NFC-003', 'BSMATH'),
(25, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSE-ENG'),
(26, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSE-ENG'),
(27, 'STRUCTURE OF ENGLISH', 'ENGL-307', 'BSE-ENG'),
(28, 'GREAT BOOKS', 'GEE-008', 'BSE-ENG'),
(29, 'FACILITATING LEARNER CENTERED TEACHING', 'MS-111', 'BSE-ENG'),
(30, 'LANGUAGE, CULTURE AND SOCIETY', 'ENGL-501', 'BSE-ENG'),
(31, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSE-ENG'),
(32, 'NATIONAL SERVICE TRAINING PROGRAM 2', 'NSTP-112', 'BSE-ENG'),
(33, 'TRANSLATION', 'ENGL-517', 'BSE-ENG'),
(34, 'THE TEACHER AND THE SCHOOL CURRICULUM', 'MS-115', 'BSE-ENG'),
(35, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BSE-ENG'),
(36, 'STRUCTURE OF ENGLISH', 'ENGL-307', 'BSE-ENG'),
(37, 'CREATIVE WRITING', 'ENGL-518', 'BSE-ENG'),
(38, 'PRINCIPLES AND THEORIES OF LANGUAGE ACQUISITION AND LEARNING', 'ENGL-502', 'BSE-ENG'),
(39, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSE-ENG'),
(40, 'FOUNDATION OF SPECIAL AND INCLUSIVE EDUCATION', 'TC-004', 'BSE-ENG'),
(41, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSE-ENG'),
(42, 'TRANSLATION', 'ENGL-517', 'BSE-ENG'),
(43, 'THE TEACHER AND THE SCHOOL CURRICULUM', 'MS-115', 'BSE-ENG'),
(44, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BSE-ENG'),
(45, 'STRUCTURE OF ENGLISH', 'ENGL-307', 'BSE-ENG'),
(46, 'CREATIVE WRITING', 'ENGL-518', 'BSE-ENG'),
(47, 'PRINCIPLES AND THEORIES OF LANGUAGE ACQUISITION AND LEARNING', 'ENGL-502', 'BSE-ENG'),
(48, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSE-ENG'),
(49, 'FOUNDATION OF SPECIAL AND INCLUSIVE EDUCATION', 'TC-004', 'BSE-ENG'),
(50, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSE-ENG'),
(51, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BSE-ENG'),
(52, 'TECHNOLOGY FOR TEACHING AND LEARNING 2 (TECHNOLOGY IN LANGUAGE EDUCATION)', 'ENGL-516', 'BSE-ENG'),
(53, 'FIELD STUDY 1 (OBSERVATIONS OF TEACHING-LEARNING IN ACTUAL SCHOOL LEARNING ENVIRONMENT)', 'FS-1', 'BSE-ENG'),
(54, 'SPEECH AND THEATER ARTS', 'ENGL-508', 'BSE-ENG'),
(55, 'TECHNICAL WRITING', 'ENGL-515', 'BSE-ENG'),
(56, 'SURVEY OF ENGLISH AND AMERICAN LITERATURE', 'ENGL-513', 'BSE-ENG'),
(57, 'PRACTICE TEACHING/TEACHING INTERNSHIP', 'PT-111', 'BSE-ENG'),
(58, 'LITERARY CRITICISM', 'ENGL-304', 'BSE-ENG'),
(59, 'GREAT WORKS', 'LIT-006', 'BSE-ENG'),
(60, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-004', 'BSE-ENG'),
(61, 'SPECIAL TOPICS IN LITERATURE', 'LIT-007', 'BSE-ENG'),
(62, 'WIKA, KULTURA, AT LIPUNAN', 'FIL-113', 'BSE-ENG'),
(63, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSE-SCI'),
(64, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSE-SCI'),
(65, 'GREAT BOOKS', 'GEE-008', 'BSE-SCI'),
(66, 'FACILITATING LEARNER CENTERED TEACHING', 'MS-111', 'BSE-SCI'),
(67, 'EARTH SCIENCE', 'MSS-518', 'BSE-SCI'),
(68, 'ASTRONOMY', 'MSS-519', 'BSE-SCI'),
(69, 'ENVIRONMENTAL SCIENCE', 'MSS-520', 'BSE-SCI'),
(70, 'RHTHMIC ACTIVITIES', 'PE-002', 'BSE-SCI'),
(71, 'NATIONAL SERVICE TRAINING PROGRAM 2', 'NSTP-2', 'BSE-SCI'),
(72, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSE-SCI'),
(73, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSE-SCI'),
(74, 'GREAT BOOKS', 'GEE-008', 'BSE-SCI'),
(75, 'FACILITATING LEARNER CENTERED TEACHING', 'MS-111', 'BSE-SCI'),
(76, 'EARTH SCIENCE', 'MSS-518', 'BSE-SCI'),
(77, 'ASTRONOMY', 'MSS-519', 'BSE-SCI'),
(78, 'ENVIRONMENTAL SCIENCE', 'MSS-520', 'BSE-SCI'),
(79, 'RHTHMIC ACTIVITIES', 'PE-002', 'BSE-SCI'),
(80, 'NATIONAL SERVICE TRAINING PROGRAM 2', 'NSTP-2', 'BSE-SCI'),
(81, 'THE TEACHER AND THE SCHOOL CURRICULUM', 'MS-115', 'BSE-SCI'),
(82, 'ELECTRICITY AND MAGNETISM', 'MSS-515', 'BSE-SCI'),
(83, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BSE-SCI'),
(84, 'ORAGNIC CHEMISTRY', 'MBS-322', 'BSE-SCI'),
(85, 'METEOROLOGY', 'MSS-524', 'BSE-SCI'),
(86, 'THERMODYNAMICS', 'MSS-513', 'BSE-SCI'),
(87, 'FACILITATING LEARNER CENTERED TEACHING', 'MS-111', 'BSE-SCI'),
(88, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSE-SCI'),
(89, 'WAVES AND OPTICS', 'MSS-516', 'BSE-SCI'),
(90, 'OBSERVATION OF TEACHING-LEARNING IN ACTUAL SCHOOL ENVIRONMENT', 'FS-1', 'BSE-SCI'),
(91, 'CELL AND MOLECULAR BIOLOGY', 'MSS-511', 'BSE-SCI'),
(92, 'TECHNOLOGY FOR TEACHING AND LEARNING SCIENCE', 'MSS-522', 'BSE-SCI'),
(93, 'BIOCHEMISTRY', 'MBS-331b', 'BSE-SCI'),
(94, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BSE-SCI'),
(95, 'WAVES AND OPTICS', 'MSS-516', 'BSE-SCI'),
(96, 'OBSERVATION OF TEACHING-LEARNING IN ACTUAL SCHOOL ENVIRONMENT', 'FS-1', 'BSE-SCI'),
(97, 'CELL AND MOLECULAR BIOLOGY', 'MSS-511', 'BSE-SCI'),
(98, 'TECHNOLOGY FOR TEACHING AND LEARNING SCIENCE', 'MSS-522', 'BSE-SCI'),
(99, 'BIOCHEMISTRY', 'MBS-331b', 'BSE-SCI'),
(100, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BSE-SCI'),
(101, 'PRACTICE TEACHING/TEACHING INTERNSHIP', 'PT-111', 'BSE-SCI'),
(102, 'RESEARCH IN TEACHING SCIENCE', 'MSS-523', 'BSE-SCI'),
(103, 'ART APPRECIATION', 'GEC-006', 'BSE-SCI'),
(104, 'WIKA, KULTURA, AT LIPUNAN', 'FIL-113', 'BSE-SCI'),
(105, 'GREAT WORKS', 'LIT-006', 'BSE-SCI'),
(106, 'SPECIAL TOPICS IN LITERATURE', 'LIT-007', 'BSE-SCI'),
(107, 'PRACTICE TEACHING/TEACHING INTERNSHIP', 'PT-111', 'BSE-SCI'),
(108, 'RESEARCH IN TEACHING SCIENCE', 'MSS-523', 'BSE-SCI'),
(109, 'ART APPRECIATION', 'GEC-006', 'BSE-SCI'),
(110, 'WIKA, KULTURA, AT LIPUNAN', 'FIL-113', 'BSE-SCI'),
(111, 'GREAT WORKS', 'LIT-006', 'BSE-SCI'),
(112, 'SPECIAL TOPICS IN LITERATURE', 'LIT-007', 'BSE-SCI'),
(113, 'UNDERSTANDING THE SELF', 'GEC-001', 'BECED'),
(114, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BECED'),
(115, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BECED'),
(116, 'GREAT BOOKS', 'GEE-008', 'BECED'),
(117, 'CONTENT AND PEDAGOGY IN THE MOTHER TONGUE BASED MULTILINGUAL EDUCATION', 'ECE-21', 'BECED'),
(118, 'PLAY AND DEVELOPMENTALLY APPROPRIATE PRACTICES IN EARLY CHILDHOOD EDUCATION', 'ECE-004', 'BECED'),
(119, 'THE TEACHING PROFESSION', 'TC-004B', 'BECED'),
(120, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BECED'),
(121, 'NATIONAL SERVICE TRAINING PROGRAM 2', 'NSTP-112', 'BECED'),
(122, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BECED'),
(123, 'TECHNOLOGY FOR TEACHING AND LEARNING 1', 'MS-113', 'BECED'),
(124, 'LITERACY DEVELOPMENT', 'ECE-010', 'BECED'),
(125, 'HEALTH, NUTRITION AND SAFETY', 'ECE-002', 'BECED'),
(126, 'INCLUSIVE EDUCATION IN EARLY CHILDHOOS SETTINGS', 'ECE-007', 'BECED'),
(127, 'THE TEACHER AND THE COMMUNITY, SCHOOL CULTURE AND ORGANIZATIONAL LEADERSHIP', 'TC-003', 'BECED'),
(128, 'NUMERACY DEVELOPMENT', 'ECE-006', 'BECED'),
(129, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BECED'),
(130, 'CHILDREN\'S LITERATURE', 'ECE-008', 'BECED'),
(131, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BECED'),
(132, 'GUIDING CHILDREN\'S BEHAVIOR AND MORAL DEVELOPMENT', 'ECE-015', 'BECED'),
(133, 'EARLY LEARNING ENVIRONMENT', 'ECE-017', 'BECED'),
(134, 'INTEGRATIVE TEACHING STRATEGIES', 'SPT-111', 'BECED'),
(135, 'FIELD STUDY 1 (OBSERVATION OF TEACHING-LEARNING IN ACTUAL SCHOOL ENVIRONMENT)', 'FS-1', 'BECED'),
(136, 'TECHNOLOGY FOR TEACHING AND LEARNING 2 (UTILIZATION OF IT IN ECED)', 'ECE-012', 'BECED'),
(137, 'FACILITATING LEARNER CENTERED TEACHING', 'MS-111', 'BECED'),
(138, 'PRACTICE TEACHING/TEACHING INTERNSHIP', 'PT-111', 'BECED'),
(139, 'MANAGEMENT OF EARLY CHILDHOOD EDUCATION PROGRAMS', 'ECE-018', 'BECED'),
(140, 'WIKA, KULTURA, AT LIPUNAN', 'FIL-113', 'BECED'),
(141, 'SPECIAL TOPICS IN LITERATURE', 'LIT-007', 'BECED'),
(142, 'GREAT WORKS', 'LIT-006', 'BECED'),
(143, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BTLED-HE'),
(144, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BTLED-HE'),
(145, 'GREAT BOOKS', 'GEE-008', 'BTLED-HE'),
(146, 'FACILITATING LEARNER-CENTRED TEACHING WITH EMPHASIS ON TRAINER\'S METHODOLOGY 1', 'MS-111a', 'BTLED-HE'),
(147, 'INTRODUCTION TO INDUSTRIAL ARTS 1', 'TLE-022', 'BTLED-HE'),
(148, 'ART APPRECIATION', 'GEC-006', 'BTLED-HE'),
(149, 'INTRODUCTION TO ICT SPECIALIZATION 1', 'TLE-024', 'BTLED-HE'),
(150, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BTLED-HE'),
(151, 'NATIONAL SERVICE TRAINING PROGRAM 2', 'NSTP-112', 'BTLED-HE'),
(152, 'INTRODUCTION TO ICT SPECIALIZATION 2', 'TLE-025', 'BTLED-HE'),
(153, 'ASSESSMENT IN LEARNING 2 WITH FOCUS ON TM 1 & 2', 'MS-114A', 'BTLED-HE'),
(154, 'FOUNDATION OF SPECIAL AND INCLUSIVE EDUCATION', 'TC-004', 'BTLED-HE'),
(155, 'INTRODUCTION TO AGRICULTURE AND FISHERY ARTS 2', 'TLE-030', 'BTLED-HE'),
(156, 'PRINCIPLES OF FOOD PREPARATION', 'TLE-031', 'BTLED-HE'),
(157, 'INTRODUCTION TO INDUSTRIAL ARTS 2', 'TLE-023', 'BTLED-HE'),
(158, 'TECHNOLOGY FOR TEACHING AND LEARNING 2', 'TLE-035', 'BTLED-HE'),
(159, 'CHILD AND ADOLESCENT DEVELOPMENT', 'TC-001B', 'BTLED-HE'),
(160, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BTLED-HE'),
(161, 'TECHNOLOGY FOR TEACHING AND LEARNING 2', 'TLE-035', 'BTLED-HE'),
(162, 'TECHNOLOGY RESEARCH 2 (RESEARCH 2/THESIS/RESEARCH PAPER/PROJECT)', 'TLE-042B', 'BTLED-HE'),
(163, 'INTRODUCTION TO AGRICULTURE AND FISHERY ARTS 2', 'TLE-030', 'BTLED-HE'),
(164, 'FOOD AND NUTRITION', 'TLE-032', 'BTLED-HE'),
(165, 'CLOTHING SELECTION, PURCHASE AND CARE', 'TLE-040', 'BTLED-HE'),
(166, 'FIELD STUDY 1 (OBSERVATION OF TEACHING LEARNING IN ACTUAL SCHOOL ENVIRONMENT)', 'FS-1', 'BTLED-HE'),
(167, 'ASSESSMENT IN LEARNING 2 WITH FOCUS ON TM 1 & 2', 'MS-114A', 'BTLED-HE'),
(168, 'PRACTICE TEACHING/TEACHING INTERNSHIP', 'PT-111', 'BTLED-HE'),
(169, 'CLOTHING CONSTRUCTION', 'TLE-041', 'BTLED-HE'),
(170, 'WIKA, KULTURA AT LIPUNAN', 'FIL-113', 'BTLED-HE'),
(171, 'GREAT WORKS', 'LIT-006', 'BTLED-HE'),
(172, 'SPECIAL TOPICS IN LITERATURE', 'LIT-007', 'BTLED-HE'),
(173, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSEENG-CHI'),
(174, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSEENG-CHI'),
(175, 'STRUCTURE OF ENGLISH', 'ENGL-307', 'BSEENG-CHI'),
(176, 'FACILITATING LEARNER-CENTERED TEACHING', 'MS-111', 'BSEENG-CHI'),
(177, 'LANGUAGE, CULTURE, AND SOCIETY', 'ENGL-501', 'BSEENG-CHI'),
(178, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSEENG-CHI'),
(179, 'NATIONAL SERVICE TRAINING PROGRAM 2', 'NSTP-112', 'BSEENG-CHI'),
(180, 'BASIC COURSE 2 (HQU)', 'CHI-003', 'BSEENG-CHI'),
(181, 'PRACTICE COURSE 2 (HQU)', 'CHI-004', 'BSEENG-CHI'),
(182, 'VOCABULARY COURSE 1 (HQU)', 'CHI-005', 'BSEENG-CHI'),
(183, 'PRACTICE TEACHING/TEACHING INTERNSHIP', 'PT-111', 'BSEENG-CHI'),
(184, 'LANGUAGE EDUCATION RESEARCH', 'ENGL-509', 'BSEENG-CHI'),
(185, 'CAMPUS JOURNALISM', 'ENGL-204', 'BSEENG-CHI'),
(186, 'TEACHING AND ASSESSMENT OF LITERATURE STUDIES', 'ENGL-505', 'BSEENG-CHI'),
(187, 'WIKA, KULTURA, AT LIPUNAN', 'FIL-113', 'BSEENG-CHI'),
(188, 'GREAT WORKS', 'LIT-006', 'BSEENG-CHI'),
(189, 'SPECIAL TOPICS IN LITERATURE', 'LIT-007', 'BSEENG-CHI'),
(190, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BACOMM'),
(191, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BACOMM'),
(192, 'ART APPRECIATION', 'GEC-006', 'BACOMM'),
(194, 'FILIPINO SA IBA\'T-IBANG DISIPLINA', 'FIL-002', 'BACOMM'),
(195, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BACOMM'),
(196, 'CWTS 2', 'NSTP-122', 'BACOMM'),
(197, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BACOMM'),
(198, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BACOMM'),
(199, 'ART APPRECIATION', 'GEC-006', 'BACOMM'),
(200, 'COMMUNICATIONS, CULTURE & SOCIETY', 'ABC-121', 'BACOMM'),
(201, 'FILIPINO SA IBA\'T-IBANG DISIPLINA', 'FIL-002', 'BACOMM'),
(202, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BACOMM'),
(203, 'CWTS 2', 'NSTP-122', 'BACOMM'),
(204, 'ETHICS', 'GEC-008', 'BACOMM'),
(205, 'WORLD HISTORY', 'SSE-001', 'BACOMM'),
(206, 'COMMUNICATION MEDIA LAWS AND ETHICS', 'ABC-221', 'BACOMM'),
(207, 'PUBLIC RELATIONS PRINCIPLES AND PRACTICES', 'ABC-222', 'BACOMM'),
(208, 'CROSS-CULTURAL COMMUNICATION', 'ABC-223', 'BACOMM'),
(209, 'TELEMARKETING TRAINING W/ IMMERSION', 'CIC-222', 'BACOMM'),
(210, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BACOMM'),
(211, 'ECONOMICS', 'SSE-004', 'BACOMM'),
(212, 'COMMUNITY DEVELOPMENT', 'SSE-005', 'BACOMM'),
(213, 'RISK, DISASTER & HUMANITARIAN COMM.', 'ABC-321', 'BACOMM'),
(214, 'INTRO. TO FILM', 'ABC-322', 'BACOMM'),
(215, 'BEHAVIORAL AND SOCIAL CHANGE', 'ABC-323', 'BACOMM'),
(216, 'TEAM SPORTS', 'PE-004', 'BACOMM'),
(217, 'THESIS PRESENTATION AND PUBLICATION', 'ABC-421', 'BACOMM'),
(218, 'COMMUNICATION MANAGEMENT', 'ABC-422', 'BACOMM'),
(219, 'KNOWLEDGE MANAGEMENT', 'ABC-423', 'BACOMM'),
(220, 'ETHICS WITH PEACE STUDY', 'GEC-008', 'BPA'),
(221, 'INTRODUCTION TO PUBLIC ADMINISTRATION', 'PAC-111', 'BPA'),
(222, 'ART APPRECIATION', 'GEC-006', 'BPA'),
(223, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BPA'),
(224, 'LIVING IN THE IT ERA', 'GEE-002', 'BPA'),
(225, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BPA'),
(226, 'NSTP-CWTS 2', 'NSTP-122', 'BPA'),
(227, 'ETHICS WITH PEACE STUDY', 'GEC-008', 'BPA'),
(228, 'INTRODUCTION TO PUBLIC ADMINISTRATION', 'PAC-111', 'BPA'),
(229, 'ART APPRECIATION', 'GEC-006', 'BPA'),
(230, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BPA'),
(231, 'LIVING IN THE IT ERA', 'GEE-002', 'BPA'),
(232, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BPA'),
(233, 'NSTP-CWTS 2', 'NSTP-122', 'BPA'),
(234, 'PUBLIC FISCAL ADMINISTRATION', 'PAC-005', 'BPA'),
(235, 'VOLUNTARY SECTOR MANAGEMENT', 'PAE-002', 'BPA'),
(236, 'KNOWLEDGE MANAGEMENT & ICT FOR PA', 'PAC-004', 'BPA'),
(237, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'BPA'),
(238, 'LAW ON OBLIGATIONS AND CONTRACTS', 'LAW-001', 'BPA'),
(239, 'PUBLIC ENTERPRISE', 'PAE-003', 'BPA'),
(240, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BPA'),
(241, 'PUBLIC FISCAL ADMINISTRATION', 'PAC-005', 'BPA'),
(242, 'VOLUNTARY SECTOR MANAGEMENT', 'PAE-002', 'BPA'),
(243, 'KNOWLEDGE MANAGEMENT & ICT FOR PA', 'PAC-004', 'BPA'),
(244, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'BPA'),
(245, 'LAW ON OBLIGATIONS AND CONTRACTS', 'LAW-001', 'BPA'),
(246, 'PUBLIC ENTERPRISE', 'PAE-003', 'BPA'),
(247, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BPA'),
(248, 'POLITICS AND ADMINISTRATION', 'PAC-012', 'BPA'),
(249, 'ORGANIZATION AND MANAGEMENT', 'PAC-011', 'BPA'),
(250, 'PUBLIC ACCOUNTING AND BUDGETING', 'PAC-013', 'BPA'),
(251, 'PRACTICUM IN PA (NATIONAL GOVERNMENT )', 'PAP-002', 'BPA'),
(252, 'RESEARCH METHODS IN PUBLIC ADMINISTRATION (PA) 1', 'PAC-014', 'BPA'),
(253, 'TEAM SPORTS', 'PE-004', 'BPA'),
(254, 'ADMINISTRATIVE LAW', 'PAC-010', 'BPA'),
(255, 'POLITICS AND ADMINISTRATION', 'PAC-012', 'BPA'),
(256, 'ORGANIZATION AND MANAGEMENT', 'PAC-011', 'BPA'),
(257, 'PUBLIC ACCOUNTING AND BUDGETING', 'PAC-013', 'BPA'),
(258, 'PRACTICUM IN PA (NATIONAL GOVERNMENT )', 'PAP-002', 'BPA'),
(259, 'RESEARCH METHODS IN PUBLIC ADMINISTRATION (PA) 1', 'PAC-014', 'BPA'),
(260, 'TEAM SPORTS', 'PE-004', 'BPA'),
(261, 'ADMINISTRATIVE LAW', 'PAC-010', 'BPA'),
(262, 'POLITICS AND ADMINISTRATION', 'PAC-012', 'BPA'),
(263, 'ORGANIZATION AND MANAGEMENT', 'PAC-011', 'BPA'),
(264, 'PUBLIC ACCOUNTING AND BUDGETING', 'PAC-013', 'BPA'),
(265, 'PRACTICUM IN PA (NATIONAL GOVERNMENT )', 'PAP-002', 'BPA'),
(266, 'RESEARCH METHODS IN PUBLIC ADMINISTRATION (PA) 1', 'PAC-014', 'BPA'),
(267, 'TEAM SPORTS', 'PE-004', 'BPA'),
(268, 'ADMINISTRATIVE LAW', 'PAC-010', 'BPA'),
(269, 'ETHICS AND ACCOUNTABILITY IN PUBLIC SERVICE', 'PAC-019', 'BPA'),
(270, 'PUBLIC POLICY AND PROGRAM ADMINISTRATION', 'PAC-018', 'BPA'),
(271, 'SPECIAL TOPICS FOR PUBLIC ADMINISTRATION', 'PAC-016', 'BPA'),
(272, 'ETHICS AND ACCOUNTABILITY IN PUBLIC SERVICE', 'PAC-019', 'BPA'),
(273, 'PUBLIC POLICY AND PROGRAM ADMINISTRATION', 'PAC-018', 'BPA'),
(274, 'SPECIAL TOPICS FOR PUBLIC ADMINISTRATION', 'PAC-016', 'BPA'),
(275, 'ETHICS AND ACCOUNTABILITY IN PUBLIC SERVICE', 'PAC-019', 'BPA'),
(276, 'PUBLIC POLICY AND PROGRAM ADMINISTRATION', 'PAC-018', 'BPA'),
(277, 'SPECIAL TOPICS FOR PUBLIC ADMINISTRATION', 'PAC-016', 'BPA'),
(278, 'INTRODUCTION TO PSYCHOLOGY', 'PBC121', 'BSPSYCH'),
(279, 'READINGS IN THE PHILIPPINE HISTORY', 'GEC002', 'BSPSYCH'),
(280, 'ETHICS WITH PEACE STUDIES', 'GEC008', 'BSPSYCH'),
(281, 'ART APPRECIATION', 'GEC006', 'BSPSYCH'),
(282, 'CONTEMPORARY WORLD', 'GEC003', 'BSPSYCH'),
(283, 'HEALTH CARE SERVICES AND PREPARATION', 'HCS111', 'BSPSYCH'),
(284, 'NSTP-CWTS', 'NSTP11', 'BSPSYCH'),
(285, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSPSYCH'),
(286, 'INTRODUCTION TO PSYCHOLOGY', 'PBC121', 'BSPSYCH'),
(287, 'READINGS IN THE PHILIPPINE HISTORY', 'GEC002', 'BSPSYCH'),
(288, 'ETHICS WITH PEACE STUDIES', 'GEC008', 'BSPSYCH'),
(289, 'ART APPRECIATION', 'GEC006', 'BSPSYCH'),
(290, 'CONTEMPORARY WORLD', 'GEC003', 'BSPSYCH'),
(291, 'HEALTH CARE SERVICES AND PREPARATION', 'HCS111', 'BSPSYCH'),
(292, 'NSTP-CWTS', 'NSTP11', 'BSPSYCH'),
(293, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSPSYCH'),
(294, 'PSYCHOLOGICAL STATISTICS II (NON-PARAMETRICS)', 'PBC221', 'BSPSYCH'),
(295, 'THEORIES OF PERSONALITY', 'PRC221', 'BSPSYCH'),
(296, 'COGNITIVE PSYCHOLOGY', 'PRC222', 'BSPSYCH'),
(297, 'EXPIREMENTAL PSYCHOLOGY', 'PRC223', 'BSPSYCH'),
(298, 'GENETICS', 'NSC222', 'BSPSYCH'),
(299, 'FILM AND LITERATURE', 'LIT004', 'BSPSYCH'),
(300, 'LIFE AND WORKS OF RIZAL', 'GEM001', 'BSPSYCH'),
(301, 'INDIVIDUAL DUAL SPORTS', 'PE003', 'BSPSYCH'),
(302, 'PSYCHOLOGICAL STATISTICS II (NON-PARAMETRICS)', 'PBC221', 'BSPSYCH'),
(303, 'THEORIES OF PERSONALITY', 'PRC221', 'BSPSYCH'),
(304, 'COGNITIVE PSYCHOLOGY', 'PRC222', 'BSPSYCH'),
(305, 'EXPIREMENTAL PSYCHOLOGY', 'PRC223', 'BSPSYCH'),
(306, 'GENETICS', 'NSC222', 'BSPSYCH'),
(307, 'FILM AND LITERATURE', 'LIT004', 'BSPSYCH'),
(308, 'LIFE AND WORKS OF RIZAL', 'GEM001', 'BSPSYCH'),
(309, 'INDIVIDUAL DUAL SPORTS', 'PE003', 'BSPSYCH'),
(310, 'PSYCHOLOGICAL ASSESEMENT', 'PRC321', 'BSPSYCH'),
(311, 'SIKOLOHIYANG PILIPINO', 'PRC322', 'BSPSYCH'),
(312, 'RESEARCH IN PSYCHOLOGY I', 'PRC323', 'BSPSYCH'),
(313, 'INTRODUCTION TO COUNSELING', 'PEC002', 'BSPSYCH'),
(314, 'COMPARATIVE VERTEBRATE ANATOMY', 'NSC313', 'BSPSYCH'),
(315, 'CLINICAL PSYCHOLOGY', 'PEC003', 'BSPSYCH'),
(316, 'TEAM SPORTS', 'PE004', 'BSPSYCH'),
(317, 'PSYCHOLOGICAL ASSESEMENT', 'PRC321', 'BSPSYCH'),
(318, 'SIKOLOHIYANG PILIPINO', 'PRC322', 'BSPSYCH'),
(319, 'RESEARCH IN PSYCHOLOGY I', 'PRC323', 'BSPSYCH'),
(320, 'INTRODUCTION TO COUNSELING', 'PEC002', 'BSPSYCH'),
(321, 'COMPARATIVE VERTEBRATE ANATOMY', 'NSC313', 'BSPSYCH'),
(322, 'CLINICAL PSYCHOLOGY', 'PEC003', 'BSPSYCH'),
(323, 'TEAM SPORTS', 'PE004', 'BSPSYCH'),
(324, 'PSYCHOLOGICAL ASSESEMENT', 'PRC321', 'BSPSYCH'),
(325, 'SIKOLOHIYANG PILIPINO', 'PRC322', 'BSPSYCH'),
(326, 'RESEARCH IN PSYCHOLOGY I', 'PRC323', 'BSPSYCH'),
(327, 'INTRODUCTION TO COUNSELING', 'PEC002', 'BSPSYCH'),
(328, 'COMPARATIVE VERTEBRATE ANATOMY', 'NSC313', 'BSPSYCH'),
(329, 'CLINICAL PSYCHOLOGY', 'PEC003', 'BSPSYCH'),
(330, 'TEAM SPORTS', 'PE004', 'BSPSYCH'),
(331, 'INTEGRATED PSYCHOLOGY II', 'PCA422', 'BSPSYCH'),
(332, 'PHYSIOLOGICAL/BIOLOGICAL PSYCHOLOGY', 'PRC422', 'BSPSYCH'),
(333, 'INTEGRATED PSYCHOLOGY II', 'PCA422', 'BSPSYCH'),
(334, 'PHYSIOLOGICAL/BIOLOGICAL PSYCHOLOGY', 'PRC422', 'BSPSYCH'),
(335, 'INTRODUCTION TO PSYCHOLOGY', 'PBC121', 'BSPSYCH'),
(336, 'READINGS IN THE PHILIPINE HISTORY', 'GEC002', 'BSPSYCH'),
(337, 'ART APPRECIATION', 'GEC006', 'BSPSYCH'),
(338, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'BSPSYCH'),
(339, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC007', 'BSPSYCH'),
(340, 'HEALTH CARE SERVICES AND PREPARATION', 'HCS111', 'BSPSYCH'),
(341, 'NSTP-CWTS', 'NSTP112', 'BSPSYCH'),
(342, 'RHYTMIC ACTIVITIES', 'PE002', 'BSPSYCH'),
(343, 'INTRODUCTION TO PSYCHOLOGY', 'PBC121', 'BSPSYCH'),
(344, 'READINGS IN THE PHILIPINE HISTORY', 'GEC002', 'BSPSYCH'),
(345, 'ART APPRECIATION', 'GEC006', 'BSPSYCH'),
(346, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'BSPSYCH'),
(347, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC007', 'BSPSYCH'),
(348, 'HEALTH CARE SERVICES AND PREPARATION', 'HCS111', 'BSPSYCH'),
(349, 'NSTP-CWTS', 'NSTP112', 'BSPSYCH'),
(350, 'RHYTMIC ACTIVITIES', 'PE002', 'BSPSYCH'),
(351, 'PSYCHOLOGICAL STATISTICS I (PARAMETRICS)', 'PBC211', 'BSPSYCH'),
(352, 'COGNITIVE PSYCHOLOGY', 'PRC222', 'BSPSYCH'),
(353, 'UNDERSTANDING MENTAL HEALTH ACROSS LIFE SPAN', 'CMH111', 'BSPSYCH'),
(354, 'GENETICS', 'NSC222', 'BSPSYCH'),
(355, 'GENDER AND SOCIETY', 'GEE002', 'BSPSYCH'),
(356, 'THEORIES OF PERSONALITY', 'PRC221', 'BSPSYCH'),
(357, 'INDIGENOUS CREATIVE CRAFTS', 'GEE003', 'BSPSYCH'),
(358, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSPSYCH'),
(359, 'INTRODUCTION TO PSYCHOLOGY', 'PBC121', 'ABBS'),
(360, 'READINGS IN THE PHILIPINE HISTORY', 'GEC002', 'ABBS'),
(361, 'ART APPRECIATION', 'GEC006', 'ABBS'),
(362, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'ABBS'),
(363, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC007', 'ABBS'),
(364, 'HEALTH CARE SERVICES AND PREPARATION', 'HCS111', 'ABBS'),
(365, 'NSTP-CWTS', 'NSTP112', 'ABBS'),
(366, 'RHYTMIC ACTIVITIES', 'PE002', 'ABBS'),
(367, 'INTRODUCTION TO PSYCHOLOGY', 'PBC121', 'ABBS'),
(368, 'READINGS IN THE PHILIPINE HISTORY', 'GEC002', 'ABBS'),
(369, 'ART APPRECIATION', 'GEC006', 'ABBS'),
(370, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'ABBS'),
(371, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC007', 'ABBS'),
(372, 'HEALTH CARE SERVICES AND PREPARATION', 'HCS111', 'ABBS'),
(373, 'NSTP-CWTS', 'NSTP112', 'ABBS'),
(374, 'RHYTMIC ACTIVITIES', 'PE002', 'ABBS'),
(375, 'PSYCHOLOGICAL STATISTICS I (PARAMETRICS)', 'PBC211', 'ABBS'),
(376, 'COGNITIVE PSYCHOLOGY', 'PRC222', 'ABBS'),
(377, 'UNDERSTANDING MENTAL HEALTH ACROSS LIFE SPAN', 'CMH111', 'ABBS'),
(378, 'GENETICS', 'NSC222', 'ABBS'),
(379, 'GENDER AND SOCIETY', 'GEE002', 'ABBS'),
(380, 'THEORIES OF PERSONALITY', 'PRC221', 'ABBS'),
(381, 'INDIGENOUS CREATIVE CRAFTS', 'GEE003', 'ABBS'),
(382, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'ABBS'),
(383, 'BEHAVIOURAL SCIENCE RESEARCH II', 'BRC312', 'ABBS'),
(384, 'PROGRAM DEVELOPMENT, IMPLEMENTATION AND MGT', 'BRC315', 'ABBS'),
(385, 'INSTITUIONAL DYNAMICS AND TRANSFORMATION', 'BRC323', 'ABBS'),
(386, 'ORGANIZATIONAL DEVELOPMENT', 'BRC324', 'ABBS'),
(387, 'LAWS OBLIGATIONS AND CONTRACTS', 'BEC002', 'ABBS'),
(388, 'INTRODUCTION TO SOCIAL WORK', 'PSY323', 'ABBS'),
(389, 'TEAM SPORTS', 'PE004', 'ABBS'),
(390, 'BEHAVIOURAL SCIENCE RESEARCH II', 'BRC312', 'ABBS'),
(391, 'PROGRAM DEVELOPMENT, IMPLEMENTATION AND MGT', 'BRC315', 'ABBS'),
(392, 'INSTITUIONAL DYNAMICS AND TRANSFORMATION', 'BRC323', 'ABBS'),
(393, 'ORGANIZATIONAL DEVELOPMENT', 'BRC324', 'ABBS'),
(394, 'LAWS OBLIGATIONS AND CONTRACTS', 'BEC002', 'ABBS'),
(395, 'INTRODUCTION TO SOCIAL WORK', 'PSY323', 'ABBS'),
(396, 'TEAM SPORTS', 'PE004', 'ABBS'),
(397, 'HUMAN RESOURCE MANAGEMENT & DEVELOPMENT', 'BRC412', 'ABBS'),
(398, 'SEMINARS IN BEHAVIORAL SCIENCES 2', 'BEC004', 'ABBS'),
(399, 'HUMAN RESOURCE MANAGEMENT & DEVELOPMENT', 'BRC412', 'ABBS'),
(400, 'SEMINARS IN BEHAVIORAL SCIENCES 2', 'BEC004', 'ABBS'),
(401, 'COMPUTER PROGRAMMING 2', 'CCS-103', 'BSIT'),
(402, 'WEB SYSTEMS AND TECHNOLOGY', 'CCS-107', 'BSIT'),
(403, 'TECHNICAL COMPUTER CONCEPT', 'CCS-108', 'BSIT'),
(404, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSIT'),
(405, 'NSTP', 'NSTP-122', 'BSIT'),
(406, 'COLLEGE ALGEBRA', 'PR-001', 'BSIT'),
(407, 'CONTEMPORARY WORLD', 'GEC-003', 'BSIT'),
(408, 'COMPUTER PROGRAMMING 2', 'CCS-103', 'BSIT'),
(409, 'WEB SYSTEMS AND TECHNOLOGY', 'CCS-107', 'BSIT'),
(410, 'TECHNICAL COMPUTER CONCEPT', 'CCS-108', 'BSIT'),
(411, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSIT'),
(412, 'NSTP', 'NSTP-122', 'BSIT'),
(413, 'COLLEGE ALGEBRA', 'PR-001', 'BSIT'),
(414, 'CONTEMPORARY WORLD', 'GEC-003', 'BSIT'),
(415, 'TECHNICAL COMPUTER CONCEPT', 'CCS-108', 'BSIT'),
(416, 'APPLICATION DEVELOPMENT AND EMERGING TECHNOLOGIES', 'CCS-106', 'BSIT'),
(417, 'INTEGRATIVE PROGRAMING AND TECHNOLOGIES', 'IT-101', 'BSIT'),
(418, 'ADVANCE DATABASE SYSTEMS', 'IT-102', 'BSIT'),
(419, 'COMPUTER SYSTEM ORGANIZATION', 'IT-103', 'BSIT'),
(420, 'NETWORKING 2', 'IT-104', 'BSIT'),
(421, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSIT'),
(422, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSIT'),
(423, 'APPLICATION DEVELOPMENT AND EMERGING TECHNOLOGIES', 'CCS-106', 'BSIT'),
(424, 'INTEGRATIVE PROGRAMING AND TECHNOLOGIES', 'IT-101', 'BSIT'),
(425, 'ADVANCE DATABASE SYSTEMS', 'IT-102', 'BSIT'),
(426, 'COMPUTER SYSTEM ORGANIZATION', 'IT-103', 'BSIT'),
(427, 'NETWORKING 2', 'IT-104', 'BSIT'),
(428, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSIT'),
(429, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSIT'),
(430, 'OPERATING SYSTEM & APPLICATION', 'CCS-112', 'BSIT'),
(431, 'INTRODUCTION TO HUMAN COMPUTER INTERACTION', 'CCS-123', 'BSIT'),
(432, 'SOFTWARE ENGINEERING', 'CCS-125', 'BSIT'),
(433, 'SYSTEM ADMINISTRATION AND MAINTENANCE', 'IT-107', 'BSIT'),
(434, 'INFORMATION ASSURANCE AND SECURITY 2', 'IT-108', 'BSIT'),
(435, 'IT MAJOR ELECTIVE 2 (ARDUINO PROGRAMMING)', 'IT-109', 'BSIT'),
(436, 'METHODS OF RESEARCH', 'PR-003', 'BSIT'),
(437, 'TEAM SPORTS', 'PE-004', 'BSIT'),
(438, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSIT'),
(439, 'OPERATING SYSTEM & APPLICATION', 'CCS-112', 'BSIT'),
(440, 'INTRODUCTION TO HUMAN COMPUTER INTERACTION', 'CCS-123', 'BSIT'),
(441, 'SOFTWARE ENGINEERING', 'CCS-125', 'BSIT'),
(442, 'SYSTEM ADMINISTRATION AND MAINTENANCE', 'IT-107', 'BSIT'),
(443, 'INFORMATION ASSURANCE AND SECURITY 2', 'IT-108', 'BSIT'),
(444, 'IT MAJOR ELECTIVE 2 (ARDUINO PROGRAMMING)', 'IT-109', 'BSIT'),
(445, 'METHODS OF RESEARCH', 'PR-003', 'BSIT'),
(446, 'TEAM SPORTS', 'PE-004', 'BSIT'),
(447, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSIT'),
(448, 'PRACTICUM 2', 'CCS-114B', 'BSIT'),
(449, 'CAPSTONE PROJECT AND RESEARCH 2', 'CCS-120', 'BSIT'),
(450, 'IT ADVANCED SPECIAL TOPICS', 'IT-114', 'BSIT'),
(451, 'IT MAJOR ELECTIVE 4 (PLATFORM TECHNOLOGY)', 'IT-115', 'BSIT'),
(452, 'CURRENT TRENDS IN IT AND SEMINAR', 'CCS-115', 'BSIT'),
(453, 'RIZAL\'S LIFE WORKS AND WRITING', 'GEM-001', 'BSIT'),
(454, 'PRACTICUM 2', 'CCS-114B', 'BSIT'),
(455, 'CAPSTONE PROJECT AND RESEARCH 2', 'CCS-120', 'BSIT'),
(456, 'IT ADVANCED SPECIAL TOPICS', 'IT-114', 'BSIT'),
(457, 'IT MAJOR ELECTIVE 4 (PLATFORM TECHNOLOGY)', 'IT-115', 'BSIT'),
(458, 'CURRENT TRENDS IN IT AND SEMINAR', 'CCS-115', 'BSIT'),
(459, 'RIZAL\'S LIFE WORKS AND WRITING', 'GEM-001', 'BSIT'),
(460, 'ENVIRONMENTAL SCIENCE', 'GEE001', 'BSTM'),
(461, 'PURPOSIVE COMMUNICATION', 'GEC005', 'BSTM'),
(462, 'ART APPRECIATION', 'GEC006', 'BSTM'),
(463, 'TOURISM & HOSPITALITY 1 (MICRO PERSPECTIVE)', 'THC002', 'BSTM'),
(464, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSTM'),
(465, 'CWTS 2', 'NSTP122', 'BSTM'),
(466, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'BSTM'),
(467, 'ENVIRONMENTAL SCIENCE', 'GEE001', 'BSTM'),
(468, 'PURPOSIVE COMMUNICATION', 'GEC005', 'BSTM'),
(469, 'ART APPRECIATION', 'GEC006', 'BSTM'),
(470, 'TOURISM & HOSPITALITY 1 (MICRO PERSPECTIVE)', 'THC002', 'BSTM'),
(471, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSTM'),
(472, 'CWTS 2', 'NSTP122', 'BSTM'),
(473, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'BSTM'),
(474, 'ETHICS', 'GEC008', 'BSTM'),
(475, 'STRATEGIC MANAGEMENT', 'CBM002', 'BSTM'),
(476, 'TRANSPORTATION MANAGEMENT', 'TPC001', 'BSTM'),
(477, 'QUALITY SERVICE MANAGEMENT IN TOURISM & HOSPITALITY', 'THC005', 'BSTM'),
(478, 'FOREIGN LANGUAGE 1', 'THM001', 'BSTM'),
(479, 'CRUISE TOURISM', 'TME003', 'BSTM'),
(480, 'GENDER AND SOCIETY', 'GEE007', 'BSTM'),
(481, 'INDIVIDUAL AND DUAL SPORTS', 'PE003', 'BSTM'),
(482, 'ETHICS', 'GEC008', 'BSTM'),
(483, 'STRATEGIC MANAGEMENT', 'CBM002', 'BSTM'),
(484, 'TRANSPORTATION MANAGEMENT', 'TPC001', 'BSTM'),
(485, 'QUALITY SERVICE MANAGEMENT IN TOURISM & HOSPITALITY', 'THC005', 'BSTM'),
(486, 'FOREIGN LANGUAGE 1', 'THM001', 'BSTM'),
(487, 'CRUISE TOURISM', 'TME003', 'BSTM'),
(488, 'GENDER AND SOCIETY', 'GEE007', 'BSTM'),
(489, 'INDIVIDUAL AND DUAL SPORTS', 'PE003', 'BSTM'),
(490, 'SUSTAINABLE TOURISM', 'TPC004', 'BSTM'),
(491, 'TOURISM POLICY PLANNING & DEVELOPMENT', 'TPC005', 'BSTM'),
(492, 'APPLIED BUSINESS TOOLS AND TECHNOLOGIES IN TOURISM & HOSPITALITY', 'THM003', 'BSTM'),
(493, 'LIFE AND WORKS OF RIZAL', 'GEM001', 'BSTM'),
(494, 'TOURISM PRODUCT DEVELOPMENT', 'TME004', 'BSTM'),
(495, 'PROFESSIONAL DEVELOPMENT AND APPLIED ETHICS', 'THC009', 'BSTM'),
(496, 'SCIENCE, TECHNOLOGY & SOCIETY', 'GEC007', 'BSTM'),
(497, 'SUSTAINABLE TOURISM', 'TPC004', 'BSTM'),
(498, 'TOURISM POLICY PLANNING & DEVELOPMENT', 'TPC005', 'BSTM'),
(499, 'APPLIED BUSINESS TOOLS AND TECHNOLOGIES IN TOURISM & HOSPITALITY', 'THM003', 'BSTM'),
(500, 'LIFE AND WORKS OF RIZAL', 'GEM001', 'BSTM'),
(501, 'TOURISM PRODUCT DEVELOPMENT', 'TME004', 'BSTM'),
(502, 'PROFESSIONAL DEVELOPMENT AND APPLIED ETHICS', 'THC009', 'BSTM'),
(503, 'SCIENCE, TECHNOLOGY & SOCIETY', 'GEC007', 'BSTM'),
(504, 'PRACTICUM 2- AIRLINE OR OTHER TOURISM RELATED ESTABLISHMENT', 'TMP002', 'BSTM'),
(505, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSAIS'),
(506, 'ART APPRECIATION', 'GEC-006', 'BSAIS'),
(507, 'SCIENCE,TECH. AND SOCIETY', 'GEC-007', 'BSAIS'),
(508, 'ETHICS', 'GEC-008', 'BSAIS'),
(509, 'CONCEPTUAL FRAMEWORK & ACCOUNTING STANDARDS', 'ACC-122', 'BSAIS'),
(510, 'INTERMEDIATE ACCOUNTING 1', 'ACC-124', 'BSAIS'),
(511, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSAIS'),
(512, 'CIVIC WELFARE TRAINING SEVICES 2', 'NSTP-122', 'BSAIS'),
(513, 'PRINCIPLES OF ACCOUNTING (PART. & CORP.)', 'ACC-222', 'BSAIS'),
(514, 'INTEGRATED BUSINESS COURSE', 'IBC-001', 'BSAIS'),
(515, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSAIS'),
(516, 'ART APPRECIATION', 'GEC-006', 'BSAIS'),
(517, 'SCIENCE,TECH. AND SOCIETY', 'GEC-007', 'BSAIS'),
(518, 'ETHICS', 'GEC-008', 'BSAIS'),
(519, 'CONCEPTUAL FRAMEWORK & ACCOUNTING STANDARDS', 'ACC-122', 'BSAIS'),
(520, 'INTERMEDIATE ACCOUNTING 1', 'ACC-124', 'BSAIS'),
(521, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSAIS'),
(522, 'CIVIC WELFARE TRAINING SEVICES 2', 'NSTP-122', 'BSAIS'),
(523, 'PRINCIPLES OF ACCOUNTING (PART. & CORP.)', 'ACC-222', 'BSAIS'),
(524, 'ART APPRECIATION', 'GEC-006', 'BSBA-FMGT'),
(525, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSBA-FMGT'),
(526, 'ETHICS', 'GEC-008', 'BSBA-FMGT'),
(527, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-006', 'BSBA-FMGT'),
(528, 'NSTP- CWTS 2', 'NSTP-122', 'BSBA-FMGT'),
(529, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSBA-FMGT'),
(530, 'PRINCIPLES OF ACCOUNTING', 'ACC-111', 'BSBA-FMGT'),
(531, 'OBLIGATIONS AND CONTRACTS', 'LAW-001', 'BSBA-FMGT'),
(532, 'INCOME TAXATION', 'TAX-001', 'BSBA-FMGT'),
(533, 'CAPITAL MARKET', 'FMT-113', 'BSBA-FMGT'),
(534, 'CREDIT AND COLLECTION', 'FMT-114', 'BSBA-FMGT'),
(535, 'PERSONAL FINANCE', 'FMTE-001', 'BSBA-FMGT'),
(536, 'STRATEGIC MANAGEMENT', 'CBM-002', 'BSBA-FMGT'),
(537, 'PRINCIPLES OF ACCOUNTING 2 (PARTNERSHIP AND CORPORATION)', 'ACC-112-', 'BSBA-FMGT'),
(538, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSBA-FMGT'),
(539, 'OBLIGATIONS AND CONTRACTS', 'LAW-001', 'BSBA-FMGT'),
(540, 'INCOME TAXATION', 'TAX-001', 'BSBA-FMGT'),
(541, 'CAPITAL MARKET', 'FMT-113', 'BSBA-FMGT'),
(542, 'CREDIT AND COLLECTION', 'FMT-114', 'BSBA-FMGT'),
(543, 'PERSONAL FINANCE', 'FMTE-001', 'BSBA-FMGT'),
(544, 'STRATEGIC MANAGEMENT', 'CBM-002', 'BSBA-FMGT'),
(545, 'PRINCIPLES OF ACCOUNTING 2 (PARTNERSHIP AND CORPORATION)', 'ACC-112-', 'BSBA-FMGT'),
(546, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSBA-FMGT'),
(547, 'INTERNATIONAL BUSINESS AND TRADE', 'IBT-001', 'BSBA-FMGT'),
(548, 'FINANCIAL ANALYSIS AND REPORTING', 'FMT-117', 'BSBA-FMGT'),
(549, 'THESIS', 'BAC-008', 'BSBA-FMGT'),
(550, 'RISK MANAGEMENT', 'FMTE-003', 'BSBA-FMGT'),
(551, 'TREASURY MANAGEMENT', 'FMTE-004', 'BSBA-FMGT'),
(552, 'GLOBAL FINANCE WITH ELECTRONICS', 'FMTE-005', 'BSBA-FMGT'),
(553, 'TEAM SPORT', 'PE-004', 'BSBA-FMGT'),
(554, 'INCOME TAXATION', 'TAX-001', 'BSBA-FMGT'),
(555, 'INTERNATIONAL BUSINESS AND TRADE', 'IBT-001', 'BSBA-FMGT'),
(556, 'FINANCIAL ANALYSIS AND REPORTING', 'FMT-117', 'BSBA-FMGT'),
(557, 'THESIS', 'BAC-008', 'BSBA-FMGT'),
(558, 'RISK MANAGEMENT', 'FMTE-003', 'BSBA-FMGT'),
(559, 'TREASURY MANAGEMENT', 'FMTE-004', 'BSBA-FMGT'),
(560, 'GLOBAL FINANCE WITH ELECTRONICS', 'FMTE-005', 'BSBA-FMGT'),
(561, 'TEAM SPORT', 'PE-004', 'BSBA-FMGT'),
(562, 'INCOME TAXATION', 'TAX-001', 'BSBA-FMGT'),
(563, 'PUBLIC FINANCE', 'FMTE-007', 'BSBA-FMGT'),
(564, 'FINANCIAL CONTROLLERSHIP', 'FMTE-008', 'BSBA-FMGT'),
(565, 'WORK INTEGRATED LEARNING 2', 'PRAC-2', 'BSBA-FMGT'),
(566, 'PUBLIC FINANCE', 'FMTE-007', 'BSBA-FMGT'),
(567, 'FINANCIAL CONTROLLERSHIP', 'FMTE-008', 'BSBA-FMGT'),
(568, 'WORK INTEGRATED LEARNING 2', 'PRAC-2', 'BSBA-FMGT'),
(569, 'PUBLIC FINANCE', 'FMTE-007', 'BSBA-FMGT'),
(570, 'FINANCIAL CONTROLLERSHIP', 'FMTE-008', 'BSBA-FMGT'),
(571, 'WORK INTEGRATED LEARNING 2', 'PRAC-2', 'BSBA-FMGT'),
(572, 'PUBLIC FINANCE', 'FMTE-007', 'BSBA-FMGT'),
(573, 'FINANCIAL CONTROLLERSHIP', 'FMTE-008', 'BSBA-FMGT'),
(574, 'WORK INTEGRATED LEARNING 2', 'PRAC-2', 'BSBA-FMGT'),
(575, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSBA-HRM'),
(576, 'ART APPRECIATION', 'GEC-006', 'BSBA-HRM'),
(577, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSBA-HRM'),
(578, 'ETHICS', 'GEC-008', 'BSBA-HRM'),
(579, 'ORGANIZATIONAL DEVELOPMENT', 'HRM122', 'BSBA-HRM'),
(580, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-006', 'BSBA-HRM'),
(581, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSBA-HRM'),
(582, 'CWTS 2', 'NSTP-122', 'BSBA-HRM'),
(583, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSBA-HRM'),
(584, 'ART APPRECIATION', 'GEC-006', 'BSBA-HRM'),
(585, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSBA-HRM'),
(586, 'ETHICS', 'GEC-008', 'BSBA-HRM'),
(587, 'ORGANIZATIONAL DEVELOPMENT', 'HRM122', 'BSBA-HRM'),
(588, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-006', 'BSBA-HRM'),
(589, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSBA-HRM'),
(590, 'CWTS 2', 'NSTP-122', 'BSBA-HRM'),
(591, 'OBLIGATION AND CONTRACT', 'LAW-011', 'BSBA-HRM'),
(592, 'INCOME TAXATION', 'TAX-001', 'BSBA-HRM'),
(593, 'LOGISTIC MANAGEMENT', 'HRMEC-213', 'BSBA-HRM'),
(594, 'STRATEGIC MANAGEMENT', 'CBM-002', 'BSBA-HRM'),
(595, 'COMPENSATION ADMINISTRATION', 'HRM-221', 'BSBA-HRM'),
(596, 'HUMAN RESOURCE MANAGEMENT', 'HRM-001', 'BSBA-HRM'),
(597, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSBA-HRM'),
(598, 'PRINCIPLES OF ACCOUNTING', 'ACC-122', 'BSBA-HRM'),
(599, 'OBLIGATION AND CONTRACT', 'LAW-011', 'BSBA-HRM'),
(600, 'INCOME TAXATION', 'TAX-001', 'BSBA-HRM'),
(601, 'LOGISTIC MANAGEMENT', 'HRMEC-213', 'BSBA-HRM'),
(602, 'STRATEGIC MANAGEMENT', 'CBM-002', 'BSBA-HRM'),
(603, 'COMPENSATION ADMINISTRATION', 'HRM-221', 'BSBA-HRM'),
(604, 'HUMAN RESOURCE MANAGEMENT', 'HRM-001', 'BSBA-HRM'),
(605, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSBA-HRM'),
(606, 'PRINCIPLES OF ACCOUNTING', 'ACC-122', 'BSBA-HRM'),
(607, 'INTERNATIONAL BUSSINESS TRADE', 'IBT-001', 'BSBA-HRM'),
(608, 'PROJECT MANAGEMENT', 'HRMEC-314', 'BSBA-HRM'),
(609, 'MANAGERIAL ACCOUNTING', 'HRMEC-311', 'BSBA-HRM'),
(610, 'LABOR RELATIONS AND NEGOTATIONS', 'HRM-321', 'BSBA-HRM'),
(611, 'OPERATION MANAGEMENT ( TQM )', 'CBM-001', 'BSBA-HRM'),
(612, 'GENDER and SOCIETY', 'GEE-007', 'BSBA-HRM'),
(613, 'TEAM SPORTS', 'PE-004', 'BSBA-HRM'),
(614, 'INTERNATIONAL BUSSINESS TRADE', 'IBT-001', 'BSBA-HRM'),
(615, 'PROJECT MANAGEMENT', 'HRMEC-314', 'BSBA-HRM'),
(616, 'MANAGERIAL ACCOUNTING', 'HRMEC-311', 'BSBA-HRM'),
(617, 'LABOR RELATIONS AND NEGOTATIONS', 'HRM-321', 'BSBA-HRM'),
(618, 'OPERATION MANAGEMENT ( TQM )', 'CBM-001', 'BSBA-HRM'),
(619, 'GENDER and SOCIETY', 'GEE-007', 'BSBA-HRM'),
(620, 'TEAM SPORTS', 'PE-004', 'BSBA-HRM'),
(621, 'INTERNATIONAL BUSSINESS TRADE', 'IBT-001', 'BSBA-HRM'),
(622, 'PROJECT MANAGEMENT', 'HRMEC-314', 'BSBA-HRM'),
(623, 'MANAGERIAL ACCOUNTING', 'HRMEC-311', 'BSBA-HRM'),
(624, 'LABOR RELATIONS AND NEGOTATIONS', 'HRM-321', 'BSBA-HRM'),
(625, 'OPERATION MANAGEMENT ( TQM )', 'CBM-001', 'BSBA-HRM'),
(626, 'GENDER and SOCIETY', 'GEE-007', 'BSBA-HRM'),
(627, 'TEAM SPORTS', 'PE-004', 'BSBA-HRM'),
(628, 'INTERNSHIP', 'HRM-401', 'BSBA-HRM'),
(629, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSBA-MKMGT'),
(630, 'ARTS APPRECIATION', 'GEC-006', 'BSBA-MKMGT'),
(631, 'SCIENCE. TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSBA-MKMGT'),
(632, 'ETHICS', 'GEC-008', 'BSBA-MKMGT'),
(633, 'CONSUMER BEHAVIOR', 'MKTECK-121', 'BSBA-MKMGT'),
(634, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSBA-MKMGT'),
(635, 'CWTS 2', 'NSTP-122', 'BSBA-MKMGT'),
(636, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSBA-MKMGT'),
(637, 'ARTS APPRECIATION', 'GEC-006', 'BSBA-MKMGT'),
(638, 'SCIENCE. TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSBA-MKMGT'),
(639, 'ETHICS', 'GEC-008', 'BSBA-MKMGT'),
(640, 'CONSUMER BEHAVIOR', 'MKTECK-121', 'BSBA-MKMGT'),
(641, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSBA-MKMGT'),
(642, 'CWTS 2', 'NSTP-122', 'BSBA-MKMGT'),
(643, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'BSBA-MKMGT'),
(644, 'OPERATION MANGEMENT (TQM)', 'CBM-001', 'BSBA-MKMGT'),
(645, 'BUSINESS RESEARCH (THESIS)', 'RES-001', 'BSBA-MKMGT'),
(646, 'PRODUCT MANAGEMENT', 'MKT-223', 'BSBA-MKMGT'),
(647, 'DISTRIBUTION MANAGEMENT', 'MKT-224', 'BSBA-MKMGT'),
(648, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSBA-MKMGT'),
(649, 'MULTIMEDIA ARTS (VIDEOGRAPHICS)', 'COM--002', 'BSBA-MKMGT'),
(650, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSBA-MKMGT'),
(651, 'PRINCIPLES OF ACCOUNTING 2', 'ACC-222', 'BSBA-MKMGT'),
(652, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'BSBA-MKMGT'),
(653, 'OPERATION MANGEMENT (TQM)', 'CBM-001', 'BSBA-MKMGT'),
(654, 'BUSINESS RESEARCH (THESIS)', 'RES-001', 'BSBA-MKMGT'),
(655, 'PRODUCT MANAGEMENT', 'MKT-223', 'BSBA-MKMGT'),
(656, 'DISTRIBUTION MANAGEMENT', 'MKT-224', 'BSBA-MKMGT'),
(657, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSBA-MKMGT'),
(658, 'MULTIMEDIA ARTS (VIDEOGRAPHICS)', 'COM--002', 'BSBA-MKMGT'),
(659, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSBA-MKMGT'),
(660, 'PRINCIPLES OF ACCOUNTING 2', 'ACC-222', 'BSBA-MKMGT'),
(661, 'INTERNATIONAL BUSINESS AND TRADE', 'IBT-001', 'BSBA-MKMGT'),
(662, 'MARKETING MANAGEMENT', 'MKT-328', 'BSBA-MKMGT'),
(663, 'SERVICES MARKETING', 'MKT-329', 'BSBA-MKMGT'),
(664, 'PRICING STRATEGY', 'MKT-330', 'BSBA-MKMGT'),
(665, 'E-COMMERCE AND DIGITAL MARKETING', 'MKTEC-322', 'BSBA-MKMGT'),
(666, 'WINDOWS APPLICATION', 'COM-001', 'BSBA-MKMGT'),
(667, 'SPECIAL TOPICS IN MARKETING MANAGEMENT', 'MKTEC-323', 'BSBA-MKMGT'),
(668, 'TEAM SPORTS', 'PE-004', 'BSBA-MKMGT'),
(669, 'INTERNATIONAL BUSINESS AND TRADE', 'IBT-001', 'BSBA-MKMGT'),
(670, 'MARKETING MANAGEMENT', 'MKT-328', 'BSBA-MKMGT'),
(671, 'SERVICES MARKETING', 'MKT-329', 'BSBA-MKMGT'),
(672, 'PRICING STRATEGY', 'MKT-330', 'BSBA-MKMGT'),
(673, 'E-COMMERCE AND DIGITAL MARKETING', 'MKTEC-322', 'BSBA-MKMGT'),
(674, 'WINDOWS APPLICATION', 'COM-001', 'BSBA-MKMGT'),
(675, 'SPECIAL TOPICS IN MARKETING MANAGEMENT', 'MKTEC-323', 'BSBA-MKMGT'),
(676, 'TEAM SPORTS', 'PE-004', 'BSBA-MKMGT'),
(677, 'PRACTICUM (INTERSHIP & IMMERSION MKT.)', 'MKTP-422', 'BSBA-MKMGT'),
(678, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'BSHM'),
(679, 'PURPOSIVE COMMUNICATION', 'GEC005', 'BSHM'),
(680, 'ART APPRECIATION', 'GEC006', 'BSHM'),
(681, 'TOURISM & HOSPITALITY 1 (MICRO PERSPECTIVE)', 'THC002', 'BSHM'),
(682, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSHM'),
(683, 'CWTS 2', 'NSTP122', 'BSHM'),
(684, 'ENVIRONMENTAL SCIENCE', 'GEE001', 'BSHM'),
(685, 'MATHEMATICS IN THE MODERN WORLD', 'GEC004', 'BSHM'),
(686, 'PURPOSIVE COMMUNICATION', 'GEC005', 'BSHM'),
(687, 'ART APPRECIATION', 'GEC006', 'BSHM'),
(688, 'TOURISM & HOSPITALITY 1 (MICRO PERSPECTIVE)', 'THC002', 'BSHM'),
(689, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSHM'),
(690, 'CWTS 2', 'NSTP122', 'BSHM'),
(691, 'ENVIRONMENTAL SCIENCE', 'GEE001', 'BSHM'),
(692, 'GENDER AND SOCIETY', 'GEE007', 'BSHM'),
(693, 'STRATEGIC MANAGEMENT', 'CBM002', 'BSHM'),
(694, 'KITCHEN ESSENTIALS & BASIC FOOD PREPARATION', 'HPC001', 'BSHM'),
(695, 'QUALITY SERVICE MANAGEMENT IN TOURISM & HOSPITALITY', 'THC005', 'BSHM'),
(696, 'FOREIGN LANGUAGE 1', 'THM001', 'BSHM'),
(697, 'INDIVIDUAL AND DUAL SPORTS', 'PE003', 'BSHM'),
(698, 'TOURISM & HOSPITALITY MARKETING', 'THC006', 'BSHM'),
(699, 'ELECTIVE 1', 'HME001', 'BSHM'),
(700, 'GENDER AND SOCIETY', 'GEE007', 'BSHM'),
(701, 'STRATEGIC MANAGEMENT', 'CBM002', 'BSHM'),
(702, 'KITCHEN ESSENTIALS & BASIC FOOD PREPARATION', 'HPC001', 'BSHM'),
(703, 'QUALITY SERVICE MANAGEMENT IN TOURISM & HOSPITALITY', 'THC005', 'BSHM'),
(704, 'FOREIGN LANGUAGE 1', 'THM001', 'BSHM'),
(705, 'INDIVIDUAL AND DUAL SPORTS', 'PE003', 'BSHM'),
(706, 'TOURISM & HOSPITALITY MARKETING', 'THC006', 'BSHM'),
(707, 'ELECTIVE 1', 'HME001', 'BSHM'),
(708, 'SUPPLY CHAIN MANAGEMENT IN HOSPITALITY INDUSTRY', 'HPC004', 'BSHM'),
(709, 'ERGONOMICS AND FACILITIES PLANNING FOR THE HOSPITALITY INDUSTRY', 'HPC005', 'BSHM'),
(710, 'APPLIED BUSINESS TOOLS AND TECHNOLOGIES IN TOURISM AND HOSPITALITY', 'THM003', 'BSHM'),
(711, 'BREAD AND PASTRY', 'HME007', 'BSHM'),
(712, 'PROFESSIONAL DEVELOPMENT AND APPLIED ETHICS', 'THC009', 'BSHM'),
(713, 'MULTICULTURAL DIVERSITY IN THE WORKSPACE FOR THE TOURISM PROFESSIONAL', 'THC010', 'BSHM'),
(714, 'LIFE AND WORKS OF RIZAL', 'GEM001', 'BSHM'),
(715, 'SUPPLY CHAIN MANAGEMENT IN HOSPITALITY INDUSTRY', 'HPC004', 'BSHM'),
(716, 'ERGONOMICS AND FACILITIES PLANNING FOR THE HOSPITALITY INDUSTRY', 'HPC005', 'BSHM'),
(717, 'APPLIED BUSINESS TOOLS AND TECHNOLOGIES IN TOURISM AND HOSPITALITY', 'THM003', 'BSHM'),
(718, 'BREAD AND PASTRY', 'HME007', 'BSHM'),
(719, 'PROFESSIONAL DEVELOPMENT AND APPLIED ETHICS', 'THC009', 'BSHM'),
(720, 'MULTICULTURAL DIVERSITY IN THE WORKSPACE FOR THE TOURISM PROFESSIONAL', 'THC010', 'BSHM'),
(721, 'LIFE AND WORKS OF RIZAL', 'GEM001', 'BSHM'),
(722, 'PRACTICUM 2-HOTEL OR ACCOMMODATION ESTABLISHMENTS', 'HMP002', 'BSHM'),
(723, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSA'),
(724, 'ART APPRECIATION', 'GEC-006', 'BSA'),
(725, 'SCIENCE, TECHNOLOGY, AND SOCIETY', 'GEC-007', 'BSA'),
(726, 'ETHICS', 'GEC-008', 'BSA'),
(727, 'CONCEPTUAL FRAMEWORK AND ACCOUNTING STANDARDS', 'ACC-122', 'BSA'),
(728, 'RHYTHMIC ACTIVITIES', 'PE--002', 'BSA'),
(729, 'CIVIC WELFARE TRAINING SERVICES 2', 'NSTP-122', 'BSA'),
(730, 'INTERMEDIATE ACCOUNTING 1', 'ACC-124', 'BSA'),
(731, 'INTEGRATED BUSINESS COURSE', 'IBC-001', 'BSA'),
(732, 'PRINCIPLES OF ACCTG. 2', 'ACC-222', 'BSA'),
(733, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSA'),
(734, 'ART APPRECIATION', 'GEC-006', 'BSA'),
(735, 'SCIENCE, TECHNOLOGY, AND SOCIETY', 'GEC-007', 'BSA'),
(736, 'ETHICS', 'GEC-008', 'BSA'),
(737, 'CONCEPTUAL FRAMEWORK AND ACCOUNTING STANDARDS', 'ACC-122', 'BSA'),
(738, 'RHYTHMIC ACTIVITIES', 'PE--002', 'BSA'),
(739, 'CIVIC WELFARE TRAINING SERVICES 2', 'NSTP-122', 'BSA'),
(740, 'INTERMEDIATE ACCOUNTING 1', 'ACC-124', 'BSA'),
(741, 'INTEGRATED BUSINESS COURSE', 'IBC-001', 'BSA'),
(742, 'PRINCIPLES OF ACCTG. 2', 'ACC-222', 'BSA'),
(743, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BSA'),
(744, 'ART APPRECIATION', 'GEC-006', 'BSA'),
(745, 'SCIENCE, TECHNOLOGY, AND SOCIETY', 'GEC-007', 'BSA'),
(746, 'ETHICS', 'GEC-008', 'BSA'),
(747, 'CONCEPTUAL FRAMEWORK AND ACCOUNTING STANDARDS', 'ACC-122', 'BSA'),
(748, 'RHYTHMIC ACTIVITIES', 'PE--002', 'BSA'),
(749, 'CIVIC WELFARE TRAINING SERVICES 2', 'NSTP-122', 'BSA'),
(750, 'INTERMEDIATE ACCOUNTING 1', 'ACC-124', 'BSA'),
(751, 'INTEGRATED BUSINESS COURSE', 'IBC-001', 'BSA'),
(752, 'PRINCIPLES OF ACCTG. 2', 'ACC-222', 'BSA'),
(753, 'BUSINESS TAXATION', 'TAX-212', 'BSA'),
(754, 'INTERMEDIATE ACCOUNTING 2', 'ACC-215', 'BSA'),
(755, 'STRATEGIC COST MANAGEMENT 1', 'ACC-226', 'BSA'),
(756, 'INTERMEDIATE ACCOUNTING 3', 'ACC-227', 'BSA'),
(757, 'REGULATORY FRAMEWORK & LEGAL ISSUES IN BUSINESS', 'LAW-223', 'BSA'),
(758, 'MANAGEMENT SCIENCE', 'MGT-211', 'BSA'),
(759, 'PHILIPPINE INDIGENIOUS COMMUNITIES', 'GEE-006', 'BSA'),
(760, 'INDIVIDUAL & DUAL SPORTS', 'PE-OO3', 'BSA'),
(761, 'GENDER AND SOCIETY', 'GEE-007', 'BSA'),
(762, 'BUSINESS LAWS AND REGULATIONS', 'LAW-212', 'BSA'),
(763, 'BUSINESS TAXATION', 'TAX-212', 'BSA'),
(764, 'INTERMEDIATE ACCOUNTING 2', 'ACC-215', 'BSA'),
(765, 'STRATEGIC COST MANAGEMENT 1', 'ACC-226', 'BSA'),
(766, 'INTERMEDIATE ACCOUNTING 3', 'ACC-227', 'BSA'),
(767, 'REGULATORY FRAMEWORK & LEGAL ISSUES IN BUSINESS', 'LAW-223', 'BSA'),
(768, 'MANAGEMENT SCIENCE', 'MGT-211', 'BSA'),
(769, 'PHILIPPINE INDIGENIOUS COMMUNITIES', 'GEE-006', 'BSA'),
(770, 'INDIVIDUAL & DUAL SPORTS', 'PE-OO3', 'BSA'),
(771, 'GENDER AND SOCIETY', 'GEE-007', 'BSA'),
(772, 'BUSINESS LAWS AND REGULATIONS', 'LAW-212', 'BSA'),
(773, 'BUSINESS TAXATION', 'TAX-212', 'BSA'),
(774, 'INTERMEDIATE ACCOUNTING 2', 'ACC-215', 'BSA'),
(775, 'STRATEGIC COST MANAGEMENT 1', 'ACC-226', 'BSA'),
(776, 'INTERMEDIATE ACCOUNTING 3', 'ACC-227', 'BSA'),
(777, 'REGULATORY FRAMEWORK & LEGAL ISSUES IN BUSINESS', 'LAW-223', 'BSA'),
(778, 'MANAGEMENT SCIENCE', 'MGT-211', 'BSA'),
(779, 'PHILIPPINE INDIGENIOUS COMMUNITIES', 'GEE-006', 'BSA'),
(780, 'INDIVIDUAL & DUAL SPORTS', 'PE-OO3', 'BSA'),
(781, 'GENDER AND SOCIETY', 'GEE-007', 'BSA'),
(782, 'BUSINESS LAWS AND REGULATIONS', 'LAW-212', 'BSA'),
(783, 'INTERMEDIATE FINANCIAL REPORTING', 'ACC-314', 'BSA'),
(784, 'GOVERNANCE, BUSINESS ETHICS, RISK MANAGEMENT AND INTERNAL CONTROL', 'ACC-315', 'BSA'),
(785, 'ACCOUNTING INTERNSHIP', 'ACC-316', 'BSA'),
(786, 'ACCOUNTING RESEARCH', 'ACC-317', 'BSA'),
(787, 'AUDITING AND ASSURANCE: CONCEPTS & APPLICATIONS 1', 'ACC-318', 'BSA'),
(788, 'INFORMATION SECURITY AND MANAGEMENT', 'ELEC-322', 'BSA'),
(789, 'INDIVIDUAL & DUAL SPORTS', 'PE-OO3', 'BSA'),
(790, 'INTERMEDIATE FINANCIAL REPORTING', 'ACC-314', 'BSA'),
(791, 'GOVERNANCE, BUSINESS ETHICS, RISK MANAGEMENT AND INTERNAL CONTROL', 'ACC-315', 'BSA'),
(792, 'ACCOUNTING INTERNSHIP', 'ACC-316', 'BSA'),
(793, 'ACCOUNTING RESEARCH', 'ACC-317', 'BSA'),
(794, 'AUDITING AND ASSURANCE: CONCEPTS & APPLICATIONS 1', 'ACC-318', 'BSA'),
(795, 'INFORMATION SECURITY AND MANAGEMENT', 'ELEC-322', 'BSA'),
(796, 'INDIVIDUAL & DUAL SPORTS', 'PE-OO3', 'BSA'),
(797, 'INTERMEDIATE FINANCIAL REPORTING', 'ACC-314', 'BSA'),
(798, 'GOVERNANCE, BUSINESS ETHICS, RISK MANAGEMENT AND INTERNAL CONTROL', 'ACC-315', 'BSA'),
(799, 'ACCOUNTING INTERNSHIP', 'ACC-316', 'BSA'),
(800, 'ACCOUNTING RESEARCH', 'ACC-317', 'BSA'),
(801, 'AUDITING AND ASSURANCE: CONCEPTS & APPLICATIONS 1', 'ACC-318', 'BSA'),
(802, 'INFORMATION SECURITY AND MANAGEMENT', 'ELEC-322', 'BSA'),
(803, 'INDIVIDUAL & DUAL SPORTS', 'PE-OO3', 'BSA'),
(804, 'ACCOUNTING INTEGRATION 1: FINANCIAL ACCOUNTING AND REPORTING', 'IA-1', 'BSA'),
(805, 'ACCOUNTING INTEGRATION 2: ADVANCED FINANCIAL ACCOUNTING AND REPORTING', 'IA-2', 'BSA'),
(806, 'ACCOUNTING INTEGRATION 3: MANAGEMENT ADVISORY SERVICES', 'IA-3', 'BSA'),
(807, 'ACCOUNTING INTEGRATION 4: AUDITING THEORY', 'IA-4', 'BSA'),
(808, 'ACCOUNTING INTEGRATION 5: APPLIED AUDITING', 'IA-5', 'BSA'),
(809, 'ACCOUNTING INTEGRATION 6: REGULATORY FRAMEWORK FOR BUSINESS TRANSACTIONS', 'IA-6', 'BSA'),
(810, 'ACCOUNTING INTEGRATION 7: TAXATION', 'IA-7', 'BSA'),
(811, 'INTRODUCTION TO PHILIPPINE CRIMINAL JUSTICE SYSTEM', 'CLJ-121', 'BSCRIM'),
(812, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BSCRIM'),
(813, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSCRIM'),
(814, 'ART APPRECIATION', 'GEC-006', 'BSCRIM'),
(815, 'INTRODUCTION TO LITERATURE', 'LIT-001', 'BSCRIM'),
(816, 'ARNIS AND DISARMING TECHNIQUES', 'DT-002', 'BSCRIM'),
(817, 'MILITARY SCIENCE 2', 'NSTP-122', 'BSCRIM'),
(818, 'INTRODUCTION TO INDUSTRIAL SECURITY CONCEPT', 'LEA-003', 'BSCRIM'),
(819, 'HUMAN BEHAVIOR AND VICTIMOLOGY', 'CRIM-313', 'BSCRIM'),
(820, 'SPECIALIZED CRIME INVESTIGATION W/ LEGAL MEDICINE', 'CDI-222', 'BSCRIM'),
(821, 'INSTITUTIONAL CORRECTION', 'CA-001', 'BSCRIM'),
(822, 'FORENSIC PHOTOGRAPHY W/ 1 HOUR LAB', 'FOR-001', 'BSCRIM'),
(823, 'PERSONAL IDENTIFICATION', 'FOR-002', 'BSCRIM'),
(824, 'CHARACTER FORMATION 1 – NATIONALISM & PATRIOTISM', 'CLFM-001', 'BSCRIM'),
(825, 'ORGANIC CHEMISTRY', 'ADGE-001', 'BSCRIM'),
(826, 'FUNDAMENTALS OF MARKSMANSHIP', 'DT-004', 'BSCRIM'),
(827, 'PROFESSIONAL CONDUCT AND ETHICAL STANDARD', 'CRIM-324', 'BSCRIM'),
(828, 'JUVENILE DELINQUENCY & JUVENILE JUSTICE SYSTEM', 'CRIM-325', 'BSCRIM'),
(829, 'CRIMINAL LAW BOOK 2', 'CLJ-324', 'BSCRIM'),
(830, 'TECHNICAL ENGLISH INVESTIGATIVE REPORT WRITING', 'CDI-325', 'BSCRIM'),
(831, 'FIRE PROTECTION AND ARSON INVESTIGATION', 'CDI-326', 'BSCRIM'),
(832, 'QUESTIONED DOCUMENTS EXAMINATION', 'FOR-004', 'BSCRIM'),
(833, 'LIE DETECTION TECHNIQUE W/ 1 HR LAB', 'FOR-005', 'BSCRIM'),
(834, 'NON INSTITUTIONAL CORRECTION', 'CA-002', 'BSCRIM'),
(835, 'CRIMINOLOGICAL RESEARCH 2 (THESIS WRITING & PRESENTATION', 'CRIM-428', 'BSCRIM'),
(836, 'CRIMINAL PROCEDURE AND COURT TESTIMONY', 'CLJ-426', 'BSCRIM'),
(837, 'TECHNICAL ENGLISH 2 (LEGAL FORMS)', 'CDI-428', 'BSCRIM'),
(838, 'INTRODUCTION TO CYBERCRIME AND ENVIRONMENTAL LAWS AND PROTECTION (W/1 HR LAB)', 'CDI-429', 'BSCRIM'),
(839, 'FORENSIC BALLISTICS (W/HR LAB)', 'FOR-006', 'BSCRIM'),
(840, 'INTERSHIP (OJT 2)', 'CP-422', 'BSCRIM'),
(841, 'COMPUTER PROGRAMMING 2', 'CCS-103', 'BSIS'),
(842, 'WEB DEVELOPMENT 1', 'CCS-107', 'BSIS'),
(843, 'TECHNICAL COMPUTER CONCEPT', 'CCS-108', 'BSIS'),
(844, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSIS'),
(845, 'COLLEGE ALGEBRA', 'PR-001', 'BSIS'),
(846, 'ETHICS', 'GEC-008', 'BSIS'),
(847, 'NSTP 2', 'NSTP-122', 'BSIS'),
(848, 'COMPUTER PROGRAMMING 2', 'CCS-103', 'BSIS'),
(849, 'WEB DEVELOPMENT 1', 'CCS-107', 'BSIS'),
(850, 'TECHNICAL COMPUTER CONCEPT', 'CCS-108', 'BSIS'),
(851, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSIS'),
(852, 'COLLEGE ALGEBRA', 'PR-001', 'BSIS'),
(853, 'ETHICS', 'GEC-008', 'BSIS'),
(854, 'NSTP 2', 'NSTP-122', 'BSIS'),
(855, 'APPLICATION DEVELOPMENT AND EMERGING TECHNOLOGIES', 'CCS-106', 'BSIS'),
(856, 'COMPUTER GRAPHICS 1', 'CCS-110', 'BSIS'),
(857, 'WEB DEVELOPMENT 2', 'CCS-116', 'BSIS'),
(858, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSIS'),
(859, 'QUANTITATIVE METHODS', 'PR-003', 'BSIS'),
(860, 'READING VISUAL ART', 'GEE-001', 'BSIS'),
(861, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSIS'),
(862, 'SOFTWARE ENGINEERING', 'CCS-111', 'BSIS'),
(863, 'IT INFRASTRUCTURE AND NETWORK TECHNOLOGIES', 'IS-104', 'BSIS'),
(864, 'IS MAJOR ELECTIVE 1', 'IS-106', 'BSIS'),
(865, 'BUSINESS INTELLIGENCE', 'IS-110', 'BSIS'),
(866, 'CUSTOMER RELATION MANAGEMENT', 'IS-109', 'BSIS'),
(867, 'DATA MINING', 'IS-108', 'BSIS'),
(868, 'ART APPRECIATION', 'GEC-006', 'BSIS'),
(869, 'TEAM SPORTS', 'PE-004', 'BSIS'),
(870, 'SOFTWARE ENGINEERING', 'CCS-111', 'BSIS'),
(871, 'IT INFRASTRUCTURE AND NETWORK TECHNOLOGIES', 'IS-104', 'BSIS'),
(872, 'IS MAJOR ELECTIVE 1', 'IS-106', 'BSIS'),
(873, 'BUSINESS INTELLIGENCE', 'IS-110', 'BSIS'),
(874, 'CUSTOMER RELATION MANAGEMENT', 'IS-109', 'BSIS'),
(875, 'DATA MINING', 'IS-108', 'BSIS'),
(876, 'ART APPRECIATION', 'GEC-006', 'BSIS'),
(877, 'TEAM SPORTS', 'PE-004', 'BSIS'),
(878, 'CURRENT TRENDS IN IT AND SEMINAR', 'CCS-115', 'BSIS'),
(879, 'IS ADVANCE SPECIAL TOPICS', 'CCS-120', 'BSIS'),
(880, 'CAPSTONE PROJECT 2', 'CCS-121', 'BSIS'),
(881, 'EVALUATION OF BUSINESS PERFORMANCE', 'IS-116', 'BSIS'),
(882, 'PRACTICUM 2', 'CCS-123', 'BSIS'),
(883, 'IT SERVICE MANAGEMENT', 'IS-423', 'BSIS'),
(884, 'CURRENT TRENDS IN IT AND SEMINAR', 'CCS-115', 'BSIS'),
(885, 'IS ADVANCE SPECIAL TOPICS', 'CCS-120', 'BSIS'),
(886, 'CAPSTONE PROJECT 2', 'CCS-121', 'BSIS'),
(887, 'EVALUATION OF BUSINESS PERFORMANCE', 'IS-116', 'BSIS'),
(888, 'PRACTICUM 2', 'CCS-123', 'BSIS'),
(889, 'IT SERVICE MANAGEMENT', 'IS-423', 'BSIS'),
(890, 'PHILIPPINE POLITICS AND GOVERNANCE', 'PSM-121', 'ABPOLSCI'),
(891, 'THE CONTEMPORARY WORLD', 'GEC-003', 'ABPOLSCI'),
(892, 'MATHEMATICS OF THE MODERN WORLD', 'GEC-004', 'ABPOLSCI');
INSERT INTO `cms_subjects` (`id`, `subject`, `subject_code`, `course`) VALUES
(893, 'ART APPRECIATION', 'GEC-006', 'ABPOLSCI'),
(894, 'STRATEGIC COST MANAGEMENT 1', 'ACC-226', 'BSAIS'),
(895, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'ABPOLSCI'),
(896, 'POLITICS & GOVERNANCE OF SOUTH EAST ASIA', 'PSM-221', 'ABPOLSCI'),
(897, 'NSTP - CWTS 2', 'NSTP-122', 'ABPOLSCI'),
(898, 'RHYTHMIC ACTIVITIES', 'PE-002', 'ABPOLSCI'),
(899, 'PHILIPPINE POLITICS AND GOVERNANCE', 'PSM-121', 'ABPOLSCI'),
(900, 'PROJECT MANAGEMENT', 'PCE-001', 'BSAIS'),
(901, 'THE CONTEMPORARY WORLD', 'GEC-003', 'ABPOLSCI'),
(902, 'TEAM SPORTS', 'PE-004', 'BSAIS'),
(903, 'MATHEMATICS OF THE MODERN WORLD', 'GEC-004', 'ABPOLSCI'),
(904, 'ART APPRECIATION', 'GEC-006', 'ABPOLSCI'),
(905, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'ABPOLSCI'),
(906, 'POLITICS & GOVERNANCE OF SOUTH EAST ASIA', 'PSM-221', 'ABPOLSCI'),
(907, 'NSTP - CWTS 2', 'NSTP-122', 'ABPOLSCI'),
(908, 'RHYTHMIC ACTIVITIES', 'PE-002', 'ABPOLSCI'),
(909, 'INTRODUCTION TO INTERNATIONAL RELATIONS', 'PSM-222', 'ABPOLSCI'),
(910, 'ACCOUNTING INFORMATION SYSTEM RESEARCH', 'ACC-319', 'BSAIS'),
(911, 'QUALITATIVE & QUANTITATIVE ANALYSIS OF POLITICAL DATA', 'PSM-223', 'ABPOLSCI'),
(912, 'INTERNATIONAL LAW', 'PSE-221', 'ABPOLSCI'),
(913, 'MANAGEMENT INFORMATION SYSTEM', 'PCE-008', 'BSAIS'),
(914, 'ARGUMENTATION AND DEBATE', 'PSE-222', 'ABPOLSCI'),
(915, 'PARLIAMENTARY PROCEDURE', 'PSE-223', 'ABPOLSCI'),
(916, 'ENVIRONMENTAL SCIENCE', 'GEE-003', 'ABPOLSCI'),
(917, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'ABPOLSCI'),
(918, 'FINANCIAL MODELLING', 'PCE-010', 'BSAIS'),
(919, 'INTRO TO POLITICAL ANALYSIS AND RESEARCH', 'PSM-321', 'ABPOLSCI'),
(920, 'STRATEGIC COST MANAGEMENT', 'ACC-226', 'BSAIS'),
(921, 'ANCIENT MEDIEVAL MODERN POLITICAL PHILOSOPHY', 'POE-322', 'ABPOLSCI'),
(922, 'STATISTICAL ANALYSIS WITH SOFTWARE APPLICATION', 'MGT-313', 'BSAIS'),
(923, 'INTERNATIONAL REGIONAL ORGANIZATIONS', 'POE-323', 'ABPOLSCI'),
(924, 'ACCOUNTING INFORMATION SYSTEM RESEARCH', 'ACC-319', 'BSAIS'),
(925, 'LEADERSHIP AND ORGANIZATION CHANGE', 'POE-324', 'ABPOLSCI'),
(926, 'POLITICAL PARTY MOVEMENT', 'POE-325', 'ABPOLSCI'),
(927, 'PUBLIC FISCAL ADMINISTRATION', 'POE-326', 'ABPOLSCI'),
(928, 'MANAGEMENT INFORMATION SYSTEM', 'PCE-008', 'BSAIS'),
(929, 'INTRO TO POLITICAL ANALYSIS AND RESEARCH', 'PSM-321', 'ABPOLSCI'),
(930, 'FINANCIAL MODELLING', 'PCE-010', 'BSAIS'),
(931, 'ANCIENT MEDIEVAL MODERN POLITICAL PHILOSOPHY', 'POE-322', 'ABPOLSCI'),
(932, 'INTERNATIONAL REGIONAL ORGANIZATIONS', 'POE-323', 'ABPOLSCI'),
(933, 'LEADERSHIP AND ORGANIZATION CHANGE', 'POE-324', 'ABPOLSCI'),
(934, 'POLITICAL PARTY MOVEMENT', 'POE-325', 'ABPOLSCI'),
(935, 'PUBLIC FISCAL ADMINISTRATION', 'POE-326', 'ABPOLSCI'),
(936, 'INTRO TO POLITICAL ANALYSIS AND RESEARCH', 'PSM-321', 'ABPOLSCI'),
(937, 'STRATEGIC COST MANAGEMENT', 'ACC-226', 'BSAIS'),
(938, 'ANCIENT MEDIEVAL MODERN POLITICAL PHILOSOPHY', 'POE-322', 'ABPOLSCI'),
(939, 'INTERNATIONAL REGIONAL ORGANIZATIONS', 'POE-323', 'ABPOLSCI'),
(940, 'STATISTICAL ANALYSIS WITH SOFTWARE APPLICATION', 'MGT-313', 'BSAIS'),
(941, 'LEADERSHIP AND ORGANIZATION CHANGE', 'POE-324', 'ABPOLSCI'),
(942, 'ACCOUNTING INFORMATION SYSTEM RESEARCH', 'ACC-319', 'BSAIS'),
(943, 'MANAGEMENT INFORMATION SYSTEM', 'PCE-008', 'BSAIS'),
(944, 'POLITICAL PARTY MOVEMENT', 'POE-325', 'ABPOLSCI'),
(945, 'FINANCIAL MODELLING', 'PCE-010', 'BSAIS'),
(946, 'PUBLIC FISCAL ADMINISTRATION', 'POE-326', 'ABPOLSCI'),
(947, 'SPECIAL TOPIC: PHILIPPINE GOVERNMENT AND POLITICS', 'POE-421', 'ABPOLSCI'),
(948, 'STRATEGIC COST MANAGEMENT', 'ACC-226', 'BSAIS'),
(949, 'SEMINAR IN POLITICAL SCIENCE', 'POE-422-', 'ABPOLSCI'),
(950, 'STRATEGIC MANAGEMENT', 'CBM-002', 'BSAIS'),
(951, 'THESIS WRITING', 'POE-423-', 'ABPOLSCI'),
(952, 'STATISTICAL ANALYSIS WITH SOFTWARE APPLICATION', 'MGT-313', 'BSAIS'),
(953, 'ON -THE-JOB TRAINING IN LAW FIRM', 'PSI-424', 'ABPOLSCI'),
(954, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BS-ENTREP'),
(955, 'STATUTORY CONSTRUCTION', 'IER-005', 'ABPOLSCI'),
(956, 'SPECIAL TOPIC: PHILIPPINE GOVERNMENT AND POLITICS', 'POE-421', 'ABPOLSCI'),
(957, 'SEMINAR IN POLITICAL SCIENCE', 'POE-422-', 'ABPOLSCI'),
(958, 'THESIS WRITING', 'POE-423-', 'ABPOLSCI'),
(959, 'ART APPRECIATION', 'GEC-006', 'BS-ENTREP'),
(960, 'ON -THE-JOB TRAINING IN LAW FIRM', 'PSI-424', 'ABPOLSCI'),
(961, 'BUSINESS LAW', 'ECC-113', 'BS-ENTREP'),
(962, 'STATUTORY CONSTRUCTION', 'IER-005', 'ABPOLSCI'),
(963, 'OPPORTUNITY SEEKING', 'ECC-212', 'BS-ENTREP'),
(964, 'ORGANIZATIONAL DEVELOPMENT', 'HRM-122', 'BSBA-HRM'),
(965, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BS-ENTREP'),
(966, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-006', 'BSBA-HRM'),
(967, 'CWTS 2', 'NSTP-122', 'BS-ENTREP'),
(968, 'INTERNATIONAL BUSINESS TRADE', 'IBT-001', 'BSBA-HRM'),
(969, 'GENDER AND SOCIETY', 'GEE-007', 'BS-ENTREP'),
(970, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BECED'),
(971, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BS-ENTREP'),
(972, 'GUIDING CHILDREN\'S BEHAVIOR AND MORAL DEVELOPMENT', 'ECE-015', 'BECED'),
(973, 'EARLY LEARNING ENVIRONMENT', 'ECE-017', 'BECED'),
(974, 'INTEGRATIVE TEACHING STRATEGIES', 'SPT-111', 'BECED'),
(975, 'FIELD STUDY 1 (OBSERVATION OF TEACHING-LEARNING IN ACTUAL SCHOOL ENVIRONMENT)', 'FS-1', 'BECED'),
(976, 'TECHNOLOGY FOR TEACHING AND LEARNING 2 (UTILIZATION OF IT IN ECED)', 'ECE-012', 'BECED'),
(977, 'PURPOSIVE COMMUNICATION', 'GEC-005', 'BS-ENTREP'),
(978, 'FACILITATING LEARNER CENTERED TEACHING', 'MS-111', 'BECED'),
(979, 'ART APPRECIATION', 'GEC-006', 'BS-ENTREP'),
(980, 'INTRODUCTION TO PHILIPPINE CRIMINAL JUSTICE SYSTEM', 'CLJ-121', 'BSCRIM'),
(981, 'BUSINESS LAW', 'ECC-113', 'BS-ENTREP'),
(982, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BSCRIM'),
(983, 'OPPORTUNITY SEEKING', 'ECC-212', 'BS-ENTREP'),
(984, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSCRIM'),
(985, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BS-ENTREP'),
(986, 'ART APPRECIATION', 'GEC-006', 'BSCRIM'),
(987, 'CWTS 2', 'NSTP-122', 'BS-ENTREP'),
(988, 'INTRODUCTION TO LITERATURE', 'LIT-001', 'BSCRIM'),
(989, 'GENDER AND SOCIETY', 'GEE-007', 'BS-ENTREP'),
(990, 'ARNIS AND DISARMING TECHNIQUES', 'DT-002', 'BSCRIM'),
(991, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BS-ENTREP'),
(992, 'MILITARY SCIENCE 2', 'NSTP-122', 'BSCRIM'),
(993, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-006', 'BS-ENTREP'),
(994, 'INTRODUCTION TO PHILIPPINE CRIMINAL JUSTICE SYSTEM', 'CLJ-121', 'BSCRIM'),
(995, 'ETHICS', 'GEC-008', 'BS-ENTREP'),
(996, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BSCRIM'),
(997, 'PRICING AND COSTING', 'ECC-214', 'BS-ENTREP'),
(998, 'MATHEMATICS IN THE MODERN WORLD', 'GEC-004', 'BSCRIM'),
(999, 'ART APPRECIATION', 'GEC-006', 'BSCRIM'),
(1000, 'INTRODUCTION TO LITERATURE', 'LIT-001', 'BSCRIM'),
(1001, 'OPERATION MANAGEMENT (TQM)', 'CBM-001', 'BS-ENTREP'),
(1002, 'ARNIS AND DISARMING TECHNIQUES', 'DT-002', 'BSCRIM'),
(1003, 'MILITARY SCIENCE 2', 'NSTP-122', 'BSCRIM'),
(1004, 'PROGRAM AND POLICIES ON ENTREP DEVT', 'ECC-215', 'BS-ENTREP'),
(1005, 'ASSESSMENT IN LEARNING 2', 'MS-114', 'BSE-ENG'),
(1006, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'BS-ENTREP'),
(1007, 'TECHNOLOGY FOR TEACHING AND LEARNING 2 (TECHNOLOGY IN LANGUAGE EDUCATION)', 'ENGL-516', 'BSE-ENG'),
(1008, 'PRINCIPLES OF ACCOUNTING 2', 'ACC-222', 'BS-ENTREP'),
(1009, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BS-ENTREP'),
(1010, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-006', 'BS-ENTREP'),
(1011, 'ETHICS', 'GEC-008', 'BS-ENTREP'),
(1012, 'PRICING AND COSTING', 'ECC-214', 'BS-ENTREP'),
(1013, 'OPERATION MANAGEMENT (TQM)', 'CBM-001', 'BS-ENTREP'),
(1014, 'PROGRAM AND POLICIES ON ENTREP DEVT', 'ECC-215', 'BS-ENTREP'),
(1015, 'LIFE AND WORKS OF RIZAL', 'GEM-001', 'BS-ENTREP'),
(1016, 'PRINCIPLES OF ACCOUNTING 2', 'ACC-222', 'BS-ENTREP'),
(1017, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BS-ENTREP'),
(1018, 'BUSINESS PLAN PREPARATION', 'ECC-313', 'BS-ENTREP'),
(1019, 'WHOLESALE AND RETAIL SALES MANAGEMENT', 'ELEC-3', 'BS-ENTREP'),
(1020, 'MANAGING A MANUFACTURING ENTERPRISE', 'ELEC-4', 'BS-ENTREP'),
(1021, 'TOURISM INDUSTRY', 'TRACK-3', 'BS-ENTREP'),
(1022, 'CULINARY BUSINESS', 'TRACK-4', 'BS-ENTREP'),
(1023, 'SUPPLY CHAIN MANAGEMENT', 'ELEC-5', 'BS-ENTREP'),
(1024, 'TEAM SPORTS', 'PE-004', 'BS-ENTREP'),
(1025, 'PRINCIPLES OF ACCOUNTING 2', 'ACC-002', 'BS-ENTREP'),
(1026, 'BUSINESS PLAN PREPARATION', 'ECC-313', 'BS-ENTREP'),
(1027, 'WHOLESALE AND RETAIL SALES MANAGEMENT', 'ELEC-3', 'BS-ENTREP'),
(1028, 'MANAGING A MANUFACTURING ENTERPRISE', 'ELEC-4', 'BS-ENTREP'),
(1029, 'TOURISM INDUSTRY', 'TRACK-3', 'BS-ENTREP'),
(1030, 'CULINARY BUSINESS', 'TRACK-4', 'BS-ENTREP'),
(1031, 'SUPPLY CHAIN MANAGEMENT', 'ELEC-5', 'BS-ENTREP'),
(1032, 'TEAM SPORTS', 'PE-004', 'BS-ENTREP'),
(1033, 'PRINCIPLES OF ACCOUNTING 2', 'ACC-002', 'BS-ENTREP'),
(1034, 'BUSINESS IMPLEMENTATION 2', 'ECC-414', 'BS-ENTREP'),
(1035, 'APPRENTICESHIP 2', 'ECC-415', 'BS-ENTREP'),
(1036, 'SOCIAL ENTREPRENEURSHIP', 'ECC-413', 'BS-ENTREP'),
(1037, 'BUSINESS IMPLEMENTATION 2', 'ECC-414', 'BS-ENTREP'),
(1038, 'APPRENTICESHIP 2', 'ECC-415', 'BS-ENTREP'),
(1039, 'SOCIAL ENTREPRENEURSHIP', 'ECC-413', 'BS-ENTREP'),
(1040, 'INTERMEDIATE PROGRAMMING', 'CCS-103', 'BSCS'),
(1041, 'WEB SYSTEMS AND TECHNOLOGIES', 'CCS-107', 'BSCS'),
(1042, 'TECHNICAL COMPUTER CONCEPTS', 'CCS-108', 'BSCS'),
(1043, 'PHILIPPINE LITERATURE IN ENGLISH', 'LIT-001', 'BSCS'),
(1044, 'NSTP CWTS 2', 'NSTP-102', 'BSCS'),
(1045, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSCS'),
(1046, 'CONTEMPORARY WORLD', 'GEC-003', 'BSCS'),
(1047, 'COLLEGE ALGEBRA', 'PR-001', 'BSCS'),
(1048, 'INTERMEDIATE PROGRAMMING', 'CCS-103', 'BSCS'),
(1049, 'WEB SYSTEMS AND TECHNOLOGIES', 'CCS-107', 'BSCS'),
(1050, 'TECHNICAL COMPUTER CONCEPTS', 'CCS-108', 'BSCS'),
(1051, 'PHILIPPINE LITERATURE IN ENGLISH', 'LIT-001', 'BSCS'),
(1052, 'NSTP CWTS 2', 'NSTP-102', 'BSCS'),
(1053, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSCS'),
(1054, 'CONTEMPORARY WORLD', 'GEC-003', 'BSCS'),
(1055, 'COLLEGE ALGEBRA', 'PR-001', 'BSCS'),
(1056, 'APPLICATIONS DEVELOPMENT AND EMERGING TECHNOLOGIES', 'CCS-106', 'BSCS'),
(1057, 'DIGITAL GRAPHICS', 'CCS-110', 'BSCS'),
(1058, 'DISCRETE STRUCTURES 2', 'CS-104', 'BSCS'),
(1059, 'OBJECT ORIENTED PROGRAMMING', 'CS-105', 'BSCS'),
(1060, 'SYSTEM FUNDAMENTALS', 'CSE-101', 'BSCS'),
(1061, 'INTEGRAL CALCULUS', 'PR-003', 'BSCS'),
(1062, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSCS'),
(1063, 'EMBEDDED PROGRAMMING', 'CS-107', 'BSCS'),
(1064, 'SOFTWARE ENGINEERING 2', 'CS-109', 'BSCS'),
(1065, 'ARCHITECTURE AND ORGANIZATION', 'CS-111', 'BSCS'),
(1066, 'OPERATING SYSTEMS', 'CS-112', 'BSCS'),
(1067, 'METHODS OF RESEARCH', 'RES-001', 'BSCS'),
(1068, 'ART APPRECIATION', 'GEC-006', 'BSCS'),
(1069, 'RIZAL\'S LIFE WORKS AND WRITINGS', 'GEM-001', 'BSCS'),
(1070, 'TEAM SPORTS', 'PE-004', 'BSCS'),
(1071, 'EMBEDDED PROGRAMMING', 'CS-107', 'BSCS'),
(1072, 'SOFTWARE ENGINEERING 2', 'CS-109', 'BSCS'),
(1073, 'ARCHITECTURE AND ORGANIZATION', 'CS-111', 'BSCS'),
(1074, 'OPERATING SYSTEMS', 'CS-112', 'BSCS'),
(1075, 'METHODS OF RESEARCH', 'RES-001', 'BSCS'),
(1076, 'ART APPRECIATION', 'GEC-006', 'BSCS'),
(1077, 'RIZAL\'S LIFE WORKS AND WRITINGS', 'GEM-001', 'BSCS'),
(1078, 'TEAM SPORTS', 'PE-004', 'BSCS'),
(1079, 'AUTOMATA AND LANGUAGE THEORY', 'CS-113', 'BSCS'),
(1080, 'CURRENT TRENDS IN IT AND SEMINAR', 'CCS-115', 'BSCS'),
(1081, 'HUMAN COMPUTER INTERACTION', 'CS-115', 'BSCS'),
(1082, 'CS THESIS WRITING 2', 'CS-119', 'BSCS'),
(1083, 'PARALLEL AND DISTRIBUTED COMPUTING', 'CSE-105', 'BSCS'),
(1084, 'PRACTICUM II', 'CS-416', 'BSCS'),
(1085, 'AUTOMATA AND LANGUAGE THEORY', 'CS-113', 'BSCS'),
(1086, 'CURRENT TRENDS IN IT AND SEMINAR', 'CCS-115', 'BSCS'),
(1087, 'HUMAN COMPUTER INTERACTION', 'CS-115', 'BSCS'),
(1088, 'CS THESIS WRITING 2', 'CS-119', 'BSCS'),
(1089, 'PARALLEL AND DISTRIBUTED COMPUTING', 'CSE-105', 'BSCS'),
(1090, 'PRACTICUM II', 'CS-416', 'BSCS'),
(1091, 'BUSINESS APPLICATIONS SOFTWARE', 'CCS-109', 'BSEMC'),
(1092, 'COMPUTER PROGRAMMING 2', 'CCS-103', 'BSEMC'),
(1093, 'FREEHAND AND DIGITAL DRAWING', 'EMC-103', 'BSEMC'),
(1094, 'INTRODUCTION TO GAME DESIGN AND DEVELOPMENT', 'EMC-102', 'BSEMC'),
(1095, 'ALGEBRA AND TRIGONOMETRY', 'MTH-111C', 'BSEMC'),
(1096, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSEMC'),
(1097, 'NSTP (CWTS) 2', 'NTSP-122', 'BSEMC'),
(1098, 'BUSINESS APPLICATIONS SOFTWARE', 'CCS-109', 'BSEMC'),
(1099, 'COMPUTER PROGRAMMING 2', 'CCS-103', 'BSEMC'),
(1100, 'FREEHAND AND DIGITAL DRAWING', 'EMC-103', 'BSEMC'),
(1101, 'INTRODUCTION TO GAME DESIGN AND DEVELOPMENT', 'EMC-102', 'BSEMC'),
(1102, 'ALGEBRA AND TRIGONOMETRY', 'MTH-111C', 'BSEMC'),
(1103, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSEMC'),
(1104, 'NSTP (CWTS) 2', 'NTSP-122', 'BSEMC'),
(1105, 'INFORMATION MANAGEMENT', 'CCS-105', 'BSEMC'),
(1106, 'APPLICATIONS DEVELOPMENT AND EMERGING TECHNOLOGIES', 'CCS-106', 'BSEMC'),
(1107, 'COMPUTER GRAPHICS PROGRAMMING', 'CCS-110', 'BSEMC'),
(1108, 'SCRIPT WRITING AND STORYBOARD DESIGN', 'EMC-106', 'BSEMC'),
(1109, 'GAME PROGRAMMING 2', 'EMC-107', 'BSEMC'),
(1110, 'READINGS IN PHILIPPINE HISTORY', 'GEC-002', 'BSEMC'),
(1111, 'PHYSICS 1', 'PHY-001', 'BSEMC'),
(1112, 'INDIVIDUAL AND DUAL SPORTS', 'PE-213', 'BSEMC'),
(1113, 'DESIGN AND PRODUCTION PROCESS', 'EMC-113', 'BSEMC'),
(1114, 'APPLIED GAME PHYSICS', 'EMC-114', 'BSEMC'),
(1115, 'GAME NETWORKING', 'EMC-115', 'BSEMC'),
(1116, 'GAME PROGRAMMING 3', 'EMC-116', 'BSEMC'),
(1117, 'EMC PROFESSIONAL ELECTIVE 2 (WEB 1)', 'EMC-117', 'BSEMC'),
(1118, 'ART APPRECIATION', 'GEC-006', 'BSEMC'),
(1119, 'PGNC', 'SS-002', 'BSEMC'),
(1120, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BSEMC'),
(1121, 'TEAM SPORTS', 'PE-004', 'BSEMC'),
(1122, 'DESIGN AND PRODUCTION PROCESS', 'EMC-113', 'BSEMC'),
(1123, 'APPLIED GAME PHYSICS', 'EMC-114', 'BSEMC'),
(1124, 'GAME NETWORKING', 'EMC-115', 'BSEMC'),
(1125, 'GAME PROGRAMMING 3', 'EMC-116', 'BSEMC'),
(1126, 'EMC PROFESSIONAL ELECTIVE 2 (WEB 1)', 'EMC-117', 'BSEMC'),
(1127, 'ART APPRECIATION', 'GEC-006', 'BSEMC'),
(1128, 'PGNC', 'SS-002', 'BSEMC'),
(1129, 'THE CONTEMPORARY WORLD', 'GEC-003', 'BSEMC'),
(1130, 'TEAM SPORTS', 'PE-004', 'BSEMC'),
(1131, 'CAPSTONE PROJECT 2', 'CCS-121', 'BSEMC'),
(1132, 'CURRENT TRENDS IN IT AND SEMINARS', 'CCS-115', 'BSEMC'),
(1133, 'GAME PRODUCTION', 'EMC-120', 'BSEMC'),
(1134, 'EMC PROFESSIONAL ELECTIVE 4 (SOCIAL PROFFESIONAL ISSUES)', 'EMC-121', 'BSEMC'),
(1135, 'PRACTICUM 2', 'CCS-114B', 'BSEMC'),
(1136, 'ETHICS', 'GEC-008', 'BSEMC'),
(1137, 'CAPSTONE PROJECT 2', 'CCS-121', 'BSEMC'),
(1138, 'CURRENT TRENDS IN IT AND SEMINARS', 'CCS-115', 'BSEMC'),
(1139, 'GAME PRODUCTION', 'EMC-120', 'BSEMC'),
(1140, 'EMC PROFESSIONAL ELECTIVE 4 (SOCIAL PROFFESIONAL ISSUES)', 'EMC-121', 'BSEMC'),
(1141, 'PRACTICUM 2', 'CCS-114B', 'BSEMC'),
(1142, 'ETHICS', 'GEC-008', 'BSEMC'),
(1143, 'PURPOSIVE COMMUNICATION', 'GEC005', 'BSOAD'),
(1144, 'ETHICS', 'GEC008', 'BSOAD'),
(1145, 'WEB DESIGN', 'COA212', 'BSOAD'),
(1146, 'FUNDAMENTALS OF KEYBOARDING', 'KB111', 'BSOAD'),
(1147, 'FOUNDATIONS OF SHORTHAND', 'STE111', 'BSOAD'),
(1148, 'ENVIRONMENTAL SCIENCE', 'GEE001', 'BSOAD'),
(1149, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSOAD'),
(1150, 'NSTP-CWTS 2', 'NSTP112', 'BSOAD'),
(1151, 'PURPOSIVE COMMUNICATION', 'GEC005', 'BSOAD'),
(1152, 'ETHICS', 'GEC008', 'BSOAD'),
(1153, 'WEB DESIGN', 'COA212', 'BSOAD'),
(1154, 'FUNDAMENTALS OF KEYBOARDING', 'KB111', 'BSOAD'),
(1155, 'FOUNDATIONS OF SHORTHAND', 'STE111', 'BSOAD'),
(1156, 'ENVIRONMENTAL SCIENCE', 'GEE001', 'BSOAD'),
(1157, 'RHYTHMIC ACTIVITIES', 'PE002', 'BSOAD'),
(1158, 'NSTP-CWTS 2', 'NSTP112', 'BSOAD'),
(1159, 'STRATEGIC MANAGEMENT', 'CBM002', 'BSOAD'),
(1160, 'PROJECT MANAGEMENT', 'OEC301', 'BSOAD'),
(1161, 'WEB DESIGN', 'COA212', 'BSOAD'),
(1162, 'KEYBOARDING AND DOCUMENT PROCESSING', 'KB221', 'BSOAD'),
(1163, 'ADVANCED SHORTHAND', 'STE-112', 'BSOAD'),
(1164, 'SCIENCE TECHNOLOGY AND SOCIETY', 'GEC007', 'BSOAD'),
(1165, 'ADMINISTRATIVE AND OFFICE MANAGEMENT', 'OAD111', 'BSOAD'),
(1166, 'PRINCIPLES OF ACCOUNTING 2 (PART. & CORP.)', 'ACC122', 'BSOAD'),
(1167, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSOAD'),
(1168, 'STRATEGIC MANAGEMENT', 'CBM002', 'BSOAD'),
(1169, 'PROJECT MANAGEMENT', 'OEC301', 'BSOAD'),
(1170, 'WEB DESIGN', 'COA212', 'BSOAD'),
(1171, 'KEYBOARDING AND DOCUMENT PROCESSING', 'KB221', 'BSOAD'),
(1172, 'ADVANCED SHORTHAND', 'STE-112', 'BSOAD'),
(1173, 'SCIENCE TECHNOLOGY AND SOCIETY', 'GEC007', 'BSOAD'),
(1174, 'ADMINISTRATIVE AND OFFICE MANAGEMENT', 'OAD111', 'BSOAD'),
(1175, 'PRINCIPLES OF ACCOUNTING 2 (PART. & CORP.)', 'ACC122', 'BSOAD'),
(1176, 'INDIVIDUAL AND DUAL SPORTS', 'PE-003', 'BSOAD'),
(1177, 'SPECIALIZED SHORTHAND', 'STE301', 'BSOAD'),
(1178, 'PROJECT MANAGEMENT', 'OEC301', 'BSOAD'),
(1179, 'ENTREPRENEURAL BEHAVIOR AND COMPETENCIES', 'OCC305', 'BSOAD'),
(1180, 'THESIS WRITING', 'BAC008', 'BSOAD'),
(1181, 'OFFICE ADMINISTRATION INTERNSHIP', 'OAD213', 'BSOAD'),
(1182, 'TEAM SPORTS', 'PE004', 'BSOAD'),
(1183, 'SPECIALIZED SHORTHAND', 'STE301', 'BSOAD'),
(1184, 'PROJECT MANAGEMENT', 'OEC301', 'BSOAD'),
(1185, 'ENTREPRENEURAL BEHAVIOR AND COMPETENCIES', 'OCC305', 'BSOAD'),
(1186, 'THESIS WRITING', 'BAC008', 'BSOAD'),
(1187, 'OFFICE ADMINISTRATION INTERNSHIP', 'OAD213', 'BSOAD'),
(1188, 'TEAM SPORTS', 'PE004', 'BSOAD'),
(1189, 'SPECIALIZED SHORTHAND', 'STE301', 'BSOAD'),
(1190, 'PROJECT MANAGEMENT', 'OEC301', 'BSOAD'),
(1191, 'ENTREPRENEURAL BEHAVIOR AND COMPETENCIES', 'OCC305', 'BSOAD'),
(1192, 'THESIS WRITING', 'BAC008', 'BSOAD'),
(1193, 'OFFICE ADMINISTRATION INTERNSHIP', 'OAD213', 'BSOAD'),
(1194, 'TEAM SPORTS', 'PE004', 'BSOAD'),
(1195, 'SPECIALIZED PRACTICUM', 'OAD414', 'BSOAD'),
(1196, 'PURPOSIVE COMMUNICATION', 'GEE-005', 'BSBA-FMGT'),
(1197, 'ART APPRECIATION', 'GEC-006', 'BSBA-FMGT'),
(1198, 'SCIENCE, TECHNOLOGY AND SOCIETY', 'GEC-007', 'BSBA-FMGT'),
(1199, 'ETHICS', 'GEC-008', 'BSBA-FMGT'),
(1200, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE-006', 'BSBA-FMGT'),
(1201, 'NSTP- CWTS 2', 'NSTP-122', 'BSBA-FMGT'),
(1202, 'RHYTHMIC ACTIVITIES', 'PE-002', 'BSBA-FMGT'),
(1203, 'PRINCIPLES OF ACCOUNTING', 'ACC-111', 'BSBA-FMGT'),
(1204, 'PURPOSIVE COMMUNICATION', 'GEE-005', 'BSBA-FMGT'),
(1205, 'INTEGRATED BUSINESS COURSE', 'IBC-001', 'BSAIS'),
(1206, 'ENVIRONMENTAL SCIENCE', 'GEE-001', 'BSAIS'),
(1207, 'BUSINESS TAXATION', 'TAX-212', 'BSAIS'),
(1208, 'OPERATIONS MANAGEMENT (TQM)', 'CBM-001', 'BSAIS'),
(1209, 'INTRO TO ACCOUNTING INFORMATION SYSTEM', 'CAE-020', 'BSAIS'),
(1210, 'INTERMEDIATE ACCOUNTING 3', 'ACC-227', 'BSAIS'),
(1211, 'BUSINESS LAWS AND REGULATIONS', 'LAW-212', 'BSAIS'),
(1212, 'MANAGEMENT SCIENCE', 'CAE-004', 'BSAIS'),
(1213, 'STRATEGIC BUSINESS ANALYSIS', 'MGT-415', 'BSAIS'),
(1214, 'INDIVIDUAL & DUAL SPORTS', 'PE-003', 'BSAIS'),
(1215, 'ENVIRONMENTAL SCIENCE', 'GEE-001', 'BSAIS'),
(1216, 'BUSINESS TAXATION', 'TAX-212', 'BSAIS'),
(1217, 'OPERATIONS MANAGEMENT (TQM)', 'CBM-001', 'BSAIS'),
(1218, 'INTRO TO ACCOUNTING INFORMATION SYSTEM', 'CAE-020', 'BSAIS'),
(1219, 'INTERMEDIATE ACCOUNTING 3', 'ACC-227', 'BSAIS'),
(1220, 'BUSINESS LAWS AND REGULATIONS', 'LAW-212', 'BSAIS'),
(1221, 'MANAGEMENT SCIENCE', 'CAE-004', 'BSAIS'),
(1222, 'STRATEGIC BUSINESS ANALYSIS', 'MGT-415', 'BSAIS'),
(1223, 'INDIVIDUAL & DUAL SPORTS', 'PE-003', 'BSAIS'),
(1224, 'INTERNATIONAL BUSINESS AND TRADE', 'BAC-007', 'BSAIS'),
(1225, 'MANAGING INFORMATION AND TECHNOLOGY', 'PCE-003', 'BSAIS'),
(1226, 'INFORMATION SYSTEMS OPERATIONS & MAINTENANCE', 'PCE-004', 'BSAIS'),
(1227, 'COST ACCOUNTING & CONTROL', 'ACC-123', 'BSAIS'),
(1228, 'STATISTICAL ANALYSIS WITH SOFTWARE APPLICATION', 'MGT-313', 'BSAIS'),
(1229, 'BUSINESS ANALYTICS', 'PCE-009', 'BSAIS'),
(1230, 'STRATEGIC COST MANAGEMENT 1', 'ACC-226', 'BSAIS'),
(1231, 'PROJECT MANAGEMENT', 'PCE-001', 'BSAIS'),
(1232, 'TEAM SPORTS', 'PE-004', 'BSAIS'),
(1233, 'INTERNATIONAL BUSINESS AND TRADE', 'BAC-007', 'BSAIS'),
(1234, 'MANAGING INFORMATION AND TECHNOLOGY', 'PCE-003', 'BSAIS'),
(1235, 'INFORMATION SYSTEMS OPERATIONS & MAINTENANCE', 'PCE-004', 'BSAIS'),
(1236, 'COST ACCOUNTING & CONTROL', 'ACC-123', 'BSAIS'),
(1237, 'STATISTICAL ANALYSIS WITH SOFTWARE APPLICATION', 'MGT-313', 'BSAIS'),
(1238, 'BUSINESS ANALYTICS', 'PCE-009', 'BSAIS'),
(1239, 'FIELD STUDY 1 (OBSERVATIONS OF TEACHING-LEARNING IN ACTUAL SCHOOL LEARNING ENVIRONMENT)', 'FS-1', 'BSE-ENG'),
(1240, 'SPEECH AND THEATER ARTS', 'ENGL-508', 'BSE-ENG'),
(1241, 'TECHNICAL WRITING', 'ENGL-515', 'BSE-ENG'),
(1242, 'SURVEY OF ENGLISH AND AMERICAN LITERATURE', 'ENGL-513', 'BSE-ENG'),
(1243, 'INTRODUCTION TO INDUSTRIAL SECURITY CONCEPT', 'LEA-003', 'BSCRIM'),
(1244, 'HUMAN BEHAVIOR AND VICTIMOLOGY', 'CRIM-313', 'BSCRIM'),
(1245, 'SPECIALIZED CRIME INVESTIGATION W/ LEGAL MEDICINE', 'CDI-222', 'BSCRIM'),
(1246, 'INSTITUTIONAL CORRECTION', 'CA-001', 'BSCRIM'),
(1247, 'FORENSIC PHOTOGRAPHY W/ 1 HOUR LAB', 'FOR-001', 'BSCRIM'),
(1248, 'PERSONAL IDENTIFICATION', 'FOR-002', 'BSCRIM'),
(1249, 'CHARACTER FORMATION 1 – NATIONALISM & PATRIOTISM', 'CLFM-001', 'BSCRIM'),
(1250, 'ORGANIC CHEMISTRY', 'ADGE-001', 'BSCRIM'),
(1251, 'FUNDAMENTALS OF MARKSMANSHIP', 'DT-004', 'BSCRIM'),
(1252, 'INTRODUCTION TO INDUSTRIAL SECURITY CONCEPT', 'LEA-003', 'BSCRIM'),
(1253, 'HUMAN BEHAVIOR AND VICTIMOLOGY', 'CRIM-313', 'BSCRIM'),
(1254, 'SPECIALIZED CRIME INVESTIGATION W/ LEGAL MEDICINE', 'CDI-222', 'BSCRIM'),
(1255, 'INSTITUTIONAL CORRECTION', 'CA-001', 'BSCRIM'),
(1256, 'FORENSIC PHOTOGRAPHY W/ 1 HOUR LAB', 'FOR-001', 'BSCRIM'),
(1257, 'PERSONAL IDENTIFICATION', 'FOR-002', 'BSCRIM'),
(1258, 'CHARACTER FORMATION 1 – NATIONALISM & PATRIOTISM', 'CLFM-001', 'BSCRIM'),
(1259, 'ORGANIC CHEMISTRY', 'ADGE-001', 'BSCRIM'),
(1260, 'FUNDAMENTALS OF MARKSMANSHIP', 'DT-004', 'BSCRIM'),
(1261, 'PROFESSIONAL CONDUCT AND ETHICAL STANDARD', 'CRIM-324', 'BSCRIM'),
(1262, 'JUVENILE DELINQUENCY & JUVENILE JUSTICE SYSTEM', 'CRIM-325', 'BSCRIM'),
(1263, 'CRIMINAL LAW BOOK 2', 'CLJ-324', 'BSCRIM'),
(1264, 'TECHNICAL ENGLISH INVESTIGATIVE REPORT WRITING', 'CDI-325', 'BSCRIM'),
(1265, 'FIRE PROTECTION AND ARSON INVESTIGATION', 'CDI-326', 'BSCRIM'),
(1266, 'QUESTIONED DOCUMENTS EXAMINATION', 'FOR-004', 'BSCRIM'),
(1267, 'LIE DETECTION TECHNIQUE W/ 1 HR LAB', 'FOR-005', 'BSCRIM'),
(1268, 'NON INSTITUTIONAL CORRECTION', 'CA-002', 'BSCRIM'),
(1269, 'CRIMINOLOGICAL RESEARCH 2 (THESIS WRITING & PRESENTATION', 'CRIM-428', 'BSCRIM'),
(1270, 'CRIMINAL PROCEDURE AND COURT TESTIMONY', 'CLJ-426', 'BSCRIM'),
(1271, 'TECHNICAL ENGLISH 2 (LEGAL FORMS)', 'CDI-428', 'BSCRIM'),
(1272, 'INTRODUCTION TO CYBERCRIME AND ENVIRONMENTAL LAWS AND PROTECTION (W/1 HR LAB)', 'CDI-429', 'BSCRIM'),
(1273, 'FORENSIC BALLISTICS (W/HR LAB)', 'FOR-006', 'BSCRIM'),
(1274, 'INTERSHIP (OJT 2)', 'CP-422', 'BSCRIM'),
(1275, 'PRINCIPLES OF MANAGEMENT', 'MGT-111', 'BSBA-FMGT'),
(1276, 'WORLD LITERATURE', 'LIT-003', 'BSBA-FMGT'),
(1277, 'QUANTITATIVE TECHNIQUES IN BUSINESS', 'MTH-312', 'BSBA-FMGT'),
(1278, 'MATHEMATICAL ANALYSIS', 'MTH-313', 'BSBA-FMGT'),
(1279, 'STATISTICS (APPLIED TO BUSINESS)', 'MTH-224', 'BSBA-FMGT'),
(1280, 'BUSINESS AND TRANSFER TAX', 'TAX-002', 'BSBA-FMGT'),
(1281, 'MANAGERIAL ACCOUNTING', 'ACC-413', 'BSBA-FMGT'),
(1282, 'LAW ON NEGOTIABLE INSTRUMENTS', 'LAW-003', 'BSBA-FMGT'),
(1283, 'INTERACTIVE ENGLISH', 'ENG-003', 'BSBA-FMGT'),
(1284, 'PRINCIPLES OF MARKETING', 'MKT-111', 'BSBA-FMGT'),
(1285, 'PRINCIPLES OF ECONOMICS WITH LAND, REFORM, AND TAXATION', 'ECO-111', 'BSBA-FMGT'),
(1286, 'SOCIOLOGY & ANTHROPOLOGY', 'SSC-003', 'BSBA-FMGT'),
(1287, 'STRATEGIC FINANCIAL MANAGEMENT', 'FMT-416', 'BSBA-FMGT'),
(1288, 'LAW ON PARTNERSHIP AND CORPORATION', 'LAW-002', 'BSBA-FMGT'),
(1289, 'INTERNATIONAL FINANCE W/ ELECTRONIC BANKING', 'FMT-415', 'BSBA-FMGT'),
(1290, 'MANAGERIAL ECONOMICS', 'ECO-003', 'BSBA-FMGT'),
(1291, 'HUMAN RESOURCES MANAGEMENT', 'MGT223', 'BSOAD'),
(1292, 'PHILIPPINE INDIGENOUS COMMUNICATION', 'GEE-008', 'BSBA-MKMGT'),
(1293, 'FINANCIAL MANAGEMENT', 'ACC-424', 'BSBA-MKMGT'),
(1294, 'BUSINESS POLICY', 'MKT-407', 'BSBA-MKMGT'),
(1295, 'ETHICS & SOCIAL RESPONSIBILITY', 'MKMT-419', 'BSBA-MKMGT'),
(1296, 'FEASIBILITY STUDY EVALUATION', 'MKMT-422', 'BSBA-MKMGT'),
(1297, 'BCTRW', 'ENG-004', 'BSBA-MKMGT'),
(1298, 'MATH OF INVESTMENT', 'MTH-221', 'BSBA-MKMGT'),
(1299, 'SOCIOLOGY AND ANTHROPOLOGY', 'SSC-004', 'BSBA-MKMGT'),
(1300, 'PRINCIPLE OF MONEY, CREDIT, AND BANKING', 'FIN-111', 'BSBA-FMGT'),
(1301, 'FINANCIAL ACCOUNTING 1', 'ACC-213', 'BSBA-FMGT'),
(1302, 'HUMAN RESOURCES MANAGEMENT', 'MGT223', 'BSOAD'),
(1303, 'INFORMATION SECURITY AND MANAGEMENT', 'PCE-005', 'BSAIS'),
(1304, 'INTERNATIONAL BUSINESS AND TRADE', 'BAC-007', 'BSAIS'),
(1305, 'INDIGENOUS CREATIVE CRAFTS', 'GEE-002', 'BACOMM'),
(1306, 'READING VISUAL ART', 'GEE-003', 'BACOMM'),
(1307, 'BUSINESS TAXATION', 'TAX-002', 'BSAIS'),
(1308, 'LOGIC AND ETHICS', 'PHIL-001', 'BSAIS'),
(1309, 'PRINCIPLES OF ACCOUNTING(PART. AND CORP.)', 'ACC-122', 'BSAIS'),
(1310, 'FINANCIAL ACCOUNTING 1', 'ACC-213', 'BSAIS'),
(1311, 'BEHAVIORAL SCIENCE', 'BS-101', 'BSAIS'),
(1312, 'MATH ANALYSIS IN BUSINESS', 'MTH-314', 'BSAIS'),
(1313, 'FINANCIAL ACCOUNTING 2', 'ACC-224', 'BSAIS'),
(1314, 'MATHEMATICS OF INVESTMENT', 'MTH-214', 'BSAIS'),
(1315, 'PRODUCTION AND OPERATIONS MANAGEMENT', 'MGT-413', 'BSAIS'),
(1316, 'LAW ON NEGOTIABLE INSTRUMENTS', 'LAW-423', 'BSAIS'),
(1317, 'PHYSICAL FITNESS', 'PE-111', 'BSAIS'),
(1318, 'STRATEGIC MANAGEMENT FOR SME', 'ENTR-410', 'BS-ENTREP'),
(1319, 'LITERATURE', 'LIT-001', 'BSIT'),
(1320, 'UNDERSTANDING THE SELF', 'GEC001', 'BSIT'),
(1321, 'READING IN THE PHILIPPINE HISTORY', 'GEC002', 'BSIT'),
(1322, 'MATHEMATICS OF THE MODERN WORLD', 'GEC004', 'BSIT'),
(1323, 'DIGITAL GRAPHICS', 'CCS110', 'BSIT'),
(1324, 'DISCRETE MATHEMATICS', 'CCS124', 'BSIT'),
(1325, 'PAGBASA AT PAGSULAT TUNGO SA PANANALIKSIK', 'GEF-002', 'BSIT'),
(1326, 'CAPSTONE PROJECT AND RESEARCH 1', 'CCS-119', 'BSIT'),
(1327, 'INFORMATION ASSURANCE AND SECURITY 1', 'CCS-113', 'BSIT'),
(1328, 'PROBABILITY AND STATISTIC', 'PR-002', 'BSIT'),
(1329, 'PHYSICAL SCIENCE', 'NSC-001', 'BSBA-FMGT'),
(1330, 'COLLEGE ALGEBRA', 'MTH-111', 'BSBA-FMGT'),
(1331, 'INTERNSHIP IN MEDIA INDUSTRY', 'ABC-402', 'BACOMM'),
(1332, 'COMPUTER GRAPHICS 1 / VISUAL COMM', 'CS-223', 'BACOMM'),
(1333, 'ECOTOURISM', 'MAJ-14', 'BSTM'),
(1334, 'RECREATION, LEISURE & RESORT MANGEMENT', 'MAJ-11', 'BSTM'),
(1335, 'RESEARCH 2', 'MAJ-7B', 'BSTM'),
(1336, 'HOTEL / AIRLINE / TOURISM ESTABLISHMENT', 'PRAC-2', 'BSTM'),
(1337, 'SOCIOLOGY AND ANTHROPOLOGY', 'SS-224', 'BSTM'),
(1338, 'INTRO TO COMPUTER W/ WINDOWS & INTERNET', 'COM-111', 'BSBA-FMGT'),
(1339, 'DEVELOPMENTAL PSYCHOLOGY', 'PRC212', 'BSPSYCH'),
(1340, 'GENERAL ZOOLOGY', 'NSC211', 'BSPSYCH'),
(1341, 'PHILIPPINE INDIGENOUS COMMUNITIES', 'GEE001', 'BSPSYCH'),
(1342, 'FILIPINO 1', 'FIL001', 'BSPSYCH'),
(1343, 'BEHAVIORAL SCIENCES RESEARCH 2', 'BSC411', 'ABBS'),
(1344, 'INSTITUTIONAL DYNAMICS AND TRANSFORMATIONS', 'BSC413', 'ABBS'),
(1345, 'HUMAN RESOURCE MANAGEMENT AND DEVELOPMENT', 'BSC312', 'ABBS'),
(1346, 'INTRODUCTION TO COMPUTER APPLICATIONS', 'COM-001', 'ABBS'),
(1347, 'SOCIAL ARTS', 'HUM-002', 'ABBS'),
(1348, 'PSYCHOSOCIAL CONSEQUENCES, ASSESSMENT, TREATMENT AND PROGRAM PLANNING', 'CMH221', 'ABBS'),
(1349, 'ARGUMENTATION AND PROPOSITIONS', 'BSC224', 'ABBS'),
(1350, 'PHILIPPINE GOVERNMENT AND CONSTITUTION', 'SSC-002', 'ABBS'),
(1351, 'ORGANIZATIONAL BEHAVIOR', 'BRC221', 'ABBS'),
(1352, 'INTRODUCTION TO SOCIAL WORK', 'PSY321', 'ABBS'),
(1353, 'PSYCHOLOGY OF LANGUAGE', 'BSC213', 'ABBS'),
(1354, 'SIKOLOHIYAN FILIPINO', 'PSY221', 'ABBS'),
(1355, 'ANCIENT AND MEDIEVAL POLITICS', 'PS-233', 'ABPOLSCI'),
(1356, 'CIVIC WELFARE AND TRAINING SERVICES 2', 'NSTP-122', 'ABPOLSCI'),
(1357, 'ARGUMENTATION AND DEBATE', 'A2', 'ABPOLSCI'),
(1358, 'INTERNATIONAL AND REGIONAL ORGANIZATION', 'PS-313', 'ABPOLSCI'),
(1359, 'INTRO TO POLITICAL ANALYSIS', 'PS-321', 'ABPOLSCI'),
(1360, 'INTRO TO PHIL. GOVT & POLITICS', 'PS-212', 'ABPOLSCI'),
(1361, 'ANCIENT AND MEDIEVAL POLITICS', 'PS-223', 'ABPOLSCI'),
(1362, 'PARLIAMENTARY PROCEDURE', 'A3', 'ABPOLSCI'),
(1363, 'INTERNATIONAL LAW', 'PS-424', 'ABPOLSCI'),
(1364, 'INTRO TO PHIL GOVERNMENT AND POLITICS', 'PS-212', 'ABPOLSCI'),
(1365, 'HUMAN RIGHTS SITUATION IN THE PHILIPPINES', 'PS-411', 'ABPOLSCI'),
(1366, 'INTRO TO LAW', 'PSE-214', 'ABPOLSCI'),
(1367, 'BIOLOGICAL SCIENCE', 'NSC-002', 'ABPOLSCI'),
(1368, 'FUNDAMENTAL OF POLITICAL SCIENCE', 'PSM-111', 'ABPOLSCI'),
(1369, 'INTRO TO POLITICAL ANALYSIS AND RESEARCH', 'PS321', 'ABPOLSCI'),
(1370, 'INTERNATIONAL LAW', 'PSE221', 'ABPOLSCI'),
(1371, 'QUANTITATIVE ANALYSIS OF POLITICAL SCIENCE', 'PS-332', 'ABPOLSCI'),
(1372, 'PRACTICUM 2', 'PS-246', 'ABPOLSCI'),
(1373, 'SEMINAR IN POLITICAL SCIENCE', 'PS-472', 'ABPOLSCI'),
(1374, 'METHODS OF RESEARCH 2', 'PS-425', 'ABPOLSCI'),
(1375, 'SPREADSHEET', 'COM-002', 'ABPOLSCI'),
(1376, 'AMERICAN GOVERNMENT AND POLITICS', 'PS-412', 'ABPOLSCI'),
(1377, 'PHILIPPINE FOREIGN RELATION', 'POE-314', 'ABPOLSCI'),
(1378, 'EMC PROFESSIONAL ELECTIVE 3', 'EMC-119', 'BSEMC'),
(1379, 'INCOME TAXATION', 'TAX-001', 'BSBA-FMGT'),
(1380, 'FUNDAMENTALS OF MANAGEMENT', 'MGT-111', 'BSBA-MKMGT'),
(1381, 'FILIPINO SA IBA\'T-IBANG DISIPLINA', 'FIL-122', 'BSBA-MKMGT'),
(1382, 'WORLD GEOGRAPHY AND DESTINATION', 'HME006', 'BSHM'),
(1383, 'MANAGEMENT SCIENCE', 'CAE-004', 'BSAIS'),
(1384, 'CROWD CRISIS MANAGEMENT', 'HME005', 'BSHM'),
(1385, 'PRINCIPLES OF ACCOUNTING 1 (SOLE PROPRIETORSHIP)', 'ACC111', 'BSBA-FMGT'),
(1386, 'GOVERNMENT PLANNING AND DEVELOPMENT', 'BPA-109', 'BPA-SPECIAL'),
(1387, 'EFFECTIVE COMMUNICATION IN ORGANIZATION', 'BPA-106', 'BPA-SPECIAL'),
(1388, 'POLICY FORMULATION AND ADMINISTRATION', 'BPA-113', 'BPA-SPECIAL'),
(1389, 'COMPARATIVE PUBLIC ADMINISTRATION', 'BPA-117', 'BPA-SPECIAL'),
(1390, 'COMPUTER FUNDAMENTALS', 'BPA-108', 'BPA-SPECIAL'),
(1391, 'BEHAVIORAL SCIENCE RESEARCH 1', 'BRC311', 'BSPSYCH'),
(1392, 'COMMUNITY ORGANIZATIONS AND DEVELOPMENT', 'BRC314', 'BSPSYCH'),
(1393, 'DISASTER AND MENTAL HEALTH', 'BBC001', 'BSPSYCH'),
(1394, 'SOCIAL SYSTEM THEORY', 'BRC313', 'BSPYSCH'),
(1395, 'WRITING IN THE DISCIPLINE', 'ENG-002', 'N/A'),
(1396, 'PLANE TRIGONOMETRY', 'MTH-112', 'N/A'),
(1397, 'PHILIPPINE CRIMINAL JUSTICE SYSTEM', 'LEA-001', 'N/A'),
(1398, 'FORENSIC BALLISTICS', 'CRI-003', 'N/A'),
(1399, 'QUESTIONED DOCUMENTS', 'CRI-004', 'N/A'),
(1400, 'LEGAL MEDICINE', 'CRI-005', 'N/A'),
(1401, 'CRIMINAL LAW BOOK 2', 'CLJ-222', 'N/A'),
(1402, 'MARKSMANSHIP AND COMBAT SHOOTING', 'DT-003', 'N/A'),
(1403, 'LAW ENFORCEMENT OPERATIONS AND PLANNING WITH CRIME MAPPING', 'LEA-004', 'N/A'),
(1404, 'COMMUNICATION PLANNING', 'ABC-412', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `cms_topics`
--

CREATE TABLE `cms_topics` (
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(256) NOT NULL,
  `instructor_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int NOT NULL,
  `rfid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `school_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rfid_verified` tinyint(1) DEFAULT NULL COMMENT 'is user rfid verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `rfid`, `school_id`, `first_name`, `last_name`, `password`, `role`, `email`, `phone`, `rfid_verified`) VALUES
(86, NULL, 'admin-root', 'root', 'admin', '$2y$10$tuBLhIjmOmUjs8gTai99yeMifut/Z1fiWg842CkzulpypMUzIKOdy', 'admin', '', '', 0),
(111, NULL, 'admin', 'Jiwoo', 'Gabriel', '$2y$10$jkLKzDHPc2yt2EblUjp3S.G71QEbmFhoPBQSQBrGtPKDDarFJu7Iq', 'admin', 'siguedaniel@gmail.com', '09993939399', 0),
(190, NULL, 'coordinator1', 'Daniel', 'Sigue', '$2y$10$wn30Yt/veilokhOLAtmJn.I3wJOa7ZNW.xtr1APV0oJ1BwsQ.6DPi', 'coordinator', 'luffy@gmail.com', '09234927984', 0),
(191, NULL, 'student1', 'Lebron', 'James', '$2y$10$yCA3RBKD1O1JP2MyNkwU5.8t0TCRSu7y3J14ryfnSmsWpCc.h4wAa', 'student', 'lebron@gmail.com', '09912345678', 0),
(193, NULL, 'instructor2', 'Mike', 'Lenard', '$2y$10$oYLq6d/IhyYuAMoojAw7EOJyknFPXpKtKPCaV5MUuVaTjXtmQqr3S', 'instructor', 'as@gmail.com', '09923498234', 0),
(196, NULL, 'instructor1', 'Bam', 'Adebayo', '$2y$10$X9LM0Tk/AeMNxEk2ddt8DeiQo08BbObW1eFNBI4qGhcethXUwt2Ni', 'instructor', 'bam@gmail.com', '09912345679', NULL),
(197, NULL, 'instructor3', 'Caleb', 'Martin', '$2y$10$e3IHg9CRMazlyeP5Z4Goh.vQPRuDbJrxeMGwwA1Grj3pZ5HnEcFMe', 'instructor', NULL, NULL, NULL),
(198, NULL, 'student2', 'Jimmy', 'Butler', '$2y$10$H6XD1.RqiTd7W1JO6PRXY.6Szq9BpsR3NbPepY8/3eh1N.jtyhVLy', 'student', NULL, NULL, NULL),
(199, NULL, 'student3', 'Gabe', 'Vincent', '$2y$10$nwn.YQgHYFcNTbWmf9XmBeeUSNtkzgLZZ6Eh5idiolKGhY8FsYHui', 'student', NULL, NULL, NULL),
(200, NULL, 'coordinator2', 'Jayson', 'Tatum', '$2y$10$CwbEkNM1m3h09fSkQaG4O.EmdMkxh.DKSgvQ7ZCAooUARXH3zSdSq', 'coordinator', NULL, NULL, NULL),
(201, NULL, 'coordinator3', 'Jaylen', 'Brown', '$2y$10$Sf/rz17x6M/OhCMefRPQ1uCGqcOC.8LXEgqZ6zCs8ZmsNCcDZKnG6', 'coordinator', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fgms_schedule_list`
--

CREATE TABLE `fgms_schedule_list` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fgms_schedule_list`
--

INSERT INTO `fgms_schedule_list` (`id`, `title`, `description`, `start_datetime`, `end_datetime`) VALUES
(3, 'Core Exercise', 'Coach: May Pearl ', '2022-12-15 11:41:00', '2022-12-17 11:41:00'),
(5, 'Core Exercise', 'Coach Vince', '2023-01-28 07:30:00', '2023-01-28 08:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `fgms_tbl_events`
--

CREATE TABLE `fgms_tbl_events` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fgms_tbl_events`
--

INSERT INTO `fgms_tbl_events` (`id`, `title`, `start`, `end`) VALUES
(6, 'bday ko', '2022-11-03', '2022-11-04'),
(10, 'Core Exercise 1pm', '2022-12-02', '2022-12-03'),
(11, 'asdasd', '2022-12-03', '2022-12-04'),
(12, 'zxc', '2022-12-02', '2022-12-03');

-- --------------------------------------------------------

--
-- Table structure for table `fgms_tb_upload`
--

CREATE TABLE `fgms_tb_upload` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(75) NOT NULL,
  `age` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fgms_tb_upload`
--

INSERT INTO `fgms_tb_upload` (`id`, `name`, `image`, `age`, `description`) VALUES
(19, 'Solenn Heussaff', '63d00942dbe61.jpg', '37', 'Yoga Trainer'),
(20, 'Vince Velasco', '63d0095f93efd.jpg', '31', 'Core Trainer');

-- --------------------------------------------------------

--
-- Table structure for table `fgms_useracc`
--

CREATE TABLE `fgms_useracc` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user',
  `acc_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fgms_useracc`
--

INSERT INTO `fgms_useracc` (`id`, `email`, `password`, `name`, `code`, `status`, `user_type`, `acc_created`) VALUES
(6, '20200113m.santos.lyndale.bscs@gmail.com', '$2y$10$uUSTxnQotxYjlTwyLnK7nOXfRP3kAy86i/SkBQp7hGPc0IxTlSGkO', 'kyle', '0', 'verified', 'user', '2023-04-01');

-- --------------------------------------------------------

--
-- Table structure for table `fgms_userdata`
--

CREATE TABLE `fgms_userdata` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `bday` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fgms_userdata`
--

INSERT INTO `fgms_userdata` (`id`, `email`, `name`, `surname`, `bday`, `age`, `gender`) VALUES
(5, '20200113m.santos.lyndale.bscs@gmail.com', 'kyle', 'santos', '2023-04-08', '21', 'MALE');

-- --------------------------------------------------------

--
-- Table structure for table `fgms_usertable`
--

CREATE TABLE `fgms_usertable` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `bday` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user',
  `acc_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fgms_usertable`
--

INSERT INTO `fgms_usertable` (`id`, `name`, `surname`, `email`, `password`, `code`, `status`, `bday`, `age`, `gender`, `user_type`, `acc_created`) VALUES
(16, 'May Pearl ', 'Rivera', '20200111m.rivera.maypearl.bscs@gmail.com', '$2y$10$xJ3z8VHtcha1T0cUCOELDeTyJbrcVe1tski0/bwZpvjsBZniepwkG', '434621', 'verified', '2002-01-10', '20', 'FEMALE', 'staff', '0000-00-00'),
(17, 'Ma. Loelaida', 'Clave', '20200889m.clave.maloelaida.bscs@gmail.com', '$2y$10$9N3EgrWYVatsWXDHjcgiiO5BihQHiFAJyghKVsncIdDL281kV66wi', '0', 'verified', '2022-11-01', '25', 'FEMALE', 'user', '0000-00-00'),
(30, 'Lyndale Kyle', 'Santos', 'matatempura@gmail.com', '$2y$10$JXalw1qTqsU./Eh7Mt6d1Osmyj92xmAX5eWxaf/QNpuiNb4ki.m6O', '0', 'verified', '2022-12-03', '25', 'MALE', 'admin', '0000-00-00'),
(37, 'Natalia', 'Moon', 'nataliamoonavakin@gmail.com', '$2y$10$RjtRDj/hdjWcrseYt2gVretLwhJYgTxmGgGBrt5fYDoVvZ9IyGB3W', '0', 'verified', '2002-01-23', '20', 'FEMALE', 'user', '0000-00-00'),
(41, 'reynaldo', 'santos', 'reysan123123@gmail.com', '$2y$10$NYt1T3bAWA3e7mxncU1B9e7wVHq45Z2/S.p4.Iib2eNhq/jBZOhA6', '0', 'verified', '2023-03-04', '13', 'MALE', 'user', '2023-03-31');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tbladmin`
--

CREATE TABLE `hrs_tbladmin` (
  `ID` int NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tbladmin`
--

INSERT INTO `hrs_tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Jasper Macaraeg', 'admin', 9213279723, 'rastatel.hotel@gmail.com', '0192023a7bbd73250516f069df18b500', '2022-11-28 11:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblbooking`
--

CREATE TABLE `hrs_tblbooking` (
  `ID` int NOT NULL,
  `RoomId` int DEFAULT NULL,
  `BookingNumber` varchar(120) DEFAULT NULL,
  `RoomNumber` varchar(255) DEFAULT NULL,
  `UserID` int NOT NULL,
  `IDType` varchar(120) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `CheckinDate` varchar(200) DEFAULT NULL,
  `CheckoutDate` varchar(200) DEFAULT NULL,
  `ArrivalTime` varchar(255) DEFAULT NULL,
  `BookingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblbooking`
--

INSERT INTO `hrs_tblbooking` (`ID`, `RoomId`, `BookingNumber`, `RoomNumber`, `UserID`, `IDType`, `Gender`, `CheckinDate`, `CheckoutDate`, `ArrivalTime`, `BookingDate`, `Remark`, `Status`, `UpdationDate`) VALUES
(1, 1, '824827327', '101', 1, 'National ID', 'Male', '2023-05-24', '2023-05-27', '22:58', '2023-05-24 02:58:03', 'Thank you come again', 'Check out', '2023-05-24 03:09:54'),
(2, 5, '260533800', '503', 1, 'National ID', 'Male', '2023-05-24', '2023-05-27', '23:10', '2023-05-24 03:10:55', '123', 'Check out', '2023-05-24 03:12:47'),
(3, 5, '819611676', '501', 1, 'National ID', 'Male', '2023-05-24', '2023-05-27', '23:15', '2023-05-24 03:15:04', '123', 'Check out', '2023-05-24 03:16:11'),
(4, 4, '963248537', '401', 9, 'National ID', 'Female', '2023-05-26', '2023-05-29', '11:23', '2023-05-26 01:21:30', 'Check Out', 'Check out', '2023-05-26 01:24:04'),
(5, 5, '907876607', '501', 10, 'Voters ID', 'Female', '2023-05-26', '2023-06-09', '08:00', '2023-05-26 01:32:51', '123', 'Check out', '2023-05-26 01:37:18'),
(6, 5, '538435224', '501', 7, 'Driving License Card', 'Male', '2023-05-26', '2023-06-09', '10:00', '2023-05-26 01:42:09', 'Approved', 'Check out', '2023-05-26 01:44:16'),
(7, 2, '370627423', '201', 11, 'Senior Citizen ID', 'Female', '2023-05-26', '2023-05-31', '01:00', '2023-05-26 01:49:21', 'ok', 'Check out', '2023-05-26 01:52:12'),
(8, 4, '741621255', '401', 12, 'National ID', 'Male', '2023-05-26', '2023-05-31', '10:00', '2023-05-26 01:57:18', 'ok', 'Check out', '2023-05-26 02:01:10'),
(9, 5, '496105600', '501', 13, 'Senior Citizen ID', 'Male', '2023-05-27', '2023-05-30', '10:08', '2023-05-26 02:05:42', 'CHECK OUT', 'Check out', '2023-05-26 02:12:14'),
(10, 5, '576700528', '501', 14, 'National ID', 'Male', '2023-05-26', '2023-05-29', '17:46', '2023-05-26 03:38:33', 'ok', 'Check out', '2023-05-26 03:43:07'),
(11, 5, '755219265', '501', 15, 'National ID', 'Male', '2023-05-26', '2023-05-31', '15:12', '2023-05-26 04:09:45', 'okay', 'Check out', '2023-05-26 04:12:54'),
(12, 4, '668507537', '401', 16, 'National ID', 'Female', '2023-05-31', '2023-05-30', '15:49', '2023-05-26 04:44:43', 'CHECK OUT', 'Check out', '2023-05-26 04:47:05'),
(13, 5, '692119572', '501', 17, 'Philhealth ID', 'Male', '2023-05-27', '2023-05-29', '15:58', '2023-05-26 04:55:58', 'CHECK OUT', 'Check out', '2023-05-26 04:59:14'),
(14, 3, '547821214', '301', 18, 'Voters ID', 'Female', '2023-07-01', '2023-07-03', '15:12', '2023-05-26 05:09:57', 'check out', 'Check out', '2023-05-26 05:13:11'),
(15, 1, '214933664', NULL, 18, 'Voters ID', 'Female', '2023-05-26', '2023-05-28', '06:28', '2023-05-26 05:22:02', NULL, NULL, NULL),
(16, 1, '957864987', '101', 19, 'National ID', 'Female', '2023-05-27', '2023-05-30', '05:17', '2023-05-26 06:15:33', 'SHEESH', 'Check out', '2023-05-26 06:21:29'),
(17, 4, '156742772', '401', 1, 'National ID', 'Male', '2023-05-27', '2023-06-01', '16:30', '2023-05-26 06:27:48', 'check out', 'Check out', '2023-05-26 06:32:23'),
(18, 3, '853055591', '301', 1, 'National ID', 'Male', '2023-05-27', '2023-05-30', '16:30', '2023-05-26 06:43:32', 'check out', 'Check out', '2023-05-26 06:47:14'),
(19, 1, '715544847', '102', 1, 'National ID', 'Male', '2023-05-27', '2023-05-30', '18:20', '2023-05-26 07:17:59', 'check out', 'Check out', '2023-05-26 07:22:07'),
(20, 3, '896596930', '301', 1, 'Philhealth ID', 'Male', '2023-05-27', '2023-05-30', '16:31', '2023-05-26 07:41:48', 'check out', 'Check out', '2023-05-26 07:46:24'),
(21, 2, '654828525', '203', 20, 'National ID', 'Female', '2023-05-27', '2023-05-30', '07:15', '2023-05-26 07:59:58', 'check out', 'Check out', '2023-05-26 08:04:04'),
(22, 4, '916280558', '401', 21, 'National ID', 'Male', '2023-05-26', '2023-05-31', '17:08', '2023-05-26 09:06:15', 'check out', 'Check out', '2023-05-26 09:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblcategory`
--

CREATE TABLE `hrs_tblcategory` (
  `ID` int NOT NULL,
  `CategoryName` varchar(120) DEFAULT NULL,
  `Description` mediumtext,
  `Price` int NOT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblcategory`
--

INSERT INTO `hrs_tblcategory` (`ID`, `CategoryName`, `Description`, `Price`, `Date`) VALUES
(1, 'Single Room', 'A single hotel room is designed to accommodate a single person or couple. Our single rooms have a dimension of 40 sq. meters and is equipped with a single bed, a small bedside table, a bathroom, television and air-conditioning, and a small wardrobe.', 4000, '2023-05-23 10:36:58'),
(2, 'Double Room', 'A double room in a hotel is a room designed to accommodate the needs of guests that wish to share a bed. There are a few differences between hotels and motels, but for most of them, a standard double room contains one king-size bed that can accommodate two or more people.', 5000, '2023-05-23 10:37:20'),
(3, 'Executive Suite', 'An executive suite in its most general definition is a collection of offices or rooms—or suite—used by top managers of a business—or executives. Over the years, this general term has taken on a variety of specific meanings.', 5500, '2023-05-23 10:37:42'),
(4, 'Deluxe Room', 'Deluxe rooms, are modern decorated, can accommodate up to 2 persons, totally soundproofed and equipped with high tech comforts such as high speed internet access, USB ports , smart TV, room cleaning touch system and private hydromassage bathtub.', 6000, '2023-05-23 10:38:02'),
(5, 'Presidential Suite', 'The Presidential Suite perfectly accommodates the celebrity, diplomat or a high-profile business meeting, delivering impeccable elegance, luxury and personal service. The suite offers 312 sqm / 3,358 sqf of luxury. Luxury two-bedroom suite with separate sitting room, kitchenette and dining area.', 8000, '2023-05-23 10:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblcontact`
--

CREATE TABLE `hrs_tblcontact` (
  `ID` int NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Message` mediumtext,
  `EnquiryDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IsRead` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblcontact`
--

INSERT INTO `hrs_tblcontact` (`ID`, `Name`, `MobileNumber`, `Email`, `Message`, `EnquiryDate`, `IsRead`) VALUES
(1, 'John Kenneth Adriano', 916438177, 'jkadriano2002@gmail.com', 'Lorem ipsum dolor sit amet', '2022-12-14 15:11:56', 1),
(2, 'John Kenneth Adriano', 9164381772, '20200227m.adriano.kenneth.bscs@gmail.com', 'this is a test message\r\n', '2022-12-16 09:52:13', 1),
(3, 'FRANCIS MIGUEL VILLANUEVA SILGUERA', 9755087969, '20200115.silguera.francis.bscs@gmail.com', 'Hello', '2022-12-19 07:04:24', 1),
(4, 'LUCKY T. TEH', 9673099802, '123@gmail.com', ' ganda po ng place at solid yung kama di \r\numaatungal pag binabayo ko gf ko naka 16 rounds kami sa hotel nato! highly recommended!!!', '2023-03-09 04:09:23', 1),
(5, 'Jasper Macaraeg', 9213279723, 'jasper.macaraeg41@gmail.com', 'hello', '2023-03-17 11:15:27', 1),
(6, 'test', 912345678, 'jasper.macaraeg42@gmail.com', 'testing', '2023-04-20 03:09:25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblfacility`
--

CREATE TABLE `hrs_tblfacility` (
  `ID` int NOT NULL,
  `FacilityTitle` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `Image` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblfacility`
--

INSERT INTO `hrs_tblfacility` (`ID`, `FacilityTitle`, `Description`, `Image`, `CreationDate`) VALUES
(1, 'Gym', 'A gym is a large room, usually containing special equipment, where people go to do physical exercise and get fit. The gym has exercise bikes and running machines. While some guests play golf, others work out in the hotel gym. The large gym offers a variety of exercise equipment and weights going up to 100 pounds.', '286d66b228742c7472fd97ef0d534e991670553459.jpg', '2022-12-08 07:32:55'),
(2, 'Spa', 'A spa is a location where mineral-rich spring water (and sometimes seawater) is used to give medicinal baths. Spa towns or spa resorts (including hot springs resorts) typically offer various health treatments, which are also known as balneotherapy.', '517dcc35f07ca8e52cfdd588ac861dc51670484801.jpg', '2022-12-08 07:33:21'),
(3, 'Swimming Pool', '\r\nA swimming pool is a large hole in the ground that has been made and filled with water so that people can swim in it. Synonyms: swimming baths, pool, baths, lido More Synonyms of swimming pool.', 'e2dacc0cae9b86f5174b13cb28d6a9ab1670484870.jpg', '2022-12-08 07:34:30'),
(4, 'Car Parking', 'Parking is the act of stopping and disengaging a vehicle and leaving it unoccupied. Parking on one or both sides of a road is often permitted, though sometimes with restrictions.', '57ad846a2065d7eaaba4b4cfc46579181670484916.jpg', '2022-12-08 07:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblpage`
--

CREATE TABLE `hrs_tblpage` (
  `ID` int NOT NULL,
  `PageType` varchar(120) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblpage`
--

INSERT INTO `hrs_tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
(1, 'aboutus', 'Rastatel', 'Located near Tiantan Park, just a 10-minute walk from the National Center for the Performing Arts and Tiananmen Square. Built in 1956 it has old school charm and many rooms still feature high, crown-molded ceilings. A 2012 renovation brought all rooms and services up to modern day scratch and guestrooms come equipped with free Wi-Fi and all the usual amenities required for a comfortable stay.\r\n\r\nOur hotel offers ultimate comfort and luxury. This 4-storied hotel is a beautiful combination of traditional grandeur and modern facilities. The 255 exclusive guest rooms are furnished with a range of modern amenities such as television and internet access. International direct-dial phone and safe are also available in any of these rooms. Wake-up call facility is also available in these rooms. ', NULL, NULL, '2023-05-11 13:28:17'),
(2, 'contactus', 'Contact Us', '130 J. Ramos St. Caloocan City', 'rastatel.hotel@gmail.com', 9213279723, '2022-12-17 05:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblrfid`
--

CREATE TABLE `hrs_tblrfid` (
  `id` int NOT NULL,
  `rfid_number` varchar(255) NOT NULL,
  `date_created` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblroom`
--

CREATE TABLE `hrs_tblroom` (
  `ID` int NOT NULL,
  `RoomType` int DEFAULT NULL,
  `RoomName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Availability` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RoomQuantity` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `MaxAdult` int DEFAULT NULL,
  `MaxChild` int DEFAULT NULL,
  `RoomDesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `NoofBed` int DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `RoomFacility` varchar(200) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblroom`
--

INSERT INTO `hrs_tblroom` (`ID`, `RoomType`, `RoomName`, `Availability`, `RoomQuantity`, `Price`, `MaxAdult`, `MaxChild`, `RoomDesc`, `NoofBed`, `Image`, `RoomFacility`, `CreationDate`) VALUES
(1, 1, 'Deluxe Suite Single', 'Available', 2, 4000, 1, 1, 'Deluxe rooms, are modern decorated, can accommodate up to 2 persons, totally soundproofed and equipped with high tech comforts such as high speed internet access, USB ports , smart TV, room cleaning touch system and private hydromassage bathtub.', 1, '156005c5baf40ff51a327f1c34f2975b1684842858.jpg', '', '2023-05-23 11:54:18'),
(2, 2, 'Rastatel Double Room', 'Available', 2, 5000, 2, 3, 'A double room in a hotel is a room designed to accommodate the needs of guests that wish to share a bed. There are a few differences between hotels and motels, but for most of them, a standard double room contains one king-size bed that can accommodate two or more people', 2, '156005c5baf40ff51a327f1c34f2975b1684842941.jpg', '', '2023-05-23 11:55:41'),
(3, 3, 'Executive Suite', 'Available', 2, 5500, 2, 2, 'The Executive Suite is a stylish one-bedroom suite with king sized bed decorated in neutral tones, 46 square meters in size and with a separate living and dining area. Additional amenities for the suites include a washing machine & dryer.', 2, 'b935e787d009215c79b1ba11f5dd547c1684843011.jpg', '', '2023-05-23 11:56:51'),
(4, 4, 'Rastatel Deluxe Room', 'Available', 2, 6000, 2, 2, 'Deluxe rooms, are modern decorated, can accommodate up to 2 persons, totally soundproofed and equipped with high tech comforts such as high speed internet access, USB ports , smart TV, room cleaning touch system and private hydromassage bathtub.', 2, 'a3c130e848f2943770ebad11a6d880831684843139jpeg', '', '2023-05-23 11:58:59'),
(5, 5, 'Presidential Suite Room', 'Available', 2, 8000, 4, 3, 'The Presidential Suite perfectly accommodates the celebrity, diplomat or a high-profile business meeting, delivering impeccable elegance, luxury and personal service. The suite offers 312 sqm / 3,358 sqf of luxury. Luxury two-bedroom suite with separate sitting room, kitchenette and dining area.', 3, '261fb8d9e89972546ea2536ebc74b7bb1684843228.jpg', '', '2023-05-23 12:00:28');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblroomnumber`
--

CREATE TABLE `hrs_tblroomnumber` (
  `ID` int NOT NULL,
  `RoomName` varchar(255) DEFAULT NULL,
  `RoomNumber` int DEFAULT NULL,
  `RFIDNumber` varchar(255) DEFAULT NULL,
  `Electricity` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblroomnumber`
--

INSERT INTO `hrs_tblroomnumber` (`ID`, `RoomName`, `RoomNumber`, `RFIDNumber`, `Electricity`, `Status`) VALUES
(1, 'Deluxe Suite Single', 101, '8319EEBE', 'ON', 'Available'),
(2, 'Deluxe Suite Single', 102, '4384E6BE', 'ON', 'Available'),
(3, 'Deluxe Suite Single', 103, NULL, 'ON', 'Available'),
(4, 'Rastatel Double Room', 201, NULL, 'ON', 'Available'),
(5, 'Rastatel Double Room', 202, NULL, 'ON', 'Available'),
(6, 'Rastatel Double Room', 203, NULL, 'ON', 'Available'),
(7, 'Executive Suite', 301, NULL, 'ON', 'Available'),
(8, 'Executive Suite', 302, NULL, 'ON', 'Available'),
(9, 'Executive Suite', 303, NULL, 'ON', 'Available'),
(10, 'Rastatel Deluxe Room', 401, NULL, 'ON', 'Available'),
(11, 'Rastatel Deluxe Room', 402, NULL, 'ON', 'Available'),
(12, 'Rastatel Deluxe Room', 403, NULL, 'ON', 'Available'),
(16, 'Presidential Suite Room', 501, NULL, 'ON', 'Available'),
(17, 'Presidential Suite Room', 502, NULL, 'ON', 'Available'),
(18, 'Presidential Suite Room', 503, NULL, 'ON', 'Available'),
(19, 'Presidential Suite Room', 504, '9305E8BE', 'ON', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tblstaff`
--

CREATE TABLE `hrs_tblstaff` (
  `ID` int NOT NULL,
  `StaffName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `UserName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `MobileNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `StaffRegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tblstaff`
--

INSERT INTO `hrs_tblstaff` (`ID`, `StaffName`, `UserName`, `MobileNumber`, `Email`, `Password`, `StaffRegDate`) VALUES
(1, 'John Kenneth Adriano', 'staffadriano', '09123456789', 'staffadriano@gmail.com', 'de9bf5643eabf80f4a56fda3bbb84483', '2022-12-14 14:57:24'),
(2, 'Francis Silguera', 'staff_francis', '09856789621', 'francisstaff@gmail.com', 'de9bf5643eabf80f4a56fda3bbb84483', '2022-12-18 03:06:55'),
(3, 'Francis Silguera', 'francis', '09212023063', 'ragequitv3@gmail.com', '202cb962ac59075b964b07152d234b70', '2023-04-29 01:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `hrs_tbluser`
--

CREATE TABLE `hrs_tbluser` (
  `ID` int NOT NULL,
  `FullName` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `ProfileImage` varchar(255) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `IsVerified` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hrs_tbluser`
--

INSERT INTO `hrs_tbluser` (`ID`, `FullName`, `MobileNumber`, `Email`, `Gender`, `ProfileImage`, `Password`, `IsVerified`, `RegDate`) VALUES
(1, 'Jasper David Macaraeg', 921327972, 'jasper.macaraeg42@gmail.com', 'Male', '4865a036408f788cce8e3fabcbc6b5a61684896241.jpg', '202cb962ac59075b964b07152d234b70', 'Yes', '2023-05-23 06:31:58'),
(2, 'Soyux', 9, 'soyuzdayag@gmail.com', 'Male', NULL, '25d55ad283aa400af464c76d713c07ad', 'Yes', '2023-05-23 06:35:37'),
(3, 'Carl Bryan Dy', 9297611245, 'carldy04@gmail.com', 'Male', NULL, '202cb962ac59075b964b07152d234b70', 'Yes', '2023-05-23 06:40:42'),
(4, 'Danny O. Brenio', 9664657357, 'dannybrenio060@gmail.com', 'Male', NULL, '81dc9bdb52d04dc20036dbd8313ed055', 'Yes', '2023-05-23 06:44:56'),
(5, 'maribeth barros', 9451852608, 'maribethbarros0@gmail.com', 'Female', NULL, 'fab108b3e3e497b9501988d6c8de1b1a', 'Yes', '2023-05-23 06:50:43'),
(6, 'Francis', 0, 'ragequitv3@gmail.com', 'Male', NULL, 'c4ca4238a0b923820dcc509a6f75849b', 'Yes', '2023-05-23 07:02:30'),
(7, 'Mark Danny Dayag', 1235441231, 'ricksiv0107@gmail.com', 'Male', NULL, '25f9e794323b453885f5181f1b624d0b', 'Yes', '2023-05-23 07:08:11'),
(8, 'Francis Miguel V. Silguera', 0, 'francismiguel.silguera@gmail.com', 'Male', NULL, 'cfcd208495d565ef66e7dff9f98764da', 'Yes', '2023-05-24 00:50:51'),
(9, 'ryujin', 9212023063, 'tabuzo.leandris.bscs2022@gmail.com', 'Female', '261f958ef073187d151a454ff1b4a12d1685063902.png', '863ca5673aeafd920ef6558c260d3230', 'Yes', '2023-05-26 01:17:25'),
(10, 'Camille Soliman', 9050795313, 'soliman.camille.bscs2022@gmail.com', 'Female', NULL, 'a48a7f4d1cf8f07ec16454b17438872d', 'Yes', '2023-05-26 01:31:39'),
(11, 'Shinichi Kudo', 9123456789, 'faith17baile@gmail.com', 'Female', NULL, 'eb633d0d9a524624a35378c8402c0dc2', 'Yes', '2023-05-26 01:47:15'),
(12, 'lance patrick deleon p.', 9458738852, 'lancepatrickdeleon2004@gmail.com', 'Male', NULL, 'c6f057b86584942e415435ffb1fa93d4', 'Yes', '2023-05-26 01:55:19'),
(13, 'Justine James D. Balasabas', 9761980392, 'jstnjms8@gmail.com', 'Male', NULL, '81dc9bdb52d04dc20036dbd8313ed055', 'Yes', '2023-05-26 02:04:33'),
(14, 'Jan Vincent Alegria', 934732482, 'janvincentalegria27@gmail.com', 'Male', NULL, 'e168a28b7ffeb7b3ceabab90458877cd', 'Yes', '2023-05-26 03:36:09'),
(15, 'Keanu Ferrer Marquez', 909090909, 'keanumarquez70@gmail.com', 'Male', NULL, '4a6bd33bbcff4857ffc5655f0cb659fa', 'Yes', '2023-05-26 04:07:18'),
(16, 'sarah', 9212023063, 'sarahjoypastro333@gmail.com', 'Female', NULL, 'c53707e1e19e09c557f8164925559f81', 'Yes', '2023-05-26 04:42:01'),
(17, 'Jiro Mendador', 1233456789, 'jiromendador@gmail.com', 'Male', NULL, '25f9e794323b453885f5181f1b624d0b', 'Yes', '2023-05-26 04:53:46'),
(18, 'Juliana Mae Ilom', 92, 'julianamae.ilom01@gmail.com', 'Female', NULL, '25f9e794323b453885f5181f1b624d0b', 'Yes', '2023-05-26 05:07:51'),
(19, 'ma.cristine joy p. marcos', 9307001940, '20210541m.marcos.cristine.bscs@gmail.com', 'Female', NULL, '827ccb0eea8a706c4c34a16891f84e7b', 'Yes', '2023-05-26 06:12:24'),
(20, 'chelo', 9674536521, 'chelodelossantosbermas@gmail.com', 'Female', NULL, '1cc522434bd81270ec62410bec0917be', 'Yes', '2023-05-26 07:58:10'),
(21, 'Jerwin L. Candaza', 9774647140, 'jerwin.candaza2003@gmail.com', 'Male', NULL, '202cb962ac59075b964b07152d234b70', 'Yes', '2023-05-26 09:05:08');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_admin_account`
--

CREATE TABLE `jaks_admin_account` (
  `ID` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_admin_account`
--

INSERT INTO `jaks_admin_account` (`ID`, `name`, `email`, `username`, `password`, `usertype`) VALUES
(1, 'Jalyn Gutierrez', 'jalynguts01@gmail.com', 'Jalyn_Gutierrez', '25f9e794323b453885f5181f1b624d0b', 'Admin'),
(2, 'Alleli Arsua', 'alleliarsua09@gmail.com', 'alleli_arsua', '21232f297a57a5a743894a0e4a801fc3', 'Admin'),
(3, 'Princess Ramil', 'ramilprincessangelica@gmail.com', 'angge', 'c0b3667fc3e7c182626608dbd3b4651f', 'Admin'),
(4, 'Pau Colmo', 'pauclm.inc@gmail.com', 'PauClm', '216575bc31aa9ac156db63e9fce4f9ee', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_booknow`
--

CREATE TABLE `jaks_booknow` (
  `ID` bigint UNSIGNED NOT NULL,
  `booknum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `fullname` varchar(255) NOT NULL,
  `mobile_number` text NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `carname` varchar(255) NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `DateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `from_date` varchar(255) NOT NULL,
  `to_date` varchar(255) NOT NULL,
  `half_payment` bigint NOT NULL,
  `payment` bigint NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IDimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Days` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_booknow`
--

INSERT INTO `jaks_booknow` (`ID`, `booknum`, `fullname`, `mobile_number`, `home_address`, `email`, `carname`, `plate_number`, `DateTime`, `from_date`, `to_date`, `half_payment`, `payment`, `status`, `IDimage`, `Days`) VALUES
(1, '229942656', 'Sharmaine Layco', '9553254794', 'caloocan', 'laycosharmaine2@gmail.com', 'Nissan 370Z 2022', 'WGE 943', '2023-05-25 21:19:42', 'May 26, 2023', 'May 31, 2023', 25000, 50000, 'Complete', 'asset/images/ids/POSTAL ID (2).png', 5),
(2, '248525325', 'Alleli Arsua', '9051755811', 'P. Gomez St', '20200083m.arsua.alleli.bscs@gmail.com', 'Mitsubishi Strada 2022', 'TGS 362', '2023-05-25 21:31:09', 'May 26, 2023', 'May 29, 2023', 22500, 45000, 'Complete', 'asset/images/ids/Image (65).jpg', 3),
(3, '242248569', 'Aeryhiel Mojica', '9663811477', 'Caloocan City', 'mojica.aeryhieljohn.bscs2022@gmail.com', 'Suzuki Jimny 2022', 'XAG 662', '2023-05-26 01:15:37', 'May 26, 2023', 'May 31, 2023', 30000, 60000, 'Confirm', 'asset/images/ids/jamesreid.jpg', 5),
(4, '982776306', 'Ricardo Salvador IV', '996655623', '123 Banana St. Caloocan City', 'ricksiv0107@gmail.com', 'Kia Carnival 2022', 'JAK 371', '2023-05-26 01:18:38', 'May 26, 2023', 'May 31, 2023', 45000, 90000, 'Confirm', 'asset/images/ids/Image (65).jpg', 5),
(5, '665785681', 'ryujin shin', '9999999999', 'caloocan city', 'tabuzo.leandris.bscs2022@gmail.com', 'Isuzu mu-X 2022', 'NRU 151', '2023-05-26 01:39:29', 'May 27, 2023', 'June 1, 2023', 45000, 90000, 'Confirm', 'asset/images/ids/Image (65).jpg', 5),
(6, '998134619', 'Ronnie Red', '9222222222', 'diyan lang st. brgy malubgkot C.C', 'red.ronnie.bscs2022@gmail.com', 'Hyundai Palisade 2022', 'HAY 361', '2023-05-26 01:55:55', 'May 26, 2023', 'May 30, 2023', 40000, 80000, 'Confirm', 'asset/images/ids/Image (65).jpg', 4),
(7, '467332017', 'patricia veronilla', '9123456789', 'caloocan city', 'veronillapatricianicole@gmail.com', 'Chevrolet Suburban 2022', 'VWT 372', '2023-05-26 02:39:10', 'May 26, 2023', 'May 30, 2023', 40000, 80000, 'Confirm', 'asset/images/ids/Image (65).jpg', 4),
(8, '495426971', 'patrick de Leon', '9123456789', 'mandaluyong', 'lancepatrickdeleon2004@gmail.com', 'Chevrolet Camaro 2022', ' QRB 472', '2023-05-26 02:46:46', 'May 26, 2023', 'June 3, 2023', 16000, 32000, 'Confirm', 'asset/images/ids/Image (65).jpg', 8),
(9, '512579836', 'kenjie ar', '9876543212', 'caloocan city', 'cheaprides31@gmail.com', 'Honda CR-V 2022', 'THS 141', '2023-05-26 03:01:06', 'May 26, 2023', 'May 29, 2023', 27000, 54000, 'Confirm', 'asset/images/ids/Image (65).jpg', 3),
(10, '504013986', 'sean gonzaga', '9876543212', 'caloocan city', 'gonzaloseanruzzel.bsit@gmail.com', 'Suzuki Jimny 2022', 'TBD 875', '2023-05-26 03:11:47', 'May 27, 2023', 'June 2, 2023', 36000, 72000, 'Complete', 'asset/images/ids/Image (65).jpg', 6),
(11, '435208405', 'Mary Grace Valdeviezo', '9876543212', 'caloocan city', 'valdeviezomarygrace1108@gmail.com', 'Chery Tiggo 8 Pro 2022', 'NYA 724', '2023-05-26 03:47:40', 'May 27, 2023', 'June 3, 2023', 63000, 126000, 'Confirm', 'asset/images/ids/Image (65).jpg', 7),
(12, '419025016', 'kenz dave rayos', '9876543212', 'caloocan city', '20210587.rayos.kenzdave.bscs@gmail.com', 'Suzuki APV 2022', 'TBS 235', '2023-05-26 04:07:28', 'May 27, 2023', 'June 10, 2023', 140000, 280000, 'Confirm', 'asset/images/ids/Image (65).jpg', 14),
(13, '843628303', 'Maritoni Reyes', '9876543212', 'caloocan city', 'reyesmaritoni11@gmail.com', 'Isuzu D-MAX 2022', 'AGB 135', '2023-05-26 04:19:32', 'May 28, 2023', 'June 8, 2023', 82500, 165000, 'Confirm', 'asset/images/ids/Image (65).jpg', 11),
(14, '324494243', 'Alleli Arsua', '9051755811', 'P. Gomez St', '20200083m.arsua.alleli.bscs@gmail.com', 'Chevrolet Camaro 2022', 'PJC 599', '2023-05-26 04:35:49', 'May 27, 2023', 'May 31, 2023', 8000, 16000, 'Confirm', 'asset/images/ids/Image (65).jpg', 4),
(15, '133582647', 'Dan Edward  Manuel', '9876543212', 'caloocan city', 'danedwardm@gmail.com', 'Suzuki Celerio 2022', 'TNS 526', '2023-05-26 04:44:11', 'May 27, 2023', 'June 2, 2023', 45000, 90000, 'Confirm', 'asset/images/ids/Image (65).jpg', 6),
(16, '924153249', 'Roy  Collo', '9876543212', 'caloocan city', 'roylewisc@gmail.com', 'Hyundai Ioniq Hybrid 2022', 'AGR 161', '2023-05-26 04:51:52', 'May 30, 2023', 'June 10, 2023', 82500, 165000, 'Confirm', 'asset/images/ids/Image (65).jpg', 11),
(17, '415281849', 'Dan Edward  Manuel', '9876543212', 'biglang awa', 'danedwardm@gmail.com', 'Ford Mustang 2022', 'XET 737', '2023-05-26 05:21:33', 'May 27, 2023', 'May 31, 2023', 24000, 48000, 'Confirm', 'asset/images/ids/Image (65).jpg', 4),
(18, '337728297', 'John Kenneth Adriano', '9164381772', 'caloocan city', 'jkadriano2002@gmail.com', 'Chevrolet Camaro 2022', 'PLM 094', '2023-05-26 05:39:02', 'May 24, 2023', 'May 26, 2023', 4000, 8000, 'Confirm', 'asset/images/ids/Image (65).jpg', 2),
(19, '435472664', 'Alleli Arsua', '9123456789', 'biglang awa', '20200083m.arsua.alleli.bscs@gmail.com', 'Suzuki Jimny 2022', 'JAH 564', '2023-05-26 06:17:46', 'May 27, 2023', 'May 31, 2023', 24000, 48000, 'Confirm', 'asset/images/ids/Image (65).jpg', 4),
(20, '313261708', 'harley dave llnes', '9876543212', 'caloocan city', 'hdllenes@gmail.com', 'Suzuki Jimny 2022', 'PHR 938', '2023-05-26 06:27:38', 'May 26, 2023', 'May 31, 2023', 30000, 60000, 'Cancel', 'asset/images/ids/Image (65).jpg', 5),
(21, NULL, 'Sharmaine Layco', '9553254794', 'caloocan', 'laycosharmaine2@gmail.com', 'Suzuki Celerio 2022', 'TNS 526', '2023-05-26 14:37:10', '2023-05-26', '2023-05-31', 37500, 75000, NULL, NULL, 5),
(22, NULL, 'Kenjie Arceo', '9567283342', '21 Marikina Street Maypajo Caloocan City', '20200082m.arceo.kenjie.bscs@gmail.com', 'Suzuki Jimny 2022', 'FNG 2345', '2023-05-26 14:48:38', 'May 27, 2023', 'June 1, 2023', 30000, 60000, 'Pending', 'asset/images/ids/Image (65).jpg', 5),
(23, '175097427', 'Kenjie Arceo', '9567283342', '21 Marikina Street Maypajo Caloocan City', '20200082m.arceo.kenjie.bscs@gmail.com', 'Honda Brio 2022', 'ZGA 621', '2023-05-26 06:58:36', 'May 26, 2023', 'June 3, 2023', 60000, 120000, 'Confirm', 'asset/images/ids/Image (65).jpg', 8),
(24, NULL, 'Sharmaine Layco', '9553254794', 'caloocan', 'laycosharmaine2@gmail.com', 'Mitsubishi Mirage G4 2022', 'TBD 869', '2023-05-26 14:58:29', '2023-05-26', '2023-05-31', 37500, 75000, 'Cancel', NULL, 5),
(25, '937494662', 'dahlia Aspe', '9123456789', 'caloocan city', 'aspedahlia@gmail.com', 'Nissan GT-R 2022', 'WBY 722', '2023-05-26 07:14:48', 'May 27, 2023', 'May 31, 2023', 24000, 48000, 'Cancel', 'asset/images/ids/Image (65).jpg', 4),
(26, '820989944', 'Denzel david', '9876543212', 'caloocan city', 'daviddenzelmatthew.bsit@gmail.com', 'Mitsubishi Strada 2022', 'TGS 362', '2023-05-26 08:56:55', 'May 27, 2023', 'May 31, 2023', 30000, 60000, 'Confirm', 'asset/images/ids/Image (65).jpg', 4),
(27, '909555391', 'Alleli Arsua', '9876543211', 'canada', '20200083m.arsua.alleli.bscs@gmail.com', 'Nissan GT-R 2022', 'QWE 987', '2023-05-26 09:08:51', 'May 29, 2023', 'June 3, 2023', 30000, 60000, 'Cancel', 'asset/images/ids/Image (65).jpg', 5),
(28, '675497866', 'Alleli Arsua', '9876543211', 'canada', '20200083m.arsua.alleli.bscs@gmail.com', 'Suzuki Jimny 2022', 'TBD 875', '2023-05-26 09:28:34', 'May 27, 2023', 'May 31, 2023', 24000, 48000, 'Cancel', 'asset/images/ids/Image (65).jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jaks_brands`
--

CREATE TABLE `jaks_brands` (
  `ID` bigint UNSIGNED NOT NULL,
  `BRAND_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_brands`
--

INSERT INTO `jaks_brands` (`ID`, `BRAND_NAME`) VALUES
(1, 'TOYOTA'),
(2, 'MITSUBISHI'),
(3, 'HONDA'),
(4, 'SUZUKI'),
(5, 'FORD'),
(6, 'NISSAN'),
(7, 'HYUNDAI'),
(8, 'ISUZU'),
(9, 'CHEVROLET'),
(10, 'KIA'),
(11, 'CHERRY'),
(12, 'GEELY');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_carlist`
--

CREATE TABLE `jaks_carlist` (
  `ID` bigint UNSIGNED NOT NULL,
  `NAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `BRAND` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `SEATER` int NOT NULL,
  `FUEL` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_TYPE` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TRANSMISSION` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `PLATE_NUMBER` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CODING` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REG_OR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `IMAGE` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `OVERVIEW` text COLLATE utf8mb4_general_ci NOT NULL,
  `PRICE` int NOT NULL,
  `STATUS` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jaks_carlist`
--

INSERT INTO `jaks_carlist` (`ID`, `NAME`, `BRAND`, `SEATER`, `FUEL`, `NAME_TYPE`, `TRANSMISSION`, `PLATE_NUMBER`, `CODING`, `REG_OR`, `IMAGE`, `OVERVIEW`, `PRICE`, `STATUS`) VALUES
(1, 'Mitsubishi Mirage G4 2022', '2', 3, '1', '5', '4', 'TBD 869', 'FRIDAY', 'SEPTEMBER 9, 2021', 'asset/images/png/Mitsubishi-Mirage-G4.png', 'The Mirage G4’s interior is black and comes with black fabric seats with a new geometric design. The infotainment system is 7-inches in size, and standard for all models.  The Mirage G4 is powered by a three-cylinder 1.2-liter engine. The 1.2-liter power plant produces 76 hp and 100 Nm of torque. Power is sent to the front wheel either by a 5-speed manual or a CVT.', 15000, 1),
(2, 'Mitsubishi Strada 2022', '2', 3, '4', '4', '5', 'TGS 362', 'MONDAY', 'FEBRUARY 11, 2021', 'asset/images/png/Mitsubishi-Strada.png', 'The Mitsubishi Strada is athletic, agile, and sporty yet promising to conquer any country roads. Quality is emphasized on the interior with soft-pad materials. Despite the facelift, the Strada now only runs with a 2.4-liter 4 in-line Clean Diesel with Variable Geometry Turbo and MIVEC 4N15 engine, scrapping the former 2.5-liter Common Rail Direct Injection 4D56 diesel engine. That leaves the Strada nameplate with one powerplant, which can produce 181 hp and 430 Nm of torque. ', 15000, 1),
(3, 'Honda Brio 2022', '3', 3, '1', '3', '4', 'ZGA 621', 'MONDAY', 'JANUARY 6, 2021', 'asset/images/png/Honda-Brio.png', 'Honda Cars Philippines, Incorporated (HCPI) latest small hatchback has much to like in a good looking and compact package. As the entry-level offering from Honda, it features small exterior proportions, but with a deceptively large cabin. With multiple trim options, including the stylish RS Blacktop variant, the hatchback can appeal to a wide audience looking for a fuel-efficient car that’s reliable and easy to maneuver. ', 15000, 1),
(4, 'Honda CR-V 2022', '3', 4, '2', '2', '2', 'THS 141', 'MONDAY', 'JANUARY 12, 2021', 'asset/images/png/Honda-CR-V.png', 'The Honda CR-V stands for “Comfortable Runabout Vehicle.” is available in two variants – the 7-seater diesel and 5-seater gasoline. The diesel-powered CR-V has 3 subvariants: SX Diesel 9AT AWD, S Diesel 9AT, and V Diesel 9AT. All of these will be using the 1.6 i-DTEC turbodiesel engine and a 9-speed automatic transmission with Electronic Gear Selector.', 18000, 1),
(5, 'Suzuki Jimny 2022', '4', 2, '1', '7', '5', 'XAG 662', 'MONDAY', 'FEBRUARY 13, 2021', 'asset/images/png/Suzuki-Jimny.png', 'Suzuki Jimny small SUV redesign has undoubtedly struck a chord with the market. The turn of events was enough to stretch Suzuki reservation list to great lengths even before the model’s release. With a short wheelbase, a proper 4x4 system, and an exterior that is well-laden with rugged and quirky styling, Jimny will surely be able to traverse any terrain as well as turn some heads while it’s at it. ', 12000, 0),
(6, 'Suzuki Celerio 2022', '4', 3, '2', '3', '1', 'TNS 526', 'WEDNESDAY', 'JUNE 1, 2021', 'asset/images/png/Suzuki-Celerio.png', 'The Suzuki Celerio is Suzuki’s The small hatchback features an updated 3D organic sculpted design as seen on the sleek and rounded front fascia, improved cargo capacity of 295 Liters, while additional space can be had thanks to its 60:40 split and folding seats. Powered by Suzuki’s K10C three-cylinder 1.0-liter engine. The DOHC engine produces 66 hp and 89 Nm of torque. The engine can be either had with a five-speed manual transmission.', 15000, 1),
(7, 'Ford F-150 2022', '5', 3, '2', '4', '2', 'UOI 629', 'FRIDAY', 'SEPTEMBER 4, 2021', 'asset/images/png/Ford-F-150 .png', 'Ford Philippines launched the 2020 Ford F-150 on June 24, 2020. The Ford F-150 returns to the market powered by a 3.5-liter twin-turbo V6 motor making 375hp and 600 Nm of torque. Power is sent to the wheels via a 10-speed automatic transmission for all models. it is currently available with two variants the Lariat and the Platinum variant. The range-topping Platinum is the only variant of the pickup truck to come with a four-wheel-drive system.', 15000, 0),
(8, 'Ford Mustang 2022', '5', 2, '1', '8', '5', 'XET 737', 'THURSDAY', 'JULY 6, 2021', 'asset/images/png/Ford-Mustang.png', 'The Stang has a sleeker set of fog lamps and a new layout for its front DRLs that matches its taillights. Inside, this coupe gets a refreshed cabin with new materials for its trims. There’s also the 2.3L 4-cylinder EcoBoost with a huge power output of 310 hp and 434 Nm of torque, thanks to its turbocharger. These powerful mills are paired to a 10-speed Select Shift automatic transmission.', 12000, 1),
(9, 'Nissan GT-R 2022', '6', 2, '3', '8', '1', 'WBY 722', 'MONDAY', 'FEBRUARY 6, 2021', 'asset/images/png/Nissan-GT-R.png', 'The Nissan GT-R is a leather-trimmed cabin for four people. It has a Dual Zone Automatic Climate Control and a Bose Sound System. The driver will appreciate the Push Start capability, large gauges, and Nissan Hard Drive Navigation system with a seven-inch touchscreen display. At the core of the Nissan GT-R is a 3.8L six-cylinder engine that produces 570 hp and 633 Nm of torque. It\'s connected to a six-speed dual-clutch automatic transmission that has three driver-selectable modes. ', 12000, 0),
(10, 'Nissan Navara 2022', '6', 3, '4', '4', '5', 'TVK 227', 'THURSDAY', 'JULY 3, 2021', 'asset/images/png/Nissan-Navara.png', 'The Nissan Navara is a midsize pickup truck 2.5-liter 16-valve engine runs the Nissan Navara, which starts at 161 hp with 403 Nm of torque for the base model, while the range-topping variants have 187 hp with 450 Nm of torque. Transmission options include a six-speed manual or seven-speed automatic, while the drivetrain can either come in 4x2 or 4x4 configurations.', 15000, 0),
(11, 'Hyundai Palisade 2022', '7', 5, '4', '2', '1', 'HAY 361', 'MONDAY', 'JANUARY 9, 2021', 'asset/images/png/Hyundai-Palisade.png', 'Hyundai Philippines has a new flagship for the three-row SUV segment, called the Palisade. The Palisade will be categorized as a premium midsized SUV that’s equipped with versatile cargo space and passenger room. Every Palisade seating row offers USB outlets for convenience for each passenger, seven in total. There’s also an industry-first roof vent diffuser that provides a focused, partially-diffused or fully-diffused stream of air to rear passengers.', 20000, 1),
(12, 'Hyundai Ioniq Hybrid 2022', '7', 3, '2', '3', '1', 'AGR 161', 'MONDAY', 'JANUARY 6, 2021', 'asset/images/png/Hyundai-Ioniq-Hybrid.png', 'Hybrid is Hyundai flag-bearer in the realm of hybrid vehicles in the country. This gives the car a combined fuel efficiency of 24 km/l. Its 1.6-liter Atkinson cycle engine generates 105 hp and is paired to a dual-clutch 6-speed transmission. An electric motor puts out an additional 43 hp, which, all in all, spurs out 139 hp. There is also a 12-volt Lithium-Ion Polymer under the hood. Additional features include a 60:40 split-folding capability of the rear seats, as well as an electrically-adjustable driver seat. ', 15000, 1),
(13, 'Isuzu D-MAX 2022', '8', 3, '4', '4', '5', 'AGB 135', 'WEDNESDAY', 'MAY 5, 2021', 'asset/images/png/Isuzu-D-MAX.png', 'The Isuzu D-MAX is Isuzu Philippines entry to the midsize pickup truck segment. It’s the Japanese brand workhorse that\'s designed to take on any road and any job. The D-MAX inherited the reliability of the Fuego and its other predecessors. Aside from its new looks, the latest D-MAX also stepped up in terms of safety, plus, it underpins Isuzu\'s latest Dynamic Drive Platform. ', 15000, 1),
(14, 'Chevrolet Camaro 2022', '9', 2, '1', '8', '1', ' QRB 472', 'MONDAY', 'FEBRUARY 20, 2021', 'asset/images/png/Chevrolet-Camaro.png', 'The Camaro long muscle car heritage and its stint as Bumblebee in the Transformers movie. The RS package includes 20-inch wheels, LED headlamps with an LED light bar, dark tail lamps, black front, and rear bowtie emblems, and RS-specific grille. The Camaro seats 4, with leather seats and a slew of modern-day gizmos cleverly blended in with the demeanor that this car evokes. Under its hood is Chevy’s 2.0L Ecotec engine. ', 4000, 1),
(15, 'Chevrolet Suburban 2022', '9', 5, '1', '7', '3', 'VWT 372', 'MONDAY', 'FEBRUARY 21, 2021', 'asset/images/png/Chevrolet-Suburban.png', 'Chevrolet Philippines premium SUV in the country. A sculpted body and minimalist side and rear maintain a classy look. Eight people can enjoy the premium leather seats, tri-zone air conditioning, and Bose premium sound system. Available in either rear-wheel or all-wheel drive, the Chevrolet Suburban runs on a 5.3L EcoTec V8 engine that produces 355 hp with 516 Nm of torque. Transmission is a six-speed automatic with Tow/Haul mode. ', 20000, 1),
(16, 'Kia Sportage 2022', '10', 3, '4', '2', '1', 'HJS 262', 'MONDAY', 'FEBRUARY 14, 2021', 'asset/images/png/Kia-Sportage.png', 'The all-new Kia Sportage is powered by a R 2.0L in-line 4 e-VGT CRDi DOHC diesel engine that improves emissions, fuel efficiency, NVH (noise, vibration, and harshness), and response. When it comes to safety, it will not shy away from its competitors with features such as Blind Spot Detection, Rear Cross Traffic Alert, Park Assist System, Auto Cruise Control, Vehicle Stability Management, Drive Mode Select, and the Autonomous Emergency Braking (AEB). ', 15000, 0),
(17, 'Kia Carnival 2022', '10', 4, '4', '1', '3', 'JAK 371', 'MONDAY', 'JANUARY 16, 2021', 'asset/images/png/Kia-Carnival.png', 'The Kia Carnival serves as the brand entry into the minivan segment in the Philippines. It now comes with a more imposing look thanks to new proportions that make it look like a stretched SUV. It is now powered by a 2.0-liter turbo diesel engine that is mated to an 8-speed automatic transmission that sends power only to the front wheels. It is available in two variants the EX and SX with each bringing compelling and exciting features to the GUV.', 18000, 1),
(18, 'Chery Tiggo 8 Pro 2022', '11', 4, '3', '2', '1', 'NYA 724', 'TUESDAY', 'APRIL 1, 2021', 'asset/images/png/Chery-Tiggo-8-Pro.png', 'The Chery Tiggo 8 Pro is the latest offering from the automaker that comes with three different variants available. The first is a 1.6-liter turbocharged engine, the next is a bigger 2.0-liter turbo motor, and the third engine option is a 1.5-liter hybrid drivetrain. It comes with all the amenities one would expect from a crossover of its class such as leather seats and a large 12.3-inch touchscreen infotainment system.', 18000, 1),
(19, 'Geely Azkarra 2022', '12', 3, '2', '2', '3', 'BRY 622', 'MONDAY', 'FEBRUARY 7, 2021', 'asset/images/png/Geely-Azkarra.png', 'The Geely Azkarra crossover comes with a mild hybrid system that is mated to a 1.5-liter 3-cylinder turbocharged engine. There are currently two variants available with the top of the line getting the mild hybrid option. The hybrid system comes in the form of a 48V Energy Management System that helps store energy as well as direct power to either add more power to the vehicle or put it into the electric-only mode for short durations.  ', 15000, 0),
(20, 'Geely Coolray 2022', '12', 2, '3', '2', '1', 'VSY 947', 'THURSDAY', 'JUNE 12, 2021', 'asset/images/png/Geely-Coolray.png', 'Geely Coolray the vehicle is 4,300mm long, 1,800mm wide, and 1,609mm tall. It features LED daytime running lights as well as LED headlights for the range-topping Sport variant. Powering the crossover is a 1.5-liter 3-cylinder turbocharged gasoline engine that produces 177 hp and 255 Nm of torque, which is connected to a 7-speed wet dual-clutch transmission.', 12000, 0),
(21, 'Suzuki APV 2022', '4', 5, '3', '6', '2', 'TBS 235', 'WEDNESDAY', 'MAY 6, 2021', 'asset/images/png/Suzuki-APV.png', 'Powering the Suzuki APV is a 1.6-liter SOHC 16-valve engine that has a 5-speed manual transmission. With its vast cabin space and functionality, tried and tested durability, and power figures reaching 91 hp and 127 Nm of torque, the APV certainly is more than capable of surviving the daily grind to arrive home, freshen up a bit, and be on the road all over again to celebrate life with loved ones.', 20000, 1),
(22, 'Nissan 370Z 2022', '6', 1, '3', '8', '5', 'WGE 943', 'TUESDAY', 'MARCH 14, 2021', 'asset/images/png/Nissan-370Z.png', 'The Nissan 370Z is the brand 2-door, 2-seater sports car in the Philippines. It comes available with three variants, two of which are the regular version of the 370z in their automatic and manual forms respectively, while the other variant is the NISMO version of the vehicle.3.7-liter naturally aspirated V6 gasoline engine that produces 327hp and 363 Nm of torque. It can be had with either a 6-speed manual or a 7-speed automatic transmission for the premium variants. ', 10000, 0),
(23, 'Isuzu mu-X 2022', '8', 5, '4', '7', '1', 'NRU 151', 'MONDAY', 'JANUARY 9, 2021', 'asset/images/png/Isuzu-mu-X.png', 'Isuzu mu-X  There are two powertrain options available for the all-new Isuzu mu-X. The Blue Power range of engines includes the base 1.9-liter RZ4E turbo diesel motor that churns out the same figures as before, respectively, 148 hp and 350 Nm of torque. The other one is a 3.0-liter Blue Power turbo diesel engine that puts out a healthier 187 hp and 450 Nm of torque.', 18000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jaks_car_details`
--

CREATE TABLE `jaks_car_details` (
  `ID` int NOT NULL,
  `CAR_ID` int NOT NULL,
  `PLATE_NUMBER` varchar(255) NOT NULL,
  `CODING` varchar(255) NOT NULL,
  `REG_OR` varchar(20) NOT NULL,
  `REG_CR` bigint NOT NULL,
  `STATUS` varchar(255) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_car_details`
--

INSERT INTO `jaks_car_details` (`ID`, `CAR_ID`, `PLATE_NUMBER`, `CODING`, `REG_OR`, `REG_CR`, `STATUS`) VALUES
(1, 1, 'TBD 869', 'FRIDAY', '36370062131941972208', 49059241, 'Borrowed'),
(2, 2, 'TGS 362', 'MONDAY', '20889582283617576148', 95843453, 'Borrowed'),
(3, 3, 'ZGA 621', 'MONDAY', '43761310125886385854', 18227990, 'Borrowed'),
(4, 4, 'THS 141', 'MONDAY', '60800364841988015051', 25463714, 'Borrowed'),
(5, 5, 'XAG 662', 'MONDAY', '11842272237363562007', 50818148, 'Borrowed'),
(6, 5, 'TBD 875', 'FRIDAY', '20140620252384815378', 74237820, 'Borrowed'),
(7, 5, 'JAH 564', 'TUESDAY', '63005542765427898041', 53844215, 'Borrowed'),
(8, 5, 'PHR 938', 'MONDAY', '91728638409954824595', 49454548, 'Borrowed'),
(9, 6, 'TNS 526', 'WEDNESDAY', '90323898455022835972', 89627889, 'Borrowed'),
(10, 7, 'UOI 629', 'FRIDAY', '54882224228910125605', 46705268, 'Available'),
(11, 8, 'XET 737', 'THURSDAY', '41067787711276369837', 47279134, 'Borrowed'),
(12, 9, 'WBY 722', 'MONDAY', '71709313833414390489', 86621550, 'Borrowed'),
(13, 9, 'QWE 987', 'THURSDAY', '33504060135132360025', 51673868, 'Borrowed'),
(14, 9, 'CXY 612', 'MONDAY', '00192631161319243408', 77209825, 'Available'),
(15, 10, 'TVK 227', 'THURSDAY', '49804869571053144331', 26080634, 'Available'),
(16, 11, 'HAY 361', 'MONDAY', '84581326736760249509', 90510211, 'Borrowed'),
(17, 12, 'AGR 161', 'MONDAY', '60071457505328035909', 11316652, 'Borrowed'),
(18, 13, 'AGB 135', 'WEDNESDAY', '93825992459517305125', 71558333, 'Borrowed'),
(19, 14, ' QRB 472', 'MONDAY', '39457508404896927571', 55321189, 'Borrowed'),
(20, 14, 'PJC 599', 'WEDNESDAY', '28694131998687119368', 71136399, 'Borrowed'),
(21, 14, 'PLM 094', 'TUESDAY', '95900910943426178717', 38588202, 'Borrowed'),
(22, 15, 'VWT 372', 'MONDAY', '88373448197806897684', 54255685, 'Borrowed'),
(23, 16, 'HJS 262', 'MONDAY', '33319794316440944667', 70770584, 'Available'),
(24, 17, 'JAK 371', 'MONDAY', '85908527887047709115', 52681929, 'Borrowed'),
(25, 18, 'NYA 724', 'TUESDAY', '34806533851540894178', 20218598, 'Borrowed'),
(26, 19, 'BRY 622', 'MONDAY', '20083280850208439554', 23381131, 'Available'),
(27, 20, 'VSY 947', 'THURSDAY', '30623533250922650173', 55664044, 'Available'),
(28, 21, 'TBS 235', 'WEDNESDAY', '13152203181985197103', 71283636, 'Borrowed'),
(29, 22, 'WGE 943', 'TUESDAY', '16013428328934493175', 71488714, 'Available'),
(30, 23, 'NRU 151', 'MONDAY', '95692332928089413793', 46781863, 'Borrowed'),
(31, 5, 'FNG 2345', '2', '123456789123456', 14725836, 'Available'),
(32, 5, 'DFG 123', 'MONDAY', '123456789123456', 14725836, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_coding`
--

CREATE TABLE `jaks_coding` (
  `ID` int NOT NULL,
  `CODING` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_coding`
--

INSERT INTO `jaks_coding` (`ID`, `CODING`) VALUES
(1, 'MONDAY'),
(2, 'TUESDAY'),
(3, 'WEDNESDAY'),
(4, 'THURSDAY'),
(5, 'FRIDAY');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_contact_us`
--

CREATE TABLE `jaks_contact_us` (
  `ID` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_contact_us`
--

INSERT INTO `jaks_contact_us` (`ID`, `name`, `email`, `subject`, `message`) VALUES
(5, 'Sharmaine Layco', 'laycosharmaine2@gmail.com', 'Carlist', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut lacinia nisl, vel iaculis orci. Sed pulvinar consequat metus, ut pharetra turpis aliquet sit amet. Nulla facilisi.'),
(6, 'Jalyn Gutierrez', 'jalyn@gmail.com', 'Sign up', 'Suspendisse ac ligula semper, feugiat enim vel, vestibulum massa. Curabitur mattis orci eget ex bibendum, nec hendrerit mi feugiat. '),
(8, 'kenjie', 'kenjie@gmail.com', 'Car Details', 'Donec aliquet ante eget commodo tincidunt. Vestibulum eget sagittis velit, sed fringilla quam.'),
(10, 'xu_pau', 'pauclm.inc@gmail.com', 'My Profile', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed in ipsum hendrerit, ullamcorper risus non, aliquam metus.'),
(12, 'Alleli Reyes Arsua', 'alleliarsua09@gmail.com', 'My Booking', 'Sed tristique, enim vel consequat facilisis, sem massa efficitur magna, vitae rhoncus enim metus a lacus. Integer sed sem et orci cursus posuere.');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_fuel`
--

CREATE TABLE `jaks_fuel` (
  `ID` bigint UNSIGNED NOT NULL,
  `FUEL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_fuel`
--

INSERT INTO `jaks_fuel` (`ID`, `FUEL`) VALUES
(1, 'GASOLINE'),
(2, 'HYBRID'),
(3, 'DIESEL'),
(4, 'GASOLINE/DIESEL');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_location`
--

CREATE TABLE `jaks_location` (
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_location`
--

INSERT INTO `jaks_location` (`latitude`, `longitude`) VALUES
(14.65347072, 120.99492902),
(14.65346224, 120.99493413),
(14.65346181, 120.99494271),
(14.6534556, 120.99494187),
(14.65360704, 120.99509616),
(14.65364555, 120.9951806),
(14.65364765, 120.99517426),
(14.6536468, 120.99518332),
(14.65364619, 120.99518955),
(14.65364622, 120.9951906),
(14.65364618, 120.99519483),
(14.65364613, 120.99519753),
(14.65364606, 120.99520044),
(14.65365037, 120.99524913),
(14.65365275, 120.99528604),
(14.65349507, 120.99542253),
(14.65347081, 120.99540174),
(14.65353756, 120.99538748),
(14.65351422, 120.99540547),
(14.65343805, 120.99485286),
(14.65347104, 120.9946454),
(14.65346264, 120.99463003),
(14.65345677, 120.99461225),
(14.65345309, 120.99461528),
(14.65345603, 120.99461564),
(14.65345405, 120.99460651),
(14.6534542, 120.99460692),
(14.6534542, 120.99460692),
(14.65345429, 120.9946072),
(14.65345468, 120.99460839),
(14.65345485, 120.9946079),
(14.65345511, 120.99460853),
(14.65345517, 120.99460868),
(14.65345502, 120.99460855),
(14.65345537, 120.99460828),
(14.6534553, 120.99460783),
(14.65345531, 120.99460785),
(14.65345523, 120.99460779),
(14.65345514, 120.99460756),
(14.65345517, 120.99460422),
(14.65345513, 120.9946043),
(14.65345491, 120.99460517),
(14.65345491, 120.99460517),
(14.65345446, 120.99460048),
(14.6534544, 120.99460076),
(14.65345441, 120.99460077),
(14.65345442, 120.99460079),
(14.65345452, 120.99460176),
(14.65345438, 120.99460162),
(14.6534544, 120.99460161),
(14.65345439, 120.99460162),
(14.65345363, 120.99461492),
(14.65345364, 120.9946149),
(14.65345365, 120.99461485),
(14.65345366, 120.9946148),
(14.65345368, 120.99461472),
(14.65344868, 120.99463834),
(14.65344868, 120.99463833),
(14.65344325, 120.99464573),
(14.65344325, 120.99464573),
(14.65344298, 120.99465602),
(14.65344298, 120.99465602),
(14.65344298, 120.99465602),
(14.65344298, 120.99465602),
(14.65344351, 120.99465581),
(14.65344267, 120.99466114),
(14.65344268, 120.99466114),
(14.6534429, 120.99466131),
(14.6534429, 120.99466131),
(14.65344328, 120.99466199),
(14.65344328, 120.99466199),
(14.65344344, 120.99466225),
(14.65344371, 120.9946624),
(14.6534437, 120.99466241),
(14.65344371, 120.9946624),
(14.65344371, 120.9946624),
(14.65344371, 120.9946624),
(14.65344525, 120.99467015),
(14.65344525, 120.99467015),
(14.65344525, 120.99467013),
(14.65344524, 120.99467013),
(14.65344524, 120.99467012),
(14.65344524, 120.99467011),
(14.65344524, 120.9946701),
(14.65344665, 120.99467372),
(14.65344665, 120.99467372),
(14.65344665, 120.99467372),
(14.65344665, 120.99467372),
(14.65344821, 120.99467566),
(14.65344821, 120.99467566),
(14.6534471, 120.99467491),
(14.6534471, 120.99467491),
(14.6534471, 120.99467491),
(14.6534471, 120.99467491),
(14.6534471, 120.99467491),
(14.65344711, 120.99467491),
(14.65344711, 120.99467491),
(14.65344711, 120.99467491),
(14.65344711, 120.99467491),
(14.65344711, 120.99467491),
(14.65344606, 120.99467433),
(14.65344606, 120.99467433),
(14.65344606, 120.99467433),
(14.65344606, 120.99467433),
(14.65344617, 120.99467445),
(14.65344617, 120.99467445),
(14.65344475, 120.99467356),
(14.65344475, 120.99467356),
(14.65344415, 120.9946731),
(14.65344415, 120.9946731),
(14.65344415, 120.9946731),
(14.65344415, 120.9946731),
(14.6534438, 120.99467315),
(14.65344247, 120.99467245),
(14.65344248, 120.99467245),
(14.65344096, 120.99467157),
(14.65344096, 120.99467157),
(14.65338747, 120.99465158),
(14.65349004, 120.99470039),
(14.65349004, 120.99470039),
(14.65343997, 120.99441779),
(14.65343997, 120.99441779),
(14.6534109, 120.99467345),
(14.6534807, 120.9948451),
(14.6420378, 120.97814401),
(14.6420378, 120.97814401),
(14.64207405, 120.978138),
(14.64207405, 120.978138),
(14.64204768, 120.97819166),
(14.64204768, 120.97819166),
(14.64195766, 120.97815039),
(14.64195766, 120.97815039),
(14.64191985, 120.97794435),
(14.64191985, 120.97794435),
(14.6420162, 120.97813302),
(14.64201972, 120.97814133),
(14.64201579, 120.9781216),
(14.64201579, 120.9781216),
(14.642078, 120.978184),
(14.642078, 120.978184),
(14.64210307, 120.97791092),
(14.64210307, 120.97791092),
(14.64192291, 120.97782458),
(14.64192291, 120.97782458),
(14.64192842, 120.97782491),
(14.64192842, 120.97782491);

-- --------------------------------------------------------

--
-- Table structure for table `jaks_login`
--

CREATE TABLE `jaks_login` (
  `ID` bigint UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_login`
--

INSERT INTO `jaks_login` (`ID`, `email`, `username`, `password`, `usertype`) VALUES
(1, 'jalynguts01@gmail.com', 'Jalyn_Gutierrez', '25f9e794323b453885f5181f1b624d0b', 'Admin'),
(2, '20200082m.arceo.kenjie.bscs@gmail.com', 'arzikenzi27', '25f9e794323b453885f5181f1b624d0b', 'user'),
(3, 'laycosharmaine2@gmail.com', 'sha', '3bad6af0fa4b8b330d162e19938ee981', 'user'),
(4, '20200083m.arsua.alleli.bscs@gmail.com', 'alleli_arsua', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(5, 'alleliarsua09@gmail.com', 'alleli_arsua', '21232f297a57a5a743894a0e4a801fc3', 'Admin'),
(6, 'allelireyesarsua@gmail.com', 'ali_reyes', '6ebe76c9fb411be97b3b0d48b791a7c9', 'Staff'),
(7, 'sj6.karceo22@joysistvi.edu.ph', 'arzikenzi', '31c3d7d795cd60aa4e2cbe5d9ed2c1fb', 'user'),
(8, 'mojica.aeryhieljohn.bscs2022@gmail.com', '20200096m.gutierrez.jalyn.bscs@gmail.com', '7d3131af603eea9d3349005517e9626f', 'user'),
(9, 'ricksiv0107@gmail.com', 'MrYoso', '25f9e794323b453885f5181f1b624d0b', 'user'),
(10, 'tabuzo.leandris.bscs2022@gmail.com', 'ryujin17', '863ca5673aeafd920ef6558c260d3230', 'user'),
(11, 'red.ronnie.bscs2022@gmail.com', 'tangolXD', '81dfa80e933ddc2ada50e57a1b296df1', 'user'),
(12, '', 'tangolXD', '81dfa80e933ddc2ada50e57a1b296df1', 'user'),
(13, 'ramilprincessangelica@gmail.com', 'angge', 'c0b3667fc3e7c182626608dbd3b4651f', 'Admin'),
(14, 'veronillapatricianicole@gmail.com', 'patty', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(15, 'lancepatrickdeleon2004@gmail.com', 'patt', '25d55ad283aa400af464c76d713c07ad', 'user'),
(16, 'cheaprides31@gmail.com', 'ken', '25f9e794323b453885f5181f1b624d0b', 'user'),
(17, 'gonzaloseanruzzel.bsit@gmail.com', 'sean', '25f9e794323b453885f5181f1b624d0b', 'user'),
(18, 'valdeviezomarygrace1108@gmail.com', 'MaryGrace', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(19, '20210587.rayos.kenzdave.bscs@gmail.com', 'kenz', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(20, 'reyesmaritoni11@gmail.com', 'maritoni', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(21, 'danedwardm@gmail.com', 'manuel', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(22, 'roylewisc@gmail.com', 'cutieroy', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(23, 'jkadriano2002@gmail.com', 'kenneth', '25d55ad283aa400af464c76d713c07ad', 'user'),
(24, 'hdllenes@gmail.com', 'dave', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(25, 'pauclm.inc@gmail.com', 'PauClm', '216575bc31aa9ac156db63e9fce4f9ee', 'Admin'),
(26, 'aspedahlia@gmail.com', 'dbtriz', '25d55ad283aa400af464c76d713c07ad', 'user'),
(27, 'daviddenzelmatthew.bsit@gmail.com', 'eaa', 'e807f1fcf82d132f9bb018ca6738a19f', 'user'),
(28, '20200089m.colmo.paulamae.bscs@gmail.com', 'bang_chan', 'ce10802f61642d9178b46ee5b72b8138', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_name_type`
--

CREATE TABLE `jaks_name_type` (
  `ID` bigint UNSIGNED NOT NULL,
  `NAME_TYPE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_name_type`
--

INSERT INTO `jaks_name_type` (`ID`, `NAME_TYPE`) VALUES
(1, 'MINIVAN'),
(2, 'CROSSOVER'),
(3, 'HATCHBACK'),
(4, 'PICKUP'),
(5, 'SEDAN'),
(6, 'MPV'),
(7, 'SUV'),
(8, 'COUPE');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_seater`
--

CREATE TABLE `jaks_seater` (
  `ID` bigint UNSIGNED NOT NULL,
  `SEATER` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_seater`
--

INSERT INTO `jaks_seater` (`ID`, `SEATER`) VALUES
(1, 2),
(2, 4),
(3, 5),
(4, 7),
(5, 8);

-- --------------------------------------------------------

--
-- Table structure for table `jaks_staff_account`
--

CREATE TABLE `jaks_staff_account` (
  `ID` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_staff_account`
--

INSERT INTO `jaks_staff_account` (`ID`, `name`, `email`, `username`, `password`, `usertype`) VALUES
(1, 'Ali Reyes', 'allelireyesarsua@gmail.com', 'ali_reyes', '1253208465b1efa876f982d8a9e73eef', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_transmission`
--

CREATE TABLE `jaks_transmission` (
  `ID` bigint UNSIGNED NOT NULL,
  `TRANSMISSION` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_transmission`
--

INSERT INTO `jaks_transmission` (`ID`, `TRANSMISSION`) VALUES
(1, 'AUTOMATIC'),
(2, 'MANUAL'),
(3, 'CVT'),
(4, 'AUTOMATIC/CVT'),
(5, 'AUTOMATIC/MANUAL');

-- --------------------------------------------------------

--
-- Table structure for table `jaks_useraccount`
--

CREATE TABLE `jaks_useraccount` (
  `ID` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `verification_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `is_verified` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `home_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mobile_number` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_useraccount`
--

INSERT INTO `jaks_useraccount` (`ID`, `first_name`, `last_name`, `username`, `email`, `password`, `user_type`, `verification_code`, `is_verified`, `home_address`, `mobile_number`) VALUES
(1, 'Kenjie', 'Arceo', 'arzikenzi27', '20200082m.arceo.kenjie.bscs@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'user', NULL, NULL, '21 Marikina Street Maypajo Caloocan City', 9567283342),
(2, 'Sharmaine', 'Layco', 'sha', 'laycosharmaine2@gmail.com', '3bad6af0fa4b8b330d162e19938ee981', 'user', NULL, NULL, 'caloocan', 9553254794),
(3, 'Alleli', 'Arsua', 'alleli_arsua', '20200083m.arsua.alleli.bscs@gmail.com', '6fb42da0e32e07b61c9f0251fe627a9c', 'user', NULL, NULL, 'biglang awa', 9051755811),
(4, 'Kenjie', 'Arceo', 'arzikenzi', 'sj6.karceo22@joysistvi.edu.ph', '25f9e794323b453885f5181f1b624d0b', 'user', NULL, NULL, '21 Marikina Street Maypajo Caloocan City', 9567283342),
(5, 'Aeryhiel', 'Mojica', '20200096m.gutierrez.jalyn.bscs@gmail.com', 'mojica.aeryhieljohn.bscs2022@gmail.com', 'af9bcf57684b69ba1f52439a3bf069fa', 'user', NULL, NULL, 'Caloocan City', 9663811477),
(6, 'Ricardo', 'Salvador IV', 'MrYoso', 'ricksiv0107@gmail.com', '6ebe76c9fb411be97b3b0d48b791a7c9', 'user', NULL, NULL, 'biglang awa', 9567283342),
(7, 'ryujin', 'shin', 'ryujin17', 'tabuzo.leandris.bscs2022@gmail.com', '31c3d7d795cd60aa4e2cbe5d9ed2c1fb', 'user', NULL, NULL, 'biglang awa', 9876543212),
(8, 'Ronnie', 'Red', 'tangolXD', 'red.ronnie.bscs2022@gmail.com', '7d3131af603eea9d3349005517e9626f', 'user', NULL, NULL, 'biglang awa', 9876543212),
(9, 'patricia', 'veronilla', 'patty', 'veronillapatricianicole@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'biglang awa', 9876543212),
(10, 'patricia', 'veronilla', 'patty', 'veronillapatricianicole@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'caloocan city', 9123456789),
(11, 'patrick', 'de Leon', 'patt', 'lancepatrickdeleon2004@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'user', NULL, NULL, 'P.GOMEZ ST', 9123456789),
(12, 'kenjie', 'ar', 'ken', 'cheaprides31@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'user', NULL, NULL, 'biglang awa', 9876543212),
(13, 'sean', 'gonzaga', 'sean', 'gonzaloseanruzzel.bsit@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'user', NULL, NULL, 'biglang awa', 9876543212),
(14, 'Mary Grace', 'Valdeviezo', 'MaryGrace', 'valdeviezomarygrace1108@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'biglang awa', 9876543212),
(15, 'Mary Grace', 'Valdeviezo', 'MaryGrace', 'valdeviezomarygrace1108@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'caloocan city', 9876543212),
(16, 'kenz dave', 'rayos', 'kenz', '20210587.rayos.kenzdave.bscs@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'biglang awa', 9876543212),
(17, 'Maritoni', 'Reyes', 'maritoni', 'reyesmaritoni11@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'caloocan city', 9876543212),
(18, 'Dan Edward ', 'Manuel', 'manuel', 'danedwardm@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'P.GOMEZ ST', 996655623),
(19, 'Roy ', 'Collo', 'cutieroy', 'roylewisc@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'biglang awa', 9876543212),
(20, 'John Kenneth', 'Adriano', 'kenneth', 'jkadriano2002@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'user', NULL, NULL, 'caloocan city', 9164381772),
(21, 'harley dave', 'llnes', 'dave', 'hdllenes@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'biglang awa', 9876543212),
(22, 'dahlia', 'Aspe', 'dbtriz', 'aspedahlia@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'user', NULL, NULL, 'caloocan city', 9123456789),
(23, 'Denzel', 'david', 'eaa', 'daviddenzelmatthew.bsit@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', 'user', NULL, NULL, 'biglang awa', 9876543212),
(24, 'CHRISTOPHER', 'BHANG', 'bang_chan', '20200089m.colmo.paulamae.bscs@gmail.com', 'ce10802f61642d9178b46ee5b72b8138', 'user', NULL, NULL, 'south korea', 9123456789),
(25, 'CHRISTOPHER', 'BHANG', 'bang_chan', '20200089m.colmo.paulamae.bscs@gmail.com', 'ce10802f61642d9178b46ee5b72b8138', 'user', NULL, NULL, 'south korea', 9123456789);

-- --------------------------------------------------------

--
-- Table structure for table `jaks_verify_acc`
--

CREATE TABLE `jaks_verify_acc` (
  `ID` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `verification_code` int NOT NULL,
  `verify_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jaks_verify_acc`
--

INSERT INTO `jaks_verify_acc` (`ID`, `email`, `verification_code`, `verify_status`) VALUES
(1, 'arceokenjie27@gmail.com', 100693, 'Verified'),
(2, '20200082m.arceo.kenjie.bscs@gmail.com', 348182, 'Verified'),
(3, 'arceokenjie27@gmail.com', 211139, 'Verified'),
(4, '20200083m.arsua.alleli.bscs@gmail.com', 282471, 'Verified'),
(5, 'sj6.karceo22@joysistvi.edu.ph', 317431, 'Verified'),
(6, 'mojica.aeryhieljohm.bscs2022@gmail.com', 202539, 'Verified'),
(7, 'mojica.aeryhieljohn.bscs2022@gmail.com', 313899, 'Verified'),
(8, 'ricksiv0107@gmail.com', 346301, 'Verified'),
(9, 'tabuzo.leandris.bscs2022@gmail.com', 778380, 'Verified'),
(10, 'red.ronnie.bscs2022@gmail.com', 167843, 'Verified'),
(11, 'maribethbarros@gmail.com', 323080, 'Verified'),
(12, 'maribethbarros@gmail.com', 158569, 'Verified'),
(13, 'veronillapatricianicole@gmail.com', 422277, 'Verified'),
(14, 'lancepatrickdeleon2004@gmail.com', 132834, 'Verified'),
(15, 'cheaprides31@gmail.com', 982870, 'Verified'),
(16, 'gonzaloseanruzzel.bsit@gmail.com', 111938, 'Verified'),
(17, 'valdeviezomarygrace1108@gmail.com', 206142, 'Verified'),
(18, 'valdeviezomarygrace1108@gmail.com', 250103, 'Verified'),
(19, '20210587.rayos.kenzdave.bscs@gmail.com', 155688, 'Verified'),
(20, 'reyesmaritoni11@gmail.com', 279081, 'Verified'),
(21, 'danedwardm@gmail.com', 164751, 'Verified'),
(22, 'roylewisc@gmail.com', 239781, 'Verified'),
(23, 'jkadriano2002@gmail.com', 124463, 'Verified'),
(24, 'hdllenes@gmail.com', 823994, 'Verified'),
(25, 'aspedahlia@gmail.com', 212871, 'Verified'),
(26, 'daviddenzelmatthew.bsit@gmail.com', 217235, 'Verified'),
(27, '20200089m.colmo.paulamae.bscs@gmail.com', 486880, 'Verified'),
(28, '20200089m.colmo.paulamae.bscs@gmail.com', 100061, 'Verified');

-- --------------------------------------------------------

--
-- Table structure for table `lms_books`
--

CREATE TABLE `lms_books` (
  `Accession` int NOT NULL,
  `rfid_card` varchar(50) DEFAULT NULL,
  `Call_Number` varchar(25) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `Book_Place` varchar(50) DEFAULT NULL,
  `Book_Publisher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Year` varchar(5) DEFAULT NULL,
  `Book_Edition` varchar(25) DEFAULT NULL,
  `Book_ISBN` varchar(50) DEFAULT NULL,
  `Subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Stocks` int NOT NULL,
  `Stocks_Left` int NOT NULL,
  `Book_Image` varchar(50) DEFAULT NULL,
  `Book_Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unrestricted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lms_books`
--

INSERT INTO `lms_books` (`Accession`, `rfid_card`, `Call_Number`, `Title`, `Author`, `Book_Place`, `Book_Publisher`, `Year`, `Book_Edition`, `Book_ISBN`, `Subject`, `Stocks`, `Stocks_Left`, `Book_Image`, `Book_Status`) VALUES
(1, '3251861011', 'HF1ASJWIA12134', 'The Grolier Childrens Encyclopedia', 'kingfisher', 'London', 'Kingfisher', '1998', '3rd', '8776217720292', 'Encyclopedia', 1, 0, '', 'unrestricted'),
(2, '3258813363', 'BF829100HH', 'History Encyclopedia', 'Kingfisher', 'Hong Kong', 'Kingfisher Publlcation', '1999', '2nd', '0753403463', 'History', 1, 1, '', 'unrestricted'),
(3, '3251974019', '98767768111', 'History Encyclopedia', 'Kingfisher', 'Hong Kong', 'Kingfisher Publlcation', '1999', '1st', '0753403463', 'History', 1, 1, '', 'unrestricted'),
(4, '3251159299', '81238981739812', 'Pyramids Were Built', 'Philip Steele', 'London', 'Kingfisher Publlcation', '1995', '', '0753405113', '', 1, 1, '', 'unrestricted'),
(5, '3251032627', 'HF1309283', 'Countries Fly Flags', 'Philip Steele', 'London', 'Kingfisher Publlcation', '1995', '', '0753405040', '', 1, 1, '', 'unrestricted'),
(192, '3258140051', 'HF A123JKSA 0921', 'Introduction to Computing', 'Jessie Alamil', '', 'UCC', '2023', '23', '9872152H922', 'Programming', 1, 1, '', 'unrestricted'),
(1111, NULL, '222', 'how to beat drgon', 'hhehehe', 'hhhh', 'ikaw', '2001', '2222', '2222', 'Gradgon', 1, 0, '', 'unrestricted'),
(5273, NULL, '.LB 2395.3 .V715 2000', 'Developmental Reading', 'Arceli M. Villamin', '', 'Phoenix Publishing House , Inc.', 'c2000', 'na', '9710606557', '  Reading (Higher education) Developmental reading.', 1, 1, '', 'unrestricted'),
(6017, NULL, '.HF 5868 .M2946 2011', '21st Century Partnership and Corporation Accounting ', 'Manuel, Zenaida Vera Cruz', 'Philippines', 'Raintree Trading & Publishing, Inc', 'c2011', '15th', '9789720000000', '-', 1, 1, '', 'unrestricted'),
(6107, NULL, '.HF 5868 .M2946 2013', '21st Century Partnership and Corporation Accounting', 'Zenaida Vera Cruz Manuel', '', 'Raintree Trading and Publishing Co.', 'c2006', '16th', '979000000000', 'Accounting', 1, 0, '', 'unrestricted'),
(6136, NULL, '.HF 5635 .V173 2005', 'Practical Accounting 1', 'Valix, Conrado T.', '', 'GIC Enterprise & Co., Inc', 'c2005', '2005', '9718966528', 'Accounting', 1, 1, '', 'unrestricted'),
(6149, NULL, '.HF 5868 .M2946 2004', '21st Partnership and Corporation Accounting', 'Zenaida Vera Cruz Manuel', 'Philippines', 'na', 'c2004', '11th', 'na', '-', 1, 0, '', 'unrestricted'),
(6179, NULL, '   .HB3649 .C841 1989', 'An Assesment of the PopDev Integration in the Planning process', 'Costello, Michael A. & Raymundo, Corazon.', '', 'na', 'c1989', 'na', '169', '\"Philippines--Population policy. Philippines--Economic policy.\"', 1, 0, '', 'unrestricted'),
(6320, NULL, '   .HC 452 .L237 1993', 'The Economic and Social Order of the Federal Republic of Germany', 'Heinz Lampert', 'GERMANY', 'Department \"International Cooperation\" of konrad Adenauer Foundation', 'c1993', 'na', 'na', 'Economic and Social order--Germany', 1, 1, '', 'unrestricted'),
(6365, NULL, '   .HA 29 .M5111 1993', 'Applied Statistics for Public Administration', 'Meier, Kenneth J. & Brudney, Jeffrey', 'California', 'Wadsworth Inc. ', 'c1993', '3rd', '534195903', 'Public Administration--Statistical Methods.', 1, 1, '', 'unrestricted'),
(6380, NULL, '   .HB 3649 .A2581 1995', 'Philippine Population Projections: 1990-2020', 'Tomas P. Africa', 'Manila', '', 'c1995', 'na', '971562412X', 'Philippine Forecasting -- Population -- Philippines', 1, 1, '', 'unrestricted'),
(6461, NULL, '   .GV 731 .H2419 2009', 'The Sports Rules Book ', 'Hanlon, Thomas', 'United States of America', 'Human Kinetics', 'c2009', '3rd', '9.78E+12', 'Rules, Sports.', 1, 1, '', 'unrestricted'),
(6639, '', '.HD2346 .B9524 2009 ', 'Program and Services', 'NA', NULL, 'Bureau of Micro, Small and Medium Enterprise Development', 'c2009', '2009', 'NA', 'Small business--Philippines.\r\nSmall business--Government policy--Philippines.', 1, 1, NULL, 'unrestricted'),
(6640, NULL, '.AG 5 .W385 1980', 'Webster\'s Beginning Dictionary', 'American Book Company', 'Canada', 'G. & C. Merriam Co.', 'c1980', 'na', '278460062', 'English language -- Dictionaries, Juvenile.', 1, 1, NULL, 'unrestricted'),
(6641, NULL, ' .B491 O885 2005', 'Creating the Good Life', 'O\'Toole, James', 'London', 'Rodale International Ltd', 'c2005', 'na', '1405087862', 'Aristotle.\r\nEthics.\r\nConduct of life.\r\nHappiness.', 1, 1, NULL, 'unrestricted'),
(6642, '', '.BF 121 .A2841 1999', 'Introduction to Psychology with Questions and Answers', 'Aguirre, Felisa U. ', NULL, 'Booklore Publishing Corporation', 'c2000', 'Revised Edition', '87655', 'Psychology', 1, 1, NULL, 'unrestricted'),
(6645, NULL, '.BF 121 .S7827 2002', 'Psychology: Themes and Variations', 'Stalling, Richard B.', 'United States of America', 'Wadsworth Publishing Co. Inc.', 'c2002', '5th', '534593127', 'Psychology--Textbooks.', 1, 1, NULL, 'unrestricted'),
(7010, NULL, '   .HB 3649 .R789 2015', 'Review and Assessment of Programs Offered by State Universities and Colleges', 'Rosario G. Manasan & Danileen Kristel C. Parel', '', 'Philippine Institute for Development Studies', 'c2015', 'na', 'na', 'Review--Assesments', 1, 1, '', 'unrestricted'),
(7011, NULL, '   .GV 53 .B1999 1996', 'Leisure & Human Behavior', 'Gene Bammel & Lei Lane Burrus-Bammel', '', 'Brown & Benchmark Publishers', 'c1996', '3rd', 'na', ' Leisure -- Psychological aspects', 1, 1, '', 'unrestricted'),
(7017, NULL, '   .HB 171.5 .L9131 1990', 'Consumer Education and Economics', 'Lowe, Ross E.', '', 'Glencoe Publishing Company', 'c1990', '3rd', 'na', 'Economics', 1, 1, '', 'unrestricted'),
(7325, '3252314931', '.HB 171.5 .B5168 1998', 'Economics with Carp and Taxation', 'Bermudez, Neil Cathy ', 'Mandaluyong CIty', 'JNPM', 'c1998', '1st', '9718998004', 'Economics--Taxation.', 1, 1, '', 'unrestricted'),
(7338, NULL, '   .HB 171 .A8751 2001', 'Studying Economics', 'Atkinson, Brian & Johns, Susan', 'New York City', 'Palgrave', 'c2001', 'na', '9.78E+12', 'Economics.', 1, 1, '', 'unrestricted'),
(7347, NULL, '.HB 171 .M1412 2012', 'Applied Economics', 'McEachern, Willian A.', 'Philippines', 'Abiva Publishing Inc.', 'c2017', 'na', '9.79E+12', 'Economics.', 1, 1, '', 'unrestricted'),
(7362, NULL, '   .HB 171.5 .B5168 2000', 'Principles of Economics', 'Bermudez, Neil Cathy ', 'Quezon City', 'Grad Printing ', 'c2000', 'Revised Edition', '97198998004', 'Economics.', 1, 1, '', 'unrestricted'),
(7365, NULL, '   .HB 71 .Y681 1994', 'The Portable MBA in Economics', 'Young, Philip KY & McAuley, John J. ', 'Usa', 'John Wiley and Sons Inc.', 'c1994', 'na', '471595268', 'Economics. Business forecasting. Decision making.', 1, 1, '', 'unrestricted'),
(7366, NULL, '   .HC 455 .P139 2004  ', 'Philippine Economics (Micro Approach)', 'Pagoso, Cristobal M. & Ronan, Felilia M. & Bunuan, Edith S.', 'Parañaque City', 'Nelson Publication', 'c2001', 'na', 'na', 'Philippines--Economic conditions.', 1, 1, '', 'unrestricted'),
(7377, NULL, '   .HB 172 .B2163 2015', 'Wealth Watch', 'Bangko Sentral ng Pilipinas', 'Manila', 'Bangko Sentral ng Pilipinas', 'c2015', 'na', '9.79E+12', 'Economics--Financial Planning', 1, 1, '', 'unrestricted'),
(7418, NULL, '.HA29 .K339 1996', 'Introductory Statistics for Management and Economics', 'Kenkel, James L.', '', 'Wadsworth Publishing Company, Inc.', 'c1996', '4th', '534203701', 'Social Sciences--Stattistical methods', 1, 1, '', 'unrestricted'),
(7446, NULL, '.HB 615 .F175 1994', 'Entrepreneurships', 'Fajardo, Feliciano R. ', '-', 'Fajardo, Feliciano R. ', 'c1994', 'na', '9710857126', 'Entrepreneurship--New business enterprises.', 1, 1, '', 'unrestricted'),
(7457, NULL, '   .HC 110 .M4789 1986', 'Environmental Planning and Management', 'Asian Development Bank', '', 'Asian Development Bank', 'c1986', 'na', 'na', 'Congresses--Economic development projects.', 1, 1, '', 'unrestricted'),
(7460, NULL, '   .HB 615 .A561 1988', 'How To Start & Manage Your Own Business : A Manual', 'Andres, Tomas D.', '', 'Our Lady of Manaoa Publishers', 'c1988', 'na', '9719109378', 'Entreprenuer--Handbooks,manuals,etc.', 1, 1, '', 'unrestricted'),
(7461, NULL, '   .HB 615 .B697 2011', 'Introduction to Entrepreneurship', 'Bonanciar III, Salavador A. & Espena, Bernard P.', 'na', '', 'c2011', 'na', 'na', 'Franchises(Retail trade)--Case studies--Business women--Food industry and trade.', 1, 1, '', 'unrestricted'),
(7468, NULL, '   .HB 615 .F175 1994', 'Entrepreneurship copy 3', 'Fajardo, Feliciano R.', '', 'National Book Store', 'c1994', 'na', '9710857126', 'Entrepreneurship--New business enterprises.', 1, 1, '', 'unrestricted'),
(7481, NULL, '   .HB 615 .D6189 2016', 'Entrepreneurship ', 'Diwa Textbooks', '', 'Diwa Learning Systems Inc.', 'c2016', 'na', '9.79E+12', 'Entrepreneurship.', 1, 1, '', 'unrestricted'),
(7539, NULL, '   .HC 444 .O986 1996', 'From Plan To Market', 'Oxford University School', '', 'The International Bank for Reconstruction and Development / The World Bank', 'c1996', 'na', '195211073', 'Economy--Market.', 1, 1, '', 'unrestricted'),
(7602, NULL, '   .HB 3723 .S7699 1971', 'Money & Markets: A Monetarist View', 'Sprinkel, Beryl Wayne', 'Chicago', 'Dow Jones Irwin Inc.', 'c1971', 'na', '[s.n.]', 'Money, Cycle Economiques, Bussiness Cycle', 1, 1, '', 'unrestricted'),
(7607, NULL, '   .HC 415 .A8324 1994', 'Financing Environmental Sound Development', 'Asia Development Bank', 'Manila', 'Asian Development Bank', 'c1994', 'na', '9715610501', '        Sustainable development --Financing-- Asia -- Congresses.', 1, 1, '', 'unrestricted'),
(7613, NULL, '   .HC 415 .N27728', 'Making Financing Projects Work for Women', 'National Commision', 'Manila', 'National Commision', 'c2001', 'na', '[s.n]', 'Sustainable--Financing--Development', 1, 1, '', 'unrestricted'),
(7629, NULL, '.HF 5868 .M2946 2013', '21st Century Partnership and Corporation Accounting ', 'Manuel, Zenaida Vera Cruz', 'Quezon City', 'Raintree Trading and Publishing Co.', 'c2013', '16th', '978719000000', '-', 1, 0, '', 'unrestricted'),
(7630, NULL, '.HF 5686 .Z884 2011', 'Mathematics of Investment', 'Zorilla, Roland S. & Partible, Fe G. & Esller, Beda H.', 'Malabon City', 'Mutya Publishing House', 'c2011', 'na', '9789720000000', 'Accounting--Logarithms--Investment.', 1, 1, '', 'unrestricted'),
(7631, NULL, '.HG 4026 .H299 1993', 'Corporate Financial Analysis', 'Harrington, Diana R.', 'Boston', 'Irwin', 'c1993', '4th', '256083029', 'Corporations--Finance.', 1, 1, '', 'unrestricted'),
(7632, NULL, '.PE 1408 .M9765 2013', 'Studying & Thinking Skills in English', 'Constancia M. Mazon & Bernadette B. Enriquez', 'Valenzuela City', 'Mutya Publishing House, Inc.', 'c2013', '3rd', '9789720000000', '-', 1, 1, '', 'unrestricted'),
(7633, NULL, 'FIC .S7412 1986', 'The Witch of Blackbird Pond', 'Speare, Elizabeth George', 'USA', 'Yearling', 'c1986', 'NA', '440495962', '-', 1, 1, '', 'unrestricted'),
(7634, NULL, '.HV 8074 .G6431 2008 c.2', 'Forensic Questioned Documents Examination', 'Jonas Arabejo Gonzales', 'Quezon City', 'Wiseman\'s Books Trading, Inc.', 'c2008', 'na', '971045056', NULL, 1, 1, NULL, 'unrestricted'),
(7635, NULL, '.P 90 .R1731 1990', 'Communication From The Ground Up', 'Ramirez, Mina M.', 'Manila', 'Asian Social Institute', 'c1990', 'NA', '9718543139', 'Communication -- Philippines. Communicatoin planning -- Philippines -- Citizen participation.', 1, 1, '', 'unrestricted'),
(7636, NULL, '.RJ 504 .S9123 1999', 'No-Talk Therapy for Children and Adolescents', 'Straus, Martha', 'New York', 'W.W. Norton & Company', 'c1999', 'NA', '393702863', ' Play therapy -- Child psychotherapy -- Adolescent psychotherapy', 1, 1, '', 'unrestricted'),
(7637, NULL, '.HD 58.87 .H2885 1996', 'Reinventing The Business', 'Harmon, Roy', 'New York', 'The Free Press', 'c1996', 'NA', '684823012', 'Reengineering (Management). Organizational change > Management.', 1, 1, '', 'unrestricted'),
(7638, NULL, '.HG  1262  .R773 1999', 'Money, Credit and Banking in the Philippine Financial System', 'Ronquillo, Zacarias M.', '', 'Katha Publising Co., Inc. ', 'c1999', 'Revised', '9715740251', ' Money -- Philippines. Money -- History. -- Philippines.', 1, 1, '', 'unrestricted'),
(7639, NULL, '.HF 5635 .H471 1999', 'College Accounting', 'Heints, James A. & Parry, Robert W.', '', 'South Western Publishing Co.', 'c1999', '16th Edition', '538876689', 'Accounting', 1, 1, '', 'unrestricted'),
(7642, NULL, '.BF 121 .A2841 1999', 'Introduction to Psychology', 'Aguirre, Felisa U. ', '', 'Mutya Publishing House', 'c2011', '2011', '9789720000000', '', 1, 1, '', 'unrestricted'),
(7644, NULL, '.BF 121 .F3123 2008', 'Understanding Psychology', 'Feld, Robert', NULL, 'McGraw Hill', 'c2008', '8th', '6183355', 'Psychology', 1, 1, NULL, 'unrestricted'),
(7646, '', '.BF 149 .P9653 1969', 'Panorama of Psychology', 'Pronko, N.H', NULL, 'Wadsworth', 'c1969', 'na', '53346', 'Psychology', 1, 1, NULL, 'unrestricted'),
(7647, '3252220307', '.BF 318 .A7381998', 'Awakening Genius in the Classroom', 'Armstrong, Thomas', 'United States of America', 'ASCD Publication', 'c1998', 'na', '871203022', 'Learning, Psychology.Motivation in Education', 1, 0, NULL, 'unrestricted'),
(7648, NULL, '   .BF 323 .W4231 1988', 'The Projection Principle', 'Weinberg, George & Rowe, Dianne', NULL, 'na', 'c1988', '1st', '031200057X', 'Self-realization--Projection(pschology)--Social perception--Interpersonal relations.', 1, 1, NULL, 'unrestricted'),
(7649, NULL, '.BF 56 .S2111 1997', 'Psychology: Applied to Business and Industry', 'Sanchez, Custodiosa A. & Berin, Elvi S.', 'Mandaluyong City', 'National Book Store', 'c1997', '3rd', '9710859366', ' Psychology, Industrial.', 1, 1, NULL, 'unrestricted'),
(7650, NULL, '.BF 575 .A2111 1980 ', 'Understanding and Managing Stress', 'Adams, John D.', 'Adams, John D.', 'International Authors', 'c1980', 'na', '883901587', 'Stress (Psychology)--Prevention.', 1, 1, NULL, 'unrestricted'),
(7651, NULL, '   .BF 58 .M1313 1980', 'Industrial Psychology', 'McCormick, Ernest J. ', NULL, 'Prentice-Hall', 'c1980', '7th', '2567', 'Psychology, Industrial.', 1, 1, NULL, 'unrestricted'),
(7652, NULL, '   .BF 637 .C5921 1958', 'Brainstorming', 'Clark, Charles', 'United of States America', 'Wilshire Book Co.', 'c1958', 'NA', '9780880000000', 'Brainstorming.\r\nSuccess.', 5, 3, NULL, 'unrestricted'),
(7653, NULL, '   .BF 637 .C8736 1989', 'The 7 Habits of Highly Effective People ', 'Covey, Stephen R.', 'New York City', 'Simon and Schuster', 'c1989', 'NA', '671663984', NULL, 1, 1, NULL, 'unrestricted'),
(7654, NULL, '   .BF 637 .E282 1986', 'The Skilled Helper : A Systematic Approach to Effective Helping', 'Egan, Gerard', 'California', 'Brooks/Cole Publishing Company ', '2015', '3rd', '053405904X', 'Helping Behavior.', 1, 1, NULL, 'unrestricted'),
(7655, NULL, '   .BF 637 .P379 1978', 'Counseling: Theory, Research and Practice', 'Peitrofesa, John & Hoffman, Alan', 'Usa', 'Rand McNally College Publishing Company', '2011', 'NA', '528612514', 'Counseling.', 1, 1, NULL, 'unrestricted'),
(7656, NULL, '   .BF 637 .T5841 1993', 'Successful Self-Management', 'Timm, Paul', 'California', 'Crisp Publications, Inc.', '2013', 'Revised', '1560522429', 'Self Management, Psychology', 1, 1, NULL, 'unrestricted'),
(7657, NULL, '   .BF 698.35 .B8121 1990', 'Homecoming', 'Bradshaw, John', 'Manila', 'Bantam Bardcover', '2005', 'NA', '553353896', 'Social Science ', 1, 1, NULL, 'unrestricted'),
(7658, NULL, '   .BF 713 .M6471 1987', 'Developmental Research Methods', 'Miller, Scott A. ', NULL, 'Prentice-Hall', '2003', 'NA', '322', 'Human Behavior. Human Beings, Psychology, Sociology.', 1, 1, NULL, 'unrestricted'),
(7659, NULL, '   .BF 723 .H783 1998', 'I Am Already Successful ', 'Hooker, Dennis', 'United States of America', 'JIST Works, Inc.', '2008', 'NA', '1563704250', 'Juvenile, Literature, Problems, Exercises, Self Esteem', 1, 1, NULL, 'unrestricted'),
(7660, NULL, '   .BF 723.C5 .F588 1993', 'Cognitive Development', 'Flavell, John & Miller, Tricia & Miller, Scott', NULL, 'Prentice Hall', '2003', '3rd', '408', 'Child Development -- Cognition', 1, 1, NULL, 'unrestricted'),
(7661, NULL, '   .BF 724.8 .H564 1979 ', 'Counseling Elders and their Families', 'Herr, John & Weakland, John', 'New York', 'Springer Publishing Company', '2009', 'NA', '826125107', 'Older people--Psychology.\r\nOlder people--Family relationships.\r\nCounseling.\r\nGerontology.', 1, 1, NULL, 'unrestricted'),
(7662, NULL, '   .BF371 .L829 1980', 'Memory', 'Loftus, Elizabeth', 'London', 'Addison Wesley Publishin Company', '2010', 'NA', '201044749', 'memory, psychology', 1, 1, NULL, 'unrestricted'),
(7663, NULL, '   .BF637 .T4541 1979', 'Psycho Feedback', 'Thomas, Paul G.', 'Cebu', 'Prentice Hall', '2004', 'NA', '137322631', 'Success.\r\nFeedback (Psychology)', 1, 1, NULL, 'unrestricted'),
(7664, NULL, '   .BJ 1012 .M1191 2010', 'Live Ethically\r\n', 'MacBride, Peter\r\n', 'United States of America', 'McGrawhill\r\n', '2010', 'NA', '978007000', 'Ethics.', 1, 1, NULL, 'unrestricted'),
(7665, '', '   .BJ 1251 .D9968 2004', 'Ten Requirements for America\'s Survival\r\n', 'Dykes, David\r\n', 'United States of America', 'Xulon Press\r\n', 'c2004', 'NA', '1594677905', 'Christian Ethics-- Ten Commandments\r\n', 1, 1, NULL, 'unrestricted'),
(7666, NULL, '   .BV 4447 .L8971 2013', 'Love Them and Lead Them\r\n', 'Jerome Love\r\n', 'United States of America', 'Gugogs Leadership Institute\r\n', 'c2013', 'NA', '978099000', 'Missions--Church work with youth.\r\n', 1, 1, NULL, 'unrestricted'),
(7667, NULL, '   .BV 4655 .L426 2005', 'Happiness', 'Layard, Richard\r\n', NULL, 'The Penguin Press\r\n', 'c2005', 'NA', '310', 'Theology\r\n', 1, 1, NULL, 'unrestricted'),
(7668, NULL, '   .BX 930 .H6157 1969', 'Discovery Patterns 2 \r\n', 'Heyer, Robert J. & Payne, Richard\r\n', 'New York', 'Paulist Press\r\n', 'c1969', 'NA', '191', 'Textbooks--Catholic--Christian education.\r\n', 1, 1, NULL, 'unrestricted'),
(7669, '3252056531', '   .CB161 .D179 2009', '2012: Extinction or Utopia\r\n', 'Danelek, Allan\r\n', 'United States of America', 'Llwellyn Publication\r\n', 'c2009', 'NA', '9780740000', 'history of civilization, utopians\r\n', 1, 1, NULL, 'unrestricted'),
(7670, '3258548835', '   .D 21 .W738 2006', 'Let\'s Review: Global History and Geography\r\n', 'Willner, Mark & Martin, Mary & Hero, George\r\n', 'New York', 'Barrons Educational Series Inc.\r\n', 'c2006', '4th', '97807600000', 'World history.\r\n', 1, 1, NULL, 'unrestricted'),
(7671, NULL, '   .D 5686.6 .L 183 1985', 'Doy Laurel in Profile\r\n', 'Joaqui, Nick\r\n', 'Philippines', 'Lahi, Inc\r\n', 'c1985', '2nd', 'NA', 'Politicians -- Philippines\r\n', 1, 1, NULL, 'unrestricted'),
(7672, NULL, '   .DS 656 .A561 1987', 'Understanding Filipino Values on Sex\r\n', 'Andres, Tomas D. \r\n', 'Philippines', 'Our Lady of Manaog Publishers\r\n', 'c1987', 'NA', '112', 'Natinal Characteristics, Philippines.\r\n', 1, 1, NULL, 'unrestricted'),
(7673, NULL, '   .DS 668 .G9347 1975', 'Why Martial Law? : A Historical Approach to Martial Law in the Philippines\r\n', 'Guerrero, Leon Maria\r\n', 'USA', 'Today Began Yeterday\r\n', 'c1975', 'NA', 'NA', 'Philippine--History. Martial law.\r\n', 1, 1, NULL, 'unrestricted'),
(7674, NULL, '   .DS 675.8 .C1964 2003', 'Ang Buhay at Katha ni Dr. Jose Protacio Rizal Mercado Y. Alonzo Realonda\r\n', 'Campos, Lourdes & Jocson, Magdalena\r\n', 'Philippines', 'Karapatang Ari\r\n', 'c2003', 'NA', 'NA', 'Rizal - Life\r\n', 1, 1, NULL, 'unrestricted'),
(7675, NULL, '   .DS 675.8 .G9347 1977', 'The Second Annual Rizal Lectures\r\n', 'Leon Ma. Guerrero\r\n', 'Philippines', 'NA', 'c1977', 'NA', 'NA', 'Rizal -- History\r\n', 1, 1, NULL, 'unrestricted'),
(7676, NULL, '   .DS 675.8 .L2968 1962', 'Rizal in Japan\r\n', 'Lanuza, Caesar & Zaide, Gregorio\r\n', NULL, 'Jose Rizal National Centennial Commision\r\n', 'c2000', 'NA', 'NA', NULL, 1, 1, NULL, 'unrestricted'),
(7677, NULL, '   .DS 675.8 .O669 1959', 'The Tragic Farce\r\n', 'Orendain, J. C\r\n', NULL, 'International Contact Services\r\n', 'c1959', 'NA', 'NA', 'Rizal--life\r\n', 1, 1, NULL, 'unrestricted'),
(7687, NULL, '   .DS 675.8 .R941 1962', 'The Forgery of the Rizal \"Retraction\" and Josephine\'s \"Autobiography\"\r\n', 'Runes, Ildefonso & Buenafe, Mamerto\r\n', NULL, 'BR Book Company\r\n', 'c1992', 'NA', 'NA', 'Rizal -- History\r\n', 1, 1, NULL, 'unrestricted'),
(7694, NULL, '   .G 115 .L4335 1988 ', 'Tourism and Development in the Third World \r\n', 'John Lea\r\n', 'United Kingdom', 'ROUTLEDGE\r\n', 'c1988', 'NA', '9780420000', 'Tourist Trade -- Developing Countries ', 1, 1, NULL, 'unrestricted'),
(7695, NULL, '   .GE 105 .A7 1996', 'Environmental Science\r\n', 'Karen Arms\r\n', 'Orlando', 'Holt, Rinehart and Winston\r\n', 'c1996', 'NA', '30031338', 'Environmental Sciences\r\n', 1, 1, NULL, 'unrestricted'),
(7696, NULL, '   .GE 300 .D2382 1996', 'Industrial Environmental Management\r\n', 'Jack E. Daugherty\r\n', 'United States of America', 'Government Institutes, Inc.\r\n', 'c1996', 'NA', '865875154', 'Environmental Management\r\n', 1, 1, NULL, 'unrestricted'),
(7697, NULL, '   .GF 105 .M6471 2005', 'Environmental Science\r\n', 'Miller, Tyler G.\r\n', 'Singapore', 'Thomson Brooks\r\n', 'c2005', 'NA', '9812549684', 'Environmental -- Textbooks\r\n', 1, 1, NULL, 'unrestricted'),
(7698, NULL, '   .GN 502 .S5581 2010', 'Cross-Culture Psychology\r\n', 'Shiraev, Eric & Levy David\r\n', NULL, 'Allyn & Bacon, Inc.\r\n', 'c2010', '4th', 'NA', 'Ethnopology--Psychology\r\n', 1, 1, NULL, 'unrestricted'),
(7699, NULL, '   .GT 3405 .M4788 2010', 'Event Management: An Asian Perspective\r\n', 'McCartney, Glenn\r\n', 'New York', 'McGraw-Hill Companies, Inc.\r\n', 'c2010', '2010', '7107891', 'Special events--Management.\r\n', 1, 1, NULL, 'unrestricted'),
(7700, NULL, '   .GT 3405 .S55932 2011', 'Successful Event Management\r\n', 'Shone, Anton & Bryn Parry\r\n', 'Pasig City', 'Cegage Learning Asia Pte. Ltd.\r\n', 'c2011', 'NA', '978981000', 'Special events--Management.\r\n', 1, 1, NULL, 'unrestricted'),
(7701, NULL, '   .GV 1751 .T 1133 1993', 'Philippine Dances\r\n', 'Andin, Carmen T.\r\n', 'Quezon City', 'Rex Book Store\r\n', 'c1994', 'NA', '9712313700', 'Folk Dancing .Folk Dance Music .Folk Dancing, Philippines.\r\n', 1, 1, NULL, 'unrestricted'),
(7702, NULL, '   .GV 341 .D 2998 2005', 'Physical Education 2: Rhythm and Dance Modules\r\n', 'De Dios, Concordia & Indon, Virginia J. & Omampo, Zenaida E.\r\n', 'Manila', 'FEU Publications\r\n', 'c2005', 'NA', '9716780141', 'Dance. Physical Education and Training -- Textbooks\r\n', 1, 1, NULL, 'unrestricted'),
(7858, NULL, '   .HB 615 .C1178 2010', 'Management Entrepreneurship Policy and Strategy', 'Cabreros, Gerardo C.', 'Manila', 'Merryjo Enterprises', 'c2010', 'na', '9.79E+12', 'Entrepreneurship Management', 1, 1, '', 'unrestricted'),
(7938, NULL, '   .HC 106.5 .D2491 2002', 'Inside Iraq', 'Rose, David ', 'New York', 'Marlowe and Company', 'c2002', 'na', '1569244804', 'na', 1, 1, '', 'unrestricted'),
(7975, NULL, '   .HC 110 .R6912 1979', 'Poverty amid Plenty', 'Rodgers, Harrell', 'Philippines', 'Addison Wesley Publishin Company Inc.', 'c1979', 'na', '201064715', 'na', 1, 1, '', 'unrestricted'),
(7995, NULL, '   .GV 342 .M377 1975', 'Social Psychology and Physical Activity', 'Martens, Rainer ', 'New York', 'Harper and Rows Publisher', 'c1975', 'na', '006044231X', 'Physical Education and training--Psychological aspects. Sports--Social aspects.', 1, 1, '', 'unrestricted'),
(276736736, NULL, '73873872', 'english math', 'hdjshdjs', 'hdiahe', 'iwhdhidw', '20020', 'shdwjhd', 'dhwhdw', 'ddd', 1, 1, '', 'unrestricted');

-- --------------------------------------------------------

--
-- Table structure for table `lms_login`
--

CREATE TABLE `lms_login` (
  `StudentNo` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lms_login`
--

INSERT INTO `lms_login` (`StudentNo`, `Password`, `Type`, `Token`, `Status`) VALUES
('20190273-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20190331-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20200085-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20200087-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20200094-M', 'c8a50f632c3c4baf27fc05facb1883104e1d16ef', 'Student', NULL, NULL),
('20200104-M', '4d9936f16aad50c361705eb5f56741b655b27576', 'Student', NULL, NULL),
('20200105-M', 'a00bb6a32917676ae860ab423dfeab8749f2ec62', 'Student', NULL, NULL),
('20200248-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20200261-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20210053-M', '3ba3974e96044dcde818e6310ed799abe10671d4', 'Student', NULL, NULL),
('20210112-M', '82930bdf95f9cdae2c4e8fe141623203353c7cb6', 'Student', NULL, NULL),
('20210174-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20210196-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20210223-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20210228-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20210233-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20210493-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20211448-M', '99996b911567c83cce17cdf194f314975c57ddf1', 'Student', NULL, NULL),
('20220058-M', '82930bdf95f9cdae2c4e8fe141623203353c7cb6', 'Student', NULL, NULL),
('20220118-M', 'add0dde499a700d3a94b371f824557c234bcaf3a', 'Student', NULL, NULL),
('20220128-M', '7cf689dce05c06ce2be02b98ea885d689191be7b', 'Student', NULL, NULL),
('20220133-M', 'cc9db3a795571c7e71f45670a1da7ff49b5f1557', 'Student', NULL, NULL),
('2022020243', '55f63a97aee05dec574284677eb868c83b3fba7c', 'Student', NULL, NULL),
('20220302-M', 'a51dda7c7ff50b61eaea0444371f4a6a9301e501', 'Student', NULL, NULL),
('20220344-M', '905793fef578f1ea3b5f940aa24bbb1258062a61', 'Student', NULL, NULL),
('20220393-M', 'cbb7353e6d953ef360baf960c122346276c6e320', 'Student', NULL, NULL),
('20220644-M', 'f1b5a91d4d6ad523f2610114591c007e75d15084', 'Student', NULL, NULL),
('20220763-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('20220796-M', '214ebdd75301fdc12fc18b57d8ebc0a6c3279f92', 'Student', NULL, NULL),
('20221077-M', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'Student', NULL, NULL),
('admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lms_message`
--

CREATE TABLE `lms_message` (
  `message_id` int NOT NULL,
  `StudentNo` varchar(255) DEFAULT NULL,
  `Message` varchar(255) NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Status` varchar(50) NOT NULL DEFAULT 'unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lms_message`
--

INSERT INTO `lms_message` (`message_id`, `StudentNo`, `Message`, `Date`, `Time`, `Status`) VALUES
(1, '20200085-M', 'Your borrow request of Book: Introduction to Computing has been approved', '2023-05-21', '19:14:17', 'read'),
(2, '20200085-M', 'You successfuly returned the Book: Introduction to Computing.', '2023-05-21', '19:14:50', 'read'),
(4, '20200104-M', 'Pssttt ganda moooo!!!', '2023-05-22', '13:21:48', 'read'),
(5, '20200085-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-22', '19:25:36', 'read'),
(6, '20200104-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-22', '22:14:43', 'read'),
(7, '20200085-M', 'hi', '2023-05-22', '23:13:54', 'read'),
(8, '20200085-M', 'hello', '2023-05-22', '23:16:54', 'read'),
(9, '20200085-M', 'hello', '2023-05-22', '23:43:48', 'read'),
(10, '20200085-M', 'hiii', '2023-05-23', '01:13:30', 'read'),
(11, '20200104-M', 'Your borrow request of Book: Economics with Carp and Taxation has been approved', '2023-05-24', '12:36:03', 'read'),
(12, '20200094-M', 'Your borrow request of Book: Awakening Genius in the Classroom has been approved', '2023-05-24', '15:26:24', 'unread'),
(13, '20200094-M', 'You successfuly returned the Book: Awakening Genius in the Classroom.', '2023-05-24', '15:29:47', 'unread'),
(14, '20220344-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '09:10:56', 'read'),
(15, '20220344-M', 'Your borrow request of Book: Understanding and Managing Stress has been approved', '2023-05-26', '09:13:57', 'read'),
(16, '20220344-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '09:17:34', 'read'),
(17, '20220344-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '09:18:00', 'read'),
(18, '20220344-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '09:19:27', 'read'),
(19, '20200104-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '09:19:43', 'read'),
(20, '20200085-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '09:19:46', 'unread'),
(21, '20200104-M', 'You successfuly returned the Book: Economics with Carp and Taxation.', '2023-05-26', '09:19:48', 'read'),
(22, '20220344-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '09:19:49', 'read'),
(23, '20220344-M', 'You successfuly returned the Book: Understanding and Managing Stress.', '2023-05-26', '09:19:51', 'read'),
(24, '20220344-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '09:19:55', 'read'),
(25, '20220133-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '09:28:43', 'read'),
(26, '20220133-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '09:30:20', 'read'),
(27, '20220133-M', 'Your borrow request of book Applied Economics has been rejected', '2023-05-26', '09:35:16', 'unread'),
(28, '20200104-M', 'Your borrow request of book Applied Economics has been rejected', '2023-05-26', '09:35:22', 'read'),
(29, '20220796-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '09:36:29', 'read'),
(30, '20220796-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '09:37:25', 'read'),
(31, '20220796-M', 'Your borrow request of Book: Financing Environmental Sound Development has been approved', '2023-05-26', '09:40:51', 'unread'),
(32, '20220128-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '09:41:33', 'read'),
(33, '20220128-M', 'Your request of extension for Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '09:42:12', 'read'),
(34, '20220128-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '09:44:09', 'read'),
(35, '20220796-M', 'You successfuly returned the Book: Financing Environmental Sound Development.', '2023-05-26', '09:44:15', 'unread'),
(36, '20220058-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '09:50:04', 'read'),
(37, '20220058-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '09:50:29', 'read'),
(38, '2022020243', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '09:58:31', 'read'),
(39, '2022020243', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '10:00:30', 'read'),
(40, '20220302-m', 'Your book suggestion Title: something has been approved', '2023-05-26', '10:13:50', 'read'),
(41, '20220302-m', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '10:16:17', 'read'),
(42, '20220302-m', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '10:18:41', 'read'),
(43, '20220393-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '10:23:37', 'read'),
(44, '20220393-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '10:25:28', 'read'),
(45, '20220302-m', 'Your borrow request of book 2012: Extinction or Utopia has been rejected', '2023-05-26', '10:28:55', 'unread'),
(46, '20200085-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '10:29:14', 'unread'),
(47, '20200085-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '10:30:34', 'unread'),
(48, '20200085-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '10:34:03', 'unread'),
(49, '20200085-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '10:34:58', 'unread'),
(50, '20200085-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '10:36:24', 'unread'),
(51, '20200085-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '10:36:30', 'unread'),
(52, '20200087-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '10:37:02', 'read'),
(53, '20200087-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '10:37:18', 'read'),
(54, '20210053-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '10:47:43', 'read'),
(55, '20210053-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '10:49:25', 'read'),
(56, '20210053-M', 'Your book suggestion Title: coding  has been approved', '2023-05-26', '10:51:59', 'read'),
(57, '20210053-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '11:00:24', 'unread'),
(58, '20210053-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '11:00:34', 'unread'),
(59, '20211448-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '11:01:28', 'read'),
(60, '20211448-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '11:03:32', 'read'),
(61, '20200085-M', 'hello, iloveyou', '2023-05-26', '11:13:47', 'unread'),
(62, '20210228-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '11:20:28', 'read'),
(63, '20210228-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '11:21:50', 'read'),
(64, '20210228-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '11:23:13', 'read'),
(65, '20210228-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '11:24:13', 'read'),
(66, '20210228-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '11:24:17', 'read'),
(67, '20210228-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '11:24:21', 'read'),
(68, '20210228-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '11:24:26', 'read'),
(69, '20210228-M', 'Your borrow request of Book: 21st Partnership and Corporation Accounting has been approved', '2023-05-26', '11:24:30', 'read'),
(70, '20210228-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '11:25:08', 'read'),
(71, '20210228-M', 'Your book suggestion Title: java has been approved', '2023-05-26', '11:26:17', 'read'),
(72, '20210228-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '11:27:28', 'read'),
(73, '20210228-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '11:27:56', 'read'),
(74, '20210228-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '11:27:57', 'read'),
(75, '20210223-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '11:49:15', 'read'),
(76, '20210223-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '11:50:38', 'read'),
(77, '20210223-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '11:51:52', 'read'),
(78, '20210223-M', 'Hii', '2023-05-26', '11:54:28', 'read'),
(79, '20220118-M', 'Your borrow request of Book: Ang Buhay at Katha ni Dr. Jose Protacio Rizal Mercado Y. Alonzo Realonda has been approved', '2023-05-26', '12:36:11', 'read'),
(80, '20220118-M', 'Your request of extension for Book: Ang Buhay at Katha ni Dr. Jose Protacio Rizal Mercado Y. Alonzo Realonda has been approved', '2023-05-26', '12:37:02', 'read'),
(81, '20220118-M', 'Your book suggestion Title: Hello has been approved', '2023-05-26', '12:38:19', 'read'),
(82, '20220118-M', 'You successfuly returned the Book: Ang Buhay at Katha ni Dr. Jose Protacio Rizal Mercado Y. Alonzo Realonda.', '2023-05-26', '12:40:30', 'read'),
(83, '20210112-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '13:00:05', 'read'),
(84, '20210112-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '13:01:33', 'read'),
(85, '20210112-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '13:02:44', 'read'),
(86, '20210112-M', 'Your book suggestion Title: utopia has been approved', '2023-05-26', '13:04:00', 'read'),
(87, '20210112-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '13:10:01', 'unread'),
(88, '20220128-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '13:29:01', 'read'),
(89, '20210228-M', 'Your borrow request of Book: An Assesment of the PopDev Integration in the Planning process has been approved', '2023-05-26', '13:32:05', 'unread'),
(90, '20210233-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '13:37:12', 'unread'),
(91, '20210233-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '13:39:20', 'unread'),
(92, '20210233-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '13:39:59', 'unread'),
(93, '20210228-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '13:43:44', 'unread'),
(94, '20210228-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '13:44:08', 'unread'),
(95, '20210228-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '13:44:32', 'unread'),
(96, '20210228-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '13:45:50', 'unread'),
(97, '20210228-M', 'You successfuly returned the Book: 21st Partnership and Corporation Accounting.', '2023-05-26', '13:46:09', 'unread'),
(98, '20210228-M', 'You successfuly returned the Book: An Assesment of the PopDev Integration in the Planning process.', '2023-05-26', '13:46:37', 'unread'),
(99, '20220128-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '13:46:44', 'unread'),
(100, '20210233-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '13:46:53', 'unread'),
(101, '20210493-m', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '13:57:53', 'read'),
(102, '20210493-M', 'late books', '2023-05-26', '13:59:21', 'read'),
(103, '20210493-m', 'Your request of extension for Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:00:35', 'read'),
(104, '20210493-m', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '14:02:09', 'read'),
(105, '20210493-m', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:07:12', 'read'),
(106, '20210493-m', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '14:09:24', 'read'),
(107, '20200104-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:18:32', 'read'),
(108, '20200104-M', 'Your request of extension for Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:19:34', 'read'),
(109, '20200104-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '14:21:39', 'read'),
(110, '20200104-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:22:42', 'unread'),
(111, '20200261-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '14:27:47', 'read'),
(112, '20200261-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '14:29:03', 'read'),
(113, '20200261-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '14:29:03', 'read'),
(114, '20200261-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '14:29:03', 'read'),
(115, '20200261-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '14:30:05', 'read'),
(116, '20200104-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '14:39:26', 'unread'),
(117, '20200261-M', 'Your borrow request of book 2012: Extinction or Utopia has been rejected', '2023-05-26', '14:39:46', 'unread'),
(118, '20200248-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:39:53', 'read'),
(119, '20200248-M', 'Your request of extension for Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:40:33', 'read'),
(120, '20200248-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '14:41:39', 'read'),
(121, '20221077-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '14:53:44', 'read'),
(122, '20221077-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '14:55:51', 'read'),
(123, '20190331-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '15:03:00', 'read'),
(124, '20190331-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '15:03:05', 'read'),
(125, '20190331-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '15:03:11', 'read'),
(126, '20190331-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '15:03:11', 'read'),
(127, '20190331-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '15:03:17', 'read'),
(128, '20190331-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '15:05:18', 'read'),
(129, '20210174-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '15:23:01', 'read'),
(130, '20190331-M', 'Your borrow request of book 21st Partnership and Corporation Accounting has been rejected', '2023-05-26', '15:23:06', 'unread'),
(131, '20190331-M', 'Your borrow request of book An Assesment of the PopDev Integration in the Planning process has been rejected', '2023-05-26', '15:23:10', 'unread'),
(132, '20190331-M', 'Your borrow request of book An Assesment of the PopDev Integration in the Planning process has been rejected', '2023-05-26', '15:23:10', 'unread'),
(133, '20210174-M', 'Late Books', '2023-05-26', '15:24:26', 'read'),
(134, '20210174-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '15:26:29', 'read'),
(135, '20190331-M', 'Your borrow request of Book: Ang Buhay at Katha ni Dr. Jose Protacio Rizal Mercado Y. Alonzo Realonda has been approved', '2023-05-26', '15:38:35', 'unread'),
(136, '20190273-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '15:39:56', 'read'),
(137, '20190273-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '15:41:35', 'unread'),
(138, '20220763-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '16:13:41', 'read'),
(139, '20220763-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '16:15:38', 'read'),
(140, '20220763-M', 'Your book suggestion Title: Minecraft books has been approved', '2023-05-26', '16:17:37', 'read'),
(141, '20190331-M', 'You successfuly returned the Book: Ang Buhay at Katha ni Dr. Jose Protacio Rizal Mercado Y. Alonzo Realonda.', '2023-05-26', '16:22:00', 'unread'),
(142, '20190331-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '16:22:04', 'unread'),
(143, '20190331-M', 'You successfuly returned the Book: 21st Century Partnership and Corporation Accounting.', '2023-05-26', '16:22:09', 'unread'),
(144, '20190273-M', 'kkk', '2023-05-26', '16:23:31', 'unread'),
(145, '20220763-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '16:24:14', 'unread'),
(146, '20220763-M', 'You successfuly returned the Book: The Grolier Childrens Encyclopedia.', '2023-05-26', '16:25:15', 'unread'),
(147, '20220763-M', 'Your borrow request of Book: how to beat drgon has been approved', '2023-05-26', '16:47:50', 'unread'),
(148, '20210196-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '16:49:11', 'read'),
(149, '20210196-M', 'Your borrow request of Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '16:50:09', 'read'),
(150, '20210196-M', 'Your borrow request of Book: 21st Partnership and Corporation Accounting has been approved', '2023-05-26', '16:50:12', 'read'),
(151, '20210196-M', 'Your borrow request of Book: Awakening Genius in the Classroom has been approved', '2023-05-26', '16:50:16', 'read'),
(152, '20210196-M', 'Your borrow request of Book: An Assesment of the PopDev Integration in the Planning process has been approved', '2023-05-26', '16:50:18', 'read'),
(153, '20210196-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '16:52:08', 'read'),
(154, '20210196-M', 'Your borrow request of Book: The Grolier Childrens Encyclopedia has been approved', '2023-05-26', '16:52:49', 'read'),
(155, '20210196-M', 'Your request of extension for Book: 21st Century Partnership and Corporation Accounting has been approved', '2023-05-26', '16:53:23', 'read'),
(156, '20200085-M', 'Your book suggestion Title: PHP has been approved', '2023-05-26', '16:55:55', 'unread'),
(157, '20200087-M', 'Your borrow request of Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '17:32:19', 'read'),
(158, '20200087-M', 'Your request of extension for Book: 2012: Extinction or Utopia has been approved', '2023-05-26', '17:33:20', 'read'),
(159, '20200087-M', 'You successfuly returned the Book: 2012: Extinction or Utopia.', '2023-05-26', '17:35:49', 'read');

-- --------------------------------------------------------

--
-- Table structure for table `lms_records`
--

CREATE TABLE `lms_records` (
  `R_ID` int NOT NULL,
  `StudentNo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Accession` int DEFAULT NULL,
  `Date_of_Issue` date DEFAULT NULL,
  `Due_Date` date DEFAULT NULL,
  `Date_User_Return` date DEFAULT NULL,
  `late_by_day` int DEFAULT NULL,
  `Extend_Left` int DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lms_records`
--

INSERT INTO `lms_records` (`R_ID`, `StudentNo`, `Accession`, `Date_of_Issue`, `Due_Date`, `Date_User_Return`, `late_by_day`, `Extend_Left`, `Time`, `Status`) VALUES
(1, '20200085-M', 192, '2023-05-21', '2023-05-28', '2023-05-21', -7, 1, '19:13:55', 'Returned'),
(2, '20200085-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '19:25:16', 'Returned'),
(3, '20200104-M', 6017, '2023-05-22', '2023-05-29', '2023-05-26', 3, 1, '22:06:34', 'Returned'),
(5, '20200104-M', 7325, '2023-05-24', '2023-05-31', '2023-05-26', 5, 1, '12:35:34', 'Returned'),
(6, '20200094-M', 7647, '2023-05-24', '2023-05-31', '2023-05-24', 7, 1, '15:26:06', 'Returned'),
(7, '20220344-M', 7629, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '09:10:44', 'Returned'),
(8, '20220344-M', 7650, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '09:13:50', 'Returned'),
(9, '20220344-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '09:17:27', 'Returned'),
(10, '20220344-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '09:19:09', 'Returned'),
(12, '20220133-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '09:28:35', 'Returned'),
(13, '20220796-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '09:35:41', 'Returned'),
(14, '20220796-M', 7607, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '09:39:59', 'Returned'),
(15, '20220128-M', 1, '2023-05-26', '2023-06-09', '2023-05-26', -14, 0, '09:41:15', 'Returned'),
(16, '20220058-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '09:49:50', 'Returned'),
(17, '2022020243', 1, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '09:58:10', 'Returned'),
(19, '20220302-m', 1, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '10:16:10', 'Returned'),
(20, '20220393-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '10:23:25', 'Returned'),
(21, '20200085-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '10:29:07', 'Returned'),
(22, '20200085-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '10:30:31', 'Returned'),
(23, '20200085-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '10:34:32', 'Returned'),
(24, '20200087-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '10:36:58', 'Returned'),
(25, '20210053-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '10:47:28', 'Returned'),
(26, '20210053-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '10:50:37', 'Returned'),
(27, '20211448-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '11:01:02', 'Returned'),
(28, '20210228-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '11:20:04', 'Returned'),
(29, '20210228-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '11:24:05', 'Returned'),
(30, '20210228-M', 6107, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '11:24:08', 'Returned'),
(31, '20210228-M', 7629, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '11:24:11', 'Returned'),
(32, '20210228-M', 6017, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '11:24:14', 'Returned'),
(33, '20210228-M', 6149, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '11:24:16', 'Returned'),
(34, '20210228-M', 6179, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '11:24:42', 'Returned'),
(35, '20210228-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '11:27:25', 'Returned'),
(36, '20210223-M', 7669, '2023-05-26', '2023-06-09', '2023-05-26', -14, 0, '11:49:03', 'Returned'),
(37, '20220118-M', 7674, '2023-05-26', '2023-06-09', '2023-05-26', 14, 0, '12:35:56', 'Returned'),
(38, '20210112-M', 6107, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '12:59:25', 'Returned'),
(39, '20210112-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '13:01:23', 'Returned'),
(41, '20220128-M', 6017, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '13:28:22', 'Returned'),
(43, '20210233-M', 7669, '2023-05-26', '2023-06-16', '2023-05-26', 21, 0, '13:37:06', 'Returned'),
(44, '20210493-m', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '13:57:41', 'Returned'),
(45, '20210493-m', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '14:07:04', 'Returned'),
(46, '20200104-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '14:18:15', 'Returned'),
(47, '20200104-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '14:22:36', 'Returned'),
(50, '20200248-M', 1, '2023-05-26', '2023-06-09', '2023-05-26', 14, 0, '14:39:47', 'Returned'),
(51, '20221077-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '14:53:35', 'Returned'),
(52, '20190331-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '15:02:57', 'Returned'),
(53, '20190331-M', 6107, '2023-05-26', '2023-06-02', NULL, NULL, 1, '15:03:01', 'On Borrowed'),
(54, '20190331-M', 7629, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '15:03:07', 'Returned'),
(55, '20190331-M', 6017, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '15:03:09', 'Returned'),
(58, '20190331-M', 7674, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '15:03:21', 'Returned'),
(59, '20210174-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', 7, 1, '15:22:36', 'Returned'),
(60, '20190273-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '15:39:42', 'Returned'),
(61, '20220763-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '16:13:31', 'Returned'),
(62, '20220763-M', 1111, '2023-05-26', '2023-06-02', NULL, NULL, 1, '16:20:51', 'On Borrowed'),
(63, '20220763-M', 1, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '16:24:02', 'Returned'),
(64, '20210196-M', 7669, '2023-05-26', '2023-06-02', '2023-05-26', -7, 1, '16:48:40', 'Returned'),
(65, '20210196-M', 7629, '2023-05-26', '2023-06-09', NULL, NULL, 0, '16:49:40', 'Extended'),
(66, '20210196-M', 6149, '2023-05-26', '2023-06-02', NULL, NULL, 1, '16:49:46', 'On Borrowed'),
(67, '20210196-M', 7647, '2023-05-26', '2023-06-02', NULL, NULL, 1, '16:49:53', 'On Borrowed'),
(68, '20210196-M', 6179, '2023-05-26', '2023-06-02', NULL, NULL, 1, '16:49:58', 'On Borrowed'),
(69, '20210196-M', 7347, NULL, NULL, NULL, NULL, NULL, '16:50:04', 'Borrowed Pending'),
(70, '20210196-M', 7674, NULL, NULL, NULL, NULL, NULL, '16:50:13', 'Borrowed Pending'),
(71, '20210196-M', 1, '2023-05-26', '2023-06-02', NULL, NULL, 1, '16:50:23', 'On Borrowed'),
(72, '20200087-M', 7669, '2023-05-26', '2023-06-09', '2023-05-26', -14, 0, '17:30:59', 'Returned');

-- --------------------------------------------------------

--
-- Table structure for table `lms_record_for_extend`
--

CREATE TABLE `lms_record_for_extend` (
  `StudentNo` varchar(10) NOT NULL,
  `Accession` int NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lms_record_for_extend`
--

INSERT INTO `lms_record_for_extend` (`StudentNo`, `Accession`, `Title`) VALUES
('20210196-M', 7629, '21st Century Partnership and Corporation Accounting');

-- --------------------------------------------------------

--
-- Table structure for table `lms_record_for_return`
--

CREATE TABLE `lms_record_for_return` (
  `StudentNo` varchar(50) NOT NULL,
  `Accession` int NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lms_record_for_return`
--

INSERT INTO `lms_record_for_return` (`StudentNo`, `Accession`, `Title`) VALUES
('20200085-M', 1234, '123124'),
('20200087-M', 5273, 'Developmental Reading'),
('20200087-M', 12423, 'sa123'),
('20200087-M', 13412, 'd132sd'),
('20220002-P', 6107, '21st Century Partnership and Corporation Accountin');

-- --------------------------------------------------------

--
-- Table structure for table `lms_suggestion`
--

CREATE TABLE `lms_suggestion` (
  `R_ID` int NOT NULL,
  `Book_Title` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `StudentNo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lms_users`
--

CREATE TABLE `lms_users` (
  `StudentNo` varchar(10) NOT NULL,
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Lname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Contact` bigint DEFAULT NULL,
  `Borrowed_limit` int NOT NULL,
  `Book_onhand` int NOT NULL,
  `user_img` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lms_users`
--

INSERT INTO `lms_users` (`StudentNo`, `Fname`, `Lname`, `Type`, `Email`, `Address`, `Contact`, `Borrowed_limit`, `Book_onhand`, `user_img`) VALUES
('20190273-M', 'Random ', 'Random', 'Student', 'jaykyam1127@gmail.com', '63 Filipino Avenue Balonbato', 9369496063, 5, 0, 'default.png'),
('20190331-M', 'G-Sel ', 'Loro', 'Student', 'gselloro47@gmail.com', 'Caloocan', 12368468736, 3, 2, 'default.png'),
('20200085-M', 'John Kenneth ', 'Biscocho', 'Student', '20200085m.biscocho.kenneth.bscs@gmail.com', ' 75 General Concepcion St B.B.C.C', 9367553521, 5, 0, '20200085-M.png'),
('20200087-M', 'Anwin ', 'Cabrera', 'Student', '20200087m.anwin.cabrera.bscs@gmail.com', '51 General Concepcion St.', 9368661359, 5, 0, 'default.png'),
('20200094-M', 'Angel ', 'Deona', 'Student', 'angeldeona.123@gmail.com', '4th ave. Caloocan City', 9561390082, 5, 0, '20200094-M.jpg'),
('20200104-M', 'Elenabeth ', 'Mariano', 'Student', 'elenabeth.mariano07@gmail.com', 'Filipino ave, QC', 9508273037, 5, 0, '20200104-M.png'),
('20200105-M', 'Faith ', 'Baile', 'Student', 'geniusfaith17@gmail.com', 'Malolos Ave,Caloocan', 9474959613, 5, 0, 'default.png'),
('20200248-M', 'Harley ', 'Llenes', 'Student', 'hdllenes@gmail.com', 'Caloocan', 36487364364, 5, 0, 'default.png'),
('20200261-M', 'Ranilo ', 'Hermogino', 'Student', 'ranhermogino24@gmail.com', 'Caloocan', 36482483582, 5, 0, 'default.png'),
('20210053-M', 'Philip ', 'Dela Cruz', 'Student', 'delacruzphilip69@gmail.com', 'Caloocan', 9112121212, 5, 0, 'default.png'),
('20210112-M', 'Emmanuel ', 'Punay', 'Student', 'emmanuelpunay6906@gmail.com', 'Caloocan', 11111111111, 5, 0, 'default.png'),
('20210174-M', 'Charlie ', 'Galang', 'Student', 'charliegalang62@gmail.com', 'Caloocan', 36287678648, 5, 0, 'default.png'),
('20210196-M', 'Antonio ', 'Dimla', 'Student', 'dimlaantonio.bsit@gmail.com', 'Caloocan', 17836738618, 0, 5, 'default.png'),
('20210223-M', 'Mary Ann ', 'Dometita', 'Student', 'anndometita034@gmail.com', 'Caloocan', 63762837626, 5, 0, 'default.png'),
('20210228-M', 'Michael ', 'Marquez', 'Student', 'michaeljoshuamarquez3@gmail.com', 'Caloocan', 12347676787, 7, -2, 'default.png'),
('20210233-M', 'Elijah ', 'Otlang', 'Student', 'elijahotlang.02@gmail.com', 'caloocan', 22222222222, 5, 0, 'default.png'),
('20210493-M', 'Dahlia Beatriz ', 'Aspe', 'Student', 'aspedahlia@gmail.com', 'Caloocan', 12326432465, 5, 0, 'default.png'),
('20211448-M', 'Jessica ', 'Mislang', 'Student', 'jessicamislang26@gmail.com', 'Caloocan', 9212121122, 5, 0, 'default.png'),
('20220058-M', 'Soyuz Emmanuel ', 'Dayag', 'Student', 'dayag.soyuzemmanuel.bscs2022@gmail.com', 'Caloocan', 12233213123, 5, 0, 'default.png'),
('20220118-M', 'Analyn ', 'Morfe', 'Student', 'analyn.morfe0810@gmail.com', 'caloocan', 22633328222, 5, 0, 'default.png'),
('20220128-M', 'Sir Victor ', 'Aquino', 'Student', 'alpacasenseii@gmail.com', 'Caloocan', 9222222222, 5, 0, 'default.png'),
('20220133-M', 'Ronnie ', 'Red', 'Student', 'red.ronnie.bscs2022@gmaiil.com', 'Caloocan', 12312313132, 5, 0, 'default.png'),
('2022020243', 'Leandris ', 'Tabuzo', 'Student', 'tabuzo.leandris.bscs2022@gmail.com', 'Caloocan', 9122222222, 5, 0, 'default.png'),
('20220302-M', 'John Christian ', 'Aninao', 'Student', 'aninao.johnchristian.bscs2022@gmail.com', 'Caloocan', 9222222222, 5, 0, 'default.png'),
('20220344-M', 'Faith ', 'Baile', 'Student', 'faith17baile@gmail.com', 'Caloocan', 9999999999, 5, 0, 'default.png'),
('20220393-M', 'Patrick ', 'de leon', 'Student', 'lancepatrickdeleon2004@gmail.com', 'Cloocan', 9222222222, 5, 0, 'default.png'),
('20220644-M', 'Jhon Mark ', 'Tumbagahan', 'Student', 'jhonmarktumbagahan599@gmail.com', 'Caloocan', 11111111222, 5, 0, 'default.png'),
('20220763-M', 'Renzel ', 'Rodriguez', 'Student', 'jaykyam1127@gmail.com', '63 Filipino Avenue Balonbato', 9369496063, 4, 1, 'default.png'),
('20220796-M', 'Carl ', 'Dy', 'Student', 'carldy04@gmail.com', 'Caloocan', 12992929292, 5, 0, 'default.png'),
('20221077-M', 'Christine ', 'Santillan', 'Student', 'santillanchristine0000@gmail.com', 'Caloocan', 67386387637, 5, 0, 'default.png'),
('admin', 'ADMINISTRATOR', '', 'admin', 'ucc_library@ucc-csd-bscs.com', 'Biglang Awa St. Caloocan City', 123456789, 0, 0, 'ADMIN.png');

-- --------------------------------------------------------

--
-- Table structure for table `smarttrashcan_tb`
--

CREATE TABLE `smarttrashcan_tb` (
  `id` int NOT NULL,
  `data` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mode` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `smarttrashcan_tb`
--

INSERT INTO `smarttrashcan_tb` (`id`, `data`, `mode`, `date_created`) VALUES
(5, '1', 'ON', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `uccp_accpaidaddmission`
--

CREATE TABLE `uccp_accpaidaddmission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `ornumber` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_accpaidaddmission`
--

INSERT INTO `uccp_accpaidaddmission` (`id`, `name`, `ornumber`, `status`) VALUES
(600, 'Angelo Charles Perlota', 'OR-656183825', 'Paid'),
(601, 'jiro allen Ibia', 'OR-1428486166', 'Paid'),
(602, 'Deborah Faith Hernandez Baile', 'OR-934599330', 'Paid'),
(603, '1 1 1', 'OR-1832851750', 'Paid'),
(605, '3 3 3', 'OR-1009868474', 'Paid'),
(606, '5 5 5', 'OR-1118249099', 'Paid'),
(607, '7 7 7', 'OR-1727930402', 'Paid'),
(608, 'Jiro Allen Olit Ibia', 'OR-2106462414', 'Paid'),
(609, 'q q q', 'OR-1178351771', 'Paid'),
(610, '1 1 1', 'OR-1293820479', 'Paid'),
(611, '2 2 2', 'OR-229822156', 'Paid'),
(612, 'Christian Barcheta Espinoza', 'OR-1021247281', 'Paid'),
(613, 'z z z', 'OR-259182922', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_accpaidenrollment`
--

CREATE TABLE `uccp_accpaidenrollment` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `ornumber` varchar(255) NOT NULL,
  `status` text NOT NULL,
  `balance` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_accpaidenrollment`
--

INSERT INTO `uccp_accpaidenrollment` (`id`, `name`, `course`, `year`, `ornumber`, `status`, `balance`) VALUES
(521, 'Angelo Charles Perlota', 'BSCS', '1st Year', 'OR-2001653521', 'Paid', '0'),
(522, 'Jiro Allen Ibia', 'BSCS', '1st Year', 'OR-1866172160', 'Paid', '0'),
(523, 'Deborah Faith Hernandez Baile', 'BSCS', '1st Year', 'OR-1150059084', 'Paid', '0'),
(524, '1 1 1', 'BSCS', '1st Year', 'OR-1381810969', 'Paid', '0'),
(525, '3 3 3', 'BSCS', '1st Year', 'OR-616407465', 'Paid', '0'),
(526, '5 5 5', 'BSCS', '1st Year', 'OR-589295973', 'Paid', '0'),
(527, '7 7 7', 'BSCS', '1st Year', 'OR-1452988842', 'Paid', '0'),
(528, 'Jiro Allen Olit Ibia', 'BSCS', '1st Year', 'OR-1927718984', 'Paid', '0'),
(529, 'q q q', 'BSCS', '1st Year', 'OR-982059638', 'Paid', '0'),
(530, '1 1 1', 'BSCS', '1st Year', 'OR-1353745887', 'Paid', '0'),
(531, '2 2 2', 'BSCS', '1st Year', 'OR-586770067', 'Paid', '0'),
(532, 'Christian Barcheta Espinoza', 'BSCS', '1st Year', '', 'Paid', ''),
(536, 'Angelo Charles Perlota', 'BSCS', '1st Year', 'OR-549595762', 'Paid', ''),
(537, 'Jiro Allen Ibia', 'BSCS', '1st Year', 'OR-1840891857', 'Paid', ''),
(538, 'Deborah Faith Hernandez Baile', 'BSCS', '1st Year', 'OR-1276749641', 'Paid', ''),
(539, '1 1 1', 'BSCS', '1st Year', 'OR-268362169', 'Paid', ''),
(540, '3 3 3', 'BSCS', '1st Year', 'OR-1201592371', 'Paid', ''),
(541, '5 5 5', 'BSCS', '1st Year', 'OR-275392158', 'Paid', ''),
(542, '7 7 7', 'BSCS', '1st Year', 'OR-1399653612', 'Paid', ''),
(543, 'Jiro Allen Olit Ibia', 'BSCS', '1st Year', 'OR-82889642', 'Paid', ''),
(544, 'q q q', 'BSCS', '1st Year', 'OR-1344231880', 'Paid', ''),
(545, '1 1 1', 'BSCS', '1st Year', 'OR-1808100742', 'Paid', ''),
(546, '2 2 2', 'BSCS', '1st Year', 'OR-1776985242', 'Paid', '');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_add_courses`
--

CREATE TABLE `uccp_add_courses` (
  `id` int NOT NULL,
  `courses` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `abbreviation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_add_courses`
--

INSERT INTO `uccp_add_courses` (`id`, `courses`, `status`, `abbreviation`) VALUES
(61, 'BSIT', 'Enable', 'BSIT'),
(62, 'BSCS', 'Enable', 'BSCS'),
(63, 'BSEMC', 'Disable', 'BSEMC'),
(64, 'BSIS', 'Enable', 'BSIS');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_adminacc_tbl`
--

CREATE TABLE `uccp_adminacc_tbl` (
  `id` int NOT NULL,
  `usertype` int NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_adminacc_tbl`
--

INSERT INTO `uccp_adminacc_tbl` (`id`, `usertype`, `username`, `password`, `email`, `phone`) VALUES
(209, 6, 'bscsperlota', 'admin123', 'geloperlota@gmail.com', '09478567810'),
(210, 6, 'bscsclarence', 'admin456', 'clarespejo@gmail.com', '09746581236'),
(211, 6, 'bscsclemente', 'admin789', 'mavsclemente@gmail.com', '09745687154'),
(212, 6, 'bscsjiro', 'admin012', 'ibiajiro@gmail.com', '09351501163');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_admission`
--

CREATE TABLE `uccp_admission` (
  `id` int NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `birthplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `guardian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `g-Occupation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `g-Contact` varchar(255) NOT NULL,
  `g-Adress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `primary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `primary-Sy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `highschool` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `highschool-Sy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shs-Sy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstchoice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `requirements` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `proof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `schoolyear` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_admission_billing`
--

CREATE TABLE `uccp_admission_billing` (
  `id` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Birthday` date NOT NULL,
  `Birthplace` varchar(255) NOT NULL,
  `Number` varchar(255) NOT NULL,
  `Email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Guardian` varchar(255) NOT NULL,
  `G-Occupation` varchar(255) NOT NULL,
  `G-Contact` varchar(255) NOT NULL,
  `G-Adress` varchar(255) NOT NULL,
  `Primary` varchar(255) NOT NULL,
  `Primary-Sy` varchar(255) NOT NULL,
  `Highschool` varchar(255) NOT NULL,
  `Highschool-Sy` varchar(255) NOT NULL,
  `Shs` varchar(255) NOT NULL,
  `Shs-Sy` varchar(255) NOT NULL,
  `Firstchoice` varchar(255) NOT NULL,
  `Requirements` varchar(255) NOT NULL,
  `Picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Proof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Schoolyear` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `ornumber` varchar(255) NOT NULL,
  `totalprice` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_admission_schedule`
--

CREATE TABLE `uccp_admission_schedule` (
  `id` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_admission_schedule`
--

INSERT INTO `uccp_admission_schedule` (`id`, `status`, `schoolyear`) VALUES
(287, 'Closed', '2022-2023'),
(288, 'Closed', '2023-2024'),
(289, 'Closed', '2024-2025'),
(290, 'Closed', '2025-2026'),
(297, 'Closed', '2026-2027'),
(298, 'Closed', '2027-2028'),
(299, 'Closed', '2028-2029'),
(300, 'Closed', '2029-2030'),
(301, 'Closed', '2030-2031'),
(302, 'Closed', '2031-2032'),
(303, 'Closed', '2032-2033'),
(304, 'Closed', '2033-2034'),
(305, 'Open', '2034-2035');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_approvedcurriculum`
--

CREATE TABLE `uccp_approvedcurriculum` (
  `id` int NOT NULL,
  `Schoolyear` varchar(255) NOT NULL,
  `Course` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `Subcode` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Units` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Sem` varchar(255) NOT NULL,
  `availability` varchar(255) NOT NULL,
  `Price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_approvedcurriculum`
--

INSERT INTO `uccp_approvedcurriculum` (`id`, `Schoolyear`, `Course`, `Year`, `Subcode`, `Description`, `Units`, `Status`, `Sem`, `availability`, `Price`) VALUES
(254, '2023-2024', 'BSCS', '1st Year', 'CCS 101', 'Introduction to Computing', '3', 'APPROVED', '1ST', 'Accredit', '20'),
(255, '2023-2024', 'BSCS', '1st Year', 'CCS 102', 'Fundamentals of Programming', '5', 'APPROVED', '1ST', 'Accredit', ''),
(256, '2023-2024', 'BSCS', '3rd Year', 'CCS 116', 'ADVANCED WEB SYSTEMS', '5', 'APPROVED', '1ST', 'Accredit', ''),
(257, '2023-2024', 'BSCS', '1st Year', 'CCS 109', 'Business Application Software', '3', 'APPROVED', '1ST', 'Accredit', ''),
(258, '2023-2024', 'BSCS', '1st Year', 'GEC 001', 'Understanding the Self', '3', 'APPROVED', '1ST', 'Accredit', ''),
(259, '2023-2024', 'BSCS', '1st Year', 'GEC 005', 'Purposive Communication', '3', 'APPROVED', '1ST', 'Accredit', ''),
(260, '2023-2024', 'BSCS', '3rd Year', 'CS 108', 'SOFTWARE ENGINEERING 1', '3', 'APPROVED', '1ST', 'Accredit', ''),
(261, '2023-2024', 'BSCS', '1st Year', 'GEC 004', 'Mathematics in the Modern World', '3', 'APPROVED', '1ST', 'Accredit', ''),
(262, '2023-2024', 'BSCS', '3rd Year', 'CS 110', 'NETWORKS AND COMMUNICATIONS', '3', 'APPROVED', '1ST', 'Accredit', ''),
(263, '2023-2024', 'BSCS', '1st Year', 'NSTP 101', 'NSTP CWTS 1', '3', 'APPROVED', '1ST', 'Accredit', ''),
(264, '2023-2024', 'BSCS', '3rd Year', 'CSE 102', 'GRAPHICS AND VISUAL COMPUTING', '3', 'APPROVED', '1ST', 'Accredit', ''),
(265, '2023-2024', 'BSCS', '1st Year', 'CCS 103', 'Intermediate Programming', '5', 'APPROVED', '2ND', 'Accredit', ''),
(266, '2023-2024', 'BSCS', '1st Year', 'CCS 107', 'Web Systems and Technologies', '5', 'APPROVED', '2ND', 'Accredit', ''),
(267, '2023-2024', 'BSCS', '3rd Year', 'GEC 008', 'ETHICS', '3', 'APPROVED', '1ST', '', ''),
(268, '2023-2024', 'BSCS', '1st Year', 'CCS 108', 'Technical Computer Concepts', '3', 'APPROVED', '2ND', 'Accredit', ''),
(269, '2023-2024', 'BSCS', '3rd Year', 'RES 001', 'METHODS OF RESEARCH', '3', 'APPROVED', '1ST', '', ''),
(270, '2023-2024', 'BSCS', '1st Year', 'GEC 003', 'Contemporary World', '3', 'APPROVED', '2ND', 'Accredit', ''),
(271, '2023-2024', 'BSCS', '3rd Year', 'GEC 007', 'SCIENCE, TECHNOLOGY, AND SOCIETY', '3', 'APPROVED', '1ST', 'Accredit', ''),
(272, '2023-2024', 'BSCS', '1st Year', 'LIT 001', 'Philippine Literature in English', '3', 'APPROVED', '2ND', 'Accredit', ''),
(273, '2023-2024', 'BSCS', '3rd Year', 'PE 004', 'TEAM SPORTS', '2', 'APPROVED', '1ST', 'Accredit', ''),
(275, '2023-2024', 'BSCS', '1st Year', 'PE 001', 'Physical Fitness And Wellness', '2', 'APPROVED', '2ND', 'Accredit', ''),
(276, '2023-2024', 'BSCS', '3rd Year', 'CS 107', 'Embedded Programming', '5', 'APPROVED', '2ND', 'Accredit', ''),
(277, '2023-2024', 'BSCS', '3rd Year', 'CS 109', 'SOFTWARE ENGINEERING 2', '3', 'APPROVED', '2ND', 'Accredit', ''),
(278, '2023-2024', 'BSCS', '3rd Year', 'CS 111', 'ARCHITECTURE AND ORGANIZATION', '3', 'APPROVED', '2ND', 'Accredit', ''),
(279, '2023-2024', 'BSCS', '3rd Year', 'CS 112', 'Operating Systems', '3', 'APPROVED', '2ND', 'Accredit', ''),
(280, '2023-2024', 'BSCS', '3rd Year', 'CS 113', 'Information Assurance and Security', '3', 'APPROVED', '2ND', 'Accredit', ''),
(281, '2023-2024', 'BSCS', '3rd Year', 'GEM 006', 'ART APPRECIATION', '3', 'APPROVED', '2ND', 'Accredit', ''),
(282, '2023-2024', 'BSCS', '2nd Year', 'CCS 104', 'Data Structures and Algorithms', '3', 'APPROVED', '1ST', 'Accredit', ''),
(283, '2023-2024', 'BSCS', '2nd Year', 'CCS 105', 'Information Management', '5', 'APPROVED', '1ST', 'Accredit', ''),
(284, '2023-2024', 'BSCS', '2nd Year', 'CS 101', 'Programming Languages', '5', 'APPROVED', '1ST', 'Accredit', ''),
(285, '2023-2024', 'BSCS', '2nd Year', 'CS 102', 'Logic Circuit and Switching Theory', '3', 'APPROVED', '1ST', 'Accredit', ''),
(286, '2023-2024', 'BSCS', '2nd Year', 'CS 103', 'Discrete Structures 1', '3', 'APPROVED', '1ST', 'Accredit', ''),
(287, '2023-2024', 'BSCS', '2nd Year', 'PE 002', 'Rhythmic Activities', '2', 'APPROVED', '1ST', 'Accredit', ''),
(288, '2023-2024', 'BSCS', '2nd Year', 'PR 002', 'Differential Calculus', '3', 'APPROVED', '1ST', 'Accredit', ''),
(289, '2023-2024', 'BSCS', '2nd Year', 'CCS 103', 'Intermediate Programming', '5', 'APPROVED', '2ND', 'Accredit', ''),
(290, '2023-2024', 'BSCS', '2nd Year', 'CCS 107', 'Web Systems and Technologies', '5', 'APPROVED', '2ND', 'Accredit', ''),
(291, '2023-2024', 'BSCS', '2nd Year', 'CCS 108', 'Technical Computer Concepts', '3', 'APPROVED', '2ND', 'Accredit', ''),
(292, '2023-2024', 'BSCS', '2nd Year', 'GEC 003', 'Contemporary World', '3', 'APPROVED', '2ND', 'Accredit', ''),
(293, '2023-2024', 'BSCS', '2nd Year', 'LIT 001', 'Philippine Literature in English', '3', 'APPROVED', '2ND', 'Accredit', ''),
(294, '2023-2024', 'BSCS', '3rd Year', 'CCS 116', 'ADVANCED WEB SYSTEMS', '5', 'APPROVED', '1ST', 'Accredit', ''),
(295, '2023-2024', 'BSCS', '2nd Year', 'NSTP 102', 'NSTP CWTS 2', '3', 'APPROVED', '2ND', 'Accredit', ''),
(296, '2023-2024', 'BSCS', '3rd Year', 'CS 108', 'SOFTWARE ENGINEERING 1', '3', 'APPROVED', '1ST', '', ''),
(297, '2023-2024', 'BSCS', '2nd Year', 'PR 001', 'College Algebra', '3', 'APPROVED', '2ND', 'Accredit', ''),
(298, '2023-2024', 'BSCS', '3rd Year', 'CS 110', 'NETWORKS AND COMMUNICATIONS', '3', 'APPROVED', '1ST', '', ''),
(299, '2023-2024', 'BSCS', '2nd Year', 'PE 001', 'Physical Fitness and Wellness', '2', 'APPROVED', '2ND', 'Accredit', ''),
(300, '2023-2024', 'BSCS', '3rd Year', 'CSE 102', 'GRAPHICS AND VISUAL COMMUNICATIONS', '3', 'APPROVED', '1ST', 'Accredit', ''),
(301, '2023-2024', 'BSCS', '4th Year', 'CCS 113', 'AUTOMATA AND LANGUAGE THEORY', '3', 'APPROVED', '2ND', 'Accredit', ''),
(302, '2023-2024', 'BSCS', '4th Year', 'CCS 115', 'CURRENT TRENDS IN IT AND SEMINAR', '3', 'APPROVED', '2ND', 'Accredit', ''),
(303, '2023-2024', 'BSCS', '4th Year', 'CS 115', 'HUMAN COMPUTER INTERACTION', '3', 'APPROVED', '2ND', 'Accredit', ''),
(304, '2023-2024', 'BSCS', '4th Year', 'CS 119', 'CS THESIS WRITING 2', '5', 'APPROVED', '2ND', 'Accredit', ''),
(305, '2023-2024', 'BSCS', '4th Year', 'CSE 105', 'PARALLEL AND DISTRIBUTED COMPUTING', '3', 'APPROVED', '2ND', 'Accredit', ''),
(306, '2023-2024', 'BSCS', '4th Year', 'CS 114 B', 'PRACTICUM II', '3', 'APPROVED', '2ND', 'Accredit', ''),
(307, '2023-2024', 'BSCS', '4th Year', 'CS 112 ', 'SOCIAL ISSUES AND PROFESSIONAL PRACTICE 1', '3', 'APPROVED', '1ST', 'Accredit', ''),
(308, '2023-2024', 'BSCS', '4th Year', 'CS 116', 'ALGORITHM AND COMPLEXITY', '3', 'APPROVED', '1ST', 'Accredit', ''),
(309, '2023-2024', 'BSCS', '4th Year', 'CS 118', 'CS THESIS WRITING 1', '5', 'APPROVED', '1ST', 'Accredit', ''),
(310, '2023-2024', 'BSCS', '4th Year', 'CSE 103', 'COMPUTATIONAL SCIENCE', '3', 'APPROVED', '1ST', 'Accredit', ''),
(311, '2023-2024', 'BSCS', '4th Year', 'CSE 104', 'INTELLIGENT SYSTEMS', '3', 'APPROVED', '1ST', 'Accredit', '');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_bor_tbl`
--

CREATE TABLE `uccp_bor_tbl` (
  `id` int NOT NULL COMMENT 'board of regents id',
  `bor_name` varchar(60) NOT NULL COMMENT 'board of regents name',
  `bor_position` varchar(60) NOT NULL COMMENT 'board of regents position',
  `bor_description` text NOT NULL COMMENT 'board of regents description',
  `bor_image` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'board of regents image',
  `bor_level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_bor_tbl`
--

INSERT INTO `uccp_bor_tbl` (`id`, `bor_name`, `bor_position`, `bor_description`, `bor_image`, `bor_level`) VALUES
(54, 'Hon. Dale Gonzalo \"ALONG\" R. Malapitan', 'City Mayor / Chairman', 'Board of Regents', '64417d4794174.png', 1),
(55, 'Marilyn T. De Jesus, DPA', 'OIC, Vice Chairman', 'Board of Regents', '64417d76a48cd.png', 1),
(56, 'Hon. Luis \"L.A.\" 0. Asistio III', 'Member, B.O.R', 'City Councilor', '64417d9f32de1.png', 2),
(57, 'Hon. Atty. Patrick L. Prado', 'Member, B.O.R', 'City Councilor', '64417dc252d59.png', 2),
(58, 'Ms. Aurora C. Ciego', 'Member, B.O.R', 'City Administrator', '64417e2388a35.png', 2),
(59, 'Ms. Lilibeth M. Luakian', 'Member, B.O.R', 'Secretary to the Mayor', '64417e39d5f06.png', 2),
(60, 'Dr. Wenald H. Lopez', 'Member, B.O.R', 'Vice President for Administration', '64417e51142fe.png', 2),
(61, 'Ms.Violeta Y. Gonzales', 'Member, B.O.R', 'OIC, PESO', '64417e74230ed.png', 2),
(62, 'Dr. Nerissa L. Losaria, CESO V', 'Member, B.O.R', 'Superintendent, Division of City Schools ', '64417e865441c.png', 2),
(63, 'Dr. Dionisio S. Reyes', 'Member, B.O.R', 'President, UCC Faculty and Employees Assn. Inc', '64417e9e72f4b.png', 2),
(64, 'Dr. Teodoro A. Macaraeg Jr.', 'Member, B.O.R', 'President, UCCAAI', '64417eba4bcc6.png', 2),
(65, '', 'Member, B.O.R', 'President, SSC', '64417ecd539e9.png', 2),
(66, 'Mr. Frank Coh', 'Member, B.O.R', 'Former President, FCCC Caloocan Chapter / Ex-Officio Member', '64417ee78dcc9.png', 2),
(67, 'Atty. Roderick Vera', 'Member, B.O.R', 'Board Secretary', '64417f013ccf6.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `uccp_course`
--

CREATE TABLE `uccp_course` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `courses` varchar(255) NOT NULL,
  `yearlevel` varchar(255) NOT NULL,
  `totalprice` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_course`
--

INSERT INTO `uccp_course` (`id`, `type`, `courses`, `yearlevel`, `totalprice`) VALUES
(1, 'Admission', '', '1st', 100),
(2, '', 'BSCS', '3rd', 300),
(3, '', 'BSIT', '2nd', 250),
(5, '', 'BSOAD', '2nd', 450),
(6, '', 'BSTM', '4th', 500);

-- --------------------------------------------------------

--
-- Table structure for table `uccp_coursefee`
--

CREATE TABLE `uccp_coursefee` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `curriculumid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_coursefee`
--

INSERT INTO `uccp_coursefee` (`id`, `type`, `price`, `curriculumid`) VALUES
(1, 'Admission', 100, 0),
(18, 'Computer Laboratory Fee', 110, 0),
(19, 'Scheme 2', 2000, 0),
(20, 'Medical Fee', 150, 0),
(21, 'PE', 130, 0),
(22, 'Science Laboratory Fee', 120, 0),
(27, 'BSCS CCS 101 - Introduction to Computing', 20, 254);

-- --------------------------------------------------------

--
-- Table structure for table `uccp_curriculum`
--

CREATE TABLE `uccp_curriculum` (
  `id` int NOT NULL,
  `Schoolyear` varchar(255) NOT NULL,
  `Course` varchar(255) NOT NULL,
  `Year` varchar(255) NOT NULL,
  `Subcode` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Units` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Sem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_enrolled`
--

CREATE TABLE `uccp_enrolled` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `diploma` varchar(255) NOT NULL,
  `goodmoral` varchar(255) NOT NULL,
  `psa` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `proof` varchar(255) NOT NULL,
  `erf` varchar(255) NOT NULL,
  `records` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_enrolled`
--

INSERT INTO `uccp_enrolled` (`id`, `name`, `gender`, `birthday`, `birthplace`, `email`, `phone`, `address`, `course`, `year`, `section`, `schoolyear`, `sem`, `picture`, `diploma`, `goodmoral`, `psa`, `card`, `proof`, `erf`, `records`, `status`, `username`, `password`, `account_type`) VALUES
(521, 'Angelo Charles Perlota', 'Male', '2001-12-26', 'Manila', 'angeloperlota38@gmail.com', '09742145847', 'Caloocan City', 'BSCS', '1st Year', 'BSCS-1A', '2022-2023', '2nd', '1685063891491Screenshot 2023-04-06 130916.png', '5055191674474Screenshot 2023-04-06 123750.png', '6740255565966Screenshot 2023-04-06 130916.png', '3370127782983Screenshot 2023-04-06 125026.png', '8425319457458Screenshot 2023-04-06 123750.png', '10110383348949Screenshot 2023-04-06 123750.png', '1685064519982Screenshot 2023-04-06 125026.png', '5055193559946Screenshot 2023-04-06 142538.png', '', 'angeloperlota38@gmail.com', 'AngeloCharlesPerlota', '1'),
(522, 'Jiro Allen Ibia', 'Male', '2023-05-26', 'Manila', 'jiroallen@gmail.com', '1456647646', '1', 'BSCS', '1st Year', 'BSCS-1A', '2023-2024', '2nd', '1685065612418Screenshot 2023-04-06 125026.png', '5055196837256Screenshot 2023-04-06 142542.png', '6740262449675Screenshot 2023-04-06 142542.png', '3370131224837Screenshot 2023-04-06 142542.png', '8425328062094Screenshot 2023-04-06 142449.png', '10110393674513Screenshot 2023-04-06 125026.png', '1685066261159Screenshot 2023-04-06 142542.png', '5055198783477Screenshot 2023-04-06 130916.png', '', 'jiroallen@gmail.com', 'JiroAllenIbia', '1'),
(523, 'Deborah Faith Hernandez Baile', 'Female', '2003-12-12', 'dyan lang caloocan city', 'faith17baile@gmail.com', '09123456789', 'sa tabi lang caloocan city', 'BSCS', '1st Year', 'BSCS-1A', '2024-2025', '2nd', '1685067519410Screenshot 2023-04-06 142538.png', '5055202558231Screenshot 2023-04-06 142542.png', '6740270077641Screenshot 2023-04-06 125026.png', '3370135038820Screenshot 2023-04-06 142538.png', '8425337597052Screenshot 2023-04-06 142428.png', '10110405116462Screenshot 2023-04-06 142542.png', '1685067955220Screenshot 2023-04-06 130916.png', '5055203865662Screenshot 2023-04-06 130916.png', '', 'faith17baile@gmail.com', 'DeborahFaithHernandezBaile', '1'),
(524, '1 1 1', 'Male', '2023-05-26', '1', '1', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2025-2026', '2nd', '1685069146891Screenshot 2023-04-06 130916.png', '5055207440673Screenshot 2023-04-06 130916.png', '6740276587564Screenshot 2023-04-06 130916.png', '3370138293782Screenshot 2023-04-06 125026.png', '8425345734455Screenshot 2023-04-06 130916.png', '10110414881346Screenshot 2023-04-06 125026.png', '1685069537517Screenshot 2023-04-06 142542.png', '5055208612551Screenshot 2023-04-06 130916.png', '', '1', '111', '1'),
(525, '3 3 3', 'Male', '2023-05-26', '3', '3', '3', '3', 'BSCS', '1st Year', 'BSCS-1A', '2026-2027', '2nd', '1685070291813Screenshot 2023-04-06 130916.png', '5055210875441Screenshot 2023-04-06 125026.png', '6740281167255Screenshot 2023-04-06 123750.png', '3370140583627Screenshot 2023-04-06 123750.png', '8425351459068Screenshot 2023-04-06 125026.png', '10110421750882Screenshot 2023-04-06 123750.png', '1685070827734Screenshot 2023-04-06 130916.png', '5055212483202Screenshot 2023-04-06 130916.png', '', '3', '333', '1'),
(526, '5 5 5', 'Male', '2023-05-26', '5', '5', '5', '5', 'BSCS', '1st Year', 'BSCS-1A', '2027-2028', '2nd', '1685071623438Screenshot 2023-04-06 125026.png', '5055214870315Screenshot 2023-04-06 125026.png', '6740286493753Screenshot 2023-04-06 125026.png', '3370143246876Screenshot 2023-04-06 125026.png', '8425358117192Screenshot 2023-04-06 125026.png', '10110429740630Screenshot 2023-04-06 125026.png', '1685071878896Screenshot 2023-04-06 130916.png', '5055215636689Screenshot 2023-04-06 125026.png', '', '5', '555', '1'),
(527, '7 7 7', 'Male', '2023-05-26', '7', '7', '7', '7', 'BSCS', '1st Year', 'BSCS-1A', '2028-2029', '2nd', '1685073023046Screenshot 2023-04-06 142542.png', '5055219069139Screenshot 2023-04-06 142542.png', '6740292092185Screenshot 2023-04-06 142542.png', '3370146046092Screenshot 2023-04-06 142542.png', '8425365115232Screenshot 2023-04-06 142542.png', '10110438138278Screenshot 2023-04-06 142712.png', '1685073239913Screenshot 2023-04-06 142538.png', '5055219719739Screenshot 2023-04-06 142538.png', '', '7', '777', '1'),
(528, 'Jiro Allen Olit Ibia', 'Male', '2002-03-04', 'Manila', 'ibiajiro@gmail.com', '09351501163', 'Navotas City', 'BSCS', '1st Year', 'BSCS-1A', '2029-2030', '2nd', '1685076356819Screenshot 2023-04-06 130916.png', '5055229070459Screenshot 2023-04-06 125026.png', '6740305427279Screenshot 2023-04-06 142542.png', '3370152713639Screenshot 2023-04-06 142449.png', '8425381784099Screenshot 2023-04-06 142449.png', '10110458140919Screenshot 2023-04-06 123750.png', '1685077066302Screenshot 2023-04-06 142542.png', '5055231198906Screenshot 2023-04-06 142542.png', '', 'ibiajiro@gmail.com', 'JiroAllenOlitIbia', '1'),
(529, 'q q q', 'Male', '2023-05-26', 'q', 'q', '1', 'q', 'BSCS', '1st Year', 'BSCS-2A', '2030-2031', '2nd', '1685077802752Screenshot 2023-04-06 142538.png', '5055233408256Screenshot 2023-04-06 142542.png', '6740311211009Screenshot 2023-04-06 142542.png', '3370155605504Screenshot 2023-04-06 142538.png', '8425389013761Screenshot 2023-04-06 142538.png', '10110466816513Screenshot 2023-04-06 142538.png', '1685078625892Screenshot 2023-04-06 123750.png', '5055235877676Screenshot 2023-04-06 123750.png', '', 'q', 'qqq', '1'),
(530, '1 1 1', 'Male', '2023-05-26', '1', '1', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2031-2032', '2nd', '1685082702255Screenshot 2023-04-06 123750.png', '5055248106766Screenshot 2023-04-06 125026.png', '6740330809021Screenshot 2023-04-06 123750.png', '3370165404510Screenshot 2023-04-06 125026.png', '8425413511277Screenshot 2023-04-06 125026.png', '10110496213532Screenshot 2023-04-06 125026.png', '1685083006413Screenshot 2023-04-06 130916.png', '5055249019240Screenshot 2023-04-06 123750.png', '', '1', '111', '1'),
(531, '2 2 2', 'Male', '2023-05-26', '2', '2', '2', '2', 'BSCS', '1st Year', 'BSCS-1A', '2032-2033', '2nd', '1685085266220Screenshot 2023-04-06 123750.png', '5055255798660Screenshot 2023-04-06 123750.png', '6740341064881Screenshot 2023-04-06 130916.png', '3370170532440Screenshot 2023-04-06 125026.png', '8425426331101Screenshot 2023-04-06 123750.png', '10110511597321Screenshot 2023-04-06 130916.png', '1685085566957Screenshot 2023-04-06 123750.png', '5055256700873Screenshot 2023-04-06 123750.png', '', '2', '222', '1'),
(532, 'Christian Barcheta Espinoza', 'Male', '2002-01-05', 'Caloocan City', 'espinoza.christian.bscs2022@gmail.com', '09926870934', '109 Gonzales St.', 'BSCS', '1st Year', 'BSCS-1A', '2033-2034', '1st', '1685092495812Screenshot 2023-04-06 123750.png', '5055277487438Screenshot 2023-04-06 125026.png', '6740369983251Screenshot 2023-04-06 130916.png', '3370184991625Screenshot 2023-04-06 142449.png', '8425462479064Screenshot 2023-04-06 142428.png', '10110554974877Screenshot 2023-04-06 142542.png', '', '', '', 'espinoza.christian.bscs2022@gmail.com', 'ChristianBarchetaEspinoza', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_enrollee`
--

CREATE TABLE `uccp_enrollee` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `diploma` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `goodmoral` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `psa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `proof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `erf` varchar(255) NOT NULL,
  `records` varchar(255) NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_enrollee`
--

INSERT INTO `uccp_enrollee` (`id`, `name`, `gender`, `birthday`, `birthplace`, `email`, `phone`, `address`, `course`, `year`, `section`, `schoolyear`, `sem`, `picture`, `diploma`, `goodmoral`, `psa`, `card`, `proof`, `erf`, `records`, `status`, `username`, `password`, `account_type`) VALUES
(533, 'z z z', 'Male', '2023-05-26', 'z', 'z', '1', 'z', 'BSCS', '1st Year', '', '2034-2035', '1st', '1685093898365Screenshot 2023-04-06 130721.png', '5055281695097Screenshot 2023-04-06 130916.png', '6740375593463Screenshot 2023-04-06 130916.png', '3370187796731Screenshot 2023-04-06 130916.png', '8425469491829Screenshot 2023-04-06 130916.png', '10110563390195Screenshot 2023-04-06 130916.png', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_enrollment_billing`
--

CREATE TABLE `uccp_enrollment_billing` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `birthplace` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `diploma` varchar(255) NOT NULL,
  `goodmoral` varchar(255) NOT NULL,
  `psa` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `proof` varchar(255) NOT NULL,
  `erf` varchar(255) NOT NULL,
  `records` varchar(255) NOT NULL,
  `ornumber` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `feetype` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `totalprice` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `payable_fee` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_enrollment_schedule`
--

CREATE TABLE `uccp_enrollment_schedule` (
  `id` int NOT NULL,
  `status` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_enrollment_schedule`
--

INSERT INTO `uccp_enrollment_schedule` (`id`, `status`, `schoolyear`, `sem`) VALUES
(68, 'Closed', '2022-2023', '2nd'),
(69, 'Closed', '2023-2024', '2nd'),
(70, 'Closed', '2024-2025', '2nd'),
(71, 'Closed', '2025-2026', '2nd'),
(76, 'Closed', '2026-2027', '2nd'),
(77, 'Closed', '2027-2028', '2nd'),
(78, 'Closed', '2028-2029', '2nd'),
(79, 'Closed', '2029-2030', '2nd'),
(80, 'Closed', '2030-2031', '2nd'),
(81, 'Closed', '2031-2032', '2nd'),
(82, 'Closed', '2032-2033', '2nd'),
(83, 'Closed', '2033-2034', '2nd'),
(84, 'Open', '2034-2035', '1st');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_eval`
--

CREATE TABLE `uccp_eval` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `diploma` varchar(255) NOT NULL,
  `goodmoral` varchar(255) NOT NULL,
  `psa` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `proof` varchar(255) NOT NULL,
  `erf` varchar(255) NOT NULL,
  `records` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_eval`
--

INSERT INTO `uccp_eval` (`id`, `name`, `gender`, `birthday`, `email`, `phone`, `course`, `year`, `section`, `schoolyear`, `sem`, `picture`, `diploma`, `goodmoral`, `psa`, `card`, `proof`, `erf`, `records`, `status`, `remarks`, `username`, `password`, `account_type`) VALUES
(355, 'Angelo Charles Perlota', 'Male', '2001-12-26', 'angeloperlota38@gmail.com', '09742145847', 'BSCS', '1st Year', 'BSCS-1A', '2022-2023', '1st', '1685063891491Screenshot 2023-04-06 130916.png', '5055191674474Screenshot 2023-04-06 123750.png', '6740255565966Screenshot 2023-04-06 130916.png', '3370127782983Screenshot 2023-04-06 125026.png', '8425319457458Screenshot 2023-04-06 123750.png', '10110383348949Screenshot 2023-04-06 123750.png', '', '', '', 'PASSED', 'angeloperlota38@gmail.com', 'AngeloCharlesPerlota', '1'),
(356, 'Angelo Charles Perlota', 'Male', '2001-12-26', 'Caloocan City', '09742145847', 'BSCS', '1st Year', 'BSCS-1A', '2022-2023', '2nd', '1685063891491Screenshot 2023-04-06 130916.png', '5055191674474Screenshot 2023-04-06 123750.png', '6740255565966Screenshot 2023-04-06 130916.png', '3370127782983Screenshot 2023-04-06 125026.png', '8425319457458Screenshot 2023-04-06 123750.png', '10110383348949Screenshot 2023-04-06 123750.png', '1685064519982Screenshot 2023-04-06 125026.png', '5055193559946Screenshot 2023-04-06 142538.png', '', 'PASSED', '', '', ''),
(357, 'Jiro Allen Ibia', 'Male', '2023-05-26', 'jiroallen@gmail.com', '1456647646', 'BSCS', '1st Year', 'BSCS-1A', '2023-2024', '1st', '1685065612418Screenshot 2023-04-06 125026.png', '5055196837256Screenshot 2023-04-06 142542.png', '6740262449675Screenshot 2023-04-06 142542.png', '3370131224837Screenshot 2023-04-06 142542.png', '8425328062094Screenshot 2023-04-06 142449.png', '10110393674513Screenshot 2023-04-06 125026.png', '', '', '', 'PASSED', 'jiroallen@gmail.com', 'JiroAllenIbia', '1'),
(358, 'Jiro Allen Ibia', 'Male', '2023-05-26', '1', '1456647646', 'BSCS', '1st Year', 'BSCS-1A', '2023-2024', '2nd', '1685065612418Screenshot 2023-04-06 125026.png', '5055196837256Screenshot 2023-04-06 142542.png', '6740262449675Screenshot 2023-04-06 142542.png', '3370131224837Screenshot 2023-04-06 142542.png', '8425328062094Screenshot 2023-04-06 142449.png', '10110393674513Screenshot 2023-04-06 125026.png', '1685066261159Screenshot 2023-04-06 142542.png', '5055198783477Screenshot 2023-04-06 130916.png', '', 'PASSED', '', '', ''),
(359, 'Deborah Faith Hernandez Baile', 'Female', '2003-12-12', 'faith17baile@gmail.com', '09123456789', 'BSCS', '1st Year', 'BSCS-1A', '2024-2025', '1st', '1685067519410Screenshot 2023-04-06 142538.png', '5055202558231Screenshot 2023-04-06 142542.png', '6740270077641Screenshot 2023-04-06 125026.png', '3370135038820Screenshot 2023-04-06 142538.png', '8425337597052Screenshot 2023-04-06 142428.png', '10110405116462Screenshot 2023-04-06 142542.png', '', '', '', 'PASSED', 'faith17baile@gmail.com', 'DeborahFaithHernandezBaile', '1'),
(360, 'Deborah Faith Hernandez Baile', 'Female', '2003-12-12', 'sa tabi lang caloocan city', '09123456789', 'BSCS', '1st Year', 'BSCS-1A', '2024-2025', '2nd', '1685067519410Screenshot 2023-04-06 142538.png', '5055202558231Screenshot 2023-04-06 142542.png', '6740270077641Screenshot 2023-04-06 125026.png', '3370135038820Screenshot 2023-04-06 142538.png', '8425337597052Screenshot 2023-04-06 142428.png', '10110405116462Screenshot 2023-04-06 142542.png', '1685067955220Screenshot 2023-04-06 130916.png', '5055203865662Screenshot 2023-04-06 130916.png', '', 'PASSED', '', '', ''),
(361, '1 1 1', 'Male', '2023-05-26', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2025-2026', '1st', '1685069146891Screenshot 2023-04-06 130916.png', '5055207440673Screenshot 2023-04-06 130916.png', '6740276587564Screenshot 2023-04-06 130916.png', '3370138293782Screenshot 2023-04-06 125026.png', '8425345734455Screenshot 2023-04-06 130916.png', '10110414881346Screenshot 2023-04-06 125026.png', '', '', '', 'F', '1', '111', '1'),
(362, '1 1 1', 'Male', '2023-05-26', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2025-2026', '2nd', '1685069146891Screenshot 2023-04-06 130916.png', '5055207440673Screenshot 2023-04-06 130916.png', '6740276587564Screenshot 2023-04-06 130916.png', '3370138293782Screenshot 2023-04-06 125026.png', '8425345734455Screenshot 2023-04-06 130916.png', '10110414881346Screenshot 2023-04-06 125026.png', '1685069537517Screenshot 2023-04-06 142542.png', '5055208612551Screenshot 2023-04-06 130916.png', '', 'PASSED', '', '', ''),
(363, '3 3 3', 'Male', '2023-05-26', '3', '3', 'BSCS', '1st Year', 'BSCS-1A', '2026-2027', '1st', '1685070291813Screenshot 2023-04-06 130916.png', '5055210875441Screenshot 2023-04-06 125026.png', '6740281167255Screenshot 2023-04-06 123750.png', '3370140583627Screenshot 2023-04-06 123750.png', '8425351459068Screenshot 2023-04-06 125026.png', '10110421750882Screenshot 2023-04-06 123750.png', '', '', '', 'PASSED', '3', '333', '1'),
(364, '3 3 3', 'Male', '2023-05-26', '3', '3', 'BSCS', '1st Year', 'BSCS-1A', '2026-2027', '2nd', '1685070291813Screenshot 2023-04-06 130916.png', '5055210875441Screenshot 2023-04-06 125026.png', '6740281167255Screenshot 2023-04-06 123750.png', '3370140583627Screenshot 2023-04-06 123750.png', '8425351459068Screenshot 2023-04-06 125026.png', '10110421750882Screenshot 2023-04-06 123750.png', '1685070827734Screenshot 2023-04-06 130916.png', '5055212483202Screenshot 2023-04-06 130916.png', '', 'PASSED', '', '', ''),
(365, '5 5 5', 'Male', '2023-05-26', '5', '5', 'BSCS', '1st Year', 'BSCS-1A', '2027-2028', '1st', '1685071623438Screenshot 2023-04-06 125026.png', '5055214870315Screenshot 2023-04-06 125026.png', '6740286493753Screenshot 2023-04-06 125026.png', '3370143246876Screenshot 2023-04-06 125026.png', '8425358117192Screenshot 2023-04-06 125026.png', '10110429740630Screenshot 2023-04-06 125026.png', '', '', '', 'PASSED', '5', '555', '1'),
(366, '5 5 5', 'Male', '2023-05-26', '5', '5', 'BSCS', '1st Year', 'BSCS-1A', '2027-2028', '2nd', '1685071623438Screenshot 2023-04-06 125026.png', '5055214870315Screenshot 2023-04-06 125026.png', '6740286493753Screenshot 2023-04-06 125026.png', '3370143246876Screenshot 2023-04-06 125026.png', '8425358117192Screenshot 2023-04-06 125026.png', '10110429740630Screenshot 2023-04-06 125026.png', '1685071878896Screenshot 2023-04-06 130916.png', '5055215636689Screenshot 2023-04-06 125026.png', '', 'PASSED', '', '', ''),
(367, '7 7 7', 'Male', '2023-05-26', '7', '7', 'BSCS', '1st Year', 'BSCS-1A', '2028-2029', '1st', '1685073023046Screenshot 2023-04-06 142542.png', '5055219069139Screenshot 2023-04-06 142542.png', '6740292092185Screenshot 2023-04-06 142542.png', '3370146046092Screenshot 2023-04-06 142542.png', '8425365115232Screenshot 2023-04-06 142542.png', '10110438138278Screenshot 2023-04-06 142712.png', '', '', '', 'PASSED', '7', '777', '1'),
(368, '7 7 7', 'Male', '2023-05-26', '7', '7', 'BSCS', '1st Year', 'BSCS-1A', '2028-2029', '2nd', '1685073023046Screenshot 2023-04-06 142542.png', '5055219069139Screenshot 2023-04-06 142542.png', '6740292092185Screenshot 2023-04-06 142542.png', '3370146046092Screenshot 2023-04-06 142542.png', '8425365115232Screenshot 2023-04-06 142542.png', '10110438138278Screenshot 2023-04-06 142712.png', '1685073239913Screenshot 2023-04-06 142538.png', '5055219719739Screenshot 2023-04-06 142538.png', '', 'PASSED', '', '', ''),
(369, 'Jiro Allen Olit Ibia', 'Male', '2002-03-04', 'ibiajiro@gmail.com', '09351501163', 'BSCS', '1st Year', 'BSCS-1A', '2029-2030', '1st', '1685076356819Screenshot 2023-04-06 130916.png', '5055229070459Screenshot 2023-04-06 125026.png', '6740305427279Screenshot 2023-04-06 142542.png', '3370152713639Screenshot 2023-04-06 142449.png', '8425381784099Screenshot 2023-04-06 142449.png', '10110458140919Screenshot 2023-04-06 123750.png', '', '', '', 'PASSED', 'ibiajiro@gmail.com', 'JiroAllenOlitIbia', '1'),
(370, 'Jiro Allen Olit Ibia', 'Male', '2002-03-04', 'Navotas City', '09351501163', 'BSCS', '1st Year', 'BSCS-1A', '2029-2030', '2nd', '1685076356819Screenshot 2023-04-06 130916.png', '5055229070459Screenshot 2023-04-06 125026.png', '6740305427279Screenshot 2023-04-06 142542.png', '3370152713639Screenshot 2023-04-06 142449.png', '8425381784099Screenshot 2023-04-06 142449.png', '10110458140919Screenshot 2023-04-06 123750.png', '1685077066302Screenshot 2023-04-06 142542.png', '5055231198906Screenshot 2023-04-06 142542.png', '', 'PASSED', '', '', ''),
(371, 'q q q', 'Male', '2023-05-26', 'q', '1', 'BSCS', '1st Year', 'BSCS-1A', '2030-2031', '1st', '1685077802752Screenshot 2023-04-06 142538.png', '5055233408256Screenshot 2023-04-06 142542.png', '6740311211009Screenshot 2023-04-06 142542.png', '3370155605504Screenshot 2023-04-06 142538.png', '8425389013761Screenshot 2023-04-06 142538.png', '10110466816513Screenshot 2023-04-06 142538.png', '', '', '', 'PASSED', 'q', 'qqq', '1'),
(372, 'q q q', 'Male', '2023-05-26', 'q', '1', 'BSCS', '1st Year', 'BSCS-2A', '2030-2031', '2nd', '1685077802752Screenshot 2023-04-06 142538.png', '5055233408256Screenshot 2023-04-06 142542.png', '6740311211009Screenshot 2023-04-06 142542.png', '3370155605504Screenshot 2023-04-06 142538.png', '8425389013761Screenshot 2023-04-06 142538.png', '10110466816513Screenshot 2023-04-06 142538.png', '1685078625892Screenshot 2023-04-06 123750.png', '5055235877676Screenshot 2023-04-06 123750.png', '', 'PASSED', '', '', ''),
(373, '1 1 1', 'Male', '2023-05-26', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2031-2032', '1st', '1685082702255Screenshot 2023-04-06 123750.png', '5055248106766Screenshot 2023-04-06 125026.png', '6740330809021Screenshot 2023-04-06 123750.png', '3370165404510Screenshot 2023-04-06 125026.png', '8425413511277Screenshot 2023-04-06 125026.png', '10110496213532Screenshot 2023-04-06 125026.png', '', '', '', 'PASSED', '1', '111', '1'),
(374, '1 1 1', 'Male', '2023-05-26', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2031-2032', '2nd', '1685082702255Screenshot 2023-04-06 123750.png', '5055248106766Screenshot 2023-04-06 125026.png', '6740330809021Screenshot 2023-04-06 123750.png', '3370165404510Screenshot 2023-04-06 125026.png', '8425413511277Screenshot 2023-04-06 125026.png', '10110496213532Screenshot 2023-04-06 125026.png', '1685083006413Screenshot 2023-04-06 130916.png', '5055249019240Screenshot 2023-04-06 123750.png', '', 'PASSED', '', '', ''),
(375, '2 2 2', 'Male', '2023-05-26', '2', '2', 'BSCS', '1st Year', 'BSCS-1A', '2032-2033', '1st', '1685085266220Screenshot 2023-04-06 123750.png', '5055255798660Screenshot 2023-04-06 123750.png', '6740341064881Screenshot 2023-04-06 130916.png', '3370170532440Screenshot 2023-04-06 125026.png', '8425426331101Screenshot 2023-04-06 123750.png', '10110511597321Screenshot 2023-04-06 130916.png', '', '', '', 'PASSED', '2', '222', '1'),
(376, '2 2 2', 'Male', '2023-05-26', '2', '2', 'BSCS', '1st Year', 'BSCS-1A', '2032-2033', '2nd', '1685085266220Screenshot 2023-04-06 123750.png', '5055255798660Screenshot 2023-04-06 123750.png', '6740341064881Screenshot 2023-04-06 130916.png', '3370170532440Screenshot 2023-04-06 125026.png', '8425426331101Screenshot 2023-04-06 123750.png', '10110511597321Screenshot 2023-04-06 130916.png', '1685085566957Screenshot 2023-04-06 123750.png', '5055256700873Screenshot 2023-04-06 123750.png', '', 'PASSED', '', '', ''),
(377, 'Christian Barcheta Espinoza', 'Male', '2002-01-05', 'espinoza.christian.bscs2022@gmail.com', '09926870934', 'BSCS', '1st Year', 'BSCS-1A', '2033-2034', '1st', '1685092495812Screenshot 2023-04-06 123750.png', '5055277487438Screenshot 2023-04-06 125026.png', '6740369983251Screenshot 2023-04-06 130916.png', '3370184991625Screenshot 2023-04-06 142449.png', '8425462479064Screenshot 2023-04-06 142428.png', '10110554974877Screenshot 2023-04-06 142542.png', '', '', '', '', 'espinoza.christian.bscs2022@gmail.com', 'ChristianBarchetaEspinoza', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_examinees`
--

CREATE TABLE `uccp_examinees` (
  `id` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Birthday` date NOT NULL,
  `Birthplace` varchar(255) NOT NULL,
  `Number` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Guardian` varchar(255) NOT NULL,
  `G-Occupation` varchar(255) NOT NULL,
  `G-Contact` varchar(255) NOT NULL,
  `G-Adress` varchar(255) NOT NULL,
  `Primary` varchar(255) NOT NULL,
  `Primary-Sy` varchar(255) NOT NULL,
  `Highschool` varchar(255) NOT NULL,
  `Highschool-Sy` varchar(255) NOT NULL,
  `Shs` varchar(255) NOT NULL,
  `Shs-Sy` varchar(255) NOT NULL,
  `Firstchoice` varchar(255) NOT NULL,
  `Requirements` varchar(255) NOT NULL,
  `Picture` varchar(255) NOT NULL,
  `Proof` varchar(255) NOT NULL,
  `Card` varchar(255) NOT NULL,
  `Schoolyear` varchar(255) NOT NULL COMMENT 'what year they admitted',
  `batch` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `gwarange` varchar(255) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `room` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `syexisting` varchar(255) NOT NULL COMMENT 'schoolyear assigned based on what''s opened',
  `schedid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_examsched`
--

CREATE TABLE `uccp_examsched` (
  `id` int NOT NULL,
  `batch` int NOT NULL,
  `category` varchar(255) NOT NULL,
  `gwarange` int NOT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `room` varchar(255) NOT NULL,
  `syexisting` varchar(255) NOT NULL,
  `size` int NOT NULL,
  `usercount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_examsched`
--

INSERT INTO `uccp_examsched` (`id`, `batch`, `category`, `gwarange`, `schedule`, `room`, `syexisting`, `size`, `usercount`) VALUES
(44, 1, 'A', 90, '2023-05-25', '1', '2022-2023', 25, 5),
(45, 1, 'A', 90, '2023-05-27', '1', '2023-2024', 25, 3),
(46, 1, 'b', 86, '2023-05-26', '1', '2023-2024', 25, 1),
(47, 1, 'B', 85, '2023-05-27', '3', '2022-2023', 25, 1),
(48, 1, 'A', 90, '2023-05-26', '3', '2024-2025', 25, 1),
(49, 1, 'A', 90, '2023-05-26', '1', '2025-2026', 25, 1),
(50, 1, 'A', 90, '2023-05-26', '1', '2026-2027', 25, 1),
(51, 1, '1', 90, '2023-05-26', '1', '2027-2028', 25, 1),
(52, 1, 'a', 90, '2023-05-26', '1', '2028-2029', 25, 1),
(53, 1, 'For Month of May', 90, '2023-05-26', 'CL 1', '2029-2030', 10, 1),
(54, 1, 'A', 90, '2023-05-26', '1', '2030-2031', 25, 1),
(55, 1, '1', 90, '2023-05-26', '1', '2031-2032', 25, 1),
(56, 1, 'Month of May', 90, '2023-05-27', 'CL 1', '2032-2033', 20, 1),
(57, 1, 'a', 1, '2023-05-28', '67', '2033-2034', 1, 1),
(58, 2, 'b', 1, '2023-05-29', '12', '', 1, 0),
(59, 1, 'a', 90, '2023-02-05', 'CL1', '2034-2035', 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uccp_grading`
--

CREATE TABLE `uccp_grading` (
  `id` int NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `courseyearsection` varchar(255) NOT NULL,
  `subjectcode` varchar(255) NOT NULL,
  `midterm` double NOT NULL,
  `finals` double NOT NULL,
  `average` double NOT NULL,
  `remarks` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_gradingsystem_tbl`
--

CREATE TABLE `uccp_gradingsystem_tbl` (
  `id` int NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `course` varchar(191) NOT NULL,
  `midterm` float NOT NULL,
  `finalterm` float NOT NULL,
  `average` float NOT NULL,
  `remarks` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_ht_tbl`
--

CREATE TABLE `uccp_ht_tbl` (
  `id` int NOT NULL,
  `ht_title` varchar(60) NOT NULL,
  `ht_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_ht_tbl`
--

INSERT INTO `uccp_ht_tbl` (`id`, `ht_title`, `ht_image`) VALUES
(27, 'Enrollment 2022', '644178eb36507.jpg'),
(28, 'Admission 2022', '644178bb608a8.jpg'),
(29, 'UCC Portal', '644176d1a2fb2.png');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_irregular`
--

CREATE TABLE `uccp_irregular` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `Subcode` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Sem` varchar(255) NOT NULL,
  `Units` varchar(255) NOT NULL,
  `StartTime` varchar(255) NOT NULL,
  `EndTime` varchar(255) NOT NULL,
  `Professor` varchar(255) NOT NULL,
  `Day` varchar(255) NOT NULL,
  `Room` varchar(255) NOT NULL,
  `is_passed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_login`
--

CREATE TABLE `uccp_login` (
  `id` int NOT NULL,
  `Username` varchar(300) NOT NULL,
  `Email` varchar(300) NOT NULL,
  `Usertype` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_login`
--

INSERT INTO `uccp_login` (`id`, `Username`, `Email`, `Usertype`, `Password`, `otp`) VALUES
(1, 'registrar', 'registrar@gmail.com', '3', 'registrar', ''),
(2, 'accounting', 'accounting@gmail.com', '4', 'accounting', ''),
(3, 'deans', 'dean@gmail.com', '5', 'deans', ''),
(4, 'admin', 'admin@gmail.com', '6', 'admin', ''),
(57, 'arnoldvillanueva@gmail.com', 'arnoldvillanueva@gmail.com', '2', 'Arnold  Villanueva', ''),
(58, 'gmail@test.com', 'gmail@test.com', '2', 'Erick Erick Castillo ', ''),
(59, 'aldrinvillanueva@gmail.com', 'aldrinvillanueva@gmail.com', '2', 'Aldrin  Villanueva', ''),
(60, 'efrenvictoria@gmail.com', 'efrenvictoria@gmail.com', '2', 'Efren  Victoria', ''),
(61, 'test@gmail.com', 'test@gmail.com', '2', 'Roman Roman Villiones', ''),
(62, 'ejhaymarcelino', 'ejhaymarcelino', '2', 'Ejhay  Marcelino', ''),
(521, 'angeloperlota38@gmail.com', 'angeloperlota38@gmail.com', '1', 'AngeloCharlesPerlota', ''),
(522, 'jiroallen@gmail.com', 'jiroallen@gmail.com', '1', 'JiroAllenIbia', ''),
(523, 'faith17baile@gmail.com', 'faith17baile@gmail.com', '1', 'DeborahFaithHernandezBaile', ''),
(524, '1', '1', '1', '111', ''),
(525, '3', '3', '1', '333', ''),
(526, '5', '5', '1', '555', ''),
(527, '7', '7', '1', '777', ''),
(528, 'ibiajiro@gmail.com', 'ibiajiro@gmail.com', '1', 'JiroAllenOlitIbia', ''),
(529, 'q', 'q', '1', 'qqq', ''),
(530, '1', '1', '1', '111', ''),
(531, '2', '2', '1', '222', ''),
(532, 'espinoza.christian.bscs2022@gmail.com', 'espinoza.christian.bscs2022@gmail.com', '1', 'ChristianBarchetaEspinoza', '');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_masterlist`
--

CREATE TABLE `uccp_masterlist` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `diploma` varchar(255) NOT NULL,
  `goodmoral` varchar(255) NOT NULL,
  `psa` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `proof` varchar(255) NOT NULL,
  `erf` varchar(255) NOT NULL,
  `records` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uccp_news_tbl`
--

CREATE TABLE `uccp_news_tbl` (
  `id` int NOT NULL,
  `author` varchar(60) NOT NULL,
  `title` varchar(60) NOT NULL,
  `body` mediumtext NOT NULL,
  `imgdir` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_news_tbl`
--

INSERT INTO `uccp_news_tbl` (`id`, `author`, `title`, `body`, `imgdir`) VALUES
(207, 'Jiro Allen Ibia', 'London\'s Best Pubs', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '646d7d6014651.jpg'),
(208, 'Angelo Charles Perlota', 'Why Beers are Healthy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '64417bca956a5.jpg'),
(209, 'Clarence Espejo', 'DEC-SERVE-MOTO', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Massa ultricies mi quis hendrerit dolor magna eget. Ut consequat semper viverra nam libero justo laoreet sit amet. At in tellus integer feugiat scelerisque varius. Enim diam vulputate ut pharetra. Viverra maecenas accumsan lacus vel facilisis volutpat est velit. Sit amet nisl suscipit adipiscing bibendum est ultricies integer quis. Egestas sed tempus urna et. Consequat mauris nunc congue nisi vitae suscipit tellus mauris. Semper risus in hendrerit gravida rutrum quisque non. Risus viverra adipiscing at in tellus integer feugiat scelerisque varius.\r\n\r\nDapibus ultrices in iaculis nunc sed. Id semper risus in hendrerit gravida rutrum. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam etiam. Vitae elementum curabitur vitae nunc sed velit. Sit amet consectetur adipiscing elit pellentesque. Duis tristique sollicitudin nibh sit. Enim neque volutpat ac tincidunt vitae. Fusce id velit ut tortor pretium. Sed vulputate mi sit amet mauris commodo. Imperdiet sed euismod nisi porta lorem. Odio pellentesque diam volutpat commodo sed egestas. Dis parturient montes nascetur ridiculus mus. Euismod nisi porta lorem mollis aliquam ut porttitor leo. Egestas pretium aenean pharetra magna.\r\n\r\nQuis ipsum suspendisse ultrices gravida dictum fusce ut. Facilisis leo vel fringilla est ullamcorper eget nulla facilisi. Ac feugiat sed lectus vestibulum mattis. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus. Tellus elementum sagittis vitae et. Duis convallis convallis tellus id interdum. Vulputate dignissim suspendisse in est. Sed adipiscing diam donec adipiscing tristique risus nec. Tellus elementum sagittis vitae et leo duis ut. At erat pellentesque adipiscing commodo elit at imperdiet. Faucibus ornare suspendisse sed nisi lacus sed viverra. Vel facilisis volutpat est velit egestas dui id ornare. Orci ac auctor augue mauris augue neque gravida in fermentum.\r\n\r\nFelis eget nunc lobortis mattis aliquam faucibus. Vulputate ut pharetra sit amet aliquam id diam maecenas ultricies. Magna fermentum iaculis eu non. At ultrices mi tempus imperdiet nulla malesuada pellentesque elit. In cursus turpis massa tincidunt dui ut ornare lectus sit. Nisl vel pretium lectus quam id leo in. Enim lobortis scelerisque fermentum dui. Ut consequat semper viverra nam. Mi bibendum neque egestas congue quisque egestas diam in arcu. Nulla aliquet porttitor lacus luctus. Sed elementum tempus egestas sed sed risus. Tempor commodo ullamcorper a lacus vestibulum sed. At volutpat diam ut venenatis tellus in metus. Pellentesque sit amet porttitor eget dolor morbi non arcu. Commodo viverra maecenas accumsan lacus vel facilisis. Enim neque volutpat ac tincidunt. Tincidunt vitae semper quis lectus nulla at volutpat. Volutpat ac tincidunt vitae semper quis lectus nulla at.\r\n\r\nA cras semper auctor neque vitae tempus quam. Sit amet aliquam id diam maecenas ultricies mi eget. Tristique magna sit amet purus gravida quis blandit turpis. Sit amet porttitor eget dolor morbi non arcu risus quis. Egestas diam in arcu cursus euismod quis viverra. Condimentum lacinia quis vel eros donec. Faucibus vitae aliquet nec ullamcorper sit amet. Ac orci phasellus egestas tellus rutrum tellus pellentesque eu. Ut ornare lectus sit amet est placerat in egestas erat. Parturient montes nascetur ridiculus mus mauris vitae. Pellentesque habitant morbi tristique senectus et. Ullamcorper malesuada proin libero nunc consequat interdum.\r\n\r\nDictumst quisque sagittis purus sit amet volutpat consequat mauris nunc. Justo eget magna fermentum iaculis. Nascetur ridiculus mus mauris vitae ultricies. Maecenas volutpat blandit aliquam etiam erat velit scelerisque. Consequat ac felis donec et odio pellentesque diam. Non consectetur a erat nam at lectus urna duis. Quam pellentesque nec nam aliquam sem et tortor consequat id. Aliquam ut porttitor leo a diam sollicitudin. Penatibus et magnis dis parturient montes nascetur ridiculus. Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis. Amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus. Eu sem integer vitae justo eget magna fermentum.', '64417bd398900.jpg'),
(213, 'John Maverick Clemente', 'Top Best Country in the World', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '64417be9899b5.jpg'),
(214, 'Jiro Ibia', 'Exhibit A', 'Lorem Ipsum ', '64704eef5fdb1.png'),
(215, 'Jaja', 'Bscs Exhibit', 'Room 1 Third Floor', '647079108650b.png');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_passers`
--

CREATE TABLE `uccp_passers` (
  `id` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Birthday` date NOT NULL,
  `Birthplace` varchar(255) NOT NULL,
  `Number` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Guardian` varchar(255) NOT NULL,
  `G-Occupation` varchar(255) NOT NULL,
  `G-Contact` varchar(255) NOT NULL,
  `G-Adress` varchar(255) NOT NULL,
  `Primary` varchar(255) NOT NULL,
  `Primary-Sy` varchar(255) NOT NULL,
  `Highschool` varchar(255) NOT NULL,
  `Highschool-Sy` varchar(255) NOT NULL,
  `Shs` varchar(255) NOT NULL,
  `Shs-Sy` varchar(255) NOT NULL,
  `Firstchoice` varchar(255) NOT NULL,
  `Requirements` varchar(255) NOT NULL,
  `Picture` varchar(255) NOT NULL,
  `Proof` varchar(255) NOT NULL,
  `Card` varchar(255) NOT NULL,
  `Schoolyear` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_passers`
--

INSERT INTO `uccp_passers` (`id`, `Name`, `Gender`, `Birthday`, `Birthplace`, `Number`, `Email`, `Address`, `Guardian`, `G-Occupation`, `G-Contact`, `G-Adress`, `Primary`, `Primary-Sy`, `Highschool`, `Highschool-Sy`, `Shs`, `Shs-Sy`, `Firstchoice`, `Requirements`, `Picture`, `Proof`, `Card`, `Schoolyear`) VALUES
(595, 'Angelo Charles Perlota', 'Male', '2001-12-26', 'Manila', '09472003653', 'angeloperlota38@gmail.com', 'Caloocan city', '1', '1', '1', '1', '1', '1', '1', '11', '1', '1', 'BSCS', '1685063541881Screenshot 2023-04-06 125026.png', '5055190625644Screenshot 2023-04-06 125026.png', '6740254167526Screenshot 2023-04-06 125026.png', '3370127083763Screenshot 2023-04-06 125026.png', '2022-2023'),
(596, 'jiro allen Ibia', 'Male', '2023-05-26', 'manila', '1', 'jiroallen@gmail.com', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'BSCS', '1685065261150Screenshot 2023-04-06 130916.png', '5055195783452Screenshot 2023-04-06 130916.png', '6740261044603Screenshot 2023-04-06 130916.png', '3370130522301Screenshot 2023-04-06 130916.png', '2023-2024'),
(597, 'Deborah Faith Hernandez Baile', 'Female', '2003-12-12', 'Caloocan City', '09474959613', 'faith17baile@gmail.com', 'Dyan lang Caloocan City', 'Shinichi kudo', 'Taga walis', '09123456789', 'Dyan lang Malabon City', 'UCC', '2001-2002', 'DYanlang', '3423', 'UES', '1111', 'BSCS', '1685067108054Screenshot 2023-04-06 142449.png', '5055201324162Screenshot 2023-04-06 142449.png', '6740268432216Screenshot 2023-04-06 142449.png', '3370134216108Screenshot 2023-04-06 142542.png', '2024-2025'),
(598, '1 1 1', 'Male', '2023-05-26', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'BSCS', '1685068975186Screenshot 2023-04-06 130916.png', '5055206925558Screenshot 2023-04-06 130916.png', '6740275900744Screenshot 2023-04-06 130916.png', '3370137950372Screenshot 2023-04-06 130916.png', '2025-2026'),
(599, '3 3 3', 'Male', '2023-05-26', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', 'BSCS', '1685070048144Screenshot 2023-04-06 130916.png', '5055210144434Screenshot 2023-04-06 130916.png', '6740280192579Screenshot 2023-04-06 130916.png', '3370140096289Screenshot 2023-04-06 130916.png', '2026-2027'),
(600, '5 5 5', 'Male', '2023-05-26', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', 'BSCS', '1685071394394Screenshot 2023-04-06 130916.png', '5055214183183Screenshot 2023-04-06 125026.png', '6740285577578Screenshot 2023-04-06 130916.png', '3370142788789Screenshot 2023-04-06 125026.png', '2027-2028'),
(601, '7 7 7', 'Male', '2023-05-26', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', '7', 'BSCS', '1685072866635Screenshot 2023-04-06 142542.png', '5055218599907Screenshot 2023-04-06 142542.png', '6740291466543Screenshot 2023-04-06 130916.png', '3370145733271Screenshot 2023-04-06 142542.png', '2028-2029'),
(602, 'Jiro Allen Olit Ibia', 'Male', '2002-04-30', 'Manila', '09351501163', 'ibiajiro@gmail.com', 'Navotas City', 'Lorem', 'Ipsum', '09798533542', 'Navotas City', 'Kaunlaran Elementary School', '2007 - 2013', 'Caloocan High School', '2014 - 2018', 'Caloocan High School', '2018 - 2020', 'BSCS', '1685075327627Screenshot 2023-04-06 130721.png', '5055225982881Screenshot 2023-04-06 142449.png', '6740301310508Screenshot 2023-04-06 142538.png', '3370150655254Screenshot 2023-04-06 130916.png', '2029-2030'),
(603, 'q q q', 'Male', '2023-05-26', 'q', '1', 'q', 'q', 'q', 'q', '1', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'BSCS', '1685077544417Screenshot 2023-04-06 130916.png', '5055232633251Screenshot 2023-04-06 130916.png', '6740310177668Screenshot 2023-04-06 130916.png', '3370155088834Screenshot 2023-04-06 130916.png', '2030-2031'),
(604, '1 1 1', 'Male', '2023-05-26', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 'BSCS', '1685082100985Screenshot 2023-04-06 130721.png', '5055246302955Screenshot 2023-04-06 125026.png', '6740328403940Screenshot 2023-04-06 125026.png', '3370164201970Screenshot 2023-04-06 125026.png', '2031-2032'),
(605, '2 2 2', 'Male', '2023-05-26', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', 'BSCS', '1685084727507Screenshot 2023-04-06 123750.png', '5055254182521Screenshot 2023-04-06 123750.png', '6740338910029Screenshot 2023-04-06 123750.png', '3370169455014Screenshot 2023-04-06 123750.png', '2032-2033'),
(606, 'Christian Barcheta Espinoza', 'Male', '2002-01-05', 'Caloocan City', '09926870934', 'espinoza.christian.bscs2022@gmail.com', '109 Gonzales St', 'sadas', 'asdas', '231231', 'asdas', 'asdas', '3213', 'asdas', '232', 'asdas', '231', 'BSCS', '1685091536713Screenshot 2023-04-06 123750.png', '5055274610139Screenshot 2023-04-06 123750.png', '6740366146852Screenshot 2023-04-06 142449.png', '3370183073426Screenshot 2023-04-06 125026.png', '2033-2034'),
(607, 'z z z', 'Male', '2023-05-26', 'z', '5', 'z', 'z', 'z', 'z', '11', 'z', 'z', 'z', 'z', 'z', 'zz', 'z', 'BSCS', '1685093547490Screenshot 2023-04-06 130916.png', '5055280642471Screenshot 2023-04-06 130916.png', '6740374189961Screenshot 2023-04-06 130916.png', '3370187094980Screenshot 2023-04-06 130916.png', '2034-2035');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_professor`
--

CREATE TABLE `uccp_professor` (
  `id` int NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `faculty` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_professor`
--

INSERT INTO `uccp_professor` (`id`, `fullname`, `address`, `email`, `gender`, `contact`, `faculty`, `account_type`, `username`, `password`) VALUES
(57, 'Arnold  Samson', 'UCC', 'arnoldsamson@gmail.com', 'Male', '123', 'CSD', '2', 'arnoldvillanueva@gmail.com', 'Arnold  Villanueva'),
(58, 'Erick Castillo ', 'caloocan city', 'gmail@test.com', 'Male', '12313213', 'CSD', '2', 'gmail@test.com', 'Erick Erick Castillo '),
(59, 'Aldrin  Villanueva', 'Caloocan City', 'aldrinvillanueva@gmail.test', 'Male', '09346798514', 'CSD', '2', 'aldrinvillanueva@gmail.com', 'Aldrin  Villanueva'),
(60, 'Efren  Victoria', 'UCC', 'efrenvictoria@gmail.com', 'Male', '12345', 'CSD', '2', 'efrenvictoria@gmail.com', 'Efren  Victoria'),
(61, 'Roman Villiones', 'caloocan city', 'test@gmail.com', 'Male', '1231321311', 'CSD', '2', 'test@gmail.com', 'Roman Roman Villiones'),
(62, 'Ejhay  Marcelino', 'Caloocan City', 'ejhaymarcelino', 'Male', 'ejmarcelino@gmail.test', 'CSD', '2', 'ejhaymarcelino', 'Ejhay  Marcelino');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_sched`
--

CREATE TABLE `uccp_sched` (
  `id` int NOT NULL,
  `courseyearsection` varchar(255) NOT NULL,
  `subjectcode` varchar(255) NOT NULL,
  `subjectname` varchar(255) NOT NULL,
  `units` varchar(255) NOT NULL,
  `day` varchar(255) NOT NULL,
  `starttime` varchar(255) NOT NULL,
  `endtime` varchar(255) NOT NULL,
  `professor` varchar(255) NOT NULL,
  `room` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_sched`
--

INSERT INTO `uccp_sched` (`id`, `courseyearsection`, `subjectcode`, `subjectname`, `units`, `day`, `starttime`, `endtime`, `professor`, `room`) VALUES
(162, 'BSCS-2A', 'CCS 103', 'Intermediate Programming', '5', 'Monday', '1', '4', 'Arnold Samson', 'cl1'),
(163, 'BSCS-1A', 'GEC 001', 'Understanding the Self', '3', 'Monday', '1', '1', 'Efren Victoria', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_section`
--

CREATE TABLE `uccp_section` (
  `id` int NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `courseyearsection` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_section`
--

INSERT INTO `uccp_section` (`id`, `course`, `year`, `section`, `courseyearsection`) VALUES
(78, 'BSCS', '1st', 'A', 'BSCS-1A'),
(79, 'BSCS', '2nd', 'A', 'BSCS-2A');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_studentinfo`
--

CREATE TABLE `uccp_studentinfo` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `schoolyear` varchar(255) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `diploma` varchar(255) NOT NULL,
  `goodmoral` varchar(255) NOT NULL,
  `psa` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `proof` varchar(255) NOT NULL,
  `erf` varchar(255) NOT NULL,
  `records` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `account_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_studentinfo`
--

INSERT INTO `uccp_studentinfo` (`id`, `name`, `gender`, `birthday`, `email`, `phone`, `address`, `course`, `year`, `section`, `schoolyear`, `sem`, `picture`, `diploma`, `goodmoral`, `psa`, `card`, `proof`, `erf`, `records`, `status`, `remarks`, `username`, `password`, `account_type`) VALUES
(521, 'Angelo Charles Perlota', 'Male', '2001-12-26', 'angeloperlota38@gmail.com', '09742145847', 'Caloocan City', 'BSCS', '1st Year', 'BSCS-1A', '2022-2023', '2nd', '1685063891491Screenshot 2023-04-06 130916.png', '5055191674474Screenshot 2023-04-06 123750.png', '6740255565966Screenshot 2023-04-06 130916.png', '3370127782983Screenshot 2023-04-06 125026.png', '8425319457458Screenshot 2023-04-06 123750.png', '10110383348949Screenshot 2023-04-06 123750.png', '1685064519982Screenshot 2023-04-06 125026.png', '5055193559946Screenshot 2023-04-06 142538.png', '', 'Passed', 'angeloperlota38@gmail.com', 'AngeloCharlesPerlota', '1'),
(522, 'Jiro Allen Ibia', 'Male', '2023-05-26', 'jiroallen@gmail.com', '1456647646', '1', 'BSCS', '1st Year', 'BSCS-1A', '2023-2024', '2nd', '1685065612418Screenshot 2023-04-06 125026.png', '5055196837256Screenshot 2023-04-06 142542.png', '6740262449675Screenshot 2023-04-06 142542.png', '3370131224837Screenshot 2023-04-06 142542.png', '8425328062094Screenshot 2023-04-06 142449.png', '10110393674513Screenshot 2023-04-06 125026.png', '1685066261159Screenshot 2023-04-06 142542.png', '5055198783477Screenshot 2023-04-06 130916.png', '', 'Passed', 'jiroallen@gmail.com', 'JiroAllenIbia', '1'),
(523, 'Deborah Faith Hernandez Baile', 'Female', '2003-12-12', 'faith17baile@gmail.com', '09123456789', 'sa tabi lang caloocan city', 'BSCS', '1st Year', 'BSCS-1A', '2024-2025', '2nd', '1685067519410Screenshot 2023-04-06 142538.png', '5055202558231Screenshot 2023-04-06 142542.png', '6740270077641Screenshot 2023-04-06 125026.png', '3370135038820Screenshot 2023-04-06 142538.png', '8425337597052Screenshot 2023-04-06 142428.png', '10110405116462Screenshot 2023-04-06 142542.png', '1685067955220Screenshot 2023-04-06 130916.png', '5055203865662Screenshot 2023-04-06 130916.png', '', 'Passed', 'faith17baile@gmail.com', 'DeborahFaithHernandezBaile', '1'),
(524, '1 1 1', 'Male', '2023-05-26', '1', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2025-2026', '2nd', '1685069146891Screenshot 2023-04-06 130916.png', '5055207440673Screenshot 2023-04-06 130916.png', '6740276587564Screenshot 2023-04-06 130916.png', '3370138293782Screenshot 2023-04-06 125026.png', '8425345734455Screenshot 2023-04-06 130916.png', '10110414881346Screenshot 2023-04-06 125026.png', '1685069537517Screenshot 2023-04-06 142542.png', '5055208612551Screenshot 2023-04-06 130916.png', '', 'Passed', '1', '111', '1'),
(525, '3 3 3', 'Male', '2023-05-26', '3', '3', '3', 'BSCS', '1st Year', 'BSCS-1A', '2026-2027', '2nd', '1685070291813Screenshot 2023-04-06 130916.png', '5055210875441Screenshot 2023-04-06 125026.png', '6740281167255Screenshot 2023-04-06 123750.png', '3370140583627Screenshot 2023-04-06 123750.png', '8425351459068Screenshot 2023-04-06 125026.png', '10110421750882Screenshot 2023-04-06 123750.png', '1685070827734Screenshot 2023-04-06 130916.png', '5055212483202Screenshot 2023-04-06 130916.png', '', 'Passed', '3', '333', '1'),
(526, '5 5 5', 'Male', '2023-05-26', '5', '5', '5', 'BSCS', '1st Year', 'BSCS-1A', '2027-2028', '2nd', '1685071623438Screenshot 2023-04-06 125026.png', '5055214870315Screenshot 2023-04-06 125026.png', '6740286493753Screenshot 2023-04-06 125026.png', '3370143246876Screenshot 2023-04-06 125026.png', '8425358117192Screenshot 2023-04-06 125026.png', '10110429740630Screenshot 2023-04-06 125026.png', '1685071878896Screenshot 2023-04-06 130916.png', '5055215636689Screenshot 2023-04-06 125026.png', '', 'Passed', '5', '555', '1'),
(527, '7 7 7', 'Male', '2023-05-26', '7', '7', '7', 'BSCS', '1st Year', 'BSCS-1A', '2028-2029', '2nd', '1685073023046Screenshot 2023-04-06 142542.png', '5055219069139Screenshot 2023-04-06 142542.png', '6740292092185Screenshot 2023-04-06 142542.png', '3370146046092Screenshot 2023-04-06 142542.png', '8425365115232Screenshot 2023-04-06 142542.png', '10110438138278Screenshot 2023-04-06 142712.png', '1685073239913Screenshot 2023-04-06 142538.png', '5055219719739Screenshot 2023-04-06 142538.png', '', 'Passed', '7', '777', '1'),
(528, 'Jiro Allen Olit Ibia', 'Male', '2002-03-04', 'ibiajiro@gmail.com', '09351501163', 'Navotas City', 'BSCS', '1st Year', 'BSCS-1A', '2029-2030', '2nd', '1685076356819Screenshot 2023-04-06 130916.png', '5055229070459Screenshot 2023-04-06 125026.png', '6740305427279Screenshot 2023-04-06 142542.png', '3370152713639Screenshot 2023-04-06 142449.png', '8425381784099Screenshot 2023-04-06 142449.png', '10110458140919Screenshot 2023-04-06 123750.png', '1685077066302Screenshot 2023-04-06 142542.png', '5055231198906Screenshot 2023-04-06 142542.png', '', 'Passed', 'ibiajiro@gmail.com', 'JiroAllenOlitIbia', '1'),
(529, 'q q q', 'Male', '2023-05-26', 'q', '1', 'q', 'BSCS', '1st Year', 'BSCS-2A', '2030-2031', '2nd', '1685077802752Screenshot 2023-04-06 142538.png', '5055233408256Screenshot 2023-04-06 142542.png', '6740311211009Screenshot 2023-04-06 142542.png', '3370155605504Screenshot 2023-04-06 142538.png', '8425389013761Screenshot 2023-04-06 142538.png', '10110466816513Screenshot 2023-04-06 142538.png', '1685078625892Screenshot 2023-04-06 123750.png', '5055235877676Screenshot 2023-04-06 123750.png', '', 'Passed', 'q', 'qqq', '1'),
(530, '1 1 1', 'Male', '2023-05-26', '1', '1', '1', 'BSCS', '1st Year', 'BSCS-1A', '2031-2032', '2nd', '1685082702255Screenshot 2023-04-06 123750.png', '5055248106766Screenshot 2023-04-06 125026.png', '6740330809021Screenshot 2023-04-06 123750.png', '3370165404510Screenshot 2023-04-06 125026.png', '8425413511277Screenshot 2023-04-06 125026.png', '10110496213532Screenshot 2023-04-06 125026.png', '1685083006413Screenshot 2023-04-06 130916.png', '5055249019240Screenshot 2023-04-06 123750.png', '', 'Passed', '1', '111', '1'),
(531, '2 2 2', 'Male', '2023-05-26', '2', '2', '2', 'BSCS', '1st Year', 'BSCS-1A', '2032-2033', '2nd', '1685085266220Screenshot 2023-04-06 123750.png', '5055255798660Screenshot 2023-04-06 123750.png', '6740341064881Screenshot 2023-04-06 130916.png', '3370170532440Screenshot 2023-04-06 125026.png', '8425426331101Screenshot 2023-04-06 123750.png', '10110511597321Screenshot 2023-04-06 130916.png', '1685085566957Screenshot 2023-04-06 123750.png', '5055256700873Screenshot 2023-04-06 123750.png', '', 'Passed', '2', '222', '1'),
(532, 'Christian Barcheta Espinoza', 'Male', '2002-01-05', 'espinoza.christian.bscs2022@gmail.com', '09926870934', '109 Gonzales St.', 'BSCS', '1st Year', 'BSCS-1A', '2033-2034', '1st', '1685092495812Screenshot 2023-04-06 123750.png', '5055277487438Screenshot 2023-04-06 125026.png', '6740369983251Screenshot 2023-04-06 130916.png', '3370184991625Screenshot 2023-04-06 142449.png', '8425462479064Screenshot 2023-04-06 142428.png', '10110554974877Screenshot 2023-04-06 142542.png', '', '', '', '', 'espinoza.christian.bscs2022@gmail.com', 'ChristianBarchetaEspinoza', '1');

-- --------------------------------------------------------

--
-- Table structure for table `uccp_xo_tbl`
--

CREATE TABLE `uccp_xo_tbl` (
  `id` int NOT NULL COMMENT 'executive offices id',
  `xo_name` varchar(60) NOT NULL COMMENT 'executive offices name',
  `xo_position` varchar(60) NOT NULL COMMENT 'executive offices position',
  `xo_description` text NOT NULL COMMENT 'executive offices description',
  `xo_image` varchar(60) NOT NULL COMMENT 'executive offices image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `uccp_xo_tbl`
--

INSERT INTO `uccp_xo_tbl` (`id`, `xo_name`, `xo_position`, `xo_description`, `xo_image`) VALUES
(27, 'Marilyn T. De Jesus, DPA', 'OIC', 'University of Caloocan City', '64417f5e66ac5.png'),
(28, 'Dr. Wenald H. Lopez', 'Vice President for Administration', '', '64417f7a57ca2.png'),
(29, 'Atty. Roderick Vera', 'Vice President for Academics Affairs', 'Dean, College of Law', '64417fa279d72.png'),
(30, 'Dr. Melchor S. Julianes', 'Vice President for Student Affairs', 'Dean, Graduate School', '64417fc8e04ed.png'),
(31, 'Ms. Christine Santos', 'Vice President for Finance', '', '64418010ce962.png'),
(32, 'Dr. Melinda M. Bautista', 'Vice President for Planning', '', '644180235cf21.png'),
(33, 'Dr. Rosario D. De Ocera', 'Vice President for Community Extension Services', '', '644180339c221.png'),
(34, 'Dr. Bernadette B. Enriquez', 'Vice President for Research and Publication', 'Dean, College of Liberal Arts and Sciences |\r\nDirector, Cultural Affairs |\r\nAdviser, The New Crossroads', '64418053c5a57.png'),
(35, 'Dr. Shirley V. Saragcon', '', 'Dean, College of Business and Accountancy', '6441808d273fd.png'),
(36, 'Dr. Ramona A. Prado', 'Asst. Director, Budget and Finance Office', 'Dean, College of Education', '644180aa2e0e3.png'),
(37, 'Atty. Dexter Calizar', '', 'Dean, College of Criminology', '644180bcd7e67.png'),
(38, 'Prof. Rey H. Jetajobe', 'Campus Administrator', 'South Campus', '644180d5bcc8c.png'),
(39, 'Dr. Dionisio Reyes', 'Campus Administrator', 'North Campus', '644180eed65da.png'),
(40, 'Dr. Ryan Alejo', 'University Accountant', '', '64418103ce235.png'),
(41, 'Prof. Nomer Q. Marmolejo', 'Director, Budget and Finance Office', '', '64418114f3ed7.png'),
(42, 'Dr. Teodoro Macaraeg Jr.', 'Director, Management Information System', '', '644181231fbbc.png'),
(43, 'Engr. Robert C. Torrecampo', 'Director, Research', '', '64418134d9517.png'),
(44, 'Dr. Jennifer G. Dela Cruz', 'Director, Sports Development', '', '64418149b24d0.png'),
(45, 'Dr. Eloisa P. Makay', 'Director, Gender and Development (GAD)', '', '6441815b09ca6.png'),
(46, 'Prof. John Nicklaus S. Junio', 'Director, Office of Student Affairs & Services Adviser, SSC', '', '644181700fedc.png'),
(47, 'Dr. Helen O. Villegas', 'Program Coordinator, Scholarship', '', '6441818341341.png'),
(48, 'Prof. Jessie Tamayo', 'Asst. VP for Administration, Asst. Campus Administrator', 'VocTech Campus', '644181a33a00a.png'),
(49, 'Prof. Jeffrey Dela Cruz', 'Asst. Vice President for Community Extension Services', '', '644181b1a5fc6.png'),
(50, 'Prof. Ma. Cecilia M. Saenz', 'University Registrar / Guidance Counselor', 'South Campus', '644181cab4c63.png'),
(51, 'Anna Lea Sheryl Espino', 'University Registrar', 'North Campus', '644181e392770.png');

-- --------------------------------------------------------

--
-- Table structure for table `vet_accountlist`
--

CREATE TABLE `vet_accountlist` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `contact` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `branch_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_accountlist`
--

INSERT INTO `vet_accountlist` (`id`, `name`, `username`, `email`, `password`, `birthday`, `contact`, `user_type`, `branch_name`) VALUES
(69, 'admin', 'admin', 'admin@petclinic.com', '0192023a7bbd73250516f069df18b500', '2000-09-09', '1', 'admin', ' '),
(70, 'Vincent Angelo D Santiago', '', 'vince123@gmail.com', '749f63feadca546a266c3321852a3998', '2014-02-25', '09565678112', 'staff', 'Caloocan City'),
(71, 'Pamela Dula', '', 'pamela@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1978-09-22', '09217166191', 'staff', 'Caloocan City'),
(72, 'Jennilyn Tan', '', 'Jennilyn@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1990-01-16', '09121171991', 'adminb', 'Manila City');

-- --------------------------------------------------------

--
-- Table structure for table `vet_accountlist_client`
--

CREATE TABLE `vet_accountlist_client` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `contact` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bday` date DEFAULT NULL,
  `user` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rfid` varchar(255) DEFAULT NULL,
  `pin` int DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `otp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_accountlist_client`
--

INSERT INTO `vet_accountlist_client` (`id`, `name`, `username`, `email`, `password`, `contact`, `bday`, `user`, `rfid`, `pin`, `balance`, `status`, `otp`) VALUES
(7, 'Carmelita Lucero', 'Carmel', 'carmelitalucero2002@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', '2000', '2022-12-07', 'client', '777', 1234, '1410', NULL, '63a21ead8d58e'),
(8, 'Client', 'client', 'client@gmail.com', 'client123', '912343001', '2021-10-22', 'client', '3258631587', 1111, '203184', NULL, ''),
(23, 'Maica Hernandez', 'Aciam', 'honeysoda001@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '09231097984', '2000-04-13', 'client', '1112', 1111, '0', NULL, NULL),
(27, 'Ruth Castin', 'Ruthy', 'honeysoda002@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '09231081714', '2002-09-13', 'client', '0', 0, '0', NULL, NULL),
(28, 'Librada Araza', NULL, 'adaaraza@yahoo.com', NULL, '09231097194', NULL, NULL, '0', 0, '121', 'Active', NULL),
(29, 'Xavier Alvarez', 'xavieralvarez', 'xavieralvarez@gmail.com', 'fd5f0666097fd3eaea2a593641100b8a', '09123456789', '2000-02-08', 'client', '0', 0, '0', NULL, NULL),
(30, 'Vincent Angelo D Santiago', 'vincent', 'vince1234@gmail.com', '6ad14ba9986e3615423dfca256d04e3f', '09565678112', '2002-03-02', 'client', '3259140419', 1111, '4750', NULL, NULL),
(31, 'Josephine Gomez', 'Josephine', 'honeysoda001@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '09127199101', '1992-09-12', 'client', '0', 0, '0', NULL, NULL),
(32, 'Ricardo', 'Salvador', 'ricksiv0107@gmail.com', '25f9e794323b453885f5181f1b624d0b', '09912323198', '2004-01-07', 'client', '0', 0, '0', NULL, NULL),
(33, 'Mary Grace Valdeviezo', 'MaryGrace', 'valdeviezomarygrace1108@gmail.com', '5aac7b13c1a3a411c57540f82484fec1', '09368275697', '2002-11-08', 'client', '0', 0, '0', NULL, NULL),
(34, 'Mary Ann Dometita', 'annie', 'anndometita034@gmail.com', 'a21810a01d3fe0df4291d7d3e7abbd1c', '09278228424', '2023-02-27', 'client', '0', 0, '0', NULL, NULL),
(35, 'Analyn', 'Analyn', 'analyn.morfe0810@gmail.com', 'be83a8f87ff40208612d1dcd617268f7', '01234567897', '2003-06-14', 'client', '0', 0, '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vet_appointment_list`
--

CREATE TABLE `vet_appointment_list` (
  `booking_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `breed` varchar(100) NOT NULL,
  `service1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `service2` varchar(11) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `status` varchar(20) NOT NULL,
  `username` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_appointment_list`
--

INSERT INTO `vet_appointment_list` (`booking_id`, `name`, `email`, `mobile`, `date`, `time`, `type`, `breed`, `service1`, `service2`, `branch_name`, `status`, `username`) VALUES
(9, 'ruth', 'ruthy@gmail.com', '921221', '2022-12-08', '20:59', '', 'puspin', '', '', '0', '0', ''),
(11, 'aa', 'aaa@gmai.com', '1122', '0001-11-11', '11:11', '', 'aa', '', '', '0', '2', ''),
(12, 'aa', 'aaa@gmai.com', '1122', '0001-11-11', '11:11', '', 'aa', '', '', '0', '3', ''),
(13, 'aa', 'aaa@gmai.com', '1122', '0001-11-11', '11:11', '', 'aa', '', '', '0', '0', ''),
(14, 'Arthur Delo Santos', 'aaa@gmail.com', '122112', '0001-11-11', '11:11', '', 'cat', 'Grooming', '', '0', '0', ''),
(15, '111', '1221@gmailas.vd', '2121', '0002-02-11', '12:12', '', '212', 'Service', '', '0', '0', ''),
(16, 'aaa', '1221@gmailas.vd', '1122', '0011-11-01', '11:11', '', 'a', 'Check-up', '', '0', '0', ''),
(17, '1', '1221@gmailas.vd', '11', '0011-11-11', '11:11', 'Hamster', 'aa', 'Grooming', '', '0', '0', ''),
(18, 'Kristine ', 'arazakrizten@gmail.com', '1111', '0001-11-11', '11:11', 'cat', '11', 'Grooming', '', '4314_cal', '0', ''),
(19, 'Kristine ', 'arazakrizten@gmail.com', '1111', '0001-11-11', '11:11', 'cat', '11', 'Grooming', '', '4314_cal', '0', ''),
(20, 'a', 'aaa@gmai.com', '122122121', '0011-11-11', '11:11', 'Birds', 'aaa', 'Vaccination', '', '4314_cal', '0', ''),
(21, 'a', 'aaa@gmai.com', '122122121', '0011-11-11', '11:11', 'Birds', 'aaa', 'Vaccination', '', '4314_cal', '1', ''),
(22, 'aaa', 'maica.hernandez@gmail.com', '12122121', '0011-11-11', '11:11', 'Hamster', 'aaa', 'Vaccination', '', 'Quezon City', '', ''),
(23, 'Cherry', 'rainxui004@gmail.com', '4546191', '2022-12-23', '16:23', 'Birds', 'Husky', 'Service', '', 'Caloocan City', '', ''),
(24, 'Carmelita', 'carmelitalucero2002@gmail.com', '9812371', '2022-12-22', '20:22', 'Dog', 'Labrador', 'Vaccination', '', 'valenzuela city', '', ''),
(25, 'Carmelita ', 'carmelitalucero2002@gmail.com', '09213255611', '2022-12-24', '11:19', 'Dog', 'husky', 'Check-up', 'Check-up', 'Caloocan City', '0', ''),
(26, 'Carmelita ', 'carmelitalucero2002@gmail.com', '09213255611', '2022-12-24', '11:19', 'Dog', 'husky', 'Check-up', 'Check-up', 'Caloocan City', '0', ''),
(27, 'Carmelita ', 'carmelitalucero2002@gmail.com', '0912131145', '2022-12-08', '11:20', 'Dog', 'husky', 'Vaccination', 'Rabist Shot', 'Pasay City', '0', ''),
(28, 'Carmelita Lucero', 'carmelitalucero2002@gmail.com', '2000', '2002-11-11', '11:11', 'Type of Pet', 'husky', 'kennel cough', 'Vaccination', 'Pasig City', '0', ''),
(29, 'Carmelita Lucero', 'carmelitalucero2002@gmail.com', '2000', '2023-01-22', '11:11', 'Dog', 'husky', 'Check-up', 'Vaccination', 'Valenzuela City', '1', ''),
(30, 'Maica Hernandez', 'maica.hernandez11@gmail.com', '09112233445', '2022-12-20', '11:11', 'Dog', 'husky', 'Check-up', 'Rabist Shot', 'Valenzuela City', '0', 'aciam'),
(31, 'Maica Hernandez', 'maica.hernandez11@gmail.com', '09112233445', '2022-12-31', '14:22', 'cat', 'puspin', 'Rabist Shot', 'Rabist Shot', 'Valenzuela City', '0', 'aciam'),
(32, 'Maica Hernandez', 'maica.hernandez11@gmail.com', '09112233445', '2022-12-22', '11:11', 'Birds', 'parrot', 'Rabist Shot', 'n/a', 'Caloocan City', '2', 'aciam'),
(33, 'Carmelita Lucero', 'carmelitalucero2002@gmail.com', '2000', '2022-12-25', '05:30', 'Dog', 'Labrador', 'Rabist Shot', 'Rabist Shot', 'Valenzuela City', '0', 'Carmel'),
(34, 'Carmelita Lucero', 'carmelitalucero2002@gmail.com', '09661599355', '2022-11-25', '06:00', 'Hamster', 'Winter White Hamster', 'Rabist Shot', 'n/a', 'Valenzuela City', '0', 'Carmel'),
(35, 'vincent', 'vincent12@gmail.com', '0921531773', '2023-05-30', '16:25', 'Dog', 'shitzu', 'Rabist Shot', 'Service', 'Caloocan City', '0', 'vince'),
(36, 'vincent', 'vincent12@gmail.com', '0921531773', '2023-05-30', '16:25', 'Dog', 'shitzu', 'Rabist Shot', 'Service', 'Caloocan City', '1', 'vince'),
(37, 'Christopher Araza', 'Christopher.Araza@gmail.com', '09172177191', '2023-04-29', '03:23', 'Dog', 'shitzu', 'Rabist Shot', 'Check-up', 'Valenzuela City', '1', 'Chris'),
(38, 'Christopher Araza', 'Christopher.Araza@gmail.com', '09172177191', '2023-10-11', '13:46', 'Dog', 'shitzu', 'Rabist Shot', 'Rabist Shot', 'Caloocan City', '0', 'Chris'),
(39, 'Christopher Araza', 'Christopher.Araza@gmail.com', '09172177191', '2023-07-23', '12:21', 'Dog', 'husky', 'Rabist Shot', 'Vaccination', 'Caloocan City', '1', 'Chris'),
(40, 'Christopher Araza', 'Christopher.Araza@gmail.com', '09172177191', '2023-05-27', '20:36', 'Dog', 'husky', 'Check-up', 'Rabist Shot', 'Caloocan City', '0', 'Chris'),
(41, 'Test', 'test@gmail.com', '09123456', '2022-01-01', '13:00', 'Type of Pet', 'shitzu', 'Vaccination', 'n/a', 'Pasig City', '1', 'Test'),
(42, 'Christopher Araza', 'Christopher.Araza@gmail.com', '09172177191', '2023-05-20', '11:18', 'Dog', 'shirzu', 'Grooming', 'n/a', 'Caloocan City', '2', 'Chris'),
(43, 'Christopher Araza', 'Christopher.Araza@gmail.com', '09172177191', '2023-05-20', '11:18', 'Dog', 'shirzu', 'Grooming', 'n/a', 'Caloocan City', '1', 'Chris'),
(44, 'Test', 'test@gmail.com', '09123456', '2023-05-20', '22:19', 'Dog', 'shitzu', 'Vaccination', 'Vaccination', 'Caloocan City', '1', 'test'),
(45, 'Ruth Castin', 'honeysoda002@gmail.com', '09231081714', '2023-05-25', '11:28', 'Dog', 'shitzu', 'Check-up', 'Vaccination', 'Valenzuela City', '2', 'Ruthy'),
(46, 'Josephine Gomez', 'honeysoda001@gmail.com', '09127199101', '1992-09-18', '10:10', 'Dog', 'husky', 'Check-up', 'Check-up', 'Caloocan City', '0', 'Josephine'),
(47, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-05-26', '09:08', 'Dog', 'shitzu', 'Rabist Shot', 'Check-up', 'Caloocan City', '1', 'vincent'),
(48, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-05-27', '12:35', 'Dog', 'husky', 'kennel cough', 'Rabist Shot', 'Caloocan City', '1', 'vincent'),
(49, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-05-26', '22:00', 'Hamster', 'Danny Brenio', 'Vaccination', 'Rabist Shot', 'Manila City', '2', 'vincent'),
(50, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-05-26', '10:27', 'Dog', 'Shitzu', 'Check-up', 'Vaccination', 'Valenzuela City', '1', 'vincent'),
(51, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-05-26', '12:52', 'Dog', 'shitzu', 'Vaccination', 'Check-up', 'Caloocan City', '2', 'vincent'),
(52, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-05-26', '12:52', 'Dog', 'shitzu', 'Vaccination', 'Check-up', 'Caloocan City', '1', 'vincent'),
(53, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-06-03', '11:20', 'cat', 'PUSPIN', 'Check-up', 'Check-up', 'Manila City', '1', 'vincent'),
(54, 'Mary Grace Valdeviezo', 'valdeviezomarygrace1108@gmail.com', '09368275697', '2023-05-26', '12:39', 'Dog', 'Shitzu', 'Vaccination', 'n/a', 'Caloocan City', '1', 'MaryGrace'),
(55, 'Mary Ann Dometita', 'anndometita034@gmail.com', '09278228424', '2023-05-26', '12:20', 'cat', 'siamese', 'Vaccination', 'Check-up', 'Caloocan City', '2', 'annie'),
(56, 'Analyn', 'analyn.morfe0810@gmail.com', '01234567897', '2023-05-01', '04:06', 'cat', 'chihuahua', 'Vaccination', 'Check-up', 'Caloocan City', '2', 'Analyn'),
(57, 'Xavier Alvarez', 'xavieralvarez@gmail.com', '09123456789', '2023-05-27', '14:00', 'Dog', 'husky', 'Vaccination', 'Service', 'Caloocan City', '0', 'xavieralvarez'),
(58, 'Xavier Alvarez', 'xavieralvarez@gmail.com', '09123456789', '2023-05-28', '10:14', 'Dog', 'Shitzu', 'Vaccination', 'n/a', 'Caloocan City', '0', 'xavieralvarez'),
(59, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '09565678112', '2023-05-27', '18:30', 'Dog', 'husky', 'Check-up', 'Service', 'Caloocan City', '2', 'vincent'),
(60, 'Miko Cabaddu', 'vince1234@gmail.com', '09565678112', '2023-05-26', '16:53', 'Dog', 'Aspin', 'Vaccination', 'Grooming', 'Caloocan City', '1', 'vincent'),
(61, 'Vincent Angelo D Santiago', 'vince1234@gmail.com', '13214315325', '2023-05-27', '19:25', 'Dog', 'husky', 'Rabist Shot', 'Rabist Shot', 'Caloocan City', '1', 'vincent');

-- --------------------------------------------------------

--
-- Table structure for table `vet_booking_history`
--

CREATE TABLE `vet_booking_history` (
  `booking_id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `breed` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  `service1` varchar(250) NOT NULL,
  `service2` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vet_branch`
--

CREATE TABLE `vet_branch` (
  `id` int NOT NULL,
  `branch_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_branch`
--

INSERT INTO `vet_branch` (`id`, `branch_name`, `region`) VALUES
(40, 'Caloocan City', 'NCR'),
(42, 'Pasig City', 'NCR'),
(43, 'Manila City', 'NCR'),
(44, 'Pasay City', 'NCR'),
(47, 'Valenzuela City', 'NCR'),
(50, 'Quezon City', 'NCR'),
(51, 'visayas', 'NCR');

-- --------------------------------------------------------

--
-- Table structure for table `vet_logs`
--

CREATE TABLE `vet_logs` (
  `id` int NOT NULL,
  `rfid` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_logs`
--

INSERT INTO `vet_logs` (`id`, `rfid`, `action`, `time`) VALUES
(1, '1', '1 has top up', '2023-05-23 18:54:42'),
(2, '888', '888 has top up', '2023-05-24 00:16:36'),
(3, '777', '777 has top up', '2023-05-24 20:49:53'),
(4, '777', ' has top up', '2023-05-25 13:10:12'),
(5, '777', ' has top up', '2023-05-25 13:11:46'),
(6, '777', ' has top up', '2023-05-25 13:13:17'),
(7, '777', 'Top with Amount: 1000', '2023-05-25 13:15:47'),
(8, '777', 'Top with Amount: 500', '2023-05-25 13:17:15'),
(9, '777', 'Pay using Card with Amount: 1200', '2023-05-25 13:22:39'),
(10, '3259140419', 'Top with Amount: 1111', '2023-05-26 08:07:07'),
(11, '3259140419', 'Pay using Card with Amount: 750', '2023-05-26 08:07:43'),
(12, '3259140419', 'Top with Amount: 1500', '2023-05-26 09:16:08'),
(13, '3259140419', 'Pay using Card with Amount: 1000', '2023-05-26 09:16:45'),
(14, '3259140419', 'Top with Amount: 5000', '2023-05-26 09:38:33'),
(15, '3259140419', 'Pay using Card with Amount: 1250', '2023-05-26 09:39:18'),
(16, '3258631587', 'Top with Amount: 1111', '2023-05-26 09:48:31'),
(17, '3259140419', 'Top with Amount: 2000', '2023-05-26 10:02:50'),
(18, '3259140419', 'Pay using Card with Amount: 960', '2023-05-26 10:04:40'),
(19, '3259140419', 'Top with Amount: 1000', '2023-05-26 10:21:03'),
(20, '3259140419', 'Top with Amount: 500', '2023-05-26 10:21:31'),
(21, '3259140419', 'Pay using Card with Amount: 1500', '2023-05-26 10:24:28'),
(22, '3258631587', 'Top with Amount: 5000', '2023-05-26 10:53:23'),
(23, '3258631587', 'Pay using Card with Amount: 960', '2023-05-26 10:55:03'),
(24, '3258631587', 'Top with Amount: 1000', '2023-05-26 11:16:06'),
(25, '3258631587', 'Top with Amount: 599', '2023-05-26 11:16:28'),
(26, '3258631587', 'Pay using Card with Amount: 360', '2023-05-26 11:17:12'),
(27, '3258631587', 'Top with Amount: 500', '2023-05-26 11:32:23'),
(28, '3258631587', 'Pay using Card with Amount: 360', '2023-05-26 11:33:27'),
(29, '3258631587', 'Top with Amount: 50000', '2023-05-26 12:26:31'),
(30, '3258631587', 'Pay using Card with Amount: 350', '2023-05-26 12:28:21'),
(31, '3258631587', 'Top with Amount: 1000', '2023-05-26 12:59:36'),
(32, '3258631587', 'Pay using Card with Amount: 1600', '2023-05-26 13:01:19'),
(33, '3259140419', 'Top with Amount: 1000', '2023-05-26 13:40:35'),
(34, '3259140419', 'Pay using Card with Amount: 360', '2023-05-26 13:41:28'),
(35, '3259140419', 'Top with Amount: 59', '2023-05-26 14:32:16'),
(36, '3259140419', 'Pay using Card with Amount: 1600', '2023-05-26 14:33:48'),
(37, '3258631587', 'Top with Amount: 51', '2023-05-26 14:34:55'),
(38, '3258631587', 'Top with Amount: 150000', '2023-05-26 16:59:12'),
(39, '3258631587', 'Pay using Card with Amount: 1500', '2023-05-26 16:59:32'),
(40, '3258631587', 'Top with Amount: 3', '2023-05-26 17:29:45'),
(41, '3258631587', 'Pay using Card with Amount: 950', '2023-05-26 17:31:51');

-- --------------------------------------------------------

--
-- Table structure for table `vet_mobile`
--

CREATE TABLE `vet_mobile` (
  `id` int NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `contact` int NOT NULL,
  `address` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vet_rfid`
--

CREATE TABLE `vet_rfid` (
  `id` int NOT NULL,
  `rfid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `num` varchar(255) NOT NULL,
  `balance` float DEFAULT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_rfid`
--

INSERT INTO `vet_rfid` (`id`, `rfid`, `pin`, `name`, `email`, `num`, `balance`, `status`) VALUES
(107, '3258631587', '2020', 'Carmelita H. Lucero', 'carmelita123@gmail.com', '09876511211', 2924, 'Active'),
(108, '11', '1111', 'Librada Araza', 'adaaraza@yahoo.com', '09231097194', 856, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `vet_rfid_list`
--

CREATE TABLE `vet_rfid_list` (
  `id` int NOT NULL,
  `rfid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_rfid_list`
--

INSERT INTO `vet_rfid_list` (`id`, `rfid`) VALUES
(43, '1'),
(44, '2'),
(45, '4'),
(46, '3'),
(47, '2'),
(48, '1'),
(49, '888'),
(50, '777'),
(51, '091'),
(55, '1112'),
(57, '3258631587'),
(58, '3259140419'),
(59, '3259082595');

-- --------------------------------------------------------

--
-- Table structure for table `vet_rfid_veri`
--

CREATE TABLE `vet_rfid_veri` (
  `id` int NOT NULL,
  `rfid` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_rfid_veri`
--

INSERT INTO `vet_rfid_veri` (`id`, `rfid`) VALUES
(33, '2'),
(34, '2'),
(35, '888'),
(36, '091'),
(37, ''),
(38, '3259082595');

-- --------------------------------------------------------

--
-- Table structure for table `vet_schedule_list`
--

CREATE TABLE `vet_schedule_list` (
  `id` int NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_schedule_list`
--

INSERT INTO `vet_schedule_list` (`id`, `title`, `description`, `start_datetime`, `end_datetime`) VALUES
(1, 'Christmass Party', 'Having Christmass Party and Christmass break of all employee. REsume of our services is Dec,26 2022', '2022-12-22 08:00:00', '2022-12-26 17:00:00'),
(2, 'Fully Book', 'This day is ful;ly book please choose another day', '2022-12-28 08:30:00', '2022-12-28 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vet_service`
--

CREATE TABLE `vet_service` (
  `id` int NOT NULL,
  `service` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_service`
--

INSERT INTO `vet_service` (`id`, `service`, `price`) VALUES
(28, 'groom', '500'),
(29, 'Vaccination', '360'),
(30, 'Check-up', '600'),
(31, 'Kapon (CAT)', '1000'),
(32, 'Kapon (DOG)', '1000'),
(33, 'Deworming', '350'),
(34, '5in1 Shot', '500'),
(35, '6in1 Shot', '750'),
(36, 'Grooming (CAT)', '500'),
(42, 'test', '123');

-- --------------------------------------------------------

--
-- Table structure for table `vet_walk`
--

CREATE TABLE `vet_walk` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `number` varchar(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `breed` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vet_walkin_history`
--

CREATE TABLE `vet_walkin_history` (
  `walkin_id` int NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `breed` varchar(250) NOT NULL,
  `type` varchar(250) NOT NULL,
  `service1` varchar(250) NOT NULL,
  `service2` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vet_walkin_list`
--

CREATE TABLE `vet_walkin_list` (
  `id` int NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(250) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `breed` varchar(100) NOT NULL,
  `service1` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `service2` varchar(250) DEFAULT NULL,
  `branch_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vet_walkin_list`
--

INSERT INTO `vet_walkin_list` (`id`, `firstname`, `lastname`, `email`, `contact`, `type`, `breed`, `service1`, `service2`, `branch_name`, `date`) VALUES
(91, 'Ruth', 'Tan', 'ruth@gmail.com', '092131231123', 'Hamster', 'None', '500', '500', '0', '2023-05-20 07:49:16'),
(92, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'shitzu', '500', '0', '0', '2023-05-18 22:49:16'),
(93, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'inihaw', '700', '500', '-22', '2023-05-19 02:56:11'),
(94, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'husky', '700', '750', '-52', '2023-05-19 16:07:05'),
(95, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Hamster', 'husky', '500', '750', '-41', '2023-05-19 16:32:38'),
(96, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Hamster', 'husky', '500', '750', '0', '2023-05-19 16:46:40'),
(97, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'inihaw', '700', '500', '-1160', '2023-05-19 16:56:17'),
(98, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Hamster', 'inihaw', '500', '350', '-850', '2023-05-19 16:53:18'),
(99, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'hhha', '500', '700', '-1200', '2023-05-19 16:55:08'),
(100, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Hamster', 'husky', '700', '500', '-1200', '2023-05-19 16:56:55'),
(101, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Hamster', 'husky', '750', '500', '-1200', '2023-05-25 13:22:39'),
(102, 'Liance', 'Arinola', 'Liance@gmail.com', '0921811121451', 'Dog', 'shitzu', '700', '0', '-700', '2023-05-20 00:32:03'),
(103, 'Jennilyn ', 'Damisu', 'Jennilyn@gmail.com', '09211187691', 'cat', 'Puspin', '500', '350', '-850', '2023-05-20 00:20:38'),
(104, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'inihaw', '800', '300', '-1100', '2023-05-23 18:30:34'),
(105, 'Sasha', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', '', '2000', '0', '-2000', '2023-05-20 07:53:31'),
(106, '', '', '', '', 'Select', '', '360', '0', '-360', '2023-05-20 08:49:17'),
(107, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'inihaw', '700', '350', '-1050', '2023-05-20 09:26:45'),
(108, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'shitzu', '500', '500', '-1000', '2023-05-20 09:34:33'),
(109, 'Cherry Anne', 'Calicaran', 'Cherry.calicaran@gmail.com', '09213217891', 'Dog', 'Aspin', '500', '1000', '-1000', '2023-05-26 09:16:45'),
(110, '', '', '', '', 'Select', '', '0', '0', '0', '2023-05-24 20:44:07'),
(111, 'Pia ', 'Cantomayor', 'pia@gmail.com', '09113452131', 'cat', 'Tuxedo', '500', '0', '-500', '2023-05-25 13:17:15'),
(112, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'puspin', '750', '0', '-750', '2023-05-26 08:07:43'),
(113, 'vince', 'santiago', 'adaaraza@yahoo.com', '09231097194', 'Rabbit', 'hhha', '500', '750', '-1250', '2023-05-26 09:39:18'),
(114, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'husky', '600', '360', '-960', '2023-05-26 10:04:40'),
(115, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'Puspin', '500', '1000', '-1500', '2023-05-26 10:24:28'),
(116, 'vincent', 'antigo', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'shitzu', '360', '600', '-960', '2023-05-26 10:55:03'),
(117, 'Jessica', 'Mislang', 'jessicamislang262gmail.com', '09456687970', 'Dog', 'Aspin', '360', '350', '0', '2023-05-26 11:09:29'),
(118, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'cat', 'Puspin', '360', '0', '-360', '2023-05-26 11:17:12'),
(119, 'Mary Grace', 'Valdeviezo', 'valdeviezomarygrace1108@gmail.com', '09368275697', 'Dog', 'shitzu', '360', '0', '-360', '2023-05-26 11:33:27'),
(120, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Gerbils', 'Puspin', '350', '0', '-350', '2023-05-26 12:28:21'),
(121, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'shitzu', '1000', '600', '-1600', '2023-05-26 13:01:19'),
(122, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'shitzu', '360', '0', '-360', '2023-05-26 13:41:28'),
(123, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'shitzu', '1000', '600', '-1600', '2023-05-26 14:33:48'),
(124, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Gerbils', 'hhha', '1000', '500', '-1500', '2023-05-26 16:59:32'),
(125, 'Librada', 'Araza', 'adaaraza@yahoo.com', '09231097194', 'Dog', 'Puspin', '600', '350', '-950', '2023-05-26 17:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `vot_candidates`
--

CREATE TABLE `vot_candidates` (
  `id` int NOT NULL,
  `partylist_id` int NOT NULL,
  `position_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `m_initial` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `status` int NOT NULL DEFAULT '2',
  `course_id` int NOT NULL,
  `photo` varchar(255) NOT NULL,
  `cand_votes` int NOT NULL,
  `year_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_candidates`
--

INSERT INTO `vot_candidates` (`id`, `partylist_id`, `position_id`, `name`, `m_initial`, `lname`, `status`, `course_id`, `photo`, `cand_votes`, `year_id`) VALUES
(74, 2, 3, 'daneris', 'A', 'Mendoza', 1, 1, '636c89b28c818.jpg', 18, 12),
(75, 3, 4, 'angel', 'B', 'Deona', 1, 1, '64081de8dfe63.jpg', 26, 12),
(76, 1, 1, 'Vincent', 'A', 'Dela Cruz', 1, 1, '6460603c90bac.png', 27, 12),
(77, 1, 2, 'King', 'B', 'Queen', 1, 1, '636e3b68caed8.jpg', 24, 12),
(78, 2, 2, 'Anne', 'H', 'Reyes', 1, 1, '636e4786708ab.png', 10, 12),
(79, 2, 3, 'Midas', 'S', 'Gold', 1, 1, '636e51630087b.jpeg', 12, 12),
(80, 1, 4, 'Jordan', 'B', 'Jordan', 1, 1, '636e52b85f0bf.jpg', 13, 12),
(81, 1, 5, 'Kris', 'B', 'Jenner', 1, 1, '636e5d266b811.jpg', 24, 12),
(82, 2, 5, 'Alden', 'F', 'Richards', 1, 1, '64339b4b87ac4.jpg', 11, 12),
(83, 1, 6, 'Daniel', 'B', 'Custodio', 1, 1, '636e5e505d92e.jpg', 23, 12),
(84, 2, 6, 'GELO POGI', 'SUPER', 'POGI', 1, 1, '636e5fa97221b.jpg', 12, 12),
(85, 1, 1, 'Cedri', 'D', 'Cruz', 1, 2, '639297bf07c0f.jpg', 7, 12),
(98, 1, 1, 'Caloocan', 'M', 'Malapitan', 2, 1, '642a5e45bc7bc.png', 0, 12),
(99, 1, 1, 'Jiro Allen ', 'V.', 'Ibia', 2, 1, '64422771076b2.png', 4, 12);

-- --------------------------------------------------------

--
-- Table structure for table `vot_cat_user`
--

CREATE TABLE `vot_cat_user` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_cat_user`
--

INSERT INTO `vot_cat_user` (`id`, `category_id`, `cat_name`) VALUES
(1, 1, 'Voter'),
(2, 2, 'Staff'),
(3, 3, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `vot_course`
--

CREATE TABLE `vot_course` (
  `id` int NOT NULL,
  `course_id` int NOT NULL,
  `course_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_course`
--

INSERT INTO `vot_course` (`id`, `course_id`, `course_name`) VALUES
(1, 1, 'BSCS'),
(2, 2, 'BSIT'),
(3, 3, 'BSEMC'),
(4, 4, 'BSIS');

-- --------------------------------------------------------

--
-- Table structure for table `vot_logs`
--

CREATE TABLE `vot_logs` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `added_by` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_logs`
--

INSERT INTO `vot_logs` (`id`, `user_id`, `action`, `added_by`, `time`) VALUES
(5, 95, 'jiro123 has voted', NULL, '2023-05-15 06:03:41'),
(6, 99, 'man123 has voted', NULL, '2023-05-18 22:18:15'),
(7, 160, 'shar has voted', NULL, '2023-05-20 05:17:32'),
(8, 160, 'shar has voted', NULL, '2023-05-20 05:20:19'),
(9, 160, 'shar has voted', NULL, '2023-05-20 05:25:40');

-- --------------------------------------------------------

--
-- Table structure for table `vot_party_list`
--

CREATE TABLE `vot_party_list` (
  `id` int NOT NULL,
  `partylist_id` int NOT NULL,
  `party_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_party_list`
--

INSERT INTO `vot_party_list` (`id`, `partylist_id`, `party_name`) VALUES
(4, 1, 'kabataan'),
(5, 2, 'gabriela'),
(7, 3, 'independent'),
(11, 4, 'ACT-CIS');

-- --------------------------------------------------------

--
-- Table structure for table `vot_position`
--

CREATE TABLE `vot_position` (
  `id` int NOT NULL,
  `position_id` int NOT NULL,
  `pos_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_position`
--

INSERT INTO `vot_position` (`id`, `position_id`, `pos_name`) VALUES
(7, 1, 'President'),
(8, 2, 'Vice-president'),
(9, 3, 'Secretary'),
(10, 4, 'Treasurer'),
(11, 5, 'Auditor'),
(12, 6, 'PIO'),
(17, 7, 'Mandurukot');

-- --------------------------------------------------------

--
-- Table structure for table `vot_session`
--

CREATE TABLE `vot_session` (
  `id` int NOT NULL,
  `is_filing` int NOT NULL DEFAULT '0',
  `is_election` int NOT NULL DEFAULT '0',
  `start_time_filing` datetime DEFAULT NULL,
  `end_time_filing` datetime DEFAULT NULL,
  `end_time_elec` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_session`
--

INSERT INTO `vot_session` (`id`, `is_filing`, `is_election`, `start_time_filing`, `end_time_filing`, `end_time_elec`) VALUES
(1, 0, 0, '2023-05-20 04:03:00', '2023-05-20 04:05:00', '2023-05-20 06:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `vot_users`
--

CREATE TABLE `vot_users` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_voted` int NOT NULL DEFAULT '0',
  `is_filing` int NOT NULL DEFAULT '0',
  `student_no` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `is_qr` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_users`
--

INSERT INTO `vot_users` (`id`, `category_id`, `username`, `password`, `is_voted`, `is_filing`, `student_no`, `otp`, `is_qr`) VALUES
(79, 2, 'joms123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 0, '202000800-M', NULL, 0),
(94, 2, 'vin123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 0, '20200040-M', '64630f7107231', 0),
(95, 1, 'jiro123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 1, 0, '202000760-M', NULL, 0),
(96, 2, 'daniel123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 0, '5', NULL, 0),
(99, 1, 'man123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 0, '202000600-M', NULL, 0),
(102, 1, 'cal123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 1, '202000601-M', NULL, 0),
(103, 3, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0, 0, '1', NULL, 0),
(104, 1, 'bul123', '35dee74a933d5defeaf140792d44052cfa332082', 0, 0, '202000850-M', NULL, 0),
(105, 1, '10101010', 'd625fc319a744dd916251e56a472cfef5a98f0b2', 0, 0, '10101010', NULL, 0),
(107, 1, '202000700-M', '4c275293bc0831f245b465fbbe7026c526c13e0c', 0, 0, '202000700-M', NULL, 0),
(133, 2, 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', 0, 0, '11', NULL, 0),
(134, 1, '123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 0, '123', NULL, 0),
(135, 2, 'ichigo123', '480695a74497e6b4cbd444c0fe864d3fd7551ede', 0, 0, '13', NULL, 0),
(136, 1, '202021030', '107def73776ec0f4b35ed9537816c864a4d1b4bf', 0, 0, '202021030', NULL, 0),
(138, 1, 'ced123', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 0, 0, '2020090-M', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `vot_user_profile`
--

CREATE TABLE `vot_user_profile` (
  `id` int NOT NULL,
  `fname` varchar(255) NOT NULL,
  `m_initial` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `course_id` int NOT NULL,
  `student_no` varchar(255) NOT NULL,
  `status` int DEFAULT '0',
  `year_id` int NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qr` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_user_profile`
--

INSERT INTO `vot_user_profile` (`id`, `fname`, `m_initial`, `lname`, `email`, `course_id`, `student_no`, `status`, `year_id`, `date_created`, `qr`) VALUES
(33, 'Joms', 'J', 'Lucerio', 'joms@gmail.com', 3, '202000800-M', 1, 12, '2022-12-19 11:57:36', NULL),
(46, 'vin', 'A', 'Cruz', 'cruzcedric22@gmail.com', 1, '20200040-M', 1, 12, '2022-12-19 11:57:36', NULL),
(47, 'Jiro Allen ', 'V.', 'Ibia', 'minato@gmail.com', 1, '202000760-M', 1, 12, '2022-12-19 11:57:36', NULL),
(48, 'Daniel', 'B', 'Custodio', 'danielcustodio832@gmail.com', 1, '5', 1, 12, '2022-12-19 11:57:36', NULL),
(51, 'Manila', 'M', 'Tondo', 'Man@gmail.com', 1, '202000600-M', 1, 12, '2022-12-19 11:57:36', NULL),
(54, 'Caloocan', 'M', 'Malapitan', 'cal123@gmail.com', 1, '202000601-M', 1, 12, '2022-12-19 11:57:36', NULL),
(55, 'admin', 'admin', 'admin', 'admin', 1, '1', 1, 12, '2022-12-19 11:57:36', NULL),
(56, 'Bulacan', 'J', 'City', 'Bulacan@gmail.com', 1, '202000850-M', 0, 12, '2022-12-19 11:57:36', NULL),
(57, 'bm123', 'f.', 'delacruz', 'bm@gmail.com', 1, '10101010', 2, 12, '2023-02-26 21:27:17', NULL),
(59, 'Angelo', 'DA', 'Perlota', 'perlota@gmail.com', 2, '202000700-M', 0, 12, '2023-03-03 15:43:49', NULL),
(85, 'test', 'test', 'test', 'test@gmail.com', 1, '11', 2, 12, '2023-03-03 16:53:25', NULL),
(86, 'ced', 'd', 'rtr', 'minato@gmail.com', 1, '123', 1, 12, '2023-03-04 11:25:16', NULL),
(87, 'ftds', 'fggdg', 'cruz', 'ichigo@gmail.com', 1, '13', 1, 12, '2023-03-04 11:25:46', NULL),
(88, 'sadf', 'sdf', 'asdfa', '2pokendo@gmail.com', 1, '202021030', 0, 12, '2023-03-08 00:59:36', NULL),
(90, 'cedric', 'd', 'cruz', 'cruzcedric67@gmail.com', 1, '2020090-M', 0, 12, '2023-04-21 16:40:06', NULL),
(112, 'sharmaine', 'd', 'layco', 'laycosharmaine2@gmail.com', 1, '20200080-M', 1, 12, '2023-05-17 18:10:27', 'qrcodes/6464a81335ae4.png'),
(117, 'Charles', 'D', 'Cruz', 'cruzcedric66@gmail.com', 1, '202000100-M', 1, 12, '2023-05-20 06:20:21', 'qrcodes/6467f6252e8ea.png'),
(118, 'Anwin', 'E', 'Cabrera', '20200087m.cabrera.anwin.bscs@gmail.com', 1, '20200087-M', 0, 12, '2023-05-20 08:31:10', 'qrcodes/646814cee1dae.png'),
(119, 'patrick allen', 'young', 'cabfit', 'patrickallen746@gmail.com', 1, '20200086-M', 1, 12, '2023-05-20 09:02:47', 'qrcodes/64681c371f0e4.png'),
(120, 'Honey', 'Soda', 'Soda', 'honeysoda001@gmail.com', 1, '202011111', 1, 12, '2023-05-22 22:35:56', 'qrcodes/646b7dcc09861.png');

-- --------------------------------------------------------

--
-- Table structure for table `vot_user_votes`
--

CREATE TABLE `vot_user_votes` (
  `user_id` int NOT NULL,
  `user_vot` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_user_votes`
--

INSERT INTO `vot_user_votes` (`user_id`, `user_vot`) VALUES
(95, 76),
(95, 77),
(95, 74),
(95, 75),
(95, 81),
(95, 83),
(95, 0),
(95, 74),
(95, 75),
(95, 76),
(95, 77),
(95, 99),
(95, 77),
(95, 79),
(95, 81),
(95, 83),
(95, 99),
(95, 77),
(95, 74),
(95, 75),
(95, 81),
(95, 83),
(95, 99),
(95, 77),
(95, 74),
(95, 75),
(95, 81),
(95, 83),
(95, 99),
(95, 78),
(95, 79),
(95, 80),
(95, 82),
(95, 83),
(99, 76),
(99, 78),
(99, 74),
(99, 75),
(99, 82),
(99, 83),
(76, 0),
(77, 0),
(74, 0),
(75, 0),
(81, 0),
(83, 0),
(76, 0),
(77, 0),
(74, 0),
(75, 0),
(81, 0),
(83, 0),
(160, 76),
(160, 77),
(160, 74),
(160, 75),
(160, 81),
(160, 83);

-- --------------------------------------------------------

--
-- Table structure for table `vot_year`
--

CREATE TABLE `vot_year` (
  `id` int NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vot_year`
--

INSERT INTO `vot_year` (`id`, `year`, `status`) VALUES
(12, '2022-2023', 1),
(15, '2024-2025', 0),
(16, '2023-2024', 1);

-- --------------------------------------------------------

--
-- Table structure for table `weboms_cart_tb`
--

CREATE TABLE `weboms_cart_tb` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `orderType` int DEFAULT NULL,
  `qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_cart_tb`
--

INSERT INTO `weboms_cart_tb` (`id`, `user_id`, `orderType`, `qty`) VALUES
(1, 5, 1, 900);

-- --------------------------------------------------------

--
-- Table structure for table `weboms_company_tb`
--

CREATE TABLE `weboms_company_tb` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_company_tb`
--

INSERT INTO `weboms_company_tb` (`id`, `name`, `address`, `tel`, `description`) VALUES
(1, 'companyName', 'address', '0000', 'description');

-- --------------------------------------------------------

--
-- Table structure for table `weboms_feedback_tb`
--

CREATE TABLE `weboms_feedback_tb` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weboms_menu_tb`
--

CREATE TABLE `weboms_menu_tb` (
  `orderType` int NOT NULL,
  `dish` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `picName` varchar(255) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `lastModifiedBy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_menu_tb`
--

INSERT INTO `weboms_menu_tb` (`orderType`, `dish`, `price`, `picName`, `stock`, `lastModifiedBy`) VALUES
(1, 'burger steak', 90, '646f712b101203.49469408.png', 998, 'admin'),
(2, 'chicken box', 180, '646f71345bd536.57268205.png', 896, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `weboms_ordersDetail_tb`
--

CREATE TABLE `weboms_ordersDetail_tb` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `orderType` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_ordersDetail_tb`
--

INSERT INTO `weboms_ordersDetail_tb` (`id`, `order_id`, `quantity`, `orderType`) VALUES
(1, 9084, 1, 1),
(2, 9084, 2, 2),
(3, 9085, 1, 1),
(4, 9085, 2, 2),
(5, 9086, 1, 1),
(6, 9086, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `weboms_order_tb`
--

CREATE TABLE `weboms_order_tb` (
  `ID` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `or_number` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `date` datetime NOT NULL,
  `totalOrder` int DEFAULT NULL,
  `payment` int DEFAULT NULL,
  `staffInCharge` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_order_tb`
--

INSERT INTO `weboms_order_tb` (`ID`, `user_id`, `order_id`, `or_number`, `status`, `date`, `totalOrder`, `payment`, `staffInCharge`) VALUES
(1, 2, 9084, 1, 'complete', '2023-05-25 22:32:26', 810, 810, 'online order'),
(2, 2, 9085, 2, 'complete', '2023-05-25 22:40:04', 810, 810, 'online order'),
(3, 2, 9086, 3, 'complete', '2023-05-25 22:41:30', 810, 810, 'online order');

-- --------------------------------------------------------

--
-- Table structure for table `weboms_topUp_tb`
--

CREATE TABLE `weboms_topUp_tb` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `proofOfPayment` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_topUp_tb`
--

INSERT INTO `weboms_topUp_tb` (`id`, `user_id`, `amount`, `status`, `proofOfPayment`, `date`) VALUES
(1, 2, 5000, 'approved', '', '2023-05-25 14:32:17'),
(2, 2, 10, 'approved', '', '2023-05-25 14:42:03'),
(3, 2, 30, 'approved', '', '2023-05-25 14:42:35');

-- --------------------------------------------------------

--
-- Table structure for table `weboms_usedRfid_tb`
--

CREATE TABLE `weboms_usedRfid_tb` (
  `id` int NOT NULL,
  `rfid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_usedRfid_tb`
--

INSERT INTO `weboms_usedRfid_tb` (`id`, `rfid`) VALUES
(1, '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `weboms_userInfo_tb`
--

CREATE TABLE `weboms_userInfo_tb` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picName` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `forgetPasswordOtp` varchar(255) DEFAULT NULL,
  `balance` int DEFAULT NULL,
  `rfid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_userInfo_tb`
--

INSERT INTO `weboms_userInfo_tb` (`id`, `user_id`, `name`, `picName`, `gender`, `age`, `phoneNumber`, `address`, `email`, `otp`, `forgetPasswordOtp`, `balance`, `rfid`) VALUES
(1, 1, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Naruto M. Uzomaki', '646f6ccb28ac41.29408368.png', 'm', 22, '982938471', 'langaray caloocan city2', 'custommemory072@gmail.com', '', NULL, 2610, '1234567890'),
(3, 3, 'May Pearl Regencia Rivera', NULL, 'f', 21, '09203379920', 'Caloocan City', '20200111m.rivera.maypearl.bscs@gmail.com', '', NULL, 0, NULL),
(4, 4, 'jk', NULL, NULL, NULL, NULL, NULL, 'anicetokenneth15@gmail.com', '', NULL, NULL, NULL),
(5, 5, 'Christian Barcheta Espinoza', NULL, 'm', 21, '09926870934', 'Libis Nadurata Caloocan City', 'chrstnspnz11@gmail.com', '', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `weboms_user_tb`
--

CREATE TABLE `weboms_user_tb` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `accountType` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `weboms_user_tb`
--

INSERT INTO `weboms_user_tb` (`id`, `user_id`, `username`, `password`, `accountType`) VALUES
(1, 1, 'admin', '$2y$10$xDFCtVNEM3.sPGRChizTt.n5.Y88fjjLAbTPQHkdlaDXyvwgHWr.6', 'admin'),
(2, 2, 'naruto', '$2y$10$CN7FdBIOUSm7CACnE/0HluOVt3wwfuwDe25XAbBW6ao79H5yrZdUG', 'customer'),
(3, 3, 'May', '$2y$10$lRiyEvTIi853ZpME0hJxCuL6fGLW5TTh.U.S85IMAYS1mM/sB.Ey2', 'customer'),
(4, 4, 'jk', '$2y$10$Hxu/uArXjaxSinEkux4f..Q04fvMjUjJbs.7RE6QbhA5Gjf2Wblcq', 'cashier'),
(5, 5, 'espi', '$2y$10$//y43UxZeVf52ttmYsqzc.7rm0gG4/drzGtgDEeocc1gH9sEqYtuW', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_admins`
--
ALTER TABLE `cms_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_assignments`
--
ALTER TABLE `cms_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_assignments_topic_id_FK_to_topics.id` (`topic_id`);

--
-- Indexes for table `cms_attendance_logs`
--
ALTER TABLE `cms_attendance_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_time_records` (`school_id`,`time_in`,`time_out`,`last_tap_time`) USING BTREE,
  ADD KEY `idx_attendance_logs_school_id` (`school_id`);

--
-- Indexes for table `cms_classes`
--
ALTER TABLE `cms_classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `cms_classrooms`
--
ALTER TABLE `cms_classrooms`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Indexes for table `cms_coordinators`
--
ALTER TABLE `cms_coordinators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_grades`
--
ALTER TABLE `cms_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_grades_student_id_FK_to_students.id` (`student_id`),
  ADD KEY `cms_grades_classroom_id_FK_to_classrooms.id` (`classroom_id`),
  ADD KEY `cms_grades_subject_id_FK_to_subjects.id` (`subject_id`);

--
-- Indexes for table `cms_instructors`
--
ALTER TABLE `cms_instructors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_school_id` (`school_id`);

--
-- Indexes for table `cms_instructors_topics`
--
ALTER TABLE `cms_instructors_topics`
  ADD PRIMARY KEY (`instructors_topics_id`);

--
-- Indexes for table `cms_instructors_topics_assignments`
--
ALTER TABLE `cms_instructors_topics_assignments`
  ADD PRIMARY KEY (`instructors_topics_assignments_id`);

--
-- Indexes for table `cms_instructors_topics_lesson_materials`
--
ALTER TABLE `cms_instructors_topics_lesson_materials`
  ADD PRIMARY KEY (`instructors_topics_lessonMaterials_id`);

--
-- Indexes for table `cms_instructors_topics_quizzes`
--
ALTER TABLE `cms_instructors_topics_quizzes`
  ADD PRIMARY KEY (`instructors_topics_quizzes_id`);

--
-- Indexes for table `cms_lesson_materials`
--
ALTER TABLE `cms_lesson_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_lesson_materials_topic_id_FK_to_topics.id` (`topic_id`);

--
-- Indexes for table `cms_profileimg`
--
ALTER TABLE `cms_profileimg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_pwdReset`
--
ALTER TABLE `cms_pwdReset`
  ADD PRIMARY KEY (`pwdResetId`);

--
-- Indexes for table `cms_quizzes`
--
ALTER TABLE `cms_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_quizzes_topic_id_FK_to_topics.id` (`topic_id`);

--
-- Indexes for table `cms_quizzes_answers`
--
ALTER TABLE `cms_quizzes_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_quizzes_answers_quiz_question_id_FK_to_quiz_questions.id` (`quiz_question_id`);

--
-- Indexes for table `cms_quizzes_questions`
--
ALTER TABLE `cms_quizzes_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_quizzes_questions_quiz_id_FK_to_quiz.id` (`quiz_id`);

--
-- Indexes for table `cms_schedule`
--
ALTER TABLE `cms_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_scores`
--
ALTER TABLE `cms_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_scores_student_id_FK_to_students.id` (`student_id`),
  ADD KEY `cms_scores_classroom_id_FK_to_classrooms.id` (`classroom_id`),
  ADD KEY `cms_scores_assignment_id_FK_to_assignments.id` (`assignment_id`),
  ADD KEY `cms_scores_quiz_id_FK_to_quiz.id` (`quiz_id`);

--
-- Indexes for table `cms_sectionList`
--
ALTER TABLE `cms_sectionList`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_sections`
--
ALTER TABLE `cms_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_students`
--
ALTER TABLE `cms_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_school_id` (`school_id`);

--
-- Indexes for table `cms_student_assignments`
--
ALTER TABLE `cms_student_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_student_assignments_assignment_id_FK_to_assignments.id` (`assignment_id`),
  ADD KEY `cms_student_assignments_student_id_FK_to_students.id` (`student_id`);

--
-- Indexes for table `cms_subjects`
--
ALTER TABLE `cms_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_topics`
--
ALTER TABLE `cms_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_topics_instructor_id_FK_to_instructors.id` (`instructor_id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_school_id` (`school_id`);

--
-- Indexes for table `fgms_schedule_list`
--
ALTER TABLE `fgms_schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fgms_tbl_events`
--
ALTER TABLE `fgms_tbl_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fgms_tb_upload`
--
ALTER TABLE `fgms_tb_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fgms_useracc`
--
ALTER TABLE `fgms_useracc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fgms_userdata`
--
ALTER TABLE `fgms_userdata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fgms_usertable`
--
ALTER TABLE `fgms_usertable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrs_tbladmin`
--
ALTER TABLE `hrs_tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrs_tblbooking`
--
ALTER TABLE `hrs_tblbooking`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrs_tblcategory`
--
ALTER TABLE `hrs_tblcategory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `hrs_tblcontact`
--
ALTER TABLE `hrs_tblcontact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrs_tblfacility`
--
ALTER TABLE `hrs_tblfacility`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrs_tblpage`
--
ALTER TABLE `hrs_tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrs_tblrfid`
--
ALTER TABLE `hrs_tblrfid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hrs_tblroom`
--
ALTER TABLE `hrs_tblroom`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RoomType` (`RoomType`);

--
-- Indexes for table `hrs_tblroomnumber`
--
ALTER TABLE `hrs_tblroomnumber`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrs_tblstaff`
--
ALTER TABLE `hrs_tblstaff`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrs_tbluser`
--
ALTER TABLE `hrs_tbluser`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `jaks_admin_account`
--
ALTER TABLE `jaks_admin_account`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_booknow`
--
ALTER TABLE `jaks_booknow`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_brands`
--
ALTER TABLE `jaks_brands`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_carlist`
--
ALTER TABLE `jaks_carlist`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jaks_car_details`
--
ALTER TABLE `jaks_car_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jaks_coding`
--
ALTER TABLE `jaks_coding`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jaks_contact_us`
--
ALTER TABLE `jaks_contact_us`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_fuel`
--
ALTER TABLE `jaks_fuel`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_login`
--
ALTER TABLE `jaks_login`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_name_type`
--
ALTER TABLE `jaks_name_type`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_seater`
--
ALTER TABLE `jaks_seater`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_staff_account`
--
ALTER TABLE `jaks_staff_account`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_transmission`
--
ALTER TABLE `jaks_transmission`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_useraccount`
--
ALTER TABLE `jaks_useraccount`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `jaks_verify_acc`
--
ALTER TABLE `jaks_verify_acc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lms_books`
--
ALTER TABLE `lms_books`
  ADD PRIMARY KEY (`Accession`);

--
-- Indexes for table `lms_login`
--
ALTER TABLE `lms_login`
  ADD PRIMARY KEY (`StudentNo`);

--
-- Indexes for table `lms_message`
--
ALTER TABLE `lms_message`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `StudentNo` (`StudentNo`);

--
-- Indexes for table `lms_records`
--
ALTER TABLE `lms_records`
  ADD PRIMARY KEY (`R_ID`);

--
-- Indexes for table `lms_record_for_extend`
--
ALTER TABLE `lms_record_for_extend`
  ADD PRIMARY KEY (`StudentNo`,`Accession`),
  ADD KEY `Accession` (`Accession`);

--
-- Indexes for table `lms_record_for_return`
--
ALTER TABLE `lms_record_for_return`
  ADD PRIMARY KEY (`StudentNo`,`Accession`),
  ADD KEY `Accession` (`Accession`);

--
-- Indexes for table `lms_suggestion`
--
ALTER TABLE `lms_suggestion`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `StudentNo` (`StudentNo`);

--
-- Indexes for table `lms_users`
--
ALTER TABLE `lms_users`
  ADD PRIMARY KEY (`StudentNo`),
  ADD KEY `Email` (`Email`);

--
-- Indexes for table `smarttrashcan_tb`
--
ALTER TABLE `smarttrashcan_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_accpaidaddmission`
--
ALTER TABLE `uccp_accpaidaddmission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_accpaidenrollment`
--
ALTER TABLE `uccp_accpaidenrollment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_add_courses`
--
ALTER TABLE `uccp_add_courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_adminacc_tbl`
--
ALTER TABLE `uccp_adminacc_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_admission`
--
ALTER TABLE `uccp_admission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_admission_billing`
--
ALTER TABLE `uccp_admission_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_admission_schedule`
--
ALTER TABLE `uccp_admission_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_approvedcurriculum`
--
ALTER TABLE `uccp_approvedcurriculum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_bor_tbl`
--
ALTER TABLE `uccp_bor_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_course`
--
ALTER TABLE `uccp_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_coursefee`
--
ALTER TABLE `uccp_coursefee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_curriculum`
--
ALTER TABLE `uccp_curriculum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_enrolled`
--
ALTER TABLE `uccp_enrolled`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_enrollee`
--
ALTER TABLE `uccp_enrollee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_enrollment_billing`
--
ALTER TABLE `uccp_enrollment_billing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_enrollment_schedule`
--
ALTER TABLE `uccp_enrollment_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_eval`
--
ALTER TABLE `uccp_eval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_examinees`
--
ALTER TABLE `uccp_examinees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_examsched`
--
ALTER TABLE `uccp_examsched`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_grading`
--
ALTER TABLE `uccp_grading`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_gradingsystem_tbl`
--
ALTER TABLE `uccp_gradingsystem_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_ht_tbl`
--
ALTER TABLE `uccp_ht_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_irregular`
--
ALTER TABLE `uccp_irregular`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_login`
--
ALTER TABLE `uccp_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_masterlist`
--
ALTER TABLE `uccp_masterlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_news_tbl`
--
ALTER TABLE `uccp_news_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_passers`
--
ALTER TABLE `uccp_passers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_professor`
--
ALTER TABLE `uccp_professor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_sched`
--
ALTER TABLE `uccp_sched`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_section`
--
ALTER TABLE `uccp_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_studentinfo`
--
ALTER TABLE `uccp_studentinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uccp_xo_tbl`
--
ALTER TABLE `uccp_xo_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_accountlist`
--
ALTER TABLE `vet_accountlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_accountlist_client`
--
ALTER TABLE `vet_accountlist_client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_appointment_list`
--
ALTER TABLE `vet_appointment_list`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `vet_branch`
--
ALTER TABLE `vet_branch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `vet_logs`
--
ALTER TABLE `vet_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_mobile`
--
ALTER TABLE `vet_mobile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_rfid`
--
ALTER TABLE `vet_rfid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_rfid_list`
--
ALTER TABLE `vet_rfid_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_rfid_veri`
--
ALTER TABLE `vet_rfid_veri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_schedule_list`
--
ALTER TABLE `vet_schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_service`
--
ALTER TABLE `vet_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_walk`
--
ALTER TABLE `vet_walk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vet_walkin_list`
--
ALTER TABLE `vet_walkin_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_candidates`
--
ALTER TABLE `vot_candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_cat_user`
--
ALTER TABLE `vot_cat_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_course`
--
ALTER TABLE `vot_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_logs`
--
ALTER TABLE `vot_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_party_list`
--
ALTER TABLE `vot_party_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_position`
--
ALTER TABLE `vot_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_session`
--
ALTER TABLE `vot_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_users`
--
ALTER TABLE `vot_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_user_profile`
--
ALTER TABLE `vot_user_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vot_year`
--
ALTER TABLE `vot_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_cart_tb`
--
ALTER TABLE `weboms_cart_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_company_tb`
--
ALTER TABLE `weboms_company_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_feedback_tb`
--
ALTER TABLE `weboms_feedback_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_menu_tb`
--
ALTER TABLE `weboms_menu_tb`
  ADD PRIMARY KEY (`orderType`);

--
-- Indexes for table `weboms_ordersDetail_tb`
--
ALTER TABLE `weboms_ordersDetail_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_order_tb`
--
ALTER TABLE `weboms_order_tb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `weboms_topUp_tb`
--
ALTER TABLE `weboms_topUp_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_usedRfid_tb`
--
ALTER TABLE `weboms_usedRfid_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_userInfo_tb`
--
ALTER TABLE `weboms_userInfo_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weboms_user_tb`
--
ALTER TABLE `weboms_user_tb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_admins`
--
ALTER TABLE `cms_admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `cms_assignments`
--
ALTER TABLE `cms_assignments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_attendance_logs`
--
ALTER TABLE `cms_attendance_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `cms_classes`
--
ALTER TABLE `cms_classes`
  MODIFY `class_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `cms_classrooms`
--
ALTER TABLE `cms_classrooms`
  MODIFY `classroom_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `cms_coordinators`
--
ALTER TABLE `cms_coordinators`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cms_grades`
--
ALTER TABLE `cms_grades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_instructors`
--
ALTER TABLE `cms_instructors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `cms_instructors_topics`
--
ALTER TABLE `cms_instructors_topics`
  MODIFY `instructors_topics_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cms_instructors_topics_assignments`
--
ALTER TABLE `cms_instructors_topics_assignments`
  MODIFY `instructors_topics_assignments_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_instructors_topics_lesson_materials`
--
ALTER TABLE `cms_instructors_topics_lesson_materials`
  MODIFY `instructors_topics_lessonMaterials_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_instructors_topics_quizzes`
--
ALTER TABLE `cms_instructors_topics_quizzes`
  MODIFY `instructors_topics_quizzes_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_lesson_materials`
--
ALTER TABLE `cms_lesson_materials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_profileimg`
--
ALTER TABLE `cms_profileimg`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `cms_pwdReset`
--
ALTER TABLE `cms_pwdReset`
  MODIFY `pwdResetId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `cms_quizzes`
--
ALTER TABLE `cms_quizzes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_quizzes_answers`
--
ALTER TABLE `cms_quizzes_answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_quizzes_questions`
--
ALTER TABLE `cms_quizzes_questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_schedule`
--
ALTER TABLE `cms_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cms_scores`
--
ALTER TABLE `cms_scores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_sectionList`
--
ALTER TABLE `cms_sectionList`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cms_sections`
--
ALTER TABLE `cms_sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cms_students`
--
ALTER TABLE `cms_students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `cms_student_assignments`
--
ALTER TABLE `cms_student_assignments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_subjects`
--
ALTER TABLE `cms_subjects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1405;

--
-- AUTO_INCREMENT for table `cms_topics`
--
ALTER TABLE `cms_topics`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `fgms_schedule_list`
--
ALTER TABLE `fgms_schedule_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fgms_tbl_events`
--
ALTER TABLE `fgms_tbl_events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fgms_tb_upload`
--
ALTER TABLE `fgms_tb_upload`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `fgms_useracc`
--
ALTER TABLE `fgms_useracc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fgms_userdata`
--
ALTER TABLE `fgms_userdata`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fgms_usertable`
--
ALTER TABLE `fgms_usertable`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `hrs_tbladmin`
--
ALTER TABLE `hrs_tbladmin`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hrs_tblbooking`
--
ALTER TABLE `hrs_tblbooking`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `hrs_tblcategory`
--
ALTER TABLE `hrs_tblcategory`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hrs_tblcontact`
--
ALTER TABLE `hrs_tblcontact`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hrs_tblfacility`
--
ALTER TABLE `hrs_tblfacility`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `hrs_tblpage`
--
ALTER TABLE `hrs_tblpage`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hrs_tblrfid`
--
ALTER TABLE `hrs_tblrfid`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hrs_tblroom`
--
ALTER TABLE `hrs_tblroom`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hrs_tblroomnumber`
--
ALTER TABLE `hrs_tblroomnumber`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hrs_tblstaff`
--
ALTER TABLE `hrs_tblstaff`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hrs_tbluser`
--
ALTER TABLE `hrs_tbluser`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `jaks_admin_account`
--
ALTER TABLE `jaks_admin_account`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jaks_booknow`
--
ALTER TABLE `jaks_booknow`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jaks_brands`
--
ALTER TABLE `jaks_brands`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `jaks_carlist`
--
ALTER TABLE `jaks_carlist`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jaks_car_details`
--
ALTER TABLE `jaks_car_details`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `jaks_coding`
--
ALTER TABLE `jaks_coding`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jaks_contact_us`
--
ALTER TABLE `jaks_contact_us`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jaks_fuel`
--
ALTER TABLE `jaks_fuel`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jaks_login`
--
ALTER TABLE `jaks_login`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `jaks_name_type`
--
ALTER TABLE `jaks_name_type`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jaks_seater`
--
ALTER TABLE `jaks_seater`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jaks_staff_account`
--
ALTER TABLE `jaks_staff_account`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jaks_transmission`
--
ALTER TABLE `jaks_transmission`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jaks_useraccount`
--
ALTER TABLE `jaks_useraccount`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `jaks_verify_acc`
--
ALTER TABLE `jaks_verify_acc`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `lms_message`
--
ALTER TABLE `lms_message`
  MODIFY `message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `lms_records`
--
ALTER TABLE `lms_records`
  MODIFY `R_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `lms_suggestion`
--
ALTER TABLE `lms_suggestion`
  MODIFY `R_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `smarttrashcan_tb`
--
ALTER TABLE `smarttrashcan_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uccp_accpaidaddmission`
--
ALTER TABLE `uccp_accpaidaddmission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=614;

--
-- AUTO_INCREMENT for table `uccp_accpaidenrollment`
--
ALTER TABLE `uccp_accpaidenrollment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=547;

--
-- AUTO_INCREMENT for table `uccp_add_courses`
--
ALTER TABLE `uccp_add_courses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `uccp_adminacc_tbl`
--
ALTER TABLE `uccp_adminacc_tbl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `uccp_admission`
--
ALTER TABLE `uccp_admission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=614;

--
-- AUTO_INCREMENT for table `uccp_admission_billing`
--
ALTER TABLE `uccp_admission_billing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=614;

--
-- AUTO_INCREMENT for table `uccp_admission_schedule`
--
ALTER TABLE `uccp_admission_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `uccp_approvedcurriculum`
--
ALTER TABLE `uccp_approvedcurriculum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `uccp_bor_tbl`
--
ALTER TABLE `uccp_bor_tbl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'board of regents id', AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `uccp_course`
--
ALTER TABLE `uccp_course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `uccp_coursefee`
--
ALTER TABLE `uccp_coursefee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `uccp_curriculum`
--
ALTER TABLE `uccp_curriculum`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `uccp_enrolled`
--
ALTER TABLE `uccp_enrolled`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `uccp_enrollee`
--
ALTER TABLE `uccp_enrollee`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=534;

--
-- AUTO_INCREMENT for table `uccp_enrollment_billing`
--
ALTER TABLE `uccp_enrollment_billing`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `uccp_enrollment_schedule`
--
ALTER TABLE `uccp_enrollment_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `uccp_eval`
--
ALTER TABLE `uccp_eval`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `uccp_examinees`
--
ALTER TABLE `uccp_examinees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=614;

--
-- AUTO_INCREMENT for table `uccp_examsched`
--
ALTER TABLE `uccp_examsched`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `uccp_grading`
--
ALTER TABLE `uccp_grading`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `uccp_gradingsystem_tbl`
--
ALTER TABLE `uccp_gradingsystem_tbl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `uccp_ht_tbl`
--
ALTER TABLE `uccp_ht_tbl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `uccp_irregular`
--
ALTER TABLE `uccp_irregular`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `uccp_login`
--
ALTER TABLE `uccp_login`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `uccp_masterlist`
--
ALTER TABLE `uccp_masterlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `uccp_news_tbl`
--
ALTER TABLE `uccp_news_tbl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `uccp_passers`
--
ALTER TABLE `uccp_passers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=608;

--
-- AUTO_INCREMENT for table `uccp_professor`
--
ALTER TABLE `uccp_professor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `uccp_sched`
--
ALTER TABLE `uccp_sched`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `uccp_section`
--
ALTER TABLE `uccp_section`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `uccp_studentinfo`
--
ALTER TABLE `uccp_studentinfo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `uccp_xo_tbl`
--
ALTER TABLE `uccp_xo_tbl`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'executive offices id', AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `vet_accountlist`
--
ALTER TABLE `vet_accountlist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `vet_accountlist_client`
--
ALTER TABLE `vet_accountlist_client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `vet_appointment_list`
--
ALTER TABLE `vet_appointment_list`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `vet_branch`
--
ALTER TABLE `vet_branch`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `vet_logs`
--
ALTER TABLE `vet_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `vet_mobile`
--
ALTER TABLE `vet_mobile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vet_rfid`
--
ALTER TABLE `vet_rfid`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `vet_rfid_list`
--
ALTER TABLE `vet_rfid_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `vet_rfid_veri`
--
ALTER TABLE `vet_rfid_veri`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `vet_schedule_list`
--
ALTER TABLE `vet_schedule_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vet_service`
--
ALTER TABLE `vet_service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `vet_walk`
--
ALTER TABLE `vet_walk`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vet_walkin_list`
--
ALTER TABLE `vet_walkin_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `vot_candidates`
--
ALTER TABLE `vot_candidates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `vot_cat_user`
--
ALTER TABLE `vot_cat_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vot_course`
--
ALTER TABLE `vot_course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `vot_logs`
--
ALTER TABLE `vot_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vot_party_list`
--
ALTER TABLE `vot_party_list`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vot_position`
--
ALTER TABLE `vot_position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `vot_session`
--
ALTER TABLE `vot_session`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vot_users`
--
ALTER TABLE `vot_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `vot_user_profile`
--
ALTER TABLE `vot_user_profile`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `vot_year`
--
ALTER TABLE `vot_year`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `weboms_cart_tb`
--
ALTER TABLE `weboms_cart_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `weboms_company_tb`
--
ALTER TABLE `weboms_company_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `weboms_feedback_tb`
--
ALTER TABLE `weboms_feedback_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weboms_menu_tb`
--
ALTER TABLE `weboms_menu_tb`
  MODIFY `orderType` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `weboms_ordersDetail_tb`
--
ALTER TABLE `weboms_ordersDetail_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `weboms_order_tb`
--
ALTER TABLE `weboms_order_tb`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `weboms_topUp_tb`
--
ALTER TABLE `weboms_topUp_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `weboms_usedRfid_tb`
--
ALTER TABLE `weboms_usedRfid_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `weboms_userInfo_tb`
--
ALTER TABLE `weboms_userInfo_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `weboms_user_tb`
--
ALTER TABLE `weboms_user_tb`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cms_assignments`
--
ALTER TABLE `cms_assignments`
  ADD CONSTRAINT `cms_assignments_topic_id_FK_to_topics.id` FOREIGN KEY (`topic_id`) REFERENCES `cms_topics` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_grades`
--
ALTER TABLE `cms_grades`
  ADD CONSTRAINT `cms_grades_classroom_id_FK_to_classrooms.id` FOREIGN KEY (`classroom_id`) REFERENCES `cms_classrooms` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cms_grades_student_id_FK_to_students.id` FOREIGN KEY (`student_id`) REFERENCES `cms_students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cms_grades_subject_id_FK_to_subjects.id` FOREIGN KEY (`subject_id`) REFERENCES `cms_subjects` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_lesson_materials`
--
ALTER TABLE `cms_lesson_materials`
  ADD CONSTRAINT `cms_lesson_materials_topic_id_FK_to_topics.id` FOREIGN KEY (`topic_id`) REFERENCES `cms_topics` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_quizzes`
--
ALTER TABLE `cms_quizzes`
  ADD CONSTRAINT `cms_quizzes_topic_id_FK_to_topics.id` FOREIGN KEY (`topic_id`) REFERENCES `cms_topics` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_quizzes_answers`
--
ALTER TABLE `cms_quizzes_answers`
  ADD CONSTRAINT `cms_quizzes_answers_quiz_question_id_FK_to_quiz_questions.id` FOREIGN KEY (`quiz_question_id`) REFERENCES `cms_quizzes_questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_quizzes_questions`
--
ALTER TABLE `cms_quizzes_questions`
  ADD CONSTRAINT `cms_quizzes_questions_quiz_id_FK_to_quiz.id` FOREIGN KEY (`quiz_id`) REFERENCES `cms_quizzes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_scores`
--
ALTER TABLE `cms_scores`
  ADD CONSTRAINT `cms_scores_assignment_id_FK_to_assignments.id` FOREIGN KEY (`assignment_id`) REFERENCES `cms_assignments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cms_scores_classroom_id_FK_to_classrooms.id` FOREIGN KEY (`classroom_id`) REFERENCES `cms_classrooms` (`classroom_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cms_scores_quiz_id_FK_to_quiz.id` FOREIGN KEY (`quiz_id`) REFERENCES `cms_quizzes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cms_scores_student_id_FK_to_students.id` FOREIGN KEY (`student_id`) REFERENCES `cms_students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_student_assignments`
--
ALTER TABLE `cms_student_assignments`
  ADD CONSTRAINT `cms_student_assignments_assignment_id_FK_to_assignments.id` FOREIGN KEY (`assignment_id`) REFERENCES `cms_assignments` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cms_student_assignments_student_id_FK_to_students.id` FOREIGN KEY (`student_id`) REFERENCES `cms_students` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cms_topics`
--
ALTER TABLE `cms_topics`
  ADD CONSTRAINT `cms_topics_instructor_id_FK_to_instructors.id` FOREIGN KEY (`instructor_id`) REFERENCES `cms_instructors` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
