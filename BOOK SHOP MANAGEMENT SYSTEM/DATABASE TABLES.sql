----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
------------------------ D A T A B A S E    T A B L E S---------------------------------------
----------------------------------------------------------------------------------------------

USE BOOK_SHOP_MANAGMENT_SYSTEM
									----->(B O O K     M A N A G E M E N T    S Y S T E M)<----- 


                                             ----->(TABLE NAME: PUBLISHER)<----- 
CREATE TABLE Publisher (
  PublisherID INT PRIMARY KEY,
  PublisherName VARCHAR(30),
  Publisher_Address VARCHAR(255),
  City VARCHAR(30),
  StateProvince VARCHAR(30),
  PostalCode VARCHAR(20),
  Country VARCHAR(30)
);

											 ----->(TABLE NAME: AUTHOR)<----- 
CREATE TABLE Author (
  AuthorID INT PRIMARY KEY,
  AuthorName VARCHAR(30),
  Bio TEXT
);

CREATE TABLE BookCategories (
  GenreID INT PRIMARY KEY,
  CategoryName VARCHAR(30)
);



								 ----->(TABLE NAME: BOOKINFO)<----- 
CREATE TABLE BookInfo(
  BookID INT PRIMARY KEY,
  Title VARCHAR(40) NOT NULL,
  ISBN VARCHAR(16) NOT NULL,
  GenreID INT,
  PublicationYear INT,
  Price DECIMAL(10, 2) NOT NULL,
  QuantityInStock INT,
  Description TEXT,
  PublisherID INT,
  AuthorID INT,
  FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID),
  FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
  FOREIGN KEY (GenreID) REFERENCES BookCategories(GenreID)
);



									 ----->(TABLE NAME: EMPLOYEE)<----- 
CREATE TABLE Employees(
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  Email VARCHAR(30) NOT NULL,
  PhoneNumber VARCHAR(25),
  Employee_Address VARCHAR(255),
  City VARCHAR(20),
  StateProvince VARCHAR(20),
  PostalCode VARCHAR(20),
  Country VARCHAR(30),
  JobTitle VARCHAR(30),
  Salary DECIMAL(10, 2)
);

									 ----->(TABLE NAME: SUPPLIER)<----- 
CREATE TABLE Supplier (
  SupplierID INT PRIMARY KEY,
  SupplierName VARCHAR(30),
  ContactPerson VARCHAR(15),
  Email VARCHAR(40),
  PhoneNumber VARCHAR(25),
  Supplier_Address VARCHAR(255),
  City VARCHAR(30),
  StateProvince VARCHAR(30),
  PostalCode VARCHAR(20),
  Country VARCHAR(30)
);

							         ----->(TABLE NAME: CUSTOMER)<----- 
CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(30) NOT NULL,
  LastName VARCHAR(30) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  PhoneNumber VARCHAR(25),
  Customer_Address VARCHAR(255),
  City VARCHAR(100),
  StateProvince VARCHAR(30),
  PostalCode VARCHAR(15),
  Country VARCHAR(30)
);

								     ----->(TABLE NAME: 1.1 ORDERHEAD)<----- 
CREATE TABLE OrderHeader (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

									 ----->(TABLE NAME: 1.2 ORDER PAYMENT)<----- 
CREATE TABLE OrderPayment (
  OrderID INT PRIMARY KEY,
  TotalAmount DECIMAL(10, 2),
  PaymentMethod VARCHAR(50),
  PaymentStatus VARCHAR(20),
  FOREIGN KEY (OrderID) REFERENCES OrderHeader(OrderID),
  
);
CREATE TABLE BookOrder(
	OrderID INT,
	BookID INT,
	Quantity INT,
	FOREIGN KEY (OrderID) REFERENCES OrderHeader (OrderID),
	FOREIGN KEY (BookID) REFERENCES BookInfo (BookID)

);

									 ----->(TABLE NAME: PURCHASE HEADER)<----- 
CREATE TABLE PurchaseHeader (
  PurchaseID INT PRIMARY KEY,
  SupplierID INT,
  PurchaseDate DATE,
  FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

								    ----->(TABLE NAME: PURCHASE ITEM)<----- 
CREATE TABLE PurchaseItem (
  PurchaseItemID INT PRIMARY KEY,
  PurchaseID INT,
  BookID INT,
  Quantity INT,
  UnitPrice DECIMAL(10, 2),
  FOREIGN KEY (PurchaseID) REFERENCES PurchaseHeader(PurchaseID),
  FOREIGN KEY (BookID) REFERENCES BookInfo(BookID)
);
