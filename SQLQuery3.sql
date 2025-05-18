-- Clean up previous data if re-running
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Employee1;
DROP TABLE IF EXISTS Employee2;

-- 1. Create Employee Table
CREATE TABLE Employee (
    EmpID INT,
    Name VARCHAR(50),
    Age INT,
    DeptID INT
);

INSERT INTO Employee VALUES
(1, 'Alice', 30, 101),
(2, 'Bob', 24, 102),
(3, 'Carol', 28, 103);

-- 2. Create Department Table
CREATE TABLE Department (
    DeptID INT,
    DeptName VARCHAR(50)
);

INSERT INTO Department VALUES
(101, 'HR'),
(102, 'IT'),
(104, 'Finance');

-- 3. Selection (σ Age > 25)
SELECT * FROM Employee WHERE Age > 25;

-- 4. Projection (π Name, Age)
SELECT Name, Age FROM Employee;

-- 5. Rename (ρ) Table and Column
SELECT Name AS EmployeeName, Age FROM Employee AS Emp;

-- 6. Cartesian Product (×)
SELECT * FROM Employee CROSS JOIN Department;

SELECT * 
FROM Employee
INNER JOIN Department
ON Employee.DeptID = Department.DeptID;

select * from Department

-- 7. Join (⨝) - Inner Join on DeptID
SELECT *
FROM Employee
JOIN Department
ON Employee.DeptID = Department.DeptID;

SELECT * FROM Employee
LEFT OUTER JOIN Department
ON Employee.DeptID = Department.DeptID;

SELECT * FROM Employee
RIGHT OUTER JOIN Department
ON Employee.DeptID = Department.DeptID;


-- 8. Union (∪)
CREATE TABLE Employee1 (
    EmpID INT,
    Name VARCHAR(50)
);

INSERT INTO Employee1 VALUES
(1, 'Alice'),
(2, 'Bob');

CREATE TABLE Employee2 (
    EmpID INT,
    Name VARCHAR(50)
);

INSERT INTO Employee2 VALUES
(2, 'Bob'),
(3, 'Charlie');

-- Union
SELECT * FROM Employee1
UNION
SELECT * FROM Employee2;

-- 9. Set Difference (−)
-- In PostgreSQL or SQLite, use EXCEPT
SELECT * FROM Employee1
EXCEPT
SELECT * FROM Employee2;

-- 10. Intersection (∩)
SELECT * FROM Employee1
INTERSECT
SELECT * FROM Employee2;
