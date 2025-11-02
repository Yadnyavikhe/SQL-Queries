CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- 1️ Customer Table
CREATE TABLE Customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15),
  city VARCHAR(50)
);
-- 2️ Product Table
CREATE TABLE Product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10,2),
  stock INT
);
-- 3️ Orders Table
CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
-- 4 Order_Details Table
CREATE TABLE Order_Details (
  order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
-- 5️ Delivery Table
CREATE TABLE Delivery (
  delivery_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  delivery_date DATE,
  status VARCHAR(30),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
-- Customer Data
INSERT INTO Customer (name, email, phone, city) VALUES
('Ravi Patel', 'ravi@gmail.com', '9876543210', 'Mumbai'),
('Priya Sharma', 'priya@yahoo.com', '9123456789', 'Pune'),
('Amit Verma', 'amit@gmail.com', '9988776655', 'Delhi'),
('Sneha Nair', 'sneha@gmail.com', '9090909090', 'Bangalore'),
('Rahul Singh', 'rahul@gmail.com', '9876501234', 'Chennai');

-- Product Data
INSERT INTO Product (name, category, price, stock) VALUES
('Laptop', 'Electronics', 55000.00, 20),
('Mobile', 'Electronics', 22000.00, 50),
('Headphones', 'Accessories', 1500.00, 100),
('T-Shirt', 'Clothing', 800.00, 200),
('Shoes', 'Footwear', 3000.00, 120);

-- Orders Data
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2025-09-20', 57000.00),
(2, '2025-09-21', 23500.00),
(3, '2025-09-22', 3800.00),
(4, '2025-09-23', 30800.00),
(5, '2025-09-24', 800.00);

-- Order_Details Data
INSERT INTO Order_Details (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 55000.00),
(1, 3, 2, 1500.00),
(2, 2, 1, 22000.00),
(2, 3, 1, 1500.00),
(3, 5, 1, 3000.00),
(3, 4, 1, 800.00),
(4, 1, 1, 55000.00),
(4, 5, 1, 3000.00),
(5, 4, 1, 800.00);

-- Delivery Data
INSERT INTO Delivery (order_id, delivery_date, status) VALUES
(1, '2025-09-25', 'Delivered'),
(2, '2025-09-26', 'Delivered'),
(3, '2025-09-27', 'Pending'),
(4, '2025-09-28', 'Delivered'),
(5, '2025-09-29', 'Pending');

-- Example Queries

#1 Display All customers
SELECT * FROM Customer;

#2 List all products under “Electronics”
SELECT * FROM Product WHERE category = 'Electronics';

#3 Find customers from Mumbai
SELECT name, city FROM Customer WHERE city = 'Mumbai';

#4 Total number of orders placed
SELECT COUNT(order_id) AS total_orders FROM Orders;

#5 Total sales amount
SELECT SUM(total_amount) AS total_sales FROM Orders;

#6 Customer-wise total spending
SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;

#7 Product-wise total sold quantity
SELECT p.name, SUM(od.quantity) AS total_sold
FROM Product p
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.name;

#8 Orders not yet delivered
SELECT o.order_id, d.status
FROM Orders o
JOIN Delivery d ON o.order_id = d.order_id
WHERE d.status = 'Pending';

#9 Most expensive product
SELECT name, price FROM Product ORDER BY price DESC LIMIT 1;

#10 Average order value
SELECT AVG(total_amount) AS avg_order_value FROM Orders;

#11 List orders placed after 21 Sep 2025
SELECT * FROM Orders WHERE order_date > '2025-09-21';

#12 Show all customers and their orders
SELECT c.name, o.order_id, o.order_date, o.total_amount
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

#13 Products sold more than 1 unit
SELECT p.name, SUM(od.quantity) AS qty_sold
FROM Product p
JOIN Order_Details od ON p.product_id = od.product_id
GROUP BY p.name
HAVING SUM(od.quantity) > 1;

#14 Delivery summary
SELECT status, COUNT(delivery_id) AS total
FROM Delivery
GROUP BY status;

#### 15 View###
CREATE VIEW customer_purchase_summary AS
SELECT c.name, COUNT(o.order_id) AS orders, SUM(o.total_amount) AS spent
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;





























