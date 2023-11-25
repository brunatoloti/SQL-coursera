-- 1) List the customerid, companyname, and country for all customers NOT in the U.S.A.
SELECT customerid, companyname, country
FROM customers
WHERE country <> 'USA';

-- 2) For all products in the Northwinds database, list the productname, unitprice, unitsinstock, and the total value of the inventory of that product as “Total Value” for all products with a Total Value greater than $1000. (HINT: total value = unitsinstock * unitprice)
SELECT productname, unitprice, unitsinstock
       unitsinstock*unitprice AS "Total Value"
FROM products
WHERE unitsinstock*unitprice > 1000;

--3) List the productid, productname, and quantityperunit for all products that come in bottles.
SELECT productid, productname, quantityperunit
FROM products
WHERE quantityperunit like '%bottles';

-- 4) List the productid, productname, and unitprice for all products whose categoryid is an ODD number. (HINT: categoryid is a one digit integer less than 9 …)
SELECT productid, productname, unitprice, categoryid
FROM products
WHERE category % 2 <> 0;

-- 5) List the orderid, customerid, and shippeddate for orders that shipped to Canada in December 1996 through the end of January 1997.
SELECT orderid, customerid, shippeddate
FROM orders
WHERE shippeddate BETWEEN '1996-12-01' AND '1997-01-31';