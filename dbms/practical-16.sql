/* practical - 16 
part - A */

create table student3(
stuid int,
name varchar(100),
enrollmentno varchar(12),
division varchar(50),
sem int,
birthdate datetime,
email varchar(100),
contactno varchar(50))

insert into student3 values
(101, 'naimish patel', '090200107051', 'BCX-3', 3, '1992-12-06', 'naimishp49@gmail.com', 8866205253),
(102, 'firoz a. s.', '090200107090', 'BCY-3', 3, '1994-05-03', 'Firoz.me@gmail.com', 8885999922),
(103, 'krunal vyas', '090243107101', 'BCZ-5', 5, '1984-03-01', 'Krunal.vyas@gmail.com', 9990888877),
(104, 'vijay patel', '090200107102', 'BCX-5', 5, '1985-02-15', 'Vijay.patel123@gmail.com', 8787878787),
(105, 'vimal trivedi', '090200107103', 'BCY-5', 5, '1988-01-20', 'Maulik123@gmail.com', 8789564512)

select * from student3

/*Display Name of Student who belongs to 
either Semester 3 or 5. (Use IN & OR)*/

SELECT NAME FROM STUDENT3 WHERE SEM IN (3,5)

/*Find Student Name & Enrollment No in 
which Student Id between 103 to 105.*/
SELECT NAME, ENROLLMENTNO 
FROM STUDENT3 WHERE STUID BETWEEN 103 AND 105

SELECT NAME, ENROLLMENTNO FROM STUDENT3 WHERE STUID IN (103,104,105)

SELECT NAME, ENROLLMENTNO FROM STUDENT3 WHERE STUID IN (
SELECT STUID FROM STUDENT WHERE STUID <=103 AND STUID>=105
)

/*Find Student Name & Enrollment No 
with their Email Who belongs to 5th Semester*/

SELECT NAME, ENROLLMENTNO, EMAIL FROM STUDENT3
WHERE SEM=5

/*Display All the Details of first 
three students.*/

SELECT TOP 3 * FROM STUDENT3

/*Display Name & Enrollment no of 
first 30% Students who’s contact 
number ends with 7.*/

SELECT TOP 30 PERCENT NAME,ENROLLMENTNO FROM STUDENT3 
WHERE CONTACTNO LIKE '%7'

/*Display Unique Semesters.*/

SELECT DISTINCT SEM FROM STUDENT3

/*Retrieve All the Students who 
have no Enrollment.*/

SELECT * FROM STUDENT3 WHERE ENROLLMENTNO IS NULL

/*Find All Students whose Name does 
not start with ‘V’.*/

SELECT NAME FROM STUDENT3 WHERE NAME NOT LIKE 'V%'

/*Find All Students in which Email 
Contains ‘3@G’ & Only Six Characters.*/

SELECT NAME FROM STUDENT3 WHERE EMAIL LIKE '%3@G%' AND EMAIL LIKE '______'

/*Find Out All the Students whose First Name 
Starts with F And third character must be R.*/

SELECT NAME FROM STUDENT3 WHERE NAME LIKE 'F_R%'

/* PART - B */

/*Find All the Student Details whose Contact No 
contains 877.*/

SELECT * FROM STUDENT3 WHERE CONTACTNO LIKE '%877%'

/*Display Student Name in Which 
Student belongs to Semester 3 & 
Contact Number Does Not Contains 8 & 9.*/

SELECT NAME FROM STUDENT3 WHERE SEM = 3 AND CONTACTNO NOT LIKE '%8%' AND CONTACTNO NOT LIKE '%9%'

/*Find Students who born 
after date 01-01-1990.*/

SELECT * FROM STUDENT3 
WHERE BIRTHDATE BETWEEN '1990-01-01' AND GETDATE()

/*Update Division to BCX-5 & 
Semester 5 whose Student Id Is 102.*/

UPDATE STUDENT3 SET DIVISION = 'BCX-5', SEM=5 WHERE STUID = 102

/*Change the Student’s Name to Firoz Sherasiya 
in which Email is Firoz.Me@Gmail.Com & 
Contact No is 888*/

UPDATE STUDENT3 SET NAME = 'FIROZ SHERASIYA' 
WHERE EMAIL='Firoz.Me@Gmail.Com' 
AND CONTACTNO LIKE '%888%'

/* PART - C */

/*Add one more Column City Varchar (50) 
in Student Table.*/

ALTER TABLE STUDENT3 ADD CITY VARCHAR(50)

/*Remove All BCX-3 Division Students.*/

DELETE FROM STUDENT3 WHERE DIVISION='BCX-3'

/*Change Column Name Email to EmailAddress.*/

EXEC sp_rename 'STUDENT3.EMAIL','STUDENT.EMAILADDRESS'

SELECT * FROM STUDENT3
/*Remove All the Data from Student Table 
Using Truncate.*/

TRUNCATE TABLE STUDENT3

/*Write an SQL query to clone a 
new table Student_New from Student table 
with all data.*/

SELECT * INTO STUDENT_NEW FROM STUDENT

