create database Library_management_system

use Library_management_system

-- Library Management System Database Schema

-- Table for storing authors
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Biography TEXT
);

-- Table for storing books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Quantity_Available INT NOT NULL,
    AuthorID INT,
    CONSTRAINT FK_AuthorID_Books FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Index on ISBN column for faster lookup
CREATE INDEX idx_ISBN ON Books (ISBN);

-- Table for storing borrowers
CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- Index on Email column for faster lookup
CREATE INDEX idx_Email ON Borrowers (Email);

-- Table for storing loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT NOT NULL,
    BorrowerID INT NOT NULL,
    Loan_Date DATE NOT NULL,
    Due_Date DATE NOT NULL,
    CONSTRAINT FK_BookID_Loans FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT FK_BorrowerID_Loans FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

-- Index on BookID column for faster lookup
CREATE INDEX idx_BookID_Loans ON Loans (BookID);
