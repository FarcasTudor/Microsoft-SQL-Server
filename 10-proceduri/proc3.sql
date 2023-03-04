CREATE PROCEDURE createTabel
AS
BEGIN


--create new table
create table Manager(
ManagerId int not null primary key,
Nume varchar(20) not null,
Prenume varchar(20),
Varsta int 
);
print 'Tabelul Manager s-a creat!'

END