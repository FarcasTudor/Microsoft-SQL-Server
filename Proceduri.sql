use Shaormerie
go

--add new column
alter table Suc
add cantitate int 


--modify the type of a column
alter table Suc
alter column cantitate bigint

--modify back the type of a column
alter table Suc
alter column cantitate int

--remove a column
alter table Suc
drop column cantitate

--create new table
create table Bucatar(
BucatarId int not null primary key,
Nume varchar(20) not null,
Prenume varchar(20),
Varsta int 
);

alter table Bucatar
add constraint df_18 default 18 for varsta

alter table Bucatar
drop constraint df_18;

--create new table
create table Manager(
ManagerId int not null primary key,
Nume varchar(20) not null,
Prenume varchar(20),
Varsta int 
);

--delete a table
drop table Manager

select * from Manager

insert into Manager(ManagerId,Nume, Prenume, Varsta)
values(1,'AAA','AAA',10)
delete from Manager where ManagerId = 1;


select * from Anagajat

--modify column with default constraint
alter table Manager
add constraint df_18 default 18 for varsta

--remove default constraint from a column
alter table Manager
drop constraint df_18;


 
--create a foreign key constraint on a new table Facturi
create table Facturi(
Fid int not null primary key,
ManagerId int constraint fk_Facturi_Manager foreign key(ManagerId) references Manager(ManagerId)
);

--remove a foreign key and the new table
alter table Facturi
drop constraint fk_Facturi_Manager;
drop table Facturi

