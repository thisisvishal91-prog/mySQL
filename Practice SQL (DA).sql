/* =========================================================
   1. CREATE DATABASE
   ========================================================= */

CREATE DATABASE IF NOT EXISTS ecommerce_sql_practice;

USE ecommerce_sql_practice;


/* =========================================================
   2. DROP TABLES
   Drop child tables first because of foreign keys
   ========================================================= */

DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;


/* =========================================================
   3. CUSTOMERS
   ========================================================= */

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    City VARCHAR(50),
    State VARCHAR(50),
    Email VARCHAR(100)NULL,
    Phone VARCHAR(20),
    SignupDate DATE
);


/* =========================================================
   4. EMPLOYEES
   ========================================================= */

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    ManagerID INT NULL,
    Salary DECIMAL(10,2),
    JoiningDate DATE
);


/* =========================================================
   5. CATEGORIES
   ========================================================= */

CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);


/* =========================================================
   6. PRODUCTS
   ========================================================= */

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    UnitPrice DECIMAL(10,2),
    UnitCost DECIMAL(10,2),
    StockQuantity INT,
    LaunchDate DATE,

    FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


/* =========================================================
   7. ORDERS
   ========================================================= */

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(30),
    PaymentStatus VARCHAR(30),
    ShippingCity VARCHAR(50),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);


/* =========================================================
   8. ORDER DETAILS
   ========================================================= */

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    Discount DECIMAL(10,2),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);


/* =========================================================
   9. PAYMENTS
   ========================================================= */

CREATE TABLE Payments
(
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    Amount DECIMAL(10,2),
    PaymentStatus VARCHAR(30),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);

/* =========================================================
   10. insert data in Customers TABLES
   ========================================================= */


INSERT INTO Customers
(CustomerID, CustomerName, Gender, City, State, Email, Phone, SignupDate)
VALUES
(101, 'Rahul Sharma', 'Male', 'Delhi', 'Delhi',
 'rahul@gmail.com', '9876500001', '2023-01-15'),

(102, 'Priya Singh', 'Female', 'Noida', 'Uttar Pradesh',
 'priya@gmail.com', '9876500002', '2023-02-10'),

(103, 'Amit Kumar', 'Male', 'Ghaziabad', 'Uttar Pradesh',
 'amit@gmail.com', '9876500003', '2023-03-21'),

(104, 'Neha Gupta', 'Female', 'Jaipur', 'Rajasthan',
 'neha@gmail.com', '9876500004', '2023-04-05'),

(105, 'Rohit Verma', 'Male', 'Lucknow', 'Uttar Pradesh',
 NULL, '9876500005', '2023-05-18'),

(106, 'Sneha Kapoor', 'Female', 'Delhi', 'Delhi',
 'sneha@gmail.com', '9876500006', '2023-06-12'),

(107, 'Vikas Yadav', 'Male', 'Kanpur', 'Uttar Pradesh',
 'vikas@gmail.com', '9876500007', '2023-07-22'),

(108, 'Pooja Mehta', 'Female', 'Mumbai', 'Maharashtra',
 'pooja@gmail.com', '9876500008', '2023-08-15'),

(109, 'Karan Malhotra', 'Male', 'Pune', 'Maharashtra',
 'karan@gmail.com', '9876500009', '2023-09-10'),

(110, 'Anjali Jain', 'Female', 'Delhi', 'Delhi',
 'anjali@gmail.com', '9876500010', '2023-10-05'),

(111, 'Manish Agarwal', 'Male', 'Noida', 'Uttar Pradesh',
 'manish@gmail.com', '9876500011', '2023-11-20'),

(112, 'Kavita Rao', 'Female', 'Hyderabad', 'Telangana',
 'kavita@gmail.com', '9876500012', '2023-12-15'),

(113, 'Arjun Mehta', 'Male', 'Bangalore', 'Karnataka',
 'arjun@gmail.com', '9876500013', '2024-01-10'),

(114, 'Riya Sharma', 'Female', 'Delhi', 'Delhi',
 'riya@gmail.com', '9876500014', '2024-02-18'),

(115, 'Saurabh Singh', 'Male', 'Agra', 'Uttar Pradesh',
 'saurabh@gmail.com', '9876500015', '2024-03-22'),

(116, 'Nisha Verma', 'Female', 'Chandigarh', 'Punjab',
 'nisha@gmail.com', '9876500016', '2024-04-10'),

(117, 'Deepak Gupta', 'Male', 'Meerut', 'Uttar Pradesh',
 'deepak@gmail.com', '9876500017', '2024-05-15'),

(118, 'Meena Joshi', 'Female', 'Dehradun', 'Uttarakhand',
 'meena@gmail.com', '9876500018', '2024-06-20'),

(119, 'Rajiv Kumar', 'Male', 'Delhi', 'Delhi',
 'rajiv@gmail.com', '9876500001', '2024-07-12'),

(120, 'Ayesha Khan', 'Female', 'Gurgaon', 'Haryana',
 NULL, '9876500020', '2024-08-18');

/* =========================================================
   11. insert data in Employees TABLES
   ========================================================= */


INSERT INTO Employees
(EmployeeID, EmployeeName, Department, ManagerID, Salary, JoiningDate)
VALUES
(1, 'Rajesh Verma', 'Sales', NULL, 90000, '2020-01-10'),
(2, 'Aman Singh', 'Sales', 1, 60000, '2021-03-15'),
(3, 'Sneha Kapoor', 'Sales', 1, 65000, '2021-06-20'),
(4, 'Karan Malhotra', 'IT', NULL, 100000, '2019-07-10'),
(5, 'Pooja Sharma', 'IT', 4, 70000, '2022-01-15'),
(6, 'Vikas Gupta', 'HR', NULL, 80000, '2020-09-12'),
(7, 'Neha Singh', 'HR', 6, 55000, '2022-04-18'),
(8, 'Arjun Mehta', 'Marketing', NULL, 85000, '2021-11-05'),
(9, 'Riya Jain', 'Marketing', 8, 58000, '2023-02-15'),
(10, 'Mohit Kumar', 'Finance', NULL, 95000, '2020-05-20');

/* =========================================================
   12. insert data in Categories TABLES
   ========================================================= */

INSERT INTO Categories
(CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home'),
(4, 'Beauty'),
(5, 'Grocery'),
(6, 'Sports');

/* =========================================================
   13. insert data in Products TABLES
   ========================================================= */

INSERT INTO Products
(ProductID, ProductName, CategoryID, UnitPrice, UnitCost, StockQuantity, LaunchDate)
VALUES
(201, 'Laptop', 1, 60000, 48000, 25, '2023-01-10'),
(202, 'Smartphone', 1, 30000, 24000, 50, '2023-02-15'),
(203, 'Headphones', 1, 2500, 1500, 100, '2023-03-10'),
(204, 'Smart Watch', 1, 5000, 3200, 80, '2023-04-15'),
(205, 'Bluetooth Speaker', 1, 3500, 2200, 70, '2023-05-20'),

(206, 'T-Shirt', 2, 999, 500, 150, '2023-01-20'),
(207, 'Jeans', 2, 2499, 1400, 100, '2023-02-25'),
(208, 'Shoes', 2, 2999, 1800, 75, '2023-03-15'),
(209, 'Jacket', 2, 3999, 2500, 60, '2023-10-10'),

(210, 'Sofa', 3, 45000, 32000, 10, '2023-04-20'),
(211, 'Dining Table', 3, 30000, 21000, 15, '2023-05-15'),
(212, 'Office Chair', 3, 12000, 8000, 30, '2023-06-10'),

(213, 'Face Wash', 4, 499, 250, 200, '2023-01-15'),
(214, 'Perfume', 4, 2499, 1200, 120, '2023-03-20'),
(215, 'Shampoo', 4, 599, 300, 180, '2023-05-10'),

(216, 'Honey', 5, 450, 250, 250, '2023-06-15'),
(217, 'Organic Ghee', 5, 1200, 750, 150, '2023-07-20'),
(218, 'Rice', 5, 800, 550, 200, '2023-08-10'),

(219, 'Cricket Bat', 6, 4500, 2800, 40, '2024-01-15'),
(220, 'Football', 6, 1800, 1000, 80, '2024-02-20');


/* =========================================================
   14. insert data in Orders TABLES
   ========================================================= */


INSERT INTO Orders
(OrderID, CustomerID, EmployeeID, OrderDate, OrderStatus, PaymentStatus, ShippingCity)
VALUES
(1001, 101, 2, '2023-01-20', 'Completed', 'Paid', 'Delhi'),
(1002, 102, 3, '2023-01-25', 'Completed', 'Paid', 'Noida'),
(1003, 101, 2, '2023-02-05', 'Completed', 'Paid', 'Delhi'),
(1004, 103, 2, '2023-02-15', 'Completed', 'Paid', 'Ghaziabad'),
(1005, 104, 3, '2023-03-10', 'Completed', 'Paid', 'Jaipur'),
(1006, 105, 2, '2023-03-20', 'Cancelled', 'Failed', 'Lucknow'),
(1007, 106, 3, '2023-04-05', 'Completed', 'Paid', 'Delhi'),
(1008, 107, 2, '2023-04-18', 'Completed', 'Paid', 'Kanpur'),
(1009, 108, 3, '2023-05-02', 'Completed', 'Paid', 'Mumbai'),
(1010, 109, 2, '2023-05-15', 'Completed', 'Paid', 'Pune'),
(1011, 101, 2, '2023-06-01', 'Completed', 'Paid', 'Delhi'),
(1012, 110, 3, '2023-06-12', 'Completed', 'Paid', 'Delhi'),
(1013, 111, 2, '2023-07-05', 'Completed', 'Paid', 'Noida'),
(1014, 112, 3, '2023-07-20', 'Completed', 'Paid', 'Hyderabad'),
(1015, 103, 2, '2023-08-10', 'Completed', 'Paid', 'Ghaziabad'),
(1016, 104, 3, '2023-08-25', 'Completed', 'Paid', 'Jaipur'),
(1017, 113, 8, '2024-01-05', 'Completed', 'Paid', 'Bangalore'),
(1018, 114, 2, '2024-01-15', 'Completed', 'Paid', 'Delhi'),
(1019, 115, 3, '2024-02-05', 'Completed', 'Paid', 'Agra'),
(1020, 116, 2, '2024-02-18', 'Completed', 'Paid', 'Chandigarh'),
(1021, 117, 3, '2024-03-01', 'Completed', 'Paid', 'Meerut'),
(1022, 118, 2, '2024-03-15', 'Completed', 'Paid', 'Dehradun'),
(1023, 101, 2, '2024-04-05', 'Completed', 'Paid', 'Delhi'),
(1024, 102, 3, '2024-04-20', 'Completed', 'Paid', 'Noida'),
(1025, 119, 2, '2024-05-05', 'Completed', 'Paid', 'Delhi'),
(1026, 120, 3, '2024-05-18', 'Completed', 'Paid', 'Gurgaon'),
(1027, 103, 2, '2024-06-01', 'Completed', 'Paid', 'Ghaziabad'),
(1028, 104, 3, '2024-06-15', 'Completed', 'Paid', 'Jaipur'),
(1029, 105, 2, '2024-07-01', 'Completed', 'Paid', 'Lucknow'),
(1030, 106, 3, '2024-07-15', 'Completed', 'Paid', 'Delhi'),
(1031, 107, 2, '2024-08-01', 'Completed', 'Paid', 'Kanpur'),
(1032, 108, 3, '2024-08-15', 'Completed', 'Paid', 'Mumbai'),
(1033, 109, 2, '2024-09-01', 'Completed', 'Paid', 'Pune'),
(1034, 110, 3, '2024-09-15', 'Completed', 'Paid', 'Delhi'),
(1035, 111, 2, '2024-10-01', 'Completed', 'Paid', 'Noida'),
(1036, 112, 3, '2024-10-15', 'Completed', 'Paid', 'Hyderabad'),
(1037, 113, 8, '2024-11-01', 'Completed', 'Paid', 'Bangalore'),
(1038, 114, 2, '2024-11-15', 'Completed', 'Paid', 'Delhi'),
(1039, 115, 3, '2024-12-01', 'Completed', 'Paid', 'Agra'),
(1040, 116, 2, '2024-12-15', 'Completed', 'Paid', 'Chandigarh'),
(1041, 101, 2, '2024-12-20', 'Cancelled', 'Failed', 'Delhi'),
(1042, 103, 3, '2024-12-25', 'Completed', 'Paid', 'Ghaziabad');


/* =========================================================
   15. insert data in OrderDetails TABLES
   ========================================================= */


INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity, UnitPrice, Discount)
VALUES
(1, 1001, 201, 1, 60000, 5000),
(2, 1001, 203, 2, 2500, 200),

(3, 1002, 206, 3, 999, 100),
(4, 1002, 208, 1, 2999, 0),

(5, 1003, 202, 1, 30000, 2000),

(6, 1004, 204, 2, 5000, 500),
(7, 1004, 203, 1, 2500, 0),

(8, 1005, 209, 2, 3999, 500),
(9, 1005, 206, 2, 999, 0),

(10, 1006, 210, 1, 45000, 0),

(11, 1007, 211, 1, 30000, 2000),
(12, 1007, 212, 1, 12000, 500),

(13, 1008, 207, 2, 2499, 300),
(14, 1008, 208, 1, 2999, 0),

(15, 1009, 213, 3, 499, 100),
(16, 1009, 214, 1, 2499, 200),

(17, 1010, 217, 5, 1200, 500),
(18, 1010, 216, 4, 450, 100),

(19, 1011, 201, 1, 60000, 3000),
(20, 1011, 203, 2, 2500, 0),

(21, 1012, 215, 4, 599, 100),
(22, 1012, 214, 2, 2499, 200),

(23, 1013, 202, 2, 30000, 3000),
(24, 1013, 205, 1, 3500, 0),

(25, 1014, 216, 10, 450, 200),
(26, 1014, 217, 3, 1200, 300),

(27, 1015, 210, 1, 45000, 5000),
(28, 1015, 212, 2, 12000, 1000),

(29, 1016, 208, 3, 2999, 500),
(30, 1016, 209, 1, 3999, 0),

(31, 1017, 201, 2, 60000, 5000),
(32, 1017, 204, 1, 5000, 500),

(33, 1018, 206, 5, 999, 200),
(34, 1018, 207, 2, 2499, 300),

(35, 1019, 219, 2, 4500, 500),
(36, 1019, 220, 1, 1800, 0),

(37, 1020, 210, 1, 45000, 3000),

(38, 1021, 213, 5, 499, 100),
(39, 1021, 215, 3, 599, 100),

(40, 1022, 217, 4, 1200, 200),
(41, 1022, 218, 5, 800, 200),

(42, 1023, 202, 1, 30000, 1500),
(43, 1023, 203, 2, 2500, 200),

(44, 1024, 211, 1, 30000, 1000),
(45, 1024, 212, 1, 12000, 500),

(46, 1025, 201, 1, 60000, 4000),
(47, 1025, 205, 2, 3500, 300),

(48, 1026, 214, 3, 2499, 300),
(49, 1026, 213, 5, 499, 100),

(50, 1027, 202, 2, 30000, 2000),
(51, 1027, 204, 1, 5000, 300),

(52, 1028, 207, 3, 2499, 300),
(53, 1028, 208, 2, 2999, 400),

(54, 1029, 217, 5, 1200, 500),
(55, 1029, 218, 10, 800, 500),

(56, 1030, 201, 1, 60000, 3000),
(57, 1030, 202, 1, 30000, 2000),

(58, 1031, 206, 5, 999, 200),
(59, 1031, 209, 2, 3999, 300),

(60, 1032, 210, 1, 45000, 2500),
(61, 1032, 211, 1, 30000, 1500),

(62, 1033, 219, 2, 4500, 300),
(63, 1033, 220, 2, 1800, 100),

(64, 1034, 213, 10, 499, 300),
(65, 1034, 214, 4, 2499, 500),

(66, 1035, 201, 1, 60000, 5000),
(67, 1035, 203, 3, 2500, 300),

(68, 1036, 217, 8, 1200, 500),
(69, 1036, 216, 10, 450, 300),

(70, 1037, 202, 2, 30000, 3000),
(71, 1037, 204, 2, 5000, 500),

(72, 1038, 206, 4, 999, 100),
(73, 1038, 208, 2, 2999, 300),

(74, 1039, 210, 1, 45000, 3000),
(75, 1039, 212, 2, 12000, 1000),

(76, 1040, 219, 3, 4500, 500),
(77, 1040, 220, 3, 1800, 200),

(78, 1041, 201, 1, 60000, 0),

(79, 1042, 202, 1, 30000, 1000),
(80, 1042, 205, 2, 3500, 300);


/* =========================================================
   16. insert data in Payments TABLES
   ========================================================= */


INSERT INTO Payments
(PaymentID, OrderID, PaymentDate, PaymentMethod, Amount, PaymentStatus)
VALUES
(1, 1001, '2023-01-20', 'UPI', 54800, 'Paid'),
(2, 1002, '2023-01-25', 'Credit Card', 5896, 'Paid'),
(3, 1003, '2023-02-05', 'UPI', 28000, 'Paid'),
(4, 1004, '2023-02-15', 'Debit Card', 11500, 'Paid'),
(5, 1005, '2023-03-10', 'UPI', 7498, 'Paid'),
(6, 1006, '2023-03-20', 'Credit Card', 0, 'Failed'),
(7, 1007, '2023-04-05', 'Net Banking', 39500, 'Paid'),
(8, 1008, '2023-04-18', 'UPI', 7697, 'Paid'),
(9, 1009, '2023-05-02', 'UPI', 3696, 'Paid'),
(10, 1010, '2023-05-15', 'Credit Card', 6300, 'Paid'),
(11, 1011, '2023-06-01', 'UPI', 62000, 'Paid'),
(12, 1012, '2023-06-12', 'Debit Card', 6488, 'Paid'),
(13, 1013, '2023-07-05', 'Credit Card', 60500, 'Paid'),
(14, 1014, '2023-07-20', 'UPI', 12200, 'Paid'),
(15, 1015, '2023-08-10', 'Net Banking', 63000, 'Paid'),
(16, 1016, '2023-08-25', 'UPI', 12496, 'Paid'),
(17, 1017, '2024-01-05', 'Credit Card', 119500, 'Paid'),
(18, 1018, '2024-01-15', 'UPI', 6995, 'Paid'),
(19, 1019, '2024-02-05', 'UPI', 10300, 'Paid'),
(20, 1020, '2024-02-18', 'Credit Card', 42000, 'Paid'),
(21, 1021, '2024-03-01', 'UPI', 3970, 'Paid'),
(22, 1022, '2024-03-15', 'Debit Card', 6790, 'Paid'),
(23, 1023, '2024-04-05', 'UPI', 33300, 'Paid'),
(24, 1024, '2024-04-20', 'Credit Card', 40500, 'Paid'),
(25, 1025, '2024-05-05', 'Net Banking', 62500, 'Paid'),
(26, 1026, '2024-05-18', 'UPI', 9597, 'Paid'),
(27, 1027, '2024-06-01', 'Credit Card', 62700, 'Paid'),
(28, 1028, '2024-06-15', 'UPI', 12397, 'Paid'),
(29, 1029, '2024-07-01', 'UPI', 12500, 'Paid'),
(30, 1030, '2024-07-15', 'Credit Card', 85000, 'Paid'),
(31, 1031, '2024-08-01', 'Debit Card', 12295, 'Paid'),
(32, 1032, '2024-08-15', 'UPI', 71000, 'Paid'),
(33, 1033, '2024-09-01', 'Credit Card', 10300, 'Paid'),
(34, 1034, '2024-09-15', 'UPI', 14492, 'Paid'),
(35, 1035, '2024-10-01', 'Net Banking', 61700, 'Paid'),
(36, 1036, '2024-10-15', 'UPI', 13900, 'Paid'),
(37, 1037, '2024-11-01', 'Credit Card', 61000, 'Paid'),
(38, 1038, '2024-11-15', 'UPI', 8594, 'Paid'),
(39, 1039, '2024-12-01', 'Debit Card', 65000, 'Paid'),
(40, 1040, '2024-12-15', 'UPI', 14200, 'Paid'),
(41, 1041, '2024-12-20', 'UPI', 0, 'Failed'),
(42, 1042, '2024-12-25', 'Credit Card', 35700, 'Paid');

SELECT * FROM Customers;

SELECT * FROM Employees;

SELECT * FROM Categories;

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM OrderDetails;

SELECT * FROM Payments;

-- customers without email_id -- 
SELECT*FROM customers
WHERE email is NULL;


-- customers with email_id --
SELECT*FROM customers
WHERE email IS NOT NULL;


SELECT coalesce (email, 'NOT PROVIDED') AS email
FROM customers;

SELECT*FROM employees
ORDER BY EmployeeName,EmployeeID,Salary;

SELECT*FROM employees
WHERE salary = (select max(salary)from employees);

SELECT*FROM customers 
ORDER BY signupDate desc
limit 10;

SELECT * FROM products
ORDER BY UnitPrice desc
limit 5;

SELECT COUNT(email) as total_email
FROM customers;

SELECT COUNT(*)
FROM orders;

SELECT sum(salary)
FROM employees;

SELECT avg(salary)
FROM employees;

SELECT min(salary)
FROM employees;

SELECT max(salary)
FROM employees;

SELECT round(avg(UnitPrice),2)
FROM products;

SELECT count(distinct city) as unique_cities
FROM customers;


SELECT count(CustomerID) as total_customers,
count(distinct CustomerID) as unique_customers
FROM orders;

SELECT state, 
count(customerID) as total_customers
FROM Customers
GROUP BY state;

SELECT city, 
count(customerID) as total_customers
FROM Customers
GROUP BY city;

SELECT*FROM products;
SELECT CatagoryID ,count(*) as number_of_products
from Products
group by CategoryID;

SELECT department,count(department)
from employees
group by department;

SELECT department, avg(salary),sum(salary)
FROM employees
group by department;

SELECT department,count(EmployeeID)
FROM employees
group by department
having count(*)>2;

SELECT state,count(customerID) as total_customers
FROM customers
group by state
having count(*)>2;

SELECT customerID
from orders
group by orderID
having count(*)>2;

SELECT*FROM products;
SELECT ProductName,UnitPrice,
case when unitprice>50000 then 'Premium'
	 when unitprice>10000 then 'Midrange'
else
	'Lower'
    end as customer_category

from products;

SELECT EmployeeName,salary,
case when salary>90000 then 'High'
	 when salary>60000 then 'Medium'
else 
	'low' 
	 end as employee_category
from employees;
     
     
-- JIONS ------------- 
--  --INNER,OUTER,LEFT,RIGHT-- --


-- INNER JOINS --
SELECT*FROM customers,orders;
SELECT c.CustomerID,c.CustomerName,
	   o.OrderID,o.OrderDate
FROM orders o inner join 
	 customers c on 
     o.CustomerID = c.CustomerID;


SELECT Phone,count(Phone)
FROM customers
group by phone;


-- left join --
-- -- -- -- -- -- 
SELECT*FROM customers,orders;
SELECT c.CustomerID,c.CustomerName,
	   o.OrderID,o.OrderDate
FROM orders o left join 
	 customers c on 
     o.CustomerID = c.CustomerID;
     
SELECT*FROM customers,orders;
SELECT c.CustomerID,c.CustomerName,
	   o.OrderID,o.OrderDate
FROM orders o right join 
	 customers c on 
     o.CustomerID = c.CustomerID;



SELECT*FROM employees;

SELECT m.EmployeeName as Managername, e.employeename as Employeename
from employees as m join employees as e on
		e.managerid = m.employeeid
WHERE m.employeename = "Rajesh Verma";


-- -- -- -- -- -- -- -- 
-- -- sub querry -- -- 
-- -- -- -- -- -- -- --

SELECT max(salary)
from employees
where salary < 
(SELECT max(salary) from employees);


WITH abc AS(
SELECT customerID,count(orderID)
from orders
group by customerID
having count(orderID)>2)
SELECT*FROM abc;

-- -- -- CTE -- -- --

WITH customer_sales as(
	SELECT o.customerID,
    SUM(od.quantity*od.unitprice-od.discount) as total_sales
    FROM orders o join 
    orderdetails od on o.orderID = od.orderID
    where o.orderstatus = 'completed'
    group by o.customerID)
SELECT*FROM customer_sales;


-- -- MULTIPLE CTE -- -- --

WITH customer_sales as(
	SELECT o.customerID,
    SUM(od.quantity*od.unitprice-od.discount) as total_sales
    FROM orders o join 
    orderdetails od on o.orderID = od.orderID
    where o.orderstatus = 'completed'
    group by o.customerID),
customer_segments as ( select customerID,total_sales,
    case when total_sales>100000 then 'Premium'
		 when total_sales>50000 then 'Average'
else 
	'Low' 
	 end as customer_type
FROM customer_sales)
SELECT*FROM customer_segments;

-- --WINDOW FUNCTIONS-- -- 
  
  
WITH Ranking as(
SELECT employeename,department,salary,
row_number() over(partition by department order by salary desc)
as Ranking from employees)
select*from Ranking where Ranking=1;
        
WITH Ranking as(
SELECT employeename,department,salary,
rank() over(partition by department order by salary desc)
as Ranking from employees)
select*from Ranking where Ranking=1;

WITH Ranking as(
SELECT employeename,department,salary,
dense_rank() over(partition by department order by salary desc)
as Ranking from employees)
select*from Ranking where Ranking=1;
     

     
     

     
     
     

