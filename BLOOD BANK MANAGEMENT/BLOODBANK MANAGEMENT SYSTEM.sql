CREATE DATABASE ALI
USE ALI
-------------------------1.Manager Table--------------------
------------------> Manages requests FRom Hospital
CREATE TABLE Manager(
M_id INT ,
M_name VARCHAR(40),
M_age INT,
M_phno VARCHAR(40),
PRIMARY KEY(M_id),
)

--------------------------2.Blood bank--------------------
-----------------> It manages requests received from manager

CREATE TABLE Bloodbank(
BB_id INT ,
BB_name TEXT,
Street INT,
BB_add VARCHAR(50),
PRIMARY KEY(BB_id),
)


---------------------------3--Manager_BloodBANK----------------
----> It links b/w manager table and Blood bank by using foriegn key of blood bank and manager
CREATE TABLE Bloodbank_manager(
M_id INT ,
BB_id INT,
CONSTRAINT PK_Bloodbank_manager PRIMARY KEY (M_id,BB_id),
CONSTRAINT FK_Bloodbank_manager_Manager FOREIGN KEY (M_id) REFERENCES Manager(M_id),
CONSTRAINT FK_Bloodbank_manager_Bloodbank FOREIGN KEY (BB_id) REFERENCES Bloodbank(BB_id) ON DELETE CASCADE ON UPDATE CASCADE
)
INSERT INTO Bloodbank_manager VALUES(101,210),(102,211),(103,212),
                                    (104,213),(105,214),(106,215),
									(107,216),(108,217),(109,218),
									(110,219),(111,220),(112,221);
SELECT *FROM Bloodbank_manager;

--------------------------4--Register Team--------------------------------
----------------> It works in Blood bank and registers info about patient and donors
CREATE TABLE Registration_teamm(
RT_id INT PRIMARY KEY ,
RT_Name VARCHAR(20),
RT_members INT,
BB_id INT ,
CONSTRAINT FK_Registration_teamm_Bloodbank FOREIGN KEY(BB_id) REFERENCES Bloodbank(BB_id) ON DELETE CASCADE ON UPDATE CASCADE
)
---------------------------5-Technical analyst--------------------------
------------------> It works int blood bank and  examines donor blood 

CREATE TABLE Technical_analyst137(
TA_id INT  PRIMARY KEY,
TA_Name VARCHAR(40),
TA_ph_nO VARCHAR (30),
BB_id INT ,
CONSTRAINT FK_Technical_analyst137_Bloodbank FOREIGN KEY(BB_id) REFERENCES Bloodbank(BB_id) ON DELETE CASCADE ON UPDATE CASCADE
)
-----------------------------6--Blood Donated---------------------------
 -------------------> It take records about Blood donated which blood type is donated and In which manager id it stores
 CREATE TABLE Blood_donated(
 BG_id INT,
 BG_type VARCHAR(3),
 M_id INT,
 CONSTRAINT PK_Blood_donated PRIMARY KEY(BG_id,BG_type),
 CONSTRAINT FK_Blood_donated_Manager FOREIGN KEY(M_id) REFERENCES Manager(M_id) ON DELETE CASCADE ON UPDATE CASCADE
 )
   INSERT INTO Blood_donated VALUES(1131,'A-',101),(1132,'B+',106),(1133,'O-',102),
                         (1134,'B-',108),(1135,'B-',104),(1136,'AB-',103),(1137,'A+',105),
						 (1139,'AB+',102),(1140,'A+',108),
						 (1142,'B+',110),(1144,'AB+',113),(1145,'A-',102),(1147,'B+',104),
						 (1148,'O-',109),(1150,'AB+',107),(1151,'O+',105),(1152,'AB+',101),
						 (1153,'B+',106),(1154,'A+',108),(1155,'O+',103),(1156,'O+',102),
						 (1157,'AB-',101);
						 
 SELECT *FROM Blood_donated;


  -----------------------------7--Patient---------------------------
  CREATE TABLE Patient137(
 P_id INT PRIMARY KEY,
 P_Name VARCHAR(40),
 P_Gender VARCHAR(20),
 P_phno VARCHAR(30),
 P_add VARCHAR(30),
 BG_type VARCHAR(3),
 RT_id INT,
 M_id INT,
 DATE_REG DATE,
 CONSTRAINT FK_Patient137_Registration_teamm FOREIGN KEY (RT_id) REFERENCES Registration_teamm(RT_id),
 CONSTRAINT FK_Patient137_Manager FOREIGN KEY(M_id) REFERENCES Manager(M_ID) ON DELETE CASCADE ON UPDATE CASCADE
)

-------------------------------------8--Request------------------------
 ------------------------> It save patient and hospital requests info Means How much amount requested by hospital or patient

 CREATE TABLE BloodRequest(
 RQ_id INT PRIMARY KEY,
 BG_type VARCHAR(3),
 Amount_blood INT,                             ---Amount of blood should be in number of bags
  )
  INSERT INTO BloodRequest VALUES(1,'A+',1),(2,'O+',2),(3,'A-',1),
                                  (4,'AB-',1),(5,'B+',2),(6,'O-',1),(7,'AB+',3),
								  (8,'A+',2),(9,'B+',1),(10,'A-',1),(11,'B-',2),
								  (12,'O+',1),(13,'O-',1),(14,'B+',1),(15,'AB+',1),(16,'AB-',1);
 SELECT *FROM BloodRequest;

 --------------------------------9-- Patient Request----------------------------------
 ---------------------------> It takes tracks about patient requests for blood  and save it in request table given a specific request id or code
 CREATE TABLE PatientRequest(
 P_id INT,
 RQ_id INT,
 CONSTRAINT PK_PatientRequest PRIMARY KEY (P_id,RQ_id),
 CONSTRAINT FK_PatientRequest_Patient137 FOREIGN KEY(P_id) REFERENCES Patient137(P_id),
 CONSTRAINT FK_PatientRequest_BloodRequest FOREIGN KEY(RQ_id) REFERENCES BloodRequest(RQ_id) ON DELETE CASCADE ON UPDATE CASCADE
 )
    INSERT INTO PatientRequest VALUES(1001,4),(1002,6),(1003,1),(1004,14),
	                                  (1005,9),(1006,15),(1007,12),(1008,3),
									  (1009,13),(1010,10);
	SELECT *FROM PatientRequest;

---------------------------------10--Hospital--------------------------------
 ----------------------------> It takes records about Hospital info managed by manager
 
  CREATE TABLE Hospital(
 H_id INT  PRIMARY KEY,
 H_name VARCHAR(30),
 M_id INT ,
 H_add CHAR(30),
 street INT,
 CONSTRAINT FK_Hospital_Manager FOREIGN KEY(M_id)  REFERENCES Manager(M_id) ON DELETE CASCADE ON UPDATE CASCADE
 )

 ----------------------------------------11--Hospital request------------------
 ------------------------> It takes records about total requests taken by hospital 
 CREATE TABLE Hospitalrequestt(
 H_id INT ,
 RQ_id INT,
 CONSTRAINT PK_Hospitalrequestt PRIMARY KEY (H_id,RQ_id),
 CONSTRAINT FK_Hospitalrequestt_Hospital FOREIGN KEY(H_id) REFERENCES Hospital(H_id),
 CONSTRAINT FK_Hospitalrequestt_BloodRequest FOREIGN KEY(RQ_id) REFERENCES BloodRequest(RQ_id) ON DELETE CASCADE ON UPDATE CASCADE
 )
  INSERT INTO Hospitalrequestt VALUES(1,8),(2,11),(3,7),(4,16),(5,2);
   SELECT *FROM Hospitalrequestt;

---------------------------------12--Blood received / Patient blood----------------------------
 -----------------------------> It takes records about blood received by patients means which blood group is taken by patient
 CREATE TABLE BLoodreceived(
 BG_id  INT,
 BG_type VARCHAR(3),
 P_id INT,
 CONSTRAINT PK_BLoodreceived PRIMARY KEY(P_id,BG_id,BG_type),
 CONSTRAINT FK_BLoodreceived_Blood_donated FOREIGN KEY(BG_id,BG_type) REFERENCES Blood_donated(BG_id,BG_type),
 CONSTRAINT FK_BLoodreceived_Patient137 FOREIGN KEY(P_id) REFERENCES Patient137(P_id) ON DELETE CASCADE ON UPDATE CASCADE
 )
    INSERT INTO BLoodreceived VALUES(1136,'AB-',1001),(1133,'O-',1002),(1137,'A+',1003),
	                                 (1157,'AB-',1004),(1132,'B+',1005),(1144,'AB+',1006),
									 (1151,'O+',1007),(1145,'A-',1008),(1148,'O-',1009),
									 (1131,'A-',1010);
  SELECT *FROM BLoodreceived;

 ----------------------------------------13--Technical analyst blood------------------------
--------------------------------------> It records about technical analyst which blood groups are examines by which technical analyst
 CREATE TABLE Tecanalyst_blood(
 BG_id INT ,
 BG_type VARCHAR(3),
 TA_id INT ,
 CONSTRAINT PK_Tecanalyst_blood PRIMARY KEY(TA_id,BG_id,BG_type),
 CONSTRAINT FK_Tecanalyst_blood_Technical_analyst137 FOREIGN KEY(TA_id) REFERENCES Technical_analyst137(TA_id),
 CONSTRAINT FK_Tecanalyst_blood_Blood_donated Foreign KEY(BG_id,BG_type) REFERENCES Blood_donated(BG_id,BG_type) 
  ON DELETE CASCADE ON UPDATE CASCADE
 )
  

 INSERT INTO Tecanalyst_blood VALUES (1131,'A-',411),(1132,'B+',412),(1133,'O-',413),(1134,'B-',414),
                                    (1135,'B-',415),(1136,'AB-',416),(1137,'A+',417),
									(1139,'AB+',419),(1140,'A+',420),(1142,'B+',421),
									(1144,'AB+',413),(1145,'A-',416),(1147,'B+',414),
						            (1148,'O-',419),(1150,'AB+',417),(1151,'O+',415),(1152,'AB+',411),
						            (1153,'B+',416),(1154,'A+',418),(1155,'O+',413),(1156,'O+',412),
						            (1157,'AB-',411);

SELECT *FROM Tecanalyst_blood;
-----------------------------14-DONOR---------------------------------------------
 -------------------------> IT takes records about donor Managed by registration team work in blood bank
 CREATE TABLE Donor(
 D_id INT  PRIMARY KEY,
 D_name VARCHAR(40),
 D_gender CHAR(1),
 D_phno VARCHAR(30),
 Dt_reg DATE,
 D_add VARCHAR(30),
 D_age INT,
 D_disease VARCHAR(30),
 BG_id INT,
 BG_type VARCHAR(3),
 RT_id INT,
 CONSTRAINT FK_Donor_Blood_donated FOREIGN KEY (BG_id,BG_type) REFERENCES Blood_donated(BG_id,BG_type),
 CONSTRAINT FK_Donor_Registration_teamm FOREIGN KEY(RT_id) REFERENCES Registration_teamm(RT_id) ON DELETE CASCADE ON UPDATE CASCADE
  )



                                                   ------------STORED PROCEDURES----
	------------------------1. Store procedure for entering manager data------------------------


	
	
	  GO
	CREATE PROCEDURE Manager37_PROCE4(
        @id INT , 
        @name VARCHAR(40),
        @age INT,
        @phno VARCHAR(40),
		@type varchar(30))
		AS
		BEGIN
		IF @type ='SELECT' AND @id=0
		BEGIN
		SELECT *FROM Manager;
		END;
		IF @type ='SELECT' 
		BEGIN
		SELECT *FROM Manager WHERE M_id=@id;
		END;
		IF @type='INSERT'
		BEGIN
		INSERT INTO Manager(M_id, M_name,M_age,M_phno)
		VALUES(@id, @name,@age, @phno);
		END;
		IF @type ='UPDATE'
		BEGIN
		UPDATE Manager SET
		M_name=@name,
		M_age=@age,
		M_phno=@phno
		WHERE M_id=@id;
		END;
		IF @type='DELETE'
		BEGIN
		DELETE FROM Manager WHERE M_id=@id;
		END;
	  END;
		
		EXEC   Manager37_PROCE4 101,'M Qasim',43,'0323-7758373','INSERT'   
		EXEC   Manager37_PROCE4 102,'M Bilal',35,'0312-9374628','INSERT' 
		EXEC   Manager37_PROCE4 103,'CH Zaheer',29,'0303-2084674','INSERT'
		EXEC   Manager37_PROCE4 104,'Muhsin',35,'0311-0277479','INSERT'
		EXEC   Manager37_PROCE4 105,'Hamza Ali',23,'0322-9264720','INSERT'
		EXEC   Manager37_PROCE4 106,'Zubair',51,'0307-0200387','INSERT'
		EXEC   Manager37_PROCE4 107,'Usaman ',26,'0302-2943369','INSERT'
		EXEC   Manager37_PROCE4 108,'Haider Ali',39,'0319-2842743','INSERT'
        EXEC   Manager37_PROCE4 109,'M Amir',40,'0342-0123840','INSERT'
        EXEC   Manager37_PROCE4 110,'M Bilal',33,'0321-1102708','INSERT'
		EXEC   Manager37_PROCE4 111,'Zeeshan',30,'0348-0282930','INSERT'
		EXEC   Manager37_PROCE4 112,'Hassan Ali',51,'0301-1277911','INSERT'
		EXEC   Manager37_PROCE4 113,'Faisal',44,'0309-3107911','INSERT'
		EXEC   Manager37_PROCE4  0,'',0,'','SELECT'
		EXEC   Manager37_PROCE4  112,'Ijaz Ali',52,'0347-3302300','UPDATE'
		EXEC   Manager37_PROCE4  0,'',0,'','DELETE'

		 ---------------------stored procedure for entering blood bank data------------------
			                  
	     
	  GO
	CREATE PROCEDURE BB73_PROCE4(
        @id INT ,
        @name TEXT,
		@street INT,
        @add VARCHAR(50),
		@type VARCHAR(30))
		AS
		BEGIN
		IF @type ='SELECT' AND @id=0
		BEGIN
		SELECT *FROM Bloodbank;
		END;
		IF @type ='SELECT' 
		BEGIN
		SELECT *FROM Bloodbank WHERE BB_id=@id;
		END;
		IF @type='INSERT'
		BEGIN
		INSERT INTO Bloodbank(BB_id ,BB_name,Street,BB_add)
		VALUES(@id, @name,@street,@add);
		END;
		IF @type ='UPDATE'
		BEGIN
		UPDATE Bloodbank SET
		BB_name=@name,
		Street=@street,
		BB_add=@add WHERE BB_id=@id;
		END;
		IF @type='DELETE'
		BEGIN
	    DELETE FROM Bloodbank WHERE BB_id=@id;
		END;
	  END;
		
		EXEC  BB73_PROCE4 210,'Noor-ul-Ain Dyra ',4,'Chniot','INSERT'   
		EXEC  BB73_PROCE4  211,'Madina Teaching Hospital ',5,'Faislabad','INSERT' 
		EXEC  BB73_PROCE4 212,'Blood Independent university',9,'Lahore','INSERT'
		EXEC  BB73_PROCE4 213,'District Blood Transfusion Bank',12,'Bahawlnagr','INSERT'  
		EXEC  BB73_PROCE4 214,'Regional Blood Center',18,'Bahawlnagr', 'INSERT'  
		EXEC  BB73_PROCE4 215,'Blood Bank DHQ Hospital ',14,'Faislabad','INSERT'  
		EXEC  BB73_PROCE4 216,'Blood Bank PIC',10,'Lahore' ,'INSERT'
		EXEC  BB73_PROCE4 217,'INMOL Blood Bank',13,'Gujrat' ,'INSERT'
		EXEC  BB73_PROCE4 218,'Fatmid Foundation ',16,'Lahore' ,'INSERT'
        EXEC  BB73_PROCE4 219,'SUNDUS Foundation Blood Bank',14,'Gujrat' ,'INSERT'
        EXEC  BB73_PROCE4 220,'Fatmid Foundation Multan ',5,'Multan' ,'INSERT'
        EXEC  BB73_PROCE4 221,'Samina Amanat Lab & Medical',17,'Rawalpindi','INSERT'
		EXEC  BB73_PROCE4 222,'Blood Bank Kalsoom Society',18,'Sialkot','INSERT'
		EXEC  BB73_PROCE4 0,'',0,'','SELECT'
		EXEC  BB73_PROCE4 213,'AQ Bloodbank',2,'Kashmir','UPDATE'
		EXEC  BB73_PROCE4 217,'','','','DELETE'
		

		------- Store procedure for Registration team data
	     
	  GO
	CREATE PROCEDURE Register_PROCE4(
        @id INT ,
        @Name VARCHAR(20),
        @members INT,
        @BB_id INT,
		@type VARCHAR(30))
		AS
		BEGIN
		IF @type ='SELECT' AND @id=0
		BEGIN
		SELECT *FROM Registration_teamm;
		END;
		IF @type ='SELECT' 
		BEGIN
		SELECT *FROM Registration_teamm WHERE RT_id=@id;
		END;
		IF @type='INSERT'

		BEGIN
		INSERT INTO Registration_teamm(RT_id, RT_name,RT_members,BB_id)
		VALUES(@id, @Name,@members, @BB_id);
		END;
		IF @type ='UPDATE'
		BEGIN
		UPDATE Registration_teamm SET
		RT_name=@name,
		RT_members=@members,
		BB_id=@BB_id WHERE RT_id=@id;
		END;
		IF @type='DELETE'
		BEGIN
		DELETE FROM Registration_teamm WHERE RT_id=@id;
		END;
	  END;
	   EXEC Register_PROCE4 600,'Team A',10,210,'INSERT'
	   EXEC Register_PROCE4 601,'Team B',15,211,'INSERT'
	   EXEC Register_PROCE4 602,'Team C',13,212,'INSERT'
       EXEC Register_PROCE4 603,'Team D',17,213,'INSERT'
       EXEC Register_PROCE4 604,'Team E',20,214,'INSERT'
       EXEC Register_PROCE4 605,'Team F',10,215,'INSERT'
	   EXEC Register_PROCE4 606,'Team G',17,216,'INSERT'
	   EXEC Register_PROCE4 607,'Team H',14,217,'INSERT'
	   EXEC Register_PROCE4 608,'Team I',19,218,'INSERT'
	   EXEC Register_PROCE4 609,'Team J',23,219,'INSERT'
       EXEC Register_PROCE4 610,'Team k',15,220,'INSERT'
       EXEC Register_PROCE4 611,'Team L',27,221,'INSERT'
       EXEC Register_PROCE4 0,'',0,0,'SELECT'
	   EXEC Register_PROCE4 608,'TEAM H',24,210,'UPDATE'
	   EXEC Register_PROCE4 608,'',0,0,'DELETE'



	   ------------------------ Stored procedure for entering techical analyst---------------------
	     GO
	CREATE PROCEDURE TA37_PROCE4(
        @id INT  ,
        @name VARCHAR(40),
        @ph_nO VARCHAR (30),
        @BB_id INT,
		@type VARCHAR(30))
		AS
		BEGIN
		IF @type ='SELECT' AND @id=0
		BEGIN
		SELECT *FROM Technical_analyst137;
		END;
		IF @type ='SELECT' 
		BEGIN
		SELECT *FROM Technical_analyst137 WHERE @id=TA_id;
		END;
		IF @type='INSERT'

		BEGIN
		INSERT INTO Technical_analyst137(TA_id ,TA_Name ,TA_ph_nO ,BB_id)
		VALUES(@id, @name,@ph_nO, @BB_id);
		END;
		IF @type ='UPDATE'
		BEGIN
		UPDATE Technical_analyst137 SET
		TA_name=@name,
		TA_ph_nO=@ph_nO,
		BB_id=@BB_id WHERE TA_id=@id;
		END;
		IF @type='DELETE'
		BEGIN
		DELETE FROM Technical_analyst137 WHERE TA_id=@id;
		END;
	  END;
          EXEC TA37_PROCE4 411,'M Rashid','0321-2638201',211,'INSERT'
		  EXEC TA37_PROCE4 412,'Nauman Rao','0300-1799192',212,'INSERT'
          EXEC TA37_PROCE4 413,'SHakeel Ahmed','0301-0126382',213,'INSERT'
	      EXEC TA37_PROCE4 414,' Rana Younas','0331-2198372',214,'INSERT'
		  EXEC TA37_PROCE4 415,'Ashraf Khan','0310-3823911',215,'INSERT'
		  EXEC TA37_PROCE4 416,'Sufyan Ali','0303-2927293',216,'INSERT'
		  EXEC TA37_PROCE4 417,'Ramzan','0323-1232989',217,'INSERT'
		  EXEC TA37_PROCE4 418,'Yaqoob','0302-0388182',218,'INSERT'
		  EXEC TA37_PROCE4 419,'Aslam Rana','0311-0987666',219,'INSERT'
		  EXEC TA37_PROCE4 420,'Rizvan Ali','0304-2138201',220,'INSERT'
		  EXEC TA37_PROCE4 421,'M Ali','0341-2138291',221,'INSERT'
		  EXEC TA37_PROCE4 422,'Mujahid','0340-1349201',222,'INSERT'
		  EXEC TA37_PROCE4 0,'','',0,'SELECT'
		  EXEC TA37_PROCE4 419,'Ramzan Ali','0304-21382911',210,'UPDATE'
          EXEC TA37_PROCE4 0,'','',0,'DELETE'


		  ------------------------------Store procedure for entering Patient data-----------------

	     	     GO
	CREATE PROCEDURE PT37_PROCE4(
         @id INT ,
         @name VARCHAR(40),
         @Gender VARCHAR(20),
         @phno VARCHAR(30),
         @addr VARCHAR(30),
         @BG_type VARCHAR(3),
         @RT_id INT,
         @M_id INT,
         @DATE_REG DATE,
		 @type VARCHAR(30))
		AS
		BEGIN
		IF @type ='SELECT'
		BEGIN
		SELECT *FROM Patient137;
		END;
		IF @type='INSERT'

		BEGIN
		INSERT INTO Patient137(P_id,P_Name,P_Gender,P_phno,P_add,BG_type,RT_id,M_id,DATE_REG)
		VALUES(@id, @name, @Gender, @phno,@addr,@BG_type, @RT_id, @M_id, @DATE_REG);
		END;
		IF @type ='UPDATE'
		BEGIN
		UPDATE Patient137 SET
		P_name=@name,
		P_Gender=@Gender,
		P_phno=@phno,
		P_add=@addr,
		BG_type=@BG_type,
		RT_id=@RT_id,
		M_id=@M_id,
		DATE_REG=@DATE_REG
		 WHERE P_id=@id;
		END;
		IF @type='DELETE'
		BEGIN
		DELETE FROM Patient137 WHERE P_id=@id;
		END;
	  END;

	    EXEC PT37_PROCE4 1001,'Zainab','Female','0323-2322443','Gujrat','A+',601,102,'2023-01-12','INSERT'
        EXEC PT37_PROCE4 1002,'Haider','Male','0301-0273878','Lahore','B-',602,105,'2023-06-11','INSERT'
        EXEC PT37_PROCE4 1003,'Maryam','Female','0312-8374799','Gujranwala','A+',603,104,'2023-08-25','INSERT'
        EXEC PT37_PROCE4 1004,'Ahmed','Male','0300-0192829','Peshawar','O-',604,110,'2023-01-27','INSERT'
        EXEC PT37_PROCE4 1005,'Zain','Male','0321-0987232','Quetta','AB+',605,109,'2022-01-18','INSERT'
        EXEC PT37_PROCE4 1006,'Mehak','Female','0300-2344213','Lahore','B+',606,113,'2023-11-16','INSERT'
        EXEC PT37_PROCE4 1007,'Haider Ali','Male','0305-2922443','Gujrat','O+',607,111,'2023-08-23','INSERT'
        EXEC PT37_PROCE4 1008,'Zubair','Male','0345-2389143','Gujranwala','AB+',608,107,'2022-01-12','INSERT'
		EXEC PT37_PROCE4 1009,'Laiba','Female','0340-2000233','Gujrat','B+',609,106,'2023-08-02','INSERT'
        EXEC PT37_PROCE4 1010,'Sadiq','Male','0301-2311143','Faislabad','A+',610,108,'2023-01-22','INSERT'
	    EXEC PT37_PROCE4 0,'','','','','',0,0,'','SELECT'
        EXEC PT37_PROCE4 1020,'Zain ALi','Male','0343-0019241','Gujrat','A+',6,102,'2023-08-28','UPDATE'
        EXEC PT37_PROCE4 0,'','','','','',0,0,'','DELETE'     
                 
      ---------Procedure for entering hospital data
               GO
	CREATE PROCEDURE Hosp_PROCE4(
        @id INT  ,
        @name VARCHAR(40),
        @M_id INT ,
		@add CHAR(30),
		@Street INT,
		@type VARCHAR(30))
		AS
		BEGIN
		IF @type ='SELECT'
		BEGIN
		SELECT *FROM Hospital;
		END;
		IF @type='INSERT'

		BEGIN
		INSERT INTO Hospital(H_id ,H_Name,M_id,H_add,street)
		VALUES(@id, @name,@M_id,@add,@Street);
		END;
		IF @type ='UPDATE'
		BEGIN
		UPDATE Hospital SET
		H_name=@name,
		H_add=@add,
		M_id=@M_id,
		street=@Street WHERE H_id=@id;
		END;
		IF @type='DELETE'
		BEGIN
		DELETE FROM Hospital WHERE H_id=@id;
		END;
	    END;

	   EXEC Hosp_PROCE4 1,'AKram Eye Hospital',104,' Lahore',3,'INSERT'     
       EXEC Hosp_PROCE4 2,'	CMH Hospital',109,'Lahore',6,'INSERT'     
       EXEC Hosp_PROCE4 3,'Heart care ',102,' Rawalpindi ',7,'INSERT'     
       EXEC Hosp_PROCE4 4,'Noor Hospital',107,'Islamabad ',13,'INSERT'     
       EXEC Hosp_PROCE4 5,'Zohra Nursing Hospital',104,'Rawalpindi',16,'INSERT'     
       EXEC Hosp_PROCE4 6,'Shalimar Hospital',103,' Lahore',25,'INSERT'
	   EXEC Hosp_PROCE4 0,'',0,'',0,'SELECT'    
       EXEC Hosp_PROCE4 6,'Shalimar Hospital',103,' Gujrat',15,'UPDATE'     
       EXEC Hosp_PROCE4 0,'',0,'',0,'	DELETE'     
                 
     ---- Procedure for entering donor data
	     GO
	CREATE PROCEDURE Do_PROCE4(
         @id INT ,
         @name VARCHAR(40),
         @Gender VARCHAR(20),
         @phno VARCHAR(30),
		 @Date_reg VARCHAR(40),
         @addr VARCHAR(30),
		 @age INT,
		 @disease VARCHAR(30),
		 @BG_id INT,
         @BG_type VARCHAR(3),
         @RT_id INT,
		 @type VARCHAR(30))
		AS
		BEGIN
		IF @type ='SELECT'
		BEGIN
		SELECT *FROM Donor;
		END;
		IF @type='INSERT'
		BEGIN
		INSERT INTO Donor(D_id,D_name,D_gender,D_phno,Dt_reg,D_add,D_age,D_disease,BG_id,BG_type,RT_id)
		VALUES(@id, @name, @Gender, @phno,@Date_reg,@addr,@age,@disease,@BG_id,@BG_type,@RT_id);
		END;
		IF @type ='UPDATE'
		BEGIN
		UPDATE Donor SET
		D_Name=@name,
		D_gender=@Gender,
		D_phno=@phno,
		Dt_reg=@Date_reg,
		D_add=@addr,
		D_age=@age,
		D_disease=@disease,
		BG_id=@BG_id,
		BG_type=@BG_type,
		RT_id=@RT_id

		 WHERE D_id=@id;
		END;
		IF @type='DELETE'
		BEGIN
		DELETE FROM Donor WHERE D_id=@id;
		END;
	  END;
	   EXEC Do_PROCE4 21,'Hamza','M','0323-2209271','2023-02-07','Lahore',23,'NULL',1131,'A-',603 ,'INSERT'  
	   EXEC Do_PROCE4 22,'Zubair Rana','M','0302-2331270','2023-03-27','Peshawar',34,'NULL',1132,'B+',605 ,'INSERT'  
	   EXEC Do_PROCE4 23,'Yahyah','M','0344-3112270','2023-02-13','Gujrat',31,'NULL',1133,'O-',601 ,'INSERT'  
	   EXEC Do_PROCE4 24,'Saeeda','F','0301-2341710','2023-12-23','Gujranwala',27,'NULL',1134,'B-',602,'INSERT'  
	   EXEC Do_PROCE4 25,'Mustafa','M','0343-2341710','2023-06-23','Gujrat',29,'NULL',1135,'B-',608,'INSERT'  
	   EXEC Do_PROCE4 26,'Atif','M','0327-8921121','2023-04-26','Lala Musa',39,'NULL',1136,'AB-',604,'INSERT'
	   EXEC Do_PROCE4 27,'Kashif','M','0323-2209271','2023-01-14','Wazirabad',23,'NULL',1137,'A+',601,'INSERT'
	   EXEC Do_PROCE4 28,'Ashraf','M','0300-3200273','2023-05-17','Lahore',43,'Sugar',1138,'O+',609,'INSERT'
	   EXEC Do_PROCE4 29,'Hamza Ali','M','0307-7510270','2023-12-19','Gujrat',19,'NULL',1139,'AB+',601,'INSERT'
       EXEC Do_PROCE4 30,'Kashif','M','0323-2209271','2023-01-14','Wazirabad',23,'NULL',1140,'A+',606,'INSERT'
	   EXEC Do_PROCE4 31,'Ali Haider','M','0308-9909252','2023-06-15','Lahore',26,'Cough',1141,'O+',607,'INSERT'
	   EXEC Do_PROCE4 32,'Taseer','M','0308-9909000','2023-04-03','Sialkot',31,'NULL',1142,'B+',603,'INSERT'
       EXEC Do_PROCE4 33,'Usman Ali','M','0308-9931422','2023-07-01','Lahore',19,'Cough',1143,'O+',604,'INSERT'
       EXEC Do_PROCE4 34,'Ali Luqman','M','0333-1130012','2023-02-15','Lala Musa',27,'NULL',1144,'AB+',605,'INSERT'
       EXEC DO_PROCE4 35,'Zunaira','F','0318-9909081','2023-09-15','Lahore',26,'NULL',1145,'A-',602,'INSERT'
       EXEC Do_PROCE4 36,'Abdullah','M','0308-9003411','2023-11-15','Gujrat',36,'Cough',1146,'AB-',601,'INSERT'
       EXEC Do_PROCE4 37,'Rana Talha','M','0301-1390252','2023-10-28','Lahore',46,'NULL',1147,'B+',610,'INSERT'
       EXEC Do_PROCE4 38,'Husnain','M','0341-3490145','2023-08-10','Lala Musa',32,'NULL',1148,'O-',601,'INSERT'
       EXEC Do_PROCE4 39,'Uzair','M','0304-0971451','2023-03-11','Lahore',26,'Cough',1149,'A+',604,'INSERT'
       EXEC Do_PROCE4 40,'Shazia','F','0334-0104331','2023-10-02','Gujrat',36,'NULL',1150,'AB+',601,'INSERT'
	   EXEC Do_PROCE4 41,'Sohail Rana','M','0300-2305143','2023-01-12','Gujrat',21,'NULL',1151,'O+',601,'INSERT'
       EXEC Do_PROCE4 42,'Talha','M','0343-2022621','2023-01-12','Quetta',31,'NULL',1152,'AB+',604,'INSERT'
       EXEC Do_PROCE4 43,'Abdullah ','M','0340-2922403','2023-11-12','Peshawar',42,'NULL',1153,'B+',605,'INSERT'
       EXEC Do_PROCE4 44,'Zain','M','0333-0082241','2023-05-12','Gujrat',45,'NULL',1154,'A+',606,'INSERT'
	   EXEC Do_PROCE4 45,'Ahmed','M','0300-0082241','2023-01-05','Gujrat',51,'NULL',1155,'O+',603,'INSERT'
       EXEC Do_PROCE4 46,'Abu Bakr','M','0341-0913241','2023-11-06','Lahore',37,'NULL',1156,'O+',602,'INSERT'
       EXEC Do_PROCE4 47,'Javed','M','0307-0082091','2023-12-25','Gujrat',43,'NULL',1157,'AB-',606,'INSERT'
	   EXEC Do_PROCE4 0,'','','','','',0,'',0,'',0,'SELECT'
	   EXEC Do_PROCE4 0,'','','','','',0,'',0,'',0,'DELETE'
       EXEC Do_PROCE4 0,'','','','','',0,'',0,'',0,'UPDATE'


	   ---------------------------STORED PROCEDURES---------------------------

	   -----------------1.Stored procedure for that blood group to which you can donate--------------------- 
	   GO 
	   CREATE PROC Blood_typees(
	   @Bld_type varchar(3))
	   AS
	   BEGIN
	   DECLARE @info VARCHAR(45);
	   IF (@Bld_type='A+')
	   BEGIN
	   SET @info='A+,AB+';
	   SELECT @info AS 'Groups to which you can donate '
	   END;
	    IF (@Bld_type='A-')
		BEGIN
	   SET @info= 'A+,AB+,A-,AB-';
	   SELECT @info AS 'Groups to which you can donate ';
	   END;
	   IF (@Bld_type='B-')
	   BEGIN
	   SET @info='B+,AB+,B-,AB-';
	   SELECT @info AS 'Groups to which you can donate ';
	   END;

	   IF (@Bld_type='B+')
	   BEGIN
	   SET @info='AB+,B+';
	   SELECT @info AS 'Groups to which you can donate ';
	   END;

	   IF (@Bld_type='AB+')
	   BEGIN
	   SET @info='AB+';
	   SELECT @info AS 'Groups to which you can donate ';
	   END;

	   IF (@Bld_type='AB-')
	   BEGIN
	   SET @info= 'AB+,A+';
	   SELECT @info AS 'Groups to which you can donate ';
	   END;
	   
	   IF (@Bld_type='O+')
	   BEGIN
	   SET @info='AB+,A+,B+,O+';
	   SELECT @info AS 'Groups to which you can donate ';
	   END;

	   IF (@Bld_type='O-')
	   BEGIN
	   SET @info='Can donate every blood type';
	   SELECT @info AS 'Groups to which you can donate ';
	   END;

	   END;
	    
		EXEC Blood_typees 'O+'


		
  ----------------------------2.PROCEDURE FOR List Donor Belonging to a blood group AND Who can donate----------------------------
  GO
  CREATE PROC List_Donor3(
  @B_type VARCHAR(3))
  AS
  BEGIN 
  SELECT D_id,D_name,D_gender,BG_type FROM Donor
  WHERE @B_type=BG_type AND D_disease='NULL';
  END;
  EXEC List_Donor 'A+'
 
--------------------3--.PROCEDURE and Temporary Table For viewing stock of donated blood------------------------
GO
CREATE PROC STOCK
AS
BEGIN
      CREATE  TABLE #stock_blood6(
	  id INT,
	  quantity INT,
      B_group VARCHAR(3));
INSERT INTO #stock_blood6(id,quantity,B_group) VALUES
(1,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='A+' GROUP BY BG_type),'A+'),
(2,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='A-' GROUP BY BG_type),'A-'),
(3,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='B+' GROUP BY BG_type),'B+'),
(4,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='B-' GROUP BY BG_type),'B-'),
(5,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='AB+'GROUP BY BG_type),'AB+'),
(6,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='AB-'GROUP BY BG_type),'AB-'),
(7,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='O+' GROUP BY BG_type),'O+'),
(8,(SELECT COUNT(*) FROM Blood_donated WHERE BG_type='O-' GROUP BY BG_type),'O-');
SELECT quantity AS 'Quantity in stock (bags)', B_group AS 'Bloodgroup'
FROM #stock_blood6;
END;
EXEC STOCK
-------------------4.--PROCEDURE For listing Donors having BG_type=AB+ AGE less then 30
GO
CREATE PROC Queryy1(
@type VARCHAR(3),
@age INT)
AS
BEGIN
SELECT D_id,D_name,D_add,D_gender,D_age,BG_type  FROM Donor
 WHERE D_age<@age AND BG_type=@type;
END;

EXEC Queryy1 'O+',45
 -------------------5.-- PROCEDURE FOR listing Donors belong to gujrat and having letter a in name

 GO
CREATE PROC Queryy2(
@city VARCHAR(30),
@Wild VARCHAR(10))
AS
BEGIN
SELECT D_id,D_name,D_add,D_gender,D_age,BG_type  FROM Donor
 WHERE D_add= @city AND D_name like @Wild
END;
EXEC Queryy2 'Gujrat','%a%'

--------------6--List Registered donors whose age between 30-45 and both male and female
 GO
CREATE PROC Queryy3
(
@N1 INT,
@N2 INT)
AS
BEGIN
SELECT Donor.D_name,Donor.D_phno,Donor.BG_type,Donor.D_gender,Donor.D_age,
Registration_teamm.RT_id,Registration_teamm.RT_Name FROM Donor JOIN Registration_teamm ON 
Registration_teamm.RT_id=Donor.RT_id
WHERE Donor.D_age BETWEEN @N1 AND @N2;
END;
EXEC Queryy3 30,45
 
--------------7--List donors and patients whoseblood considered as universal blood 
 GO
CREATE PROC Quer4(
@Type VARCHAR(3))
AS
BEGIN
SELECT Donor.D_name,Donor.BG_type FROM Donor
WHERE Donor.BG_type=@Type
SELECT Patient137.P_Name,Patient137.BG_type FROM Patient137
WHERE Patient137.BG_type=@Type
END;
EXEC Quer4 'O+'

--------------8--Find name of all bloodbanks where boodgroup O- is not required----------------------

GO
CREATE PROC Querry5(
@type VARCHAR(3))
AS
BEGIN
SELECT   Bloodbank.BB_name,Bloodbank.BB_id FROM Bloodbank_manager JOIN Blood_donated
ON Bloodbank_manager.M_id=Blood_donated.M_id JOIN Bloodbank ON 
bloodbank.BB_id=Bloodbank_manager.BB_id
WHERE Blood_donated.BG_type=@type;
END;
EXEC Querry5 'O-'


 --------------9--Find donors who are registered in 2,3 Month----------------------
GO
CREATE PROC Queryy6(
@D1 DATE,
@D2 DATE)
AS
BEGIN
SELECT *FROM Donor
WHERE Dt_reg BETWEEN @D1 AND @D2;
END;
EXEC Queryy6 '2023-01-10','2023-04-30'

--------------10--Retrieve Patient data who received blood quiantity = 1 bag ----------------------
GO
CREATE PROC Queryr11(
@n INT)
AS
BEGIN
SELECT Patient137.P_id,Patient137.P_name ,Patient137.P_Gender,Bloodrequest.Amount_blood
FROM  Patientrequest JOIN Patient137 ON Patient137.P_id=Patientrequest.P_id
JOIN BloodRequest ON Patientrequest.RQ_id=BloodRequest.RQ_id
WHERE Bloodrequest.Amount_blood =@n;

END;
EXEC Queryr11 1


--------------11--Retrieve Manager and respective bloodbanks with age >30 ----------------------
GO
CREATE PROC Querryy8(
@age INT )
AS
BEGIN
SELECT	*FROM Bloodbank_manager JOIN Manager ON Bloodbank_manager.M_id=Manager.M_id
JOIN Bloodbank ON Bloodbank_manager.BB_id=Bloodbank.BB_id
WHERE M_age<@age;
END;
EXEC Querryy8 30

----------------12-Registration team and respective bloodbanks with having members <20 

GO
CREATE PROC Querry9(
@m INT )
AS
BEGIN
SELECT	*FROM Registration_teamm JOIN Bloodbank ON Bloodbank.BB_id=Registration_teamm.BB_id
WHERE RT_members<@m;
END;
EXEC Querry9 20

   --------------13--Retrieve manager detail that stores blood group A+----------------------
   GO
CREATE PROC Querryy9(
@m VARCHAR(3) )
AS
BEGIN
SELECT	*FROM Manager  JOIN Blood_donated ON Manager.M_id=Blood_donated.M_id
WHERE  Blood_donated.BG_type=@m;
END;
EXEC Querryy9 'O+'


  --------------14--Retrieve Total number of rquest by each patient ----------------------

     GO
CREATE PROC Qu13
AS
BEGIN
SELECT	COUNT(Bloodrequest.RQ_id) AS 'NUM_OF Req' FROM BloodRequest JOIN PatientRequest ON BloodRequest.RQ_id=Patientrequest.RQ_id;
END;
EXEC Qu13


-------------15--Retrieve Total number of blood bags by each hospital  ----------------------
  GO
CREATE PROC Querr14
AS
BEGIN
SELECT	Hospital.H_name,BloodRequest.Amount_blood,BloodRequest.BG_type FROM BloodRequest JOIN Hospitalrequestt ON
BloodRequest.RQ_id=Hospitalrequestt.RQ_id JOIN Hospital ON Hospital.H_id=Hospitalrequestt.H_id;
END;
EXEC Querr14



----------------------------------16--Retrieve total number of blood request   ----------------------
    GO
CREATE PROC Que15
AS
BEGIN
SELECT COUNT(RQ_id) AS 'Total requests ' FROM Bloodrequest;
END;
EXEC Que15
 
----------------------------------17--Retrieve Bloodbank detail with manager ,registration team and technical analyst working in it   -----------
 GO
CREATE PROC Que16
AS
BEGIN
SELECT Bloodbank.BB_id,Bloodbank.BB_name,Bloodbank.BB_add,Manager.M_id,Manager.M_name,
Manager.M_age,Manager.M_phno,Registration_teamm.RT_id,Registration_teamm.RT_Name,Registration_teamm.RT_members,
Technical_analyst137.TA_id,Technical_analyst137.TA_Name,Technical_analyst137.TA_ph_nO FROM Bloodbank_manager
JOIN Manager ON Manager.M_id=Bloodbank_manager.M_id JOIN Registration_teamm ON Registration_teamm.BB_id=Bloodbank_manager.BB_id
JOIN Technical_analyst137 ON Technical_analyst137.BB_id=Bloodbank_manager.BB_id JOIN Bloodbank on Bloodbank.BB_id=Bloodbank_manager.BB_id;

END;
EXEC Que16
-------------18--Retrieve specific Bloodbank detail with manager ,registration team and technical analyst working in 
GO
CREATE PROC Que17(
@n INT)
AS
BEGIN
SELECT Bloodbank.BB_id,Bloodbank.BB_name,Bloodbank.BB_add,Manager.M_id,Manager.M_name,
Manager.M_age,Manager.M_phno,Registration_teamm.RT_id,Registration_teamm.RT_Name,Registration_teamm.RT_members,
Technical_analyst137.TA_id,Technical_analyst137.TA_Name,Technical_analyst137.TA_ph_nO FROM Bloodbank_manager
JOIN Manager ON Manager.M_id=Bloodbank_manager.M_id JOIN Registration_teamm ON Registration_teamm.BB_id=Bloodbank_manager.BB_id
JOIN Technical_analyst137 ON Technical_analyst137.BB_id=Bloodbank_manager.BB_id JOIN Bloodbank on Bloodbank.BB_id=Bloodbank_manager.BB_id
WHERE bloodbank.BB_id=@n;
END;
EXEC Que17 214;
      ------------19--Retrieve manager details and Hospital request managed by manager -------------
	  GO
CREATE PROC Que18
AS
BEGIN
SELECT *From Manager JOIN Hospital ON Hospital.M_id=Manager.M_id;
END;
EXEC Que18;

     ------------20--Retrieve bLOOD managed by manager-------------
	  GO
CREATE PROC Quey19
AS
BEGIN
SELECT *FROM Manager LEFT JOIN Blood_donated ON Manager.M_id=Blood_donated.M_id

END;
EXEC Quey19;
 ------------21--Retrieve bLOOD register  by registration team-------------
   GO
CREATE PROC Quey20
AS
BEGIN
SELECT *FROM Patient137 JOIN Manager ON Manager.M_id=Patient137.M_id;
END;
EXEC Quey20;
------------22-Retrieve bLOOD Analysed by Technical analyst-------------
  
     GO
CREATE PROC Queryy22
AS
BEGIN
SELECT Technical_analyst137.TA_id,Technical_analyst137.TA_name,Technical_analyst137.TA_ph_nO,Tecanalyst_blood.BG_type
 From Tecanalyst_blood JOIN 
Technical_analyst137 ON Tecanalyst_blood.TA_id=Technical_analyst137.TA_id;
END;
EXEC Queryy22;
-----------23-Retrieve TOP 5 Donors order by desc-------------


   GO
CREATE PROC Qurry23(
@n1 VARCHAR(30),
@n2 VARCHAR(30))
AS
BEGIN
SELECT *FROM Donor WHERE
D_phno BETWEEN   @n1 AND @n2
ORDER BY D_id DESC ;
END;
EXEC Qurry23 '0300-0000000','0320-0000000'
 
   