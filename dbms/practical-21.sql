/* practical - 21 */

CREATE TABLE DEPARTMENT21
(
	DepartmentID Int Primary Key,
	DepartmentName Varchar(100) Not Null Unique,
)

CREATE TABLE DESIGNATION21
(
	DesignationID Int Primary Key,
	DesignationName Varchar(100) Not Null Unique,
)

CREATE TABLE PERSON21
(
	
	WorkerID Int Primary Key IDENTITY(101,1),
	FirstName Varchar (100) Not Null,
	LastName Varchar (100) Not Null,
	Salary Decimal (8,2) Not Null,
	JoiningDate Datetime Not Null,
	DepartmentID Int FOREIGN KEY REFERENCES DEPARTMENT21(DepartmentID) Null,
	DesignationID Int  FOREIGN KEY REFERENCES DESIGNATION21(DESIGNATIONID) Null,
)

INSERT INTO DEPARTMENT21 VALUES
(1,'Admin'),
(2,'IT'),
(3,'HR'),
(4,'Account')

INSERT INTO DESIGNATION21 VALUES
(11,'Jobber'),
(12,'Welder'),
(13,'Clerk'),
(14,'Manager'),
(15,'CEO')

INSERT INTO PERSON21 VALUES
('Rahul','Anshu',56000,'1990-01-01',1,12),
('Hardik','Hinsu',18000,'1990-09-25',2,11),
('Bhavin','Kamani',25000,'1991-05-14',NULL,11),
('Bhoomi','Patel',39000,'2014-02-20',1,13),
('Rohit','Rajgor',17000,'1990-07-23',2,15),
('Priya','Mehta',25000,'1990-10-18',2,NULL),
('Neha','Trivedi',18000,'2014-02-20',3,15)
/*DROP TABLE PERSON*/
SELECT * FROM PERSON21

/* part - A */

/*Department, Designation & 
Person Table’s INSERT, 
UPDATE & DELETE Procedures.*/

CREATE PROCEDURE INSERT_DEPARTMENT21
@DEPARTMENTID INT,@DEPNAME VARCHAR(100)
AS
INSERT INTO DEPARTMENT21 VALUES(@DEPARTMENTID,@DEPNAME)

CREATE PROCEDURE INSERT_DESIGNATION21
@DESIGID INT,@DSIGNAME VARCHAR(100)
AS
INSERT INTO DESIGNATION21 VALUES(@DESIGID,@DSIGNAME)

CREATE PROCEDURE INSERT_PERSON21
@FN VARCHAR(100),
@LN VARCHAR(100),
@SAL DECIMAL(8,2),
@JD DATETIME,
@DID INT,
@DESID INT
AS
INSERT INTO PERSON21 VALUES
(@FN,@LN,@SAL,@JD,@DID,@DESID)

EXEC INSERT_PERSON21 'HARSH','BHALODIYA',100000,'2004-9-12',1,15

/*DELETE */
CREATE PROCEDURE DELETE_DEPARTMENT21
@DEPARTMENTID INT
AS
DELETE FROM DEPARTMENT21 WHERE DepartmentID = @DEPARTMENTID

CREATE PROCEDURE DELETE_DESIGNATION21
@DESIGID INT
AS
DELETE FROM DESIGNATION21 WHERE DesignationID = @DESIGID


CREATE PROCEDURE DELETE_PERSON21
@WID INT
AS
DELETE FROM PERSON21 WHERE WorkerID = @WID

EXEC DELETE_PERSON21 108

/*UPDATE*/

CREATE PROCEDURE UPDATE_DEPARTMENT21
@DEPARTMENTID INT,@DEPNAME VARCHAR(100)
AS
UPDATE DEPARTMENT21 SET DepartmentName=@DEPNAME WHERE DepartmentID=@DEPARTMENTID

CREATE PROCEDURE UPDATE_DESIGNATION21
@DESIGID INT,@DSIGNAME VARCHAR(100)
AS
UPDATE DESIGNATION21 SET DesignationName=@DSIGNAME WHERE DesignationID=@DESIGID

CREATE PROCEDURE UPDATE_PERSON21
@WID INT,
@FN VARCHAR(100),
@LN VARCHAR(100),
@SAL DECIMAL(8,2),
@JD DATETIME,
@DID INT,
@DESID INT
AS
UPDATE PERSON21 SET FirstName=@FN,LastName=@LN, 
Salary=@SAL, 
JoiningDate=@JD,
DepartmentID=@DID,
DesignationID=@DESID WHERE WorkerID = @WID


SELECT * FROM PERSON21

EXEC UPDATE_PERSON21 107,'NEHA','CHATURVEDI',350,'2008-10-01',2,12

/*Department, Designation 
& Person Table’s SELECTBYPRIMARYKEY*/

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'DESIGNATION21'

CREATE PROCEDURE SELECTBYPRIMARYKEY_DEPARTMENT
@DEPARTMENTID INT
AS
SELECT * FROM DEPARTMENT21 WHERE DepartmentID=@DEPARTMENTID

CREATE PROCEDURE SELECTBYPRIMARYKEY_DESIGNATION
@DESIGID INT
AS
SELECT * FROM DESIGNATION21 WHERE DesignationID=@DESIGID

CREATE PROCEDURE SELECTBYPRIMARYKEY_PERSON
@WID INT
AS
SELECT * FROM PERSON21 WHERE WorkerID = @WID


/*EXPERIMENTAL THING*/
DROP PROCEDURE SELECTBYPRIMARYKEY_PERSON

CREATE OR ALTER PROCEDURE SELECTBYPRIMARYKEY_PERSON
@TEMP CHAR(500)
AS
SELECT PERSON21.@TEMP AS FirstName FROM PERSON 

EXEC SELECTBYPRIMARYKEY_PERSON '[FirstName]' 

/*Department, Designation & 
Person Table’s (If foreign key 
is available then do write 
join and take columns on select list)*/

CREATE OR ALTER PROCEDURE JOIN_DEPARTMENT_DESIGNATION_PERSON
AS
SELECT P.WorkerID,P.FirstName,P.LastName,P.JoiningDate,P.Salary, DEP.DepartmentID,DEP.DepartmentName,DESIG.DesignationID,DESIG.DesignationName FROM PERSON21 P
LEFT JOIN DEPARTMENT21 DEP ON DEP.DepartmentID = P.DepartmentID
LEFT JOIN DESIGNATION21 DESIG ON DESIG.DesignationID = P.DesignationID

/*Create a Procedure that shows details of the first 3 persons.*/
CREATE OR ALTER PROCEDURE TOP3_PERSON
AS
SELECT TOP 3 * FROM PERSON21


/*

	PART B

*/

/*1. Create a Procedure that 
takes the department name 
as input and returns a table 
with all workers working in that department.*/

CREATE PROCEDURE PARTB_1
@DEPNAME VARCHAR(100)
AS
SELECT P.FirstName FROM PERSON21 P
INNER JOIN DEPARTMENT21 D ON D.DepartmentID = P.DepartmentID WHERE D.DepartmentName = @DEPNAME

SELECT * FROM PERSON21 P
INNER JOIN DEPARTMENT21 D ON D.DepartmentID = P.DepartmentID WHERE D.DepartmentName = 'IT'

/*2. Create Procedure that takes 
department name & designation name 
as input and returns a table with 
worker’s first name, salary, 
joining date & department name.*/

CREATE PROCEDURE PARTB_2
@DEPTNAME VARCHAR(100),@DESIGNAME VARCHAR(50)
AS
SELECT P.FirstName,P.Salary,P.JoiningDate,D.DepartmentName FROM PERSON21 P
INNER JOIN DEPARTMENT21 D ON D.DepartmentID = P.DepartmentID
INNER JOIN DESIGNATION21 DESIG ON P.DesignationID = DESIG.DesignationID 
WHERE D.DepartmentName = @DEPTNAME AND DESIG.DesignationName = @DESIGNAME

/*3. Create a Procedure that takes the 
first name as an input parameter and 
display all the details of the worker 
with their department & designation name.*/

CREATE PROCEDURE PARTB_3
@FN VARCHAR(100)
AS
SELECT P.WorkerID,
P.FirstName,
P.LastName,
P.JoiningDate,
P.Salary,
D.DepartmentName,
DESIG.DesignationName
FROM PERSON21 P
INNER JOIN DEPARTMENT21 D 
ON P.DepartmentID=D.DepartmentID
INNER JOIN DESIGNATION21 DESIG 
ON P.DesignationID = DESIG.DesignationID
WHERE P.FirstName = @FN

/*4. Create Procedure which displays department 
wise maximum, minimum & total salaries.*/

CREATE OR ALTER PROCEDURE PARTB_4
AS
SELECT D.DepartmentName,MAX(SALARY),MIN(SALARY),SUM(SALARY) FROM PERSON21 P
INNER JOIN DEPARTMENT21 D ON P.DepartmentID = D.DepartmentID
GROUP BY DepartmentName

/*5. Create Procedure which displays 
designation wise average & total salaries*/.

CREATE OR ALTER PROCEDURE PARTB_5
AS
SELECT D.DesignationName,MAX(SALARY),MIN(SALARY),SUM(SALARY) FROM PERSON21 P
INNER JOIN DESIGNATION21 D ON P.DesignationID= D.DesignationID
GROUP BY D.DesignationName


/*

	PART C

*/

/*1. Create Procedure that Accepts 
Department Name and Returns Person Count.*/

CREATE PROCEDURE PARTC_1
@DN VARCHAR(100)
AS
SELECT COUNT(WorkerID) FROM PERSON21 P
INNER JOIN DEPARTMENT21 D ON P.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = @DN 

exec partc_1 'IT'
/*2. Create Procedure that accepts Department Name 
& Designation as a parameter with given test cases 
and returns a table with FirstName, LastName, Salary, 
JoiningDate, DepartmentName & Designation.*/

CREATE OR ALTER PROCEDURE PARTC_2
@DEPNAME VARCHAR(100),
@DESIGNAME VARCHAR(100)
AS
SELECT P.FirstName,P.LastName,P.Salary,P.JoiningDate FROM PERSON21 P 
INNER JOIN DEPARTMENT21 D ON P.DepartmentID = D.DepartmentID
INNER JOIN DESIGNATION21 DESIG ON P.DesignationID = DESIG.DesignationID
WHERE (D.DepartmentName = @DEPNAME OR @DEPNAME IS NULL)
		AND (DESIG.DesignationName = @DESIGNAME OR @DESIGNAME IS NULL)

EXEC PARTC_2 'IT',NULL

/*3. Create Procedure that returns DepartmentID, 
DepartmentName & Count of all person belongs 
to that department. i.e. 1 | Admin | 2*/

CREATE OR ALTER PROCEDURE PARTC_3
@DEPNAME VARCHAR(100)
AS
SELECT D.DepartmentID,D.DepartmentName,COUNT(P.WorkerID) FROM PERSON21 P
INNER JOIN DEPARTMENT21 D ON P.DepartmentID = D.DepartmentID WHERE D.DepartmentName=@DEPNAME
GROUP BY D.DepartmentID,D.DepartmentName ORDER BY D.DepartmentID

EXEC PARTC_3 'IT'
