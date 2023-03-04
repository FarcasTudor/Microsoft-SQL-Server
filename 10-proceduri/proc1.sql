create procedure modifTipColoana
as
begin

--modify the type of a column
alter table Suc
alter column cantitate decimal (2,1)

print 'Coloana cantitate din tabelul Suc tocmai s-a modificat!'

end

go