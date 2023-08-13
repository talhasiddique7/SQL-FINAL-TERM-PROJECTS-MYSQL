CREATE DATABASE TAXI_MANAGMENT_SYSTEM


CREATE TABLE TAXI_DRIVER(
   Driver_id INT NOT NULL,
   F_name VARCHAR(50),
   L_name VARCHAR(50),
   Gender VARCHAR(10),
   Contact_no VARCHAR(20),
   Rating INT,
   Age INT,
   PRIMARY KEY (Driver_id)
);
GO
CREATE PROCEDURE Taxi_Driver_insertion
   @p_Driver_id INT, @p_F_name VARCHAR(50), @p_L_name VARCHAR(50), @p_Gender VARCHAR(10), @p_Contact_no VARCHAR(20), @p_Rating INT,
   @p_Age INT
AS
BEGIN
      INSERT INTO TAXI_DRIVER
      VALUES (@p_Driver_id, @p_F_name, @p_L_name, @p_Gender, @p_Contact_no, @p_Rating, @p_Age);
END;


--Driver_id, F_name, L_name, Gender, Contact_no, Rating, Age
EXEC Taxi_Driver_insertion 5001, 'Mohammad', 'Ali', 'Male', '+92 300 1234567', 4, 35;
EXEC Taxi_Driver_insertion 5002, 'Fatima', 'Khan', 'Female', '+92 321 9876543', 4, 29;
EXEC Taxi_Driver_insertion 5003, 'Shahid', 'Hussain', 'Male', '+92 333 9876543', 4, 32;
EXEC Taxi_Driver_insertion 5004, 'Aisha', 'Raza', 'Female', '+92 312 7654321', 4, 26;
EXEC Taxi_Driver_insertion 5005, 'Ibrahim', 'Abbas', 'Male', '+92 321 4567890', 3, 40;
EXEC Taxi_Driver_insertion 5006, 'Ayesha', 'Jamil', 'Female', '+92 322 8765432', 5, 28;
EXEC Taxi_Driver_insertion 5007, 'Zubair', 'Khan', 'Male', '+92 333 8765432', 4, 30;
EXEC Taxi_Driver_insertion 5008, 'Sana', 'Akram', 'Female', '+92 321 7654321', 4, 31;
EXEC Taxi_Driver_insertion 5009, 'Haroon', 'Malik', 'Male', '+92 312 6543210', 5, 27;
EXEC Taxi_Driver_insertion 5010, 'Farah', 'Qureshi', 'Female', '+92 300 9876543', 3, 33;
EXEC Taxi_Driver_insertion 5011, 'Hassan', 'Shah', 'Male', '+92 322 7654321', 4, 29;
EXEC Taxi_Driver_insertion 5012, 'Sadia', 'Rauf', 'Female', '+92 333 7654321', 5, 25;
EXEC Taxi_Driver_insertion 5013, 'Tariq', 'Iqbal', 'Male', '+92 321 6543210', 3, 34;
EXEC Taxi_Driver_insertion 5014, 'Saima', 'Aslam', 'Female', '+92 300 8765432', 4, 28;
EXEC Taxi_Driver_insertion 5015, 'Usman', 'Khan', 'Male', '+92 322 6543210', 4, 31;
EXEC Taxi_Driver_insertion 5016, 'Zara', 'Riaz', 'Female', '+92 333 6543210', 5, 27;
EXEC Taxi_Driver_insertion 5017, 'Ali', 'Siddiqui', 'Male', '+92 321 5432109', 4, 33;
EXEC Taxi_Driver_insertion 5018, 'Hina', 'Khalid', 'Female', '+92 312 6543210', 4, 29;
EXEC Taxi_Driver_insertion 5019, 'Amir', 'Javed', 'Male', '+92 333 5432109', 3, 35;
EXEC Taxi_Driver_insertion 5020, 'Amina', 'Ahmed', 'Female', '+92 300 6543210', 5, 26;

SELECT * FROM TAXI_DRIVER;
SELECT * FROM TAXI_DRIVER WHERE F_name IN ('Ayesha', 'Tariq', 'Amina');
SELECT * FROM TAXI_DRIVER WHERE Driver_id BETWEEN 5008 AND 5017;

SELECT COUNT(Driver_id) AS Count, Age FROM TAXI_DRIVER GROUP BY Age;
SELECT * FROM TAXI_DRIVER ORDER BY Rating DESC;

SELECT * FROM TAXI_DRIVER WHERE F_name LIKE 'a%';


UPDATE TAXI_DRIVER SET F_name = 'Asma' WHERE F_name = 'Amina'
DELETE FROM TAXI_DRIVER WHERE F_name = 'Amir'
DROP TABLE TAXI_DRIVER


CREATE TABLE Taxi (
    Taxi_id INT NOT NULL,
    Registration_no VARCHAR(20),
    Taxi_Model VARCHAR(20),
    Taxi_Year DATE,
    Taxi_type VARCHAR(20),
    Status VARCHAR(20),
    Driver_id INT,
    PRIMARY KEY (Taxi_id),
    UNIQUE (Registration_no),
    FOREIGN KEY (Driver_id) REFERENCES TAXI_DRIVER(Driver_id)
); 
GO
CREATE PROCEDURE TaxiTable_Insertion
    @Taxi_id INT, @Registration_no VARCHAR(20), @Taxi_Model VARCHAR(20), @Taxi_Year DATE, @Taxi_type VARCHAR(20), @Status VARCHAR(20),
    @Driver_id INT
AS
BEGIN
    INSERT INTO Taxi
    VALUES (@Taxi_id, @Registration_no, @Taxi_Model, @Taxi_Year, @Taxi_type, @Status, @Driver_id);
END;



-- Taxi_id, Registration_no, Taxi_Model, Taxi_Year, Taxi_type, Status, Driver_id

EXEC TaxiTable_Insertion 1001, 'ABC123', 'Toyota Prius', '2020-01-01', 'Sedan', 'Available', 5001;
EXEC TaxiTable_Insertion 1002, 'XYZ456', 'Honda Civic', '2019-05-15', 'Sedan', 'Booked', 5002;
EXEC TaxiTable_Insertion 1003, 'JKL789', 'Ford Explorer', '2018-11-20', 'SUV', 'Available', 5003;
EXEC TaxiTable_Insertion 1004, 'MNO012', 'Chevrolet Malibu', '2017-08-10', 'Sedan', 'Available', 5004;
EXEC TaxiTable_Insertion 1005, 'PQR345', 'Nissan Rogue', '2021-03-30', 'SUV', 'Booked', 5005;
EXEC TaxiTable_Insertion 1006, 'STU678', 'Toyota Camry', '2019-09-25', 'Sedan', 'Available', 5006;
EXEC TaxiTable_Insertion 1007, 'VWX901', 'Honda CR-V', '2020-06-12', 'SUV', 'Available', 5007;
EXEC TaxiTable_Insertion 1008, 'YZA234', 'Hyundai Sonata', '2018-12-05', 'Sedan', 'Booked', 5008;
EXEC TaxiTable_Insertion 1009, 'BCD567', 'Ford Escape', '2017-04-02', 'SUV', 'Available', 5009;
EXEC TaxiTable_Insertion 1010, 'EFG890', 'Toyota Highlander', '2022-02-18', 'SUV', 'Available', 5010;
EXEC TaxiTable_Insertion 1011, 'HIJ123', 'Honda Accord', '2019-10-09', 'Sedan', 'Available', 5011;
EXEC TaxiTable_Insertion 1012, 'KLM456', 'Nissan Altima', '2021-07-08', 'Sedan', 'Booked', 5012;
EXEC TaxiTable_Insertion 1013, 'NOP789', 'Jeep Wrangler', '2018-05-27', 'SUV', 'Available', 5013;
EXEC TaxiTable_Insertion 1014, 'QRS012', 'Toyota RAV4', '2020-11-14', 'SUV', 'Available', 5014;
EXEC TaxiTable_Insertion 1015, 'STU345', 'Honda Pilot', '2019-12-21', 'SUV', 'Booked', 5015;
EXEC TaxiTable_Insertion 1016, 'VWX678', 'Ford Fusion', '2018-09-16', 'Sedan', 'Available', 5016;
EXEC TaxiTable_Insertion 1017, 'YZA901', 'Chevrolet Equinox', '2021-01-07', 'SUV', 'Available', 5017;
EXEC TaxiTable_Insertion 1018, 'BCD234', 'Toyota Corolla', '2017-07-03', 'Sedan', 'Available', 5018;
EXEC TaxiTable_Insertion 1019, 'EFG567', 'Honda HR-V', '2022-04-22', 'SUV', 'Booked', 5019;
EXEC TaxiTable_Insertion 1020, 'HIJ890', 'Hyundai Tucson', '2019-11-30', 'SUV', 'Available', 5020;

SELECT * FROM Taxi;
SELECT * FROM Taxi WHERE Taxi_Model = 'Hyundai Tucson' AND Status = 'Available';
SELECT * FROM Taxi ORDER BY Taxi_Year DESC;
UPDATE Taxi SET Registration_no = 'ACB132' WHERE Registration_no = 'ABC123'
DROP TABLE Taxi


CREATE TABLE USER_TBL (
    Usr_id INT PRIMARY KEY,
    F_name VARCHAR(20),
    L_name VARCHAR(20),
    Contact_no BIGINT,
    Gender VARCHAR(10),
    Address VARCHAR(50),
    Taxi_id INT,
    FOREIGN KEY (Taxi_id) REFERENCES TAXI (taxi_id)
);

GO
CREATE PROCEDURE InsertUser
    @Usr_id INT, @F_name VARCHAR(20), @L_name VARCHAR(20), @Contact_no BIGINT, @Gender VARCHAR(10), @Address VARCHAR(50),
    @Taxi_id INT
AS
BEGIN
    INSERT INTO USER_TBL
    VALUES (@Usr_id, @F_name, @L_name, @Contact_no, @Gender, @Address, @Taxi_id);
END;




-- Usr_id, F_name, L_name, Contact_no, Gender, Address, Taxi_id
EXEC insertUser 1101, 'Ali', 'Khan', 923001234567, 'Male', '123 Main Street, Lahore', '1005';
EXEC insertUser 1102, 'Fatima', 'Akhtar', 923111234567, 'Female', '456 Park Road, Karachi', '1002';
EXEC insertUser 1103, 'Nawaz', 'Siddiqui', 923211234567, 'Male', '789 Stadium Avenue, Islamabad', '1008';
EXEC insertUser 1104, 'Ayesha', 'Raza', 923311234567, 'Female', '567 Canal View, Lahore', '1011';
EXEC insertUser 1105, 'Hassan', 'Malik', 923411234567, 'Male', '12 Street 8, Karachi', '1004';
EXEC insertUser 1106, 'Sana', 'Ali', 923511234567, 'Female', '345 Model Town, Lahore', '1013';
EXEC insertUser 1107, 'Omar', 'Hameed', 923611234567, 'Male', '67 F-11 Markaz, Islamabad', '1009';
EXEC insertUser 1108, 'Zara', 'Khan', 923711234567, 'Female', '890 Gulshan-e-Iqbal, Karachi', '1003';
EXEC insertUser 1109, 'Tariq', 'Mahmood', 923811234567, 'Male', '45 Bahria Town, Lahore', '1010';
EXEC insertUser 1110, 'Amina', 'Rasheed', 923911234567, 'Female', '34 DHA Phase 2, Karachi', '1014';
EXEC insertUser 1111, 'Farhan', 'Khalid', 923021234567, 'Male', '76 G-9 Markaz, Islamabad', '1007';
EXEC insertUser 1112, 'Rabia', 'Nawaz', 923131234567, 'Female', '54 Gulberg, Lahore', '1006';
EXEC insertUser 1113, 'Imran', 'Akram', 923241234567, 'Male', '32 Clifton, Karachi', '1001';
EXEC insertUser 1114, 'Sadia', 'Rauf', 923351234567, 'Female', '21 Blue Area, Islamabad', '1005';
EXEC insertUser 1115, 'Hamza', 'Iqbal', 923461234567, 'Male', '67 E-11 Markaz, Islamabad', '1012';
EXEC insertUser 1116, 'Maria', 'Aslam', 923571234567, 'Female', '56 Model Colony, Karachi', '1002';
EXEC insertUser 1117, 'Bilal', 'Hussain', 923681234567, 'Male', '87 Defense, Lahore', '1004';
EXEC insertUser 1118, 'Sara', 'Bashir', 923791234567, 'Female', '98 Gulshan, Karachi', '1007';
EXEC insertUser 1119, 'Nasir', 'Ahmed', 923501234567, 'Male', '5 Jinnah Avenue, Islamabad', '1009';
EXEC insertUser 1120, 'Hina', 'Kamal', 923951234567, 'Female', '37 Model Town, Lahore', '1001';

SELECT * FROM USER_TBL;
SELECT * FROM USER_TBL WHERE F_name = 'Maria' AND L_name = 'Aslam';
SELECT * FROM USER_TBL WHERE Usr_id BETWEEN 1101 AND 1120;
UPDATE USER_TBL SET F_name = 'Faiza' WHERE Usr_id = 1116
DROP TABLE USER_TBL


CREATE TABLE TRIP_DETAILS (
    Trip_id INT NOT NULL,
    Trip_date DATE,
    Trip_amt DECIMAL(10, 2),
    Driver_id INT,
    Usr_id INT,
    Taxi_id INT,
    Strt_time VARCHAR(20),
    End_time VARCHAR(20),
    PRIMARY KEY (Trip_id),
    FOREIGN KEY (Driver_id) REFERENCES TAXI_DRIVER (Driver_id),
    FOREIGN KEY (Usr_id) REFERENCES USER_TBL (Usr_id),
    FOREIGN KEY (Taxi_id) REFERENCES TAXI (taxi_id),
);
GO
CREATE PROCEDURE InsertTripDetails
    @Trip_id INT, @Trip_date DATE, @Trip_amt DECIMAL(10, 2), @Driver_id INT, @Usr_id INT, @Taxi_id INT, @Strt_time VARCHAR(20),
    @End_time VARCHAR(20)
AS
BEGIN
    INSERT INTO TRIP_DETAILS
    VALUES (@Trip_id, @Trip_date, @Trip_amt, @Driver_id, @Usr_id, @Taxi_id, @Strt_time, @End_time);
END;
GO



-- Trip_id, Trip_date, Trip_amt, Driver_id, Usr_id, Taxi_id, Strt_time, End_time
EXEC InsertTripDetails 001, '2023-07-31', 25.50, 5006, 1104, 1016, '2023-07-31 08:00:00', '2023-07-31 08:30:00';
EXEC InsertTripDetails 002, '2023-07-31', 18.75, 5015, 1117, 1009, '2023-07-31 09:15:00', '2023-07-31 09:45:00';
EXEC InsertTripDetails 003, '2023-07-31', 30.00, 5009, 1112, 1010, '2023-07-31 10:30:00', '2023-07-31 11:15:00';
EXEC InsertTripDetails 004, '2023-07-31', 22.80, 5007, 1111, 1019, '2023-07-31 11:45:00', '2023-07-31 12:15:00';
EXEC InsertTripDetails 005, '2023-07-31', 27.45, 5012, 1107, 1004, '2023-07-31 12:30:00', '2023-07-31 13:00:00';
EXEC InsertTripDetails 006, '2023-07-31', 19.90, 5020, 1116, 1014, '2023-07-31 13:45:00', '2023-07-31 14:15:00';
EXEC InsertTripDetails 007, '2023-07-31', 23.75, 5003, 1110, 1002, '2023-07-31 14:30:00', '2023-07-31 15:00:00';
EXEC InsertTripDetails 008, '2023-07-31', 31.20, 5004, 1119, 1017, '2023-07-31 15:45:00', '2023-07-31 16:30:00';
EXEC InsertTripDetails 009, '2023-07-31', 28.90, 5018, 1106, 1003, '2023-07-31 16:45:00', '2023-07-31 17:15:00';
EXEC InsertTripDetails 010, '2023-07-31', 20.35, 5005, 1118, 1011, '2023-07-31 17:30:00', '2023-07-31 18:00:00';
EXEC InsertTripDetails 011, '2023-07-31', 24.60, 5002, 1120, 1006, '2023-07-31 18:45:00', '2023-07-31 19:15:00';
EXEC InsertTripDetails 012, '2023-07-31', 29.80, 5014, 1109, 1018, '2023-07-31 19:30:00', '2023-07-31 20:00:00';
EXEC InsertTripDetails 013, '2023-07-31', 26.10, 5017, 1101, 1005, '2023-07-31 20:45:00', '2023-07-31 21:15:00';
EXEC InsertTripDetails 014, '2023-07-31', 21.45, 5008, 1115, 1012, '2023-07-31 21:30:00', '2023-07-31 22:00:00';
EXEC InsertTripDetails 015, '2023-07-31', 22.25, 5013, 1113, 1008, '2023-07-31 22:45:00', '2023-07-31 23:15:00';
EXEC InsertTripDetails 016, '2023-07-31', 32.80, 5010, 1105, 1013, '2023-07-31 23:30:00', '2023-07-31 23:59:59';
EXEC InsertTripDetails 017, '2023-08-01', 26.75, 5001, 1114, 1015, '2023-08-01 08:00:00', '2023-08-01 08:30:00';
EXEC InsertTripDetails 018, '2023-08-01', 18.40, 5019, 1108, 1001, '2023-08-01 09:15:00', '2023-08-01 09:45:00';
EXEC InsertTripDetails 019, '2023-08-01', 30.60, 5006, 1117, 1016, '2023-08-01 10:30:00', '2023-08-01 11:15:00';
EXEC InsertTripDetails 020, '2023-08-01', 22.90, 5003, 1112, 1002, '2023-08-01 11:45:00', '2023-08-01 12:15:00';

SELECT * FROM TRIP_DETAILS;
SELECT * FROM TRIP_DETAILS WHERE Trip_id BETWEEN 009 AND 015;
UPDATE TRIP_DETAILS SET Driver_id = 5019 WHERE Trip_id = 017
DROP TABLE TRIP_DETAILS

CREATE TABLE BILL_DETAILS (
   Bill_no INTEGER NOT NULL,
   Bill_date DATE,
   Advance_amt DECIMAL(10, 2),
   Discount_amt DECIMAL(10, 2),
   Total_amt DECIMAL(10, 2),
   Usr_id INTEGER,
   Trip_id INTEGER,
   PRIMARY KEY (Bill_no),
   UNIQUE (Trip_id),
   FOREIGN KEY (Usr_id) REFERENCES USER_TBL(Usr_id),
   FOREIGN KEY (Trip_id) REFERENCES TRIP_DETAILS(Trip_id)
);

GO
CREATE PROCEDURE InsertBillDetails
    @Bill_no INT, @Bill_date DATE, @Advance_amt DECIMAL(10, 2), @Discount_amt DECIMAL(10, 2), @Total_amt DECIMAL(10, 2), @Usr_id INT,
	@Trip_id INT
AS
BEGIN
    INSERT INTO BILL_DETAILS
    VALUES (@Bill_no, @Bill_date, @Advance_amt, @Discount_amt, @Total_amt, @Usr_id, @Trip_id);
END;



-- Bill_no, Bill_date, Advance_amt, Discount_amt, Total_amt, Usr_id, Trip_id

EXEC InsertBillDetails 2201, '2023-07-31', 100.00, 10.00, 90.00, 1102, 003;
EXEC InsertBillDetails 2202, '2023-07-31', 75.00, 8.00, 67.00, 1117, 002;
EXEC InsertBillDetails 2203, '2023-07-31', 120.00, 15.00, 105.00, 1116, 006;
EXEC InsertBillDetails 2204, '2023-07-31', 90.00, 9.00, 81.00, 1104, 001;
EXEC InsertBillDetails 2205, '2023-07-31', 85.00, 10.00, 75.00, 1113, 015;
EXEC InsertBillDetails 2206, '2023-07-31', 110.00, 12.00, 98.00, 1119, 010;
EXEC InsertBillDetails 2207, '2023-07-31', 95.00, 7.00, 88.00, 1107, 005;
EXEC InsertBillDetails 2208, '2023-07-31', 105.00, 10.00, 95.00, 1120, 011;
EXEC InsertBillDetails 2209, '2023-07-31', 80.00, 8.00, 72.00, 1114, 017;
EXEC InsertBillDetails 2210, '2023-07-31', 115.00, 15.00, 100.00, 1108, 018;
EXEC InsertBillDetails 2211, '2023-07-31', 70.00, 7.00, 63.00, 1111, 004;
EXEC InsertBillDetails 2212, '2023-07-31', 100.00, 12.00, 88.00, 1103, 007;
EXEC InsertBillDetails 2213, '2023-07-31', 105.00, 10.00, 95.00, 1118, 019;
EXEC InsertBillDetails 2214, '2023-07-31', 85.00, 8.00, 77.00, 1106, 009;
EXEC InsertBillDetails 2215, '2023-07-31', 90.00, 10.00, 80.00, 1115, 014;
EXEC InsertBillDetails 2216, '2023-07-31', 120.00, 15.00, 105.00, 1112, 020;
EXEC InsertBillDetails 2217, '2023-08-01', 75.00, 8.00, 67.00, 1109, 012;
EXEC InsertBillDetails 2218, '2023-08-01', 80.00, 8.00, 72.00, 1110, 016;
EXEC InsertBillDetails 2219, '2023-08-01', 95.00, 10.00, 85.00, 1116, 013;
EXEC InsertBillDetails 2220, '2023-08-01', 100.00, 10.00, 90.00, 1101, 008;

SELECT * FROM BILL_DETAILS;
SELECT * FROM BILL_DETAILS WHERE Bill_no BETWEEN 2206 AND 2216;
UPDATE BILL_DETAILS SET Discount_amt = 13.00 WHERE Bill_no = 2214
DROP TABLE BILL_DETAILS

CREATE TABLE Employee (
    Emp_id INTEGER PRIMARY KEY,
    F_name VARCHAR(20),
    L_name VARCHAR(20)
);

GO
CREATE PROCEDURE InsertEmployee
    @Emp_id INTEGER, @F_name VARCHAR(20), @L_name VARCHAR(20)
AS
BEGIN

    INSERT INTO Employee
    VALUES (@Emp_id, @F_name, @L_name);
END;


-- Emp_id, F_name, L_name

EXEC InsertEmployee 3301, 'Imran', 'Khan';
EXEC InsertEmployee 3302, 'Fatima', 'Ali';
EXEC InsertEmployee 3303, 'Hassan', 'Hussain';
EXEC InsertEmployee 3304, 'Aisha', 'Ahmed';
EXEC InsertEmployee 3305, 'Mohammad', 'Malik';
EXEC InsertEmployee 3306, 'Sana', 'Raza';
EXEC InsertEmployee 3307, 'Ibrahim', 'Qureshi';
EXEC InsertEmployee 3308, 'Amina', 'Kazmi';
EXEC InsertEmployee 3309, 'Usman', 'Abbas';
EXEC InsertEmployee 3310, 'Zainab', 'Rizvi';
EXEC InsertEmployee 3311, 'Hamza', 'Naqvi';
EXEC InsertEmployee 3312, 'Farah', 'Zahra';
EXEC InsertEmployee 3313, 'Yasin', 'Siddiqui';
EXEC InsertEmployee 3314, 'Mariam', 'Ali';
EXEC InsertEmployee 3315, 'Asad', 'Khan';
EXEC InsertEmployee 3316, 'Hina', 'Hassan';
EXEC InsertEmployee 3317, 'Ali', 'Hussain';
EXEC InsertEmployee 3318, 'Zara', 'Akhtar';
EXEC InsertEmployee 3319, 'Amir', 'Malik';
EXEC InsertEmployee 3320, 'Sadia', 'Raza';

SELECT * FROM Employee;
SELECT * FROM Employee WHERE Emp_id BETWEEN 3304 AND 3314;
UPDATE Employee SET F_name = 'Saira' WHERE F_name = 'Mariam'
DROP TABLE Employee

CREATE TABLE Customer_Service (
    Service_id INTEGER PRIMARY KEY,
    Emp_id INTEGER NOT NULL,
    Request_date DATE,
    Issue_description VARCHAR(500),
    Status VARCHAR(20),
    FOREIGN KEY (Emp_id) REFERENCES Employee(Emp_id)
);

GO
CREATE PROCEDURE InsertCustomerService
    @Service_id INT, @Emp_id INT, @Request_date DATE, @Issue_description VARCHAR(500), @Status VARCHAR(20)
AS
BEGIN
    INSERT INTO Customer_Service
    VALUES (@Service_id, @Emp_id, @Request_date, @Issue_description, @Status);
END;



-- Service_id, Emp_id, Request_date, Issue_description, Status)

EXEC InsertCustomerService 4401, 3305, '2023-07-31', 'The taxi arrived late at the pickup location.', 'Pending';
EXEC InsertCustomerService 4402, 3319, '2023-07-31', 'The taxi driver was rude to the passenger.', 'Open';
EXEC InsertCustomerService 4403, 3303, '2023-07-31', 'The taxi meter was not working properly.', 'In Progress';
EXEC InsertCustomerService 4404, 3306, '2023-07-31', 'The taxi had a strange noise coming from the engine.', 'Resolved';
EXEC InsertCustomerService 4405, 3308, '2023-07-31', 'The taxi driver took an incorrect route.', 'Closed';
EXEC InsertCustomerService 4406, 3316, '2023-07-31', 'The taxi air conditioning was not working.', 'Open';
EXEC InsertCustomerService 4407, 3310, '2023-07-31', 'The taxi driver was driving recklessly.', 'In Progress';
EXEC InsertCustomerService 4408, 3301, '2023-07-31', 'The taxi had a flat tire during the ride.', 'Resolved';
EXEC InsertCustomerService 4409, 3314, '2023-07-31', 'The taxi interior was not clean.', 'Closed';
EXEC InsertCustomerService 4410, 3317, '2023-07-31', 'The taxi driver didnt have proper change.', 'Pending';
EXEC InsertCustomerService 4411, 3304, '2023-07-31', 'The taxi driver refused to go to the desired location.','Open';
EXEC InsertCustomerService 4412, 3318, '2023-07-31', 'The taxi driver didnt follow traffic rules.', 'In Progress';
EXEC InsertCustomerService 4413, 3313, '2023-07-31', 'The taxi had a bad odor inside.', 'Resolved';
EXEC InsertCustomerService 4414, 3311, '2023-07-31', 'The taxi driver was talking on the phone while driving.', 'Closed';
EXEC InsertCustomerService 4415, 3302, '2023-07-31', 'The taxi driver didnot know the correct route.', 'Open';
EXEC InsertCustomerService 4416, 3315, '2023-07-31', 'The taxi music system was not working.', 'In Progress';
EXEC InsertCustomerService 4417, 3309, '2023-07-31', 'The taxi driver was smoking inside the cab.', 'Resolved';
EXEC InsertCustomerService 4418, 3312, '2023-07-31', 'The taxi driver was not wearing a seatbelt.', 'Closed';
EXEC InsertCustomerService 4419, 3319, '2023-07-31', 'The taxi driver overcharged the fare.', 'Open';
EXEC InsertCustomerService 4420, 3307, '2023-07-31', 'The taxi driver was very helpful and friendly.', 'Resolved';

SELECT * FROM Customer_Service;
SELECT * FROM Customer_Service WHERE Emp_id BETWEEN 3304 AND 3314;
UPDATE Customer_Service SET Status = 'Closed' WHERE Service_id = 4419
DROP TABLE Customer_Service

CREATE TABLE FEEDBACK (
    Fbk_id INT NOT NULL,
    Message VARCHAR(140),
    Email VARCHAR(50),
    Emp_id INT,
    Usr_id INT,
    Trip_id INT,
    PRIMARY KEY (Fbk_id),
    CONSTRAINT FK_Employee FOREIGN KEY (Emp_id) REFERENCES Employee (Emp_id),
    CONSTRAINT FK_User FOREIGN KEY (Usr_id) REFERENCES USER_TBL(Usr_id),
    CONSTRAINT FK_Trip FOREIGN KEY (Trip_id) REFERENCES TRIP_DETAILS (trip_id)
);

GO
CREATE PROCEDURE InsertFeedback
    @Fbk_id INT, @Message VARCHAR(140), @Email VARCHAR(50), @Emp_id INT, @Usr_id INT, @Trip_id INT
AS
BEGIN
    INSERT INTO FEEDBACK
    VALUES (@Fbk_id, @Message, @Email, @Emp_id, @Usr_id, @Trip_id);
END;


-- Fbk_id, Message, Email, Emp_id, Usr_id, Trip_id)

EXEC InsertFeedback 6601, 'Great service!', 'nadeem@example.com', 3301, 1114, '001';
EXEC InsertFeedback 6602, 'Driver was very polite.', 'fatima@example.com', 3310, 1118, '018';
EXEC InsertFeedback 6603, 'Smooth ride overall.', 'ali@example.com', 3303, 1115, '016';
EXEC InsertFeedback 6604, 'Could improve cleanliness.', 'aisha@example.com', 3306, 1120, '005';
EXEC InsertFeedback 6605, 'Driver arrived late.', 'zubair@example.com', 3318, 1107, '009';
EXEC InsertFeedback 6606, 'Impressive taxi condition.', 'ayesha@example.com', 3302, 1113, '012';
EXEC InsertFeedback 6607, 'Need better navigation.', 'ahmad@example.com', 3314, 1101, '014';
EXEC InsertFeedback 6608, 'Excellent driver!', 'zara@example.com', 3319, 1112, '020';
EXEC InsertFeedback 6609, 'Friendly service.', 'hassan@example.com', 3308, 1105, '002';
EXEC InsertFeedback 6610, 'Trip canceled without notice.', 'sana@example.com', 3317, 1120, '007';
EXEC InsertFeedback 6611, 'Prompt pickup and drop-off.', 'usman@example.com', 3305, 1111, '011';
EXEC InsertFeedback 6612, 'Average experience.', 'amir@example.com', 3312, 1109, '015';
EXEC InsertFeedback 6613, 'Vehicle smelled bad.', 'saima@example.com', 3309, 1116, '013';
EXEC InsertFeedback 6614, 'Polite and helpful driver.', 'farah@example.com', 3315, 1110, '003';
EXEC InsertFeedback 6615, 'Quick response from support.', 'hamza@example.com', 3304, 1108, '004';
EXEC InsertFeedback 6616, 'Professional service.', 'ayman@example.com', 3307, 1119, '006';
EXEC InsertFeedback 6617, 'Driver took the wrong route.', 'nadia@example.com', 3311, 1104, '019';
EXEC InsertFeedback 6618, 'Great communication!', 'osman@example.com', 3301, 1117, '017';
EXEC InsertFeedback 6619, 'Clean and comfortable taxi.', 'amina@example.com', 3313, 1115, '010';
EXEC InsertFeedback 6620, 'Driver was late for pickup.', 'farida@example.com', 3316, 1103, '008';


SELECT * FROM FEEDBACK;
SELECT * FROM FEEDBACK WHERE Fbk_id BETWEEN 6604 AND 6619;
UPDATE FEEDBACK SET Emp_id = 3308 WHERE Fbk_id = 6618
DROP TABLE FEEDBACK


CREATE TABLE OWNER_TAXI (
   owner_id INT PRIMARY KEY NOT NULL,
   taxi_id INT,
   FOREIGN KEY (taxi_id) REFERENCES TAXI (taxi_id)
);

GO
CREATE PROCEDURE InsertIntoOwnerTaxi
    @owner_id INT, @taxi_id INT
AS
BEGIN
    INSERT INTO OWNER_TAXI
    VALUES (@owner_id, @taxi_id);
END;

-- owner_id, taxi_id

EXEC InsertIntoOwnerTaxi 7701, 1005;
EXEC InsertIntoOwnerTaxi 7702, 1013;
EXEC InsertIntoOwnerTaxi 7703, 1009;
EXEC InsertIntoOwnerTaxi 7704, 1019;
EXEC InsertIntoOwnerTaxi 7705, 1014;
EXEC InsertIntoOwnerTaxi 7706, 1006;
EXEC InsertIntoOwnerTaxi 7707, 1001;
EXEC InsertIntoOwnerTaxi 7708, 1010;
EXEC InsertIntoOwnerTaxi 7709, 1011;
EXEC InsertIntoOwnerTaxi 7710, 1003;
EXEC InsertIntoOwnerTaxi 7711, 1017;
EXEC InsertIntoOwnerTaxi 7712, 1008;
EXEC InsertIntoOwnerTaxi 7713, 1002;
EXEC InsertIntoOwnerTaxi 7714, 1007;
EXEC InsertIntoOwnerTaxi 7715, 1015;
EXEC InsertIntoOwnerTaxi 7716, 1016;
EXEC InsertIntoOwnerTaxi 7717, 1020;
EXEC InsertIntoOwnerTaxi 7718, 1012;
EXEC InsertIntoOwnerTaxi 7719, 1004;
EXEC InsertIntoOwnerTaxi 7720, 1018;


SELECT * FROM OWNER_TAXI;
SELECT * FROM OWNER_TAXI WHERE owner_id BETWEEN 7707 AND 7717;
UPDATE OWNER_TAXI SET taxi_id = 1019 WHERE owner_id = 7718
DROP TABLE OWNER_TAXI

CREATE TABLE TAXI_SERVICE_COMPANY (
    Tsc_id INT NOT NULL PRIMARY KEY,
    Tsc_name VARCHAR(20),
    Owner_id INT,
    FOREIGN KEY (Owner_id) REFERENCES OWNER_TAXI(owner_id)
);
GO
CREATE PROCEDURE InsertTaxiServiceCompany
    @Tsc_id INT, @Tsc_name VARCHAR(20), @Owner_id INT
AS
BEGIN
    INSERT INTO TAXI_SERVICE_COMPANY VALUES (@Tsc_id, @Tsc_name, @Owner_id);
END;


-- Tsc_id, Tsc_name, Owner_id)

EXEC InsertTaxiServiceCompany 9901, 'ABC Cabs', 7706;
EXEC InsertTaxiServiceCompany 9902, 'Fast Rides', 7718;
EXEC InsertTaxiServiceCompany 9903, 'City Taxis', 7713;
EXEC InsertTaxiServiceCompany 9904, 'Metro Cabs', 7720;
EXEC InsertTaxiServiceCompany 9905, 'Swift Rides', 7701;
EXEC InsertTaxiServiceCompany 9906, 'Green Cabs', 7714;
EXEC InsertTaxiServiceCompany 9907, 'Prime Taxis', 7702;
EXEC InsertTaxiServiceCompany 9908, 'Zoom Rides', 7712;
EXEC InsertTaxiServiceCompany 9909, 'Express Cabs', 7719;
EXEC InsertTaxiServiceCompany 9910, 'Mega Taxis', 7709;
EXEC InsertTaxiServiceCompany 9911, 'Urban Rides', 7716;
EXEC InsertTaxiServiceCompany 9912, 'Skyline Cabs', 7704;
EXEC InsertTaxiServiceCompany 9913, 'Speedy Taxis', 7717;
EXEC InsertTaxiServiceCompany 9914, 'Royal Rides', 7705;
EXEC InsertTaxiServiceCompany 9915, 'Luxury Cabs', 7711;
EXEC InsertTaxiServiceCompany 9916, 'Swift Cabs', 7703;
EXEC InsertTaxiServiceCompany 9917, 'City Rides', 7710;
EXEC InsertTaxiServiceCompany 9918, 'Green Rides', 7707;
EXEC InsertTaxiServiceCompany 9919, 'Metro Taxis', 7715;
EXEC InsertTaxiServiceCompany 9920, 'Supreme Cabs', 7708;

SELECT * FROM TAXI_SERVICE_COMPANY;
SELECT * FROM TAXI_SERVICE_COMPANY WHERE Tsc_id BETWEEN 9903 AND 9917;
UPDATE TAXI_SERVICE_COMPANY SET Tsc_name = 'Prime Taxis' WHERE Tsc_id = 9918
DROP TABLE TAXI_SERVICE_COMPANY

SELECT *
FROM TAXI_DRIVER
JOIN Taxi ON TAXI_DRIVER.Driver_id = Taxi.Driver_id;

SELECT *
FROM TAXI_DRIVER
JOIN Taxi ON TAXI_DRIVER.Driver_id = Taxi.Driver_id
JOIN USER_TBL ON Taxi.Taxi_id = USER_TBL.Taxi_id;

SELECT *
FROM TAXI_DRIVER
JOIN Taxi ON TAXI_DRIVER.Driver_id = Taxi.Driver_id
JOIN USER_TBL ON Taxi.Taxi_id = USER_TBL.Taxi_id
JOIN TRIP_DETAILS ON USER_TBL.Usr_id = TRIP_DETAILS.Usr_id AND Taxi.Taxi_id = TRIP_DETAILS.Taxi_id AND TAXI_DRIVER.Driver_id = TRIP_DETAILS.Driver_id;

SELECT *
FROM TAXI_DRIVER
JOIN Taxi ON TAXI_DRIVER.Driver_id = Taxi.Driver_id
JOIN USER_TBL ON Taxi.Taxi_id = USER_TBL.Taxi_id
JOIN TRIP_DETAILS ON USER_TBL.Usr_id = TRIP_DETAILS.Usr_id AND Taxi.Taxi_id = TRIP_DETAILS.Taxi_id AND TAXI_DRIVER.Driver_id = TRIP_DETAILS.Driver_id
JOIN BILL_DETAILS ON TRIP_DETAILS.Trip_id = BILL_DETAILS.Trip_id;

SELECT *
FROM TAXI_DRIVER
JOIN USER_TBL ON TAXI_DRIVER.Driver_id = USER_TBL.Driver_id
JOIN FEEDBACK ON USER_TBL.Usr_id = FEEDBACK.Usr_id
JOIN TRIP_DETAILS ON USER_TBL.Usr_id = TRIP_DETAILS.Usr_id AND TAXI_DRIVER.Driver_id = TRIP_DETAILS.Driver_id;

SELECT *
FROM TAXI_DRIVER
JOIN Taxi ON TAXI_DRIVER.Driver_id = Taxi.Driver_id
JOIN USER_TBL ON Taxi.Taxi_id = USER_TBL.Taxi_id
JOIN FEEDBACK ON USER_TBL.Usr_id = FEEDBACK.Usr_id
JOIN TRIP_DETAILS ON USER_TBL.Usr_id = TRIP_DETAILS.Usr_id AND Taxi.Taxi_id = TRIP_DETAILS.Taxi_id AND TAXI_DRIVER.Driver_id = TRIP_DETAILS.Driver_id;

SELECT *
FROM TAXI_DRIVER
JOIN Taxi ON TAXI_DRIVER.Driver_id = Taxi.Driver_id
JOIN USER_TBL ON Taxi.Taxi_id = USER_TBL.Taxi_id
JOIN FEEDBACK ON USER_TBL.Usr_id = FEEDBACK.Usr_id
JOIN TRIP_DETAILS ON USER_TBL.Usr_id = TRIP_DETAILS.Usr_id AND Taxi.Taxi_id = TRIP_DETAILS.Taxi_id AND TAXI_DRIVER.Driver_id = TRIP_DETAILS.Driver_id
JOIN BILL_DETAILS ON TRIP_DETAILS.Trip_id = BILL_DETAILS.Trip_id;

