-- 1. List the following details of each employee: employee number,
-- last name, first name, gender, and salary

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
RIGHT JOIN salaries s
ON (s.emp_no = e.emp_no);

-- 2. List employees who were hired in 1986.
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
SELECT Departments.dept_no, Departments.dept_name, Dept_manager.emp_no, 
employees.first_name, employees.last_name, Dept_manager.from_date, Dept_manager.to_date
FROM Departments
RIGHT JOIN Dept_manager
ON (Departments.dept_no = Dept_manager.dept_no)
JOIN employees
ON (Dept_manager.emp_no = employees.emp_no);

-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
JOIN departments
ON (dept_emp.dept_no = departments.dept_no);

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.emp_no, employees.first_name, employees.last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e.,
-- how many employees share each last name.
SELECT employees.last_name, COUNT(employees.emp_no)
FROM employees 
GROUP BY employees.last_name 
ORDER BY COUNT(employees.emp_no) DESC;