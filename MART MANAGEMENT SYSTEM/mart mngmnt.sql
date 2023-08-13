create database Mart_managmnt_system;
use Mart_managmnt_system;

----------------------------------M A R T-----------------------------------------------
----------------------------M A N A G E M E N T---------------------------------------------
--------------------------------S Y S T E M------------------------------------------------


------->TABLE NAME : products

create table products(

product_id int primary key,
product_name varchar(50),
product_price decimal(10,2), 
category_id int,
 foreign key (category_id) references category(category_id));
  drop table products
 ---------->DATA INSERTION THROUH PROCEDURE productrecords:
go
create procedure productrecords @product_id int,@product_name varchar(50),@product_price decimal(10,2),@category_id int
as
begin
insert into products values(@product_id,@product_name,@product_price,@category_id)
end;
exec productrecords 1,'mobile',2340.00,1  
  exec  productrecords 2, 'car', 25000.00,1
  exec  productrecords 3, 'cup', 4.99,2
  exec  productrecords 4, 'laptop', 899.00,1
  exec  productrecords  5, 'watch', 149.50,1
  exec  productrecords 6, 'book', 19.95,3
  exec  productrecords 7, 'shoes', 69.99,4
  exec  productrecords  8, 'camera', 599.00,1
  exec  productrecords  9, 'chair', 49.99,2
 exec  productrecords  10, 'table', 199.00,2
  exec   productrecords 11, 'headphones', 79.95,1
  exec  productrecords  12, 'shirt', 34.50,4
  exec  productrecords  13, 'guitar', 299.00,1
  exec  productrecords  14, 'cookies', 39.50,6
  exec  productrecords  15, 'carrot', 79.99,6
 exec  productrecords  16, 'perfume', 49.95,4
  exec  productrecords 17, 'lipsticks', 699.00,5
  exec   productrecords 18, 'jacket', 79.95,4
  exec  productrecords  19, 'cakes', 19.99,6
  exec  productrecords 20, 'juices', 129.50,6
  exec  productrecords  21, 'mirror', 34.99,2
  exec  productrecords 22, 'socks', 5.99,4
  exec  productrecords 23, 'hat', 24.95,5
  exec  productrecords 24, 'drone', 299.99,1
  exec  productrecords 25, 'couch', 799.00,1
  exec  productrecords 26, 'wallet', 29.50,4
  exec  productrecords 27, 'lamp', 19.99,2
  exec  productrecords 28, 'fan', 49.95,2
  exec  productrecords 29, 'scarf', 14.99,5
  exec  productrecords 30, 'earphones', 49.00,1
  exec  productrecords 31, 'umbrella', 12.95,2
 exec  productrecords 32, 'rug', 59.50,2
  exec  productrecords 33, 'mug', 7.99,2
  exec  productrecords 34, 'bicycle', 349.00,1
  exec  productrecords 35, 'bracelet', 39.99,5
  exec  productrecords 36, 'clock', 18.95,2
  exec  productrecords 37, 'tablecloth', 24.99,2
 exec  productrecords  38, 'rings', 5.99,5
  exec  productrecords 39, ' choclates', 12.95,6
  exec  productrecords 40, 'apple', 24.95,5
  select * from products;
  drop procedure productrecords;

--------->TABLE NAME: category

create table category(
category_id int primary key,
category_name varchar(50));
drop table category

------------->DATA INSERTION THRUH PROCEDURE : categoryrecords

delete from category
go
create procedure categoryrecords @category_id int ,@category_name varchar(50)
as
begin
insert into category values(@category_id,@category_name)
end;
--drop procedure categoryrecords
exec categoryrecords 1,'electronics'
exec categoryrecords 2,'homeitems'
exec categoryrecords 3,'stationaries'
exec categoryrecords 4,'men wear'
exec categoryrecords 5,'wmoen wear'
exec categoryrecords 6,'bakery'
exec categoryrecords 7,'fruits and vegetables'
select* from category;
drop procedure categoryrecords

---------->TABLE NAME: supplier
create table supplier(
supp_id int primary key,
category_id int,
foreign key (category_id) references category(category_id),
supp_name varchar(50),
contact_person varchar(50),
contact_no int);
drop table supplier

------------->DATA INSERTION THRUH PROCEDURE : supplierrecord
go
create procedure supplierrecord @supp_id int,@category_id int,@supp_name varchar(50),@contact_person varchar(50),@contact_no int
as
begin
insert into supplier values(@supp_id,@category_id,@supp_name,@contact_person,@contact_no)
end;
exec supplierrecord 1,1,'ali','electronics suplier',12345;
exec supplierrecord 2,5,'ahmad',' women essenstial supplier',123245;
exec supplierrecord 3,2,'hamza','homeitem supplier',3423335;
exec supplierrecord 4,6,'hizar','bakery items supplier',134234325;
exec supplierrecord 5,4,'moeez','men essentials supplier',14425;
exec supplierrecord 6,7,'ibrahim','fruit and vegetables supplier',1233445;
exec supplierrecord 7,3,'umer','stationaries supliers',1243245;
select *from supplier;
drop procedure supplierrecord

------------>TABLE NAME : inventory 
create table inventory(
inventory_id int primary key,
product_id int,
foreign key (product_id)references product(product_id),
quantity_in_stock int,
supp_id int,
foreign key (supp_id) references supplier(supp_id));

drop table inventory
go
create procedure inventoryrecord @inventory_id int,@product_id int,@quantity_in_stock int,@supp_id int
as
begin
insert into inventory values(@inventory_id, @product_id,@quantity_in_stock,@supp_id)
end;
drop procedure inventoryrecord
------------->DATA INSERTION THRUH PROCEDURE : inventoryrecord
exec inventoryrecord 1,1,530,1
exec inventoryrecord 2,2,550,1
exec inventoryrecord 3,3,570,2
exec inventoryrecord 4,4,590,1
exec inventoryrecord 5,5,500,1
exec inventoryrecord 6,6,500,3
exec inventoryrecord 7,7,5089,4
exec inventoryrecord 8,8,5056,1
exec inventoryrecord 9,9,5043,2
exec inventoryrecord 10,10,50,2
exec inventoryrecord 11,11,5034,1
exec inventoryrecord 12,12,504,4
exec inventoryrecord 13,13,5034,1
exec inventoryrecord 14,14,5043,6
exec inventoryrecord 15,15,5034,6
exec inventoryrecord 16,16,5034,4
exec inventoryrecord 17,17,5034,5
exec inventoryrecord 18,18,5043,4
exec inventoryrecord 19,19,5034,6
exec inventoryrecord 20,20,50343,6
exec inventoryrecord 21,21,5034,2
exec inventoryrecord 22,22,5045,4
exec inventoryrecord 23,23,505,5
exec inventoryrecord 24,24,5045,1
exec inventoryrecord 25,25,505,1
exec inventoryrecord 26,26,5054,4
exec inventoryrecord 27,27,5055,2
exec inventoryrecord 28,28,5045,2
exec inventoryrecord 29,29,505,5
exec inventoryrecord 30,30,5066,1
exec inventoryrecord 31,31,505,2
exec inventoryrecord 32,32,5034,2
exec inventoryrecord 33,33,5343,2
exec inventoryrecord 34,34,5434,1
exec inventoryrecord 35,35,543,5
exec inventoryrecord 36,36,5434,2
exec inventoryrecord 37,37,534,2
exec inventoryrecord 38,38,505,5
exec inventoryrecord 39,39,500,6
exec inventoryrecord 40,40,40,5
select * from inventory

-------------->TABLE NAME : customer
create table customer(
customer_id int primary key,
customer_name varchar(50));

------------->DATA INSERTION THRUH PROCEDURE : customerrecord
go
create procedure customerrecord @customer_id int, @customer_name  varchar(50)
as
begin
insert into customer values ( @customer_id,@customer_name)
end;
exec customerrecord 1, 'Ahmed Ali'
exec customerrecord 2, 'Fatima Khan'
exec customerrecord 3, 'Hassan Raza'
exec customerrecord 4, 'Ayesha Malik'
exec customerrecord 5, 'Samiullah Farooqi'
exec customerrecord 6, 'Aisha Nadeem'
exec customerrecord 7, 'Usman Qureshi'
exec customerrecord 8, 'Sana Khan'
exec customerrecord 9, 'Ali Abbas'
exec customerrecord 10, 'Zainab Siddiqui'
exec customerrecord 11, 'Imran Khan'
exec customerrecord 12, 'Sara Aslam'
exec customerrecord 13, 'Bilal Ahmed'
exec customerrecord 14, 'Maryam Shah'
exec customerrecord 15, 'Omar Qadir'

select *from customer

------------->TABLE NAME : orderss
create table orderss( 
orders_id int primary key,
customer_id int,
foreign key (customer_id) references customer(customer_id),
orders_date date,
total_amount decimal(10,2),
payment_method varchar(50),
product_id int
foreign key (product_id) references products(product_id));


------------->DATA INSERTION THRUH PROCEDURE : ordersrecord
go
create procedure ordersrecord @orders_id int ,@customer_id int,@orders_date date,@total_amount decimal(10,2),@payment_method varchar(50),@product_id int
as
begin
insert into orderss values(@orders_id,@customer_id,@orders_date,@total_amount,@payment_method,@product_id)
end;
exec ordersrecord 1, 1, '2023-03-02', 230.00, 'cash on delivery',1
exec ordersrecord 2, 2, '2023-03-03', 150.50, 'credit card',3
exec ordersrecord 3, 3, '2023-03-04', 75.25, 'online payment',4
exec ordersrecord 4, 4, '2023-03-05', 250.00, 'cash on delivery',6
exec ordersrecord 5, 5, '2023-03-06', 100.00, 'credit card',10
exec ordersrecord 6, 6, '2023-03-07', 45.75, 'online payment',12
exec ordersrecord 7, 7, '2023-03-08', 300.25, 'cash on delivery',11
exec ordersrecord 8, 8, '2023-03-09', 80.00, 'credit card',23
exec ordersrecord 9, 9, '2023-03-10', 120.50, 'online payment',34
exec ordersrecord 10, 10, '2023-03-11', 50.00, 'cash on delivery',29
exec ordersrecord 11, 11, '2023-03-12', 180.75, 'credit card',5
exec ordersrecord 12, 12, '2023-03-13', 90.25, 'online payment',40
exec ordersrecord 13, 13, '2023-03-14', 270.00, 'cash on delivery',21
exec ordersrecord 14, 14, '2023-03-15', 60.00, 'credit card',22
exec ordersrecord 15, 15, '2023-03-16', 30.75, 'online payment',39
select* from orderss
 drop procedure ordersrecord

 ------------>TABLE NAME : employees

create table employees(
emp_id int primary key,
emp_name varchar(50), 
emp_position varchar(60),
emp_phoneno varchar(50),
emp_email varchar(70));
drop procedure emplyoeesrecord
 drop table emplyoees

------------->DATA INSERTION THRUH PROCEDURE : emplyoeesrecord

go
create procedure emplyoeesrecord @emp_id int,@emp_name varchar(50),@emp_position varchar(60),@emp_phoneno varchar(50), @emp_email varchar(50)
as
begin
insert into employees values(@emp_id,@emp_name,@emp_position,@emp_phoneno,@emp_email)
end;


  exec emplyoeesrecord 1, 'Ali Khan', 'Store Manager', '0301-1234567','ali.khan@example.com'
  exec emplyoeesrecord 2, 'Fatima Siddiqi', 'Cashier','0301-1234567', 'fatima.siddiqi@example.com'
  exec emplyoeesrecord 3, 'Ahmed Malik', 'Salesperson', '0321-3456789','ahmed.malik@example.com'
  exec emplyoeesrecord 4, 'Ayesha Khan', 'Assistant Manager', '0333-4567890','ayesha.khan@example.com'
  exec emplyoeesrecord 5, 'Muhammad Akram', 'Stock Keeper', '0344-5678901','muhammad.akram@example.com'
  exec emplyoeesrecord 6, 'Sana Ahmed', 'Customer Service','0355-6789012', 'sana.ahmed@example.com'
  select * from employees
 ----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
------------------------ D A T A B A S E   Q U E R I E S  --------------------------------------
----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

------------show products_data-----------
GO
CREATE PROCEDURE productdata 
as
begin
select products.product_id,products.category_id,
products.product_name,products.product_price ,category.category_name, 
supplier.supp_id,supplier.supp_name,supplier.contact_person,supplier.contact_no
from products inner join category 
on products.category_id=category.category_id inner join supplier
on category.category_id=supplier.supp_id
end
exec productdata

 -------------------show categories of each products and no of products per category-----------

 go
  create procedure no_of_prodcts
 as 
 begin
 select category.category_name, count(products.product_id) as no_of_products
 from category inner join products on category.category_id=products.category_id
 group by category.category_name
 end
 exec no_of_prodcts

 -----------------show categories and amount per product in each category with total price---

 go 
 create procedure productprice0
 as
 begin
 select category.category_id, category.category_name,sum(products.product_price) as total_price_of_all_products
from category inner join products on
category.category_id=products.category_id
group by category.category_id,category.category_name
end
exec productprice0


-----------------show the stock of  any product------

go
create procedure checkproductstock1  @product_id int
as
begin
select * from inventory
where product_id=@product_id
end
exec checkproductstock1 1;
exec checkproductstock1 5;


------------------search products by price range--------------

go
create procedure searchproducts @first decimal(10,2),@second decimal(10,2)
as
begin
select * from products
where product_price between @first and @second
end
exec searchproducts 10,15;
exec searchproducts 100,200;
exec searchproducts 300,400;
exec searchproducts 500,600;
drop procedure searchbooks

-------------update the email of a emloyee without procedure--------------------

update employees
set emp_email='abcd@gmail.com'
where emp_id=3;
select* from employees --------------(record updated)---------


-----------insert a new order in the order table-----------------

go
create procedure insertorders @orders_id int,@customer_id int,
@orders_date date,@total_amount decimal(10,2),@payment_method varchar(50)
as
begin
insert into orderss values (@orders_id,@customer_id,@orders_date,@total_amount,@payment_method)
end 
exec insertorders 16,15,'2023-08-09',230.00,'cash_on_delivery'
select *from orderss


------------Retrieve the total amount spent by a specific customer--------

go 
create procedure total_amounts  @customer_id int 
as
begin
select customer.customer_id, sum(orderss.total_amount) as total_spending
from customer inner join orderss on customer.customer_id=orderss.customer_id
where customer.customer_id=@customer_id
group by customer.customer_id
end
exec total_amounts 3;
exec total_amounts 5;
exec total_amounts 20;


----------------Retrieve all products names along with their category names----------

go
create procedure retrieve_products
as
begin
select products.product_id,products.product_name,category.category_name
from products inner join category on
products.category_id=category.category_id
end
exec retrieve_products 

-----------------Retrieve the top N customers based on their total spending---------

go 
create procedure top_customer
as
begin
select customer.customer_id,customer.customer_name, sum(orderss.total_amount) as total_spending
from customer inner join orderss on
customer.customer_id=orderss.customer_id
group by customer.customer_id,customer.customer_name
order by total_spending desC
end
exec top_customer


  -------------------Retrieve the products with low stock along with their category names----

  go
  create procedure low_stock1
  as
  begin
  select products.product_id,products.product_name,inventory.quantity_in_stock,
  category.category_name
  from products inner join inventory on
  products.product_id=inventory.product_id inner join category
  on products.category_id=category.category_id
  where inventory.quantity_in_stock<=500
  end
  exec low_stock1

  ------retreive the  names of products in 'electronics' category-----

go
create procedure products12
as
begin
select products.product_id,products.product_name,category.category_name
from products inner join category 
on products.category_id=category.category_id
where category.category_name='electronics'
end
exec products12

---------retreive the name of the products who have not
-------been supplied to any supplier--------------------------

go
create procedure prosupplier 
as
begin
select  products.product_id,products.product_name
from products inner join supplier on
products.product_id =supplier.product_id
where products.product_id is  null
end
exec prosupplier


-------find the product name who have the highest price in all products-------

go
create procedure highprices3
as
begin
select products.product_id,products.product_name,products.product_price
from products
WHERE product_price = (SELECT MAX(product_price) FROM products);
end
exec highprices3

 ----------------through alphabet--------
go
create procedure abcd @product_name varchar(50)
as
begin
select * from products
where product_name like @product_name
end 
exec abcd 'c%'
exec abcd '_a%'

--------------------------------------------------------------------------------------------
--------------------------------------------SHOW ALL TABLES DATA----------------------------

go
create procedure show_all_tables_data
as 
begin
select *from products
select* from inventory
select*  from category
select* from supplier
select* from employees
select*from customer
select * from orderss
end

exec show_all_tables_data


---------------------------------------------------------------------------------------------
  ------------------------------DELETE ALL TABLES DATA----------------------------------------

  go
  create procedure del_all_tables_data
  as
  begin
  delete from products
  delete from inventory
  delete from supplier
  delete from category
  delete from customer
  delete from  employees
  delete from orderss
  end 
  exec del_all_tables_data


  ---------------------------------------------------------------------------------------------
  ------------------------------DROP ALL TABLES ---------------------------------------- 
  go 
  CREATE PROCEDURE Drop_all_tables
  AS
  BEGIN

  DROP TABLE products
  DROP TABLE category
  DROP TABLE supplier
  DROP TABLE inventory
  DROP TABLE employees
  DROP TABLE customer
  DROP TABLE orderss
 
  END;

  exec Drop_all_tables
  