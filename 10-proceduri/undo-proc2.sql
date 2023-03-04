create procedure removeDefaultConstraint
as
begin

--remove default constraint from a column
alter table Bucatar
drop constraint df_18;
print 'Am sters constrangerea stabilita!'

end
go

