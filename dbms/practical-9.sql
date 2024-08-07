/*practical - 9
part - A*/

select getdate() as today_date
select dateadd(DAY,365,getdate())
select convert(nvarchar,getdate())as "dd mm yyyy"
select convert(nvarchar, getdate(),106)
select convert(nvarchar,getdate(),7)
select datediff(month, '31-dec-08', '31-mar-09')
select datediff(year, '25-jan-12', '14-sep-10')
select datediff(hour, '25-jan-12 7:00', '26-jan-12 10:30')
select day('12-may-16'), month('12-may-16'), year('12-may-16')
select dateadd(year,5,getdate())
select dateadd(month,-2,getdate())
select datename(month,getdate()), datepart(month,getdate())
select eomonth(getdate())
select datediff(year,'13-jun-2005', getdate()),datediff(month,'13-jun-2005', getdate())

/* part - B */

create table emp_detail
(empno int,
empname nvarchar(25),
joiningdate datetime,
salary int,
city varchar(25))

select * from emp_detail

insert into emp_detail values 
(101, 'keyur', '2002-01-15', 12000.00, 'rajkot'),
(102, 'hardik', '2004-02-04', 14000.00, 'ahmedabad'),
(103, 'kajal', '2006-03-14', 15000.00, 'baroda'),
(104, 'bhoomi', '2005-06-23', 12500.00, 'ahmedabad'),
(102, 'harmit', '2004-02-15', 14000.00, 'rajkot'),
(105, 'jay', '2007-03-12', 12000.00, 'surat')

/* incomplete */
/* part - C*/

/* incomplete */
