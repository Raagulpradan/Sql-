-- REINFORCEMENT 2 MARK --

create database reinforcement_2mark;
use reinforcement_2mark;

-- 1 Write an SQL query to create a table Students with columns id (INT), name (VARCHAR(50)),and marks (INT).
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);

-- 2 Insert a record into the Students table with values (1, 'Rahul', 85).
INSERT INTO Students (StudentID, Name, Marks) VALUES
(1,'Rahul',85);

-- 3 Write a query to update marks of student with id = 1 to 90.
UPDATE students 
SET 
    marks = 90
WHERE
    studentID = 1;

-- 4 Display all students whose marks are greater than 75.
SELECT 
    *
FROM
    Students
WHERE
    marks > 75;
    
-- 5 Write a query to find the average marks of all students.
SELECT 
    AVG(marks) AS average_marks
FROM
    Students;
    
-- 6 Retrieve the second highest mark from the students table.
SELECT marks
FROM Students
ORDER BY marks DESC
LIMIT 1 OFFSET 1;

-- 7 Write a query to display the current date and time using MySQL function.
SELECT NOW() AS current_datetime;

-- 8 Write a query using LEFT JOIN between Students and Courses tables on id.
CREATE TABLE courses (
    StudentID INT PRIMARY KEY,
    course_name VARCHAR(50)
);
INSERT INTO courses (StudentID, course_name) VALUES
(1, 'Maths');

SELECT 
    students.name, students.marks, courses.course_name
FROM
    students
        LEFT JOIN
    courses ON students.StudentID = courses.StudentID;

-- 9 Create a view named Top Students that shows students with marks greater than 80.
CREATE VIEW topstudents AS
    SELECT 
        *
    FROM
        Students
    WHERE
        marks > 75;

-- 10 Write a query to create a trigger that automatically sets marks to 0 if a negative value is inserted.
DELIMITER //
CREATE TRIGGER before_student_insert
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    IF NEW.Marks < 0 THEN
        SET NEW.Marks = 0;
    END IF;
END //
DELIMITER ;
