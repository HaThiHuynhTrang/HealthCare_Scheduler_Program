-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: healthcare
-- ------------------------------------------------------
-- Server version	8.0.45
create database IF NOT EXISTS healthcare_db;
USE healthcare_db;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  `AppointmentDate` date DEFAULT NULL,
  `AppointmentTime` time DEFAULT NULL,
  `Status` enum('Pending','Confirmed','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`AppointmentID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_specialties`
--

DROP TABLE IF EXISTS `disease_specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_specialties` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DiseaseID` int DEFAULT NULL,
  `SpecialtyID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DiseaseID` (`DiseaseID`),
  KEY `SpecialtyID` (`SpecialtyID`),
  CONSTRAINT `disease_specialties_ibfk_1` FOREIGN KEY (`DiseaseID`) REFERENCES `diseases` (`DiseaseID`),
  CONSTRAINT `disease_specialties_ibfk_2` FOREIGN KEY (`SpecialtyID`) REFERENCES `specialties` (`SpecialtyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_specialties`
--

LOCK TABLES `disease_specialties` WRITE;
/*!40000 ALTER TABLE `disease_specialties` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease_specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `DiseaseID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DiseaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `DoctorID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `SpecialtyID` int DEFAULT NULL,
  `ExperienceYears` int DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  KEY `UserID` (`UserID`),
  KEY `SpecialtyID` (`SpecialtyID`),
  CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`SpecialtyID`) REFERENCES `specialties` (`SpecialtyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialties`
--

DROP TABLE IF EXISTS `specialties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialties` (
  `SpecialtyID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SpecialtyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialties`
--

LOCK TABLES `specialties` WRITE;
/*!40000 ALTER TABLE `specialties` DISABLE KEYS */;
/*!40000 ALTER TABLE `specialties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Role` enum('Patient','Doctor','Admin') DEFAULT 'Patient',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

USE healthcare_db;

-- USERS

INSERT INTO users (FullName, Email, Password, Role)
VALUES
('Nguyen Van A', 'a@gmail.com', '123456', 'Patient'),
('Tran Thi B', 'b@gmail.com', '123456', 'Patient'),
('Le Van C', 'c@gmail.com', '123456', 'Patient'),
('Pham Thi D', 'd@gmail.com', '123456', 'Patient'),
('Hoang Van E', 'e@gmail.com', '123456', 'Doctor'),
('Vo Thi F', 'f@gmail.com', '123456', 'Doctor'),
('Dang Van G', 'g@gmail.com', '123456', 'Doctor'),
('Nguyen Thi H', 'h@gmail.com', '123456', 'Patient'),
('Tran Van I', 'i@gmail.com', '123456', 'Patient'),
('Admin System', 'admin@gmail.com', 'admin123', 'Admin');



-- SPECIALTIES

INSERT INTO specialties (Name)
VALUES
('Cardiology'),
('Dermatology'),
('Neurology'),
('Pediatrics'),
('Orthopedics'),
('Psychiatry'),
('Oncology'),
('ENT'),
('Ophthalmology'),
('General Medicine');



-- DISEASES

INSERT INTO diseases (Name)
VALUES
('Heart Disease'),
('Skin Allergy'),
('Migraine'),
('Flu'),
('Bone Fracture'),
('Depression'),
('Cancer'),
('Ear Infection'),
('Eye Infection'),
('Diabetes');



-- DOCTORS

INSERT INTO doctors (UserID, SpecialtyID, ExperienceYears)
VALUES
(5, 1, 10),
(6, 2, 7),
(7, 3, 12),
(5, 4, 8),
(6, 5, 6),
(7, 6, 9),
(5, 7, 15),
(6, 8, 11),
(7, 9, 5),
(5, 10, 13);



-- DISEASE_SPECIALTIES

INSERT INTO disease_specialties (DiseaseID, SpecialtyID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);



-- APPOINTMENTS

INSERT INTO appointments
(PatientID, DoctorID, AppointmentDate, AppointmentTime, Status)
VALUES
(1,1,'2026-05-20','08:00:00','Pending'),
(2,2,'2026-05-21','09:00:00','Confirmed'),
(3,3,'2026-05-22','10:00:00','Cancelled'),
(4,4,'2026-05-23','11:00:00','Pending'),
(8,5,'2026-05-24','13:00:00','Confirmed'),
(9,6,'2026-05-25','14:00:00','Pending'),
(1,7,'2026-05-26','15:00:00','Confirmed'),
(2,8,'2026-05-27','16:00:00','Cancelled'),
(3,9,'2026-05-28','17:00:00','Pending'),
(4,10,'2026-05-29','18:00:00','Confirmed');
-- Dump completed on 2026-03-20 21:53:39
