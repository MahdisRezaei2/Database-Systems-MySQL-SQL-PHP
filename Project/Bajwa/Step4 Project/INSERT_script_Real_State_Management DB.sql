 
 -- These insert statements have added to MSSQL and run fine
 -- Inserting values into the People table
-- 
-- Group 1
-- Members: Mahdis Rezaei Tamijani, MySQL Expert
--          Gurjyot Singh Bajwa, MS SQL Expert
-- --------------------------------------

USE Real_State_Management ;
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (76, 'Seller', '123456789', 'Mahdis', 'Rezaei', 'Main Street', 2004, 'BC', 'Vancouver');
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (25, 'Buyer', '123456669', 'Ricardo', 'Smith', 'Burrard Street', 2006, 'BC', 'Vancouver');
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (15, 'Renter', '123444444', 'Allen', 'Smith', 'some Street', 1006, 'BC', 'Vancouver');
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (72, 'Buyer', '987654321', 'Sarah', 'Johnson', 'Oak Avenue', NULL, 'CA', 'Los Angeles');




-- Inserting values into the People table 
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (4, 'Buyer', '111222333', 'Emma', 'Johnson', 'Main Street', 1002, 'NY', 'New York');

INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (5, 'Seller', '444555666', 'David', 'Brown', 'Maple Avenue', 210, 'CA', 'Los Angeles');

INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (6, 'Renter', '777888999', 'Sophia', 'Davis', 'Oak Street', 405, 'IL', 'Chicago');

-- Inserting values into the Banks table
INSERT INTO Banks (Bank_ID, Bank_Name, Amount_of_Mortgage)
VALUES (5, 'RBC Bank', 1000000.00);
INSERT INTO Banks (Bank_ID, Bank_Name, Amount_of_Mortgage)
VALUES (6, 'ABC Bank', 800000.00);

INSERT INTO Banks (Bank_ID, Bank_Name, Amount_of_Mortgage)
VALUES (7, 'XYZ Bank', 1200000.00);

INSERT INTO Banks (Bank_ID, Bank_Name, Amount_of_Mortgage)
VALUES (8, 'MNO Bank', 950000.00);


-- Inserting values into the Purchase_Contract table
INSERT INTO Purchase_Contract (Purchase_Contract_ID)
VALUES (12);

-- Inserting values into the Bank_ParticipatesIn_PurchaseContract table
INSERT INTO Bank_ParticipatesIn_PurchaseContract (Bank_ID, Purchase_Contract_ID)
VALUES (5, 12);

-- Inserting values into the Seller table
INSERT INTO Seller (SellerID)
VALUES (1);

-- Inserting values into the Seller_ParticipatesIn_PurchaseContract table
INSERT INTO Seller_ParticipatesIn_PurchaseContract (Purchase_Contract_ID, SellerID)
VALUES (12, 1);

-- Inserting values into the Buyer table
INSERT INTO Buyer (BuyerID)
VALUES (2);

-- Inserting values into the Buyer_ParticipatesIn_PurchaseContract table
INSERT INTO Buyer_ParticipatesIn_PurchaseContract (Purchase_Contract_ID, BuyerID)
VALUES (12, 2);

-- Inserting values into the Renter table
INSERT INTO Renter (RenterID)
VALUES (3);

-- Inserting values into the Renter_Dependent table
INSERT INTO Renter_Dependent (RenterID, DependentID)
VALUES (3, 13);

-- Inserting values into the Rental_Contract table
INSERT INTO Rental_Contract (Rental_Contract_ID, MonthlyRent, End_Date_Rent, Start_Date_Rent, RenterID)
VALUES (16, 1500.00, '2023-07-01', '2023-08-01', 3);

-- Inserting values into the Realtor table
INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (14, '987654321', 'Jane', 'Smith', '123456', 5, 'jane@example.com', 'APP123', 'New York', 'Broadway', '12345', 'NY');
INSERT INTO Realtor (RealtorID, FirstName, LastName, PhoneNumber)
VALUES (15, 'John', 'Smith', '987654321');

INSERT INTO Realtor (RealtorID, FirstName, LastName, PhoneNumber)
VALUES (16, 'Alice', 'Johnson', '123456789');

INSERT INTO Realtor (RealtorID, FirstName, LastName, PhoneNumber)
VALUES (17, 'Michael', 'Williams', '555888777');

INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (20, '7777777777', 'Gurjyot', 'Bajwa', '654321', 8, 'gurjyot@example.com', 'APP4321', 'Vancouver', 'Broadway', '12365', 'BC');

INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (4, '6666666666', 'James', 'Bond', '987654', 15, 'james@example.com', 'APP6789', 'Surrey', 'Highway 15', '67890', 'BC');

-- Inserting values into the Buyer_Realtor_ParticipationIn_PurchaseContract table
INSERT INTO Buyer_Realtor_ParticipationIn_PurchaseContract (Purchase_Contract_ID, RealtorID)
VALUES (12, 14);

-- Inserting values into the Seller_Realtor_ParticipationIn_PurchaseContract table
INSERT INTO Seller_Realtor_ParticipationIn_PurchaseContract (Purchase_Contract_ID, RealtorID)
VALUES (12, 14);

-- Inserting values into the Properties table
INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City, Street, App_Number, PostalCode, Province)
VALUES (17, '2023-06-01', 'Single Ownership', 500000.00, 'Beautiful Detached house with a garden', 'Vancouver', 'londsdale street', 'Apt 1', '90001', 'CA');
INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City)
VALUES (18, '2023-07-15', 'Single Ownership', 450000.00, 'Cozy apartment in the downtown area', 'New York');

INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City)
VALUES (19, '2023-07-16', 'Condo Ownership', 650000.00, 'Luxurious condo with great views', 'Los Angeles');

INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City)
VALUES (20, '2023-07-17', 'Single Ownership', 380000.00, 'Charming Detached house with a spacious backyard', 'Chicago');

-- Inserting values into the DetachedHouse Table
INSERT INTO DetachedHouse (PropertyID, YardSize)
VALUES (17, 700);

INSERT INTO DetachedHouse (PropertyID, YardSize)
VALUES (20, 800);


-- Inserting values into the Properties_beingRented_by_RentalContract table
INSERT INTO Properties_beingRented_by_RentalContract (Rental_Contract_ID, PropertyID)
VALUES (16, 17);







