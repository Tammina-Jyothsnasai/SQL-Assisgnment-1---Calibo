MySQL Practical Assignment – Employee Data Analysis

Index

Stage 1 – Create Employees Table

Stage 2 – Insert Employee Records

Stage 3 – SELECT Queries

Stage 4 – WHERE and Comparison Operators

Stage 5 – Logical Operators

Stage 6 – Special Operators

Stage 7 – ORDER BY

Stage 8 – Aggregate Functions

Stage 9 – GROUP BY

Stage 10 – HAVING

Stage 11 – Challenge Questions

Stage 12 – Verification

DATABASE SETUP

CREATE DATABASE JYO;
USE JYO;

This database is created to perform employee data analysis using different SQL concepts such as constraints, filtering, sorting, aggregate functions, grouping, and HAVING clauses.

Stage 1: Create the Employees Table

Query 1: CREATE TABLE

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

Query 2: DESC employees

DESC employees;

Stage 2: Insert Employee Data

The assignment inserts 20 realistic employee records with different departments, cities, salaries, ages, and job roles.

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

Stage 3: SELECT Queries

Query 1: Display all employee records

This query is used to display all the details of employees from the employees table.

SELECT * FROM employees;

Query 2: Display specific columns

Display Employee Name, Department, Salary, and City.

This query is used to display only the required details of employees.

SELECT emp_name, department, salary, city
FROM employees;

Retrieve employees based on specific conditions

This query finds employees who are working in the IT department and whose salary is greater than 50000.

The AND operator is used because both conditions should be satisfied.

SELECT *
FROM employees
WHERE department = 'IT' AND salary > 50000;

Stage 4: WHERE and Comparison Operators

1. Equal to (=)

Display employees whose salary is exactly 65000.

The equal to operator is used to find employees whose salary exactly matches the given value.

SELECT * FROM employees
WHERE salary = 65000;

2. Greater than (>)

Display employees earning more than 60000.

The greater than operator is used to find values that are higher than the given value.

SELECT * FROM employees
WHERE salary > 60000;

3. Less than (<)

Display employees whose age is below 25.

The less than operator is used to find values that are lower than the given value.

SELECT * FROM employees
WHERE age < 25;

4. Greater than or Equal to (>=)

Display employees earning greater than or equal to 80000.

The greater than or equal to operator is used to find values that are either greater than or exactly equal to the given value.

SELECT * FROM employees
WHERE salary >= 80000;

5. Less than or Equal to (<=)

Display employees whose age is less than or equal to 30.

The less than or equal to operator is used to find values that are either smaller than or exactly equal to the given value.

SELECT * FROM employees
WHERE age <= 30;

6. Not Equal to (<> and !=)

Display employees whose department is not HR.

The not equal operator is used to exclude a particular value. Both != and <> can be used for not equal in SQL.

SELECT * FROM employees
WHERE department != 'HR';

In this stage, I learned how to use the WHERE clause with different comparison operators to filter employee records. These operators help me retrieve records based on conditions such as equal to, greater than, less than, and not equal to.

Stage 5: Logical Operators

1. AND Operator

Find employees from the IT department AND earning above 60,000.

The AND operator is used when both conditions should be true.

SELECT * FROM employees
WHERE department = 'IT' AND salary > 60000;

2. OR Operator

Find employees who belong to either the IT department OR HR department.

The OR operator is used when at least one of the given conditions should be true.

SELECT * FROM employees
WHERE department = 'IT' OR department = 'HR';

3. NOT Operator

Find employees who are NOT from the IT department.

The NOT operator is used to exclude records that satisfy a condition.

SELECT * FROM employees
WHERE NOT department = 'IT';

Stage 6: Special Operators

1. BETWEEN

Find employees whose salary is between 60,000 and 65,000.

BETWEEN is used to find values within a specific range.

SELECT * FROM employees
WHERE salary BETWEEN 60000 AND 65000;

2. IN

Find employees belonging to selected cities such as Hyderabad, Vijayawada, and Bangalore.

IN is used to check for multiple selected values.

SELECT * FROM employees
WHERE city IN ('Hyderabad', 'Vijayawada', 'Bangalore');

3. NOT IN

Find employees who are not from IT or HR departments.

NOT IN is used to exclude multiple values from the result.

SELECT * FROM employees
WHERE department NOT IN ('IT', 'HR');

4. LIKE

LIKE is used to search for patterns.

Employee names starting with 'A'

SELECT * FROM employees
WHERE emp_name LIKE 'A%';

LIKE is used to search for a particular pattern in text, such as employee names starting with a specific letter.

5. IS NULL

Find employees whose city value is NULL.

IS NULL is used to find records where a value is missing.

SELECT * FROM employees
WHERE city IS NULL;

6. IS NOT NULL

Find employees whose city information is available.

IS NOT NULL is used to find records where a value is available.

SELECT * FROM employees
WHERE city IS NOT NULL;

In this stage, I learned how to use special operators in SQL to filter records in different ways. These operators make it easier to search and filter the required employee records from the table.

Stage 7: ORDER BY

ORDER BY is used to sort records in ascending or descending order.

1. Sort employees by salary in ascending order

ASC is used to sort the records from smaller to larger values or in alphabetical order.

SELECT * FROM employees
ORDER BY salary ASC;

2. Sort employees by salary in descending order

DESC is used to sort the records from larger to smaller values or in reverse alphabetical order.

SELECT * FROM employees
ORDER BY salary DESC;

3. Sort employees by age in descending order

SELECT * FROM employees
ORDER BY age DESC;

4. Sort employees by department

SELECT * FROM employees
ORDER BY department ASC;

5. Sort employees by multiple columns

First sort by department in ascending order, then employees with the same department by salary in descending order.

SELECT * FROM employees
ORDER BY department ASC, salary DESC;

In this stage, I learned how to use the ORDER BY clause to arrange employee records in a particular order. I also learned that ORDER BY can be used with different columns such as salary, age, and department. We can also sort using multiple columns.

Stage 8: Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a single result.

1. COUNT() – Total Number of Employees

This counts all employee records in the table.

SELECT COUNT(*) AS total_employees
FROM employees;

2. SUM() – Total Salary Paid

This calculates the total of all employee salaries.

SELECT SUM(salary) AS total_salary
FROM employees;

3. AVG() – Average Salary

This calculates the average salary of all employees.

SELECT AVG(salary) AS average_salary
FROM employees;

4. MIN() – Lowest Salary

This finds the lowest salary in the table.

SELECT MIN(salary) AS minimum_salary
FROM employees;

5. MAX() – Highest Salary

This finds the highest salary in the table.

SELECT MAX(salary) AS maximum_salary
FROM employees;

Stage 9: GROUP BY

GROUP BY is used to group rows that have the same value in a particular column. Then aggregate functions like COUNT(), AVG(), MIN(), MAX(), and SUM() can be applied to each group.

Department-wise Analysis

Count employees in each department.

Calculate average salary for each department.

Find minimum salary in each department.

Find maximum salary in each department.

Calculate total salary by department.

SELECT department,
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary,
       MIN(salary) AS minimum_salary,
       MAX(salary) AS maximum_salary,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;

City-wise Analysis

1. Count employees in each city

GROUP BY will also show employees whose city is NULL as a separate group.

SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city;

2. Calculate average salary by city

SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;

3. Find maximum salary by city

SELECT city, MAX(salary) AS maximum_salary
FROM employees
GROUP BY city;

Stage 10: HAVING

HAVING is used to filter grouped results, usually after using GROUP BY.

1. Find departments having more than a specified number of employees

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

2. Find departments with an average salary above a specified amount

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

3. Find cities having more than a specified number of employees

SELECT city, COUNT(*) AS total_employees
FROM employees
GROUP BY city
HAVING COUNT(*) > 2;

4. Find departments where the maximum salary is above a specified amount

SELECT department, MAX(salary) AS maximum_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 70000;

Stage 11: Challenge Questions

1. Find the second-highest salary

This query first finds the highest salary. Then it finds the maximum salary that is less than the highest salary.

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

2. Find employees earning above the average salary

The subquery calculates the average salary of all employees. Then the main query compares each employee's salary with the average.

SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

3. Find the employee(s) with the highest salary

The subquery finds the highest salary using MAX(). The main query finds the employees whose salary is the highest salary.

SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

4. Find the employee(s) with the lowest salary

The subquery finds the lowest salary using MIN(). The main query finds the employees whose salary is the lowest.

SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

5. Find the department with the highest average salary

First, the query calculates the average salary for each department. Then the departments are arranged from highest average salary to lowest. LIMIT 1 displays the department with the highest average salary.

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;

6. Find the department with the highest number of employees

COUNT() is used to find the number of employees in each department. The departments are then sorted from highest count to lowest count.

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
ORDER BY total_employees DESC
LIMIT 1;

7. Find employees who earn more than the average salary of their department

SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

It checks the employee's department, calculates the average salary of that department, and displays the employee only if their salary is greater than that average.

8. Find the second-highest salary in each department

The inner query finds the highest salary in that department. WHERE salary < highest salary removes the highest salary. MAX(salary) finds the highest remaining salary. GROUP BY department gives the result for each department.

Method 1 – Subquery

SELECT department, MAX(salary) AS second_highest_salary
FROM employees e1
WHERE salary < (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e2.department = e1.department
)
GROUP BY department;

Method 2 – DENSE_RANK()

DENSE_RANK() is useful because if multiple employees have the same salary, they receive the same rank.

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

9. Find cities with the highest number of employees

First, the inner query counts the employees in each city. The outer query finds the highest employee count. HAVING is used to display the city or cities that have this highest number of employees.

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

10. Find departments where the total salary is greater than a specified amount

SUM() calculates the total salary for each department. GROUP BY is used to calculate the total separately for each department. HAVING filters the departments based on their total salary.

SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 250000;

Stage 12: Final Deliverables / Verification

Query 1: Verify Table Structure

DESC employees;

Query 2: Display all employee records

SELECT * FROM employees;

Query 3: Verify Total Employees

SELECT COUNT(*) AS total_employees
FROM employees;

Tools Used

MySQL

SQL

Author

T. Jyothsna Sai

Program

Calibo AI Academy
