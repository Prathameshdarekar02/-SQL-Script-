create database Employee_Management_System

use Employee_Management_System

-- Employee Management System Database Schema

-- Table for storing employee information
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2),
    CONSTRAINT CHK_Salary CHECK (Salary >= 0)
);

-- Table for storing department information
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Table for storing employee addresses
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    AddressLine1 VARCHAR(100),
    AddressLine2 VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table for storing employee contact information
CREATE TABLE Contacts (
    ContactID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table for storing employee projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATE,
    EndDate DATE
);

-- Table for mapping employees to projects (many-to-many relationship)
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    PRIMARY KEY (EmployeeID, ProjectID)
);

-- Indexes
CREATE INDEX idx_Employee_Department ON Employees (Department);
CREATE INDEX idx_Employee_Position ON Employees (Position);
CREATE INDEX idx_Project_Name ON Projects (ProjectName);
