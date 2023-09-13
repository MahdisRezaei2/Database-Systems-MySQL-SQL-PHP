-- Everything works well from MYSQL

USE Real_State_Management;

-- Inserting values into the Properties table
INSERT INTO Properties (PropertyID, ListedSince, Ownership, Price, Description, City, Street, App_Number, PostalCode, Province)
VALUES (1, '2023-06-01', 'Single Ownership', 500000.00, 'Beautiful house with a garden', 'Vancouver', 'londsdale street', 'Apt 1', '90001', 'CA');

-- Insert values into Properties_Photos
INSERT INTO Properties_Photos (PropertyID, Photos)
VALUES (1, 'photo1.jpg'),
       (1, 'photo2.jpg'),
       (2, 'photo3.jpg');

-- Insert values into Recreation
INSERT INTO Recreation (PropertyID, Facilities)
VALUES (1, 'Swimming pool'),
       (2, 'Tennis court');

-- Insert values into Condo
INSERT INTO Condo (PropertyID, CondoFee)
VALUES (1, 200),
       (2, 300);

-- Insert values into Land
INSERT INTO Land (PropertyID, Area)
VALUES (1, 1000),
       (2, 2000);

-- Insert values into DetachedHouse
INSERT INTO DetachedHouse (PropertyID, YardSize)
VALUES (1, 500),
       (2, 800);

-- Insert values into Parking
INSERT INTO Parking (PropertyID, ParkingType)
VALUES (1, 'Garage'),
       (2, 'Driveway');

-- Insert values into Agriculture
INSERT INTO Agriculture (PropertyID, CropType)
VALUES (1, 'Corn'),
       (2, 'Wheat');

-- Insert values into Realtor
INSERT INTO Realtor (RealtorID, PhoneNumber, FirstName, LastName, LicenseNumber, Years_of_Experience, Email_Address, App_Number, City, Street, PostalCode, Province)
VALUES (1, '555-1234', 'John', 'Doe', 'ABC123', 5, 'john.doe@example.com', '', 'New York', 'Main Street', '12345', 'NY'),
       (2, '555-5678', 'Jane', 'Smith', 'DEF456', 3, 'jane.smith@example.com', '', 'Los Angeles', 'Oak Avenue', '67890', 'CA');

-- Insert values into Realty_Company
INSERT INTO Realty_Company (RealtyCompanyID, Name, PhoneNumber, App_Number, City, Street, PostalCode, Province)
VALUES (1, 'ABC Realty', '555-9876', '', 'New York', 'Broadway', '54321', 'NY'),
       (2, 'XYZ Realty', '555-5432', '', 'Los Angeles', 'Sunset Boulevard', '09876', 'CA');

-- Insert values into Realtor_WorksFor_Realty_Company
INSERT INTO Realtor_WorksFor_Realty_Company (RealtorID, RealtyCompanyID)
VALUES (1, 1),
       (2, 2);
-- Inserting values into the People table
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (1, 'Seller', '123456789', 'Mahdis', 'Rezaei', 'Main Street', 2004, 'BC', 'Vancouver');
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (2, 'Buyer', '123456669', 'Ricardo', 'Smith', 'Burrard Street', 2006, 'BC', 'Vancouver');
INSERT INTO People (Person_ID, Occupation, Phone_Number, First_Name, Last_Name, Street, Apartment_Number, Province, City)
VALUES (3, 'Renter', '123444444', 'Allen', 'Smith', 'some Street', 1006, 'BC', 'Vancouver');

-- Inserting values into the Banks table
INSERT INTO Banks (Bank_ID, Bank_Name, Amount_of_Mortgage)
VALUES (5, 'RBC Bank', 1000000.00);
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

-- Everything works well in both MYSQL and MSSQL 

-- Inserting values into the Renter_Dependent table
INSERT INTO Renter_Dependent (RenterID, DependentID)
VALUES (3, 13);

-- Inserting values into the Rental_Contract table
INSERT INTO Rental_Contract (Rental_Contract_ID, MonthlyRent, End_Date_Rent, Start_Date_Rent, RenterID)
VALUES (16, 1500.00, '2023-07-01', '2023-08-01', 3);

-- Inserting values into the Buyer_Realtor_ParticipationIn_PurchaseContract table
INSERT INTO Buyer_Realtor_ParticipationIn_PurchaseContract (Purchase_Contract_ID, RealtorID)
VALUES (12, 14);

-- Inserting values into the Seller_Realtor_ParticipationIn_PurchaseContract table
INSERT INTO Seller_Realtor_ParticipationIn_PurchaseContract (Purchase_Contract_ID, RealtorID)
VALUES (12, 14);

-- Inserting values into the Properties_beingRented_by_RentalContract table
INSERT INTO Properties_beingRented_by_RentalContract (Rental_Contract_ID, PropertyID)
VALUES (16, 17);