CREATE DATABASE relatorios;
USE relatorios;

CREATE TABLE IF NOT EXISTS infos_op(
    registro INT NOT NULL,
    cnpj VARCHAR(255),
    razao_social VARCHAR(255) NOT NULL,
    nome_fantasia VARCHAR(255) NOT NULL,
    modalidade VARCHAR(255) NOT NULL,
	logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cep INT NOT NULL,
    ddd SMALLINT,
	telefone INT,
    fax INT,
    endereco_digital VARCHAR(50) NOT NULL,
	representante VARCHAR(70) NOT NULL,
    cargo VARCHAR(30) NOT NULL,
	data_registro VARCHAR(10), 
    PRIMARY KEY (registro));
    
    CREATE TABLE IF NOT EXISTS financeiro_op(
    data_financeiro VARCHAR(10) DEFAULT 0.0,
    registro INT NOT NULL,
    conta_contabil INT NOT NULL,
    descricao VARCHAR(255),
    saldo_final DECIMAL(18, 2),
	FOREIGN KEY (registro) REFERENCES infos_op(registro));