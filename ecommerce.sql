-- Cria o banco de dados "ecommerce"
CREATE DATABASE ecommerce;

-- Seleciona o novo banco de dados
USE ecommerce;

-- Tabela de Clientes
CREATE TABLE Cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    nome VARCHAR(255) NOT NULL,
    cpf_cnpj VARCHAR(14) UNIQUE NOT NULL
    -- Outros campos relevantes para clientes
);

-- Tabela de Pedidos
CREATE TABLE Pedido (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL
    -- Outros campos relevantes para pedidos
);

-- Tabela de Produtos
CREATE TABLE Produto (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
    -- Outros campos relevantes para produtos
);

-- Tabela de Fornecedores
CREATE TABLE Fornecedor (
    fornecedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
    -- Outros campos relevantes para fornecedores
);

-- Tabela de Estoques
CREATE TABLE Estoque (
    estoque_id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    fornecedor_id INT NOT NULL,
    quantidade INT NOT NULL
    -- Outros campos relevantes para estoques
);

-- Tabela de Pagamentos
CREATE TABLE Pagamento (
    pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
    -- Outros campos relevantes para pagamentos
);

-- Tabela de Entregas
CREATE TABLE Entrega (
    entrega_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    codigo_rastreio VARCHAR(255) NOT NULL
    -- Outros campos relevantes para entregas
);

-- Adiciona chaves estrangeiras às tabelas
ALTER TABLE Pedido ADD FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id);
ALTER TABLE Estoque ADD FOREIGN KEY (produto_id) REFERENCES Produto(produto_id);
ALTER TABLE Estoque ADD FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id);
ALTER TABLE Pagamento ADD FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id);
ALTER TABLE Entrega ADD FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id);


