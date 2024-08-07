 /* practical - 13 */
 /* part - A */

 create table student1 (rno int, name varchar(20), branch varchar(20))
 create table result (rno int, spi int)
 create table employee2(employeeno varchar(10),name varchar(20), managerno varchar(10))

 insert into student1 values 
 (101,'raju','ce'),
 (102,'amit','ce'),
 (103,'sanjay','me'),
 (104,'neha','ec'),
 (105,'meera','ee'),
 (106,'mahesh','me')

 insert into result values
 (101,8.8),
 (102,9.2),
 (103,7.6),
 (104,8.2),
 (105,7.0),
 (107,8.9)

 insert into employee2 values 
 ('e01','tarun',null),
 ('e02','rohan','e02'),
 ('e03','priya','e01'),
 ('e04','milan','e03'),
 ('e05','jay','e01'),
 ('e06','anjana','e04')

 select * from student1
 select * from result
 select * from employee2

SELECT* FROM STUDENT CROSS JOIN RESULT, EMPLOYEE

SELECT s.RNO, s.NAME, s.BRANCH, r.RNO, r.SPI
FROM STUDENT1 s
INNER JOIN RESULT r
ON s.RNO = r.RNO

SELECT s.RNO, s.NAME, s.BRANCH, r.RNO, r.SPI
FROM STUDENT1 s
INNER JOIN RESULT r
ON s.RNO = r.RNO WHERE BRANCH='CE'

SELECT s.RNO, s.NAME, s.BRANCH, r.RNO, r.SPI
FROM STUDENT1 s
INNER JOIN RESULT r
ON s.RNO = r.RNO WHERE BRANCH!='EC'

SELECT RNO, AVG(SPI) AS ALTAS FROM RESULT GROUP BY RNO;

/---6---/

/---7---/

SELECT s.NAME,s.BRANCH,r.SPI FROM STUDENT1 s 
LEFT JOIN RESULT r
ON s.RNO = r.RNO;

SELECT s.NAME,s.BRANCH,r.SPI FROM STUDENT1 s 
RIGHT JOIN RESULT r
ON s.RNO = r.RNO;

SELECT* FROM STUDENT1
SELECT* FROM RESULT

SELECT E.NAME AS "Employee Name",
  M.MANAGERNO AS "Manager"
  FROM employee2 E
  LEFT OUTER JOIN EMPLOYEE2 M 
  ON E.ManagerNo = M.EMPLOYEENO;
  
SELECT* FROM EMPLOYEE  


/* Part : B */

CREATE TABLE Person (PersonID INT, PersonName VARCHAR(50), DepartmentID INT, Salary INT, JoiningDate DATE, City VARCHAR(25))

SELECT *FROM Person

CREATE TABLE Department (DepartmentID INT, DepartmentName VARCHAR(50), DepartmentCode VARCHAR(25), Location VARCHAR(50))

INSERT INTO Department VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block')

SELECT *FROM Department

SELECT Person.PersonName, Department.DepartmentName, Department.DepartmentCode FROM Person
INNER JOIN Department
ON Person.DepartmentID=Department.DepartmentID

SELECT PERSON.PersonName, Department.DepartmentID, Person.Salary FROM Person
INNER JOIN Department
ON Person.DepartmentID=Department.DepartmentID WHERE Salary >= 2000;

SELECT PERSON.PersonName, Department.DepartmentID, Person.Salary FROM Person
INNER JOIN Department
ON Person.DepartmentID=Department.DepartmentID WHERE City='Jamnagar';

/* incomplete part - B */
