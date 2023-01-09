drop database dbB;
-- criando db
create database dbB;

-- colocando db em uso
use dbB;

-- criando tb
create table tbDep
(
	codDep int primary key auto_increment,
    nomeDep varchar(200) not null
);

create table tbFunc
(
	codFunc int primary key auto_increment,
    nomeFunc varchar(250) not null,
    CPF decimal(11,0) not null unique,
    codDep int not null,
    constraint fk_DepFunc foreign key(codDep) references tbDep(codDep)
);

-- preenchendo tbs
insert into tbDep(nomeDep) values ('TI'), ('Finanças'), ('Marketing');
insert into tbFunc(nomeFunc, CPF, codDep) values
('Juarez Tavora', 12344488809, 2),
('Lucas Mendes', 15611133801, 1),
('Jessé Lima', 22277851826, 3);

-- ciando vw
create view vwFunc
	as select tbFunc.codFunc, tbFunc.nomeFunc, tbFunc.CPF, tbDep.nomeDep
    from tbFunc inner join tbDep
		on tbFunc.codDep = tbDep.codDep;

select * from vwFunc;