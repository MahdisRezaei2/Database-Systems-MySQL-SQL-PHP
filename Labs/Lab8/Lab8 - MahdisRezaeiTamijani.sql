


/*1. Display the TID, CustomerName, and TDate of sales transactions that a customer bought a product whose ProductName is Dura Boot. (This query is from Lab6 that you did it by Cartesian Product and we want to re-write it using INNER JOIN (or simply JOIN). We must get the same result as lab6-query1 even though we write the query using INNER JOIN)*/

SELECT st.TID, cu.CustomerName, st.TDate
FROM salestransaction st
JOIN Customer cu ON st.CustomerID = cu.CustomerID
JOIN SoldVia sv ON st.TID = sv.TID
JOIN Product pr ON sv.ProductID = pr.ProductID
WHERE pr.ProductName = 'Dura Boot';

/* --------------------------------------------------------------------------------------------------
2. Re-Write Query 1 using NATURAL JOIN. (Make sure you get the same result as query 1)----------------------------------------------------------------------------------------------------*/

SELECT st.TID, cu.CustomerName, st.TDate
FROM SalesTransaction st
NATURAL JOIN Customer cu
NATURAL JOIN SoldVia sv
NATURAL JOIN Product pr
WHERE pr.ProductName = 'Dura Boot';
/* --------------------------------------------------------------------------------------------------
3.  Re-Write Query 1 using CROSS JOIN. (Make sure you get the same result as query 1) 
----------------------------------------------------------------------------------------------------*/
SELECT st.TID, cu.CustomerName, st.TDate
FROM SalesTransaction st
CROSS JOIN Customer cu
CROSS JOIN SoldVia sv
CROSS JOIN Product pr
WHERE st.CustomerID = cu.CustomerID
AND st.TID = sv.TID
AND sv.ProductID = pr.ProductID
AND pr.ProductName = 'Dura Boot';

/* --------------------------------------------------------------------------------------------------
4. Display all Region Names and StoreIDs in each region. If there is a region where there is no store in it, we still want to see the name of that region on the result (Count how many rows are displayed as a result of this query (17?) and make sure you see that there are 3 regions where there is no store in them (StoreID in the second column of the result is null )) Hint: use LEFT JOIN
----------------------------------------------------------------------------------------------------*/
SELECT rg.RegionName, sr.StoreID
FROM Region rg
LEFT JOIN Store sr ON rg.RegionID = sr.RegionID
ORDER BY rg.RegionName;

/* --------------------------------------------------------------------------------------------------
5. Re-write query 4 such that the query result displays only regions where there are stores in it. (Count how many rows are displayed as a result of this query (17-3=14?) and make sure you Do NOT see those 3 regions where there is no store in them. Hint: use INNER JOIN
----------------------------------------------------------------------------------------------------*/
SELECT rg.RegionName, sr.StoreID
FROM Region rg
INNER JOIN Store sr ON rg.RegionID = sr.RegionID
ORDER BY rg.RegionName;
/* --------------------------------------------------------------------------------------------------
6. Re-Write query 5 using RIGHT JOIN. Do you get the same result as query 5? Why? 
----------------------------------------------------------------------------------------------------*/
SELECT rg.RegionName, sr.StoreID
FROM Store sr
RIGHT JOIN Region rg ON sr.RegionID = rg.RegionID
ORDER BY rg.RegionName;

/*We get the same results because every item in store has overlap with every item in region. If there was a store without a region it would show up in this one but not in the inner join or left join. */

/* --------------------------------------------------------------------------------------------------
7. Display ProductID and ProductName of all products that were not sold. (Hint: You must join Product and SoldVia tables and find the products that their TID is NULL (You must find what type of JOIN must be used in this case. You must see 3 products that were not sold) )
----------------------------------------------------------------------------------------------------*/
SELECT pr.ProductID, pr.ProductName
FROM Product pr
LEFT JOIN SoldVia sv ON pr.ProductID = sv.ProductID 
WHERE sv.TID IS NULL;

/* --------------------------------------------------------------------------------------------------
8. This query is on HAFH database. Display CCID and CCName of all CorpClients and AptNo and BuildingID of All apartments. We are interested to see all CorpClients even though they did not lease any apartment and also we are interested to see all apartments even though no body leased them. Hint: use FULL JOIN (Make sure you see many null values in the result because B1 and B2 were not leased by any CorpClient and C888 and C333 never rented any apartment)
----------------------------------------------------------------------------------------------------*/
/* MYSQL doesn't support FULL JOIN, so i need to use LEFT and RIGHT join together*/
SELECT cc.CCID, cc.CCName, ap.AptNo, ap.BuildingID
FROM CorpClient cc
LEFT JOIN Apartment ap ON cc.CCID = ap.CCID
UNION 
SELECT cc.CCID, cc.CCName, ap.AptNo, ap.BuildingID
FROM CorpClient cc
RIGHT JOIN Apartment ap ON cc.CCID = ap.CCID
WHERE cc.CCID IS NULL;


