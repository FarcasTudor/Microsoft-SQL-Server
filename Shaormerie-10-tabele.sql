use Shaormerie
go

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

create table ShaormaMagazin
(ShaormaId int foreign key references Shaorma(ShaormaId),
mid int foreign key references Magazin(mid),
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