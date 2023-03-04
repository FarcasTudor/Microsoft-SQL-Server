create procedure do_procedure @valoare INT
as
begin
	if @valoare = 1 exec modifTipColoana
	else 
	if @valoare = 2 exec addConstraint
	else
	if @valoare = 3 exec createTabel
	else 
	if @valoare = 4 exec addColumn
	else
	if @valoare = 5 exec createForeignKey
	else print 'Eroare!'

end