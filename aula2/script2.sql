/**
 * Fundamentos do banco de dados MySQL - Aula 2
 * Projeto: Agenda de Contatos
 * @author Professor José de Assis
 */

create database dbagenda;
use dbagenda;

-- o comando abaixo exibe as tabelas do banco de dados
show tables;

/*
  O bloco de códigos abaixo cria uma tabela
  int (tipo de dados: numérico inteiro)
  primary key (transforma o campo em chave primária)
  auto_increment (numeração automática)
  varchar(valor) (tipo de dados: string de caracteres de tamanho variável (valor) -> Máximo de caracteres permitidos)
  not null (torna obrigatório o preenchimento do campo)
*/

create table contatos(
  idcon int primary key auto_increment,
  nome varchar(50) not null,
  fone varchar(15) not null,
  email varchar(50)
);

-- Descrever a estrutura da tabela
describe contatos;

-- O comando abaixo altera o nome de um campo da tabela
alter table contatos change nome contato varchar(50) not null;

-- O comando abaixo adiciona um novo campo a tabela
alter table contatos add column obs varchar(200);

-- O comando abaixo adiciona um novo campo a tabela em um lugar específico
alter table contatos add column fone2 varchar(15) after fone;
describe tbcontatos;

-- O comando abaixo altera o tipo de dados ou parâmetros de um campo específico
alter table contatos modify column fone2 varchar(20);

-- O comando abaixo exclui um campo da tabela
alter table contatos drop column obs;

-- O comando abaixo exclui uma tabela
drop table contatos;
