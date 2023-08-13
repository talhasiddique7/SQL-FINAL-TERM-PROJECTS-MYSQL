
create database task2;
use task2;

--;================================= tbladmin ==============================================>
create procedure tbladmin1
@admin_id int ,
@admin_name varchar(30),
@admin_email varchar(50),
@username varchar(40),
@password varchar(30)

As 
Begin 

insert into tbladmin values (@admin_id ,@admin_name ,@admin_email ,@username ,@password );

end ;

create table tbladmin(
admin_id int primary key,
admin_name varchar(30),
admin_email varchar(50),
username varchar(40),
password varchar(30)
);
exec tbladmin1 1, 'Ali', 'ali8987@gmail.com', 'Ali123', 'admin@123';
exec tbladmin1 2, 'Ahsan', 'ahsan8987@gmail.com', 'Ahsan907', 'admin456';
exec tbladmin1 3, 'usman', 'usman8987@gmail.com', 'usman345', 'pass123';
exec tbladmin1 4, 'usama', 'usama8987@gmail.com', 'usama434', 'admin987';
exec tbladmin1 5, 'ahmed', 'ahmed8987@gmail.com', 'ahmed345', 'ali123';
  
Select *from tbladmin;
--;-------------------------------------------------------------------------<

--;================================== tblclient ========================================>
create procedure tblclient1 
@client_id int ,
@client_name varchar(20),
@client_company varchar(50),
@client_contact varchar(11),
@client_email varchar(30),
@username varchar(20),
@password varchar(20),
@account_status int

As 
Begin 


create table tblclient VALUES  (
@client_id ,
@client_name ,
@client_company ,
@client_contact ,
@client_email,
@username ,
@password ,
@account_status 
);
END;



create table tblclient(
client_id int primary key,
client_name varchar(20),
client_company varchar(50),
client_contact varchar(11),
client_email varchar(30),
username varchar(20),
password varchar(20),
account_status int
);


exec tblclient1   1, 'Talha', 'ABC', '01234567890', 'talha980@gmail.com', 'talha12', 'ali@123', 1;
exec tblclient1   2, 'Umair', 'XYZ', '03456789012', 'umair67@gmail.com', 'umairl', 'pkr456', 1;
exec tblclient1   3, 'Sarah', 'PQR', '03312345678', 'sk38238@gmail.com', 'sarahk', 'pass987', 1;
exec tblclient1   4, 'Muneeb', 'LMN', '03123456789', 'muneeb8796@gmail.com', 'muneeb123', '3242pw', 1;
exec tblclient1   5, 'Ayesha', 'EFG', '03211234567', 'ayesha67@gmail.com', 'ayeshaa', 'aye0009', 1;

select *from tblclient;
--;----------------------------------------------------------------------------------------------------------<

--;============================================= tblemployee1 ==============================================================>

create procedure  tblemployee1
@employee_id int,
@employee_name varchar(30),
@employee_email varchar(30),
@username varchar(30),
@password varchar(30),
@account_status int
As
Begin 
insert into tblemployee VALUES  (
@employee_id ,
@employee_name ,
@employee_email,
@username ,
@password ,
@account_status
);
End;

create table tblemployee(
employee_id int primary key,
employee_name varchar(30),
employee_email varchar(30),
username varchar(30),
password varchar(30),
account_status int
);

exec tblemployee1  1, 'Musa', 'musa998@gmail.com', 'musa12', 'eunm@123', 1;
exec tblemployee1  2, 'Habib', 'habib3423@gmail.com', 'habib34', 'habil456', 1;
exec tblemployee1  3, 'Bashir', 'bashir564@gmail.com', 'Bashir45', 'bashpass', 1;
exec tblemployee1  4, 'Danial', 'Danial@gmail.com', 'Danial35', 'alil987', 1;
exec tblemployee1  5, 'Ahmed', 'ahmed32@gmail.com', 'ahmed78', 'ahme34', 1;

Select *from tblemployee;
--;----------------------------------------------------------------------------------<

--;====================================== tblprojectmanager1 ============================================>

create procedure  tblprojectmanager1
@manager_id int ,
@manager_idno varchar(30),
@manager_name varchar(30),
@manager_email varchar(30),
@username varchar(30),
@password varchar(30),
@account_status int
As 
Begin 
insert into tblprojectmanager values (
@manager_id ,
@manager_idno ,
@manager_name ,
@manager_email ,
@username ,
@password ,
@account_status 
);
End;


create table tblprojectmanager(
manager_id int primary key,
manager_idno varchar(30),
manager_name varchar(30),
manager_email varchar(30),
username varchar(30),
password varchar(30),
account_status int
);

exec tblprojectmanager1  1, 'PM12345', 'Ali', 'ali98966@gmail.com', 'abcd34', 'manager@123', 1;
exec tblprojectmanager1  2, 'PM67890', 'Qasim', 'qasim8945@gmail.com', 'qasim332', 'manager456', 1;
exec tblprojectmanager1  3, 'PM23456', 'Ashir', 'ashir334@gmail.com', 'Ashirali', 'pmpass', 1;
exec tblprojectmanager1  4, 'PM78901', 'Zeeshan', 'zeesh45@gmail.com', 'zeeshan', 'pm987', 1;
exec tblprojectmanager1  5, 'PM34567', 'Fazila', 'fazila8076@gmail.com', 'fazila', 'manag352', 1;


select *from tblprojectmanager;

--;----------------------------------------------------------------------------------------------------------<

--;=================================================== tbltaskcategory =========================================================>

create procedure  tbltaskcategory1
@task_category_id int ,
@task_category_name varchar(30),
@admin_id int
 as
 begin 
 insert into tbltaskcategory values(
@task_category_id ,
@task_category_name ,
@admin_id 
);
end;


create table tbltaskcategory(
task_category_id int primary key,
task_category_name varchar(30),
admin_id int,
 FOREIGN KEY (admin_id) REFERENCES tbladmin(admin_id)
);

exec tbltaskcategory1  1, 'Development', 1;
exec tbltaskcategory1  2, 'Design', 2;
exec tbltaskcategory1  3, 'Testing', 2;
exec tbltaskcategory1  4, 'Marketing', 3;
exec tbltaskcategory1  5, 'Research', 4;

select *from tbltaskcategory;

--;----------------------------------------------------------------------<

--;==================================tbltask=====================================>


create procedure tbltask1
@task_id int ,
@task_name varchar(30),
@task_description varchar(100),
@category_id int,
@start_date date,
@end_date date,
@task_status int,
@client_id int,
@manager_id int,
@admin_id int

As
Begin 
insert into tbltask values (@task_id  ,
@task_name ,
@task_description ,
@category_id ,
@start_date ,
@end_date ,
@task_status ,
@client_id ,
@manager_id ,
@admin_id 
);
end;

create table tbltask(
task_id int primary key,
task_name varchar(30),
task_description varchar(100),
category_id int,
start_date date,
end_date date,
task_status int,
client_id int,
manager_id int,
admin_id int,
FOREIGN KEY (category_id) REFERENCES tbltaskcategory(task_category_id),
  FOREIGN KEY (client_id) REFERENCES tblclient(client_id),
  FOREIGN KEY (manager_id) REFERENCES tblprojectmanager(manager_id),
  FOREIGN KEY (admin_id) REFERENCES tbladmin(admin_id)
);

exec tbltask1 1, 'Website Development', 'Develop a responsive website', 1, '2023-07-28', '2023-08-15', 1, 1, 1, 1;
exec tbltask1 2, 'Logo Design', 'Design a new logo for the company', 2, '2023-08-01', '2023-08-10', 1, 1, 2, 2;
exec tbltask1 3, 'Software Testing', 'Perform quality assurance testing', 3, '2023-08-05', '2023-08-20', 1, 2, 2, 3;
exec tbltask1 4, 'Social Media Campaign', 'Run a marketing campaign on social media', 4, '2023-08-10', '2023-08-30', 1, 2, 3, 3;
exec tbltask1 5, 'Market Research', 'Conduct market research for new product', 5, '2023-08-15', '2023-09-15', 1, 3, 4, 4;

Select *from tbltask;
--;-----------------------------------------------------------------------------<

--;=====================================tbltaskupdate========================================>

create procedure tbletaskupdate1
@task_update_id int ,
@task_id int,
@update_info varchar(50),
@date_updated date,
@employee_id int
As 
Begin 
insert into tbltaskupdate values(
@task_update_id,
@task_id ,
@update_info ,
@date_updated ,
@employee_id );
End;


create table tbltaskupdate(
task_update_id int primary key,
task_id int,
update_info varchar(50),
date_updated date,
employee_id int,
FOREIGN KEY (task_id) REFERENCES tbltask(task_id),
  FOREIGN KEY (employee_id) REFERENCES tblemployee(employee_id)
);

exec tbletaskupdate1 1, 1, 'Initial setup', '2023-07-28', 1;
exec tbletaskupdate1 2, 1, 'Homepage design completed', '2023-08-05', 1;
exec tbletaskupdate1 3, 2, 'Logo concept approved', '2023-08-02', 2;
exec tbletaskupdate1 4, 3, 'Test cases executed', '2023-08-10', 3;
exec tbletaskupdate1 5, 4, 'Campaign launched successfully', '2023-08-12', 4;

Select *from tbltaskupdate;
--;------------------------------------------------------------------------------<<<<<<<<<<<<<<<<<<<<<<<<<

--;<<========================================Retrive data from table ==========================================>>

-- 1. Retrieve all tasks with their corresponding category names:
SELECT task_id, task_name, task_description, task_category_name
FROM tbltask 
INNER JOIN tbltaskcategory  ON category_id = task_category_id;


-- 2.Retrieve all tasks assigned to a specific client:
SELECT task_id, task_name, task_description, client_name
FROM tbltask 
INNER JOIN tblclient  ON tbltask.client_id = tblclient.client_id
WHERE client_name = 'Talha';


-- 3. Retrieve all tasks managed by a specific project manager:
SELECT task_id, task_name, task_description, manager_name
FROM tbltask 
INNER JOIN tblprojectmanager  ON  tblprojectmanager.manager_id =tbltask.manager_id 
WHERE manager_name = 'Qasim';


-- 4. Retrieve all task updates for a specific task:
SELECT task_update_id, update_info, date_updated, employee_name
FROM tbltaskupdate 
INNER JOIN tblemployee  ON tbltaskupdate.employee_id = tblemployee.employee_id
WHERE task_id = 1;


-- 5. Retrieve the total number of tasks for each client:
SELECT tblclient.client_name, COUNT(task_id) AS total_tasks
FROM tblclient 
LEFT JOIN tbltask  ON tblclient.client_id = tbltask.client_id
GROUP BY client_name;


-- 6. Retrieve the latest update for each task:
SELECT task_name, update_info, date_updated
FROM tbltask 
INNER JOIN tbltaskupdate  ON tbltask.task_id = tbltaskupdate.task_id
WHERE tbltaskupdate.date_updated = (
  SELECT MAX(date_updated) FROM tbltaskupdate WHERE task_id = tbltask.task_id
);


-- 7. Update the status of a specific task:
UPDATE tbltask
SET task_status = 2
WHERE task_id = 2;


-- 8. Delete a specific task update:
DELETE FROM tbltaskupdate WHERE task_update_id = 3;


-- 9. Retrieve all active employees:
SELECT * FROM tblemployee WHERE account_status = 1;


-- 10. Retrieve all completed tasks:
SELECT * FROM tbltask WHERE task_status = 2;


-- 11. order by
select admin_id from
tbladmin
order by admin_name;


