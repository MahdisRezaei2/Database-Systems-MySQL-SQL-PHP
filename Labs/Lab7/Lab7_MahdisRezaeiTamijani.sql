/*
Advanced SQL Assignment (Lab7)
Student Name: Mahdis Rezaei Tamijani
Student Id: 100381114

Apex Workspace:
Apex Username:
Apex Password:



Instructions: write the SQL query for each question below it, uncommented.

Example: 
Ex.1. Select all customers.
----------------------------------------------------------------------------------------------------*/
SELECT * FROM Customers;


/* --------------------------------------------------------------------------------------------------
1. Display the TID, CustomerName, and TDate for sales transactions 
    involving a customer buying a product whose ProductName is Dura Boot. 
----------------------------------------------------------------------------------------------------*/
SELECT st.TID, cu.CustomerName, st.TDate
FROM salestransaction st
JOIN Customer cu ON st.CustomerID = cu.CustomerID
JOIN SoldVia sv ON st.TID = sv.TID
JOIN Product pr ON sv.ProductID = pr.ProductID
WHERE pr.ProductName = 'Dura Boot';

/* --------------------------------------------------------------------------------------------------
2. Display the ProductID and ProductName of the cheapest product. 
----------------------------------------------------------------------------------------------------*/
SELECT ProductID, ProductName
FROM Product
WHERE ProductPrice = (SELECT MIN(ProductPrice) FROM Product );

/* --------------------------------------------------------------------------------------------------
3. Display the ProductID, ProductName, and VendorName for products 
    whose price is below the average price of all products. 
----------------------------------------------------------------------------------------------------*/
SELECT p.ProductID, p.ProductName, v.VendorName
FROM Product p 
JOIN Vendor v ON p.VendorID = v.VendorID
WHERE p.ProductPrice < ( SELECT AVG(ProductPrice) FROM Product);

/* --------------------------------------------------------------------------------------------------
4. Display the CustomerName and the average of product price for each customer. 
----------------------------------------------------------------------------------------------------*/
SELECT cu.CustomerName, AVG(p.ProductPrice) AS AverageProductPrice
FROM Customer cu 
JOIN SalesTransaction st ON  cu.CustomerID = st.CustomerID
JOIN Soldvia sv ON st.TID = sv.TID
JOIN Product p ON sv.ProductID = p.ProductID
GROUP BY cu.CustomerName;

/* --------------------------------------------------------------------------------------------------
5. Display the CustomerName who purchased products having price greater 
    than the average of each customer purchase.
----------------------------------------------------------------------------------------------------*/
SELECT cu.CustomerName
FROM Customer cu
JOIN SalesTransaction st ON cu.CustomerID = st.CustomerID
JOIN SoldVia sv ON st.TID = sv.TID
JOIN Product p ON sv.ProductID = p.ProductID
GROUP BY cu.CustomerID, cu.CustomerName
HAVING MAX(p.ProductPrice) >  AVG(p.ProductPrice);

/* --------------------------------------------------------------------------------------------------
6. Display the ProductID for the product that has been sold the most 
    (i.e., that has been sold in the highest quantity). 
----------------------------------------------------------------------------------------------------*/


/* --------------------------------------------------------------------------------------------------
7. Display the RegionID, RegionName, and number of stores in the region for all regions. 
    Sort the results by number of stores from greatest to least. 
----------------------------------------------------------------------------------------------------*/
SELECT re.RegionID, re.RegionName, COUNT(sr.StoreId) AS NumberOfStores
FROM Region re
LEFT JOIN Store sr ON re.RegionID = sr.RegionID
GROUP BY re.RegionID, re.RegionName
ORDER BY NumberOfStores DESC;

-- Create 2 views 

CREATE VIEW Products_more_than_3_sold AS
SELECT ProductId, ProductName, ProductPrice
FROM Product
WHERE ProductId IN (SELECT ProductId
FROM Soldvia
GROUP BY ProductId
HAVING SUM(noofitems) > 3
);
CREATE VIEW Products_in_multiple_trnsc AS
SELECT ProductId, ProductName, ProductPrice
FROM Product
WHERE ProductId IN (SELECT Productid
FROM SoldVia
GROUP BY ProductId
HAVING COUNT(*) > 1
);
/* --------------------------------------------------------------------------------------------------
8. Retrieve the product ID, product name, and product price for each product that has 
    more than three items sold within all sales transactions or whose items were sold 
    in more than one sales transaction (Hint: UNION)
----------------------------------------------------------------------------------------------------*/
SELECT ProductId, ProductName, ProductPrice
FROM Products_more_than_3_sold 
UNION
SELECT ProductId, ProductName, ProductPrice
FROM Products_in_multiple_trnsc;

/* --------------------------------------------------------------------------------------------------
9. Retrieve the product ID, product name, and product price for each product that has 
    more than three items sold within all sales transactions and whose items were sold 
    in more than one sales transaction. (Hint: INTERSECTS)
----------------------------------------------------------------------------------------------------*/
-- INTERSECTS is not supported by MYSQL
SELECT p1.ProductId, p1.ProductName, p1.ProductPrice
FROM Products_more_than_3_sold P1
JOIN Products_in_multiple_trnsc P2 ON p1.ProductId = p2.ProductId;

/* --------------------------------------------------------------------------------------------------
10. Retrieve the product ID, product name, and product price for each product that has 
    more than three items sold within all sales transactions but whose items 
    were not sold in more than one sales transaction. (Hint: MINUS)
----------------------------------------------------------------------------------------------------*/
-- MYSQL doesn't have built-in MINUS operator 
SELECT p1.ProductId, p1.ProductName, p1.ProductPrice
FROM Products_more_than_3_sold P1
LEFT JOIN Products_in_multiple_trnsc P2 ON p1.ProductId = p2.ProductId
WHERE p2.ProductId IS NULL;

/* --------------------------------------------------------------------------------------------------
11. Update the manager table so that table look like below:
-----------------------------------------------------------------------------------------------------
|   MANAGERID   |   MFNAME  |   MLNAME  |   MBDATE      |   MSALARY |   MBONUS  |   MRESBUILDINGID  |
|---------------|-----------|-----------|---------------|-----------|-----------|-------------------|
|   M12         |   Boris   |   Grant   |   01/04/1980  |   60000   |   -       |   B1              |
|   M23         |   Austin  |   Lee     |   02/05/1975  |   50000   |   5000    |   B2              |
|   M34         |   George  |   Sherman |   12/06/1978  |   52000   |   2000    |   B4              |
-----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------*/
UPDATE Manager 
SET mfname = 'Boris', mlname = 'Grant', mbdate ='1980-04-01', msalary= 60000, mbonus= NULL, mresbuildingid = 'B1'
WHERE managerid = 'M12';

UPDATE Manager 
SET mfname = 'Austin', mlname = 'Lee', mbdate ='1975-05-02', msalary= 50000, mbonus= 5000, mresbuildingid = 'B2'
WHERE managerid = 'M23';

UPDATE Manager 
SET mfname = 'George', mlname = 'Sherman', mbdate ='1978-06-12', msalary= 52000, mbonus= 2000, mresbuildingid = 'B4'
WHERE managerid = 'M34';

/* --------------------------------------------------------------------------------------------------
12. Display the MFName, MLName, MSalary, MBDate, and number of buildings that the 
    manager manages for all managers with a salary less than $55,000.
----------------------------------------------------------------------------------------------------*/
 SELECT mg.mfname, mg.mlname, mg.msalary, mg.mbdate, COUNT(bg.buildingid) AS NumOfBuildings
 FROM Manager mg
 LEFT JOIN Building bg ON mg.managerid = bg.bmanagerid
 WHERE mg.msalary < 55000
 GROUP BY mg.managerid, mg.mfname, mg.mlname, mg.msalary, mg.mbdate;

/* --------------------------------------------------------------------------------------------------
13. Display the BuildingID and AptNo, for all apartments leased by the corporate client WindyCT.
----------------------------------------------------------------------------------------------------*/
SELECT ap.buildingid, ap.aptno
FROM Apartment ap
JOIN CorpClient cc ON ap.ccid = cc.ccid
WHERE cc.ccname = 'WindyCT';

/* --------------------------------------------------------------------------------------------------
14. Display the SMemberID and SMemberName of staff members cleaning apartments 
    rented by corporate clients whose corporate location is Chicago. Do not 
    display the same information more than once.
----------------------------------------------------------------------------------------------------*/
SELECT DISTINCT sm.smemberid, smembername
FROM Cleaning cg
JOIN Apartment ap ON cg.buildingid = ap.buildingid AND cg.aptno = ap.aptno
JOIN CorpClient cc ON ap.ccid = cc.ccid
JOIN StaffMember sm ON cg.smemberid = sm.smemberid
WHERE cc.cclocation ='Chicago';

/* --------------------------------------------------------------------------------------------------
15. Display the CCName of the client and the CCName of the client who referred it, 
    for every client referred by a client in the music industry.
----------------------------------------------------------------------------------------------------*/
SELECT cc1.ccname AS ReferredClient, cc2.ccname AS ReferringClient
FROM CorpClient cc1
JOIN CorpClient cc2 ON cc1.ccidreferredby = cc2.ccid
WHERE cc2.ccindustry = 'Music';

/* --------------------------------------------------------------------------------------------------
16. Display the BuildingID, AptNo, and ANoOfBedrooms for all apartments that are not leased.
----------------------------------------------------------------------------------------------------*/
SELECT buildingid, aptno, anoofbedrooms
FROM Apartment
WHERE ccid IS NULL;
