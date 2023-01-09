drop database dbDistribuidora;

-- criando db e pondo em uso
create database dbDistribuidora;
use dbDistribuidora;

-- criando tabelas
create table tbUF (
 IdUF int auto_increment primary key,
 UF char(2) unique
);

create table tbBairro (
 IdBairro int auto_increment primary key,
 Bairro varchar(200)
);

create table tbCidade (
 IdCidade int auto_increment primary key,
 Cidade varchar(200)
);

create table tbEndereco (
 CEP decimal(8,0) primary key,
 Logradouro varchar(200),
 IdBairro int,
 foreign key (IdBairro) references tbBairro(IdBairro),
 IdCidade int,
 foreign key (IdCidade) references tbCidade(IdCidade),
 IdUF int,
 foreign key (IdUF) references tbUF(IdUF)
);

create table tbCliente (
 Id int primary key auto_increment,
 Nome varchar(50) not null,
 CEP decimal(8,0) not null,
 NumEnd decimal(6,0) not null,
 CompEnd varchar(50),
 foreign key (CEP) references tbEndereco(CEP)
);

create table tbClientePF (
 IdCliente int auto_increment,
 foreign key (IdCliente) references tbCliente(Id),
 Cpf decimal(11,0) not null primary key,
 Rg decimal(8,0),
 RgDig char(1),
 Nasc date
);

create table tbClientePJ (
 IdCliente int auto_increment,
 foreign key (IdCliente) references tbCliente(Id),
 Cnpj decimal(14,0) not null primary key,
 Ie decimal(11,0)
);

create table tbNotaFiscal (
 NF int primary key,
 TotalNota decimal(7, 2) not null,
 DataEmissao date not null
);

create table tbFornecedor (
 Codigo int primary key auto_increment,
 Cnpj decimal(14,0) unique not null,
 Nome varchar(200) not null,
 Telefone decimal(11,0)
);

create table tbCompra (
 NotaFiscal int primary key,
 DataCompra date not null,
 ValorTotal decimal(8, 2) not null,
 QtdTotal int not null,
 Cod_Fornecedor int,
 foreign key (Cod_Fornecedor) references tbFornecedor(Codigo)
);

create table tbProduto (
 CodBarras decimal(14,0) primary key,
 Qtd int,
 Nome varchar(200) not null,
 ValorUnitario decimal(6, 2) not null
);

create table tbItemCompra (
 Qtd int not null,
 ValorItem decimal(6, 2) not null,
 NotaFiscal int,
 CodBarras decimal(14,0),
 primary key (Notafiscal, CodBarras),
 foreign key (NotaFiscal) references tbCompra(NotaFiscal),
 foreign key (CodBarras) references tbProduto(CodBarras)
);

create table tbVenda (
 IdCliente int not null,
 foreign key (IdCliente) references tbCliente(Id),
 NumeroVenda int primary key auto_increment,
 DataVenda datetime not null default(current_timestamp()),
 TotalVenda decimal(7, 2) not null,
 NotaFiscal int,
 foreign key (NotaFiscal) references tbNotaFiscal(NF)
);

create table tbItemVenda (
 NumeroVenda int,
 CodBarras decimal(14,0),
 foreign key (NumeroVenda) references tbVenda(NumeroVenda),
 foreign key (CodBarras) references tbProduto(CodBarras),
 Qtd int not null,
 ValorItem decimal(6, 2) not null
);

-- criando procidures (atalhos) e inserindo informações
-- Exercício I
delimiter $$
create procedure spInsertForn(vNome varchar(200), vCNPJ decimal(14,0), vTelefone decimal(11,0))
begin
	if not exists (select CNPJ from tbFornecedor where CNPJ = vCNPJ) then
		insert into tbFornecedor(Nome, CNPJ, Telefone) values (vNome, vCNPJ, vTelefone);
	else
		select 'Já Existe';
	end if;
end $$

call spInsertForn('Revenda Chico Loco', 1245678937123, 11934567897);
call spInsertForn('José Faz Tudo S/A', 1345678937123, 11934567898);
call spInsertForn('Vadalto Entregas', 1445678937123, 11934567899);
call spInsertForn('Astrogildo das Estrela', 1545678937123, 11934567800);
call spInsertForn('Amoroso e Doce', 1645678937123, 11934567801);
call spInsertForn('Marcelo Dedal', 1745678937123, 11934567802);
call spInsertForn('Franciscano Cachaça', 1845678937123, 11934567803);
call spInsertForn('Joãozinho Chupeta', 1945678937123, 11934567804);

-- Exercício II
delimiter $$
create procedure spInsertCidade(vCidade varchar(200))
begin
if not exists (select IdCidade from tbCidade where Cidade = vCidade) then
	insert into tbCidade(Cidade) values (vCidade);
end if;
end $$

call spInsertCidade('Rio de Janeiro');
call spInsertCidade('São Carlos');
call spInsertCidade('Campinas');
call spInsertCidade('Franco da Rocha');
call spInsertCidade('Osasco');
call spInsertCidade('Pirituba');
call spInsertCidade('Lapa');
call spInsertCidade('Ponta Grossa');

-- Exercício III
delimiter $$
create procedure spInsertUF(vUF char(2))
begin
if not exists (select IdUf from tbUF where UF = vUF) then
	insert into tbUF(UF) values (vUF);
end if;
end $$

call spInsertUF('SP');
call spInsertUF('RJ');
call spInsertUF('RS');

-- Exercício IV
delimiter $$
create procedure spInsertBairro(vBairro varchar(200))
begin
if not exists (select IdBairro from tbBairro where Bairro = vBairro) then
	insert into tbBairro(Bairro) values (vBairro);
end if;
end $$

call spInsertBairro('Aclimação');
call spInsertBairro('Capão Redondo');
call spInsertBairro('Pirituba');
call spInsertBairro('Liberdade');

delimiter $$
create procedure spInsertProduto(vCodBarras decimal(14,0), vNome varchar(200), vValorUnitario decimal(6, 2), vQtd int)
begin
	if not exists (select CodBarras from tbProduto where CodBarras = vCodBarras) then
		insert into tbProduto(CodBarras, Nome, ValorUnitario, Qtd) values (vCodBarras, vNome, vValorUnitario, vQtd); 
	else
		select 'Já Existe';
    end if;
end $$

call spInsertProduto('12345678910111', 'Rei de Papel Mache', '54.61', '120');
call spInsertProduto('12345678910112', 'Bolinha de Sabão', '100.45', '120');
call spInsertProduto('12345678910113', 'Carro Bate Bate', '44.00', '120');
call spInsertProduto('12345678910114', 'Bola Furada', '10.00', '120');
call spInsertProduto('12345678910115', 'Maçã Laranja', '99.44', '120');
call spInsertProduto('12345678910116', 'Boneco do Hitler', '124.00', '200');
call spInsertProduto('12345678910117', 'Farinha de Suruí', '50.00', '200');
call spInsertProduto('12345678910118', 'Zelador de Cemitério', '24.50', '100');

delimiter $$
create procedure spInsertEndereco(vCEP decimal(8,0), vLogradouro varchar(200), vBairro varchar(200), vCidade varchar(200), vUF char(2))
begin
if not exists (select CEP from tbEndereco where CEP = vCEP) then
	if not exists (select IdBairro from tbBairro where Bairro = vBairro) then
		insert into tbBairro(Bairro) values (vBairro);
	end if;

	if not exists (select IdUf from tbUF where UF = vUF) then
		insert into tbUF(UF) values (vUF);
	end if;

	if not exists (select IdCidade from tbCidade where Cidade = vCidade) then
		insert into tbCidade(Cidade) values (vCidade);
	end if;

	set @IdBairro = (select IdBairro from tbBairro where Bairro = vBairro);
	set @IdUf = (select IdUF from tbUF where UF = vUf);
	set @IdCidade = (select IdCidade from tbCidade where Cidade = vCidade);

	insert into tbEndereco(CEP, Logradouro, IdBairro, IdCidade, IdUF) values
	(vCEP, vLogradouro, @IdBairro, @IdCidade, @IdUF); 
end if;
end $$

call spInsertEndereco(12345050, 'Rua da Federal', 'Lapa', 'São Paulo', 'SP');
call spInsertEndereco(12345051, 'Av Brasil', 'Lapa', 'Campinas', 'SP');
call spInsertEndereco(12345052, 'Rua Liberdade', 'Consolação', 'São Paulo', 'SP');
call spInsertEndereco(12345053, 'Av Paulista', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertEndereco(12345054, 'Rua Ximbú', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertEndereco(12345055, 'Rua Piu XI', 'Penha', 'Campina', 'SP');
call spInsertEndereco(12345056, 'Rua Chocolate', 'Aclimação', 'Barra Mansa', 'RJ');
call spInsertEndereco(12345057, 'Rua Pão na Chapa', 'Barra Funda', 'Ponto Grossa', 'RS');

delimiter $$
create procedure spInsertCliente (vNome varchar(50), vNumEnd decimal(6,0), vCompEnd varchar(50), vCEP decimal(8,0), vCPF decimal(11,0), vRG decimal(8,0), vRgDig char(1), vNasc date,
vLogradouro varchar(200), vBairro varchar(200), vCidade varchar(200), vUF char(2))
begin
   	if not exists (select CPF from tbClientePF where CPF = vCPF) then
		if not exists (select CEP from tbEndereco where CEP = vCEP) then
			if not exists (select IdBairro from tbBairro where Bairro = vBairro) then
				insert into tbBairro(Bairro) values (vBairro);
			end if;

			if not exists (select IdUf from tbUF where UF = vUF) then
				insert into tbUF(UF) values (vUF);
			end if;

			if not exists (select IdCidade from tbCidade where Cidade = vCidade) then
				insert into tbCidade(Cidade) values (vCidade);
			end if;

			set @IdBairro = (select IdBairro from tbBairro where Bairro = vBairro);
			set @IdUf = (select IdUF from tbUF where UF = vUf);
			set @IdCidade = (select IdCidade from tbCidade where Cidade = vCidade);

			insert into tbEndereco(CEP, Logradouro, IdBairro, IdCidade, IdUF) values
			(vCEP, vLogradouro, @IdBairro, @IdCidade, @IdUF); 
		end if;
    
		insert into tbCliente(Nome, CEP, NumEnd, CompEnd) values (vNome, vCEP, vNumEnd, vCompEnd);
		insert into tbClientePF(CPF, RG, RgDig, Nasc) values (vCPF, vRG, vRgDig, vNasc);
	else
		select "Existe";
	end if;
end $$

call spInsertCliente('Pimpão', 325, null, 12345051, 12345678911, 12345678, 0, '2000-12-10', 'Av. Brasil', 'Lapa', 'Campinas', 'SP');
call spInsertCliente('Disney Chaplin', 89, 'Ap. 12', 12345053, 12345678912, 12345679, 0, '2001-11-21', 'Av. Paulista', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertCliente('Marciano', 744, null, 12345054, 12345678913, 12345680, 0, '2001-06-01', 'Rua Ximbú', 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertCliente('Lança Perfume', 128, null, 12345059, 12345678914, 12345681, 'X', '2004-04-05', 'Rua Veia', 'Jardim Santa Isabel', 'Cuiabá', 'MT');
call spInsertCliente('Remédio Amargo', 2485, null, 12345058, 12345678915, 12345682, 0, '2002-07-15', 'Av. Nova', 'Jardim Santa Isabel', 'Cuiabá', 'MT');

delimiter $$
create procedure spInsertCliPJ (vNome varchar(50), vCNPJ decimal(14,0), vIE decimal(11,0), vCEP decimal(8,0), vLogradouro varchar(200), vNumEnd decimal(6,0), vCompEnd varchar(50),
vBairro varchar(200), vCidade varchar(200), vUF char(2))

begin
    if not exists (select Cnpj from tbClientePJ where Cnpj = vCNPJ) then
		if not exists (select CEP from tbEndereco where CEP = vCEP) then
			if not exists (select IdBairro from tbBairro where Bairro = vBairro) then
				insert into tbBairro(Bairro) values (vBairro);
			end if;

			if not exists (select IdUf from tbUF where UF = vUF) then
				insert into tbUF(UF) values (vUF);
			end if;

			if not exists (select IdCidade from tbCidade where Cidade = vCidade) then
				insert into tbCidade(Cidade) values (vCidade);
			end if;

			set @IdBairro = (select IdBairro from tbBairro where Bairro = vBairro);
			set @IdUf = (select IdUF from tbUF where UF = vUf);
			set @IdCidade = (select IdCidade from tbCidade where Cidade = vCidade);

			insert into tbEndereco(CEP, Logradouro, IdBairro, IdCidade, IdUF) values
			(vCEP, vLogradouro, @IdBairro, @IdCidade, @IdUF); 
		end if;
        
			insert into tbCliente(Nome, CEP, NumEnd, CompEnd) value(vNome, vCEP, vNumEnd, vCompEnd);
			insert into tbClientePJ(Cnpj, Ie) value (vCNPJ, vIE);
	else
		select "Existe";
	end if;
end $$

call spInsertCliPJ('Paganada', 12345678912345, 98765432198, 12345051, 'Av. Brasil', 159, null, 'Lapa', 'Campinas', 'SP');
call spInsertCliPJ('Caloteando', 12345678912346, 98765432199, 12345053, 'Av. Paulista', 69, null, 'Penha', 'Rio de Janeiro', 'RJ');
call spInsertCliPJ('Semgrana', 12345678912347, 98765432100, 12345060, 'Rua dos Amores', 189, null, 'Sei Lá', 'Recife', 'PE');
call spInsertCliPJ('Cemreais', 12345678912348, 98765432101, 12345060, 'Rua dos Amores', 5024, 'Sala 23', 'Sei Lá', 'Recife', 'PE');
call spInsertCliPJ('Durango', 12345678912349, 98765432102, 12345060, 'Rua dos Amores', 1254, null, 'Sei Lá', 'Recife', 'PE');

delimiter $$
create procedure spInsertCompra(vNotaFiscal int, vFornecedor varchar(200), vDataCompra date, vCodBarras decimal(14,0), vValorItem decimal(6,2),
vQtd int, vQtdTotal int, vValorTotal decimal(8,2))
begin
	if not exists (select NotaFiscal from tbCompra where NotaFiscal = vNotaFiscal) then
		insert into tbCompra(NotaFiscal, DataCompra, ValorTotal, QtdTotal, Cod_Fornecedor) values (vNotaFiscal, vDataCompra, vValorTotal, vQtdTotal,
        (select codigo from tbFornecedor where Nome = vFornecedor));
	end if;
        insert into tbItemCompra(Qtd, ValorItem, NotaFiscal, CodBarras) values (vQtd, vValorItem, vNotaFiscal, vCodBarras);
end $$

call spInsertCompra(8459, 'Amoroso e Doce', '2018-05-01', 12345678910111, 22.22, 200, 700, 21944.00);
call spInsertCompra(2482, 'Revenda Chico Loco', '2020-04-22', 12345678910112, 40.50, 180, 180, 7290.00);
call spInsertCompra(21563, 'Marcelo Dedal', '2020-07-12', 12345678910113, 3.00, 300, 300, 900.00);
call spInsertCompra(8459, 'Amoroso e Doce', '2020-12-04', 12345678910114, 35.00, 500, 700, 21944.00);
call spInsertCompra(156354, 'Revenda Chico Loco', '2021-11-23', 12345678910115, 54.00, 350, 350, 18900.00);

delimiter $$
create procedure spInsertVenda(vCliente varchar(200), vCodBarras decimal(14,0), vQtd int, vNF int)
begin
	declare vValorItem decimal(6,2);
    declare vTotalVenda int;
    
    set @IdCli = (select Id from tbCliente where Nome = vCliente);
    set @DataVenda = current_timestamp();
    set @CodBarras = (select CodBarras from tbProduto where CodBarras = vCodBarras);
	set vValorItem = (select ValorUnitario from tbProduto where CodBarras = vCodBarras);
	set vTotalVenda = vValorItem * vQtd;

	insert into tbVenda(IdCliente, DataVenda, TotalVenda, NotaFiscal) values (@IdCli, @DataVenda, vTotalVenda, vNF);
	insert into tbItemVenda(NumeroVenda, CodBarras, Qtd, ValorItem) values ((select NumeroVenda from tbVenda order by NumeroVenda desc limit 1), @CodBarras, vQtd, vValorItem);
end $$

call spInsertVenda('Pimpão', 12345678910111, 1, null);
call spInsertVenda('Lança Perfume', 12345678910112, 2, null);
call spInsertVenda('Pimpão', 12345678910113, 1, null);

delimiter $$
create procedure spInsertNF(vNF int, vCliente varchar(200), vDataEmissao char(10))
begin
	set @IdCli = (select Id from tbCliente where Nome = vCliente);
    set @DataEmissao = str_to_date(vDataEmissao, "%d/%m/%y");
	set @ValorTotal = (select sum(TotalVenda) from tbVenda where IdCliente = @IdCli);

	if not exists (select NF from tbNotaFiscal where NF = vNF) then
		insert into tbNotaFiscal(NF, TotalNota, DataEmissao) values (vNF, @ValorTotal, @DataEmissao);
	end if;
end $$

call spInsertNF(359, 'Pimpão', '29/08/2022');
call spInsertNF(360, 'Lança Perfume', '29/08/2022');

delimiter $$
create procedure spDeleteProd(vCodBarras decimal(14,0))
	begin
		if exists (select CodBarras from tbProduto where CodBarras = vCodBarras) then
			delete from tbProduto where CodBarras = vCodBarras;
		end if;
    end;
$$

call spDeleteProd(12345678910116);
call spDeleteProd(12345678910117);

delimiter $$
create procedure spUpdateProd(vCodBarras decimal(14,0), vNome varchar(200), vValorUnitario decimal(6, 2))
	begin
		if exists (select CodBarras from tbProduto where CodBarras = vCodBarras) then
			update tbProduto set Nome = vNome, ValorUnitario = vValorUnitario where CodBarras = vCodBarras;
		end if;
    end;
$$

call spUpdateProd(12345678910111, 'Rei de Papel Mache', 64.50);
call spUpdateProd(12345678910112, 'Bolinha de Sabão', 120.00);
call spUpdateProd(12345678910113, 'Carro Bate Bate', 64.00);

delimiter $$ 
create procedure spSelectProd()
	begin
		select * from tbProduto;
	end;
$$

call spSelectProd();


delimiter $$ 
create procedure spSelectCli(vNome varchar(50))
	begin
		select * from tbCliente where Nome = vNome;
	end;
$$

call spSelectCli();

-- criando uma tabela histórico para a tabela produto
create table tbProdHistorico like tbProduto;

-- alterando a historico do produto
alter table tbProdHistorico modify CodBarras decimal(14,0) not null;

alter table tbProdHistorico add Atualizacao datetime;
alter table tbProdHistorico add Situacao varchar(20);

alter table tbProdHistorico drop primary key;
alter table tbProdHistorico add
	constraint pk_tbProdHistorico primary key (CodBarras, Atualizacao, Situacao);

-- criando trigger
delimiter $$
	create trigger tgrHistoricoInsert after insert on tbProduto
		for each row
	begin
	 insert into tbProdHistorico
     set CodBarras = new.CodBarras,
		 Qtd = new.Qtd, 
         Nome = new.Nome,
         ValorUnitario = new.ValorUnitario,
         Atualizacao = current_timestamp(),
         Situacao = 'Novo';
	end;
$$

call spInsertProduto(12345678910119, 'Água mineral', 1.99, 500);

delimiter $$
	create trigger tgrHistoricoUpdate after update on tbProduto
		for each row
	begin
		insert into tbProdHistorico
			set CodBarras = old.CodBarras,
				Qtd = old.Qtd, 
				Nome = old.Nome,
				ValorUnitario = old.ValorUnitario,
				Atualizacao = current_timestamp(),
				Situacao = 'Atualização';
		insert into tbProdHistorico
			set CodBarras = new.CodBarras,
				Qtd = new.Qtd, 
				Nome = new.Nome,
				ValorUnitario = new.ValorUnitario,
				Atualizacao = current_timestamp(),
				Situacao = 'Atualizado';
	end;
$$

call spUpdateProd(12345678910119, 'Água mineral', 2.99);

-- chamando os atalhos

call spInsertProduto(12345678910130, 'Camiseta de Poliéster', 35.61, 100);
call spInsertProduto(12345678910131, 'Blusa Frio Moletom', 200.00, 100);
call spInsertProduto(12345678910132, 'Vestido Decote Redondo', 144.00, 50);

call spInsertVenda('Disney Chaplin', 12345678910111, 1, null);

/* Outra maneira
call spInsertVenda('Disney Chaplin', (select CodBarras from tbProduto where Nome = "Rei do Papel Mache"), 15, null);
*/

select * from tbVenda order by NumeroVenda desc limit 1;

select * from tbItemVenda order by NumeroVenda desc limit 1;

call spSelectCli("Disney Chaplin");

delimiter $$
create trigger trgCtrlEstoque after insert on tbItemVenda for each row
	begin
		declare vVendido int;
        declare vProd decimal(14,0);
		set vVendido = (select Qtd from tbItemVenda order by NumeroVenda desc limit 1);
		set vProd = (select CodBarras from tbItemVenda order by NumeroVenda desc limit 1);
        update tbProduto set Qtd = Qtd - vVendido where CodBarras = vProd;
	end;
$$

call spInsertVenda('Paganada', 12345678910114, 15, null);

delimiter $$
create trigger trgCtrlEstoqueCompra after insert on tbItemCompra for each row
	begin
		declare vVendido int;
        declare vProd decimal(14,0);
		set vVendido = (select Qtd from tbItemCompra where new.CodBarras limit 1);
		set vProd = (select CodBarras from tbItemCompra where new.CodBarras limit 1);
        update tbProduto set Qtd = Qtd + vVendido where CodBarras = vProd;
	end;
$$

call spInsertCompra(10548, 'Amoroso e Doce', '2022-09-10', 12345678910111, 40.00, 100, 100, 4000.00);

-- call spInsertProduto(12345678910199, 'Boneca', 21.00, 200);

-- selecionando tabelas
select * from tbCliente;
select * from tbClientePF;
select * from tbClientePJ;
select * from tbEndereco;
select * from tbUF;
select * from tbCidade;
select * from tbBairro;
select * from tbProduto;
select * from tbFornecedor;
select * from tbItemCompra;
select * from tbCompra;
select * from tbVenda;
select * from tbItemVenda;
select * from tbNotaFiscal;

select * from tbProduto;
select * from tbProdHistorico;

-- describe tbProduto;

-- mostrar a procedure e/ou trigger criado
show create procedure trgCtrlEstoque;

-- join - utilizando comando inner

-- Exercício 32
select * from tbCliente
inner join tbClientePF
on tbCliente.Id = tbClientePF.IdCliente;

-- Exercício 33
select * from tbCliente
inner join tbClientePJ
on tbCliente.Id = tbClientePJ.IdCliente;

-- Exercício 34
select Id, Nome, Cnpj, Ie, IdCliente from tbCliente
inner join tbClientePJ
on tbCliente.Id = tbClientePJ.IdCliente;

-- Exercício 35
select Id as 'Código', Nome, Cpf as 'CPF', Rg as 'RG', Nasc as 'Data de Nascimento' from tbCliente
inner join tbClientePF
on tbCliente.Id = tbClientePF.IdCliente;

-- Exercício 36
select * from tbCliente
inner join tbClientePJ
	on tbCliente.Id = tbClientePJ.IdCliente
inner join tbEndereco
	on tbCliente.Cep = tbEndereco.CEP;
    
-- Exercício 37
select * from tbCliente
inner join tbClientePJ
	on tbCliente.Id = tbClientePJ.IdCliente
inner join tbEndereco
	on tbCliente.Cep = tbEndereco.CEP
inner join tbCidade
	on
inner join tbBairro
	on


describe tbCliente;