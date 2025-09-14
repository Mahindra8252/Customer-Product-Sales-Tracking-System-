show databases;
drop database Customer_and_Product_Sales_Tracking;

create database Customer_and_Product_Sales_Tracking;
use Customer_and_Product_Sales_Tracking;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    DateJoined DATE
);


-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);


-- Sales_Reps Table
CREATE TABLE Sales_Reps (
    SalesRepID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    HireDate DATE
);

-- Customer_Interactions Table
CREATE TABLE Customer_Interactions (
    InteractionID INT PRIMARY KEY,
    CustomerID INT,
    SalesRepID INT,
    InteractionDate DATE,
    InteractionType VARCHAR(50),
    Notes TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalesRepID) REFERENCES Sales_Reps(SalesRepID)
);

-- Customer_Feedback Table
CREATE TABLE Customer_Feedback (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    FeedbackDate DATE,
    FeedbackType VARCHAR(50),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Sales Table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SalesRepID INT,
    SaleDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SalesRepID) REFERENCES Sales_Reps(SalesRepID)
);

-- Inserting into Customers (10 rows)
INSERT INTO Customers VALUES 
(1, 'John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Elm Street', 'Los Angeles', 'CA', '90001', '2024-01-15'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '987-654-3210', '456 Oak Avenue', 'San Francisco', 'CA', '94102', '2024-02-20'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '654-321-9870', '789 Pine Road', 'New York', 'NY', '10001', '2024-03-10'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '432-198-7654', '321 Maple Lane', 'Chicago', 'IL', '60601', '2024-04-05'),
(5, 'Daniel', 'Wilson', 'daniel.wilson@example.com', '210-543-6789', '654 Cedar Street', 'Houston', 'TX', '77001', '2024-05-15'),
(6, 'Olivia', 'Martinez', 'olivia.martinez@example.com', '678-123-4567', '987 Birch Blvd', 'Miami', 'FL', '33101', '2024-06-18'),
(7, 'William', 'Anderson', 'william.anderson@example.com', '789-654-1230', '159 Spruce Ave', 'Seattle', 'WA', '98101', '2024-07-25'),
(8, 'Sophia', 'Thomas', 'sophia.thomas@example.com', '321-765-0987', '753 Walnut Street', 'Denver', 'CO', '80201', '2024-08-03'),
(9, 'David', 'Moore', 'david.moore@example.com', '890-123-4567', '852 Willow Drive', 'Boston', 'MA', '02101', '2024-09-12'),
(10, 'Isabella', 'Taylor', 'isabella.taylor@example.com', '567-890-2345', '951 Aspen Way', 'Phoenix', 'AZ', '85001', '2024-10-01');

select* from customers;
-- Inserting into Products (10 rows)
INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 50),
(2, 'Smartphone', 'Electronics', 800.00, 100),
(3, 'Tablet', 'Electronics', 500.00, 80),
(4, 'Headphones', 'Accessories', 150.00, 200),
(5, 'Smartwatch', 'Electronics', 250.00, 150),
(6, 'Monitor', 'Electronics', 300.00, 60),
(7, 'Keyboard', 'Accessories', 50.00, 300),
(8, 'Mouse', 'Accessories', 30.00, 400),
(9, 'Printer', 'Electronics', 200.00, 40),
(10, 'Camera', 'Electronics', 700.00, 70);

select * from products;

-- Inserting into Sales_Reps (10 rows)
INSERT INTO Sales_Reps VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '234-567-8901', '2023-05-12'),
(2, 'Bob', 'Williams', 'bob.williams@example.com', '345-678-9012', '2023-06-18'),
(3, 'Sophia', 'Miller', 'sophia.miller@example.com', '456-789-0123', '2023-07-10'),
(4, 'James', 'Taylor', 'james.taylor@example.com', '567-890-1234', '2023-08-25'),
(5, 'Ava', 'Harris', 'ava.harris@example.com', '678-901-2345', '2023-09-15'),
(6, 'Ethan', 'Clark', 'ethan.clark@example.com', '789-012-3456', '2023-10-05'),
(7, 'Mia', 'Lewis', 'mia.lewis@example.com', '890-123-4567', '2023-11-11'),
(8, 'Liam', 'Walker', 'liam.walker@example.com', '901-234-5678', '2023-12-01'),
(9, 'Charlotte', 'Hall', 'charlotte.hall@example.com', '210-345-6789', '2024-01-09'),
(10, 'Noah', 'Allen', 'noah.allen@example.com', '321-456-7890', '2024-02-20');

select * from Sales_Reps;

-- Inserting into Sales (10 rows)
INSERT INTO Sales VALUES
(1, 1, 1, 1, '2024-03-01', 1, 1200.00),
(2, 1, 2, 2, '2024-03-15', 1, 800.00),
(3, 2, 2, 2, '2024-03-20', 2, 1600.00),
(4, 3, 3, 3, '2024-04-02', 1, 500.00),
(5, 4, 4, 4, '2024-04-18', 1, 150.00),
(6, 4, 5, 1, '2024-05-05', 1, 250.00),
(7, 6, 6, 5, '2024-06-25', 1, 300.00),
(8, 6, 6, 5, '2024-07-01', 1, 300.00),
(9, 7, 7, 6, '2024-07-30', 1, 50.00),
(10, 7, 8, 6, '2024-08-02', 1, 30.00),
(11, 8, 9, 7, '2024-08-15', 1, 200.00),
(12, 8, 10, 7, '2024-08-20', 1, 700.00),
(13, 9, 4, 8, '2024-09-05', 1, 150.00),
(14, 9, 2, 2, '2024-09-12', 1, 800.00),
(15, 10, 10, 9, '2024-10-05', 1, 700.00),
(16, 10, 5, 1, '2024-10-10', 1, 250.00),
(17, 1, 3, 3, '2024-10-20', 1, 500.00),
(18, 2, 1, 1, '2024-10-25', 1, 1200.00),
(19, 3, 8, 6, '2024-11-01', 2, 60.00),
(20, 4, 7, 6, '2024-11-10', 1, 50.00);

select * from sales;

-- Inserting into Customer_Interactions (10 rows)
INSERT INTO Customer_Interactions VALUES 
(1, 1, 1, '2024-03-01', 'Product Inquiry', 'Customer inquired about laptop features.'),
(2, 2, 2, '2024-03-05', 'Sales Follow-up', 'Followed up on smartphone purchase.'),
(3, 3, 3, '2024-03-12', 'Complaint', 'Customer reported tablet screen flickering issue.'),
(4, 4, 4, '2024-04-02', 'Product Inquiry', 'Asked about compatibility of headphones with iOS devices.'),
(5, 5, 2, '2024-05-22', 'Sales Follow-up', 'Checked if customer was satisfied with smartwatch.'),
(6, 6, 5, '2024-06-28', 'Complaint', 'Monitor had dead pixels on delivery.'),
(7, 7, 6, '2024-07-30', 'Product Inquiry', 'Asked about keyboard mechanical switch types.'),
(8, 8, 7, '2024-08-12', 'Sales Follow-up', 'Ensured mouse setup was working properly.'),
(9, 9, 8, '2024-09-16', 'Complaint', 'Printer was not connecting wirelessly.'),
(10, 10, 9, '2024-10-08', 'Product Inquiry', 'Asked about camera lens compatibility.');
select * from Customer_Interactions;

-- Inserting into Customer_Feedback (10 rows)
INSERT INTO Customer_Feedback VALUES 
(1, 1, '2024-03-10', 'Product Quality', 4, 'The laptop is good, but battery life could be better.'),
(2, 2, '2024-03-12', 'Service Experience', 5, 'Excellent service by the sales representative.'),
(3, 3, '2024-03-20', 'Product Quality', 3, 'Tablet performance is fine, but screen issue is annoying.'),
(4, 4, '2024-04-10', 'Product Quality', 5, 'Headphones have amazing sound quality and comfort.'),
(5, 5, '2024-05-25', 'Service Experience', 4, 'Sales rep was helpful, smartwatch works as expected.'),
(6, 6, '2024-06-30', 'Product Quality', 2, 'Monitor had display issues.'),
(7, 7, '2024-07-31', 'Product Quality', 5, 'Keyboard is very responsive and reliable.'),
(8, 8, '2024-08-15', 'Service Experience', 4, 'Mouse was installed smoothly, rep followed up.'),
(9, 9, '2024-09-20', 'Product Quality', 3, 'Printer works but setup was complicated.'),
(10, 10, '2024-10-12', 'Product Quality', 5, 'Camera quality is excellent for the price.');

select * from Customer_Feedback;

/*CONSIDERABLE QUESTIONS TO IMPROVE PRODUCTIVITY

1. Which Customers Made the Most Purchases?
2. What is the Total Revenue Generated by Each Sales Representative?
3. What is the Average Rating Given by Customers for Each Product?
4. Which Products are Generating the Most Revenue?
5. What are the Most Common Types of Customer Interactions?
6. Which Sales Representatives Have the Best Customer Feedback?*/


-- 1. Which Customers Made the Most Purchases?

SELECT C.CustomerID, C.FirstName, C.LastName, COUNT(S.SaleID) AS TotalPurchases
FROM Customers C
JOIN Sales S ON C.CustomerID = S.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalPurchases DESC;

-- 2. What is the Total Revenue Generated by Each Sales Representative?

SELECT SR.SalesRepID, SR.FirstName, SR.LastName, SUM(S.TotalAmount) AS TotalRevenue
FROM Sales_Reps SR
JOIN Sales S ON SR.SalesRepID = S.SalesRepID
GROUP BY SR.SalesRepID, SR.FirstName, SR.LastName
ORDER BY TotalRevenue DESC;

-- 3. What is the Average Rating Given by Customers for Each Product?

SELECT P.ProductID, P.ProductName, AVG(CF.Rating) AS AverageRating
FROM Products P
JOIN Sales S ON P.ProductID = S.ProductID
JOIN Customer_Feedback CF ON S.CustomerID = CF.CustomerID
GROUP BY P.ProductID, P.ProductName
ORDER BY AverageRating DESC;

-- 4. Which Products are Generating the Most Revenue?

SELECT P.ProductID, P.ProductName, SUM(S.TotalAmount) AS TotalRevenue
FROM Products P
JOIN Sales S ON P.ProductID = S.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalRevenue DESC;

-- 5. What are the Most Common Types of Customer Interactions?

SELECT InteractionType, COUNT(InteractionID) AS InteractionCount
FROM Customer_Interactions
GROUP BY InteractionType
ORDER BY InteractionCount DESC;

-- 6. Which Sales Representatives Have the Best Customer Feedback?

SELECT SR.SalesRepID, SR.FirstName, SR.LastName, AVG(CF.Rating) AS AverageRating
FROM Sales_Reps SR
JOIN Sales S ON SR.SalesRepID = S.SalesRepID
JOIN Customer_Feedback CF ON S.CustomerID = CF.CustomerID
GROUP BY SR.SalesRepID, SR.FirstName, SR.LastName
ORDER BY AverageRating DESC;

