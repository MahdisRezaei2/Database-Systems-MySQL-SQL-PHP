CREATE DATABASE Lab4;
USE Lab4;

CREATE TABLE Customer (
 Customer_ID INT,
 Customer_Name VARCHAR (35) NOT NULL,
 Customer_Address VARCHAR (100),
 Customer_State CHAR(2) NOT NULL,
 Customer_Zip INT,
 
 
 PRIMARY KEY (Customer_ID),
 CONSTRAINT Check_Customer_Zip CHECK (Customer_Zip >= 10000 AND Customer_Zip <= 999999)


);
CREATE TABLE Products (
  Product_ID INT, 	
  Product_Name CHAR (30) UNIQUE,
  Product_Price DECIMAL (10,2),
  Product_Line_ID SMALLINT CHECK (Product_Line_ID >=10 AND Product_Line_ID<=100),
  
  
  PRIMARY KEY (Product_ID)
  
);

CREATE TABLE Sales_Order (
  Order_ID INT,
  Order_Date DATE,
  Customer_ID INT,
  
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE 
);

CREATE TABLE Order_Line(
  Order_ID INT,
  Product_ID INT NOT NULL, 
  Ordered_Quantity INT,
  
  
  PRIMARY KEY (Order_ID,Product_ID),
  FOREIGN KEY (Order_ID) REFERENCES Sales_Order(Order_ID) ON DELETE CASCADE,
  FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID) 
);


 DROP TABLE Order_Line;
 DROP TABLE Sales_Order;
 DROP TABLE Products;
 DROP TABLE Customer;
 
 
 CREATE TABLE Customer (
 Customer_ID INT,
 Customer_Name VARCHAR (35) NOT NULL,
 Customer_Address VARCHAR (100),
 Customer_State CHAR(2) NOT NULL,
 Customer_Zip INT,
 
 
 PRIMARY KEY (Customer_ID),
 CONSTRAINT Check_Customer_Zip CHECK (Customer_Zip >= 10000 AND Customer_Zip <= 999999)


);
CREATE TABLE Products (
  Product_ID INT, 	
  Product_Name CHAR (30) UNIQUE,
  Product_Price DECIMAL (10,2),
  Product_Line_ID SMALLINT CHECK (Product_Line_ID >=10 AND Product_Line_ID<=100),
  
  
  PRIMARY KEY (Product_ID)
  
);
CREATE TABLE Sales_Order (
  Order_ID INT,
  Order_Date DATE,
  Customer_ID INT,
  
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE 
);
CREATE TABLE Order_Line(
  Order_ID INT,
  Product_ID INT NOT NULL, 
  Ordered_Quantity INT,
  
  
  PRIMARY KEY (Order_ID,Product_ID),
  FOREIGN KEY (Order_ID) REFERENCES Sales_Order(Order_ID) ON DELETE CASCADE,
  FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID) 
);


INSERT INTO CUSTOMER VALUES (1, 'Simon Li', '1392 Moonset Apt', 'NT', 180059);
INSERT INTO CUSTOMER VALUES (2, 'Goldberg Smith', '6870 Nelson St', 'CA', 56032);
INSERT INTO CUSTOMER VALUES (3, 'Richard Andrew', '2040 Riverbend Rd.', 'CA', 96710);
INSERT INTO CUSTOMER VALUES (4, 'Catherine Wong', NULL, 'AZ', 857987);
INSERT INTO CUSTOMER VALUES (5, 'Marie', '7869 Gabriel Road', 'AZ', 857987);
INSERT INTO CUSTOMER VALUES (6, 'Saeed', 'Mountain Heights', 'WS', 857987);

INSERT INTO Sales_Order VALUES (200, '2016-01-01', 1);
INSERT INTO Sales_Order VALUES (201, '2016-01-01', 2);
INSERT INTO Sales_Order VALUES (202, '2016-02-01', 3);
INSERT INTO Sales_Order VALUES (203, '2017-03-01', 2);
INSERT INTO Sales_Order VALUES (204, '2017-10-01', 1);
INSERT INTO Sales_Order VALUES (205, '2017-10-01', 4);
INSERT INTO Sales_Order VALUES (206, '2017-10-01', 2);
INSERT INTO Sales_Order VALUES (207, '2017-10-01', 1);
INSERT INTO Sales_Order VALUES (208, '2017-10-02', 5);


INSERT INTO Products VALUES (1000, 'Office Desk', 105.00, 10);
INSERT INTO Products VALUES (1001, 'Managers Desk ', 209.1, 10);
INSERT INTO Products VALUES (2000, 'Office Chair ', 89 , 20);
INSERT INTO Products VALUES (2001, 'Students Desk ', 229.5, 20);
INSERT INTO Products VALUES (3000, 'Book Shelf  ', 95, 30);
INSERT INTO Products VALUES (3001, 'Duplex Book Shelf  ', 180.25, 30);
INSERT INTO Products VALUES (4000, 'Table Lamp ', 85, 40);
INSERT INTO Products VALUES (4001, 'Duplex Table Lamp  ', 90, 40);


INSERT INTO Order_Line VALUES (200, 4000, 1);
INSERT INTO Order_Line VALUES (201, 1000, 2);
INSERT INTO Order_Line VALUES (201, 2000, 2);
INSERT INTO Order_Line VALUES (202, 3000, 1);
INSERT INTO Order_Line VALUES (202, 2000, 1);
INSERT INTO Order_Line VALUES (203, 4001, 1);
INSERT INTO Order_Line VALUES (204, 2000, 1);
INSERT INTO Order_Line VALUES (205, 3001, 2);
INSERT INTO Order_Line VALUES (206, 3000, 1);
INSERT INTO Order_Line VALUES (206, 4000, 1);
INSERT INTO Order_Line VALUES (207, 4001, 1);

-- DESCRIBE Customer;

SELECT *
FROM Order_Line;
