-- 
-- Group 1
-- Members: Mahdis Rezaei Tamijani, MySQL Expert
--          Gurjyot Singh Bajwa, MS SQL Expert
-- --------------------------------------

USE Real_State_Management ;

-- Q1 : retrieves properties that are currently being rented out based on the Properties_beingRented_by_RentalContract table
SELECT *
FROM Properties
WHERE PropertyID IN (
    SELECT PropertyID
    FROM Properties_beingRented_by_RentalContract
) AND PropertyID IS NOT NULL;


-- Q2 : retrieves the count of distinct RealtorIDs,their fist, last name and RealtorID, where the Years_of_Experience for each realtor is greater than 5
SELECT RealtorID, FirstName, LastName, COUNT(DISTINCT RealtorID) AS TotalUniqueRealtors
FROM Realtor
WHERE Years_of_Experience > 5
GROUP BY RealtorID, FirstName, LastName;


-- Q3 : retrieves the propertyID of properties that are invloved in a purchase contract with a bank	 and are getting mortgage
SELECT DISTINCT PropertyID
FROM Properties_beingRented_by_RentalContract
WHERE PropertyID IN (
    SELECT PropertyID
    FROM Bank_ParticipatesIn_PurchaseContract
);


-- Q4 : retrieves the minimum property price for each unique property description 
SELECT Description, MIN(Price) AS MinPropertyPrice
FROM Properties
GROUP BY Description;

-- Q5: retrieves the maximum property price among properties that are invloved in a rental contract 
SELECT MAX(Price) AS MaxPriceAmount
FROM Properties
WHERE PropertyID IN (
    SELECT PropertyID
    FROM Properties_beingRented_by_RentalContract
);

-- Q6: performs Delete operation on the Properties table 
DELETE FROM Properties
WHERE PropertyID NOT IN (
    SELECT PropertyID
    FROM Properties_beingRented_by_RentalContract
);

-- Q7: retreives PropertyID and Rental_Contract_ID from the properties table with their corresponding Rental_Contract_ID 
SELECT P.PropertyID, RC.Rental_Contract_ID
FROM Properties AS P
LEFT JOIN (
    SELECT PropertyID, Rental_Contract_ID
    FROM Properties_beingRented_by_RentalContract
) AS RC ON P.PropertyID = RC.PropertyID;

-- Q8: retrives Rental_Contract_ID with a monthly rent greater than 1000

SELECT RC.Rental_Contract_ID, P.PropertyID
FROM Rental_Contract AS RC
LEFT JOIN Properties_beingRented_by_RentalContract AS PRC ON RC.Rental_Contract_ID = PRC.Rental_Contract_ID
LEFT JOIN Properties AS P ON PRC.PropertyID = P.PropertyID
WHERE RC.MonthlyRent > 1000;



-- Q9: retreives all columns from Rentaal_contract and Properties table using natural join 
SELECT *
FROM Rental_Contract
NATURAL JOIN Properties;

-- Q10: deletes a specific row from the Properties_beingRented_by_RentalContract table where the PropertyID is equl to 20
DELETE FROM Properties_beingRented_by_RentalContract
WHERE PropertyID = 20;

-- Q11 : retrieves PropertyID, Ownership and Price  from properties table for the properties with price greater than 38000.00 and sort them in
-- descending 
SELECT PropertyID, Ownership, Price
FROM Properties
WHERE Price > 3800.00
ORDER BY Price DESC;

-- Q12 It Retrieve properties that are currently rented out and their rental contract details

SELECT p.PropertyID, p.Description, p.Price, rc.Rental_Contract_ID, rc.MonthlyRent, rc.Start_Date_Rent, rc.End_Date_Rent
FROM Properties p
INNER JOIN Properties_beingRented_by_RentalContract pr ON p.PropertyID = pr.PropertyID
INNER JOIN Rental_Contract rc ON pr.Rental_Contract_ID = rc.Rental_Contract_ID;

-- Q13  It Retrieve Average Rent paid by renters:

SELECT AVG(rc.MonthlyRent) AS AvgRent
FROM Rental_Contract rc;

-- Q14 It Retrieve the realtor(s) with the most participation in purchase contracts:

SELECT r.RealtorID, r.FirstName, r.LastName, COUNT(p.RealtorID) AS ContractCount
FROM Realtor r
LEFT JOIN Buyer_Realtor_ParticipationIn_PurchaseContract p ON r.RealtorID = p.RealtorID
GROUP BY r.RealtorID, r.FirstName, r.LastName
ORDER BY ContractCount DESC;

-- Q15 It retrieves all the Detached House with Yard size Greater than 600

SELECT PropertyID,YardSize
FROM DetachedHouse
WHERE YardSize > 600
ORDER BY YardSize DESC;

-- Q16 It Retrieve Average Price of Properties with there city name

SELECT City, AVG(Price) AS AveragePrice
FROM Properties
GROUP BY City;

-- Q17 It Create a view that shows all the property listings along with their realtor information and use it for easier retrieval:
CREATE VIEW Property_Listings AS
SELECT p.PropertyID, p.Description, p.Price, r.FirstName, r.LastName
FROM Properties p
LEFT JOIN Buyer_Realtor_ParticipationIn_PurchaseContract bp ON p.PropertyID = bp.Purchase_Contract_ID
LEFT JOIN Realtor r ON bp.RealtorID = r.RealtorID;

-- To view the data stored
SELECT * FROM Property_Listings;

-- Q18 Update property price with property ID :17

UPDATE Properties
SET Price = 600000
WHERE PropertyID = 17;

-- Q19 Calculate the total commission earned by each realtor (assuming 3% commission on each property sale):

SELECT r.RealtorID, r.FirstName, r.LastName, SUM(p.Price * 0.03) AS TotalCommissionEarned
FROM Realtor r
LEFT JOIN Buyer_Realtor_ParticipationIn_PurchaseContract brp ON r.RealtorID = brp.RealtorID
LEFT JOIN Properties p ON brp.Purchase_Contract_ID = p.PropertyID
GROUP BY r.RealtorID, r.FirstName, r.LastName;

-- Q20 It reterives only information regarding Buyers.

SELECT Person_ID, Phone_Number, First_Name, Last_Name 
FROM People
WHERE Occupation="Buyer";



