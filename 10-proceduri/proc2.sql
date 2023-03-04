create procedure addConstraint 
as
begin

--modify column with default constraint
alter table Bucatar
add constraint df_18 default 18 for varsta
print 'Am modificat coloana varsta, atribuindu-i o valoare default!'

end

go
