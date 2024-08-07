/* Practical : 19 */

/*Create table and insert data as per below.*/

CREATE TABLE PERSON19
(
	PERSONID INT PRIMARY KEY,
	PERSONNAME VARCHAR(100) NOT NULL,
	DEPARTMENTID INT NULL,
	SALARY DECIMAL(8,2) NOT NULL,
	JOININGDATE DATETIME NOT NULL,
	CITY VARCHAR(100) NOT NULL
)

INSERT INTO PERSON19 VALUES
(101,'Rahul Tripathi',2,
56000,'01-JAN-2000','Rajkot'),

(102,'Hardik Pandya',3,
18000,'25-SEP-2001','Ahmedabad'),

(103 ,'Bhavin Kanani',4,
25000,'14-MAY-2000','Baroda'),

(104 ,'Bhoomi Vaishnav',1,	
39000,'08-FEB-2005','Rajkot'),

(105,'Rohit Topiya',2,
17000,'23-JULY-2001','Jamnagar'),

(106 ,'Priya Menpara',NULL ,
9000,'18-OCT-2000','Ahmedabad'),

(107,'Neha Sharma',2,
34000,'25-DEC-2002','Rajkot'),

(108,'Nayan Goswami',3,
25000,'01-JULY-2001','Rajkot'),

(109,'Mehul Bhundiya',4,
13500,'09-JAN-2005','Baroda'),

(110,'Mohit Maru',5,
14000,'25-MAY-2000','Jamnagar')


CREATE TABLE DEPARTMENT19
(DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50) NOT NULL UNIQUE,
DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
Location VARCHAR(50)NOT NULL)

INSERT INTO DEPARTMENT19 VALUES
(1,'Admin',
'Adm','A-Block'),

(2,'Computer',
'CE','C-Block'),

(3,'Civil',
'CI','G-Block'),

(4,'Electrical',
'EE','E-Block'),

(5,'Mechanical',
'ME','B-Block')

------------------------------------------------------------------------------------------------------
/*From the above given table perform the following queries:*/

/* Part : A */

/*1. Find all persons with their department name & code.*/

SELECT P.PERSONID,P.PersonName,P.DepartmentID,P.Salary, P.JoiningDate, P.City ,D.DEPARTMENTCODE FROM PERSON19 P INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DEPARTMENTID

/*2. Give department wise maximum & minimum salary with department name.*/

SELECT D.DEPARTMENTNAME,MAX(P.SALARY) AS MAX_SALARY,MIN(P.Salary) AS MIN_SALARY FROM PERSON19 P  INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DEPARTMENTID GROUP BY D.DepartmenTNAME

/*3. Find all departments whose total salary is exceeding 100000.*/

SELECT D.DEPARTMENTNAME FROM PERSON19 P INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DepartmentID GROUP BY D.DEPARTMENTNAME HAVING SUM(SALARY)>100000

/*4. Retrieve person name, salary & department name who belongs to Jamnagar city.*/

SELECT P.PERSONNAME,P.SALARY,D.DEPARTMENTNAME FROM PERSON19 P INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DepartmentID WHERE P.CITY='JAMNAGAR'

/*5. Find all persons who does not belongs to any department.*/

SELECT P.PERSONNAME FROM PERSON19 P FULL OUTER JOIN  DEPARTMENT19 D ON P.DEPARTMENTID=D.DepartmentID WHERE P.DEPARTMENTID IS NULL

------------------------------------------------------------------------------------------------------
/* Part : B */


/*1. Find department wise person counts.*/

SELECT D.DEPARTMENTNAME,COUNT(PERSONID) FROM PERSON19 P INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DepartmentID GROUP BY D.DepartmentName

/*2. Find average salary of person who belongs to Ahmedabad city.*/

SELECT AVG(SALARY) FROM PERSON19 WHERE CITY='AHMEDABAD'

/*3. Produce Output Like: <PersonName> earns <Salary> from department <DepartmentName> monthly. (In
Single Column)*/

SELECT (P.PERSONNAME +' EARNS '+ CAST(P.SALARY AS VARCHAR) + ' FROM ' + D.DEPARTMENTNAME) FROM PERSON19 P INNER JOIN DEPARTMENT D ON P.DEPARTMENTID=D.DepartmentID

/*4. List all departments who have no persons.*/

SELECT D.DEPARTMENTNAME,COUNT(P.PERSONID) FROM PERSON19 P INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DEPARTMENTID GROUP BY D.DepartmentName HAVING COUNT(P.PERSONID)=0

/*5. Find city & department wise total, average & maximum salaries.*/

SELECT   D.DEPARTMENTNAME,P.CITY,SUM(P.SALARY) AS TOTAL_SALARY,MAX(P.SALARY) AS MAX_SALARY,AVG(P.SALARY) AS AVERAGE_SALARY  FROM PERSON19 P INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DEPARTMENTID GROUP BY D.DEPARTMENTNAME,P.CITY

--------------------------------------------------------------------------------------------------------------
/* Part : C */


/*1. Display Unique city names.*/

SELECT DISTINCT CITY FROM PERSON19

/*2. List out department names in which more than two persons.*/

SELECT D.DEPARTMENTNAME,COUNT(P.PERSONID) AS DEPARTMENT_WISE_PERSON FROM PERSON19 P INNER JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DepartmentID GROUP BY DepartmentName HAVING COUNT(P.PERSONID)>2

/*3. Combine person name’s first three characters with city name’s last three characters in single column.*/

SELECT (LEFT(PERSONNAME,3)) +' ' + (RIGHT(CITY,3)) FROM PERSON19

/*4. Give 10% increment in Computer department employee’s salary.*/

SELECT (P.SALARY+(P.SALARY*0.10)) AS UPDATED_SALARY FROM PERSON19 P FULL JOIN DEPARTMENT19 D ON P.DEPARTMENTID=D.DEPARTMENTID WHERE D.DEPARTMENTNAME='COMPUTER'

/*5. Display all the person name’s who’s joining dates difference with current date is more than 365 days*/

SELECT PERSONNAME FROM PERSON19 WHERE DATEDIFF(DAY,JOININGDATE,GETDATE())>365
