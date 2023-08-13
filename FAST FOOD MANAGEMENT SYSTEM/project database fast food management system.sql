
-----------------------------------------------------------------------

create table customer(
customer_id int primary key,
first_name varchar (30),
last_name varchar (30),
email_id varchar (50),
phone_no varchar (15)
);


insert into customer values
	(1,'ramish','tariq','tariqramish19@gmail.com','0314-4573113'),
	(2,'zain','ali','zain@gmail.com','0314-453243'),
	(3,'anas','majeed','anas19@gmail.com','03123-4573113'),
	(4,'nauman','ali','noman19@gmail.com','0314-44673113'),
	(5,'talha','siddique','talja19@gmail.com','0314-4573113'),
	(6,'iqra','tariq','iqra@gmail.com','0324-4579813'),
	(7,'komal','nawaz','komal@gmail.com','0328-9973113'),
	(8,'muneeb','shehzd','mneeb@gmail.com','0301-4573999'),
	(9,'kamal','tariq','kamal@gmail.com','0333-4573111'),
	(10,'jamal','tariq','jamal@gmail.com','0324-4573113');




Select * from customer

--------------------------------------------------------------------------

create table pizza_item(
pizza_id int primary key,
pizza_name varchar (30),
pizza_description varchar (100),
pizza_type varchar (10),
pizza_price decimal (8,2),
);

insert into pizza_item
values(1,'royal crust pizza','classic chicken chesse pizza','L', 2000.00);
insert into pizza_item
values(2,'royal cheese pizza','classic chicken chesse pizza','L', 2500.00);
insert into pizza_item
values(3,'crown crust pizza','classic chicken chesse pizza','M', 1500.00);
insert into pizza_item
values(4,'malai crust pizza','classic chicken chesse pizza','L', 2000.00);
insert into pizza_item
values(5,'fajita pizza','classic chicken chesse pizza','S', 1000.00);

select *from pizza_item


--------------------------------------------------------------------------------


create table burger_item(
burger_id int primary key,
burger_name varchar (30),
burger_description varchar (100),
burger_price decimal (8,2)
);



insert into burger_item
values(1,'royal crust burger','classic chicken chesse burger', 500.00);
insert into burger_item
values(2,'royal cheese burger','classic chicken chesse burger', 700.00);
insert into burger_item
values(3,'crown crust burger','classic chicken chesse burger', 300.00);
insert into burger_item
values(4,'malai crust burger','classic chicken chesse burger', 400.00);
insert into burger_item
values(5,'fajita burger','classic chicken chesse burger', 500.00);

select *from burger_item

-------------------------------------------------------------------------------------


create table pizza_orders(
order_id int primary key,
customer_id int,
pizza_id int,
order_date date,
quantity int,
total_amount decimal (8,2),
payment_method varchar(20),

foreign key (customer_id) references customer(customer_id),
foreign key (pizza_id) references pizza_item (pizza_id),

);

insert into pizza_orders values
	(1,1,2,'2023-09-12',1,2500.00 , 'Cash'),
	(2,1,3,'2023-09-14',3,4500.00 , 'Credit Card'),
	(3,3,2,'2023-09-13',2,5000.00 , 'Cash'),
	(4,4,1,'2023-09-15',1,2000.00 , 'Cash'),
	(5,2,5,'2023-09-12',1,1000.00 , 'Debit Card'),
	(6,4,5,'2023-09-11',2,2000.00 , 'Debit Card');

select * from pizza_orders


-------------------------------------------------------------------------------------



create table burger_orders(
order_id int primary key,
customer_id int,
burger_id int,
order_date date,
quantity int,
total_amount decimal (8,2),
payment_method varchar(20),

foreign key (customer_id) references customer(customer_id),
foreign key (burger_id) references burger_item (burger_id),

);

insert into burger_orders values
	(1,1,2,'2023-09-12',1,700.00 , 'Cash'),
	(2,6,3,'2023-09-12',2,900.00 , 'Cash'),
	(3,7,2,'2023-09-12',6,4200.00 , 'Debit Card'),
	(4,5,1,'2023-09-15',4,2000.00 , 'Credit Card'),
	(5,2,4,'2023-09-12',1,400.00 , 'Cash'),
	(6,4,5,'2023-09-11',2,1000.00 , 'Cash');

select * from pizza_orders



--------------------------------------------------------------------------

Create table Tables (
	table_id int primary key,
	capcity int,
	Status varchar(20),

);

Insert into Tables Values 
(101,6,'Reserved'),
(102,4,'Reserved'),
(103,6,'Available'),
(104,2,'Available'),
(105,4,'Reserved');

select *from Tables

----------------------------------------------------------------------------------------------------




Create Table Reservation (
	Reservation_ID int primary key,
	Customer_ID int,
	Table_ID int,
	Reservation_Date date,

	Foreign key (Customer_ID) references customer(customer_id),
	Foreign key (Table_ID) references Tables (table_id),

);

Insert into Reservation Values
(1,5,101,'2023-07-09'),
(2,3,102,'2023-07-09'),
(3,9,105,'2023-07-10');



select * from Reservation



----------------------------------------------------------------------------




create table employees(
employees_id int primary key,
first_name varchar (30),
last_name varchar (30),
designation varchar(50),
salary decimal (8,2),
--hire_date date 
);

insert into employees
values(1,'saad','ali','Cashier',5000.00);
insert into employees
values(2,'asad','ali','Cook',20000.00);
insert into employees
values(3,'saud','ali','Cook',50000.00);
insert into employees
values(4,'zaid','ali','Manager',45500.00);
insert into employees
values(5,'shakeel','ali','Waiter',500.00);


select *from employees



---------------------------------------------------------------------------------------------------------


Create Table Delivery (
	Delivery_id int primary key,
	Delivery_man varchar (30),
	Delivery_man_contact varchar(30),
	customer_id int,
	delivery_date date,

	foreign key (customer_id) references customer(customer_id)
);

insert into Delivery values
	(1,'Amjad Ai' , '0332-4582701' , 2 , '2021-08-14'),
	(2, 'Ahsan Ali', '0341-5509011' , 4 , '2021-01-19'),
	(3, 'Talha Ali', '0341-5509341' , 6 , '2021-01-29');

	select * from Delivery


-------------------------------------------------------------------------------------------------------------












--Select all records from the customer table:
SELECT * FROM customer;

--Select all records from the pizza_item table:
SELECT * FROM pizza_item;

--Select all records from the burger_item table:
SELECT * FROM burger_item;

--Select all records from the pizza_orders table:
SELECT * FROM pizza_orders;

--Select all records from the burger_orders table:
SELECT * FROM burger_orders;

--Select all records from the Tables table:
SELECT * FROM Tables;

--Select all records from the Reservation table:
SELECT * FROM Reservation;

--Select all records from the employees table:
SELECT * FROM employees;

--Select the first name and last name of all customers:
SELECT first_name, last_name FROM customer;

--Select the pizza names and their prices:
SELECT pizza_name, pizza_price FROM pizza_item;

--Select the burger names and their prices:
SELECT burger_name, burger_price FROM burger_item;

--Select the order_id, customer_id, and total_amount from the pizza_orders table:
SELECT order_id, customer_id, total_amount FROM pizza_orders;

--Select the order_id, customer_id, and total_amount from the burger_orders table:
SELECT order_id, customer_id, total_amount FROM burger_orders;

--Select the table_id and capacity of all tables:
SELECT table_id, capcity FROM Tables;

--Select the reservation_id, customer_id, and reservation_date from the Reservation table:
SELECT Reservation_ID, Customer_ID, Reservation_Date FROM Reservation;

--Select the first name, last name, and salary of all employees:
SELECT first_name, last_name, salary FROM employees;

--Count the total number of customers in the customer table:
SELECT COUNT(customer_id) AS total_customers FROM customer;

--Calculate the average pizza price:
SELECT AVG(pizza_price) AS average_pizza_price FROM pizza_item;

--Calculate the total amount spent by each customer in pizza orders:
SELECT customer_id, SUM(total_amount) AS total_spent FROM pizza_orders GROUP BY customer_id;

--Find the highest pizza price:
SELECT MAX(pizza_price) AS highest_pizza_price FROM pizza_item;

--Find the lowest pizza price:
SELECT MIN(pizza_price) AS lowest_pizza_price FROM pizza_item;

--Find the customer who spent the most on burger orders:
SELECT top 1 customer_id, MAX(total_amount) AS max_spent FROM burger_orders GROUP BY customer_id ORDER BY max_spent DESC;
  
  --Find the customer who placed the first pizza order:
SELECT top 1 customer_id, MIN(order_date) AS first_pizza_order FROM pizza_orders GROUP BY customer_id ORDER BY first_pizza_order ASC;
 
 --Calculate the total earnings from pizza orders:
SELECT SUM(total_amount) AS total_earnings FROM pizza_orders;

--Calculate the total earnings from burger orders:
SELECT SUM(total_amount) AS total_earnings FROM burger_orders;

  --Find the busiest day with the most pizza orders:
SELECT top 1 order_date, COUNT(order_id) AS pizza_orders_count FROM pizza_orders GROUP BY order_date ORDER BY pizza_orders_count DESC;

 --Find the number of available tables:
SELECT COUNT(table_id) AS available_tables FROM Tables WHERE Status = 'Available';

   --FIND   NUMBER     OF RESEVERD TABLE
SELECT COUNT(table_id) AS reserved_tables FROM Tables WHERE Status = 'Reserved';


--Retrieve all delivery records:
SELECT * FROM Delivery;

--Retrieve delivery details for a specific delivery ID:
SELECT * FROM Delivery WHERE Delivery_id = 1;

--Retrieve delivery details for a specific customer ID:
SELECT * FROM Delivery WHERE customer_id = 2;

--Retrieve delivery records for a specific delivery date:
SELECT * FROM Delivery WHERE delivery_date = '2021-08-09';

--Retrieve deliveries along with customer information for a specific delivery man
SELECT Delivery.Delivery_id,Delivery.Delivery_man,Delivery.Delivery_man_contact,Delivery.delivery_date,Delivery.customer_id, customer.first_name, customer.last_name, customer.phone_no
FROM Delivery 
inner JOIN customer  ON Delivery.customer_id = customer.customer_id
WHERE Delivery_man = 'Amjad Ai';

--Retrieve the count of deliveries for each delivery man:
SELECT Delivery_man, COUNT(*) AS delivery_count
FROM Delivery
GROUP BY Delivery_man;

--Update the delivery date for a specific delivery ID:
select * from Delivery UPDATE Delivery
SET delivery_date = '2021-08-15'
WHERE Delivery_id = 2;







--Retrieve all pizza orders with customer information:
CREATE PROCEDURE PIZZA_ORDER_INFO
AS
BEGIN
SELECT pizza_orders.order_id, pizza_orders.order_date, pizza_orders.total_amount, pizza_orders.payment_method, customer.first_name, customer.last_name, customer.email_id, 
customer.phone_no
FROM pizza_orders 
inner JOIN customer  ON pizza_orders.customer_id = customer.customer_id;
END;


exec PIZZA_ORDER_INFO

--Retrieve all burger orders with customer information:
SELECT burger_orders.order_id, burger_orders.order_date, burger_orders.total_amount, burger_orders.payment_method, customer.first_name, customer.last_name, customer.email_id,
customer.phone_no
FROM burger_orders 
inner JOIN customer  ON burger_orders.customer_id = customer.customer_id;

--Retrieve all pizza orders along with the pizza details:
SELECT pizza_orders.order_id, pizza_item.pizza_name, pizza_item.pizza_type, pizza_item.pizza_price, pizza_orders.quantity, pizza_orders.total_amount
FROM pizza_orders 
inner JOIN pizza_item  ON pizza_orders.pizza_id = pizza_item.pizza_id;

--Retrieve all burger orders along with the burger details:
SELECT burger_orders.order_id, burger_item.burger_name, burger_item.burger_price, burger_orders.quantity, burger_orders.total_amount
FROM burger_orders 
inner JOIN burger_item  ON burger_orders.burger_id = burger_item.burger_id;

--Retrieve all reserved tables along with the customer information who made the reservation:
SELECT Reservation.Reservation_ID, Tables.table_id, Tables.Status, customer.first_name, customer.last_name, customer.email_id, customer.phone_no
FROM Reservation 
inner JOIN Tables  ON Reservation.Table_ID = Tables.table_id
inner JOIN customer  ON Reservation.Customer_ID = customer.customer_id;

--Retrieve all pizza orders with customer names and pizza details:
SELECT pizza_orders.order_id, customer.first_name, customer.last_name, pizza_item.pizza_name, pizza_item.pizza_type, pizza_orders.quantity, pizza_orders.total_amount
FROM pizza_orders 
inner JOIN customer  ON pizza_orders.customer_id = customer.customer_id
inner JOIN pizza_item  ON pizza_orders.pizza_id = pizza_item.pizza_id;

--Retrieve all burger orders with customer names and burger details:
SELECT burger_orders.order_id, customer.first_name, customer.last_name, burger_item.burger_name, burger_item.burger_price, burger_orders.quantity, burger_orders.total_amount
FROM burger_orders 
inner JOIN customer  ON burger_orders.customer_id = customer.customer_id
inner JOIN burger_item  ON burger_orders.burger_id = burger_item.burger_id;

--Retrieve the total number of pizza and burger orders placed by each customer:
SELECT customer.first_name, customer.last_name, COUNT(pizza_orders.order_id) AS pizza_orders, COUNT(burger_orders.order_id) AS burger_orders
FROM customer 
LEFT JOIN pizza_orders  ON customer.customer_id = pizza_orders.customer_id
LEFT JOIN burger_orders  ON customer.customer_id = burger_orders.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name;

--Retrieve the total sales amount for each pizza type:
SELECT pizza_item.pizza_type, SUM(pizza_orders.total_amount) AS total_sales
FROM pizza_orders 
inner JOIN pizza_item  ON pizza_item.pizza_id = pizza_item.pizza_id
GROUP BY pizza_item.pizza_type;

--Retrieve the average salary of employees for each designation:
SELECT designation, AVG(salary) AS average_salary
FROM employees
GROUP BY designation;

--Retrieve the count of available and reserved tables:
SELECT Status, COUNT(*) AS count_of_tables
FROM Tables
GROUP BY Status;

--Retrieve all pizza orders along with the corresponding customer and table information (if reserved):

CREATE PROCEDURE PROC5
AS
BEGIN
SELECT pizza_orders.order_id, customer.first_name, customer.last_name, customer.email_id, customer.phone_no, Tables.table_id, Tables.Status
FROM pizza_orders 
inner JOIN customer  ON pizza_orders.customer_id = customer.customer_id
LEFT JOIN Reservation  ON pizza_orders.customer_id = Reservation.Customer_ID
LEFT JOIN Tables  ON Reservation.Table_ID = Tables.table_id;
END;
EXEC PROC5



--Retrieve all burger orders along with the corresponding customer and table information (if reserved):

CREATE PROCEDURE PROC4
AS
BEGIN
SELECT burger_orders.order_id, customer.first_name, customer.last_name, customer.email_id, customer.phone_no, Tables.table_id, Tables.Status
FROM burger_orders 
inner JOIN customer  ON burger_orders.customer_id = customer.customer_id
LEFT JOIN Reservation ON burger_orders.customer_id = Reservation.Customer_ID
LEFT JOIN Tables  ON Reservation.Table_ID = Tables.table_id
END;
EXEC PROC4

--Retrieve the total number of pizza and burger orders served by each employee:

CREATE PROCEDURE PROC3
AS 
BEGIN
SELECT employees.employees_id, employees.first_name, employees.last_name, employees.designation,
       COUNT(pizza_orders.order_id) AS pizza_orders_served, COUNT(burger_orders.order_id) AS burger_orders_served
FROM employees 
LEFT JOIN pizza_orders  ON employees.employees_id = pizza_orders.customer_id
LEFT JOIN burger_orders  ON employees.employees_id = burger_orders.customer_id
GROUP BY employees.employees_id, employees.first_name, employees.last_name, employees.designation
END;
EXEC PROC3

--Retrieve all pizza orders with delivery details (if delivered):
create procedure PROC2
AS
BEGIN
SELECT pizza_orders.order_id, customer.first_name, customer.last_name, customer.email_id, customer.phone_no, Delivery.Delivery_man, Delivery.Delivery_man_contact,
Delivery.delivery_date
FROM pizza_orders 
inner JOIN customer  ON pizza_orders.customer_id = customer.customer_id
LEFT JOIN Delivery  ON pizza_orders.customer_id = Delivery.customer_id;
END;

EXEC PROC2

--Retrieve all burger orders with delivery details (if delivered):
create  procedure proc1
as
Begin
SELECT burger_orders.order_id, customer.first_name, customer.last_name, customer.email_id, customer.phone_no, Delivery.Delivery_man, Delivery.Delivery_man_contact,
Delivery.delivery_date
FROM burger_orders 
inner JOIN customer  ON burger_orders.customer_id = customer.customer_id
LEFT JOIN Delivery  ON burger_orders.customer_id = Delivery.customer_id ;
end;
exec proc1



















select customer.first_name,customer.last_name,(count(pizza_orders.quantity)+
count(burger_orders.quantity)) as TOTAl   from customer 
left join pizza_orders on customer.customer_id= pizza_orders.customer_id
left join burger_orders on burger_orders.customer_id = customer.customer_id
where  pizza_orders.quantity>0 or burger_orders.quantity>0 
GROUP BY
customer.first_name,customer.last_name
;














----------------------------------------------------------------------------------------------------------------------





drop table if exists customer
--drop table if exists Tables
drop table if exists pizza_orders
drop table if exists burger_orders
drop table if exists pizza_item
drop table if exists burger_item
drop table if exists Delivery
drop table if exists employees
drop table if exists reservations


Create Procedure ShowData @var int AS begin
Select customer.customer_id , customer.first_name , customer.phone_no, pizza_item.pizza_name, pizza_orders.order_date, burger_item.burger_name, burger_orders.order_date
from customer
left join pizza_orders on customer.customer_id= pizza_orders.customer_id
left join burger_orders on burger_orders.customer_id = customer.customer_id
left join pizza_item on pizza_item.pizza_id = pizza_orders.pizza_id
left join burger_item on burger_item.burger_id = burger_orders.burger_id
where customer.customer_id = @var end;


exec ShowData 1