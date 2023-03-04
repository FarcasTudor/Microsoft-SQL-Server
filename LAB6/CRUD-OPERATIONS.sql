use Shaormerie
go
-----------------------------------Shaorma------------------------------------------

create function TestPretShaorma(@pret float)
returns varchar(50)
as begin
	if @pret >= 26
		return 'valid'
	return 'invalid'
end 

insert into Tipuri(descriere,cantitate) values ('De pui', 400)
select * from Tipuri

create or alter procedure CreateShaorma(@denumire varchar(50),@pret float,@tid int)
as begin
	if (dbo.TestPretShaorma(@pret) = 'valid')
	begin
		insert into Shaorma(denumire,pret,tid) values (@denumire, @pret, @tid)
		print 'Crearea Shaormei a fost efectuata cu succes!'
	end
	else
		print 'Inserarea  valorilor nu s-a putut efectua';
end

create or alter procedure ReadShaorma(@denumire varchar(50))
as begin
	select * from Shaorma where @denumire = denumire
end

create or alter procedure UpdateShaorma(@denumire varchar(50), @pret float)
as begin
	if (dbo.TestPretShaorma(@pret) = 'valid')
	begin
		update Shaorma set denumire = @denumire where pret = @pret
		print 'Shaorma s-a modificat cu succes!'
	end
	else
		print 'Update-ul nu s-a putut efectua'
end

create or alter procedure DeleteShaorma(@denumire varchar(50))
as begin
	delete from Shaorma where @denumire = denumire
	print 'Stergerea shaormei a fost realizata cu succes!'
end

-----------------------------------Magazin------------------------------------------
create function TestNumarDeMagazine(@nr int)
returns varchar(50)
as begin
	if @nr > 0
		return 'valid'
	return 'invalid'
end 

create or alter procedure CreateMagazin(@Nume varchar(50), @Oras varchar(50), @nrMagazine int)
as begin
	if (dbo.TestNumarDeMagazine(@nrMagazine) = 'valid')
	begin
		insert into Magazin(Nume,Oras,NumarDeMagazine) values (@Nume,@Oras,@nrMagazine)
		print 'Magazinul a fost creat cu succes!'
	end
	else
		print 'Inserarea  valorilor nu s-a putut efectua';
end

create or alter procedure ReadMagazin(@Nume varchar(50))
as begin
	select * from Magazin where @Nume = Nume
end

create or alter procedure UpdateMagazin(@nr int)
as begin
	if (dbo.TestNumarDeMagazine(@nr) = 'valid')
	begin
		update Magazin set NumarDeMagazine = @nr where Oras like 'T%'
		print 'Magazinul a fost modificat cu succes!'
	end
	else
		print 'Update-ul nu s-a putut efectua'
end

create or alter procedure DeleteMagazin(@nrMagazine int)
as begin
	delete from Magazin where @nrMagazine = NumarDeMagazine
	print 'Magazinul a fost sters cu succes!'
end

-----------------------------------ShaormaMagazin------------------------------------------
create or alter procedure CreateShaormaMagazin(@ShaormaId int, @mid int, @bonFiscal int)
as begin
	if ((select COUNT (ShaormaId) from ShaormaMagazin where ShaormaId = @ShaormaId and mid = @mid) = 0)
	begin
		insert into ShaormaMagazin(ShaormaId,mid,BonFiscal) values (@ShaormaId,@mid,@bonFiscal)
		print 'Crearea legaaturii Shaorma-Magazin a fost efectuata cu succes!'
	end
end

create or alter procedure ReadShaormaMagazin(@shaormaId int, @mid int)
as begin
	select * from ShaormaMagazin where @shaormaId = ShaormaId and @mid = mid
end

create or alter procedure UpdateShaormaMagazin(@shaormaId int, @mid int, @shaormaIdNou int, @midNou int, @bonFiscal int)
as begin
	if ((select COUNT (mid) from ShaormaMagazin where mid = @midNou) = 0)
	begin
		update ShaormaMagazin set ShaormaId = @shaormaIdNou, mid = @midNou, BonFiscal = @bonFiscal where @shaormaId = ShaormaId and @mid = mid;
		print 'Legatura dintre Shaorma-Magazin a fost modificata cu succes!'
	end
	else
		print 'Update-ul nu s-a putut efectua'
end

create or alter procedure DeleteShaormaMagazin(@shaormaId int, @mid int)
as begin
	delete from ShaormaMagazin where @shaormaId = ShaormaId and @mid = mid
	print 'Legatura Shaorma-Magazin a fost stearsa cu succes!'
end

-----------------------------------Main-CRUD-Procedures------------------------------------------
create or alter procedure CRUD_Shaorma
as begin
	--select * from Tipuri
	exec CreateShaorma @denumire = 'DePui', @pret = 29, @tid = 2302;
	exec ReadShaorma @denumire = 'DePui';
	exec UpdateShaorma @denumire = 'DePorc', @pret = 29;
	--select * from Shaorma
	exec DeleteShaorma @denumire = 'DePorc';
end

insert into Shaorma(denumire,pret,tid) values ('DePuiSiVita',30,2302)
insert into Shaorma(denumire,pret,tid) values ('DePuiSiVita',31,2302)
insert into Magazin(Nume,Oras,NumarDeMagazine) values('Kebab','Iasi',2)
insert into Magazin(Nume,Oras,NumarDeMagazine) values('HappyBelly','Cluj',2)


create or alter procedure CRUD_Magazin
as begin
	exec CreateMagazin @Nume = 'ELGreco',@Oras = 'TgMures', @nrMagazine = 5;
	exec ReadMagazin @Nume = 'ElGreco';
	exec UpdateMagazin @nr = 10;
	exec DeleteMagazin @nrMagazine = 10;
end

select * from Shaorma
select * from Magazin
select * from ShaormaMagazin
select * from Tipuri

delete from Shaorma
delete from Magazin
delete from ShaormaMagazin

create or alter procedure CRUD_ShaormaMagazin
as begin
	exec CreateShaormaMagazin @ShaormaId = 1340, @mid = 21, @bonFiscal = 10;
	exec ReadShaormaMagazin @shaormaId = 1340, @mid = 21;
	exec UpdateShaormaMagazin @shaormaId = 1340, @mid = 21, @shaormaIdNou = 1341, @midNou = 22, @bonFiscal = 20;
	--select * from ShaormaMagazin
	exec DeleteShaormaMagazin @shaormaId = 1341, @mid = 22;
end

set nocount on

exec CRUD_Shaorma
exec CRUD_Magazin
exec CRUD_ShaormaMagazin
-----------------------------------Views------------------------------------------

create or alter view vw_Shaorma
as
select s.denumire from Shaorma s
where s.denumire like 'D%';

create or alter view vw_Magazin_ShaormaMagazin
as 
select m.Nume from Magazin m inner join ShaormaMagazin sm on sm.mid = m.mid

select * from vw_Shaorma
select * from vw_Magazin_ShaormaMagazin
SELECT name FROM sys.indexes

IF EXISTS (SELECT NAME FROM sys.indexes WHERE name='N_idx_shaorma_denumire')
DROP INDEX N_idx_shaorma_denumire ON Shaorma
CREATE NONCLUSTERED INDEX N_idx_shaorma_denumire ON Shaorma (denumire)

IF EXISTS (SELECT NAME FROM sys.indexes WHERE name='N_idx_magazin_shaormamagazin')
DROP INDEX N_idx_magazin_shaormamagazin ON Magazin
CREATE NONCLUSTERED INDEX N_idx_magazin_shaormamagazin ON Magazin (mid)


SELECT OBJECT_NAME(A.[OBJECT_ID]) AS [OBJECT NAME],
I.[NAME] AS [INDEX NAME],
A.LEAF_INSERT_COUNT,
A.LEAF_UPDATE_COUNT,
A.LEAF_DELETE_COUNT
FROM SYS.DM_DB_INDEX_OPERATIONAL_STATS (NULL,NULL,NULL,NULL ) A INNER JOIN SYS.INDEXES AS I
ON I.[OBJECT_ID] = A.[OBJECT_ID] AND I.INDEX_ID = A.INDEX_ID
WHERE OBJECTPROPERTY(A.[OBJECT_ID],'IsUserTable') = 1