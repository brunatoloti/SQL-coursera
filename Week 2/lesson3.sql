-- 1) List the employeeid, firstname + lastname concatenated as ‘employee’, and the age of the employee when they were hired.
SELECT employeeid,
       CONCAT(firstname, ' ', lastname) AS employee,
       CAST(AGE(hiredate, birthdate) AS text)
FROM employees;

-- 2) List the employeeid, firstname + lastname concatenated as ‘employee’, and hire date for all employees hired in 1993
SELECT employeeid
       CONCAT(firstname, ' ', lastname) AS employee,
       hiredate
FROM employees
WHERE DATE_PART('year', hiredate) = 1993;