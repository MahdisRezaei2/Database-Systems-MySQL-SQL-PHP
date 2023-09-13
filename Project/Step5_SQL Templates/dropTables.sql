-- 
-- Group 100
-- Members: Saeed Mirjalili, MySQL Expert
--          John Smith, MS SQL Expert
-- --------------------------------------

USE Your_Database_Name_Here;  -- replace "Your_Database_Name_Here" with your database name

-- respect the order of dropping parents and children: first children, then parents. There must not be any error in dropping all tables when this script is executed.

DROP TABLE ABC;
DROP TABLE XYZ; 