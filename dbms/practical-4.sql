/*practical 4
part A*/

create table employee 
(empno int,
empname varchar(25),
joiningdate datetime,
salary decimal(8,2),
city varchar(20)
)

insert into employee values (101, 'keyur', '5-jan-2002', 12000.00, 'rajkot')
insert into employee values (102, 'hardik', '15-feb-2004', 14000.00, 'ahmedabad')
insert into employee values (103, 'kajal', '14-mar-2006', 15000.00, 'baroda')
insert into employee values (104, 'bhoomi', '23-jun-2005', 12500.00, 'ahmedabad')
insert into employee values (105, 'harmit', '15-feb-2004', 14000.00, 'rajkot')
select * from employee

delete from employee where salary>=14000.00
delete from employee where city='rajkot'
delete from employee where joiningdate>'1-jan-2007'
truncate table employee
drop table employee

/*part B*/

CREATE TABLE account
( actno INT,
cname VARCHAR(50),
bname VARCHAR(50),
amount DECIMAL(8,2),
adate DATE
)

insert into account values (101, 'anil', 'vrce', 1000.00, '1-mar-1995')
insert into account values (102, 'sunil', 'ajni', 5000.00, '4-jan-1996')
insert into account values (103, 'mehul', 'karolbagh', 3500.00, '17-nov-1995')
insert into account values (104, 'madhuri', 'chandi', 1200.00, '17-dec-1995')
insert into account values (105, 'prmod', 'm.g.road', 3000.00, '27-mar-1996')
insert into account values (106, 'sandip', 'andheri', 2000.00, '31-mar-1996')
insert into account values (107, 'shivani', 'virar', 1000.00, '5-sep-1995')
insert into account values (108, 'kranti', 'nehru place', 5000.00, '2-jul-1995')
insert into account values (109, 'minu', 'powai', 7000.00, '10-aug-1995')

select * from account

delete from account where amount>=4000.00
delete from account where bname='chandi'
delete from account where adate>'1-oct-1995'
truncate table account
drop table account

/*part C*/
CREATE TABLE account
( actno INT,
cname VARCHAR(50),
bname VARCHAR(50),
amount DECIMAL(8,2),
adate DATE
)

insert into account values (101, 'anil', 'vrce', 1000.00, '1-mar-1995')
insert into account values (102, 'sunil', 'ajni', 5000.00, '4-jan-1996')
insert into account values (103, 'mehul', 'karolbagh', 3500.00, '17-nov-1995')
insert into account values (104, 'madhuri', 'chandi', 1200.00, '17-dec-1995')
insert into account values (105, 'prmod', 'm.g.road', 3000.00, '27-mar-1996')
insert into account values (106, 'sandip', 'andheri', 2000.00, '31-mar-1996')
insert into account values (107, 'shivani', 'virar', 1000.00, '5-sep-1995')
insert into account values (108, 'kranti', 'nehru place', 5000.00, '2-jul-1995')
insert into account values (109, 'minu', 'powai', 7000.00, '10-aug-1995')

select * from account

update account set amount=5000 where cname='anil'
update account set amount=null where actno=109
select * from account order by bname desc
select * from account where amount>=3000 and amount<=5000
drop table account
