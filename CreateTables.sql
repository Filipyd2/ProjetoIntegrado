
CREATE TABLE Endereco (
    Cod_Endereco SERIAL PRIMARY KEY,
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    CEP VARCHAR(10),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

CREATE TABLE Usuario (
    Cod_Usuario SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    E_mail VARCHAR(255) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Num_Documento VARCHAR(20) UNIQUE
);


CREATE TABLE Gestor (
    Cod_Gerente SERIAL PRIMARY KEY,
    Cod_Usuario INTEGER NOT NULL UNIQUE REFERENCES Usuario(Cod_Usuario) ON DELETE CASCADE
);

CREATE TABLE Feirante (
    Cod_Feirante SERIAL PRIMARY KEY,
    Cod_Usuario INTEGER NOT NULL UNIQUE REFERENCES Usuario(Cod_Usuario) ON DELETE CASCADE
);

CREATE TABLE Consumidor (
    Cod_Consumidor SERIAL PRIMARY KEY,
    Cod_Usuario INTEGER NOT NULL UNIQUE REFERENCES Usuario(Cod_Usuario) ON DELETE CASCADE
);

CREATE TABLE Fornecedor (
    Cod_Fornecedor SERIAL PRIMARY KEY,
    Razao_Social VARCHAR(255) NOT NULL,
    Nome_Responsavel VARCHAR(255),
    Num_Documento VARCHAR(20) UNIQUE,
    Cod_Endereco INTEGER NOT NULL UNIQUE REFERENCES Endereco(Cod_Endereco)
);


CREATE TABLE Feira (
    Cod_Feira SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Cod_Gerente INTEGER NOT NULL REFERENCES Gestor(Cod_Gerente),
    Cod_Endereco INTEGER NOT NULL UNIQUE REFERENCES Endereco(Cod_Endereco)
);


CREATE TABLE Assembleia (
    Cod_Assembleia SERIAL PRIMARY KEY,
    Data DATE NOT NULL,
    Resumo TEXT,
    Ata TEXT,
    Cod_Gerente INTEGER NOT NULL REFERENCES Gestor(Cod_Gerente),
    Cod_Feira INTEGER NOT NULL REFERENCES Feira(Cod_Feira),
    Cod_Endereco INTEGER REFERENCES Endereco(Cod_Endereco)
);


CREATE TABLE Programacao (
    Cod_Programacao SERIAL PRIMARY KEY,
    Dia DATE NOT NULL,
    Hora_Inicio TIME NOT NULL,
    Hora_Fim TIME NOT NULL,
    Cod_Feira INTEGER NOT NULL REFERENCES Feira(Cod_Feira) ON DELETE CASCADE
);


CREATE TABLE Produto (
    Cod_Produto SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Tipo VARCHAR(100)
);


CREATE TABLE Telefone (
    Cod_Telefone SERIAL PRIMARY KEY,
    DDD VARCHAR(3) NOT NULL,
    Numero VARCHAR(15) NOT NULL,
    Cod_Gerente INTEGER REFERENCES Gestor(Cod_Gerente) ON DELETE CASCADE,
    Cod_Feirante INTEGER REFERENCES Feirante(Cod_Feirante) ON DELETE CASCADE,
    Cod_Fornecedor INTEGER REFERENCES Fornecedor(Cod_Fornecedor) ON DELETE CASCADE,
    CONSTRAINT chk_dono_telefone CHECK (
        (Cod_Gerente IS NOT NULL AND Cod_Feirante IS NULL AND Cod_Fornecedor IS NULL) OR
        (Cod_Gerente IS NULL AND Cod_Feirante IS NOT NULL AND Cod_Fornecedor IS NULL) OR
        (Cod_Gerente IS NULL AND Cod_Feirante IS NULL AND Cod_Fornecedor IS NOT NULL)
    )
);

CREATE TABLE Feira_Feirante (
    Cod_Feira INTEGER NOT NULL REFERENCES Feira(Cod_Feira) ON DELETE CASCADE,
    Cod_Feirante INTEGER NOT NULL REFERENCES Feirante(Cod_Feirante) ON DELETE CASCADE,
    PRIMARY KEY (Cod_Feira, Cod_Feirante)
);


CREATE TABLE Venda (
    Cod_Feirante INTEGER NOT NULL REFERENCES Feirante(Cod_Feirante) ON DELETE CASCADE,
    Cod_Produto INTEGER NOT NULL REFERENCES Produto(Cod_Produto) ON DELETE CASCADE,
    Preco NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (Cod_Feirante, Cod_Produto)
);


CREATE TABLE Fornecedor_Produto (
    Cod_Fornecedor INTEGER NOT NULL REFERENCES Fornecedor(Cod_Fornecedor) ON DELETE CASCADE,
    Cod_Produto INTEGER NOT NULL REFERENCES Produto(Cod_Produto) ON DELETE CASCADE,
    PRIMARY KEY (Cod_Fornecedor, Cod_Produto)
);