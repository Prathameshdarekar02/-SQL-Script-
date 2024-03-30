create database online_store

use online_store

-- Online Store Database Schema

-- Table for storing products
CREATE TABLE StoreProducts (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CONSTRAINT CHK_ProductPrice CHECK (Price >= 0),
    CONSTRAINT CHK_ProductStock CHECK (StockQuantity >= 0)
);

-- Table for storing customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- Table for storing orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table for storing order details
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES StoreProducts(ProductID),
    CONSTRAINT CHK_OrderDetailQuantity CHECK (Quantity > 0),
    CONSTRAINT CHK_OrderDetailPrice CHECK (Price >= 0)
);
