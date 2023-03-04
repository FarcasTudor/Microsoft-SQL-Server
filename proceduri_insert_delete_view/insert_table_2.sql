create procedure insert_table_2
as --insert values into the table with primary key and foreign key
begin
	DECLARE @NoOFRows int
	DECLARE @n int
	DECLARE @t VARCHAR(30)
	SELECT TOP 1 @NoOfRows = NoOfRows FROM dbo.TestTables where TestID = 1 and TableID = 2
	DECLARE @fk int
	SELECT TOP 1 @fk = tid FROM Tipuri WHERE cantitate = 10
	SET @n=1 -- first we have no row inserted
	WHILE @n <= @NoOfRows
	BEGIN
		SET @t = 'Shaorma' + CONVERT (VARCHAR(5), @n)
		-- so, we will have Tipuri1, Tipuri2, ...
		INSERT INTO Shaorma(denumire,pret,tid) VALUES (@t, 28, @fk)
		SET @n=@n+1
	END
end