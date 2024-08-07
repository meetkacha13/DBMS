/*practical 3
part A*/
CREATE TABLE DEPOSITE( ACTNO INT,CNAME VARCHAR(50),BNAME VARCHAR(50),AMOUNT DECIMAL(8,2), ADATE DATE);
CREATE TABLE BRANCH(BNAME VARCHAR(50),CITY VARCHAR(50));
CREATE TABLE CUSTOMERS( CNAME VARCHAR(50),CITY VARCHAR(50));
CREATE TABLE BORROW(LOANNO INT,CNAME VARCHAR(50),BNAME VARCHAR(50),AMOUNT DECIMAL(8,2));

INSERT INTO DEPOSITE VALUES(101,'ANIL','VRCE',1000,'1-MAR-95');
INSERT INTO DEPOSITE VALUES(102,'SUNIL','AJNI',5000,'4-JAN-96');
INSERT INTO DEPOSITE VALUES(103,'MEHUL','KAROLBAGH',3500,'17-NOV-95');
INSERT INTO DEPOSITE VALUES(104 ,'MADHURI','CHANDI',1200,'17-DEC-95');
INSERT INTO DEPOSITE VALUES(105,'PRAMOD','M.G.ROAD',3000,'27-MAR-96');
INSERT INTO DEPOSITE VALUES(106,'SANDIP','ANDHERI',2000,'31-MAR-96');
INSERT INTO DEPOSITE VALUES(107,'SHIVANI','VIRAR',1000,'5-SEP-95');
INSERT INTO DEPOSITE VALUES(108,'KRANTI','NEHRU PLAE',5000,'2-JUL-95');
INSERT INTO DEPOSITE VALUES(109,'MINU','POWAI',7000,'10-AUG-95');
SELECT*FROM DEPOSITE;

INSERT INTO BRANCH VALUES('VRCE','NAGPUR');
INSERT INTO BRANCH VALUES('AJNI','NAGPUR');
INSERT INTO BRANCH VALUES('KAROLBAGH','DELHI');
INSERT INTO BRANCH VALUES('CHANDI','DELHI');
INSERT INTO BRANCH VALUES('DHARMPETH','NAGPUR');
INSERT INTO BRANCH VALUES('M.G.ROAD','BANGLORE');
INSERT INTO BRANCH VALUES('ANDHERI','BOMBAY');
INSERT INTO BRANCH VALUES('VIRAR','BOMBAY');
INSERT INTO BRANCH VALUES('NEHRU PLAE','DELHI');
INSERT INTO BRANCH VALUES('POWAI','BOMBAY');
SELECT*FROM BRANCH;

INSERT INTO CUSTOMERS VALUES('ANIL','CALCUTTA');
INSERT INTO CUSTOMERS VALUES('SUNIL','DELHI');
INSERT INTO CUSTOMERS VALUES('MEHUL','BARODA');
INSERT INTO CUSTOMERS VALUES('MANDAR','PATNA');
INSERT INTO CUSTOMERS VALUES('MANDHURI','NAGPUR');
INSERT INTO CUSTOMERS VALUES('PRAMOD','NAGPUR');
INSERT INTO CUSTOMERS VALUES('SANDIP','SURAT');
INSERT INTO CUSTOMERS VALUES('SHIVANI','BOMBAY');
INSERT INTO CUSTOMERS VALUES('KRANTI','BOMBAY');
INSERT INTO CUSTOMERS VALUES('NAREN','BOMBAY');
SELECT*FROM CUSTOMERS;

INSERT INTO BORROW VALUES(201,'ANIL','VRCE',1000);
INSERT INTO BORROW VALUES(206,'MEHUL','AJANI',5000);
INSERT INTO BORROW VALUES(311,'SUNIL','DHARAMPETH',3000);
INSERT INTO BORROW VALUES(321,'MADHURI','ANDHERI',2000);
INSERT INTO BORROW VALUES(375,'PRAMOD','VIRAR',8000);
INSERT INTO BORROW VALUES(481,'KRANTI','NEHRU PLACE',3000);
SELECT*FROM BORROW;

SELECT*FROM DEPOSITE;
SELECT*FROM BORROW;
SELECT*FROM CUSTOMERS;
select actno, cname, amount from deposite
select loanno, amount from borrow
SELECT*FROM BORROW WHERE BNAME='ANDHERI';
SELECT ACTNO,AMOUNT FROM DEPOSITE WHERE ACTNO=106;
SELECT CNAME FROM BORROW WHERE AMOUNT>5000; 
SELECT CNAME FROM DEPOSITE WHERE ADATE>'1-DEC-96'; 
select cname from deposite where actno<105

/*part B*/

select cname from customers where city='nagpur' or city='delhi'
select cname ,bname from deposite where amount>4000 and actno<105 
select * from borrow where amount>=3000 and amount<=8000
select * from deposite where bname <> 'andheri'
select actno, cname, amount from DEPOSITE where bname='ajni' or bname='karolbagh' or bname='m.g.road' and actno<=104
select top 5 * from customers
select top 3 * from deposite where amount>1000
select top 5 loanno, cname from borrow where bname <> 'andheri'
select distinct * from customers
select distinct * from branch
select * from customers order by city
select * from deposite order by amount desc

/*part C*/

update deposite set amount=5000 where amount=3000
update borrow set bname='c.g.road' where cname='anil'
update deposite set actno=111, amount=5000 where cname='sandip'
update borrow set amount=amount+amount*0.10
update deposite set amount=amount+5000 where actno>=103 and actno<=107
update borrow set amount=NULL where loanno=321
select cname from borrow where amount is NULL
