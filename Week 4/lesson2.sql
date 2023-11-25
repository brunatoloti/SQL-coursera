-- 1) Are there any Northwinds employees that have no orders?
SELECT firstname, lastname, e.employeeid, COUNT(DISTINCT o.orderid)
FROM employees e 
LEFT OUTER JOIN orders o 
    ON e.employeeid=o.employeeid
GROUP BY firstname, lastname, e.employeeid
HAVING COUNT(DISTINCT o.orderid)=0;

-- 2) Are there any Northwinds customers that have no orders?
SELECT companyname, c.customerid, COUNT(DISTINCT o.orderid)
FROM customers c 
LEFT OUTER JOIN orders o 
    ON c.customerid=o.customerid
GROUP BY companyname, c.customerid
HAVING COUNT(DISTINCT o.orderid)=0;

-- 3) Are there any Northwinds orders that have bad (not on file) customer numbers?
SELECT DISTINCT c.customerid, COUNT(DISTINCT o.orderid)
FROM orders o 
LEFT OUTER JOIN customers c 
    ON o.customerid=c.customerid
WHERE c.customerid IS NULL
GROUP BY c.customerid;

--4) Are there any Shippers that have shipped no Northwinds orders?
SELECT s.shipperid, s.companyname, COUNT(DISTINCT o.orderid)
FROM shippers s 
LEFT OUTER JOIN orders o 
    ON s.shipperid=o.shipvia
GROUP BY s.shipperid, s.companyname;