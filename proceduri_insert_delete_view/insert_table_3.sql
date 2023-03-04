create procedure insert_table_3
as --insert values into the table with 2 primary keys
begin
	DECLARE @NoOFRows int
	DECLARE @n int
	DECLARE @t VARCHAR(30)
	SELECT TOP 1 @NoOfRows = NoOfRows FROM dbo.TestTables where TestID = 1 and TableID = 3
	DECLARE @magazin int
	SELECT TOP 1 @magazin = mid from dbo.Magazin
	select top 1 @n = shaormaId from dbo.Shaorma

	SET @NoOFRows = @NoOFRows + @n
	WHILE @n <= @NoOfRows
	BEGIN
		insert into ShaormaMagazin(ShaormaId,mid,BonFiscal) values (@n, @magazin, @n + @NoOFRows)
		SET @n=@n+1
	END
end