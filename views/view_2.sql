CREATE VIEW View_2 AS
SELECT denumire, descriere
FROM Tipuri t INNER JOIN Shaorma sh ON t.tid = sh.tid
GO

--drop view View_1