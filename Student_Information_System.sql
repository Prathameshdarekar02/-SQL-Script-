create database Student_information_system

use Student_information_system

-- Student Information System Database Schema

-- Table for storing students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL, 
    Last_Name VARCHAR(50) NOT NULL,  
    Email VARCHAR(100) UNIQUE NOT NULL,
    Gender VARCHAR(10),               
    Date_Of_Birth DATE,               
    Address VARCHAR(200),             
    Phone_Number VARCHAR(20)         
);

-- Table for storing courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    Instructor VARCHAR(100)
);

-- Table for storing grades
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Grade DECIMAL(5, 2),
    CONSTRAINT FK_StudentID_Grades FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_CourseID_Grades FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    CONSTRAINT CHK_Grade CHECK (Grade >= 0 AND Grade <= 100)
);

-- Table for storing enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Enrollment_Date DATE NOT NULL,   
    CONSTRAINT FK_StudentID_Enrollments FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_CourseID_Enrollments FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
