CREATE TABLE departments (
  dept_no VARCHAR(5) PRIMARY KEY,
  dept_name VARCHAR(25)
)

SELECT *
FROM departments

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(6)
)

SELECT *
FROM dept_emp

CREATE TABLE dept_manager(
	dept_no VARCHAR(5),
	emp_no INT
)

SELECT *
FROM dept_manager

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(7),
	birth_date date,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(2),
	hire_date date
)

SELECT *
FROM employees

CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT
)


SELECT *
FROM salaries

CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
)

SELECT *
FROM titles

---------check how many unique emp_no in employees--300024
SELECT COUNT(*)
FROM 
(SELECT DISTINCT emp_no
FROM employees) AS temp
---------check how many emp_no in employees ----300024-- no duplicates
SELECT COUNT(*)
FROM employees

---------check how many emp_no in employees ----300024
SELECT count(emp_no)
FROM salaries

---------check how many unique emp_no in employees ----300024--- no duplicates
SELECT COUNT(*)
FROM
(SELECT DISTINCT emp_no
FROM salaries) AS temp

SELECT s.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM salaries s
RIGHT OUTER JOIN employees e ON
s.emp_no=e.emp_no

SELECT first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT(YEAR FROM (hire_date)) ='1986'

-- fix wrong type in dept_manager table
ALTER TABLE dept_manager
ALTER COLUMN emp_no TYPE INT
USING emp_no::integer

SELECT dm.dept_no,
	dp.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager dm
LEFT JOIN departments dp
ON dm.dept_no=dp.dept_no
LEFT JOIN employees e
ON dm.emp_no=e.emp_no

SELECT dm.dept_no,
	dp.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager dm
LEFT JOIN departments dp
ON dm.dept_no=dp.dept_no
LEFT JOIN employees e
ON dm.emp_no=e.emp_no

SELECT DISTINCT emp_no
FROM dept_emp dm

SELECT DISTINCT emp_no
FROM employees

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	dp.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no=de.emp_no
LEFT JOIN departments dp
ON de.dept_no=dp.dept_no
ORDER BY 4

SELECT first_name,
	last_name,
	sex
FROM employees
WHERE (first_name='Hercules'
AND last_name LIKE 'B%')

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	dp.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments dp
ON de.dept_no=dp.dept_no
WHERE dp.dept_name='Sales'

SELECT e.emp_no,
	e.last_name,
	e.first_name,
	dp.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments dp
ON de.dept_no=dp.dept_no
WHERE (dp.dept_name='Sales' 
OR dp.dept_name='Development')

SELECT last_name,
	count(last_name) as Frequency
FROM employees
GROUP BY last_name
ORDER BY 2 DESC





	
