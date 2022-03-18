-- 2) L’associazione “molti a molti” tra 2 tabelle come si traduce nel database?

/* 
L'associazione "molti a molti" presente nel modello concettuale si traduce a livello di database
realizzando una tabella intermedia tra le due tabelle coinvolte nella relazione 
che possieda come attributi le primary key delle due tabelle e gli attributi della relazione tra le due tabelle iniziali. 
La primary key della tabella intermedia sarà una primary key artificiale formata dalla coppia 
della primary key della tabella 1 e dalla primary key della tabella 2 
*/


create database NegozioDischi

create table Band(
IdBand int identity(1,1),
Nome varchar(30) not null,
NumeroComponenti int not null,

constraint PK_Band primary key (IdBand),
)

create table Brano(
IdBrano int identity(1,1),
Titolo varchar(70) not null,
Durata int not null,

constraint PK_Brano primary key (IdBrano),
)

create table Album(
IdAlbum int identity (1,1),
Titolo varchar(50) not null,
AnnoUscita int not null,
CasaDiscografica varchar(40) not null,
Genere varchar(40) not null,
SupportoDistribuzione varchar(30),
IdBand int not null,

-- Un album deve essere considerato unico sulla base del 
-- titolo, anno di uscita, casa discografica, genere e supporto
constraint UNQ_Album unique (Titolo, AnnoUscita, CasaDiscografica, Genere, SupportoDistribuzione),
-- Genere: può essere solo Classico, Jazz, Pop, Rock o Metal
constraint CHK_Genere check (Genere = 'Classico' or Genere = 'Jazz' or Genere = 'Pop' or Genere = 'Rock' or Genere = 'Metal'),
-- Supporto di distribuzione: può essere scelto tra CD, Vinile o Streaming
constraint CHK_Supporto check (SupportoDistribuzione = 'CD' or SupportoDistribuzione = 'Vinile' or SupportoDistribuzione = 'Streaming'),
constraint PK_Album primary key (IdAlbum),
constraint FK_BandAlbum foreign key (IdBand) references Band(IdBand),
)

create table AlbumBrano(
IdAlbum int not null,
IdBrano int not null,

constraint FK_Album foreign key (IdAlbum) references Album(IdAlbum),
constraint FK_Brano foreign key (IdBrano) references Brano(IdBrano),
constraint PK_ALBUMBRANO primary key (IdAlbum, IdBrano),
)

--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;

insert into Band values ('883',5),('Maneskin',4),('The Giornalisti',3),('Pooh',7),
						('Slipknot',4),('Il Volo',3),('Kiss',4),('Aerosmith',5)
select * from Band
insert into Album values ('Hanno ucciso l''Uomo Ragno', 1992,'Fri Records','Pop','CD',1),
						 ('Grazie Mille', 1999,'S4','Pop','CD',1),
						 ('Il Ballo della Vita', 2018,'Sony Music','Rock','Streaming',2),
						 ('Teatro d''Ira', 2021,'Sony Music','Rock','Streaming',2),
						 ('Love', 2018,'Carosello Records','Pop','CD',3),
						 ('Fuoricampo', 2014,'Foolica Records','Pop','CD',3)

select a.Titolo
from Band b join Album a on b.IdBand=a.IdBand 
where b.Nome='883'
order by a.Titolo asc 

--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;

insert into Album values ('Grande Amore', 2020,'Sony Music','Classico','CD',3),
						 ('Get a Grip', 2020,'Sony Music','Rock','Vinile',5)

select a.Titolo
from Album a 
where a.CasaDiscografica='Sony Music' and a.AnnoUscita=2020

--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti 
--ad album pubblicati prima del 2019;

insert into Brano values ('Niente da dire',190),('Torna a casa',154),('Morirò da re',172),
						 ('Marlena',182),('Zero Stare Sereno',208),('Controllo',193),('Imagine',184)
select * from Album 
select * from Brano
select * from AlbumBrano

insert into AlbumBrano values (3,1),(3,3),(3,2),
							  (4,4),(5,5),(5,6),(8,7)

select br.Titolo
from Band b join Album a on b.IdBand=a.IdBand
			join AlbumBrano ab on a.IdAlbum=ab.IdAlbum
			join Brano br on ab.IdBrano=br.IdBrano
where b.Nome='Maneskin' and a.AnnoUscita<2019

--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;

insert into AlbumBrano values (5,7)
insert into AlbumBrano values (7,7)

select * from AlbumBrano

select a.Titolo
from Album a join AlbumBrano ab on a.IdAlbum=ab.IdAlbum
			 join Brano b on ab.IdBrano=b.IdBrano
where b.Titolo='Imagine'

--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;

insert into Brano values ('Riccione',125)
insert into AlbumBrano values (5,13)

select b.Nome, count(b.Nome) 'Canzoni The Giornalisti'
from Band b join Album a on b.IdBand=a.IdBand
			join AlbumBrano ab on a.IdAlbum=ab.IdAlbum
			join Brano br on ab.IdBrano=br.IdBrano
group by b.Nome
having b.Nome='The Giornalisti'


--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani

select a.IdAlbum, a.Titolo, sum(b.Durata) 'Durata Album'
from Album a join AlbumBrano br on a.IdAlbum=br.IdAlbum
			 join Brano b on br.IdBrano=b.IdBrano
group by a.IdAlbum, a.Titolo

--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i 
--secondi quindi 180 s).

insert into Brano values ('Come mai',170),('La dura legge del gol',154),('Rotta per casa di Dio',172),
						 ('Gli anni',182),('Tieni il tempo',208)
insert into AlbumBrano values (1,8),(2,9),(2,10),(1,11),(2,12)

select distinct b.Nome, br.Titolo, br.Durata
from Band b join Album a on b.IdBand=a.IdBand
			join AlbumBrano ab on a.IdAlbum=ab.IdAlbum
			join Brano br on ab.IdBrano=br.IdBrano
where b.Nome='883' and br.Durata>180

--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.
insert into Band values ('Moschettierin',3), ('Modern',7)
insert into Band values ('Mi sento modern',2)

select b.Nome
from Band b
where b.Nome like 'M%' and b.Nome like '%n'


--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un
--Album:

--‘Very Old’ se il suo anno di uscita è precedente al 1980, 
--‘New Entry’ se l’anno di uscita è il 2021, 
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020, 
--‘Old’ altrimenti.

insert Album values ('Get Your Wings', 1974,'Columbia','Rock','Vinile',8)

select a.Titolo, 
case 
when a.AnnoUscita<1980 then 'Very old'
when a.AnnoUscita=2021 then 'New Entry'
when a.AnnoUscita between 2010 and 2020 then 'Recente'
else 'Old'
end as [Tipo di Album]
from Album a 

--10) Mostrare i brani non contenuti in nessun album.
insert into Brano values ('Sunflowers',187),('Waterloo',138),('Vacation',129)

select *
from Brano b 
where b.IdBrano not in (select ab.IdBrano from AlbumBrano ab)



