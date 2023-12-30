
--Create Database—
CREATE DATABASE Diet_plan_Health_checkup;

--Create Doctor table--
CREATE TABLE Doctor (
DID VARCHAR(20) NOT NULL,
Dname VARCHAR(20) NOT NULL,
Speciality VARCHAR(20),
Phone_no VARCHAR(20) NOT NULL,
CONSTRAINT Doctor_PK PRIMARY KEY (DID)
);

--Create Nutritionist table--
CREATE TABLE Nutritionist (
NID VARCHAR(20) NOT NULL,
Nname VARCHAR(20) NOT NULL,
Phone_no INT,
Experience CHAR(10),
CONSTRAINT Nutritionist_PK PRIMARY KEY(NID)
);

--Creating Patient table--
CREATE TABLE Patient
(
PID VARCHAR(20) NOT NULL,
Fname VARCHAR(20) NOT NULL,
Lname VARCHAR(20) NOT NULL,
Gender CHAR(10) NOT NULL,
DOB DATE NOT NULL,
NIC CHAR(20) NOT NULL,
Email VARCHAR(50),
DID VARCHAR(20) NOT NULL,
NID VARCHAR(20) NOT NULL,
CONSTRAINT Patient_PK PRIMARY KEY(PID),
CONSTRAINT Patient_FK1 FOREIGN KEY(DID) REFERENCES Doctor(DID),
CONSTRAINT Patient_FK2 FOREIGN KEY(NID) REFERENCES Nutritionist(NID)
);


--Creating Patient_phone table--
CREATE TABLE Patient_Phone
(
PID VARCHAR(20) NOT NULL,
Phone_no VARCHAR(20) NOT NULL,
CONSTRAINT Patient_Phone_PK PRIMARY KEY(PID,Phone_no),
CONSTRAINT Patient_Phone_FK FOREIGN KEY(PID) REFERENCES Patient(PID)
);

--Creating Payment table--
CREATE TABLE Payment (
Pay_ID VARCHAR(20) NOT NULL,
Amount DECIMAL(10,2) NOT NULL,
Pay_method CHAR(20),
PID VARCHAR(20) NOT NULL,
CONSTRAINT payment_PK PRIMARY KEY(Pay_ID),
CONSTRAINT Payment_FK FOREIGN KEY(PID) REFERENCES Patient(PID)
);

--Creating Diet_Plan table--
CREATE TABLE Diet_Plan (
PlanID VARCHAR(20) NOT NULL,
Plan_name VARCHAR(50) NOT NULL,
Calorie_goal INT NOT NULL,
NID VARCHAR(20) NOT NULL,
CONSTRAINT Diet_Plan_PK PRIMARY KEY (PlanID),
CONSTRAINT Diet_Plan_FK FOREIGN KEY (NID) REFERENCES Nutritionist(NID)
);

--Creating Patient_Diet_Plan table--
CREATE TABLE Patient_Diet_Plan(
PID VARCHAR(20) NOT NULL,
PlanID VARCHAR(20) NOT NULL,
Start_Dates DATE NOT NULL,
End_Dates DATE NOT NULL,
CONSTRAINT Patient_Diet_Plan_PK PRIMARY KEY (PID,PlanID),
CONSTRAINT Patient_Diet_Plan_FK1 FOREIGN KEY (PID) REFERENCES Patient(PID),
CONSTRAINT Patient_Diet_Plan_FK2 FOREIGN KEY (PlanID) REFERENCES Diet_Plan(PlanID)
);


--Create Health_Checkup table--
CREATE TABLE Health_Checkup (
Checkup_ID VARCHAR(20) NOT NULL,
Dates DATE NOT NULL,
Pressure_level CHAR(20) NOT NULL,
blood_sugar_level CHAR(20) NOT NULL,
cholesterol_level CHAR(20) NOT NULL,
PID VARCHAR(20) NOT NULL,
DID VARCHAR(20) NOT NULL,

CONSTRAINT Health_Checkup_PK PRIMARY KEY(Checkup_ID),
CONSTRAINT Health_Checkup_FK1 FOREIGN KEY(PID) REFERENCES Patient(PID),
CONSTRAINT Health_Checkup_FK2 FOREIGN KEY(DID) REFERENCES Doctor(DID)
);


--Create Report table--
CREATE TABLE Report (
RID VARCHAR(20) NOT NULL,
Report_Type CHAR(20),
Recommendation VARCHAR(100),
PID VARCHAR(20) NOT NULL,
Checkup_ID VARCHAR(20) NOT NULL,
PlanID VARCHAR(20) NOT NULL,
CONSTRAINT Report_PK PRIMARY KEY(RID),
CONSTRAINT Report_FK1 FOREIGN KEY(PID) REFERENCES Patient(PID),
CONSTRAINT Report_FK2 FOREIGN KEY(Checkup_ID) REFERENCES Health_Checkup(Checkup_ID),
CONSTRAINT Report_FK3 FOREIGN KEY(PlanID) REFERENCES Diet_Plan(PlanID)
);

--Create Meal_Plan table--
CREATE TABLE Meal_Plan (
NID VARCHAR(20) NOT NULL,
MPname CHAR(50) NOT NULL,
Food VARCHAR(30) NOT NULL,
Calorie_Unit INT NOT NULL,
PID VARCHAR(20) NOT NULL,
CONSTRAINT Meal_Plan_PK PRIMARY KEY (NID, MPname),
CONSTRAINT Meal_Plan_FK1 FOREIGN KEY (NID) REFERENCES Nutritionist(NID),
CONSTRAINT Meal_Plan_FK2 FOREIGN KEY (PID) REFERENCES Patient(PID)
);


-- Inserting values into the Doctor table –
INSERT INTO Doctor VALUES ('D123', 'Dr.Kumar', 'Cardiology', '0712345678');
INSERT INTO Doctor VALUES ('D258', 'Dr.Perera', 'Pediatrics', '0776543210');
INSERT INTO Doctor VALUES ('D963', 'Dr.Silva', 'Dermatology', '0767890123');
INSERT INTO Doctor VALUES ('D741', 'Dr.Gunaratne', 'Orthopedics', '0723456789');
INSERT INTO Doctor VALUES ('D652', 'Dr.Fernando', 'Internal Medicine', '0756789012');

-- Inserting values into the Nutritionist table –
INSERT INTO Nutritionist VALUES ('N425', 'Ms.Perera', '0712345678', '5 Years');
INSERT INTO Nutritionist VALUES ('N356', 'Mr.Silva', '0776543210', '8 Years');
INSERT INTO Nutritionist VALUES ('N147', 'Dr.Fernando', '0767890123','10 Years');
INSERT INTO Nutritionist VALUES ('N352', 'Ms.Gunawardena', '0723456789', '3 Years');
INSERT INTO Nutritionist VALUES ('N852', 'Mr.Rajapakse', '0756789012', '6 Years');

-- Inserting values into the Patient table --
INSERT INTO Patient VALUES ('P123','Kamal','Silva','Male','1990-01-01','900101123V','kamalsilva@gmail.com','D123','N425');
INSERT INTO Patient VALUES ('P212','Nimali','Fernando','Female','1992-05-15','920515456V','nimalifernando@gmail.com','D258','N356');
INSERT INTO Patient VALUES ('P324','Ravi','Perera','Male','1985-09-22','850922789V','raviperera@gmail.com','D963','N147');
INSERT INTO Patient VALUES ('P412','Asha','Gunawardena','Female','1988-07-10','880710890V','ashagunawardena@gmail.com','D741','N352');
INSERT INTO Patient VALUES ('P521','Saman','Rajapakse','Male','1995-03-03','950303654V','samanrajapakse@gmail.com','D652','N852');

-- Inserting values into the Meal_Plan table --
INSERT INTO Meal_Plan VALUES ('N425', 'Breakfast', 'Rice and curry', 100,'P123');
INSERT INTO Meal_Plan VALUES ('N356', 'Dinner', 'Chicken Breast', 200,'P212');
INSERT INTO Meal_Plan VALUES ('N147', 'Lunch', 'Brown Rice', 150,'P324');
INSERT INTO Meal_Plan VALUES ('N352', 'Desserts', 'Fruit salad ', 50,'P412');
INSERT INTO Meal_Plan VALUES ('N852', 'Snacks', 'Fresh fruit', 120,'P521');

-- Inserting values into the Patient_Phone table --
INSERT INTO Patient_Phone VALUES ('P123', '0712345678');
INSERT INTO Patient_Phone VALUES ('P123', '0767221436');
INSERT INTO Patient_Phone VALUES ('P212', '0776543210');
INSERT INTO Patient_Phone VALUES ('P324', '0767890123');
INSERT INTO Patient_Phone VALUES ('P324', '0702067686');
INSERT INTO Patient_Phone VALUES ('P412', '0723456789');
INSERT INTO Patient_Phone VALUES ('P521', '0756789012');
INSERT INTO Patient_Phone VALUES ('P521', '0726689052');

-- Inserting values into the Payment table --
INSERT INTO Payment VALUES ('R123', 50.00,'Cash','P123');
INSERT INTO Payment VALUES ('R245', 100.00,'Credit Card','P212');
INSERT INTO Payment VALUES ('R367', 75.00,'Cash','P324');
INSERT INTO Payment VALUES ('R432', 120.00,'Credit Card','P412');
INSERT INTO Payment VALUES ('R521', 80.00,'Cash','P521');

-- Inserting values into the Diet_Plan table --
INSERT INTO Diet_Plan VALUES ('DP421', 'Weight Loss Plan',2000, 'N425');
INSERT INTO Diet_Plan VALUES ('DP258', 'Muscle Building Plan', 2500 ,'N356');
INSERT INTO Diet_Plan VALUES ('DP254', 'Healthy Eating Plan', 1800, 'N147');
INSERT INTO Diet_Plan VALUES ('DP631', 'Low Carb Plan', 2200,'N352');
INSERT INTO Diet_Plan VALUES ('DP592', 'Vegetarian Plan', 1600,'N852');

-- Inserting values into the Patient_Diet_Plan table --
INSERT INTO Patient_Diet_Plan VALUES ('P123','DP421','2023-01-01','2023-02-28');
INSERT INTO Patient_Diet_Plan VALUES ('P212','DP258','2023-03-01','2023-04-30');
INSERT INTO Patient_Diet_Plan VALUES ('P324','DP254','2023-05-01','2023-06-30');
INSERT INTO Patient_Diet_Plan VALUES ('P412','DP631','2023-07-01','2023-08-31');
INSERT INTO Patient_Diet_Plan VALUES ('P521','DP592','2023-09-01','2023-10-31');

-- Inserting values into the Health_Checkup table --
INSERT INTO Health_Checkup VALUES ('CHK15625', '2023-01-15', 'Normal', '120 mg/dL','250mg/dL','P123', 'D123');
INSERT INTO Health_Checkup VALUES ('CHK25625', '2023-03-20', 'High', '150 mg/dL','200mg/dL','P212', 'D258');
INSERT INTO Health_Checkup VALUES ('CHK15422', '2023-05-25', 'Normal', '110 mg/dL','220mg/dL','P324', 'D963');
INSERT INTO Health_Checkup VALUES ('CHK35628', '2023-07-30', 'Low', '80 mg/dL','195mg/dL','P412', 'D741');
INSERT INTO Health_Checkup VALUES ('CHK45625', '2023-09-05', 'Normal', '130 mg/dL','190mg/dL','P521', 'D652');

-- Inserting values into the Report table --
INSERT INTO Report VALUES ('R001', 'Cardiac', 'Maintain a healthy diet and exercise regularly.', 'P123','CHK15625','DP421');
INSERT INTO Report VALUES ('R002', 'Pediatric', 'Ensure proper nutrition and vaccinations.', 'P212','CHK25625','DP258');
INSERT INTO Report VALUES ('R003', 'Dermatology', 'Follow skincare routine and avoid allergens.','P324','CHK15422','DP254');
INSERT INTO Report VALUES ('R004', 'Orthopedic', 'Physical therapy and rest for faster recovery.','P412','CHK35628','DP631');
INSERT INTO Report VALUES ('R005', 'Internal Medicine', 'Monitor blood sugar levels and maintain a balanced diet.','P521','CHK45625','DP592');

use Diet_plan_Health_checkup;


select *
from Patient;

select *
from Health_Checkup;

select Pay_ID
from Payment
where Pay_method='Cash';

select *
from Payment
where Pay_method='Cash';

select *
from Payment
where Amount='80';

select Pay_ID,Pay_method
from Payment
where Amount='80';

select *
from Patient;

select *
from Patient
where Gender='Male';

select PID,Fname,NIC,Email
from Patient
where Gender='Male';

select *
from Patient
where Gender='FeMale';

select PID,Fname,NIC,Email
from Patient
where Gender='FeMale';

select PID, Fname,NIC
from Patient
where Fname='Nimali';


select *
from Patient
Order by Fname DESC;

select Gender,COUNT(Fname)
from Patient
Group by Gender;

select Gender,COUNT(Fname)
from Patient
Group by Gender
having Gender='Male';

select Gender,COUNT(Fname)
from Patient
Group by Gender
having Gender='Female';



select A.PID,A.Fname
from Patient A , Payment B
where A.PID = B.PID and B.Pay_method='Cash';

select *
from Diet_Plan;

select *
from Health_Checkup;

select A.Fname,A.Gender
from Patient A , Health_Checkup B
where A.PID = B.PID and B.Pressure_level='Normal';

select *
from Doctor;

select A.PID,A.Fname,B.Dname,B.Speciality
from Patient A , Doctor B
where A.DID=B.DID and B.Dname='Dr.Kumar';


select A.Fname , C.Amount
from Patient A , Doctor B ,Payment C
where A.DID=B.DID and A.PID=C.PID and  B.Dname='Dr.Kumar';

select *
from Report;




select *
from Diet_Plan;

select A.Fname,B.Report_Type
from Patient A , Report B, Diet_Plan C
where B.PID=A.PID and B.PlanID=C.PlanID and C.Calorie_goal='1800';


select *
from Payment;

select Pay_method, Count(Pay_method)
from Payment
group by Pay_method;

select *
from Nutritionist;

select *
from Meal_Plan;


select A.Fname,C.Amount
from Patient A,Report B, Payment C
where A.PID=C.PID and A.PID=B.PID
and B.RID='R001';


select *
from Patient;

select *
from Diet_Plan;

select *
from Nutritionist;

select A.Fname,A.PID
from Patient A, Diet_Plan B, Nutritionist C
where A.NID=B.NID and A.NID=C.NID and B.Plan_name='Vegetarian Plan';

.
select *
from Meal_Plan;

select *
from Patient;

select *
from Nutritionist;

select B.Nname,A.Fname,A.Gender,C.Calorie_Unit
from Patient A ,Nutritionist B,Meal_Plan C
where A.NID=B.NID and A.NID=C.NID and C.Calorie_Unit>100 
order by C.Calorie_Unit DESC;


select *
from Diet_Plan;


select *
from Health_Checkup;

select *
from Payment;



select *
from Diet_Plan;

select *
from Patient_Diet_Plan;



select  A.Fname , C.Calorie_goal 
from Patient A,Patient_Diet_Plan B ,Diet_Plan C
where A.PID=B.PID and B.PlanID=C.PlanID and C.Calorie_goal<2000
Order by C.Calorie_goal DESC ;


select A.Fname,B.Calorie_goal
from Patient A ,Diet_Plan B,Patient_Diet_Plan C
where A.PID=C.PID and B.PlanID=C.PlanID and B.Calorie_goal<2000
order by B.Calorie_goal DESC;


select *
from Payment;

Update Doctor
set Dname='Dr Kumar'
where DID='D123';





Delete 
from Payment 
where Amount=80;

INSERT INTO Payment VALUES ('R432', 120.00,'Credit Card','P412');
INSERT INTO Payment VALUES ('R521', 80.00,'Cash','P521');





select Amount
from Payment
group by Amount
having Amount>50
order by Amount; 

select Pay_method, Amount
from Payment
group by Pay_method,Amount
having Pay_method='Cash'and  Amount>50
Order by Pay_method;

SELECT Pay_ID, Pay_method, Amount
FROM Payment
GROUP By Pay_ID, Pay_method,Amount
HAVING Pay_method = 'Cash'and Amount>50;








select *
from Doctor;


select DID
from Doctor
where Speciality like '%S';