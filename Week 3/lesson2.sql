-- 1) List the productid, productname, unitprice of the lowest priced product Northwinds sells.
SELECT productid, productname, unitprice
FROM products
WHERE unitprice = (SELECT MIN(unitprice)
                   FROM products);

-- 2) How many orders in the orders table have a bad customerID (either missing or not on file in the customers table.)
SELECT COUNT(*)
FROM orders
WHERE customerid NOT IN (SELECT customerid
                         FROM customers);

-- 3) Use a subquery in a SELECT to list something interesting.
SELECT productname, (SELECT ROUND(AVG(quantity), 0)
                     FROM orderdetails
                     WHERE orderdetails.productid=products.productid) AS "Media qtd"
FROM products;

-- 4) Use a subquery in a FROM to list something interesting.
SELECT orderid,
FROM (SELECT orderid, SUM(unitprice)
      FROM orderdetails
      GROUP BY orderid
      HAVING SUM(unitprice) > 50) AS price;