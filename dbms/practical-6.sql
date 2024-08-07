/* practical - 6
part - A */

create table student
( stuid int,
firstname varchar(25),
lastname varchar(25),
website varchar(50),
city varchar(25)
)

select * from student

insert into student values (1011, 'keyur', 'patel', 'techonthenet.com', 'rajkot')
insert into student values (1022, 'hardik', 'shah', 'digminecraft.com', 'ahmedabad')
insert into student values (1033, 'kajal', 'trivedi', 'bigactivities.com', 'baroda')
insert into student values (1044, 'bhoomi', 'gajera', 'checkyourmath.com', 'ahmedabad')
insert into student values (1055, 'harmit', 'mitel', null, 'rajkot')
insert into student values (1066, 'ashok', 'jani', null, 'baroda')

SELECT * FROM STUDENT
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'K%'
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '_____'
SELECT FIRSTNAME,LASTNAME,CITY FROM STUDENT WHERE CITY LIKE '_____%a';
SELECT * FROM STUDENT WHERE LASTNAME LIKE '%tel'
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'ha%t';
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'k_y%';

/*Part : B*/

SELECT * FROM STUDENT WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____'
SELECT * FROM STUDENT WHERE LASTNAME LIKE '%jer%';
SELECT * FROM STUDENT WHERE City LIKE 'r%' OR CITY LIKE 'b%'
SELECT * FROM STUDENT WHERE WEBSITE IS NOT NULL
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'A%' OR FIRSTNAME LIKE 'H%'
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '_A%' OR FIRSTNAME LIKE '_E%' 
OR FIRSTNAME LIKE '_I%' OR FIRSTNAME LIKE '_O%' OR FIRSTNAME LIKE '_U%'


/*Part : C*/

SELECT * FROM STUDENT WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____%'
SELECT * FROM STUDENT WHERE LASTNAME LIKE 'PAT%'
SELECT * FROM STUDENT WHERE City NOT LIKE 'B%'
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'HA%' OR FIRSTNAME LIKE 'HE%' OR FIRSTNAME LIKE 'HI%'
OR FIRSTNAME LIKE 'HO%' OR FIRSTNAME LIKE 'HU%'
