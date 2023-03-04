drop database Shaormerie

create database Shaormerie
go
use Shaormerie
go

CREATE TABLE Tipuri(
tid int primary key identity,
descriere varchar(50) default 'de pui',
cantitate int

)

CREATE TABLE Shaorma(
shaormaId int primary key identity,
denumire varchar(100) default 'medie',
pret float,
tid int foreign key references Tipuri(tid) on delete cascade
)

CREATE TABLE Cartofi(
cid int primary key identity,
nume varchar(100) default 'pai', 
cantitate int
)
--drop table Suc
CREATE TABLE Suc(
sucId int primary key identity,
nume varchar(100) default 'Cola',
)

CREATE TABLE Meniu(
shaormaId int foreign key references Shaorma(shaormaId),
cid int foreign key references Cartofi(cid),
sucId int foreign key references Suc(sucId),
constraint pk_Meniu primary key(shaormaId, cid, sucId)
)

CREATE TABLE Magazin(
mid int primary key identity,
nume varchar(100),
oras varchar(50) NOT NULL, 
numarDeMagazine int,
numarDeClienti int
)

create table Meniu
(ShaormaId int foreign key references Shaorma(ShaormaId),
cid int foreign key references Cartofi(cid),
sucId int foreign key references Suc(sucId),
constraint pk_Meniu primary key (ShaormaId, cid, sucId)
)

create table Magazin
(mid int primary key identity,
Nume varchar(50),
Oras varchar(50) NOT NULL,
NumarDeMagazine int,
)

create table Distribuitor
(did int primary key identity,
NumeCompanie varchar(50) NOT NULL,
mid int foreign key references Magazin(mid)
)
--drop table ShaormaMagazin
create table ShaormaMagazin
(ShaormaId int foreign key references Shaorma(ShaormaId),
mid int foreign key references Magazin(mid),
BonFiscal int,
constraint pk_MagazinMeniu primary key (ShaormaId, mid)
)

create table Client
(clientId int primary key identity,
nume varchar(50) NOT NULL,
mid int foreign key references Magazin(mid)
)

create table Anagajat
(angajatId int primary key identity,
nume varchar(50) NOT NULL,
varsta int check (varsta >= 18),
mid int foreign key references Magazin(mid)
)

insert into Magazin(Nume, Oras, NumarDeMagazine)
values('ElGreco', 'Targu Mures', 1)
insert into Magazin(Nume, Oras, NumarDeMagazine)
values('PelitKebab', 'Targu Mures', 2)
insert into Magazin(Nume, Oras, NumarDeMagazine)
values('Tomek', 'Targu Mures', 3)
insert into Magazin(Nume, Oras, NumarDeMagazine)
values('Spartan', 'Cluj Napoca', 4)
insert into Magazin(Nume, Oras, NumarDeMagazine)
values('Sultan', 'Iasi', 10)
insert into Magazin(Nume, Oras, NumarDeMagazine)
values('Mama Manu', 'Brasov', 9)
insert into Magazin(Nume, Oras, NumarDeMagazine)
values('Dristor', 'Bucuresti', 8)

insert into Anagajat(nume, varsta, mid)
values('Grigore', 62, 1)
insert into Anagajat(nume, varsta, mid)
values('Ion', 21, 2)
insert into Anagajat(nume, varsta, mid)
values('Marius', 26,3)
insert into Anagajat(nume, varsta, mid)
values('Marcel', 38, 4)


insert into Client(nume, mid)
values('Snoop Dog', 2)
insert into Client(nume, mid)
values('Alina Eremia', 1)
insert into Client(nume, mid)
values('Alex Velea',5)
insert into Client(nume,  mid)
values('Dorian Popa',4)

insert into Tipuri(descriere, cantitate)
values('mica',400)
insert into Tipuri(descriere, cantitate)
values('medie',550)
insert into Tipuri(descriere, cantitate)
values('mare',800)

insert into Shaorma(denumire, pret, tid)
values('De pui', 26,1)
insert into Shaorma(denumire, pret, tid)
values('De vita',32,2)
insert into Shaorma(denumire, pret, tid)
values('mixta',30,3)
insert into Shaorma(denumire, pret, tid)
values('vegan',34,2)

insert into Distribuitor(NumeCompanie, mid)
values('Auchan', 2)
insert into Distribuitor(NumeCompanie, mid)
values('Carrefour', 1)
insert into Distribuitor(NumeCompanie, mid)
values('Kaufland',5)
insert into Distribuitor(NumeCompanie,  mid)
values('Metro',4)
insert into Distribuitor(NumeCompanie,  mid)
values('Lidl',3)
insert into Distribuitor(NumeCompanie,  mid)
values('Selgros',4)

insert into Suc(nume)
values('Cola')
insert into Suc(nume)
values('Fanta')
insert into Suc(nume)
values('Sprite')
insert into Suc(nume)
values('Lipton')


insert into Cartofi(nume, cantitate)
values('Pai', 200)
insert into Cartofi(nume, cantitate)
values('Wedges', 200)
insert into Cartofi(nume, cantitate)
values('Spirala', 200)

--insert into ShaormaMagazin(ShaormaId, mid ,BonFiscal) 
--values (8, 3,1), (10, 2,2) 
--insert into ShaormaMagazin(ShaormaId, mid ,BonFiscal) 
--values (11,10,2),(9,11,4)

insert into Meniu(ShaormaId, cid, sucId) 
values (8, 1, 1), (10, 2, 3), (9, 3, 4) 

select * from Anagajat
select * from Tipuri
select * from Client
select * from Distribuitor
select * from Meniu
select * from Shaorma
select * from Magazin
select * from ShaormaMagazin
select * from Suc
select * from Cartofi

--delete from Magazin
--where mid >= 5

--5 interogari pentru where
select mid, Oras
from Magazin
where Oras = 'Targu Mures'

select mid, Oras
from Magazin
where Oras = 'Cluj Napoca'

select *
from Anagajat
where varsta >= 38

select *
from Tipuri
where descriere = 'mica' or cantitate >= 550

select *
from Shaorma
where denumire like 'D_%' and pret < 28

--order by
select mid, NumarDeMagazine
from Magazin
order by mid DESC

--3 interogari cu group by
select  avg(pret) as pret_mediu
from Shaorma

select max(cantitate) as cantitate_maxima
from Tipuri

select shaormaId, denumire, avg(pret) as PretMediu, sum(pret) as PretTotal
from Shaorma
group by shaormaId, denumire

--2 interogari cu distinct 
select distinct Oras from Magazin
select distinct mid from Distribuitor

--2 interogari cu having
select shaormaId, denumire, avg(pret) as PretMediu, sum(pret) as PretTotal
from Shaorma
where pret > 27 --conditie pt valorile din tabel
group by shaormaId, denumire
having avg(pret) >= 30 or sum(pret) between 88 and 92 -- conditie pt functiile agregate
order by shaormaId

select  tid, descriere, avg(cantitate) as CantitateMedie
from Tipuri
where descriere like 'm%' 
group by tid, descriere
having avg(cantitate) >400 and avg(cantitate) <700

--2 interogari pe tabele aflate in relatie m-n
--afiseaza toate shaormele din magazin
SELECT s.denumire, m.nume
FROM Shaorma s  
INNER JOIN ShaormaMagazin sm ON s.shaormaId = sm.ShaormaId
INNER JOIN Magazin m ON sm.mid = m.mid

--afiseaza toate magazinele care au pretul mediu al shaormei mai mare sau egal cu 30
SELECT s.denumire, avg(s.pret) as PretMediu, m.nume
FROM Shaorma s  
INNER JOIN ShaormaMagazin sm ON s.shaormaId = sm.ShaormaId
INNER JOIN Magazin m ON sm.mid = m.mid
group by s.denumire,m.Nume
having avg(s.pret) >= 30

--afiseaza toate shaormele din magazin care sunt de pui sau de vita
SELECT s.denumire, m.nume
FROM Shaorma s  
FULL OUTER JOIN ShaormaMagazin sm ON s.shaormaId = sm.ShaormaId
FULL OUTER JOIN Magazin m ON sm.mid = m.mid
where s.denumire in ('De pui', 'De vita')

--7 interogări ce extrag informaţii din mai mult de 2 tabele
--afiseaza shaormele din magazin care au bonul fiscal mai mic ca 3
select  sm.BonFiscal, s.denumire, s.pret
from Shaorma s
INNER JOIN ShaormaMagazin sm ON s.shaormaId = sm.ShaormaId
INNER JOIN Magazin m ON sm.mid = m.mid
where sm.BonFiscal < 3

--afiseaza shaormele, sucurile si cartofii din meniu, doar in  cazul in care shaorma contine literele 'De'
SELECT s.denumire, c.nume, suc.nume
FROM Shaorma s  
INNER JOIN Meniu m ON s.shaormaId = m.ShaormaId
INNER JOIN Cartofi c on m.cid = c.cid
INNER JOIN Suc suc on m.sucId = suc.sucId
where s.denumire like '%De%'

--afiseaza meniurile care contin toate sucurile dar nu neaparat si shaormele
SELECT s.denumire,suc.nume
FROM Shaorma s  
RIGHT OUTER JOIN Meniu m ON s.shaormaId = m.ShaormaId
RIGHT OUTER JOIN Suc suc on m.sucId = suc.sucId


--afiseaza shaormele si cartofii din meniu cu conditia ca pretul shaormei sa fie de 7 ori mai mic decat cantitatea cartofilor
SELECT s.denumire, c.nume
FROM Shaorma s  
RIGHT OUTER JOIN Meniu m ON s.shaormaId = m.ShaormaId
RIGHT OUTER JOIN Cartofi c on m.cid = c.cid
WHERE s.pret * 7 < c.cantitate

 --afiseaza sucurile si cartofii din Meniu a caror nume se termina cu litera A
SELECT s.nume, c.nume
FROM Suc s  
INNER JOIN Meniu m ON s.sucId = m.sucId
INNER JOIN Cartofi c on m.cid = c.cid
WHERE  s.nume like '%A' or c.nume like '%A'

--afiseaza toate shaormele a caror id este de 2 ori mai mare ca id-ul sucului si de 3 ori mai mare decat cel al cartofilor
SELECT s.denumire, c.nume, suc.nume
FROM Shaorma s  
FULL OUTER JOIN Meniu m ON s.shaormaId = m.ShaormaId
FULL OUTER JOIN Cartofi c on m.cid = c.cid
FULL OUTER JOIN Suc suc on m.sucId = suc.sucId
WHERE s.shaormaId > suc.sucId * 2 and s.shaormaId > 3 * c.cid

--1.modif tip coloana (int -> float, varchar(30) -> varchar(50), chestii de genu)
--2.default
--3.cream si stergem tabel
--4.adaug camp nou
--5.cheie straine
--sunt 10 scripturi in total

--cream o tabela, de ex Versiune, poate sa contina Vid si orice, trb sa memoram versiunea bazei de date
--versiune = 0 initial, noi putem avea 1 2 3 4 sau 5.
--daca vrem versiunea 3, executam primele 3 proceduri
--daca suntem la versiunea 3 si vrem sa ajungem la versiunea 1, facem inversa la 3 si la 2
--main 4: 0<4 -> v1,v2,v3,v4
--main 2: 4>2 -> v44,v33, fac update si 2 devine noua versiunea

--DECLARE @n int - declaram o valoare
--SET @n = 12 - asignam o valoare

--trb sa concatenam proceduri ca sa facem exec 

--A% = sa inceapa cu A
--%A = sa se termine cu A
--%A% = sa contina oriunde A
--A_% = sa inceapa cu A si sa fie de cel putin 2 litere

create table Versiune(
idVersiune int default 0
)
drop table Versiune