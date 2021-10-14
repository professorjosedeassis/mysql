/**
	E-Commerce
    @author Professor José de Assis
*/

create database dbloja;
use dbloja;

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    email varchar(50) unique not null,
    senha varchar(250) not null
);

insert into clientes (nome,email,senha)
values ('José de Assis','jose@email.com',md5('123456'));

describe clientes;
select * from clientes;

-- timestamp default current_timestamp (data e hora automático)
-- date (tipo de dados relacionados a data) YYYYMMDD
create table produtos (
	codigo int primary key auto_increment,
    barcode varchar(50) unique,
    produto varchar(100) not null,
    fabricante varchar(100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    medida varchar(50) not null,
    valor decimal(10,2),
    loc varchar(100)
);

describe produtos;

insert into produtos(produto,fabricante,dataval,estoque,estoquemin,
medida,valor,loc)
values
('Caneta BIC azul','BIC',20221005,100,10,'CX',28.75,'setor A p2');

insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,
medida,valor,loc)
values
('Régua Jojo 30cm','2222222222','JJBA',20221006,50,5,'UN',3.40,'setor A p3');

insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,
medida,valor,loc)
values
('Cola bastão','3333333333','Tenaz',20210506,50,5,'CX',1,'setor B p1');

insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,
medida,valor,loc)
values
('Massa de modelar ABC','4444444444','Toki',20200910,10,5,'UN',4.40,'setor C p1');

insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,
medida,valor,loc)
values
('Lápis preto CX 20','5555555555','Presto',20221006,10,20,'CX',5,'setor A p3');

insert into produtos(produto,barcode,fabricante,dataval,estoque,estoquemin,
medida,valor,loc)
values
('Borracha branca','6666666666','pirelli',20231006,15,50,'UN',0.50,'setor A p4');

select * from produtos;

-- Inventário do estoque(total)
select sum(estoque * valor) as total from produtos;

-- Relatório de reposição do estoque 1
select * from produtos where estoque < estoquemin;

-- Relatório de reposição do estoque 2
-- date_format() -> formatar a exibição da data
-- %d (dia) %m (mês) %y (ano 2 dígitos) %Y (ano 4 dígitos)
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
estoque, estoquemin as estoque_mínimo
from produtos where estoque < estoquemin;

-- Relatório de validade dos produtos 1
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade
from produtos;

-- Relatório de validade dos produtos 2
-- datediff() retorna a diferença em dias de duas datas
-- curdate() data atual
select codigo as código, produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes
from produtos;

-- decimal (tipo de dado numérico não inteiro 10,2 dez digitos com 2 casas decimais de precisão)
create table pedidos(
	pedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    total decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
);

insert into pedidos(idcli) values(1);
select * from pedidos;

-- abertura do pedido
select
pedidos.pedido,
date_format(pedidos.dataped,'%d/%m/%Y - %H:%i') as data_pedido,
clientes.nome as cliente, clientes.email as e_mail
from pedidos inner join clientes
on pedidos.idcli = clientes.idcli;

create table carrinho (
	pedido int not null,
    codigo int not null,
    quantidade int not null,
    foreign key(pedido) references pedidos(pedido),
    foreign key(codigo) references produtos(codigo)
);

select * from carrinho;

insert into carrinho (pedido,codigo,quantidade)
values (1,1,10);
insert into carrinho (pedido,codigo,quantidade)
values (1,2,5);

-- exibir o carrinho
select
pedidos.pedido,
carrinho.codigo as código,
produtos.produto,
carrinho.quantidade,
produtos.valor,
produtos.valor * carrinho.quantidade as sub_total
from (carrinho inner join pedidos on carrinho.pedido = pedidos.pedido)
inner join produtos on carrinho.codigo = produtos.codigo;

-- total do carrinho
select sum(produtos.valor * carrinho.quantidade) as total
from carrinho inner join produtos on carrinho.codigo = produtos.codigo;

-- atualizar o estoque após o fechamento do pedido
update carrinho
inner join produtos
on carrinho.codigo = produtos.codigo
set produtos.estoque = produtos.estoque - carrinho.quantidade
where carrinho.quantidade > 0;