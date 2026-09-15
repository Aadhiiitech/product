CREATE DATABASE employee_department_db;

USE employee_department_db;

CREATE TABLE department(
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employee(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES department(department_id)
);

INSERT INTO department(department_name) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing');

INSERT INTO employee(employee_name,salary,department_id) VALUES
('Rahul',55000,1),
('Priya',45000,1),
('Arun',35000,1),
('Sneha',30000,1),
('Karthik',28000,1),
('Vijay',60000,1),
('Anjali',50000,1),
('Divya',40000,2),
('Ravi',35000,2),
('Meena',30000,2),
('Suresh',45000,3),
('Pooja',38000,3),
('Manoj',42000,3),
('Asha',32000,4),
('Naveen',37000,4),
('Deepa',41000,4),
('Harish',36000,4);

SELECT * FROM department;

SELECT * FROM employee;

SELECT e.employee_id,e.employee_name,e.salary,d.department_name
FROM employee e
JOIN department d
ON e.department_id=d.department_id;

SELECT d.department_name,COUNT(e.employee_id) AS employee_count
FROM department d
LEFT JOIN employee e
ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name;

SELECT d.department_name,e.employee_name,e.salary
FROM department d
JOIN employee e
ON d.department_id=e.department_id
WHERE e.salary=(
    SELECT MAX(e2.salary)
    FROM employee e2
    WHERE e2.department_id=e.department_id
);

SELECT d.department_name,COUNT(e.employee_id) AS employee_count
FROM department d
JOIN employee e
ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name
HAVING COUNT(e.employee_id)>5;

SELECT d.department_name,AVG(e.salary) AS average_salary
FROM department d
JOIN employee e
ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name;

INSERT INTO employee(employee_name,salary,department_id)
VALUES('Sanjay',48000,1);

SELECT * FROM employee
WHERE employee_id=18;

UPDATE employee
SET salary=52000
WHERE employee_id=18;

SELECT * FROM employee
WHERE employee_id=18;

DELETE FROM employee
WHERE employee_id=18;

SELECT * FROM employee;
