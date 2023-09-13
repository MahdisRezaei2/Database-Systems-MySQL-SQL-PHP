-- Everything works well from MYSQL 
CREATE DATABASE Real_State_Management;
USE Real_State_Management ;

/* Table for Properties */
CREATE TABLE Properties (
  PropertyID INT PRIMARY KEY,
  ListedSince DATE,
  Ownership VARCHAR(50),
  Price DECIMAL(10, 2),
  Description VARCHAR(100),
  City VARCHAR(50),
  Street VARCHAR(50),
  App_Number VARCHAR(50),
  PostalCode VARCHAR(10),
  Province VARCHAR(50)
);

/* Table for Properties_Photos*/
CREATE TABLE Properties_Photos (
  PropertyID INT,
  Photos VARCHAR (10),
  FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

/* Table for Recreation */
CREATE TABLE Recreation (
  PropertyID INT,
  Facilities VARCHAR(20),
  FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

/* Table for Condo */
CREATE TABLE Condo (
  PropertyID INT,
  CondoFee DECIMAL(10, 2),
  FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

/* Table for Land */
CREATE TABLE Land (
  PropertyID INT,
  Area DECIMAL(10, 2),
  FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

/* Table for DetachedHouse */
CREATE TABLE DetachedHouse (
  PropertyID INT,
  YardSize DECIMAL(10, 2),
  FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

/* Table for Parking */
CREATE TABLE Parking (
  PropertyID INT,
  ParkingType VARCHAR(20),
  FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

/* Table for Agriculture */
CREATE TABLE Agriculture (
  PropertyID INT,
  CropType VARCHAR(20),
  FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
);

/* Table for Realtor */
CREATE TABLE Realtor (
  RealtorID INT PRIMARY KEY,
  PhoneNumber VARCHAR(20),
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  LicenseNumber VARCHAR(255),
  Years_of_Experience INT,
  Email_Address VARCHAR(255),
  App_Number VARCHAR(50),
  City VARCHAR(255),
  Street VARCHAR(255),
  PostalCode VARCHAR(10),
  Province VARCHAR(50)
);

/* Table for Realty_Company */
CREATE TABLE Realty_Company (
  RealtyCompanyID INT PRIMARY KEY,
  Name VARCHAR(50),
  PhoneNumber VARCHAR(20),
  App_Number VARCHAR(50),
  City VARCHAR(50),
  Street VARCHAR(50),
  PostalCode VARCHAR(10),
  Province VARCHAR(50)
);

/* Table for Realtor_WorksFor_Realty_Company */
CREATE TABLE Realtor_WorksFor_Realty_Company (
  RealtorID INT,
  RealtyCompanyID INT,
  FOREIGN KEY (RealtorID) REFERENCES Realtor(RealtorID),
  FOREIGN KEY (RealtyCompanyID) REFERENCES Realty_Company(RealtyCompanyID)
);

-- CREATE People table
CREATE TABLE People (
 Person_ID INT NOT NULL,
 Occupation VARCHAR (35),
 Phone_Number VARCHAR (20),
 First_Name VARCHAR (25) NOT NULL,
 Last_Name VARCHAR (25) NOT NULL,
 Street  VARCHAR (35),
 Apartment_Number INT,
 Province CHAR (2),
 City VARCHAR (20),

 
 PRIMARY KEY (Person_ID)

);

-- Create Banks table

CREATE TABLE Banks (

Bank_ID INT NOT NULL,
Bank_Name VARCHAR (25),
Amount_of_Mortgage DECIMAL (18,2),

PRIMARY KEY (Bank_ID)
);

-- Create Purchase_Contract Table 
CREATE TABLE Purchase_Contract (
Purchase_Contract_ID INT NOT NULL,

PRIMARY KEY (Purchase_Contract_ID)
);

-- Create Bank_ParticipatesIn_PurchaseContract table
CREATE TABLE Bank_ParticipatesIn_PurchaseContract (
 
  Bank_ID INT,
  Purchase_Contract_ID INT,
  FOREIGN KEY (Bank_ID) REFERENCES Banks (Bank_ID),
  FOREIGN KEY (Purchase_Contract_ID) REFERENCES Purchase_Contract (Purchase_Contract_ID),
  PRIMARY KEY (Bank_ID, Purchase_Contract_ID)
);

-- Create Seller table
CREATE TABLE Seller (
  SellerID INT NOT NULL,
  
  PRIMARY KEY (SellerID)
);

-- Create Seller_ParticipatesIn_PurchaseContract table
CREATE TABLE Seller_ParticipatesIn_PurchaseContract (
  Purchase_Contract_ID INT,
  SellerID INT,
  FOREIGN KEY (Purchase_Contract_ID) REFERENCES Purchase_Contract (Purchase_Contract_ID),
  FOREIGN KEY (SellerID) REFERENCES Seller (SellerID),
  PRIMARY KEY (Purchase_Contract_ID)
);

-- Create Buyer table
CREATE TABLE Buyer (
  BuyerID INT NOT NULL,
  
  PRIMARY KEY (BuyerID)
);
-- Create Buyer_ParticipatesIn_PurchaseContract table
CREATE TABLE Buyer_ParticipatesIn_PurchaseContract (
  Purchase_Contract_ID INT,
  BuyerID INT,
  FOREIGN KEY (Purchase_Contract_ID) REFERENCES Purchase_Contract (Purchase_Contract_ID),
  FOREIGN KEY (BuyerID) REFERENCES Buyer (BuyerID),
  PRIMARY KEY (Purchase_Contract_ID)
);
-- Create Renter table
CREATE TABLE Renter (
  RenterID INT NOT NULL,
  
  PRIMARY KEY (RenterID)
);

-- Create Renter_Dependent table
CREATE TABLE Renter_Dependent (
  RenterID INT,
  DependentID INT NOT NULL,
  FOREIGN KEY (RenterID) REFERENCES Renter (RenterID),
  PRIMARY KEY (RenterID, DependentID)
);

-- Create Rental_Contract table
CREATE TABLE Rental_Contract (
  Rental_Contract_ID INT ,
  MonthlyRent DECIMAL(18, 2),
  End_Date_Rent DATE,
  Start_Date_Rent DATE,
  RenterID INT,
  
  
  FOREIGN KEY (RenterID) REFERENCES Renter (RenterID),
  PRIMARY KEY (Rental_Contract_ID)
);

-- Create Buyer_Realtor_ParticipationIn_PurchaseContract table
CREATE TABLE Buyer_Realtor_ParticipationIn_PurchaseContract (
  Purchase_Contract_ID INT,
  RealtorID INT,
  
  FOREIGN KEY (Purchase_Contract_ID) REFERENCES Purchase_Contract (Purchase_Contract_ID),
  FOREIGN KEY (RealtorID) REFERENCES Realtor (RealtorID),
  PRIMARY KEY (Purchase_Contract_ID)
);


-- Create Seller_Realtor_ParticipationIn_PurchaseContract table
CREATE TABLE Seller_Realtor_ParticipationIn_PurchaseContract (
  Purchase_Contract_ID INT,
  RealtorID INT,
  
  FOREIGN KEY (Purchase_Contract_ID) REFERENCES Purchase_Contract (Purchase_Contract_ID),
  FOREIGN KEY (RealtorID) REFERENCES Realtor (RealtorID),
  PRIMARY KEY (Purchase_Contract_ID) 
);

-- Create Properties_beingRented_by_RentalContract table
CREATE TABLE Properties_beingRented_by_RentalContract (
  Rental_Contract_ID INT,
  PropertyID INT,
  
  FOREIGN KEY (Rental_Contract_ID) REFERENCES Rental_Contract ( Rental_Contract_ID),
  FOREIGN KEY (PropertyID) REFERENCES Properties ( PropertyID),
  PRIMARY KEY ( Rental_Contract_ID)
  );