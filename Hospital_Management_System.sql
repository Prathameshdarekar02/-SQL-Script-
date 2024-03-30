create database Hospital_Management_System

use Hospital_Management_System

-- Hospital Management System Database Schema

-- Table for storing patients
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Contact VARCHAR(100)
);

-- Index on PatientName column for faster lookup
CREATE INDEX idx_PatientName ON Patients (PatientName);

-- Table for storing doctors
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100),
    Contact VARCHAR(100)
);

-- Index on DoctorName column for faster lookup
CREATE INDEX idx_DoctorName ON Doctors (DoctorName);

-- Table for storing appointments
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE,
    AppointmentTime TIME,
    CONSTRAINT FK_PatientID_Appointments FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT FK_DoctorID_Appointments FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Index on AppointmentDate column for faster lookup
CREATE INDEX idx_AppointmentDate ON Appointments (AppointmentDate);

-- Table for storing medical records
CREATE TABLE MedicalRecords (
    RecordID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    Diagnosis VARCHAR(255), -- Changed data type to VARCHAR
    Treatment TEXT,
    Prescription TEXT,
    CONSTRAINT FK_PatientID_MedicalRecords FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT FK_DoctorID_MedicalRecords FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Index on Diagnosis column for faster lookup
CREATE INDEX idx_Diagnosis ON MedicalRecords (Diagnosis);
