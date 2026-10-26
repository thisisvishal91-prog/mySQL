/* =====================================================================
   WINDOW FUNCTIONS — PRACTICE DATABASE
   Run this whole file once in MySQL Workbench (Ctrl + Shift + Enter).
   Creates window_db with small tables you can check by eye:
     employees (10), orders (10), monthly_sales (12)
   plus 5 small LeetCode tables (names start with lc_).
   Needs MySQL 8.0 or newer (window functions don't exist in 5.7).
   ===================================================================== */
DROP DATABASE IF EXISTS window_db;
CREATE DATABASE window_db;
USE window_db;

-- Note the ties: Priya & Sneha (IT, 75,000) and Karan & Vikram (Sales, 65,000)
CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    name       VARCHAR(30),
    department VARCHAR(20),
    salary     INT,
    join_date  DATE
);
INSERT INTO employees VALUES
 (1,  'Rahul',   'IT',      60000, '2019-03-10'),
 (2,  'Priya',   'IT',      75000, '2018-06-01'),
 (3,  'Raj',     'IT',      80000, '2017-01-15'),
 (4,  'Sneha',   'IT',      75000, '2021-09-20'),
 (5,  'Amit',    'HR',      45000, '2020-02-11'),
 (6,  'Simran',  'HR',      50000, '2019-11-05'),
 (7,  'Neha',    'Sales',   55000, '2022-04-18'),
 (8,  'Karan',   'Sales',   65000, '2018-08-23'),
 (9,  'Vikram',  'Sales',   65000, '2016-12-01'),
 (10, 'Anjali',  'Finance', 70000, '2015-07-07');

CREATE TABLE orders (
    order_id   INT PRIMARY KEY,
    customer   VARCHAR(20),
    order_date DATE,
    amount     INT
);
INSERT INTO orders VALUES
 (1,  'Aman',   '2025-01-05',  500),
 (2,  'Bela',   '2025-01-10', 1200),
 (3,  'Aman',   '2025-02-02',  800),
 (4,  'Chirag', '2025-02-15',  300),
 (5,  'Bela',   '2025-03-01',  450),
 (6,  'Aman',   '2025-03-12', 2000),
 (7,  'Chirag', '2025-03-20',  700),
 (8,  'Bela',   '2025-04-02',  900),
 (9,  'Aman',   '2025-04-18',  600),
 (10, 'Chirag', '2025-04-25', 1500);

CREATE TABLE monthly_sales (
    month   DATE,
    region  VARCHAR(10),
    revenue INT
);
INSERT INTO monthly_sales VALUES
 ('2025-01-01', 'North', 12000), ('2025-02-01', 'North', 15000), ('2025-03-01', 'North', 11000),
 ('2025-04-01', 'North', 18000), ('2025-05-01', 'North', 21000), ('2025-06-01', 'North', 19000),
 ('2025-01-01', 'South',  9000), ('2025-02-01', 'South',  9500), ('2025-03-01', 'South', 13000),
 ('2025-04-01', 'South', 12500), ('2025-05-01', 'South', 15000), ('2025-06-01', 'South', 17000);

-- ---------------- LeetCode practice tables ----------------
-- LeetCode 197 · Rising Temperature            (LeetCode table: Weather)
CREATE TABLE lc_weather (id INT, recordDate DATE, temperature INT);
INSERT INTO lc_weather VALUES (1, '2025-01-01', 10), (2, '2025-01-02', 25), (3, '2025-01-03', 20), (4, '2025-01-04', 30);

-- LeetCode 178 · Rank Scores                   (LeetCode table: Scores)
CREATE TABLE lc_scores (id INT, score DECIMAL(4,2));
INSERT INTO lc_scores VALUES (1, 3.50), (2, 3.65), (3, 4.00), (4, 3.85), (5, 4.00), (6, 3.65);

-- LeetCode 180 · Consecutive Numbers           (LeetCode table: Logs)
CREATE TABLE lc_logs (id INT, num INT);
INSERT INTO lc_logs VALUES (1, 1), (2, 1), (3, 1), (4, 2), (5, 1), (6, 2), (7, 2);

-- LeetCode 185 · Department Top Three Salaries (LeetCode tables: Employee, Department)
CREATE TABLE lc_department (id INT, name VARCHAR(20));
INSERT INTO lc_department VALUES (1, 'IT'), (2, 'Sales');
CREATE TABLE lc_employee (id INT, name VARCHAR(20), salary INT, departmentId INT);
INSERT INTO lc_employee VALUES
 (1, 'Jai', 85000, 1), (2, 'Hema', 80000, 2), (3, 'Sam', 60000, 2), (4, 'Manav', 90000, 1),
 (5, 'Jiya', 69000, 1), (6, 'Rani', 85000, 1), (7, 'Vijay', 70000, 1);

-- LeetCode 1204 · Last Person to Fit in the Bus (LeetCode table: Queue)
CREATE TABLE lc_queue (person_id INT, person_name VARCHAR(20), weight INT, turn INT);
INSERT INTO lc_queue VALUES
 (5, 'Alok', 250, 1), (4, 'Bhanu', 175, 5), (3, 'Chetna', 350, 2),
 (6, 'Deep', 400, 3), (1, 'Ekta', 500, 6), (2, 'Farhan', 200, 4);

SHOW TABLES;

-- -- -- WINDOW FUNCTION -- --- 
select name,department, avg(salary)  over(partition by department) as total_salary 
from employees;

select name,salary, avg(salary)  over() as  total_avg_salary
from employees;

select name ,department,salary,salary-avg(salary) over(partition by department) as avg_dept_salary from employees;


select name, salary,
row_number() over(order by salary desc) as row_num,
rank() over(order by salary desc) as rnk,
dense_rank() over(order by salary desc) as dense_rnk
from employees;

select name,department,salary,
rank() over(partition by department order by salary desc) as rnk
from employees;

select name, salary, 
row_number() over(order by salary desc) as row_num
from employees;

select name, salary, 
rank() over(order by salary desc) as rnk
from employees;

select name, salary, department,
rank() over( partition by department order by salary desc) as rnk
from employees;


with ranked as(
select name, salary, department,
rank() over( partition by department order by salary desc) as rnk
from employees)
select * from ranked
where rnk=1;

with ranked as(
select name, salary, department,
rank() over( partition by department order by salary desc) as rnk
from employees)
select * from ranked
where rnk < 3;

with ranked as(
select name, salary, department,
dense_rank() over( partition by department order by salary desc) as dense_rnk
from employees)
select * from ranked
where dense_rnk=2;



select order_id,order_date,amount,sum(amount)
over(order by order_date) as running_total
from orders; 

select order_id,order_date,amount,sum(amount)
over(order by order_date rows between unbounded preceding and current row) as running_total
from orders;

select order_id,order_date,amount,sum(amount)
over(order by order_date rows between current row AND 2 following ) as future_total
from orders; 


select customer,amount,
row_number() over(partition by customer) as this_is_the_customers
from orders; 

select*from monthly_sales;

select region,avg(revenue)
 over(order by month rows between 2 preceding and current row) as sales
from monthly_sales
where region='North';


select month,sum(revenue) over(order by month) as running_total, round(sum(revenue) over(order by month)/ sum(revenue) over() *100,2) as running_percentage
from monthly_sales
where region = 'North'; 


-- LAG & LEAD -- 

select month, revenue,
LAG(revenue) over(order by month) as prev_month,
lead (revenue) over (order by month) as next_month
from monthly_sales
where region='North';

select month,revenue,
revenue-lag(revenue) over(order by month) as change_amount,
round(100*(revenue- lag(revenue) over(order by month))/lag(revenue) over(order by month),1) as revenue_change_percentage
from monthly_sales
where region='North';

select month, revenue,
lag(revenue) over(order by month) as prev_month_rev
from monthly_sales
where region='North';





