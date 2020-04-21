# Introdução ao SQL (CRUD)
## Modelo de dados
O banco de dados MySQL usa o modelo relacional e a linguagem SQL. Modelo de dados é uma representação abstrata e simplificada de um sistema real. No modelo de dados podemos conhecer e testar o sistema antes da construção.
### Entidade
Pode ser definida como um conjunto de informações sobre determinado componente do sistema, na qual se deseja guardar informações (Tabela).

![entidade](https://github.com/professorjosedeassis/mysql/blob/master/imagens/entidade.png)

Exemplos de entidades: clientes, produtos.

### Atributo
São propriedades (características) que identificam as entidades.
Nome, endereço, telefone e cidade, por exemplo, são atributos da entidade 'clientes', enquanto descrição, quantidade, valor são atributos da entidade 'produtos'.
### Atributo Simples
Não possui qualquer característica especial. A maioria dos atributos serão simples.
### Atributo Composto
O seu conteúdo é formado por vários itens menores. Exemplo: Endereço. Seu conteúdo poderá ser dividido em vários outros atributos, como: Rua, Número, Complemento, Bairro, Cep e Cidade. Este tipo de atributo é chamado de atributo composto.
### Atributo Derivado
O seu conteúdo é formado por mais de um valor. como por exemplo o telefone. Uma pessoa poderá ter mais de um número de telefone.
### Atributo Chave
Também conhecido como chave primária (PK), identifica de forma única uma entidade, ou seja, não pode haver dados repetidos.
### Atributo Referencial
Também conhecido como chave estrangeira (FK), não pertence a entidade onde está alocado, e é usado para ligar outra entidade.

Representamos o atributo chave com a "bolinha cheia" e os demais atributos com a "bolinha vazia".

![atributo](https://github.com/professorjosedeassis/mysql/blob/master/imagens/atributo.png)

### Exemplo: Modelagem de uma agenda de contatos
A imagem abaixo ilustra o modelo de dados de uma simples agenda de contatos:

![modelo](https://github.com/professorjosedeassis/mysql/blob/master/imagens/modelo.png)

### Dicionarização:
É a descrição de cada objeto do modelo de dados:
* __tbcontatos:__ Entidade(tabela) onde serão registrados os contatos (pessoas)
* __id:__ Número que identifica cada contato de forma única
* __nome:__ Nome do contato
* __fone:__ Telefone do contato
* __email:__ E-mail do contato

## CRUD
__CRUD__ (do inglês: Create Read Update Delete) são as quatro operações básicas que podem ser realizadas em banco de dados que usam o modelo relacional.
* CREATE (inserção do registro(dados) na tabela_
* READ (pesquisa dos dados na(s) tabela(s))
* UPDATE (alteração de algum registro da tabela)
* DELETE (exclusão de um registro da tabela)
## Atividade 1 - infoX
Execute os passos 1 e 2 do projeto infox.

[infox](https://github.com/professorjosedeassis/mysql/blob/master/infox/projeto.md)
## Atividade 2 - Criar uma tabela de contatos
Usando como base de estudos o '_script2.sql_' e o modelo de dados usado como exemplo nesta aula, crie no banco de dados '_agenda_' a tabela de contatos.
## Atividade 3 - CRUD
Usando como base de estudos o '_script2.sql_', pratique o 'CRUD' inserindo, pesquisando, alterando e apagando contatos da agenda.
## Atividade 4 - Documentação
Usando o workbench crie o diagrama ER desta agenda de contatos conforme indicado nas ilustrações abaixo.

![diagrama](https://github.com/professorjosedeassis/mysql/blob/master/imagens/modeloer.jpg)
---
![diagrama](https://github.com/professorjosedeassis/mysql/blob/master/imagens/modeloer3.jpg)
---
![diagrama](https://github.com/professorjosedeassis/mysql/blob/master/imagens/modeloer4.jpg)
