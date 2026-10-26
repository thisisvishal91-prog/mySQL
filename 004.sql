DROP DATABASE IF EXISTS shop_db;
CREATE DATABASE shop_db;
USE shop_db;
 
CREATE TABLE departments (
    dept_id    INT PRIMARY KEY,
    dept_name  VARCHAR(30) NOT NULL,
    location   VARCHAR(30)
);
INSERT INTO departments VALUES
 (1, 'Sales', 'Mumbai'), (2, 'IT', 'Bengaluru'), (3, 'HR', 'Delhi'),
 (4, 'Finance', 'Pune'), (5, 'Operations', 'Hyderabad');     -- Operations has no staff
 
CREATE TABLE employees (
    emp_id        INT PRIMARY KEY,
    name          VARCHAR(50) NOT NULL,
    dept_id       INT NULL,
    manager_id    INT NULL,
    city          VARCHAR(30),
    salary        DECIMAL(10,2),
    joining_date  DATE,
    FOREIGN KEY (dept_id)    REFERENCES departments (dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees (emp_id)
);
INSERT INTO employees VALUES
 (1,  'Anil Mehta',     NULL, NULL, 'Mumbai',    250000, '2012-04-01'),   -- CEO, no department
 (2,  'Vikram Singh',   1,    1,    'Delhi',     120000, '2015-06-15'),
 (3,  'Priya Verma',    2,    1,    'Bengaluru', 130000, '2016-01-11'),
 (4,  'Ananya Iyer',    3,    1,    'Chennai',    90000, '2017-09-01'),
 (5,  'Meera Kapoor',   4,    1,    'Pune',      110000, '2016-08-20'),
 (6,  'Aarav Sharma',   1,    2,    'Delhi',      45000, '2021-04-12'),
 (7,  'Karan Malhotra', 1,    2,    'Delhi',     125000, '2019-03-05'),
 (8,  'Arjun Nair',     1,    2,    'Pune',       41000, '2024-02-05'),
 (9,  'Rohan Gupta',    2,    3,    'Bengaluru',  95000, '2018-03-15'),
 (10, 'Aditya Joshi',   2,    3,    'Pune',       72000, '2023-01-16'),
 (11, 'Isha Banerjee',  2,    3,    'Kolkata',    64000, '2022-10-10'),
 (12, 'Divya Pillai',   3,    4,    'Bengaluru',  40000, '2025-01-07'),
 (13, 'Sneha Reddy',    4,    5,    'Hyderabad',  52000, '2022-06-18'),
 (14, 'Kavya Nair',     4,    5,    'Kochi',     115000, '2023-08-21');
 
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
 (105, 'Nikhil Jain',  'Delhi',     '2024-07-07'),
 (106, 'Fatima Khan',  'Hyderabad', '2025-01-15'),   -- never ordered
 (107, 'Gaurav Patel', 'Ahmedabad', '2025-03-30');   -- never ordered
 
CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(50) NOT NULL,
    category      VARCHAR(20),
    price         DECIMAL(8,2)
);
INSERT INTO products VALUES
 (1, 'Wireless Mouse',     'Electronics',  599),
 (2, 'Bluetooth Earbuds',  'Electronics', 1499),
 (3, 'USB-C Cable',        'Electronics',  299),
 (4, 'Basmati Rice 5kg',   'Grocery',      749),
 (5, 'Green Tea 100 bags', 'Grocery',      399),
 (6, 'Cotton Kurta',       'Fashion',     1299),
 (7, 'Denim Jeans',        'Fashion',     1799),
 (8, 'Yoga Mat',           'Fitness',      899);   -- never ordered
 
CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT NOT NULL,
    order_date   DATE,
    status       VARCHAR(12),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
INSERT INTO orders VALUES
 (1001, 101, '2025-01-05', 'Delivered'),
 (1002, 102, '2025-01-18', 'Delivered'),
 (1003, 101, '2025-02-02', 'Delivered'),
 (1004, 103, '2025-02-20', 'Cancelled'),
 (1005, 104, '2025-03-11', 'Delivered'),
 (1006, 105, '2025-03-25', 'Shipped'),
 (1007, 102, '2025-04-08', 'Delivered'),
 (1008, 101, '2025-04-30', 'Delivered'),
 (1009, 103, '2025-05-16', 'Delivered'),
 (1010, 105, '2025-06-01', 'Pending');
 
CREATE TABLE order_items (
    order_id    INT,
    product_id  INT,
    quantity    INT,
    unit_price  DECIMAL(8,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id)   REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
INSERT INTO order_items VALUES
 (1001, 1, 2,  599), (1001, 3, 1,  299),
 (1002, 6, 1, 1299), (1002, 5, 2,  399),
 (1003, 2, 1, 1499),
 (1004, 7, 1, 1799),
 (1005, 4, 2,  749), (1005, 5, 1,  399),
 (1006, 1, 1,  599), (1006, 2, 1, 1499),
 (1007, 7, 2, 1799),
 (1008, 3, 3,  299), (1008, 6, 1, 1299),
 (1009, 4, 1,  749),
 (1010, 2, 2, 1499);
 
-- Tiny tables for the CROSS JOIN demo
CREATE TABLE tshirt_sizes   (size   VARCHAR(5));
CREATE TABLE tshirt_colours (colour VARCHAR(10));
INSERT INTO tshirt_sizes   VALUES ('S'), ('M'), ('L');
INSERT INTO tshirt_colours VALUES ('Black'), ('White');
 
SHOW TABLES;


select product_name from products
where category = "Electronics"
order by category asc;

select name from customers
where city = "Delhi" and year(signup_Date) = 2024; 

select product_name,price from products
order by price desc
limit 3;

select*from orders 
where status != "delivered"
order by Order_date asc;

select count(customer_id) from customers;


select count(status) from orders
where status != "Cancelled";


SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM
    orders;


SELECT 
    SUM(salary) AS total_salary_bill
FROM
    employees;

SELECT 
    ROUND(AVG(salary))
FROM
    employees;


SELECT 
    MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary
FROM
    employees;

SELECT 
    COUNT(*) AS total_emoloyee, COUNT(dept_id) AS with_dept
FROM
    employees;
SELECT 
    COUNT(DISTINCT city)
FROM
    employees;
SELECT 
    SUM(unit_price * quantity) AS total_revenue
FROM
    order_items;
SELECT 
    COUNT(emp_id), AVG(salary)
FROM
    employees
WHERE
    salary > 100000;

SELECT 
    dept_id, AVG(salary)
FROM
    employees
WHERE
    dept_id IS NOT NULL
GROUP BY dept_id
ORDER BY AVG(salary) DESC;

SELECT 
    MONTHNAME(order_date) AS month, COUNT(*) AS orders
FROM
    orders
GROUP BY MONTH(order_date) , MONTHNAME(order_date)
ORDER BY MONTH(order_date);

SELECT 
    dept_id, COUNT(*) AS emp_count
FROM
    employees
GROUP BY dept_id
HAVING COUNT(*) > 3;


SELECT 
    city, COUNT(*)
FROM
    employees
GROUP BY city
HAVING COUNT(*) > 1;


select order_id,sum(unit_price*quantity) as total from order_items
group by order_id
having sum(unit_price*quantity)>2000;


-- -- -- fresherhiring@nagarro.com -- -- --


select dept_id, count(*) as joiners from employees
where joining_date >= "2020-12-31"
group by dept_id
having count(*) >=2;

select o.order_date, c.name from orders as o
join customers as c
on o.customer_id = c.customer_id; 


select e.name , d.dept_name from employees as e
join departments as d
on e.dept_id = d.dept_id;


select e.name , d.dept_name from employees as e
left join departments as d
on e.dept_id = d.dept_id;

select c.name, o.order_id, o.status from customers as c
left join orders as o
on c.customer_id = o.customer_id 
where order_id is null; 

select * from products as p
left join order_items as z
on p.product_id = z.product_id
where order_id is null;

select e.name ,d.location, d.dept_name from departments as d
left join employees as e
on e.dept_id = d.dept_id
where name is null;


select e.name, d.dept_name from employees as e
right join departments as d
on e.dept_id = d.dept_id; 



select e1.name as manager_name,m2.name as employee_name from employees as e1
join employees as m2
on e1.emp_id = m2.manager_id;


