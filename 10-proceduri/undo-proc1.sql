create procedure undoModifTipColoana
as
begin


--modify back the type of a column
alter table Suc
alter column cantitate int

print 'Coloana cantitate din tabelul Suc s-a modificat inapoi in int!'

end

go

