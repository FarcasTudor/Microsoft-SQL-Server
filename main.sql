create procedure main @newVersion int
as
begin
	set nocount on
	if @newVersion > 5 or @newVersion < 0
	begin
		raiserror('Versiunea trebuie sa fie intre 0 si 5!',0,1) with nowait;
		return;
	end
	declare @oldVersion int
	set @oldVersion = (Select idVersiune from dbo.Versiune where idVersiune >= 0 and idVersiune <= 5);
	delete from Versiune where idVersiune is not null;
	insert into Versiune values(@newVersion);
	
	declare @i int
	set @i = @oldVersion

	if @newVersion > @oldVersion
		while ( @i < @newVersion )
		begin
			set @i = @i + 1
			exec do_procedure @i;
		end
	else
		if @newVersion < @oldVersion
			while ( @i > @newVersion )
			begin
				exec undo_procedure @i;
				set @i = @i - 1
			end
		else print 'Suntem deja la aceasta versiune!'
end
go