

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, last_name, first_name, sex, salary
FROM employees as e
INNER JOIN salaries as s 
ON e.emp_no = s.emp_no;
--LIMIT 5;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees as e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
--LIMIT 5;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, m.emp_no as manager_no, last_name, first_name
FROM departments as d
INNER JOIN dept_manager as m ON d.dept_no = m.dept_no
INNER JOIN employees as e ON e.emp_no = m.emp_no;
--LIMIT 5;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees as e
INNER JOIN dept_emp as d_e ON e.emp_no = d_e.emp_no
INNER JOIN departments as d ON d_e.dept_no = d.dept_no;
--LIMIT 5;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees as e
INNER JOIN dept_emp as d ON e.emp_no = d.emp_no
INNER JOIN departments as depts ON d.dept_no = depts.dept_no
WHERE dept_name = 'Sales';
--LIMIT 5;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees as e
INNER JOIN dept_emp as d ON e.emp_no = d.emp_no
INNER JOIN departments as depts ON d.dept_no = depts.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as num_emp
FROM employees
GROUP BY (last_name)
ORDER BY num_emp DESC;