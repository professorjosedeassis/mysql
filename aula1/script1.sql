/**
 * Fundamentos do banco de dados MySQL - Aula 1
 * Projeto: Agenda de Contatos
 * @author Professor José de Assis
 */

/*
  No MySQL o banco de dados é escrito usando SQL (Structured Query Language)
  SQL ou Linguagem de Consulta Estruturada é a linguagem de pesquisa declarativa padrão para banco de dados que usam o modelo relacional. 
*/

-- Listar os bancos disponíveis no servidor
show databases;

-- Criar um banco de dados
create database dbagenda;

-- Selecionar o banco de dados
use dbagenda;

-- Excluir um banco de dados
drop database dbagenda;