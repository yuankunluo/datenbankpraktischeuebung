select * from orte;

select  kunde, sum(menge) as smenge
from umsaetze
group by kunde
having smenge > 3200
order by smenge desc;


select count(menge)
from umsaetze
where kunde = 1;

select rowid, * 
from kunden;

-- Aufgabe 1.1

select count(*)
from filialen
where ort =  32;
			
select id 
from orte
where name = 'Düsseldorf';

select count(*)
from filialen as f, orte as o
where f.ort = o.id and o.name = "Düsseldorf";

select strasse, hausnr
from filialen as f, orte as o
where f.ort = o.id and o.name = "Düsseldorf";

select name, min(preis)
from waren;
select name, max(preis)
from waren;

select name, preis
from waren 
where preis in (
			select max(preis)
			from waren
			union
			select min(preis)
			from waren
			);


select name, preis
from waren
where preis  between 10 and 20
order by preis asc; 

select name, preis
from waren
where preis in (
			select preis
			from waren
			where preis >= 10 and preis <=20);
			
select distinct um1.kunde, kunden.vorname, kunden.nachname
from umsaetze um1, umsaetze um2, waren w1, waren w2, kunden
where um1.ware = w1.id and
w1.name = "Zelt" and
um2.ware = w2.id and
w2.name = "Schlafsack" and
um1.kunde = um2.kunde and
um1.kunde = kunden.id;

-- Blatt 4 -------------------------------------

CREATE TABLE inaktive_kunden(
  id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  vorname character varying(255),
  nachname character varying(255),
  letzter_einkauf integer,
  foreign key (letzter_einkauf) references datum(id)
);

insert into kunden(vorname, nachname)
values ("Thomas", "Meier");

select *
from kunden
where vorname = "Thomas" and nachname = "Meier";

begin;

select kunde
from umsaetze as u, datum as d
where u.datum = d.id
		and d. 

select *
from datum
group by monat
order by mnum

select date("now")
select datetime("now")

SELECT strftime('%s','now');

alter table datum 
add mnum integer;

update datum 
set mnum = 2
where monat = "Februar";

select k.vorname , k.nachname, d.id
select * 
from umsaetze as u , datum as d, kunden as k
where u.datum = d.id
		and d.jahr <= 2004
		and d.mnum <= 3
		and d.tag <= 10
		and u.kunde = k.id
order by jahr, mnum, tag

select * 
from datum;


select date(cast(jahr as text) ||"-" || cast(mnum as text) ||"-"||  cast(tag as text))
from datum

alter table datum 
add mstr char(2);

update datum
set mstr = "12"
where mnum = 12

alter table datum
add datum date ;

alter table datum
add tstr char(2);



update datum
set tstr = cast(tag as text);

update datum
set tstr = "0" || tstr
where tag <10

update datum
set datum = date(cast(jahr as text) ||"-" || mstr||"-"||  tstr)

select *
from datum

select d.id, d.datum
from datum as d
where d.datum < "2004-03-10"
order by d.datum desc

savepoint aa;

insert into inaktive_kunden(vorname, nachname,letzter_einkauf )
select vorname, nachname, id
from (
select  k.vorname, k.nachname, max(d.datum), d.id
from kunden as k, umsaetze as u, datum as d
where u.kunde = k.id 
		and u.datum = d.id
		and d.datum < "2004-03-10"
group by (k.id)
order by d.datum desc
)

select *
from inaktive_kunden;

savepoint a2;

select *
from kunden;

alter table kunden
drop column letzter_einkauf;


create table kunden2(
id integer  not null primary key AUTOINCREMENT,
vorname char(255),
nachname char(255),
letzter_einkauf integer,
foreign key (letzter_einkauf) references inaktive_kunden(id)
)

insert into kunden2(vorname, nachname)
select  vorname, nachname from kunden;

select * from kunden2;

alter table kunden2 RENAME to kundenx;

drop table kunden;
alter table kundenx rename to kunden;


select * from kunden;

select *
from inaktive_kunden;

delete from kunden
where id > 255

update kunden
set letzter_einkauf = (select letzter_einkauf
						from inaktive_kunden as i
						where i.id = kunden.id)

select * from kunden;


-- =========================== Aufseminar 2

create table author(
	id integer not null primary key AUTOINCREMENT,
	name  char(255)
	);
	
create table conference (
	id integer not null primary key autoincrement,
	name char(255),
	ddate date )
	
create table h_g_index(
	id integer not null primary key autoincrement,
	author integer,
	h_index double,
	g_index double,
	foreign key (author) references author(id)
)

create table paper(
	id integer not null primary key autoincrement,
	title char(1000),
	conference integer,
	foreign key (conference) references conference(id)
)
	
create table co_write(
	id integer not null primary key autoincrement,
	author integer not null,
	paper integer not null,
	foreign key (author) references author(id) ,
	foreign key(paper) references paper(id))

create table country(
	id integer not null primary key autoincrement,
	name char(255) not null,
	code char(2))
	
alter table author
add fullname char(255);

select * from conference;
delete 
from conference 
where id = 1

alter table conference 
add fullname char(1000);

alter table conference
add url char(1000);

insert into conference (name,ddate,  fullname, url)
values ("sppra", "2010",
"7th IASTED International Conference on Signal Processing, Pattern Recognition and
Applications", 
"https://www.iasted.org/conferences/pastinfo-678.html")

update conference
set ddate = 2010
where name = "chi"

create table paper(
 id integer not null  primary key autoincrement,
 title char(1000) ,
 conference integer,
 zitation integer,
 foreign key (conference) references conference(id)
)

select * from author;

delete 
from write
where paper < 500;

drop author

-- New DB