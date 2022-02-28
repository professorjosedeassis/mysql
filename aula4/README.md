# Relacionamento de tabelas
No MySQL podemos associar as entidades(tabelas) de forma a preservar a integridade dos dados. O símbolo losango representa um relacionamento no Modelo Entidade Relacionamento (MER).

![relacionamento](https://raw.githubusercontent.com/professorjosedeassis/mysql/master/imagens/losango.png)
## Cardinalidade
No modelo relacional podemos ter três níveis de relacionamento:
### Um para um (1 : 1)
Um relacionamento é denominado "um para um" quando um registro de uma tabela pode estar associado a no máximo um registro de outra tabela. No exemplo abaixo um governador só pode governar um estado e ao mesmo tempo um estado só pode ser governado por um governador.

![1:1](https://github.com/professorjosedeassis/mysql/blob/master/imagens/um%20para%20um%20v2.png)

### Um para muitos (1 : N)
Um relacionamento é denominado "um para muitos" quando um registro de uma tabela está relacionado a vários registros da outra tabela. No exemplo abaixo um cliente pode gerar várias OS(ordem de serviço) porém uma OS só pode estar vinculada a um único cliente. 

![1:N](https://github.com/professorjosedeassis/mysql/blob/master/imagens/infox%201N.png)

### Muitos para muitos (N : N)
Um relacionamento é denominado "muitos para muitos" quando vários registros em uma tabela são associados a vários registros em outra tabela.
No exemplo abaixo um aluno pode se matricular em vários cursos e um curso pode ser assistido por vários alunos.

![N:N](https://github.com/professorjosedeassis/mysql/blob/master/imagens/aulaead%20NN%201%20forma.png)

Para desenvolver este tipo de relacionamento (N : N) no banco de dados devemos criar uma terceira tabela associativa, conforme imagem abaixo:

![N:N](https://github.com/professorjosedeassis/mysql/blob/master/imagens/aulaead%20NN%202%20forma.png)

___
## Atividade 1 - infoX
Execute os passos 3 e 4 do projeto infox.

[infox](https://github.com/professorjosedeassis/mysql/blob/master/infox/projeto.md)
## Atividade 2 - Lojinha
Usando como base de estudos o 'script3.sql', desenvolva o projeto de um banco de dados de uma loja, conforme modelo abaixo.

![N:N](https://github.com/professorjosedeassis/mysql/blob/master/imagens/lojinha.png)

Efetue alguns pedidos e gere um relatório de vendas descrevendo:
* Número do pedido
* Data do pedido
* Nome do cliente
* Descrição dos produtos
* Quantidade
* Preço
* Total

