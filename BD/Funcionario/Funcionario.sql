drop database dbFuncionario;

-- criando db
create database dbFuncionario;

-- colocando db em uso
use dbFuncionario;

-- criando tb
create table tbFunc
(
	IdFunc int primary key auto_increment,
    NomeFunc varchar(250) not null,
	EmailFunc varchar(250) not null unique
);

-- inserindo dados na tb
insert into tbFunc(NomeFunc, EmailFunc) values
	('José Mario', 'jose@escola.com'),
    ('Antonio Pedro', 'ant@escola.com'),
    ('Monica Cascão', 'moc@escola.com');

-- selecioando tbFunc
select * from tbfunc;

-- criando tbHistorico
create table tbFuncHistorico like tbfunc;

-- selecionando tbHistorico
select * from tbfuncHistorico;

-- alterando tbFunc
alter table tbFuncHistorico modify IdFunc int not null;
alter table tbfuncHistorico drop primary key;
alter table tbFuncHistorico add Atualizacao datetime;
alter table tbFuncHistorico add Situacao varchar(20);
alter table tbfuncHistorico add
	constraint pk_Id_FuncHistorico primary key (IdFunc, Atualizacao, Situacao);
    
-- descrição da tbHistorico
describe tbfunchistorico;

-- criando trigger(gatilho)
delimiter //
	create trigger tgrHistoricoInsert after insert on tbfunc
		for each row
	begin
	 insert into tbfunchistorico
     set IdFunc = new.IdFunc,
		 NomeFunc = new.NomeFunc, 
         EmailFunc = new.EmailFunc,
         Atualizacao = current_timestamp(),
         Situacao = 'Novo';
	end;
//

insert into tbfunc(NomeFunc, EmailFunc) values ('Will Jr.', 'willjr@escola.com');

select * from tbfunchistorico;

delimiter //
	create trigger tgrHistoricoDelet before delete on tbfunc
		for each row
	begin
	 insert into tbfunchistorico
     set IdFunc = old.IdFunc,
		 NomeFunc = old.NomeFunc, 
         EmailFunc = old.EmailFunc,
         Atualizacao = current_timestamp(),
         Situacao = 'Excluido';
	end;
//

delete from tbFunc where IdFunc = 3;

select * from tbFunc;
select * from tbfunchistorico;

delimiter //
	create trigger tgrHistoricoUpdate after update on tbfunc
		for each row
	begin
    	 insert into tbfunchistorico
			set IdFunc = new.IdFunc,
				NomeFunc = new.NomeFunc, 
				EmailFunc = new.EmailFunc,
				Atualizacao = current_timestamp(),
				Situacao = 'Atrualização';
		insert into tbfunchistorico
			set IdFunc = old.IdFunc,
				NomeFunc = old.NomeFunc, 
				EmailFunc = old.EmailFunc,
				Atualizacao = current_timestamp(),
				Situacao = 'Atualizado';
	end;
//

update tbFunc set NomeFunc = 'Maria', EmailFunc = 'maria@teste.com' where IdFunc = 1;

select * from tbFunc;
select * from tbfunchistorico;