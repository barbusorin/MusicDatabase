create database proiectbd;
use proiectbd;

create table gen(
	id int not null auto_increment primary key,
    nume_gen varchar(30) not null
);

create table vinil(
	id int not null auto_increment primary key,
    nume varchar(50),
    pret float(6,2),
    trupa varchar(50),
    grammy enum('Da', 'Nu'),
    casa_productie varchar(50),
    data_l date,
    disponibilitate varchar(20),
    id_gen int,
    foreign key album_fk(id_gen)
    references gen(id)
);

create table clientul(
	id int not null auto_increment primary key,
    nume varchar(50),
    prenume varchar(50),
    email varchar(50),
    telefon char(10),
    client_premium enum('Da', 'Nu'),
    oras varchar(50),
    adresa varchar(50)
);


create table comanda(
	id int not null auto_increment primary key,
    data_comanda date,
    valoare int,
    id_client int,
    foreign key comanda_fk(id_client)
    references clientul(id)
);


create table factura(
	id_album int,
    id_comanda int
);

-- adaugam PK in tabela factura
alter table factura add primary key(id_album, id_comanda);

-- redenumim tabelul vinil -> album
alter table vinil rename album;


-- adaugam FK in factura -> album
alter table factura add foreign key fk_album(id_album)
references album(id);

-- adaugam FK in factura -> comanda
alter table factura add foreign key fk_comanda(id_comanda)
references comanda(id);

-- adaugam coloana rating in tabela album
alter table album add rating decimal(4, 2);

-- modificam tipul campului valoare din tabela comanda int -> float
alter table comanda change valoare valoare float(10, 2);

-- stergem coloana adresa din tabela clientul
alter table clientul drop adresa;

-- modificam numele coloanei data_l -> data_lansare din tabela album
alter table album change data_l data_lansare date;

-- modificam tipul campului disponibilitate din tabela album varchar -> enum
alter table album change disponibilitate disponibilitate enum('Da', 'Nu');

select * from album;

-- adaugam coloana durata in tabela album
alter table album add durata varchar(3);

-- modificam tipul campului data_lansare din tabela album date -> char
alter table album change data_lansare data_lansasre char(4);


-- inseram date in tabela gen
insert into gen values(null, 'Rock'),
					  (null, 'Blues'),
                      (null, 'Pop'),
                      (null, 'Jazz'),
                      (null, 'Country'),
                      (null, 'Electronic'),
                      (null, 'Dance'),
                      (null, 'Soul'),
                      (null, 'Reggae'),
                      (null, 'Funk'),
                      (null, 'Rap'),
                      (null, 'Folk'),
                      (null, 'Dubstep'),
                      (null, 'Trap');

select * from gen;

-- inseram date in tabela album
insert into album values(null, 'The Wall', 65, 'Pink Floyd', 'Da', 'Columbia', 1979, 'Da', 1, 5.0, 80);
select * from album;
insert into album values(null, 'Appetite for Destruction', 105, 'Guns N’ Roses', 'Nu', 'Geffen', 1987, 'Da', 1, 4.8, 53),
						(null, 'Load', 44, 'Metallica', 'Nu', 'Elektra', 1996, 'Da', 1, 4.6, 78),
                        (null, 'Supernatural', 35, 'Santana', 'Da', 'Arista', 1999, 'Da', 8, 4.7, 74),
                        (null, 'Bad', 65, 'Michael Jackson', 'Da', 'Epic', 1987, 'Da', 3, 4.9, 48),
                        (null, 'Rumours', 98, 'Fleetwood Mac', 'Da', 'Warner Bros', 1977, 'Nu', 3, 4.4, 39),
                        (null, '25', 65, 'Adele', 'Da', 'Columbia', 2011, 'Nu', 3, 4.0, 48),
                        (null, 'Texas Flood', 110, 'Stevie Ray Vaughan', 'Da', 'Warner Bros', 1983, 'Da', 2, 4.8, 38),
                        (null, 'Electric Ladyland', 150, 'The Jimi Hendrix Experience', 'Nu', 'Reprise Records', 1968, 'Nu', 2, 4.8, 73),
                        (null, 'Indianola Mississippi Seeds', 77, 'BB King', 'Nu', 'The Record Plant', 1970, 'Da', 2, 4.4, 39),
                        (null, 'Catch a fire', 78, 'Bob Marley', 'Nu', 'Island Records', 1973, 'Nu', 9, 4.3, 37),
                        (null, 'Dirty Mind', 40, 'Prince', 'Nu', 'Warner Bros', 1975, 'Da', 10, 4.6, 30),
                        (null, 'Heavy Weather', 86, 'Weather Report', 'Nu', 'Columbia Records', 1977, 'Nu', 4, 3.5, 37),
                        (null, 'Relapse', 65, 'Eminem', 'Nu', 'Shady Records', 2009, 'Da', 11, 3.8, 76),
                        (null, 'Random Access Memories', 74, 'Daft Punk', 'Da', 'Columbia Records', 2013, 'Da', 7, 3.9, 74),
                        (null, 'Music for the Jilted Generation', 62, 'The Prodigy', 'Nu', 'XL Recordings', 1994, 'Nu', 7, 3.5, 78),
                        (null, 'Five Leaves Left', 49, 'Nick Drake', 'Nu', 'Island', 1969, 'Nu', 12, 3.8, 41),
                        (null, 'American Recordings', 73, 'Johnny Cash', 'Nu', 'Def American', 1994, 'Da', 5, 4.6, 42),
                        (null, 'Stage Struck', 71, 'Rory Gallagher', 'Nu', 'Chrysalis', 1980, 'Nu', 2, 4.3, 51);

-- efectuam cateva update-uri
update album set trupa = 'The Wailers' where id = 11;
alter table album change data_lansasre an_lansare char(4);
update album set an_lansare = 1980 where id = 12;
update album set pret = 50 where id = 14;
update album set id_gen = 6 where id = 16;
update album set nume  = '21' where id = 7;
update album set casa_productie = 'Epic' where id = 8;

-- inseram date in tabela clientul
insert into clientul values(null, 'Neagu', 'Eugen', 'neugen@yahoo.com', 0736846792, 'Da', 'Bucuresti'),
						   (null, 'Pascal', 'Radu', 'pas.radu@gmail.com', 0745338956, 'Nu', 'Constanta'),
                           (null, 'Caplea', 'Alina', 'alinacaplea@yahoo.com', 0760321585, 'Da', 'Bucuresti'),
                           (null, 'Grigore', 'Mihai', 'gmihai@gmail.com', 0758963257, 'Nu', 'Constanta'),
                           (null, 'Danila', 'Marian', 'mariandanila@gmail.com', 0738647592, 'Nu', 'Bucuresti'),
                           (null, 'Oprescu', 'Andreea', 'oprandreea@yahoo.com', 0763579465, 'Da', 'Pitesti'),
                           (null, 'Danciu', 'Iris', 'irisdnc@gmail.com', 0725576489, 'Da', 'Brasov'),
                           (null, 'Stoian', 'Maria', 'marstoian@yahoo.com', 0765824775, 'Nu', 'Sibiu'),
                           (null, 'Calin', 'Raluca', 'ralucalin@yahoo.com', 0753496842, 'Da', 'Arad'),
                           (null, 'Grecutu', 'Corneliu', 'grecorneliu@yahoo.com', 0747736289, 'Nu', 'Brasov'),
                           (null, 'Antonescu', 'Paul', 'antonpaul@gmail.com', 0734936725, 'Nu', 'Bucuresti'),
                           (null, 'Scoican', 'Irina', 'irina997@gmail.com', 0728714657, 'Nu', 'Cluj'),
                           (null, 'Ionescu', 'Adriana', 'adionescu@gmail.com', 0765973437, 'Da', 'Bucuresti'),
                           (null, 'Cosma', 'Cristian', 'cristicosma@yahoo.com', 0763218596, 'Da', 'Craiova');

select * from clientul;

-- inseram date in tabela comanda
insert into comanda values(null, '2019-03-02', 105, 1),
						  (null, '2019-04-22', 74, 5),
                          (null, '2018-05-19', 175, 2),
                          (null, '2019-06-11', 143, 3),
                          (null, '2018-07-15', 40, 6),
                          (null, '2019-04-19', 150, 7),
                          (null, '2018-10-25', 163, 9),
                          (null, '2019-03-08', 100, 4),
                          (null, '2018-11-22', 62, 8),
                          (null, '2019-06-18', 35, 2),
                          (null, '2018-08-19', 108, 10),
                          (null, '2019-07-29', 144, 11);

select * from comanda;

-- inseram date in tabela factura

insert into factura values(2, 1),
						  (15, 2),
                          (10, 3),
                          (13, 4),
                          (12, 5),
                          (8, 6),
                          (11, 8),
                          (16, 9),
                          (4, 10);

select * from factura;

-- efectuam cateva delete-uri

delete from album where id = 17;
delete from album where id = 18;
delete from gen where id = 14;

select * from album;
select * from gen;


-- Subinterogari

# afisati numele albumelor care fac parte din acelasi gen cu albumul 'The Wall'

select nume from album
where id_gen = (select id_gen from album 
								where nume = 'The Wall');

-- afisati trupele care au acelasi rating cu 'Stevie Ray Vaughan'

select trupa from album 
where rating = (select rating from album 
								where trupa = 'Stevie Ray Vaughan'); 
                                
-- afisati numele si prenumele clientilor care sunt din acelasi oras cu Neagu Eugen

select nume, prenume from clientul
where oras = (select oras from clientul
							where nume = 'Neagu' and prenume = 'Eugen');
                            
                            
-- join-uri

-- sa se afiseze numele genului si casa de productie pt albumele care au rating > 4.5

select g.nume_gen, a.casa_productie
from gen g
	 join album a
      on a.id_gen = g.id
      where a.rating > 4.5;

-- sa se afiseze emailul si data comenzii pt clientii care au o comanda cu valoarea mai mare de 145 lei

select c.email, d.data_comanda
from clientul c
	join comanda d
    on d.id_client = c.id
    where d.valoare > 145;

-- sa se afiseze valoarea comenzii si numele pentru clientii premium

select d.valoare, c.nume 
from clientul c 
	left join comanda d
    on d.id_client = c.id
    where c.client_premium = 'Da';

-- functii de agregare / having

-- sa se afiseze ratingul maxim si id-ul genului pentru fiecare gen
-- doar daca exista minim 3 albume care sa fie incadrate in acel gen, ordonate dupa gen

select max(rating), id_gen 
from album
group by id_gen
having count(id_gen) >=3;

-- sa se afiseze ratingul minim si id-ul genului pentru fiecare gen
-- doar pt genurile care au media rating-ului > 4.3

select min(rating), id_gen
from album 
group by id_gen
having avg(rating) > 4.3;

-- sa se afiseze orasul si numarul clientilor daca intr-un oras sunt minim 2 clienti

select oras, count(id) 
from clientul
group by oras
having count(id) >= 2;

-- functii predefinite 

-- afisati suma preturilor tuturor albumelor blues 
select sum(pret) from album
where id_gen = 2;

-- afisati id-ul comenzilor cu o valoare mai mare de 150 de lei
select id from comanda
where valoare > 150;

-- afisati numele si emailul  al clientilor care au gmail

select nume, email
from clientul
where email like '%gmail%'; 

-- view-uri
-- creati un view care sa afiseze numele albumelor, daca au luat grammy si numele genului doar pentru albumele disponibile
create view v$grammy as
select a.nume, a.grammy, g.nume_gen
from album a
	join gen g
    on a.id_gen = g.id
	where a.disponibilitate = 'Da';

select * from v$grammy;


-- sa se creeze un view care afiseaza emailul, numele si valoarea clientilor care nu au cont premium
create view v$premium as
select c.email, c.nume, d.valoare
from clientul c
	join comanda d
    on d.id_client = c.id
    where c.client_premium = 'Nu';

select * from v$premium;

-- Proceduri

-- sa se creeze o procedura care afiseaza numele genurilor, numele albumelor si trupelor care au aparut dupa un an introdus ca parametru(inclusiv albumele din anul introdus)

drop procedure an_album;

delimiter //
create procedure an_album(in p_an int)
begin
	select a.nume, a.trupa, g.nume_gen
    from album a
		join gen g
        on a.id_gen = g.id
        where a.an_lansare >= p_an;
end;
//
delimiter ;

call an_album(1990);
select * from album;

-- sa se creeze o procedura care afiseaza numele clientilor in cazul in care acestia au o comanda cu o valoare mai mica decat valoarea introdusa ca parametru
drop procedure nume_pret;

delimiter //
create procedure nume_pret(in p_valoare float(6, 2))
begin
	select c.nume 
		from clientul c
        join comanda d
        on c.id = d.id_client
        where d.valoare < p_valoare;
end;
//
delimiter ;

call nume_pret(88);
select * from clientul;


-- sa se creeze o procedura care afiseaza numele, pretul, disponibilitatea, grammy, numele genului si ratingul albumelor care au rating mai mare decat paramatrul introdus de la tastatura

drop procedure proc_rating;

delimiter //
create procedure proc_rating(in p_rating float(4, 2))
begin
	select a.nume, a.pret, a.disponibilitate, a.grammy, g.nume_gen, a.rating
		from album a
        join gen g
        on a.id_gen = g.id
		where a.rating > p_rating;
end;
//
delimiter ;

call proc_rating(4.5);

-- Functii 

-- sa se creeze o functie care primeste ca parametru id-ul unui album si returneaza numele casei de productie al acestuia si numele genului din care face parte

drop function fun_id;

delimiter //
create function fun_id(p_id int)
returns varchar(255)
begin
	declare v_nume varchar(50);
    declare v_casa_productie varchar(50);
    declare v_nume_gen varchar(50);
	select a.nume, a.casa_productie, g.nume_gen
		into v_nume, v_casa_productie, v_nume_gen
    from album a
		join gen g
        on a.id_gen = g.id
        where p_id = a.id;
	return concat_ws('/', v_nume, v_casa_productie, v_nume_gen);
end;
//
delimiter ;

select fun_id(1);


-- sa se creeze o functie care primeste un id-ul unui album si returneaza numele, casa de productie, grammy, si disponibilitate
drop function fun_suma;

delimiter //
create function fun_suma(p_id int)
returns varchar(100)
begin
	declare v_nume varchar(50);
    declare v_casa_productie varchar(50);
    declare v_grammy varchar(2);
    declare v_disponibilitate varchar(2);
	select nume, casa_productie, grammy, disponibilitate
		into v_nume, v_casa_productie, v_grammy, v_disponibilitate
    from album
		where p_id = id;
	return concat('Nume: ', v_nume, '/ ', 'Casa productie: ', v_casa_productie, '/ ', 'Grammy: ', v_grammy, '/ ', 'Disponibilitate: ', v_disponibilitate);
end;
//
delimiter ;

select fun_suma(2);


-- sa se creeze o functie care primeste ca parametru id-ul unui album si returneaza un emsaj in fuctie de grammy si de disponibilitate

drop function fun_grm;

delimiter //
create function fun_grm(p_id int)
returns varchar(255)
begin
	declare v_grammy enum('Da', 'Nu');
    declare v_disponibilitate enum ('Da', 'Nu');
	declare v_mesaj varchar(100);
	select grammy, disponibilitate 
		into v_grammy, v_disponibilitate
		from album a
		where a.id = p_id;
	if v_grammy = 'Da' and v_disponibilitate = 'Da' 
						then set v_mesaj = 'Albumul a luat premiu Grammy si este disponibil.';
							else if v_grammy = 'Da' and v_disponibilitate = 'Nu' 
								then set v_mesaj = 'Albumul a luat premiu Grammy, dar nu este disponibil.';
									else if v_grammy = 'Nu' and v_disponibilitate = 'Da'
										then set v_mesaj = 'Albumul nu a luat premiu Grammy, dar este disponibil.';
											else set v_mesaj = 'Albumul nu a luat premiu Grammy si nu este nici disponibil.';
						end if;
                        end if;
                        end if;
	return v_mesaj;
end;
//
delimiter ;

select fun_grm(3);
select *from album;



-- Cursori

-- Sa se creeze o procedura acre primeste ca parametru un gen si care returneaza toate albumele care fac parte din genul respectiv.
drop procedure detalii_gen;

delimiter //
create procedure detalii_gen(IN p_gen varchar(50))
begin
	declare v_nume varchar(50);
    declare v_nume_gen varchar(50);
    declare semafor varchar(50) default 'verde';
    declare cursor1 cursor for select a.nume, g.nume_gen
								from album a
                                 join gen g
                                on a.id_gen = g.id
                                where p_gen = g.nume_gen;
    declare continue handler for not found
    begin
		set semafor = 'rosu';
    end;
    open cursor1;
    bucla: loop
        fetch cursor1
			into v_nume, v_nume_gen;
        if (semafor = 'rosu') then
			leave bucla;
        end if;
        select v_nume, v_nume_gen;
    end loop bucla;
    close cursor1;
	
end
//
delimiter ;

call detalii_gen('Dubstep');
select * from album;




-- sa se creeze o functie care primeste un nume de gen ca parametru si reurneaza media preturilor albumelor care apartin genului introdus

 drop function medie_pret;

delimiter //
create function medie_pret( p_nume_gen varchar(50))
returns float(6, 2)
begin
	declare v_pret float(6, 2);
    declare v_nr int;
    declare v_suma float(6, 2);
    declare v_nume_gen varchar(50);
    declare semafor varchar(50) default 'verde';
    declare c1 cursor for select a.pret, g.nume_gen
								from album a
                                 join gen g
                                on a.id_gen = g.id
                                where p_nume_gen = g.nume_gen;
    declare continue handler for not found
    begin
		set semafor = 'rosu';
    end;
    set v_suma = 0;
    set v_nr = 0;
    open c1;
    bucla: loop
        fetch c1
			into v_pret, v_nume_gen;
        if (semafor = 'rosu') then
			leave bucla;
        end if;
        set v_suma = v_suma + v_pret;
        set v_nr = v_nr + 1;
    end loop bucla;
    close c1;
	return v_suma / v_nr;
end
//
delimiter ;

select medie_pret('Blues');
select * from album;


-- sa se creeze o procedura care primeste ca parametru un oras si returneaza nume, email si data comenzii clientilor din orasul introdus

drop procedure proc_client;

delimiter //
create procedure proc_client(IN p_oras varchar(50))
begin
	declare v_data_comanda date;
	declare v_nume varchar(50);
    declare v_email varchar(50);
    declare semafor varchar(50) default 'verde';
    declare c2 cursor for select c.nume, c.email, d.data_comanda
								from clientul c
                                 left join comanda d
                                on d.id_client = c.id
                                where p_oras = c.oras;
    declare continue handler for not found
    begin
		set semafor = 'rosu';
    end;
    open c2;
    bucla: loop
        fetch c2
			into v_nume, v_email, v_data_comanda;
        if (semafor = 'rosu') then
			leave bucla;
        end if;
		if v_data_comanda is null then set v_data_comanda = '0000-00-00';
        end if;
        select concat('Numele clientului: ', v_nume, ' /', ' Email: ', v_email, ' /', ' Data comenzii: ', v_data_comanda);
    end loop bucla;
    close c2;
	
end
//
delimiter ;


call proc_client('Bucuresti');
select * from clientul;


-- Triggeri

-- sa se creeze un trigger pt insert care sa salveze intr-un tabel numele, id-ul si emailul persoanei introduse

create table tabel_evidenta(
	id int primary key auto_increment,
    text_inregistrare varchar(300),
    data_inregistrare date
);

drop trigger t_insert;

delimiter //
create trigger t_insert after insert on clientul
for each row
begin
	declare v_final varchar(200);
    set v_final = concat('S-a inserat clientul ' , new.nume, ' cu id-ul ', new.id , ' si emailul: ', new.email);
	insert into tabel_evidenta
		values(null, v_final, current_date());
end;
//
delimiter ;

insert into clientul values(null, 'Rindasu', 'Viorel', 'rvio@gmail.com', '0735419653', 'Da', 'Slatina');
delete from clientul where nume = 'Rindasu';
select * from tabel_evidenta;
truncate tabel_evidenta;
insert into clientul values(null, 'Rindasu', 'Viorel', 'rvio@gmail.com', '0735419653', 'Da', 'Slatina');

-- sa se creeze un trigger pt update care sa salveze intr-un tabel modificarile facute

delimiter //
create trigger t_update after update on clientul
for each row
begin
	declare v_sir_inserat varchar(200);
    declare v_linia_veche varchar(200);
    declare v_linia_noua varchar(200);
    set v_linia_veche = concat_ws('-', old.id, old.nume, old.prenume, old.email, old.telefon, old.client_premium, old.oras);
    set v_linia_noua = concat_ws( '-', new.id, new.nume, new.prenume, new.email, new.telefon, new.client_premium, new.oras);
    set v_sir_inserat = concat('Linia ', v_linia_veche, ' a devenit ', v_linia_noua);
    insert into tabel_evidenta
		values (null, v_sir_inserat, current_date());
    
end;
//
delimiter ;
select * from clientul;
update clientul set oras = 'Bacau' where id = 16;
select * from tabel_evidenta;

-- sa se creeze un trigger pt delete care sa salveze intr-un tabel numele, id-ul si emailul persoanei sterse

drop trigger t_delete;

delimiter //
create trigger t_delete after delete on clientul 
for each row
begin
	declare v_final varchar(250);
    set v_final = concat('Clientul cu numele ', old.nume, ', id-ul ', old.id, ' si emailul ', old.email, ' a fost sters.');
    insert into tabel_evidenta 
		values(null, v_final, curdate());
end;
//
delimiter ;

delete from clientul where id = 16;
select * from tabel_evidenta;







