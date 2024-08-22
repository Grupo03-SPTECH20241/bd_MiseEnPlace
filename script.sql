DROP DATABASE IF EXISTS bd_mise_en_place;

CREATE DATABASE bd_mise_en_place;
USE bd_mise_en_place;

-- Tabela tipo produto
CREATE TABLE tipo_produto(
	id_tipo_produto INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45)
);

-- Unidade de medida
CREATE TABLE unidade_medida(
	id_unidade_medida INT PRIMARY KEY AUTO_INCREMENT,
    unidade_medida VARCHAR(45)
);

-- Tabela recheio
CREATE TABLE recheio(
	id_recheio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    preco DECIMAL(6,2)
);

-- Tabela massa
CREATE TABLE massa (
	id_massa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

-- Tabela cobertura
CREATE TABLE cobertura(
	id_cobertura INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

-- Tabela produto
CREATE TABLE produto(
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    preco DECIMAL(6,2),
    descricao VARCHAR(45),
    foto VARCHAR(300),
    qtd_disponivel INT,
    fk_recheio INT,
    fk_massa INT,
    fk_cobertura INT,
    fk_unidade_medida INT,
    fk_tipo_produto INT,
    FOREIGN KEY (fk_recheio) REFERENCES recheio(id_recheio),
    FOREIGN KEY (fk_massa) REFERENCES massa(id_massa),
    FOREIGN KEY (fk_cobertura) REFERENCES cobertura(id_cobertura),
    FOREIGN KEY (fk_unidade_medida) REFERENCES unidade_medida(id_unidade_medida),
    FOREIGN KEY (fk_tipo_produto) REFERENCES tipo_produto(id_tipo_produto)
);

-- tabela personalização
CREATE TABLE personalizacao(
    id_personalizacao INT PRIMARY KEY AUTO_INCREMENT,
    tema VARCHAR(45),
    fk_recheio INT,
    fk_massa INT,
    fk_cobertura INT,
    Foreign Key (fk_recheio) REFERENCES recheio(id_recheio),
    Foreign Key (fk_massa) REFERENCES massa(id_massa),
    Foreign Key (fk_cobertura) REFERENCES cobertura(id_cobertura)
);

-- tabela forma de entrega
CREATE TABLE forma_entrega(
    id_forma_entrega INT PRIMARY KEY AUTO_INCREMENT,
    forma_entrega VARCHAR(45)
);

-- tabela forma_pagamento
CREATE TABLE forma_pagamento(
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    forma_pagamento VARCHAR(45)
);

-- tabela cliente
CREATE TABLE cliente(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    numero CHAR(11),
    dt_aniversario DATE
);

-- tabela pedido
CREATE TABLE pedido(
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATE,
    vl_pedido DECIMAL(6,2),
    status CHAR(1),
    valor_sinal DECIMAL(6,2),
    fK_forma_entrega INT,
    fk_cliente INT,
    fk_forma_pagamento INT,
    Foreign Key (fK_forma_entrega) REFERENCES forma_entrega(id_forma_entrega),
    Foreign Key (fk_cliente) REFERENCES cliente(id_cliente),
    Foreign Key (fk_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);

-- tabela endereco
CREATE TABLE endereco(
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(45),
    complemento VARCHAR(45),
    cep CHAR(9),
    numero INT
);  

-- tabela festa
CREATE TABLE festa(
    id_festa INT PRIMARY KEY AUTO_INCREMENT,
    fk_endereco INT,
    fk_pedido INT,  
    Foreign Key (fk_endereco) REFERENCES endereco(id_endereco),
    Foreign Key (fk_pedido) REFERENCES pedido(id_pedido)
);

-- tabela metas
CREATE TABLE metas(
    id_meta INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL(7,2),
    dt_termino DATE,
    dt_inicio DATE
);

-- tabela usuario
CREATE TABLE usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj CHAR(18),
    logo VARCHAR(500),
    email VARCHAR(45),
    senha VARCHAR(500)
);

CREATE TABLE produto_pedido(
    id_produto_pedido INT PRIMARY KEY AUTO_INCREMENT,
    observacoes VARCHAR(45),
    qt_produto INT,
    fk_produto INT,
    fk_personalizacao INT,
    fk_pedido INT,
    Foreign Key (fk_produto) REFERENCES produto(id_produto),
    Foreign Key (fk_personalizacao) REFERENCES personalizacao(id_personalizacao),
    Foreign Key (fk_pedido) REFERENCES pedido(id_pedido)
);

