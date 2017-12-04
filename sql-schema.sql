CREATE TABLE ORGANIZATION (
	Org_ID VARCHAR(100) NOT NULL,
	Org_Name VARCHAR(100),
	Org_Pnumber VARCHAR(12),
	Org_Address VARCHAR(100),
	PRIMARY KEY (Org_ID)
);

CREATE TABLE DONOR (
	Donor_ID VARCHAR(100) NOT NULL,
	Donor_Lname VARCHAR(100),
	Donor_Fname VARCHAR(100),
	Donor_Email VARCHAR(100),
	PRIMARY KEY (Donor_ID)
);

CREATE TABLE DONOR_TO_ORG (
	Donor_ID VARCHAR(100) NOT NULL,
	Org_ID VARCHAR(100) NOT NULL,
	Amount_Donated INT(8),
	PRIMARY KEY (Donor_ID, Org_ID),
	FOREIGN KEY (Donor_ID) REFERENCES DONOR(Donor_ID),
	FOREIGN KEY (Org_ID) REFERENCES ORGANIZATION(Org_ID)
);

CREATE TABLE ANIMAL (
  Animal_ID VARCHAR(100) NOT NULL,
  Animal_Name VARCHAR(25) NOT NULL,
  Breed VARCHAR(25) NOT NULL,
	Age TINYINT(2),
	Fur_Color VARCHAR(10),
	Adopted VARCHAR(3),
	Animal_Folder VARCHAR(20),
	Fostered VARCHAR(3),
	Animal_Type VARCHAR(3),
	Org_ID VARCHAR(100),
	PRIMARY KEY (Animal_ID),
	FOREIGN KEY (Org_ID) REFERENCES ORGANIZATION(Org_ID)
);

CREATE TABLE EMPLOYEE (
	Employee_ID VARCHAR(10) NOT NULL,
	Lname VARCHAR(20) NOT NULL,
	Fname VARCHAR(20) NOT NULL,
	Mname VARCHAR(20),
	Address VARCHAR(100) NOT NULL,
	Phone_Number VARCHAR(12) NOT NULL,
	SSN VARCHAR(9) NOT NULL,
	Org_ID VARCHAR(100) NOT NULL,
	PRIMARY KEY (Employee_ID),
	FOREIGN KEY (Org_ID) REFERENCES ORGANIZATION (Org_ID)
);

CREATE TABLE VOLUNTEER (
	Volunteer_ID VARCHAR(100) NOT NULL,
	LName VARCHAR(50),
	FName VARCHAR(50),
	Phone_Number VARCHAR(13),
	Address VARCHAR(100),
	Emergency_Contact_LName VARCHAR(50),
	Emergency_Contact_FName VARCHAR(50),
	Emergency_Contact_PNumber VARCHAR(13),
	Org_ID VARCHAR(100),
	PRIMARY KEY(Volunteer_ID),
	FOREIGN KEY (Org_ID) REFERENCES ORGANIZATION(Org_ID)
);

CREATE TABLE VACCINE (
	Vaccine_ID VARCHAR(100) NOT NULL,
	Vaccine_Name VARCHAR (100),
	Date_Received DATE,
	Update_Shot_Date DATE,
	PRIMARY KEY (Vaccine_ID)
);

CREATE TABLE LAUNDRY_STATION (
	Station_Number TINYINT(2) NOT NULL,
	Volunteer_ID VARCHAR(100) NOT NULL,
	Buckets TINYINT(3),
	PRIMARY KEY(Station_Number)
);

CREATE TABLE ANIMAL_WALK (
	Volunteer_ID VARCHAR(100) NOT NULL,
	Animal_ID VARCHAR(100) NOT NULL,
	Time_Left TIME,
	Time_Returned TIME,
	PRIMARY KEY (Animal_ID, Volunteer_ID),
	FOREIGN KEY (Animal_ID) REFERENCES ANIMAL(Animal_ID),
	FOREIGN KEY (Volunteer_ID) REFERENCES VOLUNTEER(Volunteer_ID)
);

CREATE TABLE VOLUNTEER_LAUNDRY (
	Station_Number TINYINT(2) NOT NULL,
	Volunteer_ID VARCHAR(100) NOT NULL,
	PRIMARY KEY (Station_Number, Volunteer_ID),
	FOREIGN KEY (Station_Number) REFERENCES LAUNDRY_STATION(Station_Number),
	FOREIGN KEY (Volunteer_ID) REFERENCES VOLUNTEER(Volunteer_ID)
);

CREATE TABLE EMPLOYEE_LAUNDRY (
	Employee_ID VARCHAR(10) NOT NULL,
	Station_Number TINYINT(2) NOT NULL,
	PRIMARY KEY (Employee_ID, Station_Number),
	FOREIGN KEY (Employee_ID)  REFERENCES EMPLOYEE(Employee_ID),
	FOREIGN KEY (Station_Number) REFERENCES LAUNDRY_STATION(Station_Number)
);

CREATE TABLE YARD (
	Yard_Number INT NOT NULL,
	Yard_Size VARCHAR(10) NOT NULL,
	Employee_ID VARCHAR(10) NOT NULL,
	PRIMARY KEY (Yard_Number),
	FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE DIETS(
	Animal_ID VARCHAR(20) NOT NULL,
	Food_Type VARCHAR(20) NOT NULL,
	PRIMARY KEY (Animal_ID, Food_Type),
	FOREIGN KEY (Animal_ID) REFERENCES ANIMAL(Animal_ID)
);

CREATE TABLE DISH (
  Animal_ID VARCHAR(100) NOT NULL,
  Dish_Number TINYINT(3) NOT NULL,
  PRIMARY KEY (Dish_Number),
  FOREIGN KEY (Animal_ID) REFERENCES ANIMAL(Animal_ID)
);

CREATE TABLE KENNEL_AREA (
	Kennel_Number VARCHAR(100) NOT NULL,
	Employee_ID VARCHAR(100),
	Weight_Of_Animal smallint(3),
	PRIMARY KEY (Kennel_Number),
	FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE(Employee_ID)
);

CREATE TABLE ANIMAL_HEALTH (
	Animal_ID VARCHAR(100) NOT NULL,
	Health_Record_Number VARCHAR(100),
	Vaccine_ID VARCHAR(100),
	Spayed_Or_Neutered VARCHAR(3),
	PRIMARY KEY (Animal_ID, Health_Record_Number),
	FOREIGN KEY (Animal_ID) REFERENCES ANIMAL(Animal_ID),
	FOREIGN KEY (Vaccine_ID) REFERENCES VACCINE(Vaccine_ID)
);

/*
ALTER TABLE EMPLOYEE ADD Org_ID VARCHAR(100) NOT NULL;
ALTER TABLE EMPLOYEE ADD FOREIGN KEY (Org_ID) REFERENCES ORGANIZATION (Org_ID);
ALTER TABLE DONOR_TO_ORG ADD FOREIGN KEY (Donor_ID) REFERENCES DONOR(Donor_ID);
ALTER TABLE DONOR_TO_ORG ADD FOREIGN KEY (Org_ID) REFERENCES ORGANIZATION (Org_ID);
ALTER TABLE VOLUNTEER ADD FOREIGN KEY (Org_ID) REFERENCES ORGANIZATION (Org_ID);
ALTER TABLE KENNEL_AREA ADD FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE (Employee_ID);
ALTER TABLE DISH ADD FOREIGN KEY (Animal_ID) REFERENCES ANIMAL (Animal_ID);
ALTER TABLE DIETS ADD FOREIGN KEY (Animal_ID) REFERENCES ANIMAL (Animal_ID);
ALTER TABLE EMPLOYEE_LAUNDRY ADD FOREIGN KEY (Station_Number) REFERENCES LAUNDRY_STATION (Station_Number);
ALTER TABLE EMPLOYEE_LAUNDRY ADD FOREIGN KEY (Employee_ID) REFERENCES EMPLOYEE (Employee_ID);
ALTER TABLE VOLUNTEER_LAUNDRY ADD FOREIGN KEY (Station_Number) REFERENCES LAUNDRY_STATION (Station_Number);
ALTER TABLE VOLUNTEER_LAUNDRY ADD FOREIGN KEY (Volunteer_ID) REFERENCES VOLUNTEER (Volunteer_ID);
ALTER TABLE ANIMAL_WALK ADD FOREIGN KEY (Animal_ID) REFERENCES ANIMAL (Animal_ID);
ALTER TABLE ANIMAL_WALK ADD FOREIGN KEY (Volunteer_ID) REFERENCES VOLUNTEER (Volunteer_ID);
*/

INSERT INTO ORGANIZATION VALUES ('1', 'Utah Animal Adoption Center', '8010000000', 'State Street');
INSERT INTO DONOR VALUES ('1', 'Smith', 'Dan', 'dansmith@email.com');
INSERT INTO DONOR_TO_ORG VALUES ('1', '1', '42069');
INSERT INTO ANIMAL VALUES('1', 'Puffy Ball', 'German Shorthair Pointer', '7', 'Brown', 'No', 'Box', 'No', 'Dog', '1');
INSERT INTO EMPLOYEE VALUES ('1', 'Name', 'False', 'R', '1300 E, UT', '0000000000', '000470000', '1');
INSERT INTO VOLUNTEER VALUES ('1', 'Danger', 'Mike', '0000000000', '1700 S, UT', 'Oldman', 'Gary', '5417778889', '1');
INSERT INTO VACCINE (Vaccine_ID, Vaccine_Name) VALUES ('1', 'Rabies');
INSERT INTO LAUNDRY_STATION VALUES ('1', '1', '4');
INSERT INTO ANIMAL_WALK (Volunteer_ID, Animal_ID) VALUES ('1', '1');
INSERT INTO VOLUNTEER_LAUNDRY VALUES ('1', '1');
INSERT INTO EMPLOYEE_LAUNDRY VALUES ('1', '1');
INSERT INTO YARD VALUES ('1', '50', '1');
INSERT INTO DIETS VALUES ('1', 'Gluten free');
INSERT INTO DISH VALUES ('1', '5');
INSERT INTO KENNEL_AREA VALUES ('1', '1', '49');
INSERT INTO ANIMAL_HEALTH VALUES ('1', '1', '1', 'Yes');


INSERT INTO ANIMAL VALUES ('190248', 'Link', 'Border_Collie', '3', 'Black', 'No', 'Drawer', 'No', 'Dog', '1');
INSERT INTO EMPLOYEE VALUES ('1750', 'Sparks', 'Zoey', 'Kristine', '16 Hawk Ln', '(987)654-321', '12345678', '1');
INSERT INTO VOLUNTEER VALUES ('24869', 'Johnson', 'Mary', '(479)616-9789', '1840 S 1300 E', 'Johnson', 'Luke', '(479)981-7697', '1');
INSERT INTO VACCINE VALUES ('2', 'Parvo', '2017-08-12', '2019-08-11');
INSERT INTO LAUNDRY_STATION VALUES ('2', '1750', '1');
INSERT INTO ANIMAL_WALK VALUES ('24869', '190248', '14:00:00', '14:30:00');
INSERT INTO VOLUNTEER_LAUNDRY VALUES ('2', '24869');
INSERT INTO EMPLOYEE_LAUNDRY VALUES ('1750', '2');
INSERT INTO YARD VALUES ('3', 'middle', '1750');
INSERT INTO DIETS VALUES ('190248', 'reg');
INSERT INTO DISH VALUES ('190248', '4');

insert into ANIMAL values('2', 'Skip', 'Crazy breed', '8', 'white', 'No', 'Drawer', 'No', 'Cat', '1');
insert into EMPLOYEE values('3', 'Flocker', 'Walker', 'James', 'Utah', '1111111111', '12345999', '1');
insert into VOLUNTEER values('2', 'Irishman', 'Aids', '6666666666', 'Utah', 'Irish', 'Dad', '6696696699', '1');
insert into VACCINE (Vaccine_ID, Vaccine_Name) values('3', 'Drunkiness');

insert into ANIMAL values('3', 'Buttercup', 'Spotted', '11', 'black', 'Yes', 'Box', 'No', 'Cat', '1');
insert into ANIMAL values('4', 'Kitty', 'Colors', '60', 'none', 'No', 'Box', 'No', 'Cat', '1');
insert into ANIMAL values('5', 'Kat', '2 colors', '6', 'Orange', 'Yes', 'Box', 'Yes', 'Cat', '1');
insert into ANIMAL values('6', 'Doge', 'Retreiver', '9', 'Brown', 'Yes', 'Drawer', 'Yes', 'Dog', '1');

insert into ANIMAL values('7', 'Memaw', 'boxer', '3', 'black', 'Yes', 'Box', 'No', 'Dog', '1');
insert into ANIMAL values('8', 'Mickey', 'Tabby', '5', 'Red', 'No', 'Drawer', 'Yes', 'Cat', '1', '2017-12-03');
insert into ANIMAL values('9', 'Mackey', 'Daschund', '1', 'Brown', 'Yes', 'Box', 'Yes', 'Dog', '1', '2017-12-01');
insert into ANIMAL values('10', 'Dingus', 'Lab', '2', 'Black', 'No', 'Drawer', 'No', 'Dog', '1', '2017-12-04');
insert into ANIMAL values('11', 'Graham', 'Golden Rottweiler', '6', 'Red', 'No', 'Box', 'Yes', 'Dog', '1', '1995-06-16');
insert into ANIMAL values('12', 'Ross', 'American Shorthais', '13', 'Brown/black', 'Yes', 'Drawer', 'Yes', 'Cat', '1', '1995-10-12');
update ANIMAL set Date_In = '2017-12-04' where Animal_ID = '2';
update ANIMAL set Date_In = '2017-11-30' where Animal_ID = '3';
update ANIMAL set Date_In = '2017-12-05' where Animal_ID = '4';
update ANIMAL set Date_In = '2017-10-31' where Animal_ID = '5';
update ANIMAL set Date_In = '2017-08-21' where Animal_ID = '6';
update ANIMAL set Date_In = '2017-11-04' where Animal_ID = '7';

insert into ANIMAL_HEALTH values('3', '3', '1', 'No');
insert into ANIMAL_HEALTH values('4', '4', '2', 'Yes');
insert into ANIMAL_HEALTH values('11', '11', '3', 'Yes');
insert into ANIMAL_HEALTH values('12', '12', '3', 'Yes');

insert into DONOR values('2', 'Chag', 'Mark', 'mchag@email.com');
insert into DONOR_TO_ORG values('2', '1', '6900');
