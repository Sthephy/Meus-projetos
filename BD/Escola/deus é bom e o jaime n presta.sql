drop database dbescola;

create database dbescola;
use dbescola;

create table tbcliente(
idcli int primary key auto_increment,
nomecli varchar(150) not null,
emailcli varchar(150) not null
);

insert into tbcliente (nomecli,emailcli)
values('carlos','cc@escola.com'),
	  ('davizinho','zinho@escola.com'),
      ('lindinha','lindi@escola.com');
      

select * from tbcliente;