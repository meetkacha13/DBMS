/* PART - A */

CREATE TABLE EMPLOYEE18 (
	EID INT,
	ENAME VARCHAR(100),
	GENDER VARCHAR(10),
	JOININGDATE DATETIME,
	SALARY DECIMAL(8,2),
	CITY VARCHAR(10)
)

INSERT INTO EMPLOYEE18 VALUES
(1,'NICK','MALE','2013-1-1',4000,'LONDON'),
(2,'JULIA','FEMALE','2014-10-1',3000,'NEW YORK'),
(3,'ROY','MALE','2016-6-1',3500,'LONDON'),
(4,'TOM','MALE',NULL,4500,'LONDON'),
(5,'JERRY','MALE','2013-2-1',2800,'SYDNEY'),
(6,'PHILIP','MALE','2015-1-1',7000,'NEW YORK'),
(7,'SARA','FEMALE','2017-8-1',4800,'SYDNEY'),
(8,'EMILY','FEMALE','2015-1-1',5500,'NEW YORK'),
(9,'MICHAEL','MALE',NULL,6500,'LONDON'),
(10,'JOHN','MALE','2015-1-1',8800,'LONDON')


/*Produce output like <Ename> 
works at <city> and earns <salary>.*/

SELECT (ENAME+' WORKS AT '+CITY+' AND EARNS '+CAST(SALARY AS VARCHAR)) FROM EMPLOYEE18

/*Find total number of employees 
whose salary is more than 5000.*/

SELECT COUNT(EID) FROM EMPLOYEE18 WHERE SALARY>5000

/*Write a query to display first 4 & last 3 
characters of all the employees.*/

SELECT LEFT(ENAME,4) AS FIRST_4,RIGHT(ENAME,3) AS LAST_3 FROM EMPLOYEE18

/*List the city having total salaries 
more than 15000 and employees 
joined after 1st January, 2014.*/

SELECT CITY,SUM(SALARY) FROM EMPLOYEE18 
WHERE JOININGDATE > '2014-1-1' 
GROUP BY CITY HAVING SUM(SALARY)>15000 

/*Write a query to replace “u” 
with “oo” in Ename*/

SELECT REPLACE(ENAME,'U','OO')AS MODIFIED_NAME FROM EMPLOYEE18


/* PART - B */

/*Display city with average salaries 
and total number of employees belongs 
to each city.*/

SELECT CITY,AVG(SALARY) AS AVG_SAL,COUNT(EID) AS NO_OF_EMP FROM EMPLOYEE18 
GROUP BY CITY

/*Display total salaries paid to 
female employees.*/

SELECT SUM(SALARY) AS TOTAL_FEMALE_SALARY FROM EMPLOYEE18 WHERE GENDER='FEMALE'

/*Display name of the employees and 
their experience in years.*/

SELECT ENAME,DATEDIFF(YEAR,JOININGDATE,GETDATE()) AS EXPERIENCE  FROM EMPLOYEE18

/*Remove column department 
from employee table.*/

ALTER TABLE EMPLOYEE18 DROP COLUMN DEPARTMENT

SELECT * FROM EMPLOYEE
/*Update the value of city from syndey to null.*/

UPDATE EMPLOYEE18 SET CITY=NULL WHERE CITY='SYDNEY'

/* PART - C */

/*Retrieve all Employee name,
Salary & Joining date.*/

SELECT ENAME,SALARY,JOININGDATE FROM EMPLOYEE18

/*Find out combine 
length of Ename & Gender.*/

SELECT LEN(ENAME)+LEN(GENDER) AS COMBINED_LENGTH FROM EMPLOYEE18

/*Find the difference between 
highest & lowest salary.*/

SELECT MAX(SALARY)-MIN(SALARY) FROM EMPLOYEE18

/*Rename a column from 
Ename to FirstName.*/

EXEC sp_rename 'EMPLOYEE18.ENAME','FIRSTNAME','COLUMN'

SELECT * FROM EMPLOYEE18

/*Rename a table from Employee to EmpMaster.*/

EXEC sp_rename 'DBO.EMPLOYEE18','EMPMASTER'

SELECT * FROM EMPMASTER
