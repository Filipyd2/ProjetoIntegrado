#ProjetoIntegradoFeiraConectada
========================================
Linguagem de banco de dados = PostGresSQL
============================================================
Script 1 (CreateDatabase): Cria a  Database do banco de dados sistema_feira
========================================================================================
Script 2 (CreateTables): Cria as tabelas do banco de dados conforme explicação abaixo
========================================================================================
Passo a passo do script de criação de tabelas:

-- Criação da tabela Endereco (Entidade independente)

-- Criação da tabela Usuario (Superclasse)

-- Criação das Subclasses de Usuario

-- Criação da tabela Fornecedor
-- Relacionamento (1,1) com Endereco: FK com UNIQUE e NOT NULL

-- Criação da tabela Feira
-- Gerenciada por 1 Gestor (NOT NULL), Possui 1 Endereço (NOT NULL, UNIQUE para 1:1)

-- Criação da tabela Assembleia

-- Criação da tabela Programacao
-- Pertence a 1 Feira

-- Criação da tabela Produto

-- Criação da tabela Telefone
-- Pode pertencer a Gestor, Feirante ou Fornecedor.
-- FKs anuláveis com Constraint CHECK para garantir exclusividade.

-- Relacionamento N:M entre Feira e Feirante

-- Relacionamento N:M "Vende" entre Feirante e Produto

-- Relacionamento N:M "Fornece" entre Fornecedor e Produto
========================================================================================

## 📚 Componente Extensionista: O Projeto Físico

### O que é?
O Projeto Físico de Banco de Dados é a fase de implementação técnica. É o momento em que pegamos a lógica de negócio definida nos diagramas e escrevemos os comandos SQL (DDL) específicos para o Sistema Gerenciador de Banco de Dados escolhido (neste caso, o PostgreSQL). Aqui, definimos tipos de dados (como VARCHAR ou SERIAL), criamos restrições (CONSTRAINTS) e configuramos a segurança dos dados.

### Por que é importante?
Um projeto físico bem feito facilita imensamente a escrita do código. Se o banco garante que um e-mail é único ou que um endereço não pode ficar "órfão", o programador precisa escrever menos código de validação no Back-end. Entender isso nos ajuda a criar aplicações mais eficientes, rápidas e com menos bugs.