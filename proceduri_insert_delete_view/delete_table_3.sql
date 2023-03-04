create procedure delete_table_3
as
begin
	DECLARE @NoOFRows int
	SELECT TOP 1 @NoOfRows = NoOfRows FROM dbo.TestTables where TestID = 2 and TableID = 3
	delete top (@NoOFRows) from dbo.ShaormaMagazin

end