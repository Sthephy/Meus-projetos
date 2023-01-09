-- colocando db em uso
use bd_26_08;

-- mostrando tabelas
show tables;

-- selecionando tabelas
select * from tbl_produto;
select * from tbl_categoria;

-- outra maneira de selecionar tabelas
create view vw_exibeProd
    as select tbl_produto.cd_produto, tbl_produto.nm_produto, tbl_categoria.nm_categoria, tbl_produto.vl_preco
		from tbl_produto inner join tbl_categoria
			on tbl_produto.cd_categoria = tbl_categoria.cd_categoria;

select * from vw_exibeProd;