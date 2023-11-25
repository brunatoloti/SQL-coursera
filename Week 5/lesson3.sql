-- 1) - Insert a new row of data into your "demo" table using format # 1 of the INSERT. Include these values:
 -- VALUES
 --(101,'1234','Spicy Grillmate', 12, 1.99, '1234');
INSERT INTO demo (itemid, itemclass, itemname, quantity, price, iteminfo)
VALUES (101, '1234','Spicy Grillmate', 12, 1.99, '1234');

-- 2) - Insert a new row of data into your "demo" table using format # 2 of the INSERT. Include these values:
 -- VALUES
 -- (102,'6789','GlobalWarmer', 24, 42.99, '6789');
INSERT INTO demo 
VALUES (102, '6789','GlobalWarmer', 24, 42.99, '6789');

-- 3) Update the iteminfo column to ‘0000’ for rows where the itemid is greater than 100
UPDATE demo
SET iteminfo='0000'
WHERE itemid > 100;

-- 4) Delete the rows you just added to the “demo” table
DELETE FROM demo
WHERE itemid IN (101, 102);

-- 5) Drop the “demo” table
DROP TABLE demo;