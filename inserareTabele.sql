use Shaormerie
go
insert into Tables(Name) values ('Tipuri')
insert into Tables(Name) values ('Shaorma')
insert into Tables(Name) values ('ShaormaMagazin')


insert into Views(Name) values ('View_1')
insert into Views(Name) values ('View_2')
insert into Views(Name) values ('View_3')

insert into Tests(Name) values ('insert_table')
insert into Tests(Name) values ('delete_table')
insert into Tests(Name) values ('select_view')
insert into Tests(Name) values ('insert_table_10')
insert into Tests(Name) values ('delete_table_10')

insert into TestViews(TestID,ViewID) values (3,1)
insert into TestViews(TestID,ViewID) values (3,2)
insert into TestViews(TestID,ViewID) values (3,3)

--insert
insert into TestTables(TestID,TableID,NoOfRows,Position) values (1,1,100,1)
insert into TestTables(TestID,TableID,NoOfRows,Position) values (1,2,100,2)
insert into TestTables(TestID,TableID,NoOfRows,Position) values (1,3,100,3)
--delete
insert into TestTables(TestID,TableID,NoOfRows,Position) values (2,1,100,3)
insert into TestTables(TestID,TableID,NoOfRows,Position) values (2,2,100,2)
insert into TestTables(TestID,TableID,NoOfRows,Position) values (2,3,100,1)

select * from Views
select * from Tables
select * from Tests
select * from TestTables
--delete from TestTables
select * from View_1
select * from View_2
select * from View_3


exec insert_table_1
exec insert_table_2
exec insert_table_3

exec delete_table_1
exec delete_table_2
exec delete_table_3

select * from Tipuri
select * from Shaorma
--select * from Magazin
select * from ShaormaMagazin


select * from TestRunTables
select * from TestRunViews
select * from TestRuns
--delete from TestRuns

delete from TestRuns
delete from TestRunTables
delete from TestRunViews
 use Shaormerie
 go

 --DE EXECUTAT--
exec testing insert_table
exec testing delete_table
exec testing select_view
--~~~~~~~~~~~~~~~~~~~~~~~--

delete from Tipuri
delete from Shaorma
delete from ShaormaMagazin