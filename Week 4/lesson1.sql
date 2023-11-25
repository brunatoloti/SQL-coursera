-- 1) List each order and its Total Value (unitprice * quantity) for all orders shipping into France in descending Total Value order.
SELECT o.orderid, SUM(unitprice*quantity) AS "Total Value"
FROM orders o 
JOIN orderdetails od 
    ON o.orderid=od.orderid
WHERE o.shipcountry='France'
GROUP BY o.orderid
ORDER BY 2 DESC;

-- 2) Create a Suppliers List showing Supplier CompanyName, and names of all the products sold by each supplier located in Japan.
SELECT s.companyname, p.productname
FROM suppliers s 
JOIN products p 
    ON s.supplierid=p.supplierid
WHERE s.country='Japan';

-- 3) Create a “Low Performers” list showing the employees who have less than $100,000 in total sales. List the employee’s LastName, FirstName followed by their total sales volume (the total dollar value of their orders.)
SELECT e.firstname, e.lastname, SUM(unitprice*quantity) AS "Total Sales"
FROM employees e 
JOIN orders o 
    ON e.employeeid=o.employeeid
JOIN orderdetails od 
    ON o.orderid=od.orderid
GROUP BY e.firstname, e.lastname
HAVING SUM(unitprice*quantity) < 100000;