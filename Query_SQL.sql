-- Create the schemata for the tables
CREATE TABLE Departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE Titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(20) NOT NULL
);


CREATE TABLE Employees(
	emp_no INT PRIMARY KEY, 
	emp_title_id VARCHAR(10) NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(10) NOT NULL, 
	hire_date DATE NOT NULL, 
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE Dept_manager(
	dept_no VARCHAR(10) NOT NULL, 
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no), 
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no), 
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE Salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);


-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT Employees.emp_no,
	   Employees.first_name,
	   Employees.last_name,
	   Employees.sex,
	   Salaries.salary
FROM Employees
JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;
	

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM Employees
Where hire_date BETWEEN '1980-01-01' AND '1986-12-31';
	   
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   de.dept_no,
	   d.dept_name
FROM Employees AS e
INNER JOIN Dept_emp AS de ON
e.emp_no = de.emp_no
INNER JOIN Departments AS d ON
de.dept_no = d.dept_no;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT m.dept_no, d.dept_name, m.emp_no,e.last_name, e.first_name
FROM dept_manager m
JOIN employees e 
ON m.emp_no = e.emp_no
JOIN departments d 
ON m.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM Employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT emp_no, first_name,last_name, (SELECT
	 dept_name FROM Departments WHERE
	 dept_name = 'Sales')
FROM Employees;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name,e.last_name, d.dept_name
FROM Employees AS e
INNER JOIN dept_emp AS de ON
e.emp_no = de.emp_no
INNER JOIN Departments AS d ON
de.dept_no = d. dept_no
WHERE dept_name IN ('Sales','Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) 

SELECT last_name, COUNT(last_name) FROM Employees
GROUP BY last_name
ORDER BY last_name DESC;


