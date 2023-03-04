create procedure insert_table_1 
as --insert values into the table with only primary key
begin
	DECLARE @NoOFRows int
	DECLARE @n int
	DECLARE @t VARCHAR(30)
	SELECT TOP 1 @NoOfRows = NoOfRows FROM dbo.TestTables where TestID = 1 and TableID = 1
	SET @n=1 -- first we have no row inserted
	WHILE @n <= @NoOfRows
	BEGIN
		SET @t = 'Tipuri' + CONVERT (VARCHAR(5), @n)
		-- so, we will have Tipuri1, Tipuri2, ...
		INSERT INTO Tipuri(descriere,cantitate) VALUES (@t, 10)
		SET @n=@n+1
	END
end
