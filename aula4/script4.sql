/* 
	SQL - Aula 3
	Relacionamento de tabelas
    Exemplo prático N:N
	@author Professor José de Assis
*/

create database aulaead;
use aulaead;

/* 
	Trabalhando com os tipos date, datetime e timestamp
	date (YYYYMMDD)
	datetime (YYYYMMDDhhmmss)
	timestamp default current_timestamp -- insere automaticamente data e hora --
	now() -- função usada para inserir data e hora atual --
*/

create table tbalunos(
	idaluno int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    nascimento date not null    
);

describe tbalunos;

insert into tbalunos(nome,fone,nascimento)
values('Victor Assis','99999-1234',20030415);

insert into tbalunos(nome,fone,nascimento)
values('Sandra Moraes','99999-4321',19760522);

insert into tbalunos(nome,fone,nascimento)
values('Pedro Henrique','99999-9999',now());

select * from tbalunos;

/*
	Para formatar uma data usamos: date_format(campo,formato)
	Formato: '%d/%m/%y' --dia, mês e ano com 2 dígitos
    Formato: '%d/%m/%Y' --dia, mês e ano com 4 dígitos
*/

select nome,fone,date_format(nascimento,'%d/%m/%Y') from tbalunos;

/*
	Tipos numéricos:
	int  [aceita valores do tipo inteiro de -2147483648 a 2147483647]
    decimal(digitos,formatação)  [valores numéricos não inteiros] 
    decimal(10,2)  [aceita números de até 10 dígitos com 2 casas decimais]
    Observação: O insert do tipo decimal deve ser com ponto (.)
*/

create table tbcursos(
	idcurso int primary key auto_increment,
    curso varchar(50) not null,
    horas int not null,
    valor decimal(10,2)
);

describe tbcursos;

insert into tbcursos(curso,horas,valor)
values('Java',80,350);

insert into tbcursos(curso,horas,valor)
values('Linux',40,95.5);

insert into tbcursos(curso,horas)
values('HTML5',20);

insert into tbcursos(curso,horas,valor)
values('Python',40,120);

select * from tbcursos;

/* Criando uma tabela de associação entre alunos e cursos (N:N) */
create table tbmatriculas(
	idmatricula int primary key auto_increment,
    datamat timestamp default current_timestamp,
    idaluno int not null,
    idcurso int not null,
    foreign key(idaluno) references tbalunos(idaluno),
    foreign key(idcurso) references tbcursos(idcurso)
);

describe tbmatriculas;

/* gerar também o modelo ER para visualizar o relacionamento */

/* Efetuando matrículas */

insert into tbmatriculas(idaluno,idcurso) values (1,1);
insert into tbmatriculas(idaluno,idcurso) values (1,2);
insert into tbmatriculas(idaluno,idcurso) values (2,3);
insert into tbmatriculas(idaluno,idcurso) values (2,4);
insert into tbmatriculas(idaluno,idcurso) values (3,1);
insert into tbmatriculas(idaluno,idcurso) values (3,2);
insert into tbmatriculas(idaluno,idcurso) values (3,3);
insert into tbmatriculas(idaluno,idcurso) values (3,4);

select * from tbmatriculas;

/* Criando relatórios personalizados */

-- Unindo todos os dados das tabelas
select * from tbmatriculas
inner join tbalunos
on tbmatriculas.idaluno = tbalunos.idaluno
inner join tbcursos
on tbmatriculas.idcurso = tbcursos.idcurso;

-- Selecionando determinados campos das tabelas
-- M,A,C são apelidos usados para simplificar o comando

select
M.idmatricula as Matrícula,
A.nome as aluno,
C.curso,valor
from tbmatriculas as M
inner join tbalunos as A
on (M.idaluno = A.idaluno)
inner join tbcursos as C
on (M.idcurso = C.idcurso);

-- Somando o total de venda dos cursos
select sum(valor) as Total from tbcursos;