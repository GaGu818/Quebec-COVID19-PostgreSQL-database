-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

--01
CREATE TABLE Category(
  cname varchar(30)  NOT NULL
 ,prioritynum INTEGER
 ,PRIMARY KEY(cname)
 );

--02
CREATE TABLE Person(
	hinsurnum INTEGER not null
	,name varchar(30)
	,gender varchar(10)
	,dob varchar(30)
	,phone varchar(30)
	,city varchar(30)
	,postalcd  varchar(30)
	,streetaddr varchar(30)
	,regdate date
	,cname varchar(30) 
	,PRIMARY KEY(hinsurnum)
	,FOREIGN KEY (cname) REFERENCES Category(cname)
);

--03
CREATE TABLE Vaccine(
  vname varchar(30) not null
  ,waitperiod  varchar(30)
  ,doses varchar(30)
  ,PRIMARY KEY(vname)
);

--04
CREATE TABLE VaccLocation(
	locname varchar(30) not null
	,lcity varchar(30)
	,lpostalcd varchar(30)
	,lstreetaddr varchar(30)
	,PRIMARY KEY(locname)
);

--05
CREATE TABLE VaccineBatch(
	vname  varchar(30) not null
	,batchno INTEGER not null
	,mfgdate date
	,exprydate date
	,numdoses varchar(30)
	,locname varchar(30)
	,PRIMARY KEY(vname,batchno)
	,FOREIGN KEY(vname) REFERENCES Vaccine(vname)
	,FOREIGN KEY(locname) REFERENCES VaccLocation(locname)
);
	
--06
CREATE TABLE Vial(
  vname varchar(30) not null
  ,batchno INTEGER not null
  ,vialid varchar(30) not null
  ,PRIMARY KEY(vname,batchno,vialid)
	,FOREIGN KEY(vname,batchno) REFERENCES VaccineBatch(vname,batchno)
 );

--07
CREATE TABLE  Hospital(
   locname  varchar(30) not null
   ,PRIMARY KEY(locname)
	 ,FOREIGN KEY(locname) REFERENCES VaccLocation(locname)
);

--08
CREATE TABLE  Nurse(
	licensenum INTEGER not null
	,name varchar(30)
	,locname varchar(30)
	,PRIMARY KEY(licensenum)
	,FOREIGN KEY(locname) REFERENCES Hospital(locname)
);  

--09
CREATE TABLE VaccDates(
	locname varchar(30) not null
	,vdate DATE not null
	,PRIMARY KEY(locname,vdate)
	,FOREIGN KEY(locname) REFERENCES VaccLocation(locname)
); 

--10
CREATE TABLE VaccSlot(	
	locname varchar(30) not null
	,vdate DATE not null
	,vtime time  not null
	,vslot  varchar(30) not null
	,hinsurnum INTEGER
	,asgndate DATE
	,licensenum INTEGER
	,vname varchar(30)
	,batchno  INTEGER
	,vialid  varchar(30)
	,PRIMARY KEY(locname,vdate,vtime,vslot)
	,FOREIGN KEY(locname,vdate) REFERENCES VaccDates(locname,vdate)
	,FOREIGN KEY(licensenum) REFERENCES Nurse(licensenum)
	,FOREIGN KEY(hinsurnum) REFERENCES Person(hinsurnum)
	,FOREIGN KEY(vname,batchno,vialid) REFERENCES Vial(vname,batchno,vialid)
); 

--11
CREATE TABLE NurseAssignments(
	licensenum INTEGER not null
	,locname varchar(30) not null
	,vdate DATE not null
	,PRIMARY KEY(licensenum,locname,vdate)
	,FOREIGN KEY(licensenum) REFERENCES Nurse(licensenum)
	,FOREIGN KEY(locname,vdate) REFERENCES VaccDates(locname,vdate)
); 