	-- MILESTONE --

	-- ONE MARK --
-- 16) CREATE
-- 17) DROP
-- 18) All rows including NULL
-- 19) UNIQUE
-- 20) COMMIT
-- 21) 3306
-- 22) MATCH
-- 23) Current date & time
-- 24) CONCAT()
-- 25) FOREIGN KEY
-- 26) INNER JOIN
-- 27) CONCAT()
-- 28) Nested Query
-- 29) Normalization
-- 30) Automatically on events

	-- TWO MARKS -- 
-- 6 Differentiate between DDL and DML commands with examples.
-- DDL - Data Definition Language
-- It  purpose of modifies structure of Database objects like tables, schemas. 
-- It use to change the schema and structure of the data as well as not data will change.
-- Certainly, changes are permanent. Examples :- CREATE,ALTER,DROP,TRUNCATE.
-- DML - Data Manupulation Language
-- It can be manipulates the data inside the table
-- It is used to change the data with keyword like insert, update, delete.
-- It can be rolled back. Examples:- INSERT, UPDATE, DELETE, SELECT

-- 7 Write a query to fetch the second highest salary from an employee table.
SELECT 
    Salary
FROM
    Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- 8 Explain the difference between INNER JOIN and LEFT JOIN with an example.
-- INNER JOIN - It returns only rows that have matched values in both tables. 
-- LEFT JOIN -  It returns all rows from the left table, and matching rows from the right table. If no match, NULL show in empty cell in right table.
create database milestone;
use milestone;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course_id INT
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);
INSERT INTO students (student_id, name, course_id) VALUES
(1, 'Raagul',125 ),
(2, 'Rithan',126),
(3, 'Saran', NULL);
INSERT INTO Courses (course_id,course_name) VALUES
(125, 'EEE'),
(126, 'ECE'),
(127, 'MECH');

SELECT s.name,c.course_name
FROM students s
INNER JOIN courses c
ON s.course_id = c.course_id;

SELECT s.name, c.course_name
FROM students s
LEFT JOIN courses c
ON s.course_id = c.course_id;

-- 9 What is a Trigger in MySQL? Give a use case.
-- Trigger is stored program, we can set trigger with before and after using insert, delete, and update keywords. 
-- It execute automatically when the response will occur in script. It uses for business purposes especially on supermarket datasets.

-- 10 Why is Normalization important? Explain with an example.
-- Normalization is a process of organizing data in a database to reduce redundancy and improve consistency.
-- It ensures data is stored efficiently and  avoids anomality like inserting or deleting the values, as well improves data integrity.

	-- 20 MARK -- 

use milestone;
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_name VARCHAR(50)
);
INSERT INTO Department (Dept_ID,Dept_name) VALUES
(1,'Sales'),
(2,'IT'),
(3,'HR'),
(4,'Finance');
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Dept_ID INT,
    Salary INT,
    Hire_date DATE
);
INSERT INTO Employee (Emp_ID,Emp_name,Dept_ID,Salary,Hire_date) VALUES
(101,'John',1,50000,'2018-05-12'),
(102,'Amit',2,65000,'2017-03-20'),
(103,'Sara',2,72000,'2019-08-15'),
(104,'Lina',3,48000,'2020-01-10'),
(105,'Raj',4,55000,'2016-09-25'),
(106,'Emma',1,60000,'2015-11-02');
CREATE TABLE Attendance (
    Att_ID INT PRIMARY KEY,
    Emp_ID INT,
    Att_date DATE,
    status VARCHAR(50)
);
INSERT INTO Attendance(Att_ID,Emp_ID,Att_date,Status) VALUES
(1,101,'2025-09-01','Present'),
(2,102,'2025-09-01','Absent'),
(3,103,'2025-09-01','Present'),
(4,104,'2025-09-01','Present'),
(5,105,'2025-09-01','Present'),
(6,106,'2025-09-01','Present');

-- a) Write a DDL command to create the departments table with dept_id as Primary Key and dept_name as NOT NULL.
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_name VARCHAR(50) NOT NULL
);

-- b) Insert two sample records into the departments table (e.g., Sales, IT).
INSERT INTO Department (Dept_ID, Dept_name) VALUES
(1, 'Sales'),
(2, 'IT');

-- c) Write a query to display the employee name and department name using a JOIN between employees and departments.
SELECT 
    E.Emp_name, D.Dept_name
FROM
    Employee E
        JOIN
    Department D ON E.Dept_ID = D.Dept_ID;
    
-- d) Write a query to find the highest salary using an aggregate function.
SELECT 
    MAX(Salary) AS Highest_Salary
FROM
    Employee;
    
-- e) Write a subquery to fetch the employees who earn more than the average salary.
SELECT 
	AVG(Salary)
FROM
	Employee;
SELECT 
    Emp_name, Salary
FROM
    Employee
WHERE
    Salary > (SELECT 
            AVG(Salary)
        FROM
            Employee);
-- f) Create a view named emp_salary_view to display emp_name, dept_name, salary.
CREATE VIEW emp_salary_view AS
    SELECT 
        Emp_name, Salary, Dept_name
    FROM
        Employee,
        Department;
	
-- g) Write a stored procedure named GetDeptEmployees that accepts a dept_id and returns all employee names in that department.
DELIMITER //
CREATE PROCEDURE GetDeptEmployees(IN dept_id INT)
BEGIN
    SELECT Emp_name 
    FROM Employee
    WHERE Dept_ID = dept_id;
END //
DELIMITER ;
-- h) Write a user-defined function YearWorked(hire_date) that calculates the number of years an employee has worked in the company.

-- i) Create a trigger that automatically inserts a record into attendance table with status = 'Present' whenever a new employee is added.
DELIMITER //
CREATE TRIGGER InsertAttendancerecord
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Attendance (Emp_ID, Att_date, status)
    VALUES (NEW.Emp_ID, CURDATE(), 'Present');
END //
DELIMITER ;
-- j) Write a query using string function to display employee names in uppercase.
SELECT UPPER(Emp_name) AS Emp_name_uppercase
FROM Employee;


