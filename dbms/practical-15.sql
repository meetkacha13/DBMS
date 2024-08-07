/* practical - 15 
part - A */

create table student2(
rno int,
name varchar(20),
city varchar(20),
did int)

create table academic(
rno int,
spi float,
bklog int)

create table department2(
did int,
dname varchar(20))

insert into student2 values
(101, 'raju', 'rajkot', 10),
(102, 'amit', 'ahmedabad', 20),
(103, 'sajay', 'baroda', 40),
(104, 'neha', 'rajkot', 20),
(105, 'meera', 'ahmedabad', 30),
(106, 'mahesh', 'baroda', 10)

insert into academic values 
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3)

insert into department2 values 
(10, 'computer'),
(20, 'electrical'),
(30, 'mechanical'),
(40, 'civil')

select * from student2
select * from academic
select * from department2

select * from student2 s inner join department2 d on s.did=d.did
where d.did=10

select s.name from student2 s inner join academic a on s.rno=a.rno
where a.spi > 8

select * from department2 d inner join student2 s on d.did=s.did
where s.city = 'rajkot' and d.did = 10

select count(s.did) from student2 s inner join department2 d on s.did=d.did
where d.did = 20
