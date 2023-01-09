drop database dbEscola;

-- criando database - base de dados
create database dbEscola;

-- colocando em uso
use dbEscola;

-- crinado tabela cliente
create table tbCliente(
	IdCli int primary key auto_increment,
    NomeCli varchar(150) not null,
    EmailCli varchar(150) not null
);

-- criando procedure para inserir os dados
delimiter $$
create procedure spInsertCli(vNomeCli varchar(150), vEmailCli varchar(150))
	begin
		insert into tbCliente values (default, vNomeCli, vEmailCli);
    end;
$$

-- chamando procedure
call spInsertCli('Carlos', 'cc@escola.com');
call spInsertCli('Davizinho', 'zinho@escola.com');
call spInsertCli('Lindinha', 'lindi@escola.com');

-- criando tabela de históico para a tabela cliente
create table tbHIstCli like tbCliente;

-- alterando informações da tabela histórico
alter table tbHistCli modify IdCli int not null;
alter table tbHistCli drop primary key;
alter table tbHistCli add Momento datetime;
alter table tbHistCli add Situacao varchar(20);
alter table tbHistCli add
	constraint pk_Id_HistCli primary key (IdCli, Momento, Situacao);

-- criando trigger para a tabela cliente, vinculada a tabela histórico
delimiter //
create trigger trgCliInsert after insert on tbCliente for each row
	begin
		insert into tbHIstCli set
			IdCli = new.IdCli,
            NomeCli = new.NomeCli,
            EmailCli = new.EmailCli,
            Momento = current_timestamp(),
            Situacao = 'Novo';
    end;
//

-- chamando procedure
call spInsertCli('Tontinho', 'tonti@escola.com');

-- selecionando tabelas
select * from tbCliente;
select * from tbHistCli;

-- criando trigger para a tabela cliente, vinculada a tabela histórico
delimiter //
create trigger trgCliUpdate after update on tbCliente for each row
	begin
		insert into tbHIstCli set
			IdCli = new.IdCli,
            NomeCli = new.NomeCli,
            EmailCli = new.EmailCli,
            Momento = current_timestamp(),
            Situacao = 'Atualização';
		insert into tbHIstCli set
			IdCli = old.IdCli,
            NomeCli = old.NomeCli,
            EmailCli = old.EmailCli,
            Momento = current_timestamp(),
            Situacao = 'Atualizado';
    end;
//

-- criando procedure para inserir os dados
delimiter $$
create procedure spUpdateCli(vIdCli int, vNomeCli varchar(150), vEmailCli varchar(150))
	begin
		if not exists (select NomeCli from tbCliente where NomeCli = vNomeCLi) then
			update tbCLiente set NomeCli = vNomeCLi where IdCLi = vIdCli;
		end if;
    end;
$$

-- chamando procedure
call spUpdateCli(4, 'Muito Tontinho', null);
call spUpdateCli(3, 'Lindinha de Morrer', null);

-- selecionando tabelas
select * from tbCliente;
select * from tbHistCli;