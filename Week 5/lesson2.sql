-- 1) Change the name of the ‘items’ table to ‘demo’
ALTER TABLE items
RENAME TO demo;

-- 2) Change the name of the ‘itemcode’ column to ‘itemclass’
ALTER TABLE demo
RENAME COLUMN itemcode TO itemclass;

--3) Add a new column ‘iteminfo’ to your ‘demo’ table
ALTER TABLE demo
ADD COLUMN iteminfo VARCHAR(5) NULL;

--4) Add some data to your new column, copying the values from the itemclass column
UPDATE demo
SET iteminfo=itemclass;