# ProjetoIntegrado
ProjetoIntegradoFeiraConectada

Linguagem de banco de dados = PostGresSQL

Script 1: Cria a  Database banco de dados nome CreateDatabase
========================================================================================
Script 2: Cria as Tabelas do banco de dados nome CreateTables conforme explicação abaixo
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
-- Registrada por 1 Gestor, Associada a 1 Feira.
-- A linha conectando a Endereco sugere uma localização.

-- Criação da tabela Programacao
-- Pertence a 1 Feira

-- Criação da tabela Produto

-- Criação da tabela Telefone
-- Pode pertencer a Gestor, Feirante ou Fornecedor.
-- FKs anuláveis com Constraint CHECK para garantir exclusividade.

-- Relacionamento N:M entre Feira e Feirante

-- Relacionamento N:M "Vende" entre Feirante e Produto
-- Inclui o atributo "Preco" do relacionamento.

-- Relacionamento N:M "Fornece" entre Fornecedor e Produto
