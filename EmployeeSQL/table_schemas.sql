DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles (
  title_id varchar(45),
  title varchar(45) NOT NULL,
  PRIMARY KEY(title_id)
);

CREATE TABLE employees (
  emp_no integer,
  emp_title varchar(45),
  birth_date date,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  sex varchar(6) NOT NULL,
  hire_date date,
  PRIMARY KEY(emp_no),
  FOREIGN KEY(emp_title) REFERENCES titles(title_id)
);

CREATE TABLE departments (
  dept_no varchar(45),
  dept_name varchar(45) NOT NULL,
  PRIMARY KEY(dept_no)
);

CREATE TABLE dept_manager (
  dept_no varchar(45),
  emp_no integer,
  PRIMARY KEY(dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
  emp_no integer,
  dept_no varchar(45),  
  PRIMARY KEY(emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no) 
);

CREATE TABLE salaries (
  emp_no integer,
  salary decimal, 
  PRIMARY KEY (emp_no, salary),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


