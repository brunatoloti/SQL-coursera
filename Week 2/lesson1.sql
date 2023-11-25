-- 1) List all the products in the Northwinds database showing productid, productname, quantity per unit, unitprice, and unitsinstock.
SELECT productid, productname, quantityperunit, unitprice, unitsinstock
FROM products;

-- 2) For all employees at Northwinds, list the first name and last name concatenated together with a blank space in-between, and the YEAR when they were hired.
SELECT CONCAT(firstname, ' ', lastname),
       date_part('year', hiredate)
FROM employees;

-- 3) For all products in the Northwinds database, list the productname, unitprice, unitsinstock, and the total value of the inventory of that product as “Total Value”. (HINT: total value = unitsinstock * unitprice.)
SELECT productname, unitprice, unitsinstock,
       unitprice*unitsinstock AS "Total Value"
FROM products;

-- 4) For all employees at Northwinds, list the first name and last name concatenated together with a blank space in-between with a column header “Name”, and the name of the month (spelled out) for each employee’s birthday.
SELECT CONCAT(firstname, ' ', lastname) AS Name
       TO_CHAR(birthdate, 'month')
FROM employees;