-- 1. List the following details of each employee: employee number, last name, 
-- first name, gender, and salary.
select employees.emp_no, last_name, first_name, gender, salary from employees
inner join salaries
	on employees.emp_no = salaries.emp_no;
	

-- 2. List employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date from employees
	where hire_date >= '1986-01-01' and hire_date < '1987-01-01';
	

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, last_name, first_name, dm.from_date, dm.to_date
from dept_manager dm
join departments d
	on dm.dept_no = d.dept_no
join employees e
	on dm.emp_no = e.emp_no;
	
	
-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select e.emp_no, last_name, first_name, dept_name from employees e
join dept_emp de
	on de.emp_no = e.emp_no
join departments d
	on d.dept_no = de.dept_no;
	
	
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name from employees
where first_name = 'Hercules' and last_name like 'B%';


-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
select e.emp_no, last_name, first_name, dept_name from employees e
join dept_emp de
	on de.emp_no = e.emp_no
join departments d
	on d.dept_no = de.dept_no
where dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select e.emp_no, last_name, first_name, dept_name from employees e
join dept_emp de
	on de.emp_no = e.emp_no
join departments d
	on d.dept_no = de.dept_no
where dept_name = 'Sales' or dept_name = 'Development'
order by dept_name;


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name, count(last_name) as "Count" from employees
group by last_name
order by "Count" desc;


-- Epilogue
select * from employees where emp_no = 499942;



