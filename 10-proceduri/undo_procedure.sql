create procedure undo_procedure @valoare INT
as
begin
	if @valoare = 1 exec undoModifTipColoana
	else 
	if @valoare = 2 exec removeDefaultConstraint
	else
	if @valoare = 3 exec removeTabel
	else 
	if @valoare = 4 exec removeColumn
	else
	if @valoare = 5 exec removeForeignKey
	else print 'Eroare la undo!'

end