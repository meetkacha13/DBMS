/* practical - 17 */

create table employee17
( eid int,
ename varchar(100),
gender varchar(10),
joiningdate datetime,
salary decimal(8,2),
city varchar(100)
)

insert into employee17 values
(1, 'nick', 'male', '2013-01-01', 4000, 'london'),
(2, 'julian', 'female', '2014-10-01', 3000, 'new york'),
(3, 'roy', 'male', '2016-06-01', 3500, 'london'),
(4, 'tom', 'male', null, 4500, 'london'),
(5, 'jerry', 'male', '2013-02-01', 2800, 'sydney'),
(6, 'philip', 'male', '2015-01-01', 7000, 'new york'),
(7, 'sara', 'female', '2017-08-01', 4800, 'sydney'),
(8, 'emily', 'female', '2015-01-01', 5500, 'new york'),
(9, 'michael', 'male', null, 6500, 'london'),
(10, 'john', 'male', '2015-01-01', 8800, 'london')

select * from employee17
/*part - A*/

/*Display all the employees whose name 
starts with “m” and 4th character is “h”.*/

SELECT * FROM EMPLOYEE17 WHERE ENAME LIKE 'M__H%'

/*Find the value of 3 raised to 5.
Label the column as output.*/

SELECT POWER(3,5) AS OUTPUT

/*Write a query to subtract 20 
days from the current date.*/

SELECT DATEADD(DAY,-20,GETDATE()) AS RESULT

/*Write a query to display name 
of employees whose name starts with 
“j” and contains “n” in their name.*/

SELECT ENAME FROM EMPLOYEE17 WHERE ENAME LIKE 'J%N%'

/*Display 2nd to 9th character of the 
given string “SQL Programming”.*/

SELECT SUBSTRING('SQL PROGRAMMING',2,8) AS SUBSTRING


/* PART - B */

/*Display name of the employees whose 
city name ends with “ney” 
&contains six characters.*/
SELECT ENAME FROM EMPLOYEE17 WHERE CITY LIKE '___NEY'

/*Write a query to convert value 15 to string.*/

SELECT CAST(15 AS VARCHAR(50)) AS STRING

/*Add department column with varchar (20)
to Employee table.*/

ALTER TABLE EMPLOYEE17 ADD DEPARTMENT VARCHAR(20)

/*Set the value of department to Marketing 
who belongs to London city.*/

UPDATE EMPLOYEE17 SET DEPARTMENT = 'MARKETING' WHERE CITY = 'LONDON'

/*Display all the employees 
whose name ends with either “n” or “y”*/

SELECT ENAME FROM EMPLOYEE17 WHERE ENAME LIKE '%[NY]'
SELECT ENAME FROM EMPLOYEE17 WHERE ENAME LIKE '%N' OR ENAME LIKE '%Y'

/* PART - C */

/*Find smallest integer value that 
is greater than or equal 
to 63.1, 63.8 and -63.2.*/

SELECT CEILING(63.1) AS Result1, 
       CEILING(63.8) AS Result2, 
       CEILING(-63.2) AS Result3;

/*Display all employees whose joining
date is not available.*/

SELECT * FROM EMPLOYEE17 WHERE JOININGDATE IS NULL

/*Display name of the employees in capital 
letters and city in small letters.*/

SELECT UPPER(ENAME),LOWER(CITY) FROM EMPLOYEE17

/*Change the data type of Ename 
from varchar (30) to char (30).*/

ALTER TABLE EMPLOYEE17 ALTER COLUMN ENAME CHAR(30) 

/*Display city wise maximum salary.*/

SELECT CITY,MAX(SALARY) FROM EMPLOYEE17 GROUP BY CITY 
