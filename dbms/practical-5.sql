/*practical - 5*/
/*part - A*/

create table student
( enrollment_no varchar(20),
name varchar(25),
cpi decimal(5,2),
birthdate datetime
)

select * from student

alter table student add city varchar(20),backlog int;
alter table student alter column name varchar(35);
alter table student alter column cpi int;
sp_rename 'student.enrollment_no', 'eno'
alter table student drop column city
sp_rename 'student', 'student_master'
drop table student_master

/*part - B*/

create table deposit 
( actno int,
cname varchar(50),
bname varchar(50),
amount decimal(8,2),
adate datetime
)

select * from deposit

alter table deposit add city varchar(20), pincode int;
alter table deposit alter column cname varchar(35)
alter table deposit alter column amount int
sp_rename 'deposit.actno', 'ano'
alter table deposit drop column city

/*part - C*/

alter table deposit drop column adate
sp_rename 'deposit.cname', 'customername'
sp_rename 'deposit', 'deposit_detail'
drop table deposit_detail
