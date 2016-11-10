drop database if exists otari;
create database otari;
use otari;

create table Usuario(tipo varchar(20), nombre varchar(20), edad int(2), direccion varchar(30), 
contra varchar(20), correo varchar(40), idUsuario int(6) auto_increment primary key);

create table Menu(idMe int(3) auto_increment primary key, entrada varchar(20), aperitivo varchar(20)
, principal varchar(20), postre varchar(20), bebidas varchar(20));

create table Musica(idMu int(3) auto_increment primary key, genero varchar(20), personal varchar(20));
 
create table Evento(idEvento int(4) auto_increment primary key, idUcreador int(6), fechaRegistro timestamp, 
fechaEvento datetime, lugar varchar(50), tipo varchar(20), invitados int(4), idMenu int(3),
idMusica int(3), foreign key (idMenu) references Menu(idMe), foreign key(idMusica) 
references Musica(idMu));

delimiter //
create procedure AgregarUsuario(
in tip varchar(20), nom varchar(20), año int(2), direc varchar(30), con varchar(20), cor varchar(40))
begin
insert into Usuario(tipo, nombre, edad, direccion, contra, correo) values (tip, nom, año, direc, con, cor);
end //
delimiter ;

delimiter //
create procedure AgregarEvento(lug varchar(50), tip varchar(20), inv int(4), menu int(3), musica int(3))
begin
insert into Evento(lugar, tipo, invitados, idMenu, idMusica) values (lug, tip, inv, menu, musica);
end //
delimiter ;

delimiter //
create procedure AgregarMusica(gen varchar(20), per varchar(20))
begin
insert into Musica(genero, personal) values (gen, per);
end //

delimiter ;

delimiter //
create procedure AgregarMenu(ent varchar(20), ape varchar(20), prin varchar(20), pos varchar(20), beb varchar(20))
begin
insert into Menu(entrada, aperitivo, principal, postre, bebidas) values (ent, ape, prin, pos, beb);
end //
delimiter ;

call AgregarUsuario('administrador','Edgar',17,'Av. 679 no. 65', 'wasa', 'edgar_a_villa@hotmail.com');
call AgregarUsuario('administrador','Diego',17,'no se','wase','no se');
call AgregarUsuario('administrador','Ximi',17,'no se','wasi','no se');
call AgregarUsuario('administrador','Raul',17,'no se','waso','no se');

call AgregarMusica('bachata', 'un wey');
call AgregarMusica('Rock', 'otro wey');
call AgregarMusica('Banda', 'ese wey');
call AgregarMusica('Electronica', 'ese otro wey');

call AgregarMenu('ensalada', 'canapes', 'pavo', 'pastel', 'vino');
call AgregarMenu('sopa', 'mini-sanwiches', 'res', 'fruta en almivar', 'Agua');
call AgregarMenu('fruta', 'rollitos de jamon', 'huevo', 'yougurt', 'jugo');

select * from Usuario;