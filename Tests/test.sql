create procedure testing @testName varchar(50)
as 
begin
	if not exists (select top 1 TestID from Tests where Name = @testName)
	begin
		raiserror('Invalid test name!', 11, 1);
	end

	declare @test_id int
	declare @startAt datetime
	declare @endAt datetime

	set @startAt = GETDATE()
	insert into TestRuns(Description, StartAt) values (@testName, @startAt)
	set @test_id = (select TestRunID from TestRuns where StartAt = @startAt)

	if(@testName = 'insert_table' or @testName = 'delete_table')
	begin
		if(@testName = 'insert_table')
		begin
			declare tableCursor cursor scroll for select TestTables.TableID from TestTables
			where TestTables.TestID = (select Tests.TestID from Tests where Tests.Name = @testName)
			order by TestTables.Position asc
		end
		else if(@testName = 'delete_table')
		begin
			declare tableCursor cursor scroll for select TestTables.TableID from TestTables
			where TestTables.TestID = (select Tests.TestID from Tests where Tests.Name = @testName)
			order by TestTables.Position desc
		end

		open tableCursor
		declare @table_id int
		declare @tableName varchar(50)
		declare @procedureName varchar(50)
		declare @insertStartAt datetime
		declare @insertEndAt datetime

		fetch first from tableCursor into @table_id
		while @@FETCH_STATUS = 0
		begin
			set @procedureName  = 'delete_table_' + CAST(@table_id as varchar(10))
			exec @procedureName
			fetch next from tableCursor into @table_id
		end
		print 'Delete finished!'
		fetch last from tableCursor into @table_id
		while @@FETCH_STATUS = 0
		begin
			set @insertStartAt = GETDATE()
			set @procedureName  = 'insert_table_' + CAST(@table_id as varchar(10))
			exec @procedureName
			set @insertEndAt = GETDATE()
			insert into TestRunTables(TestRunID,TableID,StartAt,EndAt) values(@test_id, @table_id, @insertStartAt, @insertEndAt)
			fetch prior from  tableCursor into @table_id
		end
		close tableCursor
		deallocate tableCursor
		print 'Insert finished!'
	end
	else 
	begin 
		declare @viewID int
		declare @viewName varchar(50)
		declare @insertStartView datetime
		declare @insertFinishView datetime

		declare viewCursor cursor scroll for select TestViews.ViewID from TestViews
		where TestViews.TestID = (select TestID from Tests where Tests.Name = @testName)
		order by TestViews.ViewID asc

		open viewCursor
		fetch first from viewCursor into @viewID
		while @@FETCH_STATUS = 0
		begin
			print @viewID
			set @insertStartView = GETDATE()
			set @viewName = (select top 1 Name from Views where Views.ViewID = @viewID)
			set @procedureName = 'exec_view' + CAST(@viewId as varchar(10))
			set @insertStartView = GETDATE()
			exec @procedureName
			set @insertFinishView = GETDATE()
			insert into TestRunViews(TestRunID,ViewID,StartAt,EndAt) values (@test_id, @viewID, @insertStartView, @insertFinishView)
			fetch next from  viewCursor into @viewID
		end
		close viewCursor
		deallocate viewCursor
		print 'Select view finished!'
	end

	set @endAt = GETDATE()
	update TestRuns
	set EndAt = @endAt where TestRunID = @test_id

end
go
