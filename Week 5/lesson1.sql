-- 1) Create an "items" tables with the following schema
CREATE TABLE items (
    itemid INT PRIMARY KEY,
    itemcode VARCHAR(5) NULL,
    itemname VARCHAR(40) NOT NULL DEFAULT '',
    quantity INT NOT NULL DEFAULT 0,
    price DECIMAL(9, 2) NOT NULL DEFAULT 0
);

-- 2) Populate your new table with data from the Products table
INSERT INTO items (itemid, itemcode, itemname, quantity, price)
    SELECT productid, CONCAT(supplierid, categoryid, discontinued),
           productname, unitsinstock, unitprice)
    FROM products;