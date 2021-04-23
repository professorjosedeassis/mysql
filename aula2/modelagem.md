# Modelagem de dados
## Modelo de dados
Modelo de dados é uma representação abstrata e simplificada de um sistema real. No modelo de dados podemos conhecer e testar o sistema antes da construção. O banco de dados MySQL usa o modelo relacional onde o conceito principal vem da teoria dos conjuntos.
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

### Projeto: Modelagem de uma agenda de contatos
A imagem abaixo ilustra o modelo de dados de uma simples agenda de contatos:

![modelo](https://github.com/professorjosedeassis/mysql/blob/master/imagens/modelo.png)

### Dicionarização:
É a descrição de cada objeto do modelo de dados:
* __contatos:__ Entidade(tabela) onde serão registrados os contatos (pessoas)
* __idcon:__ Número que identifica cada contato de forma única
* __nome:__ Nome do contato
* __fone:__ Telefone do contato
* __email:__ E-mail do contato

## Atividade 1 - Criar a tabela de contatos
Usando o modelo da agenda de contatos, analise o '_script2.sql_' desta aula e use o Workbench para criar uma nova tabela de nome contatos.

## Atividade 2 - Diagrama
Usando a engenharia reversa do Workbench crie o diagrama ER desta agenda de contatos conforme indicado nas ilustrações abaixo.

![diagrama](https://github.com/professorjosedeassis/mysql/blob/master/imagens/diagramaer.png)
---
![diagrama](https://github.com/professorjosedeassis/mysql/blob/master/imagens/diagramaagenda.png)