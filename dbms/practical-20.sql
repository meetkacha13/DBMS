/*PRACTICAL-20*/

/*Part-A:*/

/*Views (First create a view then display all views)*/

CREATE TABLE STUDENT4
(
	Rno Int Primary Key,
	Name Varchar (50) Not Null,
	Branch Varchar (50) Not Null,
	SPI Decimal (4,2) Not Null,
	Bklog Int Not Null
)

INSERT INTO STUDENT4 VALUES
(101 ,'Raju','CE',8.80, 0),
(102,'Amit','CE',2.20,3),
(103 ,'Sanjay','ME', 1.50 ,6),
(104,'Neha','EC',7.65,1),
(105,'Meera','EE',5.52,2),
(106,'Mahesh','EC',4.50,3)


/*1. Create a view Personal with all columns.*/

CREATE VIEW PERSONAL AS 
SELECT * FROM STUDENT4

/*2. Create a view Student_Details having columns Name, Branch & SPI.*/

CREATE VIEW STUDENT_DETAILS AS
SELECT NAME,BRANCH,SPI FROM STUDENT4

/*3. Create a view Academic having columns RNo, Name, Branch.*/

CREATE VIEW  Academic2 AS
SELECT RNO,NAME,BRANCH FROM STUDENT4

/*4. Create a view Student_Data having all columns but students whose bklog more than 2.*/

CREATE VIEW STUDENT_DATA AS
SELECT * FROM STUDENT4 WHERE BKLOG>2

/*5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four
letters.*/

CREATE VIEW STUDENT_PATTERN AS
SELECT RNO,NAME,BRANCH FROM STUDENT4 WHERE NAME LIKE '____' 

/*6. Insert a new record to Academic view. (107, Meet, ME)*/

INSERT INTO Academic2 VALUES(107,'MEET','ME')

/*7. Update the branch of Amit from CE to ME in Student_Details view.*/

UPDATE STUDENT_DETAILS SET BRANCH='ME' WHERE NAME='AMIT'

/*8. Delete a student whose roll number is 104 from Academic view.*/

DELETE FROM Academic2 WHERE RNO=104


/*Part-B:*/

/*Create table and insert records as per below.*/

/*From the above given table perform the following queries:*/

/*1. Create a view Personal with all columns.*/

CREATE VIEW PERSONAL2 AS 
SELECT * FROM STUDENT

/*2. Create a view Student_Details having columns Name, Branch & SPI.*/

CREATE VIEW STUDENT_DETAILS2 AS
SELECT NAME,BRANCH,SPI FROM STUDENT4

/*3. Create a view Academic having columns RNo, Name, Branch.*/

CREATE VIEW  Academic3 AS
SELECT RNO,NAME,BRANCH FROM STUDENT4

/*4. Create a view Student_Data having all columns but students whose bklog more than 2.*/

CREATE VIEW STUDENT_DATA_2 AS
SELECT * FROM STUDENT4 WHERE BKLOG>2

/*5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four
letters.*/

CREATE VIEW STUDENT_PATTERN_2 AS
SELECT RNO,NAME,BRANCH FROM STUDENT4 WHERE NAME LIKE '____' 

/*6. Insert a new record to Academic view. (107, Meet, ME)*/

INSERT INTO Academic3 VALUES(107,'MEET','ME')

/*7. Update the branch of Amit from CE to ME in Student_Details view.*/

UPDATE STUDENT_DETAILS SET BRANCH='ME' WHERE NAME='AMIT'

/*Part – C*/

/*1. Delete a student whose roll number is 104 from Academic view.*/

DELETE FROM Academic3 WHERE RNO=104

/*2. Create a view that displays information of all students whose spi is above 8.5.*/

CREATE VIEW INFO AS
SELECT * FROM STUDENT4 WHERE SPI>8.5

/*3. Create a view that displays 0 backlog students.*/

CREATE VIEW BKLOG
AS
SELECT * FROM STUDENT4 WHERE BKLOG=0

/*4. Create a view Computer that displays CE branch data only.*/

CREATE VIEW COMPUTER2
AS
SELECT * FROM STUDENT4 WHERE BRANCH='CE'

SELECT * FROM COMPUTER

/*5. Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.*/

CREATE VIEW RESULT_EC
AS
SELECT NAME,SPI FROM STUDENT4 WHERE SPI<5 AND BRANCH='EC'

SELECT * FROM RESULT_EC

/*6. Update the result of student Sanjay to 4.90 in Result_EC view.*/

UPDATE RESULT_EC SET SPI=4.90 WHERE NAME='SANJAY'

/*7. Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having
bklogs more than 5.*/

CREATE VIEW Stu_Bklog
AS
SELECT RNO,NAME,BKLOG FROM STUDENT4 WHERE NAME LIKE'M%' AND BKLOG>5

SELECT * FROM Stu_Bklog

/*8. Drop Computer view form the database.*/

DROP view COMPUTER
