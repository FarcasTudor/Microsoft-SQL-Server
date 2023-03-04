create procedure delete_table_1
as
begin
	DECLARE @NoOFRows int
	SELECT TOP 1 @NoOfRows = NoOfRows FROM dbo.TestTables where TestID = 2 and TableID = 1
	delete top (@NoOFRows) from dbo.Tipuri

end