-- REINFORCEMENT 10 MARK -- 
show databases;
create database reinforcement_10mark;
use reinforcement_10mark;

CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    Marks INT
);

INSERT INTO student(Name,DeptID,Marks) VALUES
('Rahul',101,85),
('Priya',102,92),
('Karthik',101,76),
('Meena',103,88);

CREATE TABLE Department(
DeptID INT,
Dept_name Varchar(50)
);

INSERT INTO Department(DeptID,Dept_name) VALUES
(101,'Computer Science'),
(102,'IT'),
(103,'CSE');

-- Use an aggregate function to display the average marks of students in each department.
SELECT 
    d.Dept_name, AVG(s.Marks) AS Average_Marks
FROM
    Student s
        JOIN
    Department d ON s.DeptID = d.DeptID
GROUP BY d.Dept_name;

-- Write a query using a JOIN to display student names along with their department names.
SELECT 
    s.Name , d.Dept_name
FROM
    Student s
        JOIN
    Department d ON s.DeptID = d.DeptID;
    
-- Write a subquery to find students who scored more than the average marks of all students.
SELECT 
    *
FROM
    Student
WHERE
    Marks > (SELECT 
            AVG(Marks)
        FROM
            Student);
            
-- Create a stored procedure named GetTopStudents that returns all students with marks greater than 85.
DELIMITER //
CREATE PROCEDURE GetTopStudents()
BEGIN
    SELECT s.Name, s.Marks, d.Dept_name
    FROM Student s
    JOIN Department d ON s.DeptID = d.DeptID
    WHERE s.Marks > 85;
END//

DELIMITER ;

CALL GetTopStudents();

