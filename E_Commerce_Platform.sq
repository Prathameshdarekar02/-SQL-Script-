-- E-commerce Platform Database Schema

-- Table for storing product categories
CREATE TABLE ProductCategories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);

-- Index on CategoryName column for faster lookup
CREATE INDEX idx_CategoryName ON ProductCategories (CategoryName);

-- Table for storing products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CategoryID INT,
    CONSTRAINT FK_CategoryID_Products FOREIGN KEY (CategoryID) REFERENCES ProductCategories(CategoryID),
    CONSTRAINT CHK_ProductPrice CHECK (Price >= 0),
    CONSTRAINT CHK_ProductStock CHECK (StockQuantity >= 0)
);

-- Index on ProductName column for faster lookup
CREATE INDEX idx_ProductName ON Products (ProductName);

-- Table for storing customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(200)
);

-- Index on Email column for faster lookup
CREATE INDEX idx_Email ON Customers (Email);

-- Table for storing orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_CustomerID_Orders FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Index on OrderDate column for faster lookup
CREATE INDEX idx_OrderDate ON Orders (OrderDate);

-- Table for storing order details
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_OrderID_OrderDetails FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_ProductID_OrderDetails FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    CONSTRAINT CHK_OrderDetailQuantity CHECK (Quantity > 0),
    CONSTRAINT CHK_OrderDetailPrice CHECK (Price >= 0)
);

-- Index on OrderID column for faster lookup
CREATE INDEX idx_OrderID ON OrderDetails (OrderID);

-- Table for tracking order status
CREATE TABLE OrderStatus (
    StatusID INT PRIMARY KEY,
    StatusName VARCHAR(50) NOT NULL
);

-- Index on StatusName column for faster lookup
CREATE INDEX idx_StatusName ON OrderStatus (StatusName);

-- Table for linking orders to order status
CREATE TABLE OrderStatusMapping (
    OrderID INT NOT NULL,
    StatusID INT NOT NULL,
    StatusDate DATE NOT NULL,
    CONSTRAINT PK_OrderStatusMapping PRIMARY KEY (OrderID, StatusID, StatusDate),
    CONSTRAINT FK_OrderID_OrderStatusMapping FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_StatusID_OrderStatusMapping FOREIGN KEY (StatusID) REFERENCES OrderStatus(StatusID)
);

-- Index on StatusDate column for faster lookup
CREATE INDEX idx_StatusDate ON OrderStatusMapping (StatusDate);

-- Table for storing customer accounts
CREATE TABLE CustomerAccounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL, -- Hashed password
    CONSTRAINT FK_CustomerID_CustomerAccounts FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Index on Username column for faster lookup
CREATE INDEX idx_Username ON CustomerAccounts (Username);
