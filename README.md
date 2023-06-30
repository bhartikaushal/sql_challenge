# sql_challenge
For this project, I created a database in PgAdmin 4, created tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data.

STEPS:

1. The first step was to create an ERD diagram to see the relationship between the different tables in the employee database. The primary and foreign keys were identified for each table.
2. Then database named 'Employee' was created in the PgAdmin 4. The tables were created in the database and csv files were imported into the Employee database.
3. SQL queries were written to analyze data. Queries extracted  the following information from the database:

    a. The employee number, last name, first name, sex, and salary of each employee.
    b. The first name, last name, and hire date for the employees who were hired in 1986.
    c. Manager of each department along with their department number, department name, employee number, last name, and first name.
    d. The department number for each employee along with that employee’s employee number, last name, first name, and department name.
    e. The  first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
    f. Each employee in the Sales department, including their employee number, last name, and first name.
    g. Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
    h. The frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
