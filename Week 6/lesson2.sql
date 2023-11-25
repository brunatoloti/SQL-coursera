/* Let’s drop and recreate your view from Lab 11, adding a CASE expression. Add a third column to your view called “Assessment”.
    - Set the Assessment column equal to “Needs Focus” if the customer’s total sales is less than $60,000
    - Set the Assessment column equal to “Average” if the customer’s total sales is greater than or equal to $60,000 but less than $115,000.
    - Otherwise set the Assessment column equal to “Outstanding” if the customer’s total sales is greater than or equal to $115,000.
*/

DROP VIEW TopCustomers;

CREATE VIEW TopCustomers AS
    SELECT companyname, SUM(unitprice*quantity) as "Total Sales"
        CASE
            WHEN SUM(unitprice*quantity) < 60000 THEN 'Needs Focus'
            WHEN SUM(unitprice*quantity) < 115000 THEN 'Average'
            ELSE 'Outstanding'
        END Assessment
    FROM customers C
    JOIN orders O ON C.customerid = O.customerid 
    JOIN orderdetails D ON O.orderid = D.orderid
    GROUP BY companyname
    Order By 2 desc LIMIT 5;