-- MySQL Practical Assignment – Employee Data Analysis
-- Database: JYO

CREATE DATABASE JYO;
USE JYO;

-- Stage 1: Create the Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50) NOT NULL,
    job_role VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Vijayawada'
);

DESC employees;

-- Stage 2: Insert Employee Data
INSERT INTO employees (emp_id, emp_name, email, department, job_role, salary, age, city) VALUES
(101, 'Rahul Sharma', 'rahul.sharma@gmail.com', 'IT', 'Software Developer', 60000, 24, 'Hyderabad'),
(102, 'Priya Reddy', 'priya.reddy@gmail.com', 'HR', 'HR Executive', 45000, 26, 'Vijayawada'),
(103, 'Arjun Kumar', 'arjun.kumar@gmail.com', 'Finance', 'Financial Analyst', 55000, 28, 'Bangalore'),
(104, 'Sneha Patel', 'sneha.patel@gmail.com', 'Marketing', 'Marketing Executive', 50000, 25, 'Chennai'),
(105, 'Vikram Singh', 'vikram.singh@gmail.com', 'Sales', 'Sales Executive', 45000, 27, 'Hyderabad'),
(106, 'Anjali Verma', 'anjali.verma@gmail.com', 'IT', 'Software Tester', 55000, 23, 'Pune'),
(107, 'Karthik Rao', 'karthik.rao@gmail.com', 'Finance', 'Accountant', 50000, 30, 'Vijayawada'),
(108, 'Divya Nair', 'divya.nair@gmail.com', 'HR', 'Recruiter', 45000, 29, 'Bangalore'),
(109, 'Rohan Mehta', 'rohan.mehta@gmail.com', 'Marketing', 'Content Strategist', 60000, 26, 'Chennai'),
(110, 'Meera Iyer', 'meera.iyer@gmail.com', 'Sales', 'Business Development Executive', 55000, 24, 'Pune'),
(111, 'Suresh Babu', 'suresh.babu@gmail.com', 'IT', 'Data Analyst', 65000, 31, 'Hyderabad'),
(112, 'Kavya Singh', 'kavya.singh@gmail.com', 'HR', 'HR Manager', 70000, 35, 'Vijayawada'),
(113, 'Aman Gupta', 'aman.gupta@gmail.com', 'Finance', 'Senior Accountant', 65000, 33, 'Bangalore'),
(114, 'Pooja Das', 'pooja.das@gmail.com', 'Marketing', 'SEO Specialist', 50000, 27, 'Chennai'),
(115, 'Naveen Kumar', 'naveen.kumar@gmail.com', 'Sales', 'Sales Manager', 70000, 34, 'Pune'),
(116, 'Lakshmi Devi', 'lakshmi.devi@gmail.com', 'IT', 'Project Manager', 80000, 36, 'Hyderabad'),
(117, 'Manoj Reddy', 'manoj.reddy@gmail.com', 'Finance', 'Finance Manager', 80000, 38, 'Vijayawada'),
(118, 'Swathi Krishna', 'swathi.krishna@gmail.com', 'Marketing', 'Graphic Designer', 55000, 25, 'Bangalore'),
(119, 'Ajay Varma', 'ajay.varma@gmail.com', 'Sales', 'Sales Associate', 40000, 22, 'Chennai'),
(120, 'Neha Joshi', 'neha.joshi@gmail.com', 'IT', 'UI UX Designer', 60000, 28, NULL);

-- Stage 3: SELECT Queries
SELECT * FROM employees;
SELECT emp_name, department, salary, city FROM employees;
SELECT * FROM employees WHERE department = 'IT' AND salary > 50000;

-- Stage 4: WHERE and Comparison Operators
SELECT * FROM employees WHERE salary = 65000;
SELECT * FROM employees WHERE salary > 60000;
SELECT * FROM employees WHERE age < 25;
SELECT * FROM employees WHERE salary >= 80000;
SELECT * FROM employees WHERE age <= 30;
SELECT * FROM employees WHERE department != 'HR';

-- Stage 5: Logical Operators
SELECT * FROM employees WHERE department = 'IT' AND salary > 60000;
SELECT * FROM employees WHERE department = 'IT' OR department = 'HR';
SELECT * FROM employees WHERE NOT department = 'IT';

-- Stage 6: Special Operators
SELECT * FROM employees WHERE salary BETWEEN 60000 AND 65000;
SELECT * FROM employees WHERE city IN ('Hyderabad', 'Vijayawada', 'Bangalore');
SELECT * FROM employees WHERE department NOT IN ('IT', 'HR');
SELECT * FROM employees WHERE emp_name LIKE 'A%';
SELECT * FROM employees WHERE city IS NULL;
SELECT * FROM employees WHERE city IS NOT NULL;

-- Stage 7: ORDER BY
SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY age DESC;
SELECT * FROM employees ORDER BY department ASC;
SELECT * FROM employees ORDER BY department ASC, salary DESC;

-- Stage 8: Aggregate Functions
SELECT COUNT(*) AS total_employees FROM employees;
SELECT SUM(salary) AS total_salary FROM employees;
SELECT AVG(salary) AS average_salary FROM employees;
SELECT MIN(salary) AS minimum_salary FROM employees;
SELECT MAX(salary) AS maximum_salary FROM employees;

-- Stage 9: GROUP BY
SELECT department,
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary,
       MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city;

SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;

SELECT city, MAX(salary) AS maximum_salary
FROM employees
GROUP BY city;

-- Stage 10: HAVING
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

SELECT department, MAX(salary) AS maximum_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 70000;

-- Stage 11: Challenge Questions
-- 1. Second-highest salary
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- 2. Employees earning above average salary
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 3. Employee(s) with highest salary
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 4. Employee(s) with lowest salary
SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 5. Department with highest average salary
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;

-- 6. Department with highest number of employees
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY total_employees DESC
LIMIT 1;

-- 7. Employees earning more than department average
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- 8A. Second-highest salary in each department using subquery
SELECT department, MAX(salary) AS second_highest_salary
FROM employees e1
WHERE salary < (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e2.department = e1.department
)
GROUP BY department;

-- 8B. Second-highest salary in each department using DENSE_RANK
SELECT department, salary AS second_highest_salary
FROM (
    SELECT department, salary,
           DENSE_RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
) AS ranked_salaries
WHERE salary_rank = 2;

-- 9. Cities with highest number of employees
SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city
HAVING COUNT(*) = (
    SELECT MAX(employee_count)
    FROM (
        SELECT COUNT(*) AS employee_count
        FROM employees
        GROUP BY city
    ) AS city_counts
);

-- 10. Departments where total salary is greater than 250000
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 250000;

-- Stage 12: Verification
DESC employees;
SELECT * FROM employees;
SELECT COUNT(*) AS total_employees FROM employees;
