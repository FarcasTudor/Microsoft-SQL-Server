create procedure removeColumn
as
begin

--remove a column
alter table Manager
drop column AniExperienta
print 'Am sters coloana AniExperienta din tabelul Manager'

end
go

