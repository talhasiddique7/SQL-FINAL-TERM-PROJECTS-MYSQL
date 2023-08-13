USE  BOOK_SHOP_MANAGMENT_SYSTEM

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
------------------------ D A T A B A S E    Q U E R I E S --------------------------------------
----------------------------------------------------------------------------------------------

---->1-Show BOOK INFO + BOOK CATEGORY:
CREATE PROCEDURE BOOK_DATA
AS
BEGIN

SELECT BookInfo.BookID,BookInfo.Title,BookInfo.Price,BookInfo.ISBN,BookInfo.PublicationYear,BookInfo.QuantityInStock,
Author.AuthorName,Publisher.PublisherName,BookCategories.CategoryName  FROM BookInfo inner join BookCategories
ON BookInfo.GenreID=BookCategories.GenreID inner join Author ON Author.AuthorID=BookInfo.AuthorID inner join Publisher ON
Publisher.PublisherID=BookInfo.PublisherID;

END;

exec BOOK_DATA

----->2-SHOW BOOK CATEGORIES AND AMOUNT Per BOOK IN EACH CATEGORY:
CREATE PROCEDURE Category_book_count
AS
BEGIN
SELECT BookCategories.GenreID,BookCategories.CategoryName,count(BookInfo.GenreID) AS Number_of_books FROM BookCategories LEFT JOIN 
BookInfo ON BookCategories.GenreID=BookInfo.GenreID GROUP BY BookCategories.GenreID,BookCategories.CategoryName; 
END;

exec Category_book_count


---->3-SHOW BOOK CATEGORY AND AMOUNT PER BOOK IN EACH CATEGORY with total price of each category:

SELECT BookCategories.GenreID,BookCategories.CategoryName,count(BookInfo.GenreID) AS Number_of_books,SUM(BookInfo.Price) AS Total_Price
 FROM BookCategories LEFT JOIN 
BookInfo ON BookCategories.GenreID=BookInfo.GenreID GROUP BY BookCategories.GenreID,BookCategories.CategoryName;

---->4-Show Total Number of books of  author:
CREATE PROCEDURE Author_books @name VARCHAR(30)
AS
BEGIN
SELECT Author.AuthorID,Author.AuthorName,count(BookInfo.BookID) AS Total_Books FROM Author inner JOIN BookInfo
ON Author.AuthorID=BookInfo.AuthorID GROUP BY Author.AuthorID,Author.AuthorName having Author.AuthorName=@name;
END;

exec Author_books 'Richard Turner'

---->5-counts book having same author and publisher:
SELECT Author.AuthorName,Publisher.PublisherName, COUNT(BookInfo.BookID) AS TOTAL from BookInfo inner join Author on
BookInfo.AuthorID=Author.AuthorID inner join Publisher on BookInfo.PublisherID=Publisher.PublisherID GROUP BY 
Author.AuthorName,Publisher.PublisherName;

---->6-Show Total Number of books of  Publisher:
CREATE PROCEDURE Publisher_books @name VARCHAR(30)
AS
BEGIN
SELECT Publisher.PublisherID,Publisher.PublisherName,count(BookInfo.BookID) AS Total_Books FROM Publisher inner JOIN BookInfo
ON Publisher.PublisherID=BookInfo.PublisherID GROUP BY Publisher.PublisherID,Publisher.PublisherName having Publisher.PublisherName=@name;
END;

exec Publisher_books 'Viking Press'

---->7-Display Number of books of  author:
CREATE PROCEDURE Author_books_name @name VARCHAR(30)
AS
BEGIN
SELECT Author.AuthorID,Author.AuthorName,BookInfo.Title  FROM Author inner JOIN BookInfo
ON Author.AuthorID=BookInfo.AuthorID  where Author.AuthorName=@name;
END;

exec Author_books_name 'Richard Turner'


---->8-Show Total Number of books of  Publisher:
CREATE PROCEDURE Publisher_books_name @name VARCHAR(30)
AS
BEGIN
SELECT Publisher.PublisherID,Publisher.PublisherName,BookInfo.Title FROM Publisher inner JOIN BookInfo
ON Publisher.PublisherID=BookInfo.PublisherID where Publisher.PublisherName=@name;
END;

exec Publisher_books_name 'Viking Press'



---->9-Display Author Name Having most Book in the Book Shop:
Select Top 1 Author.AuthorID,Author.AuthorName,count(BookInfo.BookID) AS TOTAL from Author inner join BookInfo 
on Author.AuthorID=BookInfo.AuthorID GROUP BY Author.AuthorID,Author.AuthorName Order by TOTAL DESC;

----->10-Display Publisher Name Having most Book in the Book Shop:

Select Top 1 Publisher.PublisherID,Publisher.PublisherName,count(BookInfo.BookID) AS TOTAL from Publisher inner join BookInfo 
on Publisher.PublisherID=BookInfo.PublisherID GROUP BY Publisher.PublisherID,Publisher.PublisherName Order by TOTAL DESC;

---->11-Show Book Name having highest Price:
SELECT TOP 1 BookInfo.BookID,BookInfo.Title,max(BookInfo.Price) as Highest_Price from BookInfo GROUP BY 
BookInfo.BookID,BookInfo.Title ORDER BY Highest_Price DESC;


---->12-Search Book in the book shop database by using book name:

CREATE PROCEDURE Search_Book @book_name VARCHAR(30)
AS
BEGIN

SELECT *from BookInfo where Title=@book_name
END;

exec Search_Book 'The Lord of the Rings'

--or:

---->13-Search book but You didnt know name"   (By Using any Wildcard Mask)

CREATE PROCEDURE unknown_book @name VARCHAR(30)
AS
BEGIN
Select *from BookInfo where BookInfo.Title LIKE @name;
END;

exec unknown_book 'A%';


----->14-Search book by Price Range:
CREATE PROCEDURE price_range_book @first DECIMAL(10,2), @second DECIMAL(10,2)
AS
BEGIN
SELECT *from BookInfo where Price between @first and @second;
END;

exec price_range_book @first=10 ,@second=15 



-->15-Display Book Having PublicationYear :
CREATE PROCEDURE book_year @year INT
AS
BEGIN
SELECT *from BookInfo where PublicationYear in(@year);
END;

exec book_year 2015


---->16-Calculate Total Price and Total Number of Books
CREATE PROCEDURE find_book_total
AS
BEGIN
SELECT COUNT(BookInfo.BookID) AS TOTAL_Books,SUM(BookInfo.Price) AS Total_Price from BookInfo;
END;

exec find_book_total 

---->17-calculate Total Stock Quantity in book Shop:
SELECT COUNT(BookInfo.BookID) AS Total_Books, SUM(BookInfo.QuantityInStock) AS BOOKS_STOCK from BookInfo;

--->18-Calculate Total Price of all Books in the Shop:

SELECT COUNT(BookInfo.BookID) AS Total_Books, SUM(BookInfo.QuantityInStock) AS
BOOKS_STOCK,SUM(BookInfo.QuantityInStock*BookInfo.Price) AS TOTAL_PRICE from BookInfo;


---->19-Category vise stock of books and total price:

CREATE PROCEDURE BOOK_CATEGORY_STOCK @name VARCHAR(30)
AS
BEGIN
SELECT BookCategories.GenreID,BookCategories.CategoryName,SUM(BookInfo.QuantityInStock) AS BOOKS_STOCK , 
SUM(BookInfo.QuantityInStock*BookInfo.Price) AS TOTAL_PRICE from BookCategories left join BookInfo ON 
BookCategories.GenreID=BookInfo.GenreID GROUP BY BookCategories.GenreID,BookCategories.CategoryName having BookCategories.CategoryName=@name;
END;

EXEC BOOK_CATEGORY_STOCK 'Classic'

--->20-SHOW ALL BOOKS INFO ALONG Author and Publisher Name.
SELECT BookInfo.BookID,BookInfo.Title,BookInfo.ISBN,BookInfo.PublicationYear,BookInfo.QuantityInStock,Author.AuthorName,Publisher.PublisherName from BookInfo inner join
Author on BookInfo.AuthorID=Author.AuthorID inner join Publisher ON BookInfo.PublisherID=Publisher.PublisherID;


--->21-Search Book By Author name and Publisher name:
CREATE PROCEDURE book_author_publisher @author VARCHAr(30),@publisher VARCHAR(30)
AS
BEGIN
SELECT BookInfo.BookID,BookInfo.Title,BookInfo.Price,BookInfo.ISBN,BookInfo.PublicationYear,BookInfo.QuantityInStock from BookInfo left join Author ON BookInfo.AuthorID=Author.AuthorID
left join Publisher ON BookInfo.PublisherID=Publisher.PublisherID where Author.AuthorName=@author and Publisher.PublisherName=@publisher
END;

EXEC book_author_publisher 'Elizabeth Green','Random House';


---->22-Show Author Name Having high book stock in the shop:
SELECT TOP 1 Author.AuthorID,Author.AuthorName,SUM(BookInfo.QuantityInStock) AS STOCK from Author left join BookInfo ON
Author.AuthorID=BookInfo.AuthorID GROUP BY Author.AuthorID,Author.AuthorName ORDER BY STOCK DESC


---->23-Show Publisher Name Having high book stock in the shop:
SELECT TOP 1 Publisher.PublisherID,Publisher.PublisherName,SUM(BookInfo.QuantityInStock) AS STOCK from Publisher left join BookInfo ON
Publisher.PublisherID=BookInfo.PublisherID GROUP BY Publisher.PublisherID,Publisher.PublisherName ORDER BY STOCK DESC



---->24-Calculate Total salary paid to Employees :
SELECT COUNT(Employees.EmployeeID) AS TOTAL_EMPLOYEES,SUM(Employees.Salary) AS TOTAL_SALARY from Employees;


--->23-Show all Employees and rank by salary:
CREATE PROCEDURE ALL_EMPLOYEE 
AS
BEGIN
SELECT Employees.EmployeeID,Employees.FirstName,Employees.LastName,Employees.PhoneNumber,Employees.City,Employees.JobTitle,
MAX(Employees.Salary) AS Highest_Salary from Employees 
GROUP BY Employees.EmployeeID,Employees.FirstName,
Employees.JobTitle,Employees.LastName,Employees.City,Employees.PhoneNumber ORDER BY Highest_Salary DESC;
END;

EXEC ALL_EMPLOYEE

-->24-Show Employees Data Who Live in Karachi,Islamabad,Gujrat and Sialkot and Employees Salary should be grater than 23000.
CREATE PROCEDURE Employees_info @city VARCHAR(20),@salary int
AS
BEGIN
SELECT Employees.EmployeeID,Employees.FirstName,Employees.LastName,Employees.PhoneNumber,Employees.Country,Employees.Employee_Address,
Employees.Email,Employees.City,Employees.JobTitle,Employees.Salary,Employees.PostalCode from Employees 
where City in(@city) and Salary > @salary;
END;

exec Employees_info 'Lahore' , 23000


---->25-Which Job have Highest Job salary and how much:
Select top 1 Employees.JobTitle,Employees.Salary from Employees ORDER BY Salary DESC;


--->26-List Customer names who live in state Punjab and city (Lahore,Rawalpindi):
CREATE PROCEDURE Customer_Location @city VARCHAR(20) ,@province VARCHAR(20)
AS
BEGIN
SELECT Customer.CustomerID,Customer.FirstName,Customer.LastName,Customer.City,Customer.StateProvince,Customer.Email,
Customer.Customer_Address,Customer.PhoneNumber,Customer.Country,
Customer.PostalCode from Customer where City in(@city) and StateProvince=@province;
END;

exec Customer_Location  'Lahore' ,  'Punjab'

--->27-Search Employee By Name:
CREATE PROCEDURE SEARCH_EMPLOYEE @f_name VARCHAR(30),@l_name VARCHAR(30)
AS
BEGIN

SELECT *from Employees where Employees.FirstName=@f_name and Employees.LastName=@l_name;
END;

EXEC SEARCH_EMPLOYEE 'Fatima','Ali'

-->28-Make a list of Customers According to province:
CREATE PROCEDURE Customer_Province @province VARCHAR(30)
AS
BEGIN
SELECT Customer.StateProvince,COUNT(Customer.StateProvince) AS Number_Of_Customers from Customer GROUP BY Customer.StateProvince
Having Customer.StateProvince=@province
END;

EXEC Customer_Province 'Punjab'

--->29-Show Paid Order in Database:
CREATE PROCEDURE payment_status_customer @status VARCHAR(10)
AS
BEGIN
Select OrderHeader.OrderID,OrderHeader.CustomerID,OrderHeader.OrderDate,OrderPayment.TotalAmount,OrderPayment.PaymentMethod,
OrderPayment.PaymentStatus from OrderHeader inner join OrderPayment
ON OrderHeader.OrderID=OrderPayment.OrderID where OrderPayment.PaymentStatus=@status;
END;

exec payment_status_customer  'Pending'

---->30-Search Book By Category:
CREATE PROCEDURE book_category @name VARCHAR (20)
AS
BEGIN
SELECT *from BookInfo inner join BookCategories on BookInfo.GenreID=BookCategories.GenreID where BookCategories.CategoryName=@name

END;

exec book_category 'Classic';



---->31-List Complete Purchase data (Supplier + Book):
CREATE PROCEDURE Purchase_data 
AS
BEGIN
SELECT PurchaseItem.PurchaseItemID,PurchaseHeader.PurchaseID,PurchaseHeader.SupplierID,Supplier.SupplierName,PurchaseItem.BookID,BookInfo.Title,PurchaseItem.Quantity,
PurchaseItem.UnitPrice from PurchaseHeader inner join PurchaseItem on PurchaseHeader.PurchaseID=PurchaseItem.PurchaseID inner join
BookInfo ON PurchaseItem.BookID=BookInfo.BookID inner join Supplier ON PurchaseHeader.SupplierID=Supplier.SupplierID
END;

exec Purchase_data;



----------------------------------------------------------------------------------------------------
---------------------------I N S E R T  D A T A  I N T O   T A B L E S------------------------------
----------------------------------------------------------------------------------------------------

-------------->BOOK INFO<------------
CREATE PROCEDURE INSERT_BOOKINFO @ID INT,@TITLE VARCHAR(40),@ISBN VARCHAR(16),@GENREID INT,@PUBLICATION_YEAR INT,@PRICE DECIMAL(10,2),
@QUANTITY INT,@DESCRIPTION TEXT,@PUBLICATION_ID INT,@AUTHOR_ID INT
AS
BEGIN
INSERT INTO BookInfo values(@ID,@TITLE,@ISBN,@GENREID,@PUBLICATION_YEAR,@PRICE,@QUANTITY,@DESCRIPTION,@PUBLICATION_ID,@AUTHOR_ID);

END;

EXEC INSERT_BOOKINFO  80,'The Unicorn Who Came to Breakfast','9780702307034',6,2022,8.03,30 
,'The Unicorn Who Came to Breakfast: a brilliantly funny picture book about one familys surprise visit from a UNICORN!',20,15;

-------------->Author<------------
CREATE PROCEDURE New_Author @ID int,@AUTHOR_NAME VARCHAR(30),@BIO TEXT
AS
BEGIN
INSERT INTO Author VALUES(@ID,@AUTHOR_NAME,@BIO);
END;

exec New_Author  30,'Maureen Lee Lenker','Maureen Lee Lenker is an 
award-winning journalist who has written for Turner Classic Movies, The Hollywood Reporter, Ms. Magazine, and more'

-------------->Publisher<------------
CREATE PROCEDURE New_Publisher @ID int,@Publisher_NAME VARCHAR(30),@Addrees VARCHAR(255),@City VARCHAR(30),@Province VARCHAR(30),
@Postalcode VARCHAR(20),@Country VARCHAR(30)
AS
BEGIN
INSERT INTO Publisher VALUES(@ID,@Publisher_NAME,@Addrees,@City,@Province,@Postalcode,@Country);
END;

exec New_Publisher  28,'Bloomsbury Publishing','50 Bedford Square','London','United Kingdom','WC1B 3DP','London'

-------------->Customer<------------
CREATE PROCEDURE New_Customer @ID INT,@F_NAME VARCHAR(30),@L_NAME VARCHAR(30),@EMAIL VARCHAR(40),@PHONE_NUMBER VARCHAR(25),
@ADDRESS VARCHAR(255),@CITY VARCHAR(20),@PROVINCE VARCHAR(20),@POSTAL_CODE VARCHAR(20),@COUNTRY VARCHAR(20)
AS
BEGIN

INSERT INTO Customer VALUES(@ID,@F_NAME,@L_NAME,@EMAIL,@PHONE_NUMBER,@ADDRESS,@CITY,@PROVINCE,@POSTAL_CODE,@COUNTRY);
end;

EXEC New_Customer 26,'Talha','Siddique','clan302gaming@gmail.com','034512312378','Sialkot','Daska','Punjab','51010','Pakistan'

-------------->Order Header<------------
CREATE PROCEDURE ORDER_HEADER @ID INT,@CUSTOMER_ID INT,@ORDER_DATE DATE
AS
BEGIN
INSERT INTO OrderHeader VALUES(@ID,@CUSTOMER_ID,@ORDER_DATE);
END;

EXEC ORDER_HEADER 30,26,'2023-08-01'

-------------->Order Payment<------------
CREATE PROCEDURE ORDER_PAYMENT @ID INT,@TOTAL_AMOUNT DECIMAL(10,2),@PAYMENT_METHOD VARCHAR(100),@PAYMENT_STATUS VARCHAR(50)
AS
BEGIN
INSERT INTO OrderPayment VALUES(@ID,@TOTAL_AMOUNT,@PAYMENT_METHOD,@PAYMENT_STATUS);
END;

EXEC ORDER_PAYMENT 26,16.99,'Card','Paid'


--------->Make A Order<-------
CREATE PROCEDURE BOOK_ORDER_CUSTOMER @orderID int ,@CustomerID int,@order_date DATE,@payment_method VARCHAR(30),@Payment_status VARCHAR(30),@bookID int,@quantity int
AS
BEGIN
INSERT INTO OrderHeader VALUES(@orderID,@CustomerID,@order_date);
insert into BookOrder Values(@orderID,@bookID,@quantity);
INSERT INTO OrderPayment VALUES(@orderID,0,@payment_method,@Payment_status);
update OrderPayment set TotalAmount=(select BookInfo.Price*@quantity from BookInfo where BookInfo.BookID=@bookID) where OrderID=@orderID;
update BookInfo set QuantityInStock=QuantityInStock-@quantity where BookID=@bookID;

--->Order BILL RECEIPT:

SELECT Customer.CustomerID,Customer.FirstName,Customer.LastName,BookInfo.Title,OrderHeader.OrderID,OrderHeader.OrderDate,OrderPayment.PaymentMethod,OrderPayment.PaymentStatus,
OrderPayment.TotalAmount, BookOrder.Quantity FROM Customer
INNER JOIN OrderHeader ON Customer.CustomerID = OrderHeader.CustomerID
INNER JOIN BookOrder ON OrderHeader.OrderID = BookOrder.OrderID
INNER JOIN BookInfo ON BookOrder.BookID = BookInfo.BookID
INNER JOIN OrderPayment ON OrderHeader.OrderID = OrderPayment.OrderID  WHERE Customer.CustomerID=@CustomerID and OrderHeader.OrderDate=@order_date;

SELECT SUM(OrderPayment.TotalAmount) AS TOTAL_BILL from OrderPayment
INNER JOIN OrderHeader ON OrderHeader.OrderID=OrderPayment.OrderID
INNER JOIN Customer ON OrderHeader.CustomerID=Customer.CustomerID
where Customer.CustomerID=@CustomerID and OrderHeader.OrderDate=@order_date;

END;

EXEC BOOK_ORDER_CUSTOMER  33,10,'2023-08-02','Cash','Paid',10,2


------->Purchase Books<--------
CREATE PROCEDURE Purchace_books @Purchase_Item_ID int,@Purchase_ID int ,@supplier_ID int,@Purchase_date DATE,@Book_ID int ,@Quantity int ,@Unit_Price DECIMAL(10,2)
AS
BEGIN
INSERT INTO PurchaseHeader VALUES(@Purchase_ID,@supplier_ID,@Purchase_date);
INSERT INTO PurchaseItem VALUES(@Purchase_Item_ID,@Purchase_ID,@Book_ID,@Quantity,@Unit_Price);
update BookInfo set QuantityInStock=QuantityInStock+@Quantity where BookID=@Book_ID;

-->GENERATE BILL:
SELECT PurchaseHeader.PurchaseID,PurchaseHeader.SupplierID,PurchaseHeader.PurchaseDate,PurchaseItem.PurchaseItemID,PurchaseItem.BookID,BookInfo.Title,PurchaseItem.Quantity,
PurchaseItem.UnitPrice,Supplier.SupplierName,
PurchaseItem.UnitPrice*Quantity AS TOTAL_BILL from PurchaseHeader inner join PurchaseItem ON PurchaseHeader.PurchaseID=PurchaseItem.PurchaseID INNER JOIN BookInfo ON 
PurchaseItem.BookID=BookInfo.BookID INNER JOIN Supplier ON PurchaseHeader.SupplierID=Supplier.SupplierID
where PurchaseItemID=@Purchase_Item_ID
END;

EXEC Purchace_books 33,23,1,'2023-02-09',22,10,18.34

-------------->EMPLOYEE<------------
CREATE PROCEDURE NEW_EMPLOYEE @ID INT,@F_NAME VARCHAR(30),@L_NAME VARCHAR(30),@EMAIL VARCHAR(30),@PHONE_NUMBER VARCHAR(30),@ADDRESS VARCHAR(255),
@CITY VARCHAR(20),@PROVINCE VARCHAR(20),@JOB_TITLE VARCHAR(30),@POSTAL_CODE VARCHAR(30),@COUNTRY VARCHAR(30),@SALARY DECIMAL(10,2)
AS
BEGIN

INSERT INTO Employees VALUES(@ID,@F_NAME,@L_NAME,@EMAIL,@PHONE_NUMBER,@ADDRESS,@CITY,@PROVINCE,@JOB_TITLE,@POSTAL_CODE,@COUNTRY,@SALARY);

END;

exec NEW_EMPLOYEE 11, 'Pakiza', 'Nawaz', 'pakiza.nawaz@gmail.com', '0345-6789012', '654 Retail Plaza',
'Sialkot', 'Punjab', '51210', 'Pakistan', 'Cashier', 18000.00

-------------->SUPPLIER<------------
---->(TABLE NAME: Supplier)<----- 
INSERT INTO Supplier (SupplierID, SupplierName, ContactPerson, Email, PhoneNumber, Supplier_Address, City, StateProvince, PostalCode, Country)
VALUES
  (1, 'Asian Books Co.', 'John Lee', 'john.lee@asianbooksco.com', '+65 9876 5432', '123 Orchard Road', 'Singapore', 'Singapore', '123456', 'Singapore'),
  (2, 'Tokyo Publishing House', 'Yuki Tanaka', 'yuki.tanaka@tokyopublishing.com', '+81 3 1234 5678', '456 Ginza Street', 'Tokyo', 'Tokyo', '789012', 'Japan'),
  (3, 'Shanghai Literature Group', 'Li Wei', 'li.wei@shanghailitgroup.com', '+86 21 9876 5432', '789 Nanjing Road', 'Shanghai', 'Shanghai', '345678', 'China'),
  (4, 'Delhi Books Emporium', 'Rajesh Sharma', 'rajesh.sharma@delhibooks.com', '+91 11 2345 6789', '234 Connaught Place', 'New Delhi', 'Delhi', '567890', 'India'),
  (5, 'Seoul Book Distributors', 'Kim Min-ji', 'minji.kim@seoulbooks.co.kr', '+82 2 3456 7890', '789 Jongno Street', 'Seoul', 'Seoul', '901234', 'South Korea');

CREATE PROCEDURE NEW_Supplier @SupplierID int,@SupplierName varchar(40),@ContactPerson varchar(40),@Email varchar(255),@PhoneNumber varchar(40),@Supplier_Address varchar(255),
@City varchar(40),@StateProvince varchar(40),@PostalCode varchar(30),@Country varchar(40)
AS
BEGIN
INSERT INTO Supplier VALUES (@SupplierID,@SupplierName,@ContactPerson,@Email ,@PhoneNumber ,@Supplier_Address,
@City,@StateProvince ,@PostalCode,@Country);

END;

EXEC NEW_Supplier 5, 'Hola Book Distributors', 'Kim Chin-ji', 'chin.kim@holabooks.co.kr', '+82 2 1234 7890', '739 Jongno Street', 'Seoul', 'Seoul', '901234', 'South Korea';



--------------------------------------------------------------------------------------------
--------------------------------------------SHOW ALL TABLES DATA----------------------------
  CREATE PROCEDURE Show_all_table
  AS
  BEGIN
  select *from Author;
  select *from Publisher;
  select *from BookInfo;
  select *from Customer;
  select *from Employees;
  select *from Supplier;
  select *from OrderHeader;
  select *from OrderPayment;
  select *from PurchaseHeader;
  select *from PurchaseItem;
  select *from BookCategories;
  select *from BookOrder;
  

  END;

  exec Show_all_table
  ---------------------------------------------------------------------------------------------
  ------------------------------DELETE ALL TABLES DATA----------------------------------------
  CREATE PROCEDURE Delete_table_data
  AS
  BEGIN

  DELETE FROM BookInfo;
  DELETE FROM Publisher;
  DELETE FROM Author;
  DELETE FROM Customer;
  DELETE FROM Employees;
  DELETE FROM Supplier;
  DELETE from OrderHeader;
  DELETE from OrderPayment;
  DELETE from PurchaseHeader;
  DELETE from PurchaseItem;
  DELETE from BookCategories;
  END;



  exec Delete_table_data


  ---------------------------------------------------------------------------------------------
  ------------------------------DROP ALL TABLES ---------------------------------------- 
  CREATE PROCEDURE Drop_table_data
  AS
  BEGIN

  DROP TABLE BookInfo;
  DROP TABLE Publisher;
  DROP TABLE Author;
  DROP TABLE Customer;
  DROP TABLE Employees;
  DROP TABLE Supplier;
  DROP TABLE OrderHeader;
  DROP TABLE OrderPayment;
  DROP TABLE PurchaseHeader;
  DROP TABLE PurchaseItem;
  DROP TABLE BookCategories;
  END;

  exec Drop_table_data


  
 



 