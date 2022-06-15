/**
    Lojinha
    @author Professor José de Assis
    @version 1.2
*/

create database lojinha;
use lojinha;

create table usuarios (
    idusu int primary key auto_increment,
    usuario varchar(50) not null,
    login varchar(10) not null unique,
    senha varchar(255) not null,
    perfil varchar(20) not null
);

describe usuarios;

insert into usuarios(usuario,login,senha,perfil)
values('Administrador','admin',md5('admin'),'admin');
insert into usuarios(usuario,login,senha,perfil)
values('José de Assis','joseassis',md5('123456'),'user');

select * from usuarios;

-- Acessando o sistema pela tela de login
select * from usuarios where login='admin' and senha=md5('admin');

create table fornecedores (
    idfor int primary key auto_increment,
    cnpj varchar(20) not null unique,
    ie varchar(20) unique,
    im varchar(20) unique,
    razao varchar(50) not null,
    fantasia varchar(50) not null,
    site varchar(50),
    fone varchar(15) not null,
    contato varchar(50),     
    email varchar(50),
    cep varchar(9) not null,
    endereco varchar(100) not null,
    numero varchar(10) not null,
    complemento varchar(20),
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    uf char(2) not null,
    obs varchar(255)
);

insert into fornecedores
(cnpj,razao,fantasia,fone,cep,endereco,numero,bairro,cidade,uf)
values ('43.283.811/0001-50','Kalunga Comercio e Industria Grafica Ltda','Kalunga',
'(11)3346-9966','03307-005','Rua Tuiuti','2516','Tatuapé','São Paulo','SP');

select * from fornecedores;

create table produtos(
    codigo int primary key auto_increment,
    barcode varchar(255) unique,
    produto varchar(100) not null,
    descricao varchar(255) not null,
    fabricante varchar(50) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(50) not null,
    localizacao varchar(50),
    custo decimal(10,2) not null,
    lucro decimal(10,2),    
    idfor int not null,
    foreign key(idfor) references fornecedores(idfor)
);

insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,idfor)
values
('12345678910','Caneta BIC Azul','Caneta bic ponta fina azul','BIC',
20240523,20,5,'UN','Prateleira 2',0.75,100,1);

insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,idfor)
values
('12345678911','Caneta BIC Vermelha','Caneta bic ponta fina vermelha','BIC',
20240525,2,5,'UN','Prateleira 3',0.75,100,1);

insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,idfor)
values
('12345678912','Cola branca','Cola branca de papel','Tenaz',
20210525,20,5,'UN','Prateleira 5',2,50,1);

insert into produtos(barcode,produto,descricao,fabricante,dataval,
estoque,estoquemin,unidade,localizacao,custo,lucro,idfor)
values
('123456789013','Clips Galvanizados','Clips Galvanizados tamanho 2/0 100 unidades',
'Tilibra',20270525,5,10,'CX','Prateleira 7',3.50,100,1);

select * from produtos;

-- Obter o preço de venda dos produtos
select codigo as código,produto,custo,
(custo + (custo * lucro)/100) as venda
from produtos;

-- Inventário do estoque (patrimônio)
select sum(estoque * custo) as total from produtos;

-- relatório de reposição de estoque
-- %d/%m/%Y dd/mm/aaaa | %d/%m/%y dd/mm/aa | %H:%i HH:MM
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
estoque, estoquemin as estoque_mínimo
from produtos where estoque < estoquemin;

-- relatório de produtos vencidos
select codigo as código,produto,localizacao as localização,
date_format(dataval,'%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_vencidos
from produtos where datediff(dataval,curdate()) < 0;

create table clientes (
    idcli int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    cpf varchar(15) unique,
    email varchar(50),
    marketing char(1) not null,
    cep varchar(9),
    endereco varchar(100),
    numero varchar(10),
    complemento varchar(20),
    bairro varchar(50),
    cidade varchar(50),
    uf char(2)
);

insert into clientes(nome,fone,marketing)
values('Kelly Cristina','99999-1234','n');

insert into clientes(nome,fone,email,marketing)
values('Sirlene Sanches','99999-4321','sisa@email.com','s');

-- E-mail marketing
select nome as Cliente,email as E_mail from clientes where marketing='s';

create table pedidos (
    pedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    total decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
);

-- abertura de um pedido
insert into pedidos(idcli) values(1);

-- verificar pedidos abertos
select
pedidos.pedido,
date_format(pedidos.dataped,'%d/%m/%Y - %H:%i') as data_pedido,
clientes.nome as cliente,
clientes.fone
from pedidos inner join clientes
on pedidos.idcli = clientes.idcli;

-- Tabela de apoio para criar um relacionamento do tipo N-N
create table carrinho (
    pedido int not null,
    codigo int not null,
    quantidade int not null,
    foreign key(pedido) references pedidos(pedido),
    foreign key(codigo) references produtos(codigo)
);

insert into carrinho values (1,1,2);
insert into carrinho values (1,4,1);

select * from carrinho;

-- Exibir o carrinho
select pedidos.pedido,
carrinho.codigo as código,
produtos.produto,
carrinho.quantidade,
produtos.custo + (custo*lucro/100) as valor,
(produtos.custo + (custo*lucro/100)) * carrinho.quantidade as sub_total
from (carrinho inner join pedidos on carrinho.pedido = pedidos.pedido)
inner join produtos on carrinho.codigo = produtos.codigo;

-- total do pedido
select sum((produtos.custo + (custo*lucro/100)) * carrinho.quantidade) as total
from carrinho inner join produtos
on carrinho.codigo = produtos.codigo;

-- atualização do estoque (fechamento do pedido)
update carrinho
inner join produtos
on carrinho.codigo = produtos.codigo
set produtos.estoque = produtos.estoque - carrinho.quantidade
where carrinho.quantidade > 0;

select * from produtos;
