create procedure delete_table_2
as
begin
	DECLARE @NoOFRows int
	SELECT TOP 1 @NoOfRows = NoOfRows FROM dbo.TestTables where TestID = 2 and TableID = 2
	delete top (@NoOFRows) from dbo.Shaorma

end