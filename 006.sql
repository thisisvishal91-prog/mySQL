/* =====================================================================
   CTEs — EASY PRACTICE DATABASE
   Run this whole file once in MySQL Workbench (Ctrl + Shift + Enter).
   Creates cte_db with small tables you can check by eye:
     employees (8), departments (5), customers (5), orders (10)
   plus 4 small LeetCode tables (names start with lc_).
   ===================================================================== */
DROP DATABASE IF EXISTS cte_db;
CREATE DATABASE cte_db;
USE cte_db;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name        VARCHAR(30),
    department  VARCHAR(20),
    salary      INT,
    city        VARCHAR(20)
);
INSERT INTO employees VALUES
 (1, 'Rahul',  'IT',      60000, 'Delhi'),
 (2, 'Amit',   'HR',      45000, 'Mumbai'),
 (3, 'Priya',  'IT',      75000, 'Pune'),
 (4, 'Neha',   'Sales',   55000, 'Delhi'),
 (5, 'Raj',    'IT',      80000, 'Mumbai'),
 (6, 'Simran', 'HR',      50000, 'Pune'),
 (7, 'Karan',  'Sales',   65000, 'Delhi'),
 (8, 'Anjali', 'Finance', 70000, 'Mumbai');

CREATE TABLE departments (
    dept_name VARCHAR(20) PRIMARY KEY,
    location  VARCHAR(20)
);
INSERT INTO departments VALUES
 ('IT', 'Bengaluru'), ('HR', 'Delhi'), ('Sales', 'Mumbai'),
 ('Finance', 'Pune'), ('Marketing', 'Chennai');      -- Marketing has no employees

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name        VARCHAR(30),
    city        VARCHAR(20)
);
INSERT INTO customers VALUES
 (1, 'Aman', 'Delhi'), (2, 'Bela', 'Mumbai'), (3, 'Chirag', 'Pune'),
 (4, 'Divya', 'Delhi'), (5, 'Esha', 'Kolkata');     -- Esha never ordered

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    amount      INT,
    status      VARCHAR(12),
    order_date  DATE
);
INSERT INTO orders VALUES
 (101, 1,  500, 'Delivered', '2025-01-05'),
 (102, 2, 1200, 'Delivered', '2025-01-10'),
 (103, 1,  800, 'Delivered', '2025-02-02'),
 (104, 3,  300, 'Cancelled', '2025-02-15'),
 (105, 2,  450, 'Delivered', '2025-03-01'),
 (106, 4, 2000, 'Delivered', '2025-03-12'),
 (107, 3,  700, 'Delivered', '2025-03-20'),
 (108, 1,  250, 'Pending',   '2025-04-02'),
 (109, 4,  600, 'Delivered', '2025-04-18'),
 (110, 2,  900, 'Cancelled', '2025-04-25');

-- ---------------- LeetCode practice tables ----------------
-- LeetCode 1729 · Find Followers Count            (LeetCode table: Followers)
CREATE TABLE lc_followers (user_id INT, follower_id INT);
INSERT INTO lc_followers VALUES (0, 1), (1, 0), (2, 0), (2, 1);

-- LeetCode 2356 · Unique Subjects per Teacher     (LeetCode table: Teacher)
CREATE TABLE lc_teacher (teacher_id INT, subject_id INT, dept_id INT);
INSERT INTO lc_teacher VALUES (1, 2, 3), (1, 2, 4), (1, 3, 3), (2, 1, 1), (2, 2, 1), (2, 3, 1), (2, 4, 1);

-- LeetCode 570 · Managers with 5+ Direct Reports  (LeetCode table: Employee)
CREATE TABLE lc_employee (id INT, name VARCHAR(20), department VARCHAR(5), managerId INT);
INSERT INTO lc_employee VALUES
 (101, 'Jagdish', 'A', NULL), (102, 'Deepa', 'A', 101), (103, 'Jatin', 'A', 101),
 (104, 'Amrita', 'A', 101), (105, 'Anil', 'A', 101), (106, 'Rohit', 'B', 101);

-- LeetCode 184 · Department Highest Salary        (LeetCode tables: Employee, Department)
CREATE TABLE lc_department (id INT, name VARCHAR(20));
INSERT INTO lc_department VALUES (1, 'IT'), (2, 'Sales');
CREATE TABLE lc_dept_employee (id INT, name VARCHAR(20), salary INT, departmentId INT);
INSERT INTO lc_dept_employee VALUES
 (1, 'Jai', 70000, 1), (2, 'Jiya', 90000, 1), (3, 'Harsh', 80000, 2),
 (4, 'Sameer', 60000, 2), (5, 'Manav', 90000, 1);

SHOW TABLES;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM customers;


SELECT * FROM orders
limit 10;

SELECT * FROM lc_followers;

SELECT * FROM lc_teacher;

SELECT * FROM lc_employee;

SELECT * FROM lc_department;

SELECT * FROM lc_dept_employee;

-- CTE --
with avg_salary as (
select avg(salary) from employees)
select * from avg_salary;

with high_salary as(
select * from employees
where salary > 60000)
select* from high_salary;

with high_salary as(
select department, count(*) as staff  from employees
group by department)
select* from high_salary
where staff > 2;


-- -- -- 
with customers_total as(
select customer_id, sum(amount) as delivered_total from orders
where status = "Delivered"
group by customer_id)







