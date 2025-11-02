CREATE DATABASE CustomerDB;

USE CustomerDB;


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country)
VALUES
('Rahul', 'Sharma', 'rahul.sharma@email.com', '9876543210', 'MG Road', 'Pune', 'Maharashtra', '411001', 'India'),
('Sneha', 'Patil', 'sneha.patil@email.com', '9123456780', 'FC Road', 'Mumbai', 'Maharashtra', '400001', 'India');