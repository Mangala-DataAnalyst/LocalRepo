use employees;
-- Find employees who have worked in more than one department during their employment history.

SELECT 
    e.emp_no,
    first_name,
    last_name,
    COUNT(d.dept_no) AS total_dept
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON d.dept_no = de.dept_no
GROUP BY e.emp_no , e.first_name , e.last_name
HAVING total_dept > 1
ORDER BY total_dept DESC;

-- Find employees who are currently working in the Development department.

SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    dept_name = 'Development'
        AND de.to_date = '2000-01-01';

-- Display each department name with its manager's name.

SELECT
    e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name,
    s.salary
FROM employees e
INNER JOIN dept_emp de
    ON e.emp_no = de.emp_no
INNER JOIN departments d
    ON de.dept_no = d.dept_no
INNER JOIN salaries s
    ON e.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
  AND s.salary > 80000
ORDER BY s.salary DESC;
    

