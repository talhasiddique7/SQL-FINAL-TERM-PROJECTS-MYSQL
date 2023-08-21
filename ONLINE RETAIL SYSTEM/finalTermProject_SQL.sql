create database online_retail;


use online_retail;


drop table customers;
drop table payment_details;
drop table shipment_addresses;
drop table order_details;
drop table order_items;
drop table catagories;
drop table product;




create table customers(
	id int primary key,
	username varchar(50) not null,
	email varchar(50) unique,
	password varchar(50),
	number varchar(50) unique,
	address varchar(100) not null
);


CREATE TABLE payment_details(
    id int primary key,
    amount int,
    created_at datetime,
    payment_method varchar(50),
    transaction_id varchar(50)
);

create table shipment_addresses(
	id int primary key,
	address varchar(100),
	city varchar(100),
	state varchar(100),
	country varchar(100),
	zip_code varchar(10)

	--foreign key 
	,customer_id int
	foreign key (customer_id) references customers(id) 
	
);


drop table order_details;
delete from order_details;



create table order_details(
	id int primary key,
	order_date datetime,

	

	-- foreign keys
	customer_id int,
	payment_id int,
	shipment_id int,

	foreign key (customer_id) references customers(id),
	foreign key (payment_id) references payment_details(id),
	foreign key (shipment_id) references shipment_addresses(id)
);




create table order_items(
	id int primary key,
	quantity int,

	-- foreign keys acts as a intermediate between manay to many relationship...
	order_id int,
	product_id int,

	foreign key (order_id) references order_details(id),
	foreign key (product_id) references products(id)

	

);
drop table categories;
create table categories(
	id int primary key,
	cat_name varchar(50) not null,

);

create table Product_inventory(
	id int primary key,
	quantity int,
	created_at datetime

);

drop table discounts;


create table discounts(
	id int primary key,
	name varchar(100),
	discount_percent decimal(4,2),
	created_at datetime
);
drop table product;
create table products(
	id int primary key,
	product_name varchar(50) not null,
	product_desc varchar(50),
	product_price decimal(10,2), 


	-- foreign keys...
	category_id int,
	inventory_id int,
	discount_id int,
	foreign key (category_id) references categories(id),
	foreign key (inventory_id) references product_inventory(id)	
	,foreign key (discount_id) references discounts(id)
);


select * from customers;


INSERT INTO customers (id, username, email, password, number, address) VALUES
(1, 'John', 'john1@example.com', 'pass1', 'num1', '123 Main Street'),
(2, 'Emma', 'emma2@example.com', 'pass2', 'num2', '456 Elm Avenue'),
(3, 'Michael', 'michael3@example.com', 'pass3', 'num3', '789 Oak Lane'),
(4, 'Sophia', 'sophia4@example.com', 'pass4', 'num4', '789 Maple Drive'),
(5, 'William', 'william5@example.com', 'pass5', 'num5', '555 Pine Road'),
(6, 'Olivia', 'olivia6@example.com', 'pass6', 'num6', '222 Cedar Lane'),
(7, 'James', 'james7@example.com', 'pass7', 'num7', '333 Birch Avenue'),
(8, 'Ava', 'ava8@example.com', 'pass8', 'num8', '444 Elm Street'),
(9, 'Alexander', 'alexander9@example.com', 'pass9', 'num9', '777 Oak Road'),
(10, 'Isabella', 'isabella10@example.com', 'pass10', 'num10', '999 Maple Drive'),
(11, 'Ethan', 'ethan11@example.com', 'pass11', 'num11', '111 Pine Avenue'),
(12, 'Mia', 'mia12@example.com', 'pass12', 'num12', '555 Cedar Lane'),
(13, 'Daniel', 'daniel13@example.com', 'pass13', 'num13', '777 Birch Road'),
(14, 'Charlotte', 'charlotte14@example.com', 'pass14', 'num14', '444 Elm Avenue'),
(15, 'Matthew', 'matthew15@example.com', 'pass15', 'num15', '333 Oak Lane'),
(16, 'Amelia', 'amelia16@example.com', 'pass16', 'num16', '888 Maple Drive'),
(17, 'Oliver', 'oliver17@example.com', 'pass17', 'num17', '999 Pine Road'),
(18, 'Sophie', 'sophie18@example.com', 'pass18', 'num18', '222 Cedar Lane'),
(19, 'Lucas', 'lucas19@example.com', 'pass19', 'num19', '777 Birch Avenue'),
(20, 'Lily', 'lily20@example.com', 'pass20', 'num20', '666 Elm Street'),
(21, 'Benjamin', 'benjamin21@example.com', 'pass21', 'num21', '555 Oak Lane'),
(22, 'Emily', 'emily22@example.com', 'pass22', 'num22', '111 Maple Drive'),
(23, 'Aiden', 'aiden23@example.com', 'pass23', 'num23', '444 Pine Avenue'),
(24, 'Avery', 'avery24@example.com', 'pass24', 'num24', '888 Cedar Lane'),
(25, 'Abigail', 'abigail25@example.com', 'pass25', 'num25', '666 Birch Road'),
(26, 'Elijah', 'elijah26@example.com', 'pass26', 'num26', '555 Elm Avenue'),
(27, 'Harper', 'harper27@example.com', 'pass27', 'num27', '222 Oak Lane'),
(28, 'Daniel', 'daniel28@example.com', 'pass28', 'num28', '333 Maple Drive'),
(29, 'Elizabeth', 'elizabeth29@example.com', 'pass29', 'num29', '777 Pine Road'),
(30, 'David', 'david30@example.com', 'pass30', 'num30', '111 Cedar Lane'),
(31, 'Scarlett', 'scarlett31@example.com', 'pass31', 'num31', '444 Birch Avenue'),
(32, 'Joseph', 'joseph32@example.com', 'pass32', 'num32', '888 Elm Street'),
(33, 'Victoria', 'victoria33@example.com', 'pass33', 'num33', '666 Oak Road'),
(34, 'Lucas', 'lucas34@example.com', 'pass34', 'num34', '555 Maple Drive'),
(35, 'Grace', 'grace35@example.com', 'pass35', 'num35', '222 Pine Avenue'),
(36, 'Benjamin', 'benjamin36@example.com', 'pass36', 'num36', '444 Cedar Lane'),
(37, 'Aria', 'aria37@example.com', 'pass37', 'num37', '888 Birch Road'),
(38, 'Samuel', 'samuel38@example.com', 'pass38', 'num38', '666 Elm Avenue'),
(39, 'Madison', 'madison39@example.com', 'pass39', 'num39', '555 Oak Lane'),
(40, 'Ethan', 'ethan40@example.com', 'pass40', 'num40', '222 Maple Drive'),
(41, 'Avery', 'avery41@example.com', 'pass41', 'num41', '111 Pine Road'),
(42, 'Harper', 'harper42@example.com', 'pass42', 'num42', '444 Cedar Lane'),
(43, 'Elizabeth', 'elizabeth43@example.com', 'pass43', 'num43', '777 Birch Avenue'),
(44, 'Daniel', 'daniel44@example.com', 'pass44', 'num44', '888 Elm Street'),
(45, 'Aiden', 'aiden45@example.com', 'pass45', 'num45', '666 Oak Road'),
(46, 'Ella', 'ella46@example.com', 'pass46', 'num46', '555 Pine Avenue'),
(47, 'Benjamin', 'benjamin47@example.com', 'pass47', 'num47', '222 Cedar Lane'),
(48, 'Chloe', 'chloe48@example.com', 'pass48', 'num48', '333 Birch Road'),
(49, 'James', 'james49@example.com', 'pass49', 'num49', '777 Elm Avenue'),
(50, 'Grace', 'grace50@example.com', 'pass50', 'num50', '888 Oak Lane');





INSERT INTO payment_details(id, amount, created_at, payment_method, transaction_id) VALUES
(1, 1000, '2023-07-31 12:34:56', 'Credit Card', 'TXN001'),
(2, 2500, '2023-07-30 10:45:23', 'PayPal', 'TXN002'),
(3, 500, '2023-07-29 15:22:10', 'Debit Card', 'TXN003'),
(4, 750, '2023-07-28 18:50:42', 'Google Pay', 'TXN004'),
(5, 3000, '2023-07-27 14:12:30', 'Credit Card', 'TXN005'),
(6, 800, '2023-07-26 11:11:11', 'Apple Pay', 'TXN006'),
(7, 1200, '2023-07-25 09:30:15', 'Debit Card', 'TXN007'),
(8, 600, '2023-07-24 08:05:55', 'PayPal', 'TXN008'),
(9, 1500, '2023-07-23 13:20:33', 'Google Pay', 'TXN009'),
(10, 2000, '2023-07-22 17:40:22', 'Credit Card', 'TXN010'),
(11, 1800, '2023-07-21 20:15:18', 'Apple Pay', 'TXN011'),
(12, 300, '2023-07-20 22:55:45', 'Debit Card', 'TXN012'),
(13, 4500, '2023-07-19 11:30:05', 'PayPal', 'TXN013'),
(14, 900, '2023-07-18 14:18:38', 'Google Pay', 'TXN014'),
(15, 2700, '2023-07-17 16:48:09', 'Credit Card', 'TXN015'),
(16, 700, '2023-07-16 19:27:59', 'Apple Pay', 'TXN016'),
(17, 1000, '2023-07-15 23:10:30', 'Debit Card', 'TXN017'),
(18, 5000, '2023-07-14 07:57:22', 'PayPal', 'TXN018'),
(19, 350, '2023-07-13 05:40:12', 'Google Pay', 'TXN019'),
(20, 6000, '2023-07-12 04:22:05', 'Credit Card', 'TXN020');



select * from shipment_addresses;
delete from shipment_addresses;

INSERT INTO shipment_addresses (id, address, city, state, country, zip_code, customer_id) VALUES
(1, '123 Main Street', 'New York City', 'New York', 'USA', '10001', 6),
(2, '456 Elm Avenue', 'Los Angeles', 'California', 'USA', '90001', 3),
(3, '789 Oak Lane', 'Chicago', 'Illinois', 'USA', '60601', 1),
(4, '789 Maple Drive', 'Houston', 'Texas', 'USA', '77001', 15),
(5, '555 Pine Road', 'Phoenix', 'Arizona', 'USA', '85001', 18),
(6, '222 Cedar Lane', 'Philadelphia', 'Pennsylvania', 'USA', '19101', 9),
(7, '333 Birch Avenue', 'San Antonio', 'Texas', 'USA', '78201', 10),
(8, '444 Elm Street', 'San Diego', 'California', 'USA', '92101', 3),
(9, '777 Oak Road', 'Dallas', 'Texas', 'USA', '75201', 4),
(10, '999 Maple Drive', 'San Jose', 'California', 'USA', '95101', 9),
(11, '111 Pine Avenue', 'Austin', 'Texas', 'USA', '78701', 30),
(12, '555 Cedar Lane', 'Jacksonville', 'Florida', 'USA', '32201', 21),
(13, '777 Birch Road', 'Fort Worth', 'Texas', 'USA', '76101', 24),
(14, '444 Elm Avenue', 'Columbus', 'Ohio', 'USA', '43201', 7),
(15, '333 Oak Lane', 'Charlotte', 'North Carolina', 'USA', '28201', 23),
(16, '888 Maple Drive', 'Indianapolis', 'Indiana', 'USA', '46201', 5),
(17, '999 Pine Road', 'Seattle', 'Washington', 'USA', '98101', 11),
(18, '222 Cedar Lane', 'Denver', 'Colorado', 'USA', '80201', 18),
(19, '777 Birch Avenue', 'Washington', 'District of Columbia', 'USA', '20001', 2),
(20, '666 Elm Street', 'Boston', 'Massachusetts', 'USA', '02101', 35);




select * from order_details;


-- Order 1
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(1, '2023-07-31 12:34:56', 10, 13, 18);

-- Order 2
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(2, '2023-07-30 10:45:23', 15, 12, 4);

-- Order 3
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(3, '2023-07-29 15:22:10', 35, 12, 10);

-- Order 4
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(4, '2023-07-28 16:12:45', 7, 11, 5);

-- Order 5
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(5, '2023-07-27 14:18:22', 13, 1, 2);

-- Order 6
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(6, '2023-07-26 11:11:11', 3, 2, 17);

-- Order 7
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(7, '2023-07-25 09:30:15', 18, 10, 4);

-- Order 8
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(8, '2023-07-24 08:05:55', 22, 15, 8);

-- Order 9
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(9, '2023-07-23 13:20:33', 8, 3, 5);

-- Order 10
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(10, '2023-07-22 17:40:22', 6, 4, 20);

-- Order 11
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(11, '2023-07-21 20:15:18', 11, 5, 13);

-- Order 12
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(12, '2023-07-20 22:55:45', 17, 15, 7);

-- Order 13
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(13, '2023-07-19 11:30:05', 19, 9, 14);

-- Order 14
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(14, '2023-07-18 14:18:38', 16, 4, 1);

-- Order 15
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(15, '2023-07-17 16:48:09', 4, 13, 6);

-- Order 16
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(16, '2023-07-16 19:27:59', 2, 6, 2);

-- Order 17
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(17, '2023-07-15 23:10:30',9, 12, 3);

-- Order 18
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(18, '2023-07-14 07:57:22', 9, 6, 8);

-- Order 19
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(19, '2023-07-13 05:40:12', 14, 3, 4);

-- Order 20
INSERT INTO order_details (id, order_date, customer_id, payment_id, shipment_id) VALUES
(20, '2023-07-12 04:22:05', 20, 11, 5);


INSERT INTO order_items (id, quantity, order_id, product_id) VALUES
(1, 12, 13, 1),
(2, 30, 1, 20),
(3, 15, 2, 3),
(4, 5, 2, 4),
(5, 2, 13, 1),
(6, 4, 3, 5),
(7, 3, 4, 12),
(8, 2, 4, 13),
(9, 1, 15, 4),
(10, 2, 5, 16),
(11, 3, 6, 5),
(12, 1, 6, 3),
(13, 4, 17, 15),
(14, 2, 7, 2),
(15, 1, 8, 11),
(16, 3, 8, 14),
(17, 2, 19, 13),
(18, 1, 9, 15),
(19, 5, 10, 12),
(20, 3, 10, 11);






INSERT INTO categories (id, cat_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home and Garden'),
(4, 'Toys and Games'),
(5, 'Books'),
(6, 'Sports and Outdoors'),
(7, 'Beauty and Personal Care'),
(8, 'Automotive'),
(9, 'Health and Wellness'),
(10, 'Pet Supplies'),
(11, 'Office Supplies'),
(12, 'Jewelry and Watches'),
(13, 'Movies and Music'),
(14, 'Baby Products'),
(15, 'Food and Beverages'),
(16, 'Home Appliances'),
(17, 'Furniture'),
(18, 'Tools and Hardware'),
(19, 'Fitness Equipment'),
(20, 'Crafts and Hobbies');

INSERT INTO Product_inventory (id, quantity, created_at) VALUES
(1, 50, '2023-07-31 12:34:56'),
(2, 30, '2023-07-30 10:45:23'),
(3, 20, '2023-07-29 15:22:10'),
(4, 15, '2023-07-28 16:12:45'),
(5, 10, '2023-07-27 14:18:22'),
(6, 25, '2023-07-26 11:11:11'),
(7, 40, '2023-07-25 09:30:15'),
(8, 5, '2023-07-24 08:05:55'),
(9, 60, '2023-07-23 13:20:33'),
(10, 12, '2023-07-22 17:40:22'),
(11, 18, '2023-07-21 20:15:18'),
(12, 22, '2023-07-20 22:55:45'),
(13, 7, '2023-07-19 11:30:05'),
(14, 35, '2023-07-18 14:18:38'),
(15, 40, '2023-07-17 16:48:09'),
(16, 3, '2023-07-16 19:27:59'),
(17, 28, '2023-07-15 23:10:30'),
(18, 11, '2023-07-14 07:57:22'),
(19, 14, '2023-07-13 05:40:12'),
(20, 8, '2023-07-12 04:22:05');

INSERT INTO discounts (id, name, discount_percent, created_at) VALUES
(1, 'Summer Sale', 20.00, '2023-07-31 12:34:56'),
(2, 'Back to School', 15.50, '2023-07-30 10:45:23'),
(3, 'Flash Deal', 10.25, '2023-07-29 15:22:10'),
(4, 'Clearance Sale', 30.75, '2023-07-28 16:12:45'),
(5, 'Holiday Special', 25.00, '2023-07-27 14:18:22'),
(6, 'Weekend Offer', 5.75, '2023-07-26 11:11:11'),
(7, 'Spring Promotion', 12.50, '2023-07-25 09:30:15'),
(8, 'New Year Sale', 18.00, '2023-07-24 08:05:55'),
(9, 'Black Friday', 40.00, '2023-07-23 13:20:33'),
(10, 'Cyber Monday', 22.50, '2023-07-22 17:40:22'),
(11, 'Christmas Discount', 30.25, '2023-07-21 20:15:18'),
(12, 'End of Season', 5.00, '2023-07-20 22:55:45'),
(13, 'Anniversary Sale', 15.75, '2023-07-19 11:30:05'),
(14, 'Mega Deal', 33.33, '2023-07-18 14:18:38'),
(15, 'Limited Time Offer', 8.00, '2023-07-17 16:48:09'),
(16, 'Customer Appreciation', 11.50, '2023-07-16 19:27:59'),
(17, 'Early Bird Discount', 20.75, '2023-07-15 23:10:30'),
(18, 'Buy One Get One Free', 50.00, '2023-07-14 07:57:22'),
(19, 'Student Discount', 15.25, '2023-07-13 05:40:12'),
(20, 'Senior Citizen Offer', 10.00, '2023-07-12 04:22:05');

INSERT INTO products (id, product_name, product_desc, product_price, category_id, inventory_id, discount_id) VALUES
(1, 'Smartphone', 'High-end smartphone', 599.99, 1, 5, 7),
(2, 'Laptop', 'Ultra-thin laptop', 899.99, 1, 6, 8),
(3, 'T-shirt', 'Cotton T-shirt', 19.99, 2, 10, 2),
(4, 'Jeans', 'Slim-fit jeans', 49.99, 2, 12, 5),
(5, 'Sofa', 'Comfortable sofa', 799.99, 3, 15, 3),
(6, 'Coffee Table', 'Modern coffee table', 149.99, 3, 14, 4),
(7, 'Board Game', 'Strategy board game', 29.99, 4, 19, 1),
(8, 'Action Figure', 'Collectible action figure', 24.99, 4, 20, 6),
(9, 'Novel', 'Bestselling novel', 12.99, 5, 1, 9),
(10, 'Cookbook', 'Delicious recipes', 17.99, 5, 3, 10),
(11, 'Yoga Mat', 'Non-slip yoga mat', 29.99, 6, 8, 15),
(12, 'Dumbbells', 'Set of dumbbells', 39.99, 6, 9, 12),
(13, 'Shampoo', 'Moisturizing shampoo', 9.99, 7, 2, 13),
(14, 'Facial Cleanser', 'Gentle facial cleanser', 12.99, 7, 4, 14),
(15, 'Car Battery', 'High-performance car battery', 109.99, 8, 18, 11),
(16, 'Motor Oil', 'Synthetic motor oil', 24.99, 8, 17, 16),
(17, 'Multivitamins', 'Daily multivitamin', 14.99, 9, 11, 17),
(18, 'Dog Food', 'Premium dog food', 34.99, 10, 7, 20),
(19, 'Printer', 'Wireless printer', 79.99, 11, 13, 19),
(20, 'Notebook', 'Spiral-bound notebook', 2.99, 11, 16, 18);



-- all procedures 

create procedure Allproducts
as
select * from products
go;

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

create procedure allpayment_details
as 
select * from payment_details
go;

create procedure allshipments
as select * from shipment_addresses
go;

create procedure allorder_details
as select * from order_details
go;

create procedure allorder_items
as select * from order_items
go;

create procedure allcategories
as select * from categories
go;

create procedure allProduct_inventory
as select * from Product_inventory
go;

create procedure alldiscounts
as select * from discounts
go;



create procedure lowQuantityProduct
as 
select top 1 product_name,quantity from products left join
Product_inventory on Product_inventory.id = products.id 
order by quantity
go

create procedure highestdiscount
as
select top 3 name,discount_percent from discounts order by discount_percent desc;
go

create procedure availableProducts
as
select product_name , product_desc from products;
go

drop procedure numberofusers
create procedure numberofusers
as 
select count(*) as numberOfUsers from customers;
go


create procedure topGoldenUsers
as
select top 3 username,order_date,amount,city,payment_method from customers 
inner join order_details on customers.id = order_details.customer_id
inner join payment_details on order_details.payment_id = payment_details.id
inner join shipment_addresses on order_details.shipment_id = shipment_addresses.id 
order by amount desc;
go






drop procedure customer_with_order_detail;


create procedure customer_with_order_detail
as
select username as name,product_name , quantity,amount as Total_amount
,shipment_addresses.address as shippingAddress from order_details
inner join order_items on 
order_items.order_id = order_details.id
inner join customers on order_details.customer_id = customers.id
inner join products on order_items.order_id = products.id
inner join payment_details on order_details.payment_id = payment_details.id
inner join shipment_addresses on shipment_addresses.id = order_details.shipment_id;
go


create procedure total_orders_and_amount
as
select count(*) as total_orders, sum(amount) as amount from order_details 
inner join payment_details on payment_details.id = order_details.id;
go




--- execution of the procedures

-- product information
exec allproducts;
-- product categories
exec allcategories;
-- payments details
exec allpayment_details;
-- customers details
exec selectAllcustomers;
-- shipment addresses
exec allshipments;
-- order details
exec allorder_details;
-- order items information
exec allorder_items;
-- information about the inventory items;
exec allProduct_inventory;
--- discounts on products;
exec alldiscounts;

----- give the name of the product with the lowest quantity..
exec lowQuantityProduct;

---- name the discount offer which provides the highest discount percentage
exec highestdiscount;

--- available products 
exec availableProducts;

--- how many users we have
exec numberofusers;


--- our top 3 goldern users details
exec topGoldenUsers;

--- customer and order details

exec customer_with_order_detail;


------ sum of the total orders and their total amount
exec total_orders_and_amount;

----- which day of the week has the most orders;
select DATENAME(WEEKDAY,order_date) as weekName from order_details
group by weekName;




