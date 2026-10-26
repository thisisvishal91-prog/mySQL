DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

-- ---------------------------------------------------------------------
-- 1. employees  (15 rows)  — note: two people share the top salary,
--    and two employees have no city (NULL)
-- ---------------------------------------------------------------------
CREATE TABLE employees (
    emp_id        INT PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    department    VARCHAR(20) NOT NULL,
    city          VARCHAR(30),
    age           INT,
    salary        INT,
    joining_date  DATE
);
INSERT INTO employees VALUES
 (1,  'Aarav Sharma',   'IT',        'Bengaluru', 29, 95000, '2019-04-10'),
 (2,  'Priya Verma',    'IT',        'Pune',      34, 95000, '2018-07-01'),
 (3,  'Rohan Gupta',    'IT',        'Bengaluru', 26, 72000, '2022-01-17'),
 (4,  'Sneha Reddy',    'IT',        'Hyderabad', 24, 48000, '2024-06-03'),
 (5,  'Vikram Singh',   'Sales',     'Delhi',     41, 88000, '2015-02-20'),
 (6,  'Karan Malhotra', 'Sales',     'Delhi',     31, 61000, '2020-09-14'),
 (7,  'Isha Banerjee',  'Sales',     'Kolkata',   23, 39000, '2025-01-06'),
 (8,  'Arjun Nair',     'Sales',     NULL,        28, 52000, '2023-03-27'),
 (9,  'Meera Kapoor',   'HR',        'Mumbai',    38, 70000, '2016-11-11'),
 (10, 'Divya Pillai',   'HR',        'Chennai',   27, 45000, '2023-08-01'),
 (11, 'Ananya Iyer',    'Finance',   'Mumbai',    45, 92000, '2014-05-05'),
 (12, 'Nikhil Jain',    'Finance',   'Pune',      33, 68000, '2019-12-02'),
 (13, 'Kavya Nair',     'Finance',   'Kochi',     25, 50000, '2024-02-19'),
 (14, 'Aditya Joshi',   'Marketing', 'Mumbai',    30, 58000, '2021-07-12'),
 (15, 'Fatima Khan',    'Marketing', NULL,        36, 75000, '2017-10-23');

-- ---------------------------------------------------------------------
-- 2. students  (10 rows) — one student was absent (marks = NULL)
-- ---------------------------------------------------------------------
CREATE TABLE students (
    student_id  INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    course      VARCHAR(20),
    marks       INT
);
INSERT INTO students VALUES
 (1,  'Riya',   'Python', 92),
 (2,  'Kabir',  'SQL',    76),
 (3,  'Anika',  'Python', 38),
 (4,  'Dev',    'SQL',    64),
 (5,  'Zoya',   'Excel',  88),
 (6,  'Om',     'SQL',    45),
 (7,  'Tara',   'Excel',  NULL),
 (8,  'Yash',   'Python', 59),
 (9,  'Meher',  'SQL',    97),
 (10, 'Rehan',  'Excel',  25);

-- ---------------------------------------------------------------------
-- 3. customers  (8 rows) — Gaurav and Tanya have never ordered
-- ---------------------------------------------------------------------
CREATE TABLE customers (
    customer_id  INT PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    city         VARCHAR(30),
    signup_date  DATE
);
INSERT INTO customers VALUES
 (101, 'Rahul Khanna', 'Delhi',     '2024-01-10'),
 (102, 'Sana Sheikh',  'Mumbai',    '2024-02-14'),
 (103, 'Deepak Rao',   'Bengaluru', '2024-03-03'),
 (104, 'Pooja Das',    'Kolkata',   '2024-05-20'),
 (105, 'Neha Gupta',   'Delhi',     '2024-07-07'),
 (106, 'Imran Ali',    'Lucknow',   '2024-11-15'),
 (107, 'Gaurav Patel', 'Ahmedabad', '2025-01-15'),
 (108, 'Tanya Roy',    'Pune',      '2025-03-30');

-- ---------------------------------------------------------------------
-- 4. products  (8 rows) — the Yoga Mat has never been sold
-- ---------------------------------------------------------------------
CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(50) NOT NULL,
    category      VARCHAR(20),
    price         INT
);
INSERT INTO products VALUES
 (1, 'Wireless Mouse',    'Electronics',  599),
 (2, 'Bluetooth Earbuds', 'Electronics', 1499),
 (3, 'Smart Watch',       'Electronics', 4999),
 (4, 'Basmati Rice 5kg',  'Grocery',      749),
 (5, 'Green Tea',         'Grocery',      399),
 (6, 'Cotton Kurta',      'Fashion',     1299),
 (7, 'Running Shoes',     'Fashion',     3499),
 (8, 'Yoga Mat',          'Fitness',      899);

-- ---------------------------------------------------------------------
-- 5. orders  (12 rows) — one product per order; amount = price x quantity
-- ---------------------------------------------------------------------
CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT NOT NULL,
    product_id   INT NOT NULL,
    order_date   DATE,
    quantity     INT,
    amount       INT,
    status       VARCHAR(12),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (product_id)  REFERENCES products  (product_id)
);
INSERT INTO orders VALUES
 (1001, 101, 3, '2025-01-05', 1, 4999, 'Delivered'),
 (1002, 102, 6, '2025-01-18', 2, 2598, 'Delivered'),
 (1003, 101, 1, '2025-02-02', 3, 1797, 'Delivered'),
 (1004, 103, 7, '2025-02-20', 1, 3499, 'Cancelled'),
 (1005, 104, 4, '2025-03-11', 2, 1498, 'Delivered'),
 (1006, 105, 2, '2025-03-25', 1, 1499, 'Shipped'),
 (1007, 102, 3, '2025-04-08', 2, 9998, 'Delivered'),
 (1008, 101, 5, '2025-04-30', 4, 1596, 'Delivered'),
 (1009, 103, 2, '2025-05-16', 1, 1499, 'Delivered'),
 (1010, 105, 7, '2025-06-01', 2, 6998, 'Pending'),
 (1011, 106, 1, '2025-06-12', 1,  599, 'Delivered'),
 (1012, 104, 6, '2025-06-28', 1, 1299, 'Returned');

-- Quick check: you should see 5 tables
SHOW TABLES;

select*from students;
select name, case
when marks>40 then "pass"
	else "fail"
    end as result
from students;

select name , case 
when marks>90 then 'A'
 when marks>75 then 'B'
 when marks>60 then 'C'
 when marks>40 then 'D'
 when marks<40 then 'F'
 else 'missing'
 end as result
 from students;
 
 select order_id, status , case 
 when status = 'Delivered' then 'Completed'
 when status = 'Shipped' or 'Pending' then 'On the way'
 else 'Problem' 
 end as order_status
 from orders;
 
 
SELECT 
    name,
    department,
    salary,
    CASE
        WHEN Department = 'IT' THEN salary*0.1 
        WHEN Department = 'Sales' THEN salary *0.08
        ELSE salary *0.05
    END AS bonus
FROM
    Employees;
 
 
 select department, count(*) as total_employees ,
 sum( case when salary >= 70000 then 1 else 0 end) as high_earners,
 sum(salary) as salary_bill
 from employees
 group by department;
 
 

select name,salary from employees
where salary>
(select avg(salary) from employees);



select product_name, category,price from products
where price >
(select avg(price) from products);

 
 select distinct customer_id from orders
 where order_id>1 ;

select*from orders;
 select*from customers;
 select*from products;
 select customer_id, name from customers
 where customer_id not in (select customer_id from orders);
 
 select product_id,product_name from products
 where product_id not in (select product_id from orders);
 

select name from customers where customer_id IN(
select customer_id from orders where product_id IN(
select product_id from products where category = 'Electronics'));



select department,avg(salary) from employees
group by department
having avg(salary)>65000;


select name,salary, case
when salary> (select avg(salary) from employees) then 'Above average'
else 'Below average' 
end as rating
from employees;
 