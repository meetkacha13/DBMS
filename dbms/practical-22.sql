/*practical - 22*/

create table person22
(personId int primary key,
personName varchar(50) not null,
salary decimal(8,2) not null,
joiningDate datetime not null,
city varchar(100) not null,
age int null,
birthdate datetime not null)

create table personLog
(PLogId int primary key identity(101,1),
personId int not null,
personName varchar(250) not null,
operation varchar(50) not null,
updateDate datetime not null)

/* part - A */

create trigger in_up_de 
on person22 
after insert, update, delete
as
begin
	print 'record is affected'
end

-- not executed
create trigger PersonOperationLog
after insert, update, delete on person22 
for each row 
begin
	/*insert*/
	IF (NEW.personId IS NOT NULL AND OLD.personId IS NULL) THEN
        INSERT INTO personLog (PLogId, personId, personName, operation, updateDate)
        VALUES ('INSERT', NEW.personId, NEW.personName);
    END IF;

	/* update */
	IF (NEW.personId IS NOT NULL AND OLD.personId IS NOT NULL) THEN
        INSERT INTO personLog (PLogId, personId, personName, operation, updateDate)
        VALUES ('UPDATE', NEW.personId, NEW.personName);
    END IF;

    -- Log DELETE operation
    IF (NEW.personId IS NULL AND OLD.personId IS NOT NULL) THEN
        INSERT INTO PersonLog (PLogId, personId, personName, operation, updateDate)
        VALUES ('DELETE', OLD.personId, OLD.personName);
    END IF;
end