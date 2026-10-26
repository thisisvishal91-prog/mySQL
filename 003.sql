CREATE DATABASE emloyee_db;
USE employee_db;

CREATE TABLE employee (
    employee_ID INT,
    employee_name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10.2),
    experince VARCHAR(50)
);
    
INSERT INTO employee (employee_ID,employee_name,age,city,department,salary,experince)
VALUES
(101,"VISHAL KUMAR",23,"PATNA","IT",80000,"22"),
(102,"NISHA SHAKYA",22,"PATNA","SALES",10000,"02"),
(103,"NAVEEN YADAV",25,"NEW DELHI","IT",75000,"15"),
(104,"NEERAJ JAISWAL",19,"GHAZIABAD","HR",70000,"12"),
(105,"SATISH BIHARI",24,"MEERUT","NONtech",79000,"18"),
(106,"SHIVA NAND",22,"NOIDA","CALLING",79000,"16"),
(107,"ABHAY YADAV",21,"NOIDA","CALLING",13000,"08"),
(108,"VARUN NAGAR",25,"NEW DELHI","SALES",9000,"fresher"),
(109,"PRASHANT OJHA",24,"GHAZIABAD","NONtech",5000,"01"),
(110,"YASEER USMANI",22,"MEERUT","HR",80000,"10");

SELECT 
    *
FROM
    employee;

SELECT 
    employee_name, department, salary
FROM
    employee;

SELECT 
    employee_name
FROM
    employee
WHERE
    department = 'IT';

SELECT employee_name from employee
where salary>50000;

SELECT*from employee
where employee_name like "A%";

select*from employee
order by salary desc
limit 3 offset 3;


select*from employee
order by salary desc
limit 3;

update employee
set salary = salary+3000
where department = "IT";


Update employee
set city = "MADHUBANI"
WHERE employee_ID = 101;


DELETE from employee
where employee_ID = 102;


SELECT department,count(employee_ID) from employee
group by department;



SELECT 
    AVG(salary) AS avg_salary
FROM
    employee;

select salary*12 as annual_salary from emolyee
where employee_ID = 101;

select*from employee
where salary between 40000 and 80000; -- -- isme dono amount bhi contain krega .


select employee_ID,concat(first_name,last_name) as full_name from employee 
where email_ID is null;