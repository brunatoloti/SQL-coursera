-- 1) Create a "TopCustomers" view using the following SELECT statement to populate the view.
/* SELECT companyname, sum(unitprice * quantity) as "Total Sales"
    FROM customers C
    JOIN orders O ON C.customerid  =  O.customerid 
    JOIN orderdetails D ON O.orderid  =  D.orderid
    GROUP BY companyname
    Order By 2 desc LIMIT 5; */

CREATE VIEW TopCustomers AS
    SELECT companyname, sum(unitprice*quantity) as "Total Sales"
    FROM customers C
    JOIN orders O ON C.customerid = O.customerid 
    JOIN orderdetails D ON O.orderid = D.orderid
    GROUP BY companyname
    Order By 2 desc LIMIT 5;