
-- 
-- Group 1
-- Members: Mahdis Rezaei Tamijani, MySQL Expert
--          Gurjyot Singh Bajwa, MS SQL Expert
-- --------------------------------------

USE G1_Real_State_Management_DB; 
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (71, 'Seller', '123456789', 'Mahdis', 'Rezaei', 'Main Street', 2004, 'BC', 'Vancouver');
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (22, 'Buyer', '123456669', 'Ricardo', 'Smith', 'Burrard Street', 2006, 'BC', 'Vancouver');
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (13, 'Renter', '123444444', 'Allen', 'Smith', 'some Street', 1006, 'BC', 'Vancouver');



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

-- Inserting values into the Buyer_Realtor_ParticipationIn_PurchaseContract table
INSERT INTO Buyer_Realtor_ParticipationIn_PurchaseContract (Purchase_Contract_ID, RealtorID)
VALUES (12, 14);

-- Inserting values into the Seller_Realtor_ParticipationIn_PurchaseContract table
INSERT INTO Seller_Realtor_ParticipationIn_PurchaseContract (Purchase_Contract_ID, RealtorID)
VALUES (12, 14);

-- Inserting values into the Properties table
INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City, Street, App_Number, PostalCode, Province)
VALUES (17, '2023-06-01', 'Single Ownership', 500000.00, 'Beautiful house with a garden', 'Vancouver', 'londsdale street', 'Apt 1', '90001', 'CA');
INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City)
VALUES (18, '2023-07-15', 'Single Ownership', 450000.00, 'Cozy apartment in the downtown area', 'New York');

INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City)
VALUES (19, '2023-07-16', 'Condo Ownership', 650000.00, 'Luxurious condo with great views', 'Los Angeles');

INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City)
VALUES (20, '2023-07-17', 'Single Ownership', 380000.00, 'Charming house with a spacious backyard', 'Chicago');


-- Inserting values into the Properties_beingRented_by_RentalContract table
INSERT INTO Properties_beingRented_by_RentalContract (Rental_Contract_ID, PropertyID)
VALUES (16, 17);


INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (10, '+1234567890', 'John', 'Doe', 'ABC123', 8, 'john.doe@example.com', 'APP456', 'New York', 'Main St', '12345', 'NY');

INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (2, '+9876543210', 'Jane', 'Smith', 'XYZ789', 6, 'jane.smith@example.com', 'APP789', 'Los Angeles', 'Broadway Ave', '98765', 'CA');

INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (3, '+4445556666', 'Michael', 'Johnson', 'DEF456', 10, 'michael.johnson@example.com', 'APP123', 'Chicago', 'Park Ave', '67890', 'IL');

INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (4, '+1112223333', 'Emily', 'Williams', 'GHI789', 3, 'emily.williams@example.com', 'APP321', 'Houston', 'Oak St', '54321', 'TX');

INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (5, '+9998887777', 'William', 'Brown', 'JKL987', 7, 'william.brown@example.com', 'APP987', 'Miami', 'Palm Rd', '23456', 'FL');

-- Sample data for People table
INSERT INTO People (Person_ID, First_Name, Last_Name)
VALUES
(11, 'John', 'Doe'),
(24, 'Jane', 'Smith'),
(34, 'Michael', 'Johnson');

-- Sample data for Buyer table
INSERT INTO Buyer (BuyerID)
VALUES
(11),
(24),
(34);

-- Sample data for Buyer_ParticipatesIn_PurchaseContract table
INSERT INTO Buyer_ParticipatesIn_PurchaseContract (BuyerID, Purchase_Contract_ID)
VALUES
(11, 101),
(24, 102),
(34, 103);

-- Sample data for Purchase_Contract table
INSERT INTO Purchase_Contract (Purchase_Contract_ID)
VALUES
(101),
(102),
(103);
-- Sample data for seller table
INSERT INTO seller (SellerID)
VALUES
(201 ),
(202),
(203);

-- Sample data for Seller_ParticipatesIn_PurchaseContract table
INSERT INTO Seller_ParticipatesIn_PurchaseContract (Purchase_Contract_ID, SellerID)
VALUES
(101, 201),
(102, 202),
(103, 203);

-- Sample data for Properties table
INSERT INTO Properties (PropertyID, Description)
VALUES
(201, 'House A'),
(202, 'Apartment B'),
(203, 'Villa C');




