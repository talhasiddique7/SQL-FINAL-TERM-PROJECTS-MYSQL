CREATE DATABASE Bank_Management_System;

--                     *******************************************
--                     ***     CREATING TABLE OF CUSTOMER      ***
--                     *******************************************

CREATE TABLE CUSTOMER (
   CustomerID INT PRIMARY KEY,
   FirstName VARCHAR(50),
   LastName VARCHAR(50),
   DateOfBirth DATE,
   Address VARCHAR(100),
   Phone VARCHAR(20),
   Email VARCHAR(100),
   Occupation VARCHAR(50),
   AnnualIncome DECIMAL(10, 2)
);

--                     *******************************************
--                     ***   CREATING PROCEDURE OF CUSTOMER    ***
--                     *******************************************
GO
CREATE OR ALTER PROCEDURE Insert_Into_Customer
(
    @CustomerID INT, @FirstName VARCHAR(50), @LastName VARCHAR(50), @DateOfBirth DATE, @Address VARCHAR(100),
	@Phone VARCHAR(20), @Email VARCHAR(100), @Occupation VARCHAR(50), @AnnualIncome DECIMAL(10, 2)
)
AS
BEGIN
        INSERT INTO CUSTOMER
        VALUES(@CustomerID, @FirstName, @LastName, @DateOfBirth, @Address, @Phone, @Email, @Occupation, @AnnualIncome);
   
END

--                     *******************************************
--                     ***     CREATING TABLE OF ACCOUNTS      ***
--                     *******************************************

CREATE TABLE ACCOUNT(
    AccountNumber INT PRIMARY KEY,
    Customer_ID INT,
    AccountType VARCHAR(50),
    Balance DECIMAL(10, 2),
    OpenDate DATE,
    LastTransactionDate DATE,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(CustomerID)
);
--                     *******************************************
--                     ***   CREATING PROCEDURE OF CUSTOMER    ***
--                     *******************************************

GO 
CREATE OR ALTER PROCEDURE Insert_Into_Account
    @AccountNumber INT, @CustomerID INT, @AccountType VARCHAR(50), @Balance DECIMAL(10, 2), @OpenDate DATE, @LastTransactionDate DATE
AS
BEGIN
    INSERT INTO ACCOUNT VALUES (@AccountNumber, @CustomerID, @AccountType, @Balance, @OpenDate, @LastTransactionDate);
END
;

--                     ***************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF CUSTOMER    ***
--                     ***************************************************

EXEC Insert_Into_Customer 1, 'Abdul', 'Rahman', '1990-05-15', '123 Main St, Karachi', '+92 300 1234567', 'abdul.rahman@example.com', 'Engineer', 75000.00;
EXEC Insert_Into_Customer 2, 'Ayesha', 'Ahmed', '1985-09-25', '456 Oak Ave, Lahore', '+92 321 9876543', 'ayesha.ahmed@example.com', 'Teacher', 60000.00;
EXEC Insert_Into_Customer 3, 'Muhammad', 'Ali', '1978-11-10', '789 Elm Rd, Islamabad', '+92 333 5551234', 'muhammad.ali@example.com', 'Doctor', 120000.00;
EXEC Insert_Into_Customer 4, 'Fatima', 'Siddiqui', '1995-02-03', '101 Maple St, Rawalpindi', '+92 301 1112222', 'fatima.siddiqui@example.com', 'Writer', 45000.00;
EXEC Insert_Into_Customer 5, 'Ahmed', 'Khan', '1982-07-20', '222 Pine Ave, Peshawar', '+92 302 4445555', 'ahmed.khan@example.com', 'Artist', 35000.00;
EXEC Insert_Into_Customer 6, 'Ayesha', 'Hussain', '1993-12-08', '333 Cedar Rd, Karachi', '+92 333 8889999', 'ayesha.hussain@example.com', 'Lawyer', 90000.00;
EXEC Insert_Into_Customer 7, 'Saad', 'Malik', '1989-04-18', '444 Birch St, Lahore', '+92 333 7778888', 'saad.malik@example.com', 'Engineer', 80000.00;
EXEC Insert_Into_Customer 8, 'Hafsa', 'Qureshi', '1980-06-30', '555 Oakwood Ave, Islamabad', '+92 331 6667777', 'hafsa.qureshi@example.com', 'Teacher', 55000.00;
EXEC Insert_Into_Customer 9, 'Zain', 'Mahmood', '1998-09-12', '666 Elmwood Rd, Rawalpindi', '+92 311 2223333', 'zain.mahmood@example.com', 'Doctor', 130000.00;
EXEC Insert_Into_Customer 10, 'Mehwish', 'Abbasi', '1991-03-27', '777 Maple Ave, Peshawar', '+92 312 1112222', 'mehwish.abbasi@example.com', 'Artist', 40000.00;
EXEC Insert_Into_Customer 11, 'Ibrahim', 'Raza', '1987-08-14', '888 Oakwood Rd, Karachi', '+92 311 5556666', 'ibrahim.raza@example.com', 'Engineer', 78000.00;
EXEC Insert_Into_Customer 12, 'Sara', 'Ahmed', '1992-11-09', '999 Elm Ave, Lahore', '+92 331 3337777', 'sara.ahmed@example.com', 'Teacher', 62000.00;
EXEC Insert_Into_Customer 13, 'Abdullah', 'Hussain', '1984-02-21', '111 Pine St, Islamabad', '+92 321 4445555', 'abdullah.hussain@example.com', 'Doctor', 125000.00;
EXEC Insert_Into_Customer 14, 'Aisha', 'Rauf', '1996-05-03', '222 Cedar Ave, Rawalpindi', '+92 312 6667777', 'aisha.rauf@example.com', 'Writer', 48000.00;
EXEC Insert_Into_Customer 15, 'Hamza', 'Khalid', '1981-09-17', '333 Birch Rd, Peshawar', '+92 331 9990000', 'hamza.khalid@example.com', 'Artist', 38000.00;
EXEC Insert_Into_Customer 16, 'Hania', 'Khan', '1994-12-23', '444 Oak St, Karachi', '+92 312 7778888', 'hania.khan@example.com', 'Lawyer', 92000.00;
EXEC Insert_Into_Customer 17, 'Bilal', 'Ali', '1988-04-28', '555 Elmwood Ave, Lahore', '+92 311 4443333', 'bilal.ali@example.com', 'Engineer', 81000.00;
EXEC Insert_Into_Customer 18, 'Fizza', 'Rasheed', '1983-06-10', '666 Pine Rd, Islamabad', '+92 321 8889999', 'fizza.rasheed@example.com', 'Teacher', 56000.00;
EXEC Insert_Into_Customer 19, 'Umar', 'Mirza', '1999-09-15', '777 Cedar Ave, Rawalpindi', '+92 332 4443333', 'umar.mirza@example.com', 'Doctor', 135000.00;
EXEC Insert_Into_Customer 20, 'Hira', 'Khan', '1990-04-05', '999 Maple St, Peshawar', '+92 312 8889999', 'hira.khan@example.com', 'Writer', 47000.00;
EXEC Insert_Into_Customer 21, 'Sami', 'Rashid', '1993-07-12', '111 Oak Ave, Karachi', '+92 332 3337777', 'sami.rashid@example.com', 'Engineer', 79000.00;
EXEC Insert_Into_Customer 22, 'Aasiya', 'Malik', '1986-10-28', '222 Elm Rd, Lahore', '+92 332 6669999', 'aasiya.malik@example.com', 'Teacher', 63000.00;
EXEC Insert_Into_Customer 23, 'Saif', 'Ali', '1979-01-09', '333 Cedar St, Islamabad', '+92 321 8880000', 'saif.ali@example.com', 'Doctor', 127000.00;
EXEC Insert_Into_Customer 24, 'Nimra', 'Saeed', '1997-06-22', '444 Pine Ave, Rawalpindi', '+92 311 1112222', 'nimra.saeed@example.com', 'Writer', 49000.00;
EXEC Insert_Into_Customer 25, 'Taha', 'Awan', '1982-10-16', '555 Birch Rd, Peshawar', '+92 312 4445555', 'taha.awan@example.com', 'Artist', 39000.00
EXEC Insert_Into_Customer 26, 'Zara', 'Akhtar', '1995-01-31', '666 Oakwood Ave, Karachi', '+92 313 9990000', 'zara.akhtar@example.com', 'Lawyer', 94000.00;
EXEC Insert_Into_Customer 27, 'Ahmed', 'Raza', '1989-03-07', '777 Elmwood Rd, Lahore', '+92 333 6667777', 'ahmed.raza@example.com', 'Engineer', 82000.00;
EXEC Insert_Into_Customer 28, 'Sadia', 'Ahmed', '1984-05-19', '999 Cedar Ave, Islamabad', '+92 314 4445555', 'sadia.ahmed@example.com', 'Teacher', 57000.00;
EXEC Insert_Into_Customer 29, 'Yousuf', 'Ali', '1998-08-14', '111 Maple St, Rawalpindi', '+92 311 3337777', 'yousuf.ali@example.com', 'Doctor', 140000.00;
EXEC Insert_Into_Customer 30, 'Ayesha', 'Hussain', '1991-05-28', '222 Oak Ave, Peshawar', '+92 312 8889999', 'ayesha.hussain@example.com', 'Writer', 46000.00;
EXEC Insert_Into_Customer 31, 'Bilal', 'Khan', '1986-08-09', '333 Elm Rd, Karachi', '+92 311 4443333', 'bilal.khan@example.com', 'Engineer', 80000.00;
EXEC Insert_Into_Customer 32, 'Zoya', 'Mir', '1993-11-22', '444 Cedar St, Lahore', '+92 332 6669999', 'zoya.mir@example.com', 'Teacher', 64000.00;
EXEC Insert_Into_Customer 33, 'Yousuf', 'Haider', '1978-02-03', '555 Pine Ave, Islamabad', '+92 313 8880000', 'yousuf.haider@example.com', 'Doctor', 130000.00;
EXEC Insert_Into_Customer 34, 'Ayesha', 'Akram', '1996-06-15', '666 Birch Rd, Rawalpindi', '+92 311 1112222', 'ayesha.akram@example.com', 'Writer', 50000.00;
EXEC Insert_Into_Customer 35, 'Bilal', 'Haider', '1981-11-12', '777 Oakwood Ave, Peshawar', '+92 312 4445555', 'bilal.haider@example.com', 'Artist', 40000.00;
EXEC Insert_Into_Customer 36, 'Noor', 'Malik', '1994-12-31', '888 Elmwood Rd, Karachi', '+92 313 9990000', 'noor.malik@example.com', 'Lawyer', 96000.00;
EXEC Insert_Into_Customer 37, 'Hamza', 'Raza', '1988-03-17', '999 Pine Rd, Lahore', '+92 333 6667777', 'hamza.raza@example.com', 'Engineer', 83000.00;
EXEC Insert_Into_Customer 38, 'Hira', 'Riaz', '1983-05-25', '111 Cedar Ave, Islamabad', '+92 314 4445555', 'hira.riaz@example.com', 'Teacher', 59000.00;
EXEC Insert_Into_Customer 39, 'Yusuf', 'Farooq', '1999-08-18', '222 Elm Ave, Rawalpindi', '+92 311 3337777', 'yusuf.farooq@example.com', 'Doctor', 137000.00;
EXEC Insert_Into_Customer 40, 'Anam', 'Khan', '1990-05-19', '333 Oak St, Peshawar', '+92 312 8889999', 'anam.khan@example.com', 'Writer', 48000.00;

SELECT * FROM CUSTOMER
SELECT * FROM CUSTOMER WHERE FirstName = 'Ayesha' OR FirstName = 'Yousuf' OR FirstName = 'Bilal'
SELECT * FROM CUSTOMER WHERE FirstName = 'Zoya' AND LastName = 'Mir'
SELECT FirstName, LastName, Address FROM CUSTOMER WHERE Address IS NOT NULL
SELECT * FROM CUSTOMER WHERE Occupation IN ('Writer', 'Doctor', 'Teacher')
SELECT * FROM CUSTOMER WHERE CustomerID BETWEEN 10 AND 20;
SELECT COUNT(CustomerID) AS Profession, Occupation FROM CUSTOMER GROUP BY Occupation
SELECT COUNT(CustomerID), Occupation FROM CUSTOMER GROUP BY Occupation HAVING COUNT(CustomerID) > 5;
SELECT * FROM CUSTOMER ORDER BY FirstName
SELECT * FROM CUSTOMER ORDER BY DateOfBirth DESC
SELECT * FROM CUSTOMER ORDER BY Address ASC
SELECT DISTINCT Occupation FROM CUSTOMER

SELECT * FROM CUSTOMER WHERE FirstName like 'a%';
SELECT * FROM CUSTOMER WHERE LastName like '%a';
SELECT * FROM CUSTOMER WHERE FirstName like '%m%';
SELECT * FROM CUSTOMER WHERE LastName like '_a%';
SELECT * FROM CUSTOMER WHERE FirstName like 'a_%';
SELECT * FROM CUSTOMER WHERE LastName like 'r__%';
SELECT * FROM CUSTOMER WHERE FirstName like 'h%a';

SELECT Occupation, SUM(AnnualIncome) AS All_Customer_AnnualIncome FROM CUSTOMER GROUP BY Occupation;
SELECT Occupation, MAX(AnnualIncome) AS Highest_Income FROM CUSTOMER GROUP BY Occupation;
SELECT Occupation, MIN(AnnualIncome) AS Minimum_Income FROM CUSTOMER GROUP BY Occupation;           
SELECT Occupation, AVG(AnnualIncome) AS Average_Income FROM CUSTOMER GROUP BY Occupation;          
SELECT Occupation, COUNT(*) AS Total_Customer FROM CUSTOMER GROUP BY Occupation;  

UPDATE CUSTOMER SET FirstName = 'Asma' WHERE FirstName = 'Fizza'
DELETE FROM CUSTOMER WHERE FirstName = 'Anam'
DROP TABLE CUSTOMER

SELECT SUM(AnnualIncome)
FROM CUSTOMER JOIN ACCOUNT ON CUSTOMER.CustomerID = ACCOUNT.Customer_ID
GROUP BY Occupation

--                     ***************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF ACCOUNT     ***
--                     ***************************************************

-- AccountNumber, CustomerID, AccountType, Balance, OpenDate, LastTransactionDate
EXEC Insert_Into_Account 1001, 1, 'Savings', 5000.00, '2023-07-29', '2023-07-29';
EXEC Insert_Into_Account 1002, 2, 'Checking', 3000.00, '2023-07-30', '2023-07-30';
EXEC Insert_Into_Account 1003, 3, 'Savings', 7500.50, '2023-08-01', '2023-08-01';
EXEC Insert_Into_Account 1004, 4, 'Savings', 10000.00, '2023-08-02', '2023-08-02';
EXEC Insert_Into_Account 1005, 5, 'Checking', 2000.00, '2023-08-03', '2023-08-03';
EXEC Insert_Into_Account 1006, 6, 'Savings', 3500.75, '2023-08-04', '2023-08-04';
EXEC Insert_Into_Account 1007, 7, 'Checking', 8000.00, '2023-08-05', '2023-08-05';
EXEC Insert_Into_Account 1008, 8, 'Savings', 12000.25, '2023-08-06', '2023-08-06';
EXEC Insert_Into_Account 1009, 9, 'Checking', 6000.50, '2023-08-07', '2023-08-07';
EXEC Insert_Into_Account 1010, 10, 'Savings', 9000.00, '2023-08-08', '2023-08-08';
EXEC Insert_Into_Account 1011, 11, 'Checking', 4000.00, '2023-08-09', '2023-08-09';
EXEC Insert_Into_Account 1012, 12, 'Savings', 6500.25, '2023-08-10', '2023-08-10';
EXEC Insert_Into_Account 1013, 13, 'Checking', 8200.75, '2023-08-11', '2023-08-11';
EXEC Insert_Into_Account 1014, 14, 'Savings', 11000.00, '2023-08-12', '2023-08-12';
EXEC Insert_Into_Account 1015, 15, 'Checking', 2500.50, '2023-08-13', '2023-08-13';
EXEC Insert_Into_Account 1016, 16, 'Savings', 3000.00, '2023-08-14', '2023-08-14';
EXEC Insert_Into_Account 1017, 17, 'Checking', 7000.25, '2023-08-15', '2023-08-15';
EXEC Insert_Into_Account 1018, 18, 'Savings', 9000.75, '2023-08-16', '2023-08-16';
EXEC Insert_Into_Account 1019, 19, 'Checking', 4500.00, '2023-08-17', '2023-08-17';
EXEC Insert_Into_Account 1020, 20, 'Savings', 7500.50, '2023-08-18', '2023-08-18';
EXEC Insert_Into_Account 1021, 21, 'Checking', 3000.00, '2023-08-19', '2023-08-19';
EXEC Insert_Into_Account 1022, 22, 'Savings', 8000.25, '2023-08-20', '2023-08-20';
EXEC Insert_Into_Account 1023, 23, 'Checking', 6200.75, '2023-08-21', '2023-08-21';
EXEC Insert_Into_Account 1024, 24, 'Savings', 15000.00, '2023-08-22', '2023-08-22';
EXEC Insert_Into_Account 1025, 25, 'Checking', 3500.50, '2023-08-23', '2023-08-23';
EXEC Insert_Into_Account 1026, 26, 'Savings', 3800.00, '2023-08-24', '2023-08-24';
EXEC Insert_Into_Account 1027, 27, 'Checking', 9200.25, '2023-08-25', '2023-08-25';
EXEC Insert_Into_Account 1028, 28, 'Savings', 17000.75, '2023-08-26', '2023-08-26';
EXEC Insert_Into_Account 1029, 29, 'Checking', 6000.00, '2023-08-27', '2023-08-27';
EXEC Insert_Into_Account 1030, 30, 'Savings', 9500.50, '2023-08-28', '2023-08-28';
EXEC Insert_Into_Account 1031, 31, 'Checking', 2000.00, '2023-08-29', '2023-08-29';
EXEC Insert_Into_Account 1032, 32, 'Savings', 7400.25, '2023-08-30', '2023-08-30';
EXEC Insert_Into_Account 1033, 33, 'Checking', 9800.75, '2023-08-31', '2023-08-31';
EXEC Insert_Into_Account 1034, 34, 'Savings', 14000.00, '2023-09-01', '2023-09-01';
EXEC Insert_Into_Account 1035, 35, 'Checking', 1800.50, '2023-09-02', '2023-09-02';
EXEC Insert_Into_Account 1036, 36, 'Savings', 4200.00, '2023-09-03', '2023-09-03';
EXEC Insert_Into_Account 1037, 37, 'Checking', 7700.25, '2023-09-04', '2023-09-04';
EXEC Insert_Into_Account 1038, 38, 'Savings', 11000.75, '2023-09-05', '2023-09-05';
EXEC Insert_Into_Account 1039, 39, 'Checking', 5200.00, '2023-09-06', '2023-09-06';
EXEC Insert_Into_Account 1040, 40, 'Savings', 8800.50, '2023-09-07', '2023-09-07';

SELECT * FROM ACCOUNT
SELECT * FROM ACCOUNT WHERE AccountType = 'Savings'
SELECT * FROM ACCOUNT WHERE AccountType = 'Savings' AND Balance > 5000
SELECT * FROM ACCOUNT WHERE OpenDate IN ('2023-07-30', '2023-09-01', '2023-09-05')
SELECT * FROM ACCOUNT WHERE AccountNumber BETWEEN 1009 AND 1020;
SELECT COUNT(AccountNumber), AccountType FROM ACCOUNT GROUP BY AccountType
SELECT * FROM ACCOUNT ORDER BY LastTransactionDate DESC
SELECT * FROM ACCOUNT ORDER BY OpenDate ASC

SELECT AccountType, SUM(Balance) AS Total_Balance FROM ACCOUNT GROUP BY AccountType;
SELECT AccountType, MAX(Balance) AS Maximum_Balance FROM ACCOUNT GROUP BY AccountType;
SELECT AccountType, MIN(Balance) AS Minimum_Balance FROM ACCOUNT GROUP BY AccountType;         
SELECT AccountType, AVG(Balance) AS Average_Balance FROM ACCOUNT GROUP BY AccountType;       
SELECT AccountType, COUNT(*) Total_Accounts FROM ACCOUNT GROUP BY AccountType;  

UPDATE ACCOUNT SET AccountType = 'Checking' WHERE AccountNumber = 1038
DELETE FROM ACCOUNT WHERE AccountNumber = 1040
DROP TABLE ACCOUNT

--                     *******************************************
--                     ***    CREATING TABLE OF TRANSACTION    ***
--                     *******************************************

CREATE TABLE TBL_TRANSACTION(
    TransactionID INT PRIMARY KEY,
    AccountNumber INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2),
    TransactionType VARCHAR(20),
    Remarks VARCHAR(255),
    FOREIGN KEY (AccountNumber) REFERENCES ACCOUNT(AccountNumber)
);

--                     ***********************************************
--                     ***   CREATING PROCEDURE OF TRANSACTIONS    ***
--                     ***********************************************

GO
CREATE PROCEDURE Insert_Into_Transaction
	(@TransactionID INT, @AccountNumber INT, @TransactionDate DATE, @Amount DECIMAL(10, 2), 
	@TransactionType VARCHAR(20), @Remarks VARCHAR(255))
AS
BEGIN
    INSERT INTO TBL_TRANSACTION VALUES
	(@TransactionID, @AccountNumber, @TransactionDate, @Amount, @TransactionType, @Remarks)
END

--                     *******************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF TRANSACTIONS    ***
--                     *******************************************************

-- TransactionID, AccountNumber, TransactionDate, Amount, TransactionType, Remarks

EXEC Insert_Into_Transaction 1, 1001, '2023-07-01', 50.00, 'Deposit', 'Initial deposit';
EXEC Insert_Into_Transaction 2, 1002, '2023-07-02', 75.25, 'Withdrawal', 'ATM withdrawal';
EXEC Insert_Into_Transaction 3, 1003, '2023-07-03', 100.00, 'Deposit', 'Salary';
EXEC Insert_Into_Transaction 4, 1001, '2023-07-05', 20.50, 'Withdrawal', 'Grocery shopping';
EXEC Insert_Into_Transaction 5, 1004, '2023-07-08', 200.00, 'Deposit', 'Gift';
EXEC Insert_Into_Transaction 6, 1002, '2023-07-12', 150.75, 'Deposit', 'Cash deposit';
EXEC Insert_Into_Transaction 7, 1003, '2023-07-15', 50.00, 'Withdrawal', 'Dinner';
EXEC Insert_Into_Transaction 8, 1004, '2023-07-20', 300.00, 'Deposit', 'Bonus';
EXEC Insert_Into_Transaction 9, 1001, '2023-07-25', 40.00, 'Withdrawal', 'Movie tickets';
EXEC Insert_Into_Transaction 10, 1013, '2023-07-28', 80.00, 'Deposit', 'Online payment';
EXEC Insert_Into_Transaction 11, 1012, '2023-07-30', 90.00, 'Withdrawal', 'Online shopping';
EXEC Insert_Into_Transaction 12, 1013, '2023-07-30', 200.00, 'Deposit', 'Gift';
EXEC Insert_Into_Transaction 13, 1014, '2023-07-30', 120.50, 'Withdrawal', 'Clothing';
EXEC Insert_Into_Transaction 14, 1011, '2023-07-30', 75.00, 'Deposit', 'Refund';
EXEC Insert_Into_Transaction 15, 1012, '2023-07-30', 40.25, 'Deposit', 'Cash deposit';
EXEC Insert_Into_Transaction 16, 1013, '2023-07-30', 60.00, 'Withdrawal', 'Coffee';
EXEC Insert_Into_Transaction 17, 1014, '2023-07-30', 150.00, 'Deposit', 'Bonus';
EXEC Insert_Into_Transaction 18, 1011, '2023-07-30', 25.50, 'Withdrawal', 'Lunch';
EXEC Insert_Into_Transaction 19, 1013, '2023-07-30', 100.00, 'Deposit', 'Transfer';
EXEC Insert_Into_Transaction 20, 1014, '2023-07-30', 50.75, 'Withdrawal', 'Grocery shopping';
EXEC Insert_Into_Transaction 21, 1021, '2023-07-30', 30.00, 'Withdrawal', 'Dinner';
EXEC Insert_Into_Transaction 22, 1022, '2023-07-30', 120.50, 'Deposit', 'Gift';
EXEC Insert_Into_Transaction 23, 1023, '2023-07-30', 50.00, 'Withdrawal', 'Shopping';
EXEC Insert_Into_Transaction 24, 1024, '2023-07-30', 85.75, 'Deposit', 'Refund';
EXEC Insert_Into_Transaction 25, 1021, '2023-07-30', 70.25, 'Deposit', 'Cash deposit';
EXEC Insert_Into_Transaction 26, 1022, '2023-07-30', 25.00, 'Withdrawal', 'Snacks';
EXEC Insert_Into_Transaction 27, 1023, '2023-07-30', 90.00, 'Deposit', 'Bonus';
EXEC Insert_Into_Transaction 28, 1024, '2023-07-30', 40.50, 'Withdrawal', 'Gas';
EXEC Insert_Into_Transaction 29, 1021, '2023-07-30', 110.00, 'Deposit', 'Transfer';
EXEC Insert_Into_Transaction 30, 1022, '2023-07-30', 60.75, 'Withdrawal', 'Movie tickets';
EXEC Insert_Into_Transaction 31, 1033, '2023-07-30', 70.00, 'Deposit', 'Gift';
EXEC Insert_Into_Transaction 32, 1034, '2023-07-30', 25.50, 'Withdrawal', 'Coffee';
EXEC Insert_Into_Transaction 33, 1031, '2023-07-30', 90.00, 'Deposit', 'Bonus';
EXEC Insert_Into_Transaction 34, 1032, '2023-07-30', 80.75, 'Withdrawal', 'Lunch';
EXEC Insert_Into_Transaction 35, 1033, '2023-07-30', 120.25, 'Deposit', 'Refund';
EXEC Insert_Into_Transaction 36, 1034, '2023-07-30', 50.00, 'Withdrawal', 'Grocery shopping';
EXEC Insert_Into_Transaction 37, 1031, '2023-07-30', 200.00, 'Deposit', 'Transfer';
EXEC Insert_Into_Transaction 38, 1032, '2023-07-30', 30.50, 'Withdrawal', 'Snacks';
EXEC Insert_Into_Transaction 39, 1033, '2023-07-30', 75.00, 'Deposit', 'Online payment';
EXEC Insert_Into_Transaction 40, 1034, '2023-07-30', 100.75, 'Withdrawal', 'Gas';

SELECT * FROM TBL_TRANSACTION;
SELECT * FROM TBL_TRANSACTION ORDER BY TransactionID;
SELECT * FROM TBL_TRANSACTION ORDER BY TransactionDate DESC;
SELECT * FROM TBL_TRANSACTION ORDER BY Remarks ASC;
SELECT DISTINCT TransactionType FROM TBL_TRANSACTION;

SELECT * FROM TBL_TRANSACTION WHERE Remarks like 'g%';
SELECT * FROM TBL_TRANSACTION WHERE Remarks like '%t';

SELECT TransactionType, SUM(Amount) AS TotalAmount FROM TBL_TRANSACTION GROUP BY TransactionType;
SELECT TransactionType, MAX(Amount) AS HighestAmount FROM TBL_TRANSACTION GROUP BY TransactionType;           
SELECT TransactionType, MIN(Amount) AS MinimumAmount FROM TBL_TRANSACTION GROUP BY TransactionType;          
SELECT TransactionType, AVG(Amount) AS AverageAmount FROM TBL_TRANSACTION GROUP BY TransactionType;  
SELECT TransactionType, COUNT(*) AS TransactionCount FROM TBL_TRANSACTION GROUP BY TransactionType;

UPDATE TBL_TRANSACTION SET Remarks = 'Thofa' WHERE Remarks = 'Gift'
DELETE FROM TBL_TRANSACTION WHERE Remarks = 'Dinner'
DROP TABLE TBL_TRANSACTION

--                     *******************************************
--                     ***       CREATING TABLE OF LOAN        ***
--                     *******************************************

CREATE TABLE LOAN (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(50),
    LoanAmount DECIMAL(18, 2),
    InterestRate DECIMAL(5, 2),
    TermMonths INT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER (CustomerID)
);

GO
CREATE PROCEDURE Insert_Into_Loan(
    @LoanID INT, @CustomerID INT, @LoanType VARCHAR(50), @LoanAmount DECIMAL(18, 2), @InterestRate DECIMAL(5, 2),
	@TermMonths INT, @StartDate DATE, @EndDate DATE, @Status VARCHAR(50))
AS
BEGIN
    INSERT INTO LOAN VALUES 
	(@LoanID, @CustomerID, @LoanType, @LoanAmount, @InterestRate, @TermMonths, @StartDate, @EndDate, @Status);
END;

--                     ***********************************************
--                     ***   ENTERING DATA TO PROCEDURE OF LOAN    ***
--                     ***********************************************

-- LoanID, CustomerID, LoanType, LoanAmount, InterestRate, TermMonths, StartDate, EndDate, Status
 
EXEC Insert_Into_Loan 1, 1, 'Personal Loan', 5000.00, 5.25, 24, '2023-07-30', '2025-07-30', 'Active';
EXEC Insert_Into_Loan 2, 2, 'Auto Loan', 15000.00, 4.75, 48, '2023-07-30', '2027-07-30', 'Active';
EXEC Insert_Into_Loan 3, 3, 'Home Loan', 200000.00, 3.50, 240, '2023-07-30', '2043-07-30', 'Active';
EXEC Insert_Into_Loan 4, 4, 'Student Loan', 10000.00, 6.00, 60, '2023-07-30', '2028-07-30', 'Active';
EXEC Insert_Into_Loan 5, 5, 'Business Loan', 75000.00, 7.20, 36, '2023-07-30', '2026-07-30', 'Active';
EXEC Insert_Into_Loan 6, 6, 'Personal Loan', 8000.00, 5.50, 18, '2023-07-30', '2024-12-30', 'Active';
EXEC Insert_Into_Loan 7, 7, 'Auto Loan', 20000.00, 4.50, 60, '2023-07-30', '2028-07-30', 'Active';
EXEC Insert_Into_Loan 8, 8, 'Home Loan', 250000.00, 3.75, 360, '2023-07-30', '2053-07-30', 'Active';
EXEC Insert_Into_Loan 9, 9, 'Personal Loan', 3000.00, 6.75, 12, '2023-07-30', '2024-07-30', 'Active';
EXEC Insert_Into_Loan 10, 10, 'Business Loan', 100000.00, 8.00, 72, '2023-07-30', '2029-07-30', 'Active';
EXEC Insert_Into_Loan 11, 1, 'Auto Loan', 12000.00, 4.25, 36, '2023-07-30', '2026-07-30', 'Active';
EXEC Insert_Into_Loan 12, 22, 'Home Loan', 180000.00, 3.25, 240, '2023-07-30', '2043-07-30', 'Active';
EXEC Insert_Into_Loan 13, 23, 'Education Loan', 15000.00, 5.75, 60, '2023-07-30', '2028-07-30', 'Active';
EXEC Insert_Into_Loan 14, 24, 'Personal Loan', 6000.00, 6.50, 24, '2023-07-30', '2025-07-30', 'Active';
EXEC Insert_Into_Loan 15, 25, 'Auto Loan', 25000.00, 4.00, 48, '2023-07-30', '2027-07-30', 'Active';
EXEC Insert_Into_Loan 16, 26, 'Business Loan', 80000.00, 7.00, 36, '2023-07-30', '2026-07-30', 'Active';
EXEC Insert_Into_Loan 17, 27, 'Home Loan', 300000.00, 3.00, 360, '2023-07-30', '2053-07-30', 'Active';
EXEC Insert_Into_Loan 18, 28, 'Personal Loan', 4000.00, 6.25, 18, '2023-07-30', '2024-12-30', 'Active';
EXEC Insert_Into_Loan 19, 29, 'Auto Loan', 18000.00, 5.00, 60, '2023-07-30', '2028-07-30', 'Active';
EXEC Insert_Into_Loan 20, 30, 'Home Loan', 280000.00, 3.50, 240, '2023-07-30', '2043-07-30', 'Active';
EXEC Insert_Into_Loan 21, 31, 'Business Loan', 90000.00, 7.50, 72, '2023-07-30', '2029-07-30', 'Active';
EXEC Insert_Into_Loan 22, 32, 'Personal Loan', 7000.00, 5.75, 24, '2023-07-30', '2025-07-30', 'Active';
EXEC Insert_Into_Loan 23, 33, 'Auto Loan', 22000.00, 4.25, 48, '2023-07-30', '2027-07-30', 'Active';
EXEC Insert_Into_Loan 24, 34, 'Home Loan', 320000.00, 3.25, 240, '2023-07-30', '2043-07-30', 'Active';
EXEC Insert_Into_Loan 25, 35, 'Education Loan', 18000.00, 5.50, 60, '2023-07-30', '2028-07-30', 'Active';
EXEC Insert_Into_Loan 26, 36, 'Personal Loan', 4500.00, 6.75, 12, '2023-07-30', '2024-07-30', 'Active';
EXEC Insert_Into_Loan 27, 37, 'Business Loan', 110000.00, 8.00, 72, '2023-07-30', '2029-07-30', 'Active';
EXEC Insert_Into_Loan 28, 38, 'Auto Loan', 14000.00, 4.50, 36, '2023-07-30', '2026-07-30', 'Active';
EXEC Insert_Into_Loan 29, 39, 'Home Loan', 200000.00, 3.75, 360, '2023-07-30', '2053-07-30', 'Active';
EXEC Insert_Into_Loan 30, 40, 'Personal Loan', 3500.00, 6.50, 24, '2023-07-30', '2025-07-30', 'Active';
EXEC Insert_Into_Loan 31, 11, 'Auto Loan', 17000.00, 4.00, 48, '2023-07-30', '2027-07-30', 'Active';
EXEC Insert_Into_Loan 32, 12, 'Home Loan', 270000.00, 3.00, 360, '2023-07-30', '2053-07-30', 'Active';
EXEC Insert_Into_Loan 33, 13, 'Personal Loan', 5200.00, 6.25, 18, '2023-07-30', '2024-12-30', 'Active';
EXEC Insert_Into_Loan 34, 14, 'Auto Loan', 19000.00, 5.00, 60, '2023-07-30', '2028-07-30', 'Active';
EXEC Insert_Into_Loan 35, 15, 'Business Loan', 75000.00, 7.20, 36, '2023-07-30', '2026-07-30', 'Active';
EXEC Insert_Into_Loan 36, 16, 'Personal Loan', 8000.00, 5.50, 18, '2023-07-30', '2024-12-30', 'Active';
EXEC Insert_Into_Loan 37, 17, 'Auto Loan', 20000.00, 4.50, 60, '2023-07-30', '2028-07-30', 'Active';
EXEC Insert_Into_Loan 38, 18, 'Home Loan', 250000.00, 3.75, 360, '2023-07-30', '2053-07-30', 'Active';
EXEC Insert_Into_Loan 39, 19, 'Personal Loan', 3000.00, 6.75, 12, '2023-07-30', '2024-07-30', 'Active';
EXEC Insert_Into_Loan 40, 20, 'Business Loan', 100000.00, 8.00, 72, '2023-07-30', '2029-07-30', 'Active';

SELECT * FROM LOAN
SELECT * FROM LOAN WHERE LoanType = 'Home Loan' OR LoanType = 'Personal Loan' OR LoanType = 'Business Loan'
SELECT * FROM LOAN WHERE LoanType = 'Education Loan' AND LoanAmount > 10000
SELECT * FROM LOAN WHERE LoanType IN ('Auto Loan', 'Business Loan', 'Home Loan')
SELECT * FROM LOAN WHERE TermMonths BETWEEN 12 AND 40
SELECT COUNT(LoanID), LoanType FROM LOAN GROUP BY LoanType
SELECT * FROM LOAN ORDER BY LoanID
SELECT * FROM LOAN ORDER BY InterestRate DESC
SELECT * FROM LOAN ORDER BY LoanAmount ASC

SELECT LoanType, SUM(LoanAmount) AS Total_Loan_Amount FROM LOAN GROUP BY LoanType;
SELECT LoanType, MAX(LoanAmount) AS Highest_Loan FROM LOAN GROUP BY LoanType;
SELECT LoanType, MIN(LoanAmount) AS Minimum_Loan FROM LOAN GROUP BY LoanType;           
SELECT LoanType, AVG(LoanAmount) AS Average_Loan FROM LOAN GROUP BY LoanType;          
SELECT LoanType, COUNT(*) AS Total FROM LOAN GROUP BY LoanType;
  
UPDATE LOAN SET LoanType = 'Student Loan' WHERE LoanID = 25
DELETE FROM LOAN WHERE LoanID = 40
DROP TABLE LOAN

--                     *******************************************
--                     ***   CREATING TABLE OF LOAN PAYMENTS   ***
--                     *******************************************
CREATE TABLE LoanPayments (
    PaymentID INT PRIMARY KEY,
    LoanID INT,
    PaymentDate DATE,
    AmountPaid DECIMAL(10, 2),
    Remarks VARCHAR(255),
    FOREIGN KEY (LoanID) REFERENCES Loan (LoanID)
);

GO
CREATE PROCEDURE Insert_Into_LoanPayment(
    @PaymentID INT, @LoanID INT, @PaymentDate DATE, @AmountPaid DECIMAL(10, 2), @Remarks VARCHAR(255))
AS
BEGIN
    INSERT INTO LoanPayments VALUES (@PaymentID, @LoanID, @PaymentDate, @AmountPaid, @Remarks)
END;

--                     ********************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF LOAN PAYMENTS    ***
--                     ********************************************************


-- PaymentID, LoanID, PaymentDate, AmountPaid, Remarks

EXEC Insert_Into_LoanPayment 101, 1, '2023-07-01', 500.00, 'Payment for Loan 1';
EXEC Insert_Into_LoanPayment 102, 2, '2023-07-02', 600.00, 'Payment for Loan 2';
EXEC Insert_Into_LoanPayment 103, 3, '2023-07-03', 750.00, 'Payment for Loan 3';
EXEC Insert_Into_LoanPayment 104, 4, '2023-07-04', 800.00, 'Payment for Loan 4';
EXEC Insert_Into_LoanPayment 105, 5, '2023-07-05', 300.00, 'Payment for Loan 5';
EXEC Insert_Into_LoanPayment 106, 6, '2023-07-06', 350.00, 'Payment for Loan 6';
EXEC Insert_Into_LoanPayment 107, 7, '2023-07-07', 400.00, 'Payment for Loan 7';
EXEC Insert_Into_LoanPayment 108, 8, '2023-07-08', 450.00, 'Payment for Loan 8';
EXEC Insert_Into_LoanPayment 109, 9, '2023-07-09', 550.00, 'Payment for Loan 9';
EXEC Insert_Into_LoanPayment 110, 10, '2023-07-10', 600.00, 'Payment for Loan 10';
EXEC Insert_Into_LoanPayment 111, 11, '2023-07-11', 650.00, 'Payment for Loan 11';
EXEC Insert_Into_LoanPayment 112, 12, '2023-07-12', 700.00, 'Payment for Loan 12';
EXEC Insert_Into_LoanPayment 113, 13, '2023-07-13', 750.00, 'Payment for Loan 13';
EXEC Insert_Into_LoanPayment 114, 14, '2023-07-14', 800.00, 'Payment for Loan 14';
EXEC Insert_Into_LoanPayment 115, 15, '2023-07-15', 850.00, 'Payment for Loan 15';
EXEC Insert_Into_LoanPayment 116, 16, '2023-07-16', 900.00, 'Payment for Loan 16';
EXEC Insert_Into_LoanPayment 117, 17, '2023-07-17', 950.00, 'Payment for Loan 17';
EXEC Insert_Into_LoanPayment 118, 18, '2023-07-18', 1000.00, 'Payment for Loan 18';
EXEC Insert_Into_LoanPayment 119, 19, '2023-07-19', 1050.00, 'Payment for Loan 19';
EXEC Insert_Into_LoanPayment 120, 20, '2023-07-20', 1100.00, 'Payment for Loan 20';
EXEC Insert_Into_LoanPayment 121, 21, '2023-07-21', 1150.00, 'Payment for Loan 21';
EXEC Insert_Into_LoanPayment 122, 22, '2023-07-22', 1200.00, 'Payment for Loan 22';
EXEC Insert_Into_LoanPayment 123, 23, '2023-07-23', 1250.00, 'Payment for Loan 23';
EXEC Insert_Into_LoanPayment 124, 24, '2023-07-24', 1300.00, 'Payment for Loan 24';
EXEC Insert_Into_LoanPayment 125, 25, '2023-07-25', 1350.00, 'Payment for Loan 25';
EXEC Insert_Into_LoanPayment 126, 26, '2023-07-26', 1400.00, 'Payment for Loan 26';
EXEC Insert_Into_LoanPayment 127, 27, '2023-07-27', 1450.00, 'Payment for Loan 27';
EXEC Insert_Into_LoanPayment 128, 28, '2023-07-28', 1500.00, 'Payment for Loan 28';
EXEC Insert_Into_LoanPayment 129, 29, '2023-07-29', 1550.00, 'Payment for Loan 29';
EXEC Insert_Into_LoanPayment 130, 30, '2023-07-30', 1600.00, 'Payment for Loan 30';
EXEC Insert_Into_LoanPayment 131, 31, '2023-07-31', 1650.00, 'Payment for Loan 31';
EXEC Insert_Into_LoanPayment 132, 32, '2023-08-01', 1700.00, 'Payment for Loan 32';
EXEC Insert_Into_LoanPayment 133, 33, '2023-08-02', 1750.00, 'Payment for Loan 33';
EXEC Insert_Into_LoanPayment 134, 34, '2023-08-03', 1800.00, 'Payment for Loan 34';
EXEC Insert_Into_LoanPayment 135, 35, '2023-08-04', 1850.00, 'Payment for Loan 35';
EXEC Insert_Into_LoanPayment 136, 36, '2023-08-05', 1900.00, 'Payment for Loan 36';
EXEC Insert_Into_LoanPayment 137, 37, '2023-08-06', 1950.00, 'Payment for Loan 37';
EXEC Insert_Into_LoanPayment 138, 38, '2023-08-07', 2000.00, 'Payment for Loan 38';
EXEC Insert_Into_LoanPayment 139, 39, '2023-08-08', 2050.00, 'Payment for Loan 39';
EXEC Insert_Into_LoanPayment 140, 40, '2023-08-09', 2100.00, 'Payment for Loan 40';

SELECT * FROM LoanPayments
SELECT * FROM LoanPayments WHERE AmountPaid > 1000 AND AmountPaid < 2000
SELECT * FROM LoanPayments WHERE AmountPaid BETWEEN 1000 AND 2000
SELECT COUNT(PaymentID), PaymentDate FROM LoanPayments GROUP BY PaymentDate
SELECT * FROM LoanPayments ORDER BY PaymentID
SELECT * FROM LoanPayments ORDER BY PaymentDate DESC
SELECT * FROM LoanPayments ORDER BY AmountPaid ASC

SELECT PaymentDate, SUM(AmountPaid) AS Total_Amount_Paid FROM LoanPayments GROUP BY PaymentDate;
SELECT PaymentDate, MAX(AmountPaid) AS Highest_Paid_Amount FROM LoanPayments GROUP BY PaymentDate;
SELECT PaymentDate, MIN(AmountPaid) AS Minimum_Paid_Amount FROM LoanPayments GROUP BY PaymentDate;           
SELECT PaymentDate, AVG(AmountPaid) AS Average_Paid_Amount FROM LoanPayments GROUP BY PaymentDate;            

UPDATE LoanPayments SET AmountPaid = 2200.00 WHERE AmountPaid = 2100.00
DELETE FROM LoanPayments WHERE LoanID = 140
DROP TABLE LoanPayments

--                     *******************************************
--                     ***     CREATING TABLE OF EMPLOYEE      ***
--                     *******************************************

CREATE TABLE EMPLOYEE (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    Designation VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

GO
CREATE PROCEDURE Insert_Into_Employee(
    @EmployeeID INT, @FirstName VARCHAR(50), @LastName VARCHAR(50), @DateOfBirth DATE, @Address VARCHAR(100), @Phone VARCHAR(20),
	@Email VARCHAR(100), @Designation VARCHAR(50), @Salary DECIMAL(10, 2), @HireDate DATE)
AS
BEGIN
    INSERT INTO EMPLOYEE
    VALUES (@EmployeeID, @FirstName, @LastName, @DateOfBirth, @Address, @Phone, @Email, @Designation, @Salary, @HireDate);
END;


--                     ***************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF EMPLOYEE    ***
--                     ***************************************************


-- EmployeeID, FirstName, LastName, DateOfBirth, Address, Phone, Email, Designation, Salary, HireDate

EXEC Insert_Into_Employee 2001, 'Ali', 'Khan', '1985-05-10', '123 Street, Lahore, Pakistan', '+92 300 1234567', 'ali.khan@example.com', 'Manager', 80000.00, '2021-01-15';
EXEC Insert_Into_Employee 2002, 'Fatima', 'Ahmed', '1990-09-20', '456 Avenue, Karachi, Pakistan', '+92 321 9876543', 'fatima.ahmed@example.com', 'Engineer', 60000.00, '2022-03-05';
EXEC Insert_Into_Employee 2003, 'Muhammad', 'Hussain', '1988-12-03', '789 Road, Islamabad, Pakistan', '+92 333 7778889', 'muhammad.hussain@example.com', 'Analyst', 55000.00, '2020-11-12';
EXEC Insert_Into_Employee 2004, 'Ayesha', 'Raza', '1995-04-18', '567 Crescent, Lahore, Pakistan', '+92 321 5559999', 'ayesha.raza@example.com', 'Developer', 65000.00, '2023-02-28';
EXEC Insert_Into_Employee 2005, 'Omar', 'Ali', '1983-07-22', '111 Lane, Karachi, Pakistan', '+92 345 2223334', 'omar.ali@example.com', 'Designer', 70000.00, '2019-09-20';
EXEC Insert_Into_Employee 2006, 'Zainab', 'Khan', '1992-11-29', '222 Street, Rawalpindi, Pakistan', '+92 333 1112225', 'zainab.khan@example.com', 'HR Manager', 75000.00, '2022-06-10';
EXEC Insert_Into_Employee 2007, 'Bilal', 'Akram', '1989-08-14', '333 Avenue, Lahore, Pakistan', '+92 312 9998887', 'bilal.akram@example.com', 'Supervisor', 60000.00, '2021-03-01';
EXEC Insert_Into_Employee 2008, 'Aisha', 'Nawaz', '1991-06-25', '444 Road, Karachi, Pakistan', '+92 321 4445556', 'aisha.nawaz@example.com', 'Engineer', 65000.00, '2023-04-15';
EXEC Insert_Into_Employee 2009, 'Hamza', 'Rasheed', '1993-02-08', '555 Street, Islamabad, Pakistan', '+92 333 2226668', 'hamza.rasheed@example.com', 'Developer', 70000.00, '2020-12-05';
EXEC Insert_Into_Employee 2010, 'Sana', 'Ali', '1997-01-11', '777 Lane, Lahore, Pakistan', '+92 300 9991110', 'sana.ali@example.com', 'Analyst', 55000.00, '2022-08-18';
EXEC Insert_Into_Employee 2011, 'Ahmed', 'Malik', '1987-10-05', '888 Road, Karachi, Pakistan', '+92 311 7774443', 'ahmed.malik@example.com', 'Manager', 80000.00, '2021-07-25';
EXEC Insert_Into_Employee 2012, 'Zoya', 'Haider', '1994-03-19', '999 Avenue, Rawalpindi, Pakistan', '+92 333 5557774', 'zoya.haider@example.com', 'Designer', 70000.00, '2019-11-30';
EXEC Insert_Into_Employee 2013, 'Sohaib', 'Farooq', '1996-12-16', '111 Street, Lahore, Pakistan', '+92 321 6668882', 'sohaib.farooq@example.com', 'Developer', 65000.00, '2023-01-05';
EXEC Insert_Into_Employee 2014, 'Hina', 'Iqbal', '1992-09-27', '222 Road, Karachi, Pakistan', '+92 322 3334442', 'hina.iqbal@example.com', 'Engineer', 60000.00, '2022-07-12';
EXEC Insert_Into_Employee 2015, 'Imran', 'Khan', '1986-04-08', '333 Crescent, Islamabad, Pakistan', '+92 300 4445551', 'imran.khan@example.com', 'Supervisor', 70000.00, '2020-10-01';
EXEC Insert_Into_Employee 2016, 'Amna', 'Mansoor', '1984-08-30', '444 Lane, Lahore, Pakistan', '+92 311 7772220', 'amna.mansoor@example.com', 'Analyst', 55000.00, '2021-05-15';
EXEC Insert_Into_Employee 2017, 'Yousuf', 'Raza', '1998-05-21', '555 Avenue, Karachi, Pakistan', '+92 321 8889998', 'yousuf.raza@example.com', 'HR Manager', 75000.00, '2022-09-20';
EXEC Insert_Into_Employee 2018, 'Anam', 'Akhtar', '1991-02-17', '777 Road, Rawalpindi, Pakistan', '+92 333 1115557', 'anam.akhtar@example.com', 'Developer', 65000.00, '2019-12-05';
EXEC Insert_Into_Employee 2019, 'Usman', 'Hameed', '1989-11-04', '111 Street, Lahore, Pakistan', '+92 300 9994446', 'usman.hameed@example.com', 'Designer', 70000.00, '2023-03-10';
EXEC Insert_Into_Employee 2020, 'Sadia', 'Aslam', '1993-07-13', '222 Lane, Karachi, Pakistan', '+92 321 5552229', 'sadia.aslam@example.com', 'Manager', 80000.00, '2020-06-25';
EXEC Insert_Into_Employee 2021, 'Ibrahim', 'Malik', '1990-03-10', '123 Street, Lahore, Pakistan', '+92 300 1112223', 'ibrahim.malik@example.com', 'Developer', 65000.00, '2021-01-15';
EXEC Insert_Into_Employee 2022, 'Sara', 'Hassan', '1995-07-12', '456 Avenue, Karachi, Pakistan', '+92 321 8885554', 'sara.hassan@example.com', 'Analyst', 55000.00, '2022-03-05';
EXEC Insert_Into_Employee 2023, 'Nasir', 'Amin', '1988-11-18', '789 Road, Islamabad, Pakistan', '+92 333 7779996', 'nasir.amin@example.com', 'HR Manager', 75000.00, '2020-11-12';
EXEC Insert_Into_Employee 2024, 'Amina', 'Raza', '1993-09-28', '567 Crescent, Lahore, Pakistan', '+92 321 6668885', 'amina.raza@example.com', 'Designer', 70000.00, '2019-09-20';
EXEC Insert_Into_Employee 2025, 'Hassan', 'Saeed', '1986-12-25', '111 Lane, Karachi, Pakistan', '+92 345 5556662', 'hassan.saeed@example.com', 'Engineer', 60000.00, '2023-02-28';
EXEC Insert_Into_Employee 2026, 'Sadia', 'Khan', '1992-10-19', '222 Street, Rawalpindi, Pakistan', '+92 333 4446669', 'sadia.khan@example.com', 'Supervisor', 70000.00, '2022-06-10';
EXEC Insert_Into_Employee 2027, 'Bilal', 'Iqbal', '1989-05-14', '333 Avenue, Lahore, Pakistan', '+92 312 7774445', 'bilal.iqbal@example.com', 'Manager', 80000.00, '2021-03-01';
EXEC Insert_Into_Employee 2028, 'Ayesha', 'Akhtar', '1991-03-21', '444 Road, Karachi, Pakistan', '+92 321 3338884', 'ayesha.akhtar@example.com', 'Developer', 65000.00, '2023-04-15';
EXEC Insert_Into_Employee 2029, 'Omar', 'Haider', '1994-06-09', '555 Street, Islamabad, Pakistan', '+92 333 2226667', 'omar.haider@example.com', 'Analyst', 55000.00, '2020-12-05';
EXEC Insert_Into_Employee 2030, 'Sana', 'Rasheed', '1998-01-31', '777 Lane, Lahore, Pakistan', '+92 300 9991112', 'sana.rasheed@example.com', 'HR Manager', 75000.00, '2022-08-18';
EXEC Insert_Into_Employee 2031, 'Ahmed', 'Khan', '1987-07-05', '888 Road, Karachi, Pakistan', '+92 311 7774444', 'ahmed.khan@example.com', 'Designer', 70000.00, '2021-07-25';
EXEC Insert_Into_Employee 2032, 'Zoya', 'Nawaz', '1995-05-17', '999 Avenue, Rawalpindi, Pakistan', '+92 333 5557773', 'zoya.nawaz@example.com', 'Developer', 65000.00, '2019-11-30';
EXEC Insert_Into_Employee 2033, 'Yousuf', 'Farooq', '1997-12-02', '111 Street, Lahore, Pakistan', '+92 321 6668881', 'yousuf.farooq@example.com', 'Engineer', 60000.00, '2023-01-05';
EXEC Insert_Into_Employee 2034, 'Amina', 'Iqbal', '1992-07-28', '222 Road, Karachi, Pakistan', '+92 322 3334443', 'amina.iqbal@example.com', 'Supervisor', 70000.00, '2022-07-12';
EXEC Insert_Into_Employee 2035, 'Imran', 'Akram', '1986-08-09', '333 Crescent, Islamabad, Pakistan', '+92 300 4445550', 'imran.akram@example.com', 'Manager', 80000.00, '2020-10-01';
EXEC Insert_Into_Employee 2036, 'Bisma', 'Rasool', '1984-06-20', '444 Lane, Lahore, Pakistan', '+92 311 7772229', 'bisma.rasool@example.com', 'Analyst', 55000.00, '2021-05-15';
EXEC Insert_Into_Employee 2037, 'Younus', 'Aslam', '1998-03-07', '555 Avenue, Karachi, Pakistan', '+92 321 8889997', 'younus.aslam@example.com', 'HR Manager', 75000.00, '2022-09-20';
EXEC Insert_Into_Employee 2038, 'Hira', 'Haider', '1991-02-09', '777 Road, Rawalpindi, Pakistan', '+92 333 1115556', 'hira.haider@example.com', 'Developer', 65000.00, '2019-12-05';
EXEC Insert_Into_Employee 2039, 'Usman', 'Malik', '1989-12-21', '111 Street, Lahore, Pakistan', '+92 300 9994445', 'usman.malik@example.com', 'Designer', 70000.00, '2023-03-10';
EXEC Insert_Into_Employee 2040, 'Saba', 'Aslam', '1993-11-15', '222 Lane, Karachi, Pakistan', '+92 321 5552228', 'saba.aslam@example.com', 'Manager', 80000.00, '2020-06-25';


SELECT * FROM EMPLOYEE
SELECT * FROM EMPLOYEE WHERE Salary > 10000.00 AND Salary < 20000.00
SELECT * FROM EMPLOYEE WHERE Salary BETWEEN 30000.00 AND 65000.00
SELECT COUNT(EmployeeID), Designation FROM EMPLOYEE GROUP BY Designation
SELECT * FROM EMPLOYEE ORDER BY EmployeeID
SELECT * FROM EMPLOYEE ORDER BY HireDate DESC
SELECT * FROM EMPLOYEE ORDER BY DateOfBirth ASC

SELECT Designation, SUM(Salary) AS Total_Salary FROM EMPLOYEE GROUP BY Designation;
SELECT Designation, MAX(Salary) AS Highest_Salary FROM EMPLOYEE GROUP BY Designation;
SELECT Designation, MIN(Salary) AS Minimum_Salary FROM EMPLOYEE GROUP BY Designation;           
SELECT Designation, AVG(Salary) AS Average_Salary FROM EMPLOYEE GROUP BY Designation;          
SELECT Designation, COUNT(*) AS Total_Emp_Salary FROM EMPLOYEE GROUP BY Designation;
  
UPDATE EMPLOYEE SET FirstName = 'Amjad' WHERE EmployeeID = 2001
DELETE FROM EMPLOYEE WHERE EmployeeID = 2040
DROP TABLE EMPLOYEE

--                     ********************************************
--                     ***  CREATING TABLE OF EMPLOYEE ACCOUNT  ***
--                     ********************************************

CREATE TABLE EMPLOYEE_ACCOUNT (
    EmployeeID INT,
    AccountNumber INT,
    PRIMARY KEY (EmployeeID, AccountNumber),
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE (EmployeeID),
    FOREIGN KEY (AccountNumber) REFERENCES ACCOUNT (AccountNumber)
);

GO
CREATE PROCEDURE Insert_Into_EmployeeAccount
	(@EmployeeID INT, @AccountNumber INT)
AS
BEGIN
    INSERT INTO EMPLOYEE_ACCOUNT
    VALUES (@EmployeeID, @AccountNumber)
    
END;

--                     **********************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF EMPLOYEE ACCOUNT   ***
--                     **********************************************************

 -- EmployeeID, AccountNumber
EXEC Insert_Into_EmployeeAccount 2001, 1001;
EXEC Insert_Into_EmployeeAccount 2002, 1002;
EXEC Insert_Into_EmployeeAccount 2003, 1003;
EXEC Insert_Into_EmployeeAccount 2004, 1004;
EXEC Insert_Into_EmployeeAccount 2005, 1005;
EXEC Insert_Into_EmployeeAccount 2006, 1006;
EXEC Insert_Into_EmployeeAccount 2007, 1007;
EXEC Insert_Into_EmployeeAccount 2008, 1008;
EXEC Insert_Into_EmployeeAccount 2009, 1009;
EXEC Insert_Into_EmployeeAccount 2010, 1010;
EXEC Insert_Into_EmployeeAccount 2011, 1011;
EXEC Insert_Into_EmployeeAccount 2012, 1012;
EXEC Insert_Into_EmployeeAccount 2013, 1013;
EXEC Insert_Into_EmployeeAccount 2014, 1014;
EXEC Insert_Into_EmployeeAccount 2015, 1015;
EXEC Insert_Into_EmployeeAccount 2016, 1016;
EXEC Insert_Into_EmployeeAccount 2017, 1017;
EXEC Insert_Into_EmployeeAccount 2018, 1018;
EXEC Insert_Into_EmployeeAccount 2019, 1019;
EXEC Insert_Into_EmployeeAccount 2020, 1020;
EXEC Insert_Into_EmployeeAccount 2021, 1021;
EXEC Insert_Into_EmployeeAccount 2022, 1022;
EXEC Insert_Into_EmployeeAccount 2023, 1023;
EXEC Insert_Into_EmployeeAccount 2024, 1024;
EXEC Insert_Into_EmployeeAccount 2025, 1025;
EXEC Insert_Into_EmployeeAccount 2026, 1026;
EXEC Insert_Into_EmployeeAccount 2027, 1027;
EXEC Insert_Into_EmployeeAccount 2028, 1028;
EXEC Insert_Into_EmployeeAccount 2029, 1029;
EXEC Insert_Into_EmployeeAccount 2030, 1030;
EXEC Insert_Into_EmployeeAccount 2031, 1031;
EXEC Insert_Into_EmployeeAccount 2032, 1032;
EXEC Insert_Into_EmployeeAccount 2033, 1033;
EXEC Insert_Into_EmployeeAccount 2034, 1034;
EXEC Insert_Into_EmployeeAccount 2035, 1035;
EXEC Insert_Into_EmployeeAccount 2036, 1036;
EXEC Insert_Into_EmployeeAccount 2037, 1037;
EXEC Insert_Into_EmployeeAccount 2038, 1038;
EXEC Insert_Into_EmployeeAccount 2039, 1039;
EXEC Insert_Into_EmployeeAccount 2040, 1040;

SELECT * FROM EMPLOYEE_ACCOUNT
SELECT * FROM EMPLOYEE_ACCOUNT WHERE AccountNumber BETWEEN 1030 AND 1040
SELECT * FROM EMPLOYEE_ACCOUNT ORDER BY EmployeeID
SELECT * FROM EMPLOYEE_ACCOUNT ORDER BY AccountNumber DESC
SELECT * FROM EMPLOYEE_ACCOUNT ORDER BY AccountNumber ASC
  
UPDATE EMPLOYEE_ACCOUNT SET EmployeeID = 2041 WHERE EmployeeID = 2040
DELETE FROM EMPLOYEE_ACCOUNT WHERE EmployeeID = 2039
DROP TABLE EMPLOYEE_ACCOUNT

--                     *******************************************
--                     ***      CREATING TABLE OF Manager      ***
--                     *******************************************
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    Address VARCHAR(200)
);

GO
CREATE PROCEDURE Insert_Into_Manager
    @ManagerID INT, @FirstName VARCHAR(50), @LastName VARCHAR(50), @Email VARCHAR(100), @Phone VARCHAR(20), @HireDate DATE,
	@Department VARCHAR(50), @Salary DECIMAL(10, 2), @Address VARCHAR(200)
AS
BEGIN
    INSERT INTO Manager
    VALUES (@ManagerID, @FirstName, @LastName, @Email, @Phone, @HireDate, @Department, @Salary, @Address)
END;


--                     **************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF Manager    ***
--                     **************************************************


-- ManagerID, FirstName, LastName, Email, Phone, HireDate, Department, Salary, Address
EXEC Insert_Into_Manager 101, 'Ali', 'Khan', 'ali.khan@example.com', '0312-1234567', '2023-01-01', 'HR', 50000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 102, 'Fatima', 'Ahmed', 'fatima.ahmed@example.com', '0333-9876543', '2023-02-15', 'IT', 55000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 103, 'Muhammad', 'Iqbal', 'muhammad.iqbal@example.com', '0300-7654321', '2023-03-10', 'Finance', 52000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 104, 'Ayesha', 'Ali', 'ayesha.ali@example.com', '0312-9876543', '2023-04-05', 'Marketing', 48000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 105, 'Hassan', 'Malik', 'hassan.malik@example.com', '0345-1234567', '2023-05-20', 'Operations', 53000.00, 'Multan, Pakistan';
EXEC Insert_Into_Manager 106, 'Sana', 'Raza', 'sana.raza@example.com', '0333-7654321', '2023-06-15', 'Sales', 51000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 107, 'Ahmed', 'Hussain', 'ahmed.hussain@example.com', '0321-9876543', '2023-07-10', 'IT', 48000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 108, 'Zainab', 'Abbas', 'zainab.abbas@example.com', '0300-1234567', '2023-08-01', 'Finance', 50000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 109, 'Abdullah', 'Qureshi', 'abdullah.qureshi@example.com', '0345-7654321', '2023-09-15', 'HR', 55000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 110, 'Ayesha', 'Khan', 'ayesha.khan@example.com', '0312-9876543', '2023-10-10', 'Marketing', 51000.00, 'Multan, Pakistan';
EXEC Insert_Into_Manager 111, 'Sami', 'Ali', 'sami.ali@example.com', '0333-1234567', '2023-11-05', 'Sales', 48000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 112, 'Amna', 'Hassan', 'amna.hassan@example.com', '0321-7654321', '2023-12-20', 'IT', 50000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 113, 'Imran', 'Raza', 'imran.raza@example.com', '0300-9876543', '2024-01-15', 'Finance', 54000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 114, 'Hina', 'Malik', 'hina.malik@example.com', '0345-1234567', '2024-02-10', 'Marketing', 51000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 115, 'Noman', 'Iqbal', 'noman.iqbal@example.com', '0312-7654321', '2024-03-05', 'HR', 52000.00, 'Multan, Pakistan';
EXEC Insert_Into_Manager 116, 'Sana', 'Ahmed', 'sana.ahmed@example.com', '0333-9876543', '2024-04-20', 'Operations', 50000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 117, 'Saad', 'Khan', 'saad.khan@example.com', '0321-1234567', '2024-05-15', 'Sales', 53000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 118, 'Aisha', 'Hussain', 'aisha.hussain@example.com', '0300-7654321', '2024-06-10', 'HR', 48000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 119, 'Usman', 'Abbas', 'usman.abbas@example.com', '0345-1234567', '2024-07-05', 'Marketing', 55000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 120, 'Maria', 'Qureshi', 'maria.qureshi@example.com', '0312-9876543', '2024-08-20', 'Operations', 52000.00, 'Multan, Pakistan';
EXEC Insert_Into_Manager 121, 'Ahmad', 'Ali', 'ahmad.ali@example.com', '0333-1234567', '2024-09-01', 'Finance', 50000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 122, 'Sadia', 'Hassan', 'sadia.hassan@example.com', '0321-7654321', '2024-10-15', 'HR', 54000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 123, 'Faisal', 'Khan', 'faisal.khan@example.com', '0300-9876543', '2024-11-10', 'Operations', 51000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 124, 'Hira', 'Raza', 'hira.raza@example.com', '0345-1234567', '2024-12-05', 'Sales', 53000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 125, 'Usman', 'Malik', 'usman.malik@example.com', '0312-7654321', '2025-01-20', 'IT', 48000.00, 'Multan, Pakistan';
EXEC Insert_Into_Manager 126, 'Sana', 'Ahmed', 'sana.ahmed@example.com', '0333-9876543', '2025-02-15', 'Marketing', 50000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 127, 'Asad', 'Hussain', 'asad.hussain@example.com', '0321-1234567', '2025-03-10', 'Operations', 54000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 128, 'Ayesha', 'Abbas', 'ayesha.abbas@example.com', '0300-7654321', '2025-04-01', 'HR', 51000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 129, 'Bilal', 'Qureshi', 'bilal.qureshi@example.com', '0345-9876543', '2025-05-15', 'IT', 53000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 130, 'Maria', 'Khan', 'maria.khan@example.com', '0312-1234567', '2025-06-10', 'Sales', 48000.00, 'Multan, Pakistan';
EXEC Insert_Into_Manager 131, 'Zain', 'Raza', 'zain.raza@example.com', '0333-7654321', '2025-07-05', 'Finance', 50000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 132, 'Sara', 'Hassan', 'sara.hassan@example.com', '0321-9876543', '2025-08-20', 'Marketing', 52000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 133, 'Ahmed', 'Ali', 'ahmed.ali@example.com', '0300-1234567', '2025-09-15', 'Operations', 54000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 134, 'Kiran', 'Malik', 'kiran.malik@example.com', '0345-7654321', '2025-10-10', 'HR', 48000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 135, 'Saad', 'Raza', 'saad.raza@example.com', '0312-9876543', '2025-11-05', 'IT', 50000.00, 'Multan, Pakistan';
EXEC Insert_Into_Manager 136, 'Sana', 'Hussain', 'sana.hussain@example.com', '0333-1234567', '2025-12-20', 'Sales', 52000.00, 'Karachi, Pakistan';
EXEC Insert_Into_Manager 137, 'Zoya', 'Ahmed', 'zoya.ahmed@example.com', '0321-7654321', '2026-01-15', 'Finance', 54000.00, 'Lahore, Pakistan';
EXEC Insert_Into_Manager 138, 'Ali', 'Abbas', 'ali.abbas@example.com', '0300-9876543', '2026-02-10', 'Marketing', 51000.00, 'Islamabad, Pakistan';
EXEC Insert_Into_Manager 139, 'Saim', 'Qureshi', 'saim.qureshi@example.com', '0345-1234567', '2026-03-05', 'Operations', 53000.00, 'Peshawar, Pakistan';
EXEC Insert_Into_Manager 140, 'Saba', 'Khan', 'saba.khan@example.com', '0312-7654321', '2026-04-20', 'HR', 48000.00, 'Multan, Pakistan';

SELECT * FROM Manager
SELECT * FROM Manager WHERE Salary > 10000.00 AND Salary < 20000.00
SELECT * FROM Manager WHERE Salary BETWEEN 10000.00 AND 50000.00
SELECT COUNT(ManagerID), HireDate FROM Manager GROUP BY HireDate
SELECT * FROM Manager ORDER BY ManagerID
SELECT * FROM Manager ORDER BY HireDate DESC
SELECT * FROM Manager ORDER BY FirstName ASC

SELECT Department, SUM(Salary) AS Total_Salary FROM Manager GROUP BY Department;
SELECT Department, MAX(Salary) AS Highest_Salary FROM Manager GROUP BY Department;
SELECT Department, MIN(Salary) AS Minimum_Salary FROM Manager GROUP BY Department;           
SELECT Department, AVG(Salary) AS Average_Salary FROM Manager GROUP BY Department;          
SELECT Department, COUNT(*) AS Total_Emp_Salary FROM Manager GROUP BY Department;
  
UPDATE Manager SET FirstName = 'Amjad' WHERE ManagerID = 1
DELETE FROM Manager WHERE ManagerID = 140
DROP TABLE Manager

--                     *******************************************
--                     ***    CREATING TABLE OF BANK BRANCE    ***
--                     *******************************************

CREATE TABLE BANK_BRANCH (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    Address VARCHAR(200),
    Phone VARCHAR(20),
    ManagerID INT,
    CONSTRAINT FK_BankBranch_Manager FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);

GO 
CREATE PROCEDURE InsertBankBranch (
    @BranchID INT, @BranchName VARCHAR(100), @Address VARCHAR(200), @Phone VARCHAR(20), @ManagerID INT)
AS
BEGIN
    INSERT INTO BANK_BRANCH
    VALUES (@BranchID, @BranchName, @Address, @Phone, @ManagerID)
END;


--                     ******************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF BANK BRANCE    ***
--                     ******************************************************

-- BranchID, BranchName, Address, Phone, ManagerID

EXEC InsertBankBranch 1, 'Branch 1', 'Address 1, Karachi, Pakistan', '021-1234567', 101;
EXEC InsertBankBranch 2, 'Branch 2', 'Address 2, Lahore, Pakistan', '042-9876543', 102;
EXEC InsertBankBranch 3, 'Branch 3', 'Address 3, Islamabad, Pakistan', '051-7654321', 103;
EXEC InsertBankBranch 4, 'Branch 4', 'Address 4, Peshawar, Pakistan', '091-9876543', 104;
EXEC InsertBankBranch 5, 'Branch 5', 'Address 5, Multan, Pakistan', '061-1234567', 105;
EXEC InsertBankBranch 6, 'Branch 6', 'Address 6, Karachi, Pakistan', '021-9876543', 106;
EXEC InsertBankBranch 7, 'Branch 7', 'Address 7, Lahore, Pakistan', '042-7654321', 107;
EXEC InsertBankBranch 8, 'Branch 8', 'Address 8, Islamabad, Pakistan', '051-1234567', 108;
EXEC InsertBankBranch 9, 'Branch 9', 'Address 9, Peshawar, Pakistan', '091-7654321', 109;
EXEC InsertBankBranch 10, 'Branch 10', 'Address 10, Multan, Pakistan', '061-9876543', 110;
EXEC InsertBankBranch 11, 'Branch 11', 'Address 11, Karachi, Pakistan', '021-1234567', 111;
EXEC InsertBankBranch 12, 'Branch 12', 'Address 12, Lahore, Pakistan', '042-9876543', 112;
EXEC InsertBankBranch 13, 'Branch 13', 'Address 13, Islamabad, Pakistan', '051-7654321', 113;
EXEC InsertBankBranch 14, 'Branch 14', 'Address 14, Peshawar, Pakistan', '091-9876543', 114;
EXEC InsertBankBranch 15, 'Branch 15', 'Address 15, Multan, Pakistan', '061-1234567', 115;
EXEC InsertBankBranch 16, 'Branch 16', 'Address 16, Karachi, Pakistan', '021-9876543', 116;
EXEC InsertBankBranch 17, 'Branch 17', 'Address 17, Lahore, Pakistan', '042-7654321', 117;
EXEC InsertBankBranch 18, 'Branch 18', 'Address 18, Islamabad, Pakistan', '051-1234567', 118;
EXEC InsertBankBranch 19, 'Branch 19', 'Address 19, Peshawar, Pakistan', '091-7654321', 119;
EXEC InsertBankBranch 20, 'Branch 20', 'Address 20, Multan, Pakistan', '061-9876543', 120;
EXEC InsertBankBranch 21, 'Branch 21', 'Address 21, Karachi, Pakistan', '021-1234567', 121;
EXEC InsertBankBranch 22, 'Branch 22', 'Address 22, Lahore, Pakistan', '042-9876543', 122;
EXEC InsertBankBranch 23, 'Branch 23', 'Address 23, Islamabad, Pakistan', '051-7654321', 123;
EXEC InsertBankBranch 24, 'Branch 24', 'Address 24, Peshawar, Pakistan', '091-9876543', 124;
EXEC InsertBankBranch 25, 'Branch 25', 'Address 25, Multan, Pakistan', '061-1234567', 125;
EXEC InsertBankBranch 26, 'Branch 26', 'Address 26, Karachi, Pakistan', '021-9876543', 126;
EXEC InsertBankBranch 27, 'Branch 27', 'Address 27, Lahore, Pakistan', '042-7654321', 127;
EXEC InsertBankBranch 28, 'Branch 28', 'Address 28, Islamabad, Pakistan', '051-1234567', 128;
EXEC InsertBankBranch 29, 'Branch 29', 'Address 29, Peshawar, Pakistan', '091-7654321', 129;
EXEC InsertBankBranch 30, 'Branch 30', 'Address 30, Multan, Pakistan', '061-9876543', 130;
EXEC InsertBankBranch 31, 'Branch 31', 'Address 31, Karachi, Pakistan', '021-1234567', 131;
EXEC InsertBankBranch 32, 'Branch 32', 'Address 32, Lahore, Pakistan', '042-9876543', 132;
EXEC InsertBankBranch 33, 'Branch 33', 'Address 33, Islamabad, Pakistan', '051-7654321', 133;
EXEC InsertBankBranch 34, 'Branch 34', 'Address 34, Peshawar, Pakistan', '091-9876543', 134;
EXEC InsertBankBranch 35, 'Branch 35', 'Address 35, Multan, Pakistan', '061-1234567', 135;
EXEC InsertBankBranch 36, 'Branch 36', 'Address 36, Karachi, Pakistan', '021-9876543', 136;
EXEC InsertBankBranch 37, 'Branch 37', 'Address 37, Lahore, Pakistan', '042-7654321', 137;
EXEC InsertBankBranch 38, 'Branch 38', 'Address 38, Islamabad, Pakistan', '051-1234567', 138;
EXEC InsertBankBranch 39, 'Branch 39', 'Address 39, Peshawar, Pakistan', '091-7654321', 139;
EXEC InsertBankBranch 40, 'Branch 40', 'Address 40, Multan, Pakistan', '061-9876543', 140;

SELECT * FROM BANK_BRANCH
SELECT * FROM BANK_BRANCH WHERE BranchID BETWEEN 37 AND 39
SELECT COUNT(BranchID), Address FROM BANK_BRANCH GROUP BY Address
SELECT * FROM BANK_BRANCH ORDER BY BranchID

  
UPDATE BANK_BRANCH SET BranchName = 'Branch 50' WHERE BranchName = 'Branch 40'
DELETE FROM BANK_BRANCH WHERE BranchName = 'Branch 30'
DROP TABLE BANK_BRANCH


--                     *******************************************
--                     ***      CREATING TABLE OF DEPOSIT      ***
--                     *******************************************

CREATE TABLE DEPOSIT (
    DepositID INT PRIMARY KEY,
    CustomerID INT,
    AccountNumber INT,
    Amount DECIMAL(10, 2),
    DepositDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (AccountNumber) REFERENCES ACCOUNT(AccountNumber)
);

GO
CREATE OR ALTER PROCEDURE Insert_Into_Deposit
    @DepositID INT,
    @CustomerID INT,
    @AccountNumber INT,
    @Amount DECIMAL(10, 2),
    @DepositDate DATE
AS
BEGIN
    INSERT INTO DEPOSIT
    VALUES (@DepositID, @CustomerID, @AccountNumber, @Amount, @DepositDate);

END;



--                     **************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF DEPOSIT    ***
--                     **************************************************

-- DepositID, CustomerID, AccountNumber, Amount, DepositDate)

EXEC Insert_Into_Deposit 5001, 1, 1001, 1000.00, '2023-07-30';
EXEC Insert_Into_Deposit 5002, 2, 1002, 1500.50, '2023-07-30';
EXEC Insert_Into_Deposit 5003, 3, 1003, 2000.75, '2023-07-30';
EXEC Insert_Into_Deposit 5004, 4, 1004, 500.25, '2023-07-30';
EXEC Insert_Into_Deposit 5005, 5, 1005, 3000.00, '2023-07-30';
EXEC Insert_Into_Deposit 5006, 6, 1006, 750.50, '2023-07-30';
EXEC Insert_Into_Deposit 5007, 7, 1007, 2200.75, '2023-07-30';
EXEC Insert_Into_Deposit 5008, 8, 1008, 850.25, '2023-07-30';
EXEC Insert_Into_Deposit 5009, 9, 1009, 4300.00, '2023-07-30';
EXEC Insert_Into_Deposit 5010, 10, 1010, 1200.50, '2023-07-30';
EXEC Insert_Into_Deposit 5011, 11, 1011, 1800.75, '2023-07-30';
EXEC Insert_Into_Deposit 5012, 12, 1012, 920.25, '2023-07-30';
EXEC Insert_Into_Deposit 5013, 13, 1013, 2500.00, '2023-07-30';
EXEC Insert_Into_Deposit 5014, 14, 1014, 670.50, '2023-07-30';
EXEC Insert_Into_Deposit 5015, 15, 1015, 3000.75, '2023-07-30';
EXEC Insert_Into_Deposit 5016, 16, 1016, 1150.25, '2023-07-30';
EXEC Insert_Into_Deposit 5017, 17, 1017, 5100.00, '2023-07-30';
EXEC Insert_Into_Deposit 5018, 18, 1018, 900.50, '2023-07-30';
EXEC Insert_Into_Deposit 5019, 19, 1019, 2900.75, '2023-07-30';
EXEC Insert_Into_Deposit 5020, 20, 1020, 1600.25, '2023-07-30';
EXEC Insert_Into_Deposit 5021, 21, 1001, 1800.00, '2023-07-30';
EXEC Insert_Into_Deposit 5022, 22, 1002, 2700.50, '2023-07-30';
EXEC Insert_Into_Deposit 5023, 23, 1003, 3200.75, '2023-07-30';
EXEC Insert_Into_Deposit 5024, 24, 1004, 700.25, '2023-07-30';
EXEC Insert_Into_Deposit 5025, 25, 1005, 4000.00, '2023-07-30';
EXEC Insert_Into_Deposit 5026, 26, 1006, 950.50, '2023-07-30';
EXEC Insert_Into_Deposit 5027, 27, 1007, 2400.75, '2023-07-30';
EXEC Insert_Into_Deposit 5028, 28, 1008, 650.25, '2023-07-30';
EXEC Insert_Into_Deposit 5029, 29, 1009, 3800.00, '2023-07-30';
EXEC Insert_Into_Deposit 5030, 30, 1010, 1100.50, '2023-07-30';
EXEC Insert_Into_Deposit 5031, 31, 1011, 1400.75, '2023-07-30';
EXEC Insert_Into_Deposit 5032, 32, 1012, 720.25, '2023-07-30';
EXEC Insert_Into_Deposit 5033, 33, 1013, 2700.00, '2023-07-30';
EXEC Insert_Into_Deposit 5034, 34, 1014, 770.50, '2023-07-30';
EXEC Insert_Into_Deposit 5035, 35, 1015, 3500.75, '2023-07-30';
EXEC Insert_Into_Deposit 5036, 36, 1016, 1050.25, '2023-07-30';
EXEC Insert_Into_Deposit 5037, 37, 1017, 4900.00, '2023-07-30';
EXEC Insert_Into_Deposit 5038, 38, 1018, 800.50, '2023-07-30';
EXEC Insert_Into_Deposit 5039, 39, 1019, 3400.75, '2023-07-30';
EXEC Insert_Into_Deposit 5040, 40, 1020, 1900.25, '2023-07-30';

SELECT * FROM DEPOSIT
SELECT * FROM DEPOSIT WHERE Amount > 800.00 AND Amount <4000.00
SELECT * FROM DEPOSIT WHERE Amount BETWEEN 1000.00 AND 3000.00
SELECT * FROM DEPOSIT ORDER BY DepositID
SELECT * FROM DEPOSIT ORDER BY DepositDate DESC
SELECT * FROM DEPOSIT ORDER BY DepositDate ASC

SELECT DepositDate, SUM(Amount) AS Total_Amount FROM DEPOSIT GROUP BY DepositDate;
SELECT DepositDate, MAX(Amount) AS Highest_Amount FROM DEPOSIT GROUP BY DepositDate;
SELECT DepositDate, MIN(Amount) AS Minimum_Amount FROM DEPOSIT GROUP BY DepositDate;           
SELECT DepositDate, AVG(Amount) AS Average_Amount FROM DEPOSIT GROUP BY DepositDate;          
  
UPDATE DEPOSIT SET Amount = 2000.50 WHERE DepositID = 5040
DELETE FROM DEPOSIT WHERE DepositID = 5040
DROP TABLE DEPOSIT

--                     *******************************************
--                     ***    CREATING TABLE OF WITHDRAWAL     ***
--                     *******************************************

CREATE TABLE WITHDRAWAL (
    WithdrawalID INT PRIMARY KEY,
    CustomerID INT,
    AccountNumber INT,
    Amount DECIMAL(10, 2),
    WithdrawalDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
    FOREIGN KEY (AccountNumber) REFERENCES ACCOUNT(AccountNumber)
); 

GO
CREATE PROCEDURE Insert_Into_Withdrawal
    (@WithdrawalID INT, @CustomerID INT, @AccountNumber INT, @Amount DECIMAL(10, 2), @WithdrawalDate DATE)
AS
BEGIN
    INSERT INTO WITHDRAWAL
    VALUES (@WithdrawalID, @CustomerID, @AccountNumber, @Amount, @WithdrawalDate);
END;


--                     ****************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF WITHDRAWAL   ***
--                     ****************************************************

-- WithdrawalID, CustomerID, AccountNumber, Amount, WithdrawalDate

EXEC Insert_Into_Withdrawal 001, 1, 1001, 500.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 002, 2, 1002, 200.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 003, 3, 1003, 1000.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 004, 4, 1004, 300.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 005, 5, 1005, 1500.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 006, 6, 1006, 800.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 007, 7, 1007, 250.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 008, 8, 1008, 750.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 009, 9, 1009, 400.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 010, 10, 1010, 600.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 011, 11, 1011, 1200.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 012, 12, 1012, 100.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 013, 13, 1013, 800.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 014, 14, 1014, 900.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 015, 15, 1015, 450.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 016, 16, 1016, 350.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 017, 17, 1017, 700.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 018, 18, 1018, 2500.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 019, 19, 1019, 1300.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 020, 20, 1020, 1800.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 021, 21, 1021, 500.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 022, 22, 1022, 200.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 023, 23, 1023, 1000.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 024, 24, 1024, 300.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 025, 25, 1025, 1500.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 026, 26, 1026, 800.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 027, 27, 1027, 250.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 028, 28, 1028, 750.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 029, 29, 1029, 400.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 030, 30, 1030, 600.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 031, 31, 1031, 1200.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 032, 32, 1032, 100.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 033, 33, 1033, 800.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 034, 34, 1034, 900.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 035, 35, 1035, 450.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 036, 36, 1036, 350.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 037, 37, 1037, 700.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 038, 38, 1038, 2500.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 039, 39, 1039, 1300.00, '2023-07-30';
EXEC Insert_Into_Withdrawal 040, 40, 1040, 1800.00, '2023-07-30';

SELECT * FROM WITHDRAWAL
SELECT * FROM WITHDRAWAL WHERE Amount > 800.00 AND Amount <1000.00
SELECT * FROM WITHDRAWAL WHERE Amount BETWEEN 100.00 AND 600.00
SELECT COUNT(WithdrawalID), WithdrawalDate FROM WITHDRAWAL GROUP BY WithdrawalDate
SELECT * FROM WITHDRAWAL ORDER BY WithdrawalID
SELECT * FROM WITHDRAWAL ORDER BY WithdrawalID DESC
SELECT * FROM WITHDRAWAL ORDER BY WithdrawalID ASC

SELECT WithdrawalDate, SUM(Amount) AS Total_Amount FROM WITHDRAWAL GROUP BY WithdrawalDate;
SELECT WithdrawalDate, MAX(Amount) AS Highest_Amount FROM WITHDRAWAL GROUP BY WithdrawalDate;
SELECT WithdrawalDate, MIN(Amount) AS Minimum_Amount FROM WITHDRAWAL GROUP BY WithdrawalDate;           
SELECT WithdrawalDate, AVG(Amount) AS Average_Amount FROM WITHDRAWAL GROUP BY WithdrawalDate;          
  
UPDATE WITHDRAWAL SET Amount = 2000.00 WHERE WithdrawalID = 001
DELETE FROM WITHDRAWAL WHERE WithdrawalID = 040
DROP TABLE WITHDRAWAL

--                     *******************************************
--                     ***        CREATING TABLE OF TAX        ***
--                     *******************************************

CREATE TABLE TAX (
   TaxID INT PRIMARY KEY,
   AccountNumber INT,
   TaxAmount DECIMAL(10, 2),
   TaxDate DATE,
   FOREIGN KEY (AccountNumber) REFERENCES ACCOUNT(AccountNumber)
);

GO
CREATE PROCEDURE Insert_Into_TaxData
	(@TaxID INT, @AccountNumber INT, @TaxAmount DECIMAL(10, 2), @TaxDate DATE)
AS
BEGIN
   INSERT INTO TAX
   VALUES (@TaxID, @AccountNumber, @TaxAmount, @TaxDate);
END;



--                     *********************************************
--                     ***   ENTERING DATA TO PROCEDURE OF TAX   ***
--                     *********************************************


--TaxID, AccountNumber, TaxAmount, TaxDate
 
EXEC Insert_Into_TaxData 0011, 1001, 250.50, '2023-07-30';
EXEC Insert_Into_TaxData 0012, 1002, 180.25, '2023-07-29';
EXEC Insert_Into_TaxData 0013, 1003, 350.75, '2023-07-28';
EXEC Insert_Into_TaxData 0014, 1004, 420.60, '2023-07-27';
EXEC Insert_Into_TaxData 0015, 1005, 300.00, '2023-07-26';
EXEC Insert_Into_TaxData 0016, 1006, 150.80, '2023-07-25';
EXEC Insert_Into_TaxData 0017, 1007, 270.90, '2023-07-24';
EXEC Insert_Into_TaxData 0018, 1008, 190.40, '2023-07-23';
EXEC Insert_Into_TaxData 0019, 1009, 310.20, '2023-07-22';
EXEC Insert_Into_TaxData 0020, 1010, 280.75, '2023-07-21';
EXEC Insert_Into_TaxData 0021, 1011, 400.10, '2023-07-20';
EXEC Insert_Into_TaxData 0022, 1012, 220.30, '2023-07-19';
EXEC Insert_Into_TaxData 0023, 1013, 180.50, '2023-07-18';
EXEC Insert_Into_TaxData 0024, 1014, 330.90, '2023-07-17';
EXEC Insert_Into_TaxData 0025, 1015, 260.70, '2023-07-16';
EXEC Insert_Into_TaxData 0026, 1016, 150.25, '2023-07-15';
EXEC Insert_Into_TaxData 0027, 1017, 290.80, '2023-07-14';
EXEC Insert_Into_TaxData 0028, 1018, 210.00, '2023-07-13';
EXEC Insert_Into_TaxData 0029, 1019, 320.40, '2023-07-12';
EXEC Insert_Into_TaxData 0030, 1020, 350.00, '2023-07-11';
EXEC Insert_Into_TaxData 0031, 1021, 250.50, '2023-07-30';
EXEC Insert_Into_TaxData 0032, 1022, 180.25, '2023-07-29';
EXEC Insert_Into_TaxData 0033, 1023, 350.75, '2023-07-28';
EXEC Insert_Into_TaxData 0034, 1024, 420.60, '2023-07-27';
EXEC Insert_Into_TaxData 0035, 1025, 300.00, '2023-07-26';
EXEC Insert_Into_TaxData 0036, 1026, 150.80, '2023-07-25';
EXEC Insert_Into_TaxData 0037, 1027, 270.90, '2023-07-24';
EXEC Insert_Into_TaxData 0038, 1028, 190.40, '2023-07-23';
EXEC Insert_Into_TaxData 0039, 1029, 310.20, '2023-07-22';
EXEC Insert_Into_TaxData 0040, 1030, 280.75, '2023-07-21';
EXEC Insert_Into_TaxData 0041, 1031, 400.10, '2023-07-20';
EXEC Insert_Into_TaxData 0042, 1032, 220.30, '2023-07-19';
EXEC Insert_Into_TaxData 0043, 1033, 180.50, '2023-07-18';
EXEC Insert_Into_TaxData 0044, 1034, 330.90, '2023-07-17';
EXEC Insert_Into_TaxData 0045, 1035, 260.70, '2023-07-16';
EXEC Insert_Into_TaxData 0046, 1036, 150.25, '2023-07-15';
EXEC Insert_Into_TaxData 0047, 1037, 290.80, '2023-07-14';
EXEC Insert_Into_TaxData 0048, 1038, 210.00, '2023-07-13';
EXEC Insert_Into_TaxData 0049, 1039, 320.40, '2023-07-12';
EXEC Insert_Into_TaxData 0050, 1040, 350.00, '2023-07-11';

SELECT * FROM TAX
SELECT * FROM TAX WHERE TaxAmount > 200.00 AND TaxAmount <300.00
SELECT * FROM TAX WHERE TaxAmount BETWEEN 100.00 AND 250.00
SELECT COUNT(TaxID), TaxDate FROM TAX GROUP BY TaxDate
SELECT * FROM TAX ORDER BY TaxID
SELECT * FROM TAX ORDER BY TaxDate DESC
SELECT * FROM TAX ORDER BY TaxDate ASC

SELECT TaxDate, SUM(TaxAmount) AS Total_Tax FROM TAX GROUP BY TaxDate;
SELECT TaxDate, MAX(TaxAmount) AS Highest_Tax FROM TAX GROUP BY TaxDate;
SELECT TaxDate, MIN(TaxAmount) AS Minimum_Tax FROM TAX GROUP BY TaxDate;           
SELECT TaxDate, AVG(TaxAmount) AS Average_Tax FROM TAX GROUP BY TaxDate;          
  
UPDATE TAX SET TaxID = 0041 WHERE TaxID = 0040
DELETE FROM TAX WHERE TaxID = 0030
DROP TABLE TAX


--                     *******************************************
--                     ***       CREATING TABLE OF ATMs        ***
--                     *******************************************

CREATE TABLE ATMs (
    ATMID INT PRIMARY KEY,
    Location VARCHAR(100),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES BANK_BRANCH(BranchID)
);

GO
CREATE PROCEDURE Insert_Into_ATM
    @ATMID INT, @Location VARCHAR(100), @BranchID INT
AS
BEGIN
    INSERT INTO ATMs VALUES (@ATMID, @Location, @BranchID)
END;


--                     ***********************************************
--                     ***   ENTERING DATA TO PROCEDURE OF ATMs    ***
--                     ***********************************************

-- ATMID, Location, BranchID
EXEC Insert_Into_ATM 1, 'Address 1, Karachi, Pakistan', 1;
EXEC Insert_Into_ATM 2, 'Address 2, Lahore, Pakistan', 2;
EXEC Insert_Into_ATM 3, 'Address 3, Islamabad, Pakistan', 3;
EXEC Insert_Into_ATM 4, 'Address 4, Peshawar, Pakistan', 4;
EXEC Insert_Into_ATM 5, 'Address 5, Multan, Pakistan', 5;
EXEC Insert_Into_ATM 6, 'Address 6, Karachi, Pakistan', 6;
EXEC Insert_Into_ATM 7, 'Address 7, Lahore, Pakistan', 7;
EXEC Insert_Into_ATM 8, 'Address 8, Islamabad, Pakistan', 8;
EXEC Insert_Into_ATM 9, 'Address 9, Peshawar, Pakistan', 9;
EXEC Insert_Into_ATM 10, 'Address 10, Multan, Pakistan', 10;
EXEC Insert_Into_ATM 11, 'Address 11, Karachi, Pakistan', 11;
EXEC Insert_Into_ATM 12, 'Address 12, Lahore, Pakistan', 12;
EXEC Insert_Into_ATM 13, 'Address 13, Islamabad, Pakistan', 13;
EXEC Insert_Into_ATM 14, 'Address 14, Peshawar, Pakistan', 14;
EXEC Insert_Into_ATM 15, 'Address 15, Multan, Pakistan', 15;
EXEC Insert_Into_ATM 16, 'Address 16, Karachi, Pakistan', 16;
EXEC Insert_Into_ATM 17, 'Address 17, Lahore, Pakistan', 17;
EXEC Insert_Into_ATM 18, 'Address 18, Islamabad, Pakistan', 18;
EXEC Insert_Into_ATM 19, 'Address 19, Peshawar, Pakistan', 19;
EXEC Insert_Into_ATM 20, 'Address 20, Multan, Pakistan', 20;
EXEC Insert_Into_ATM 21, 'Address 21, Karachi, Pakistan', 21;
EXEC Insert_Into_ATM 22, 'Address 22, Lahore, Pakistan', 22;
EXEC Insert_Into_ATM 23, 'Address 23, Islamabad, Pakistan', 23;
EXEC Insert_Into_ATM 24, 'Address 24, Peshawar, Pakistan', 24;
EXEC Insert_Into_ATM 25, 'Address 25, Multan, Pakistan', 25;
EXEC Insert_Into_ATM 26, 'Address 26, Karachi, Pakistan', 26;
EXEC Insert_Into_ATM 27, 'Address 27, Lahore, Pakistan', 27;
EXEC Insert_Into_ATM 28, 'Address 28, Islamabad, Pakistan', 28;
EXEC Insert_Into_ATM 29, 'Address 29, Peshawar, Pakistan', 29;
EXEC Insert_Into_ATM 30, 'Address 30, Multan, Pakistan', 30;
EXEC Insert_Into_ATM 31, 'Address 31, Karachi, Pakistan', 31;
EXEC Insert_Into_ATM 32, 'Address 32, Lahore, Pakistan', 32;
EXEC Insert_Into_ATM 33, 'Address 33, Islamabad, Pakistan', 33;
EXEC Insert_Into_ATM 34, 'Address 34, Peshawar, Pakistan', 34;
EXEC Insert_Into_ATM 35, 'Address 35, Multan, Pakistan', 35;
EXEC Insert_Into_ATM 36, 'Address 36, Karachi, Pakistan', 36;
EXEC Insert_Into_ATM 37, 'Address 37, Lahore, Pakistan', 37;
EXEC Insert_Into_ATM 38, 'Address 38, Islamabad, Pakistan', 38;
EXEC Insert_Into_ATM 39, 'Address 39, Peshawar, Pakistan', 39;
EXEC Insert_Into_ATM 40, 'Address 40, Multan, Pakistan', 40;

SELECT * FROM ATMs
SELECT COUNT(ATMID) AS ATMS_PER_BRANCH, BranchID FROM ATMs GROUP BY BranchID
SELECT * FROM ATMs ORDER BY ATMID         
  
UPDATE ATMs SET ATMID = 41 WHERE ATMID = 40
DELETE FROM ATMs WHERE ATMID = 30
DROP TABLE ATMs

--                     ********************************************
--                     ***   CREATING TABLE OF ATMTransaction   ***
--                     ********************************************

CREATE TABLE ATMTransactions (
    ATMTransactionID INT PRIMARY KEY,
    ATMID INT,
    ATMTransactionDate DATETIME,
    ATMTransactionType VARCHAR(50),
    Amount DECIMAL(10, 2),
    FOREIGN KEY (ATMID) REFERENCES ATMs(ATMID)
);

GO
CREATE OR ALTER PROCEDURE Insert_Into_ATMTransaction
	(@ATMTransactionID INT, @ATMID INT, @ATMTransactionDate DATETIME, @ATMTransactionType VARCHAR(50), @Amount DECIMAL(10, 2))
AS
BEGIN
    INSERT INTO ATMTransactions
    VALUES (@ATMTransactionID, @ATMID, @ATMTransactionDate, @ATMTransactionType, @Amount)
END;


--                     *********************************************************
--                     ***   ENTERING DATA TO PROCEDURE OF ATMTransaction    ***
--                     *********************************************************


-- ATMTransactionID, ATMID, ATMTransactionDate, ATMTransactionType, Amount
EXEC Insert_Into_ATMTransaction 1001, 1, '2023-07-30 12:00:00', 'Deposit', 100.00;
EXEC Insert_Into_ATMTransaction 1002, 2, '2023-07-30 12:15:00', 'Withdrawal', 50.00;
EXEC Insert_Into_ATMTransaction 1003, 3, '2023-07-30 12:30:00', 'Transfer', 200.00;
EXEC Insert_Into_ATMTransaction 1004, 4, '2023-07-30 12:45:00', 'Deposit', 150.00;
EXEC Insert_Into_ATMTransaction 1005, 5, '2023-07-30 13:00:00', 'Withdrawal', 75.00;
EXEC Insert_Into_ATMTransaction 1006, 6, '2023-07-30 13:15:00', 'Deposit', 300.00;
EXEC Insert_Into_ATMTransaction 1007, 7, '2023-07-30 13:30:00', 'Transfer', 125.00;
EXEC Insert_Into_ATMTransaction 1008, 8, '2023-07-30 13:45:00', 'Withdrawal', 200.00;
EXEC Insert_Into_ATMTransaction 1009, 9, '2023-07-30 14:00:00', 'Deposit', 50.00;
EXEC Insert_Into_ATMTransaction 1010, 10, '2023-07-30 14:15:00', 'Transfer', 100.00;
EXEC Insert_Into_ATMTransaction 1011, 11, '2023-07-30 14:30:00', 'Withdrawal', 80.00;
EXEC Insert_Into_ATMTransaction 1012, 12, '2023-07-30 14:45:00', 'Deposit', 175.00;
EXEC Insert_Into_ATMTransaction 1013, 13, '2023-07-30 15:00:00', 'Transfer', 60.00;
EXEC Insert_Into_ATMTransaction 1014, 14, '2023-07-30 15:15:00', 'Withdrawal', 40.00;
EXEC Insert_Into_ATMTransaction 1015, 15, '2023-07-30 15:30:00', 'Deposit', 250.00;
EXEC Insert_Into_ATMTransaction 1016, 16, '2023-07-30 15:45:00', 'Transfer', 300.00;
EXEC Insert_Into_ATMTransaction 1017, 17, '2023-07-30 16:00:00', 'Withdrawal', 120.00;
EXEC Insert_Into_ATMTransaction 1018, 18, '2023-07-30 16:15:00', 'Deposit', 80.00;
EXEC Insert_Into_ATMTransaction 1019, 19, '2023-07-30 16:30:00', 'Transfer', 90.00;
EXEC Insert_Into_ATMTransaction 1020, 20, '2023-07-30 16:45:00', 'Withdrawal', 70.00;
EXEC Insert_Into_ATMTransaction 1021, 21, '2023-07-30 17:00:00', 'Deposit', 90.00;
EXEC Insert_Into_ATMTransaction 1022, 22, '2023-07-30 17:15:00', 'Withdrawal', 50.00;
EXEC Insert_Into_ATMTransaction 1023, 23, '2023-07-30 17:30:00', 'Transfer', 200.00;
EXEC Insert_Into_ATMTransaction 1024, 24, '2023-07-30 17:45:00', 'Deposit', 120.00;
EXEC Insert_Into_ATMTransaction 1025, 25, '2023-07-30 18:00:00', 'Withdrawal', 60.00;
EXEC Insert_Into_ATMTransaction 1026, 26, '2023-07-30 18:15:00', 'Deposit', 280.00;
EXEC Insert_Into_ATMTransaction 1027, 27, '2023-07-30 18:30:00', 'Transfer', 150.00;
EXEC Insert_Into_ATMTransaction 1028, 28, '2023-07-30 18:45:00', 'Withdrawal', 170.00;
EXEC Insert_Into_ATMTransaction 1029, 29, '2023-07-30 19:00:00', 'Deposit', 30.00;
EXEC Insert_Into_ATMTransaction 1030, 30, '2023-07-30 19:15:00', 'Transfer', 180.00;
EXEC Insert_Into_ATMTransaction 1031, 31, '2023-07-30 19:30:00', 'Withdrawal', 90.00;
EXEC Insert_Into_ATMTransaction 1032, 32, '2023-07-30 19:45:00', 'Deposit', 210.00;
EXEC Insert_Into_ATMTransaction 1033, 33, '2023-07-30 20:00:00', 'Transfer', 220.00;
EXEC Insert_Into_ATMTransaction 1034, 34, '2023-07-30 20:15:00', 'Withdrawal', 40.00;
EXEC Insert_Into_ATMTransaction 1035, 35, '2023-07-30 20:30:00', 'Deposit', 190.00;
EXEC Insert_Into_ATMTransaction 1036, 36, '2023-07-30 20:45:00', 'Transfer', 280.00;
EXEC Insert_Into_ATMTransaction 1037, 37, '2023-07-30 21:00:00', 'Withdrawal', 100.00;
EXEC Insert_Into_ATMTransaction 1038, 38, '2023-07-30 21:15:00', 'Deposit', 80.00;
EXEC Insert_Into_ATMTransaction 1039, 39, '2023-07-30 21:30:00', 'Transfer', 50.00;
EXEC Insert_Into_ATMTransaction 1040, 40, '2023-07-30 21:45:00', 'Withdrawal', 120.00;

SELECT * FROM ATMTransactions
SELECT * FROM ATMTransactions WHERE Amount > 50.00 AND Amount <200.00
SELECT * FROM ATMTransactions WHERE Amount BETWEEN 100.00 AND 250.00
SELECT COUNT(ATMTransactionID), ATMTransactionType FROM ATMTransactions GROUP BY ATMTransactionType
SELECT * FROM ATMTransactions ORDER BY ATMTransactionID

SELECT ATMTransactionType, SUM(Amount) AS Total_Tax FROM ATMTransactions GROUP BY ATMTransactionType;
SELECT ATMTransactionType, MAX(Amount) AS Highest_Tax FROM ATMTransactions GROUP BY ATMTransactionType;
SELECT ATMTransactionType, MIN(Amount) AS Minimum_Tax FROM ATMTransactions GROUP BY ATMTransactionType;           
SELECT ATMTransactionType, AVG(Amount) AS Average_Tax FROM ATMTransactions GROUP BY ATMTransactionType;          
  
UPDATE ATMTransactions SET ATMTransactionID = 0041 WHERE ATMTransactionID = 0040
DELETE FROM ATMTransactions WHERE ATMTransactionID = 0030
DROP TABLE ATMTransactions


-- Join CUSTOMER with ACCOUNT on CustomerID and Customer_ID
SELECT * 
FROM CUSTOMER
JOIN ACCOUNT ON CUSTOMER.CustomerID = ACCOUNT.Customer_ID;

-- Join CUSTOMER with ACCOUNT, TBL_TRANSACTION on CustomerID and AccountNumber
SELECT *
FROM CUSTOMER
JOIN ACCOUNT ON CUSTOMER.CustomerID = ACCOUNT.Customer_ID
JOIN TBL_TRANSACTION ON ACCOUNT.AccountNumber = TBL_TRANSACTION.AccountNumber;

-- Join CUSTOMER with LOAN on CustomerID
SELECT *
FROM CUSTOMER
JOIN LOAN ON CUSTOMER.CustomerID = LOAN.CustomerID;

-- Join CUSTOMER with LOAN and LoanPayments on CustomerID
SELECT *
FROM CUSTOMER
JOIN LOAN ON CUSTOMER.CustomerID = LOAN.CustomerID
JOIN LoanPayments ON LOAN.LoanID = LoanPayments.LoanID;

-- Join ACCOUNT with TBL_TRANSACTION on AccountNumber
SELECT *
FROM ACCOUNT
JOIN TBL_TRANSACTION ON ACCOUNT.AccountNumber = TBL_TRANSACTION.AccountNumber;

-- Join ACCOUNT with DEPOSIT on AccountNumber
SELECT *
FROM ACCOUNT
JOIN DEPOSIT ON ACCOUNT.AccountNumber = DEPOSIT.AccountNumber;

-- Join ACCOUNT with WITHDRAWAL on AccountNumber
SELECT *
FROM ACCOUNT
JOIN WITHDRAWAL ON ACCOUNT.AccountNumber = WITHDRAWAL.AccountNumber;

-- Join ACCOUNT with TAX on AccountNumber
SELECT *
FROM ACCOUNT
JOIN TAX ON ACCOUNT.AccountNumber = TAX.AccountNumber;

-- Join TBL_TRANSACTION with TAX on AccountNumber
SELECT *
FROM TBL_TRANSACTION
JOIN TAX ON TBL_TRANSACTION.AccountNumber = TAX.AccountNumber;

-- Join ACCOUNT with EMPLOYEE_ACCOUNT on AccountNumber
SELECT *
FROM ACCOUNT
JOIN EMPLOYEE_ACCOUNT ON ACCOUNT.AccountNumber = EMPLOYEE_ACCOUNT.AccountNumber;

-- Join CUSTOMER with DEPOSIT on CustomerID
SELECT *
FROM CUSTOMER
JOIN DEPOSIT ON CUSTOMER.CustomerID = DEPOSIT.CustomerID;

-- Join CUSTOMER with WITHDRAWAL on CustomerID
SELECT *
FROM CUSTOMER
JOIN WITHDRAWAL ON CUSTOMER.CustomerID = WITHDRAWAL.CustomerID;

-- Join ACCOUNT with EMPLOYEE_ACCOUNT and EMPLOYEE on AccountNumber and EmployeeID
SELECT *
FROM ACCOUNT
JOIN EMPLOYEE_ACCOUNT ON ACCOUNT.AccountNumber = EMPLOYEE_ACCOUNT.AccountNumber
JOIN EMPLOYEE ON EMPLOYEE_ACCOUNT.EmployeeID = EMPLOYEE.EmployeeID;

-- Join BANK_BRANCH with Manager on ManagerID
SELECT *
FROM BANK_BRANCH
JOIN Manager ON BANK_BRANCH.ManagerID = Manager.ManagerID;

-- Join DEPOSIT with CUSTOMER on CustomerID
SELECT *
FROM DEPOSIT
JOIN CUSTOMER ON DEPOSIT.CustomerID = CUSTOMER.CustomerID;

-- Join DEPOSIT with ACCOUNT on AccountNumber
SELECT *
FROM DEPOSIT
JOIN ACCOUNT ON DEPOSIT.AccountNumber = ACCOUNT.AccountNumber;

-- Join WITHDRAWAL with CUSTOMER on CustomerID
SELECT *
FROM WITHDRAWAL
JOIN CUSTOMER ON WITHDRAWAL.CustomerID = CUSTOMER.CustomerID;

-- Join WITHDRAWAL with ACCOUNT on AccountNumber
SELECT *
FROM WITHDRAWAL
JOIN ACCOUNT ON WITHDRAWAL.AccountNumber = ACCOUNT.AccountNumber;

-- Join TAX with ACCOUNT on AccountNumber
SELECT *
FROM TAX
JOIN ACCOUNT ON TAX.AccountNumber = ACCOUNT.AccountNumber;

-- Join TAX with TBL_TRANSACTION on AccountNumber
SELECT *
FROM TAX
JOIN TBL_TRANSACTION ON TAX.AccountNumber = TBL_TRANSACTION.AccountNumber;

-- Join EMPLOYEE_ACCOUNT with EMPLOYEE on EmployeeID
SELECT *
FROM EMPLOYEE_ACCOUNT
JOIN EMPLOYEE ON EMPLOYEE_ACCOUNT.EmployeeID = EMPLOYEE.EmployeeID;

-- Join EMPLOYEE_ACCOUNT with ACCOUNT on AccountNumber
SELECT *
FROM EMPLOYEE_ACCOUNT
JOIN ACCOUNT ON EMPLOYEE_ACCOUNT.AccountNumber = ACCOUNT.AccountNumber;

-- Join BANK_BRANCH with ATMs on BranchID
SELECT *
FROM BANK_BRANCH
JOIN ATMs ON BANK_BRANCH.BranchID = ATMs.BranchID;

-- Join ATMs with ATMTransactions on ATMID
SELECT *
FROM ATMs
JOIN ATMTransactions ON ATMs.ATMID = ATMTransactions.ATMID;

-- Join CUSTOMER with DEPOSIT, ACCOUNT on CustomerID and AccountNumber
SELECT *
FROM CUSTOMER
JOIN DEPOSIT ON CUSTOMER.CustomerID = DEPOSIT.CustomerID
JOIN ACCOUNT ON DEPOSIT.AccountNumber = ACCOUNT.AccountNumber;

-- Join CUSTOMER with WITHDRAWAL, ACCOUNT on CustomerID and AccountNumber
SELECT *
FROM CUSTOMER
JOIN WITHDRAWAL ON CUSTOMER.CustomerID = WITHDRAWAL.CustomerID
JOIN ACCOUNT ON WITHDRAWAL.AccountNumber = ACCOUNT.AccountNumber;

-- Join ACCOUNT with TBL_TRANSACTION, TAX, and CUSTOMER on AccountNumber and CustomerID
SELECT *
FROM ACCOUNT
JOIN TBL_TRANSACTION ON ACCOUNT.AccountNumber = TBL_TRANSACTION.AccountNumber
JOIN TAX ON ACCOUNT.AccountNumber = TAX.AccountNumber
JOIN CUSTOMER ON ACCOUNT.Customer_ID = CUSTOMER.CustomerID;

-- Join CUSTOMER with LOAN, LoanPayments, and ACCOUNT on CustomerID and AccountNumber
SELECT *
FROM CUSTOMER
JOIN LOAN ON CUSTOMER.CustomerID = LOAN.CustomerID
JOIN LoanPayments ON LOAN.LoanID = LoanPayments.LoanID
JOIN ACCOUNT ON CUSTOMER.CustomerID = ACCOUNT.Customer_ID;

-- Join EMPLOYEE_ACCOUNT with ACCOUNT, EMPLOYEE, and BANK_BRANCH on AccountNumber, EmployeeID, and BranchID
SELECT *
FROM EMPLOYEE_ACCOUNT
JOIN ACCOUNT ON EMPLOYEE_ACCOUNT.AccountNumber = ACCOUNT.AccountNumber
JOIN EMPLOYEE ON EMPLOYEE_ACCOUNT.EmployeeID = EMPLOYEE.EmployeeID
JOIN BANK_BRANCH ON ACCOUNT.Customer_ID = BANK_BRANCH.BranchID;

-- Join BANK_BRANCH with ATMs, ATMTransactions, and Manager on BranchID and ManagerID
SELECT *
FROM BANK_BRANCH
JOIN ATMs ON BANK_BRANCH.BranchID = ATMs.BranchID
JOIN ATMTransactions ON ATMs.ATMID = ATMTransactions.ATMID
JOIN Manager ON BANK_BRANCH.ManagerID = Manager.ManagerID;

SELECT c.Occupation, SUM(A.Balance) AS total_Balance
FROM CUSTOMER C
JOIN account A ON C.CustomerID = A.Customer_ID
GROUP BY C.Occupation;

SELECT CustomerID, SUM(AnnualIncome) As Total_income
FROM CUSTOMER 
GROUP BY CustomerID ORDER BY Total_income DESC 
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;

SELECT C.CustomerID, C.FirstName, C.LastName, C.Occupation, SUM(A.AnnualIncome) AS total_Balance
FROM CUSTOMER C
JOIN (
    SELECT Customer_ID, SUM(Balance) AS AnnualIncome
    FROM ACCOUNT
    GROUP BY Customer_ID
) A ON C.CustomerID = A.Customer_ID
GROUP BY C.CustomerID, C.Occupation, C.FirstName, C.LastName
ORDER BY total_Balance DESC
OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;

