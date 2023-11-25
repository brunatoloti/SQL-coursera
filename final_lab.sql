/* Query SELECT Problems Using the Classic Models database */

-- 1) List  the names of the cities in alphabetical order where Classic Models has offices. (7)
SELECT city 
FROM offices
ORDER BY city;

-- 2) List the EmployeeNumber, LastName, FirstName, Extension for all employees working out of the Paris office. (5)
SELECT employeenumber, lastname, firstname, extension
FROM employees
WHERE officecode IN (
	SELECT officecode
	FROM offices
	WHERE city='Paris');

-- 3) List the ProductCode, ProductName, ProductVendor, QuantityInStock and ProductLine for all products with a QuantityInStock between 200 and 1200. (11) 
SELECT productcode, productname, productvendor, quantityinstock, productline
FROM products
WHERE quantityinstock BETWEEN 200 and 1200;

-- 4) (Use a SUBQUERY) List the ProductCode, ProductName, ProductVendor, BuyPrice and MSRP for the least expensive (lowest MSRP) product sold by ClassicModels.  (“MSRP” is the Manufacturer’s Suggested Retail Price.)  (1)
SELECT productcode, productname, productvendor, buyprice, msrp
FROM products
WHERE msrp = (SELECT MIN(msrp) FROM products);

-- 5) What is the ProductName and Profit of the product that has the highest profit (profit = MSRP minus BuyPrice). (1)
SELECT productname, msrp - buyprice AS profit
FROM products
ORDER BY 2 DESC LIMIT 1;

-- 6) List the country and the number of customers from that country for all countries having just two  customers.  List the countries sorted in ascending alphabetical order. Title the column heading for the count of customers as “Customers”.(7)
SELECT DISTINCT country, COUNT(customernumber) AS Customers
FROM customers
GROUP BY country
HAVING COUNT(customernumber) = 2
ORDER BY country;

-- 7) List the ProductCode, ProductName, and number of orders for the products with exactly 25 orders.  Title the column heading for the count of orders as “OrderCount”. (12)
SELECT od.productcode, p.productname, COUNT(od.ordernumber) AS OrderCount
FROM orderdetails od
JOIN products p
	ON od.productcode=p.productcode
GROUP BY od.productcode, p.productname
HAVING COUNT(od.ordernumber) = 25;

-- 8) List the EmployeeNumber, Firstname + Lastname  (concatenated into one column in the answer set, separated by a blank and referred to as ‘name’) for all the employees reporting to Diane Murphy or Gerard Bondur. (8)
SELECT employeenumber, CONCAT(firstname, ' ', lastname) AS name
FROM employees
WHERE reportsto IN (SELECT employeenumber
		              FROM employees
		               WHERE CONCAT(firstname, ' ', lastname) IN ('Diane Murphy', 'Gerard Bondur')
);

-- 9) List the EmployeeNumber, LastName, FirstName of the president of the company (the one employee with no boss.)  (1)
SELECT employeenumber, firstname, lastname
FROM employees
WHERE reportsto IS NULL;

-- 10) List the ProductName for all products in the “Classic Cars” product line from the 1950’s.  (6)
SELECT productname
FROM products
WHERE productline = 'Classic Cars' AND productname LIKE '195%';

-- 11) List the month name and the total number of orders for the month in 2004 in which ClassicModels customers placed the most orders. (1)
SELECT TO_CHAR(orderdate, 'Month') AS "Month", COUNT(ordernumber) AS "Total Orders"
FROM orders
WHERE DATE_PART('year', orderdate) = 2004
GROUP BY TO_CHAR(orderdate, 'Month')
ORDER BY 2 DESC LIMIT 1;

-- 12) List the firstname, lastname of employees who are Sales Reps who have no assigned customers.  (2)
SELECT e.firstname, e.lastname, COUNT(c.customernumber) AS "Qt Customers"
FROM employees e
LEFT JOIN customers c
ON e.employeenumber=c.salesrepemployeenumber
WHERE e.jobtitle='Sales Rep'
GROUP BY e.firstname, e.lastname
HAVING COUNT(c.customernumber) = 0;

-- 13) List the customername of customers from Switzerland with no orders. (2)
SELECT c.customername, COUNT(o.ordernumber) AS "Orders"
FROM customers c
LEFT JOIN orders o
ON c.customernumber=o.customernumber
WHERE c.country='Switzerland'
GROUP BY c.customername
HAVING COUNT(o.ordernumber)=0;

-- 14) List the customername and total quantity of products ordered for customers who have ordered more than 1650 products across all their orders.  (8)
SELECT c.customername, SUM(od.quantityordered) AS "Qt products"
FROM customers c
JOIN orders o
ON c.customernumber=o.customernumber
JOIN orderdetails od
ON o.ordernumber=od.ordernumber
GROUP BY c.customername
HAVING SUM(od.quantityordered) > 1650;




/* Query DML/DDL Problems Using the Classic Models database */

-- 1) Create a NEW table named “TopCustomers” with three columns: CustomerNumber (integer), ContactDate (DATE) and  OrderTotal (a real number.)  None of these columns can be NULL.
CREATE TABLE TopCustomers (
		customernumber INT NOT NULL,
		contactdate DATE NOT NULL,
		ordertotal REAL NOT NULL
	);

-- 2) Populate the new table “TopCustomers” with the CustomerNumber, today’s date, and the total value of all their orders (PriceEach * quantityOrdered) for those customers whose order total value is greater than $140,000. (should insert 10 rows )
INSERT INTO topcustomers (customernumber, contactdate, ordertotal)
		(SELECT c.customernumber, CURRENT_DATE, SUM(od.priceeach*od.quantityordered)
		 FROM customers c
		 JOIN orders o
		 ON c.customernumber=o.customernumber
		 JOIN orderdetails od
		 ON o.ordernumber=od.ordernumber
		 GROUP BY c.customernumber, CURRENT_DATE
		 HAVING SUM(od.priceeach*od.quantityordered) > 140000);

-- 3) List the contents of the TopCustomers table in descending OrderTotal sequence. (10)
SELECT *
FROM topcustomers
ORDER BY ordertotal DESC;

-- 4) Add a new column to the TopCustomers table called OrderCount (integer)
ALTER TABLE topcustomers
ADD COLUMN ordercount INT;

-- 5) Update the Top Customers table, setting the OrderCount to a random number between 1 and 10.  Hint:  use (RANDOM() *10)
UPDATE topcustomers
SET ordercount=(RANDOM()*10);

-- 6) List the contents of the TopCustomers table in descending OrderCount sequence. (10 rows)
SELECT * 
FROM topcustomers
ORDER BY ordercount DESC;

-- 7) Drop the TopCustomers table. (no answer set)
DROP TABLE topcustomers;