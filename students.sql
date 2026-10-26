SHOW DATABASES;
CREATE DATABASE db_student;

CREATE TABLE students
(
	studentId INT PRIMARY KEY,
    name VARCHAR (50),
    email VARCHAR(50),
    age INT,
    marks INT,
    course VARCHAR(100),
    city VARCHAR(100)
);

SHOW TABLES;
USE db_students;
SELECT*FROM students;
INSERT INTO student
VALUES 
(1,"Amit kumar","amit@gmail.com",22,97,"B.tech","Delhi"),
(2,"Vishal kumar","vishal@gmail.com",21,92,"B.tech","South Delhi"),
(3,"Naveen kumar","naveen@gmail.com",23,88,"B.Com"," North Delhi"),
(4,"Nisha kumari","nisha@gmail.com",25,90,"BSC","Patna"),
(5,"Amita kumari","amita@gmail.com",19,99,"BCA","Ghazibad");

SELECT VERSION();  -- mysql version--

SELECT name,age FROM students
where city = "Patna";  -- specific columns --

SELECT DISTINCT course from students;  -- distinct  is used to remove duplicates.--


SELECT*FROM students

WHERE age>20;

 
 SELECT*FROM students
 WHERE age>20 AND age<22;
 
  SELECT*FROM students
 WHERE age>20 AND age<22;
 
 SELECT*FROM students
 WHERE city = "Delhi" OR "Patna";
 -- 1.1 -- -- -- -- --LIKE-- -- -- -- -- --
 -- --A% --  starts with A
 -- --a% -- ends with a 
 -- --%it% -- contains it
 -- --_a% --  second character is a 
 -- -- --- -- -- -- -- -- -- -- -- -- -- --
 
 SELECT*FROM students 
 WHERE name LIKE 'A%';
  SELECT*FROM students 
 WHERE name LIKE '%a';
  SELECT*FROM students 
 WHERE name LIKE '%it%';
  SELECT*FROM students 
 WHERE name LIKE '_a%';
   SELECT*FROM students 
 WHERE email LIKE '%@gmail.com';
 
 
 
 
DROP TABLE student;

-- advance select fro crud practice --

SELECT*FROM students
ORDER BY  name asc;

SELECT*FROM students
ORDER BY  name desc;

SELECT*FROM students
ORDER BY  marks
LIMIT 2 ;

-- -- -- --  LIMIT -- -- -- --
SELECT*FROM students
LIMIT 3;

SELECT*FROM students
ORDER BY  age desc
LIMIT 3 ;


-- --- --- aliases  -- -- -- --

SELECT name as student_name from students;

--- -- -- -- -- aggregations -- -- --- --- --

SELECT sum(marks) from students;

SELECT count(*) from students;

select*from students;

Select max(age) as max_age
from students;

-- -- -- -- -update-- -- - -- -- --

UPDATE students 
SET city ="noida"
WHERE studentID=2;

UPDATE students
SET marks=45,
	age=67
WHERE studentId = 2;

UPDATE students
SET city = "Bihar"
WHERE studentId = 1;
SELECT city from students;

UPDATE students
SET course= "B.pharm",
	fees=20000
WHERE studentId = 1;

UPDATE students
set marks = marks+20
WHERE studentId = 1;
SELECT*FROM students;



SET SQL_SAFE_UPDATES = 0;

-- -- -- --- --- DELETE - REMOVE EXISTING FIELDS -- -- -- 

DELETE FROM students
where studentId = 1;
SELECT*FROM students;



DELETE FROM students
where age<20;
SELECT*FROM students;

DELETE FROM students
where studentId=1;

DELETE from students;

SELECT*FROM students
where city = "Patna";

SELECT DISTINCT studentId from students;


DROP tables students;

Alter table students
add phone VARCHAR(50);

Alter table students  
modify phone VARCHAR(20);
SELECT*FROM students;


Alter table students
DROP COLUMN phone;




