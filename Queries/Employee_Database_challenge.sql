--DELIVERABLE 1
-- Joining employees_info and titles_info tables and filter on birth_date
SELECT e.emp_no,
    e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--Handling Duplicates
SELECT DISTINCT ON (r.emp_no) r.emp_no,
    r.first_name,
    r.last_name,
    r.title

INTO unique_titles
FROM retirement_titles as r
ORDER BY r.emp_no, r.to_date DESC;

--Retrieve Retiring Titles
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut 
GROUP BY ut.title
ORDER BY ut.count DESC;

--DELIVERABLE 2
--Mentorship Eligibility
SELECT DISTINCT ON (em.emp_no) em.emp_no,
    em.first_name,
	em.last_name,
	em.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS em
INNER JOIN dept_emp AS de
ON (em.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no, title;