  DROP TABLE if exists BookInfo;
  DROP TABLE if exists Publisher;
  DROP TABLE if exists Author;
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


										
								    ----->(INSERT DATA INTO TABLE)<----
									
		----->(TABLE NAME: BOOKINFO)<----- 
INSERT INTO BookInfo (BookID, Title, ISBN, GenreID, PublicationYear, Price, QuantityInStock, Description, PublisherID, AuthorID)
VALUES
  (1, 'The Secret Garden', '9780143106454', 6, 1911, 12.99, 100, '14 childrens novel about a hidden garden.', 1, 1),
  (2, 'To Kill a Mockingbird', '9780061120084', 1, 1960, 15.50, 75, 'Powerful story addressing racial injustice in the American South.', 2, 2),
  (3, 'Becoming', '9781524763138', 9, 2018, 22.95, 50, 'Memoir of the life of Michelle Obama.', 3, 3),
  (4, 'Harry Potter and the Sorcerers Stone', '9780590353427', 5, 1997, 19.99, 120, 'The first book in the Harry Potter series.', 4, 4),
  (5, 'Dune', '9780441013593', 2, 1965, 18.75, 60, 'Epic tale set in a distant future on the desert planet Arrakis.', 5, 5),
  (6, 'Gone Girl', '9780307588371', 3, 2012, 16.99, 90, 'Thriller about the mysterious disappearance of a woman.', 6, 6),
  (7, 'Sapiens: A Brief History of Humankind', '9780062316097', 10, 2014, 21.95, 40, 'Exploration of the history of humankind.', 7, 7),
  (8, 'The Notebook', '9780552155754', 4, 1996, 14.50, 85, 'A tale of love and devotion.', 8, 8),
  (9, 'A Little Life', '9780804172707', 7, 2015, 15.99, 70, 'Epic novel about friendship and trauma.', 22, 22),
  (10, 'The Hunger Games', '9780439023481', 8, 2008, 13.75, 110, 'Dystopian adventure where teenagers fight to the death.', 10, 10),
  (11, '1984', '9780451524935', 2, 1949, 12.99, 65, '14 dystopian novel by George Orwell.', 1, 4),
  (12, 'The Great Gatsby', '9780743273565', 1, 1925, 15.95, 75, 'Iconic portrayal of the Jazz Age in America.', 2, 5),
  (13, 'The Catcher in the Rye', '9780316769488',7, 1951, 13.25, 70, 'Coming-of-age novel by J.D. Salinger.', 3, 1),
  (14, 'The Da Vinci Code', '9780385504201', 11, 2003, 19.50, 60, 'Conspiracy thriller by Dan Brown.', 4, 2),
  (15, 'Pride and Prejudice', '9780141439518', 4, 1813, 11.99, 90, '14 romance novel by Jane Austen.', 5, 3),
  (16, 'The Alchemist', '9780061122415', 1, 1988, 14.95, 85, 'Philosophical tale about a journey of self-discovery.', 6, 5),
  (17, 'The Girl with the Dragon Tattoo', '9780307454546', 3, 2005, 16.25, 65, 'Crime novel by Stieg Larsson.', 7, 7),
  (18, 'The Lord of the Rings', '9780618640157', 5, 1954, 22.50, 50, 'Epic fantasy trilogy by J.R.R. Tolkien.', 8, 9),
  (19, 'The Chronicles of Narnia', '9780064404990', 6, 1950, 19.99, 75, '14 childrens fantasy series by C.S. Lewis.', 9, 8),
  (20, 'Brave New World', '9780060850524', 2, 1932, 12.50, 60, 'Dystopian novel by Aldous Huxley.', 10, 10),
  (21, 'The Night Circus', '9780385534635', 5, 2011, 17.50, 80, 'Magical competition set in a mysterious circus.', 11, 11),
  (22, 'Sapiens: A Graphic History', '9780063051320', 12, 2021, 24.95, 45, 'Illustrated adaptation of the history of humankind.', 12, 7),
  (23, 'Outlander', '9780440242949', 10, 1991, 16.75, 70, 'Time-travel romance set in 18th-century Scotland.', 13, 12),
  (24, 'Neuromancer', '9780441569595', 13, 1984, 14.99, 60, 'Influential novel that coined the term "cyberspace".', 14, 9),
  (25, 'Caraval', '9781250095251', 8, 2017, 13.25, 95, 'Fantasy game with a magical carnival setting.', 15, 10),
  (26, 'The Handmaids Tale', '9780385490818', 2, 1985, 14.50, 85, 'Dystopian novel by Margaret Atwood.', 1, 1),
  (27, 'The Hobbit', '9780547928227', 5, 1937, 12.99, 75, 'Fantasy adventure novel by J.R.R. Tolkien.', 2, 9),
  (28, 'To All the Boys I have Loved Before', '9781442426719', 8, 2014, 13.99, 100, 'Contemporary romance with a series of love letters.', 3, 8),
  (29, 'Jurassic Park', '9780345370778', 2, 1990, 15.95, 60, 'Dinosaurs brought back to life in a theme park.', 4, 5),
  (30, 'Little Women', '9780143106485', 14, 1868, 11.25, 80, '14 novel following the lives of four sisters.', 5, 3),
  (31, 'A Game of Thrones', '9780553103540', 5, 1996, 18.50, 70, 'Epic fantasy series by George R.R. Martin.', 6, 4),
  (32, 'The Silent Patient', '9781250301697', 3, 2019, 16.99, 90, 'Psychological thriller about a woman who stopped speaking.', 7, 6),
  (33, 'The Name of the Wind', '9780756404741', 5, 2007, 19.25, 50, 'Epic fantasy novel by Patrick Rothfuss.', 8, 7),
  (34, 'Alices Adventures in Wonderland', '9781503250210', 6, 1865, 10.99, 120, '14 childrens tale by Lewis Carroll.', 9, 11),
  (35, 'The Shining', '9780307743657', 15, 1977, 14.50, 65, 'Psychological horror novel by Stephen King.', 10, 13),
  (36, 'Gone with the Wind', '9781451635621', 10, 1936, 15.99, 70, 'Epic romance novel set during the American Civil War.', 11, 14),
  (37, 'The Power of One', '9780345410054',10, 1989, 16.75, 50, 'Coming-of-age story set in South Africa.', 12, 15),
  (38, 'The Subtle Art of Not Giving a F*ck', '9780062457714', 16, 2016, 13.95, 100, 'Personal development book by Mark Manson.', 13, 11),
  (39, 'The Maze Runner', '9780385737951', 8, 2009, 12.25, 75, 'Dystopian adventure with a deadly maze.', 14, 12),
  (40, 'The Nightingale', '9780312577223', 10, 2015, 15.95, 80, 'Tale of two sisters during World War II.', 5, 25),
  (41, 'The Fault in Our Stars', '9780525478812', 8, 2012, 13.99, 85, 'Heartrending tale of young love and cancer.', 16, 16),
  (42, 'Educated', '9780399590504', 2, 2018, 18.50, 65, 'Memoir of a womans quest for education and self-discovery.', 17, 17),
  (43, 'The Girl on the Train', '9781594633669', 11, 2015, 14.75, 70, 'Mystery thriller with an unreliable narrator.', 18, 18),
  (44, 'The Fellowship of the Ring', '9780618346257', 5, 1954, 21.99, 55, 'First part of the Lord of the Rings trilogy.', 19, 19),
  (45, 'A Wrinkle in Time', '9780312367541', 2, 1962, 12.25, 90, '14 2 novel for young readers.', 20, 20),
  (46, 'The Lion, the Witch, and the Wardrobe', '9780064404990', 6, 1950, 19.99, 70, 'First book of the Chronicles of Narnia series.', 1, 8),
  (47, 'The Silence of the Girls', '9780525522294', 10, 2018, 15.50, 60, 'Retelling of the Trojan War from the perspective of women.', 2, 9),
  (48, 'The Hate U Give', '9780062498533', 8, 2017, 14.95, 80, 'Powerful novel addressing police violence and race.', 3, 10),
  (49, 'The Stand', '9780307743688', 15, 1978, 17.25, 75, 'Post-apocalyptic horror epic by Stephen King.', 4, 13),
  (50, 'The Subtle Knife', '9780375842382', 5, 1997, 16.99, 65, 'Second book of the His Dark Materials trilogy.', 5, 11),
  (51, 'The Road', '9780307387899', 5, 2006, 13.50, 85, 'Post-apocalyptic novel about a father and sons journey.', 6, 5),
  (52, 'One Hundred Years of Solitude', '9780060883287', 17, 1967, 15.99, 70, 'Magical family saga by Gabriel Garc�a M�rquez.', 7, 14),
  (53, 'The Priory of the Orange Tree', '9781635570298', 5, 2019, 23.99, 50, 'Epic fantasy novel with dragons and magic.', 11, 19),
  (54, 'The Hitchhikers Guide to the Galaxy', '9780345391803', 2, 1979, 11.99, 80, '14 humorous sci-fi novel by Douglas Adams.', 13, 4),
  (55, 'The Martian', '9780553418026', 2, 2011, 14.50, 70, 'Survival story of an astronaut stranded on Mars.', 14, 19),
  (56, 'The Picture of Dorian Gray', '9780486278070', 14, 1890, 11.25, 90, '14 novel about the pursuit of pleasure and beauty.', 16, 15),
  (57, 'The Giver', '9780544340688', 8, 1993, 12.99, 75, 'Dystopian novel about a controlled society.', 17, 20),
  (58, 'A Clash of Kings', '9780553108030', 5, 1999, 18.50, 70, 'Second book of the A Song of Ice and Fire series.', 18, 4),
  (59, 'Harry Potter and the Prisoner of Azkaban', '9780439136365', 5, 1999, 19.99, 85, 'Third book in the Harry Potter series.', 20, 3),
  (60, 'The Immortal Life of Henrietta Lacks', '9781400052189', 8, 2010, 13.50, 50, 'Biography of the woman behind HeLa cells.', 1, 17),
  (61, 'The Outsiders', '9780142407332', 8, 1967, 10.99, 90, '14 coming-of-age novel by S.E. Hinton.', 2, 16),
  (62, 'The Book Thief', '9780375842207', 10, 2005, 17.25, 70, 'Story set during World War II, narrated by Death.', 5, 9),
  (63, 'The Kite Runner', '9781594631931', 1, 2003, 14.75, 75, 'Novel about friendship and redemption in Afghanistan.', 6, 6),
  (64, 'Nineteen Eighty-Four', '9780451524935', 2, 1949, 12.99, 65, '14 dystopian novel by George Orwell.', 7, 4),
  (65, 'The Goldfinch', '9780316055444', 7, 2013, 16.99, 80, 'Coming-of-age novel and art heist.', 21, 18),
  (66, 'The Adventures of Huckleberry Finn', '9780143107321', 14, 1885, 11.99, 90, '14 novel by Mark Twain.', 23, 16),
  (67, 'The Road Less Traveled', '9780671250676', 16, 1978, 13.50, 70, '14 self-help book by M. Scott Peck.', 24, 19),
  (68, 'The Great Alone', '9780312577230', 10, 2018, 15.95, 75, 'Historical novel set in Alaska.', 25, 21),
  (69, 'The Help', '9780425232200', 10, 2009, 12.25, 80, 'Novel about African American maids in the 1960s.', 1, 1),
  (70, 'The Underground Railroad', '9780385542364', 10, 2016, 16.99, 75, 'Historical novel about a runaway slave.', 24, 27),
  (71, 'The Magicians Nephew', '9780064405027', 6, 1955, 19.99, 85, 'First book of the Chronicles of Narnia series.', 5, 3),
  (72, 'Where the Crawdads Sing', '9780735219090', 1, 2018, 15.95, 95, 'Mystery and coming-of-age novel.', 8, 25),
  (73, 'The Sun Also Rises', '9780743297332', 7, 1926, 12.50, 85, '14 novel by Ernest Hemingway.', 21, 24),
  (74, 'The Power of Habit', '9780812981605', 16, 2012, 13.95, 65, 'Exploration of the science of habits and human behavior.', 11, 15),
  (75, 'A Man Called Ove', '9781476738024', 1, 2012, 13.25, 70, 'Heartwarming tale of a grumpy old man.', 23, 1),
  (76, 'The Shadow of the Wind', '9780143034902', 3, 2004, 14.75, 75, 'Mystery set in post-war Barcelona.', 13, 23),
  (77, 'The Secret Life of Bees', '9780143114559', 10, 2001, 13.25, 80, 'Coming-of-age novel set in the 1960s.', 14, 21),
  (78, 'Eleanor Oliphant Is Completely Fine', '9780735220690', 1, 2017, 14.95, 75, 'Novel about the life of an eccentric woman.', 18, 28),
  (79, 'Little Fires Everywhere', '9780735224292', 1, 2017, 15.99, 80, 'Novel about family secrets and suburban life.', 20, 23);

  ----->(TABLE NAME: Publisher)<----- 
  INSERT INTO Publisher (PublisherID, PublisherName, Publisher_Address, City, StateProvince, PostalCode, Country)
VALUES
  (1, 'Penguin Books', '123 Main Street', 'New York', 'NY', '10001', 'USA'),
  (2, 'HarperCollins', '456 Oak Avenue', 'London', 'England', 'SW1A 1AA', 'UK'),
  (3, 'Random House', '789 Maple Drive', 'Toronto', 'Ontario', 'M5H 1P6', 'Canada'),
  (4, 'Oxford University Press', '10 Broad Street', 'Oxford', 'England', 'OX1 3AP', 'UK'),
  (5, 'Simon & Schuster', '555 Broadway', 'Los Angeles', 'CA', '90012', 'USA'),
  (6, 'Hachette Book Group', '123 Broadway', 'New York', 'NY', '10003', 'USA'),
  (7, 'Macmillan Publishers', '456 Park Avenue', 'London', 'England', 'W1J 7UJ', 'UK'),
  (8, 'Penguin Random House', '789 Lakeview Terrace', 'Toronto', 'Ontario', 'M4B 1B3', 'Canada'),
  (9, 'Cambridge University Press', '10 Kings Parade', 'Cambridge', 'England', 'CB2 1SJ', 'UK'),
  (10, 'Scholastic Corporation', '555 School Street', 'New York', 'NY', '10013', 'USA'),
  (11, 'Houghton Mifflin Harcourt', '111 Pine Street', 'Boston', 'MA', '02108', 'USA'),
  (12, 'Bloomsbury Publishing', '222 Baker Street', 'London', 'England', 'W1U 3BW', 'UK'),
  (13, 'Hodder & Stoughton', '333 Kings Road', 'London', 'England', 'SW3 5EW', 'UK'),
  (14, 'Viking Press', '444 Madison Avenue', 'New York', 'NY', '10022', 'USA'),
  (15, 'Harperteen', '555 Broadway', 'New York', 'NY', '10012', 'USA'),
  (16, 'Random House Childrens Books', '777 Park Avenue', 'New York', 'NY', '10021', 'USA'),
  (17, 'Hachette Childrens Group', '888 Riverside Drive', 'London', 'England', 'SE1 9PB', 'UK'),
  (18, 'Alfred A. Knopf', '999 Fifth Avenue', 'New York', 'NY', '10028', 'USA'),
  (19, 'Vintage Books', '1111 Broadway', 'London', 'England', 'SW1H 0BD', 'UK'),
  (20, 'Scholastic Press', '2222 School Street', 'New York', 'NY', '10001', 'USA'),
  (21, 'HarperCollins Publishers', '333 Park Avenue', 'New York', 'NY', '10022', 'USA'),
  (22, 'St. Martins Press', '777 Riverside Drive', 'New York', 'NY', '10024', 'USA'),
  (23, 'Vintage Childrens 14s', '555 Baker Street', 'London', 'England', 'W1U 8ED', 'UK'),
  (24, 'Knopf Doubleday', '666 Fifth Avenue', 'New York', 'NY', '10103', 'USA'),
  (25, 'Penguin 14s', '777 Madison Avenue', 'London', 'England', 'WC2H 9EA', 'UK'),
  (26, 'Harper Perennial', '444 Park Avenue', 'New York', 'NY', '10021', 'USA'),
  (27, 'Vintage', '666 Baker Street', 'New York', 'NY', '10012', 'USA');

----->(TABLE NAME: Author)<----- 
INSERT INTO Author (AuthorID, AuthorName, Bio)
VALUES
  (1, 'John Smith', 'John Smith is a prolific author with many bestsellers.'),
  (2, 'Jane Doe', 'Jane Doe is a renowned writer of mystery novels.'),
  (3, 'Michael Johnson', 'Michael Johnson has written several award-winning biographies.'),
  (4, 'Emily White', 'Emily White is an expert in fantasy 1.'),
  (5, 'Robert Lee', 'Robert Lee is known for his thought-provoking 2 stories.'),
  (6, 'Jennifer Brown', 'Jennifer Brown writes compelling contemporary 1.'),
  (7, 'William Turner', 'William Turner is a historian and non-1 author.'),
  (8, 'Elizabeth Green', 'Elizabeth Green specializes in romance novels.'),
  (9, 'Daniel Black', 'Daniel Black is a poet and literary 1 writer.'),
  (10, 'Sarah Adams', 'Sarah Adams is an advocate for young adult literature.'),
  (11, 'David Roberts', 'David Roberts writes historical 1 and thrillers.'),
  (12, 'Mary Turner', 'Mary Turner is an expert in historical non-1.'),
  (13, 'Sophie Green', 'Sophie Green specializes in contemporary romance novels.'),
  (14, 'Andrew Black', 'Andrew Black is a 2 and fantasy author.'),
  (15, 'Emma Adams', 'Emma Adams writes young adult fantasy and adventure stories.'),
  (16, 'Sarah Roberts', 'Sarah Roberts writes heartwarming contemporary 1.'),
  (17, 'Richard Turner', 'Richard Turner is a historian and biographer.'),
  (18, 'Olivia Green', 'Olivia Green specializes in romantic suspense novels.'),
  (19, 'Matthew Black', 'Matthew Black is a fantasy and adventure author.'),
  (20, 'Sophia Adams', 'Sophia Adams writes thrilling young adult 1.'),
  (21, 'Laura Turner', 'Laura Turner writes gripping psychological thrillers.'),
  (22, 'Christopher Adams', 'Christopher Adams is a bestselling fantasy author.'),
  (23, 'Grace Roberts', 'Grace Roberts specializes in heartwarming contemporary 1.'),
  (24, 'Michael Green', 'Michael Green writes historical 1 and mysteries.'),
  (25, 'Ella Adams', 'Ella Adams is a young adult 1 author.'),
  (26, 'Daniel Turner', 'Daniel Turner is a bestselling thriller author.'),
  (27, 'Thomas Roberts', 'Thomas Roberts is a renowned 2 author.'),
  (28, 'Oliver Adams', 'Oliver Adams specializes in mystery and suspense.'),
  (29, 'Emma Turner', 'Emma Turner writes young adult 1.');


  ----->(TABLE NAME: Customer)<----- 
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Customer_Address, City, StateProvince, PostalCode, Country)
VALUES
  (1, 'Ali', 'Khan', 'ali.khan@gmail.com', '+92 300 1234567', '123 Main Street', 'Karachi', 'Sindh', '74000', 'Pakistan'),
  (2, 'Fatima', 'Ahmed', 'fatima.ahmed@gmail.com', '+92 321 9876543', '456 Park Avenue', 'Lahore', 'Punjab', '54000', 'Pakistan'),
  (3, 'Usman', 'Hassan', 'usman.hassan@gmail.com', '+92 333 2468135', '789 Street Road', 'Islamabad', 'Islamabad Capital', '44000', 'Pakistan'),
  (4, 'Ayesha', 'Ali', 'ayesha.ali@gmail.com', '+92 311 7766554', '10 Plaza Road', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
  (5, 'Hassan', 'Raza', 'hassan.raza@gmail.com', '+92 345 1122334', '222 Avenue Lane', 'Faisalabad', 'Punjab', '38000', 'Pakistan'),
  (6, 'Sana', 'Malik', 'sana.malik@gmail.com', '+92 320 9876123', '15 Garden Avenue', 'Karachi', 'Sindh', '74000', 'Pakistan'),
  (7, 'Bilal', 'Ahmed', 'bilal.ahmed@gmail.com', '+92 331 5550001', '17 Liberty Road', 'Lahore', 'Punjab', '54000', 'Pakistan'),
  (8, 'Hina', 'Khan', 'hina.khan@gmail.com', '+92 322 2345678', '45 Green Street', 'Islamabad', 'Islamabad Capital', '44000', 'Pakistan'),
  (9, 'Omar', 'Rafiq', 'omar.rafiq@gmail.com', '+92 333 9876543', '23 Mall Avenue', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
  (10, 'Mehreen', 'Ali', 'mehreen.ali@gmail.com', '+92 311 6543210', '33 Market Square', 'Faisalabad', 'Punjab', '38000', 'Pakistan'),
  (11, 'Tariq', 'Hussain', 'tariq.hussain@gmail.com', '+92 333 1122334', '55 Mall Road', 'Multan', 'Punjab', '60000', 'Pakistan'),
  (12, 'Amina', 'Siddiqui', 'amina.siddiqui@gmail.com', '+92 322 4455667', '7 Liberty Avenue', 'Karachi', 'Sindh', '74000', 'Pakistan'),
  (13, 'Nasir', 'Khan', 'nasir.khan@gmail.com', '+92 335 8877665', '14 Garden Road', 'Lahore', 'Punjab', '54000', 'Pakistan'),
  (14, 'Rabia', 'Qureshi', 'rabia.qureshi@gmail.com', '+92 324 2221110', '26 Park Lane', 'Islamabad', 'Islamabad Capital', '44000', 'Pakistan'),
  (15, 'Faisal', 'Aziz', 'faisal.aziz@gmail.com', '+92 334 9871234', '12 Plaza Avenue', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
  (16, 'Sara', 'Ahmed', 'sara.ahmed@gmail.com', '+92 315 1234567', '20 Avenue Road', 'Faisalabad', 'Punjab', '38000', 'Pakistan'),
  (17, 'Farhan', 'Raza', 'farhan.raza@gmail.com', '+92 321 6540987', '19 Market Street', 'Multan', 'Punjab', '60000', 'Pakistan'),
  (18, 'Anam', 'Ali', 'anam.ali@gmail.com', '+92 323 2233445', '5 Mall Lane', 'Karachi', 'Sindh', '74000', 'Pakistan'),
  (19, 'Zubair', 'Khan', 'zubair.khan@gmail.com', '+92 335 9988776', '31 Garden Square', 'Lahore', 'Punjab', '54000', 'Pakistan'),
  (20, 'Zara', 'Malik', 'zara.malik@gmail.com', '+92 333 4455667', '18 Liberty Avenue', 'Islamabad', 'Islamabad Capital', '44000', 'Pakistan'),
  (21, 'Ali', 'Rafiq', 'ali.rafiq@gmail.com', '+92 321 1122334', '24 Plaza Road', 'Rawalpindi', 'Punjab', '46000', 'Pakistan'),
  (22, 'Sana', 'Aziz', 'sana.aziz@gmail.com', '+92 311 9988776', '37 Market Lane', 'Faisalabad', 'Punjab', '38000', 'Pakistan'),
  (23, 'Bilal', 'Hussain', 'bilal.hussain@gmail.com', '+92 331 2233445', '8 Mall Square', 'Multan', 'Punjab', '60000', 'Pakistan'),
  (24, 'Hina', 'Siddiqui', 'hina.siddiqui@gmail.com', '+92 322 7890123', '30 Garden Road', 'Karachi', 'Sindh', '74000', 'Pakistan'),
  (25, 'Omar', 'Khan', 'omar.khan@gmail.com', '+92 334 4567890', '11 Liberty Lane', 'Lahore', 'Punjab', '54000', 'Pakistan');


  ----->(TABLE NAME: Employees)<----- 

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, Employee_Address, City, StateProvince, PostalCode, Country, JobTitle, Salary)
VALUES
  (1, 'Ahmed', 'Khan', 'ahmed.khan@gmail.com', '0312-1234567', '123 Main Street', 'Karachi', 'Sindh', '75000', 'Pakistan', 'Manager', 45000.00),
  (2, 'Fatima', 'Ali', 'fatima.ali@gmail.com', '0321-2345678', '456 Park Road', 'Lahore', 'Punjab', '54000', 'Pakistan', 'Assistant Manager', 35000.00),
  (3, 'Mohammad', 'Iqbal', 'mohammad.iqbal@gmail.com', '0300-9876543', '789 Market Avenue', 'Islamabad', 'Islamabad Capital', '44000', 'Pakistan', 'Sales Executive', 25000.00),
  (4, 'Ayesha', 'Malik', 'ayesha.malik@gmail.com', '0315-5432109', '321 Business Boulevard', 'Rawalpindi', 'Punjab', '46000', 'Pakistan', 'Sales Executive', 23000.00),
  (5, 'Usman', 'Haider', 'usman.haider@gmail.com', '0345-6789012', '654 Industrial Area', 'Faisalabad', 'Punjab', '38000', 'Pakistan', 'Cashier', 18000.00),
  (6, 'Sadia', 'Akhtar', 'sadia.akhtar@gmail.com', '0333-1122334', '987 Retail Street', 'Multan', 'Punjab', '60000', 'Pakistan', 'Sales Executive', 22000.00),
  (7, 'Ali', 'Raza', 'ali.raza@gmail.com', '0301-4567890', '1234 Mart Avenue', 'Hyderabad', 'Sindh', '71000', 'Pakistan', 'Cashier', 17000.00),
  (8, 'Hina', 'Qureshi', 'hina.qureshi@gmail.com', '0322-3456789', '567 Store Road', 'Gujranwala', 'Punjab', '52250', 'Pakistan', 'Sales Executive', 24000.00),
  (9, 'Farhan', 'Mehmood', 'farhan.mehmood@gmail.com', '0316-7890123', '321 Shopper Square', 'Sialkot', 'Punjab', '51310', 'Pakistan', 'Sales Executive', 23000.00),
  (10, 'Sana', 'Nawaz', 'sana.nawaz@gmail.com', '0345-6789012', '654 Retail Plaza', 'Gujrat', 'Punjab', '50700', 'Pakistan', 'Cashier', 18000.00);


  ----->(TABLE NAME: Supplier)<----- 
INSERT INTO Supplier (SupplierID, SupplierName, ContactPerson, Email, PhoneNumber, Supplier_Address, City, StateProvince, PostalCode, Country)
VALUES
  (1, 'Asian Books Co.', 'John Lee', 'john.lee@asianbooksco.com', '+65 9876 5432', '123 Orchard Road', 'Singapore', 'Singapore', '123456', 'Singapore'),
  (2, 'Tokyo Publishing House', 'Yuki Tanaka', 'yuki.tanaka@tokyopublishing.com', '+81 3 1234 5678', '456 Ginza Street', 'Tokyo', 'Tokyo', '789012', 'Japan'),
  (3, 'Shanghai Literature Group', 'Li Wei', 'li.wei@shanghailitgroup.com', '+86 21 9876 5432', '789 Nanjing Road', 'Shanghai', 'Shanghai', '345678', 'China'),
  (4, 'Delhi Books Emporium', 'Rajesh Sharma', 'rajesh.sharma@delhibooks.com', '+91 11 2345 6789', '234 Connaught Place', 'New Delhi', 'Delhi', '567890', 'India'),
  (5, 'Seoul Book Distributors', 'Kim Min-ji', 'minji.kim@seoulbooks.co.kr', '+82 2 3456 7890', '789 Jongno Street', 'Seoul', 'Seoul', '901234', 'South Korea');


  ----->(TABLE NAME: OrderHeader)<----- 
INSERT INTO OrderHeader (OrderID, CustomerID, OrderDate)
VALUES
  (1, 4, '2023-07-25'),
  (2, 2, '2023-07-26'),
  (3, 4, '2023-07-27'),
  (4, 6, '2023-07-27'),
  (5, 7, '2023-07-28'),
  (6, 10,'2023-07-29'),
  (7, 11, '2023-07-30'),
  (8, 17, '2023-07-30'),
  (9, 15, '2023-07-31'),
  (10, 13, '2023-08-01'),
  (11, 14, '2023-08-02'),
  (12, 18, '2023-08-03'),
  (13, 19, '2023-08-04'),
  (14, 11, '2023-08-04'),
  (15, 12, '2023-08-05'),
  (16, 17, '2023-08-06'),
  (17, 15, '2023-08-07'),
  (18, 21, '2023-08-08'),
  (19, 9, '2023-08-08'),
  (20, 9, '2023-08-09'),
  (21, 10, '2023-08-10'),
  (22, 13, '2023-08-11'),
  (23, 17, '2023-08-12'),
  (24, 21, '2023-08-12'),
  (25, 25, '2023-08-13'),
  (26, 24, '2023-08-14'),
  (27, 24, '2023-08-15'),
  (28, 23, '2023-08-15'),
  (29, 6, '2023-08-16'),
  (30, 9, '2023-08-17');


  ----->(TABLE NAME: Order Payment)<----- 
INSERT INTO OrderPayment (OrderID, TotalAmount, PaymentMethod, PaymentStatus)
VALUES
  (1, 125.50, 'Credit Card', 'Paid'),
  (2, 75.99, 'Cash on Delivery', 'Pending'),
  (3, 89.75, 'Online Bank Transfer', 'Paid'),
  (4, 50.25, 'Credit Card', 'Paid'),
  (5, 35.80, 'Cash on Delivery', 'Paid'),
  (6, 45.25, 'Online Bank Transfer', 'Paid'),
  (7, 65.99, 'Cash on Delivery', 'Paid'),
  (8, 32.50, 'Credit Card', 'Paid'),
  (9, 70.75, 'Credit Card', 'Pending'),
  (10, 28.50, 'Cash on Delivery', 'Paid'),
  (11, 37.80, 'Online Bank Transfer', 'Paid'),
  (12, 22.95, 'Cash on Delivery', 'Paid'),
  (13, 59.99, 'Credit Card', 'Paid'),
  (14, 40.75, 'Cash on Delivery', 'Paid'),
  (15, 80.50, 'Online Bank Transfer', 'Paid'),
  (16, 19.95, 'Credit Card', 'Paid'),
  (17, 38.25, 'Cash on Delivery', 'Pending'),
  (18, 46.99, 'Credit Card', 'Paid'),
  (19, 55.50, 'Cash on Delivery', 'Paid'),
  (20, 65.75, 'Credit Card', 'Paid'),
  (21, 75.25, 'Cash on Delivery', 'Paid'),
  (22, 26.80, 'Online Bank Transfer', 'Paid'),
  (23, 28.95, 'Credit Card', 'Pending'),
  (24, 50.50, 'Cash on Delivery', 'Paid'),
  (25, 62.99, 'Online Bank Transfer', 'Paid'),
  (26, 15.75, 'Credit Card', 'Paid'),
  (27, 34.50, 'Cash on Delivery', 'Paid'),
  (28, 25.95, 'Credit Card', 'Paid'),
  (29, 40.80, 'Cash on Delivery', 'Paid'),
  (30, 45.99, 'Credit Card', 'Paid');

  ----->(TABLE NAME: BookOrder)<----- 
INSERT INTO BookOrder (OrderID, BookID, Quantity)
VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 5, 3),
    (3, 7, 1),
    (4, 2, 2),
    (4, 10, 1),
    (5, 1, 1),
    (6, 3, 4),
    (6, 8, 2),
    (7, 1, 3),
    (8, 12, 1),
    (9, 1, 2),
    (9, 13, 1),
    (10, 3, 1),
    (10, 9, 1),
    (11, 5, 2),
    (12, 3, 1),
    (13, 6, 1),
    (14, 7, 2),
    (15, 1, 1),
    (15, 8, 1),
    (15, 13, 3),
    (16, 9, 2),
    (17, 2, 1),
    (18, 1, 1),
    (18, 11, 1),
    (19, 6, 2),
    (20, 4, 1),
    (20, 9, 1),
    (21, 7, 1),
    (21, 13, 1),
    (22, 10, 3),
    (23, 5, 1),
    (23, 12, 2),
    (24, 2, 1),
    (24, 11, 1),
    (25, 6, 1),
    (25, 13, 1),
    (26, 3, 2),
    (27, 8, 1),
    (28, 1, 1),
    (28, 12, 1),
    (29, 5, 2),
    (30, 3, 1),
    (30, 7, 1);

  -- Insert data into PurchaseHeader table
INSERT INTO PurchaseHeader (PurchaseID, SupplierID, PurchaseDate)
VALUES
  (1, 1, '2023-07-25'),
  (2, 3, '2023-07-26'),
  (3, 5, '2023-07-27'),
  (4, 2, '2023-07-28'),
  (5, 4, '2023-07-28'),
  (6, 4, '2023-07-29'),
  (7, 2, '2023-07-30'),
  (8, 1, '2023-07-30'),
  (9, 5, '2023-07-31'),
  (10, 3, '2023-08-01'),
  (11, 3, '2023-08-02'),
  (12, 1, '2023-08-03'),
  (13, 5, '2023-08-04'),
  (14, 2, '2023-08-04'),
  (15, 4, '2023-08-05'),
  (16, 3, '2023-08-06'),
  (17, 1, '2023-08-07'),
  (18, 2, '2023-08-08'),
  (19, 5, '2023-08-08'),
  (20, 4, '2023-08-09');

-- Insert data into PurchaseItem table
INSERT INTO PurchaseItem (PurchaseItemID, PurchaseID, BookID, Quantity, UnitPrice)
VALUES
  (1, 1, 12, 50, 10.99),
  (2, 1, 16, 30, 15.50),
  (3, 2, 18, 20, 12.75),
  (4, 2, 13, 40, 14.95),
  (5, 3, 15, 25, 18.25),
  (6, 3, 19, 35, 11.80),
  (7, 4, 11, 10, 20.99),
  (8, 4, 1, 15, 17.50),
  (9, 5, 7, 50, 8.99),
  (10, 5, 21, 30, 9.95),
  (11, 6, 22, 20, 18.99),
  (12, 6, 23, 15, 22.50),
  (13, 7, 27, 30, 11.99),
  (14, 19, 54, 25, 14.75),
  (15, 8, 62, 40, 12.80),
  (16, 8, 66, 20, 16.95),
  (17, 9, 57, 50, 9.50),
  (18, 9, 69, 35, 13.25),
  (19, 10, 65, 10, 23.99),
  (20, 10, 39, 15, 19.95),
  (21, 11, 41, 25, 20.50),
  (22, 11, 32, 30, 15.99),
  (23, 12, 16, 20, 17.75),
  (24, 12, 17, 15, 12.80),
  (25, 13, 18, 30, 9.99),
  (26, 13, 59, 25, 14.25),
  (27, 14, 5, 35, 8.50),
  (28, 14, 71, 40, 18.95),
  (29, 15, 6, 10, 24.99),
  (30, 15, 7, 20, 19.50);


  INSERT INTO BookCategories (GenreID, CategoryName)
VALUES
  (1, 'Fiction'),
  (2, 'Science Fiction'),
  (3, 'Mystery'),
  (4, 'Romance'),
  (5, 'Fantasy'),
  (6, 'Children Literature'),
  (7, 'Literary Fiction'),
  (8, 'Young Adult'),
  (9, 'Biography'),
  (10, 'History'),
  (11, 'Thriller'),
  (12, 'Graphical Novel'),
  (13, 'Cyberpunk'),
  (14, 'Classic'),
  (15, 'Horror'),
  (16, 'Self Help'),
  (17,'Magical Realism');

  
 
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


--->25-Show all Employees and rank by salary:
CREATE PROCEDURE ALL_EMPLOYEE 
AS
BEGIN
SELECT Employees.EmployeeID,Employees.FirstName,Employees.LastName,Employees.PhoneNumber,Employees.City,Employees.JobTitle,
MAX(Employees.Salary) AS Highest_Salary from Employees 
GROUP BY Employees.EmployeeID,Employees.FirstName,
Employees.JobTitle,Employees.LastName,Employees.City,Employees.PhoneNumber ORDER BY Highest_Salary DESC;
END;

EXEC ALL_EMPLOYEE

-->26-Show Employees Data Who Live in Karachi,Islamabad,Gujrat and Sialkot and Employees Salary should be grater than 23000.
CREATE PROCEDURE Employees_info @city VARCHAR(20),@salary int
AS
BEGIN
SELECT Employees.EmployeeID,Employees.FirstName,Employees.LastName,Employees.PhoneNumber,Employees.Country,Employees.Employee_Address,
Employees.Email,Employees.City,Employees.JobTitle,Employees.Salary,Employees.PostalCode from Employees 
where City in(@city) and Salary > @salary;
END;

exec Employees_info 'Lahore' , 23000


---->27-Which Job have Highest Job salary and how much:
Select top 1 Employees.JobTitle,Employees.Salary from Employees ORDER BY Salary DESC;


--->28-List Customer names who live in state Punjab and city (Lahore,Rawalpindi):
CREATE PROCEDURE Customer_Location @city VARCHAR(20) ,@province VARCHAR(20)
AS
BEGIN
SELECT Customer.CustomerID,Customer.FirstName,Customer.LastName,Customer.City,Customer.StateProvince,Customer.Email,
Customer.Customer_Address,Customer.PhoneNumber,Customer.Country,
Customer.PostalCode from Customer where City in(@city) and StateProvince=@province;
END;

exec Customer_Location  'Lahore' ,  'Punjab'

--->29-Search Employee By Name:
CREATE PROCEDURE SEARCH_EMPLOYEE @f_name VARCHAR(30),@l_name VARCHAR(30)
AS
BEGIN

SELECT *from Employees where Employees.FirstName=@f_name and Employees.LastName=@l_name;
END;

EXEC SEARCH_EMPLOYEE 'Fatima','Ali'

-->30-Make a list of Customers According to province:
CREATE PROCEDURE Customer_Province @province VARCHAR(30)
AS
BEGIN
SELECT Customer.StateProvince,COUNT(Customer.StateProvince) AS Number_Of_Customers from Customer GROUP BY Customer.StateProvince
Having Customer.StateProvince=@province
END;

EXEC Customer_Province 'Punjab'

--->31-Show Paid Order in Database:
CREATE PROCEDURE payment_status_customer @status VARCHAR(10)
AS
BEGIN
Select OrderHeader.OrderID,OrderHeader.CustomerID,OrderHeader.OrderDate,OrderPayment.TotalAmount,OrderPayment.PaymentMethod,
OrderPayment.PaymentStatus from OrderHeader inner join OrderPayment
ON OrderHeader.OrderID=OrderPayment.OrderID where OrderPayment.PaymentStatus=@status;
END;

exec payment_status_customer  'Pending'

---->32-Search Book By Category:
CREATE PROCEDURE book_category @name VARCHAR (20)
AS
BEGIN
SELECT *from BookInfo inner join BookCategories on BookInfo.GenreID=BookCategories.GenreID where BookCategories.CategoryName=@name

END;

exec book_category 'Classic';



---->33-List Complete Purchase data (Supplier + Book):
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

EXEC BOOK_ORDER_CUSTOMER  34,9,'2023-08-03','Cash','Paid',11,2


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

EXEC Purchace_books 35,24,1,'2023-02-09',18,10,18.34

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


  
 



