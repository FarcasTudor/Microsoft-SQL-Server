CREATE VIEW View_3 AS
SELECT dbo.Tipuri.cantitate, dbo.Shaorma.denumire, dbo.Magazin.Oras
from dbo.Tipuri inner join
	dbo.Shaorma on dbo.Tipuri.tid = dbo.Shaorma.tid cross join
	dbo.Magazin
group by dbo.Tipuri.cantitate, dbo.Shaorma.denumire, dbo.Magazin.Oras
GO