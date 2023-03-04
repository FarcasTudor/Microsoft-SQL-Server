create procedure createForeignKey
as
begin

--create a foreign key constraint on a new table Facturi
create table Facturi(
Fid int not null primary key,
ManagerId int constraint fk_Facturi_Manager foreign key(ManagerId) references Manager(ManagerId)
); 
print 'Am creat o constrangere de cheie straina intr-un tabel nou, numit Facturi'

end
go

