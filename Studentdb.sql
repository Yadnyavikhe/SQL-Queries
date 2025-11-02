CREATE DATABASE Studentdb;

USE StudentDB;

CREATE TABLE Students(
StudentID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(10),
LastName VARCHAR(10),
Email VARCHAR(50),
Phone VARCHAR(15),
DateOfBirth DATE,
Gender VARCHAR(10),
Address VARCHAR(20),
City VARCHAR(50),
State VARCHAR(10));

INSERT INTO Students 
(FirstName,LastName,Phone,DateOfBirth,Gender,City)VALUES
     ('Yadnya','Vikhe','9878654323','2005-01-04','Female','Pune'),
     ('Rutuja','Khatal','9818657893','2004-11-20','Female','Mumbai'),
     ('Amit', 'Kumar','9876543210', '2002-05-12', 'Male','New Delhi'),
     ('Priya', 'Sharma','9123456780', '2003-08-20', 'Female','Pune');