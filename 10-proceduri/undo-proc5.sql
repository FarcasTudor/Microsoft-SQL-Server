create procedure removeForeignKey
as
begin

--remove a foreign key and the new table
alter table Facturi
drop constraint fk_Facturi_Manager;
drop table Facturi
print 'Am sters o constrangere de cheie straina din tabelul Facturi, stergand de asemenea si tabelul.'

end
go

