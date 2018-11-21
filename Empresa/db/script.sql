drop database  if exists Empresa; 

create database Empresa;

use Empresa;


create table tipoUsuario(
id_tipo int(11) primary key,
nomTipo varchar(45),
Config boolean,
AddMesa boolean,
ConfigPre boolean,
ModifPro boolean
);
create table Usuarios(
idUser int primary key  auto_increment,
Usuario varchar(45) ,
pwdUser varchar(45),
Correo varchar(45),
nomUser varchar(45),
apeUser varchar(60),
last_Sesion varchar(30),
time_SignIn varchar(30),
id_tipo int(11) ,
foreign key (id_tipo) references tipoUsuario(id_tipo)
);
create table NumMesa(
idMesa int(11) primary key auto_increment,
numMesa int(11),
numSillas int(11) default 4
);
create table TipoMesa(
idTipo int(11) primary key auto_increment,
nomTipo varchar(40),
numMesa int(11),
foreign key(numMesa) references NumMesa(idMesa)
);
create table TipoProductos(
idTipo_Pro int(11) primary key,
nomTip_pro varchar(45)
);
create table Productos(
idTipo_Pro int(11),
CodPro varchar(45) primary key ,
nomPro varchar(45),
stock int(11),
precio double,
foreign key(idTipo_Pro) references TipoProductos(idTipo_Pro)
);
create table menu(
idMenu int(11) primary key,
nomMenu varchar(45),
foreign key (idMenu) references TipoProductos(idTipo_Pro)
);
create table Bebidas(
idBebida int(11) primary key,
nomBebida varchar(45),
foreign key (idBebida) references TipoProductos(idTipo_Pro)
);
create table Extras(
idExtras int(11) primary key,
nomExtras varchar(45),
foreign key (idExtras) references TipoProductos(idTipo_Pro)
);
create table Clientes(
idCliente int(11) primary key auto_increment,
CodCli varchar(45),
dniCli int(8) ,
nomCli varchar(45),
apeCli varchar(65),
telefono int(9),
numMesa int(11) ,
foreign key (numMesa) references NumMesa(idMesa)
);
create table Platillos(
idVentaMenu int(11) primary key auto_increment,
numVenta varchar(45),
nomExtras varchar(45),
cant int(11) default 1,
idCli int(11),
tipo varchar(45),
foreign key (tipo) references Productos(CodPRo),
foreign key (idCli) references Clientes(idCliente)
);

drop table TipoMesa;
drop table nummesa;
drop table Productos;
drop table Clientes;
drop table Platillos;

select*from tipoUsuario;
select*from Usuarios;
select*from NumMesa;
select*from TipoMesa;
select*from TipoProductos;
select*from Productos;
select*from Clientes;
select*from tiposMenu;


select*from Ventas.Platillos;
#select*from tb_Usuario where Usuario = ? and pwdUser= ?
#drop database tb_Usuario

#por defecto
insert into tipoUsuario values(0,'Usuario',false,false,false,false);
insert into tipoUsuario values(2,'Administrador',false,false,false,false);

insert into TipoProductos values(0,'Menú');
insert into TipoProductos values(1,'Bebidas');
insert into TipoProductos values(2,'Extras');

insert into TipoMesa(nomTipo) values('libre');
insert into TipoMesa(nomTipo) values('Disponible');
insert into TipoMesa(nomTipo) values('Completo');


#por defecto
select numMesa from Ventas.NumMesa;

insert into clientes values(default,'cli0001',12345678,'yo noses','yoqese ds',123456789,1);






#insert into tb_Usuario (usuario,pwdUser) values('admin','admin')



DELIMITER $$
CREATE PROCEDURE Sign_in(usr varchar(45), pws char(45))
BEGIN
select * from Usuario
 where usuario = usr and pwdUser = pws;
END $$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE NUMERO_MESA(NUM INT(11))
BEGIN
	select*from NumMesa WHERE nummesa=NUM;
END $$
DELIMITER ;

CALL NUMERO_MESA (25);

