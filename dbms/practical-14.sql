/* practical - 14 */
/* part - A */

create table city (cityid int primary key,
name varchar(20) unique,
pincode int not null,
remarks varchar(20))

create table village (vid int primary key,
name varchar(20) not null,
cityid int foreign key references city(cityid))

insert into city values
(1, 'rajkot', 360005, 'good'),
(2, 'surat', 335009, 'very good'),
(3, 'baroda', 390001, 'awesome'),
(4, 'jamnagar', 361003, 'smart'),
(5, 'junagadh', 362229, 'historic'),
(6, 'morvi', 363641, 'ceramic')

insert into village values
(101, 'raiya', 1),
(102, 'madhapar', 1),
(103, 'dodka', 3),
(104, 'falla', 4),
(105, 'bhesan', 5),
(106, 'dhoraji', 5)

select * from city
select * from village

select v.name from village v inner join city c
on c.cityid=v.cityid 
where c.name='rajkot'

select c.name,c.pincode, v.name from city c inner join village v
on c.cityid=v.cityid 

select c.name from city c where c.cityid in(
select v.cityid from village v
group by v.cityid
having count(v.cityid) > 1)

/*4*/
select Name from city c
where cityid in ( select c.cityid from city c
where c.cityid not in (select v.cityid from village v) )

/* 5 */
select c.name ,count(v.name) from city c left join village v on c.cityid=v.cityid
group by c.name 

/* 6 not complete */
select c.name from city c where c.cityid in(
select v.cityid from village v
group by v.cityid
having count(v.cityid) > 1)
