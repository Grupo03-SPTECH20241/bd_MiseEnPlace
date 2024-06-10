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

INSERT INTO recheio ( nome, preco) 
VALUES 
    ('Chocolate', 5.99),
    ('Baunilha', 4.50),
    ('Morango', 6.75);

-- Tabela `mydb`.`massa`
INSERT INTO massa (nome) 
VALUES 
    ('Chocolate'),
    ('Baunilha'),
    ('Red Velvet');

-- Tabela `mydb`.`cobertura`
INSERT INTO cobertura (nome) 
VALUES 
    ('Chocolate'),
    ('Creme de Leite'),
    ('Ganache');

-- Tabela `mydb`.`unidade_medida`
INSERT INTO unidade_medida (unidade_medida) 
VALUES 
    ('Unidade'),
    ('Gramas'),
    ('Litros');

-- Tabela `mydb`.`tipo_produto`
INSERT INTO tipo_produto ( tipo) 
VALUES 
    ('Bolo'),
    ('Doces'),
    ('Salgados');

-- Tabela `mydb`.`forma_entrega`
INSERT INTO forma_entrega (forma_entrega) 
VALUES 
    ('Retirada'),
    ('Entrega');

-- Tabela `mydb`.`cliente`
INSERT INTO cliente (nome, numero) 
VALUES 
    ('João', '12345678901'),
    ('Maria', '98765432109');

-- Tabela `mydb`.`forma_pagamento`
INSERT INTO forma_pagamento (forma_pagamento) 
VALUES 
    ('Cartão de Crédito'),
    ('Dinheiro');

-- Tabela `mydb`.`pedido`
INSERT INTO pedido (dt_pedido, vl_pedido, status, valor_sinal, fk_forma_entrega, fk_cliente, fk_forma_pagamento) 
VALUES 
    (NOW(), '50.00', 'P', '20.00', 1, 1, 1),
    ('2024-05-12', '100.00', 'A', '30.00', 2, 2, 2);
   
-- Tabela `mydb`.`metas`
INSERT INTO metas (valor, dt_termino,  dt_inicio) 
VALUES 
    ( 5000, '2024-12-31',  '2024-01-01');

-- Tabela `mydb`.`usuario`
INSERT INTO usuario (nome,email, senha) 
VALUES 
    ('João','joao@example.com', 'senha123'),
    ('Maria','maria@example.com', 'senha456');
  

-- Tabela `mydb`.`personalizacao`
INSERT INTO personalizacao (tema, fk_recheio, fk_massa, fk_cobertura) 
VALUES 
    ('Aniversário', 1, 2, 3),
    ('Casamento', 2, 1, 2);

-- Tabela `mydb`.`endereco`
INSERT INTO endereco (logradouro, complemento, cep, numero) 
VALUES 
    ( 'Rua A', 'Apto 101', '12345-678', '123'),
    ('Rua B', 'Casa', '98765-432', '456');

-- Tabela `mydb`.`festa`
INSERT INTO festa (fk_endereco, fk_pedido) 
VALUES 
    ( 1, 1),
    ( 2, 2);
-- Inserindo valores na tabela produto
INSERT INTO produto ( nome, preco, descricao, foto, qtd_disponivel, fk_recheio, fk_massa, fk_cobertura, fk_unidade_medida, fk_tipo_produto) 
VALUES 
    ('Bolo de Chocolate', 30.00, 'Delicioso bolo de chocolate', 'bolo_chocolate.jpg', 10, 1, 1, 1, 1, 1),
    ( 'Bolo de Baunilha', 25.00, 'Bolo de baunilha simples e delicioso', 'bolo_baunilha.jpg', 15, 2, 2, 1, 1, 1),
    ('Brigadeiro', 2.50, 'Doce de brigadeiro tradicional', 'brigadeiro.jpg', 100, 1, 1, 1, 1, 2),
    ('Coxinha', 3.00, 'Coxinha de frango', 'coxinha.jpg', 50, 1, 1, 1, 1, 3);

-- Tabela produto_pedido
INSERT INTO produto_pedido(observacoes, qt_produto, fk_produto,fk_personalizacao, fk_pedido) 
VALUES 
    ('Sem açúcar',1, 1, 1, 1),
    ('Com recheio duplo', 2, 2, 2, 2);
    
DELIMITER $
CREATE  PROCEDURE pc_insercao_pedido(
	IN 
    tema VARCHAR(45),
    fk_recheio INT,
    fk_massa INT,
    fk_cobertura INT,
    observacoes VARCHAR(45), -- tabela produto_pedido
    qt_produto INT,
    fk_produto INT,
    dt_pedido DATE, -- Tabela pedido
    vl_pedido DECIMAL(6,2),
	`status` CHAR(1),
    valor_sinal DECIMAL(6,2),
    fk_forma_entrega INT,
    fk_cliente INT,
    fk_forma_pagamento INT
) BEGIN
	INSERT INTO personalizacao(tema, fk_recheio, fk_massa, fk_cobertura) 
								VALUES 
								(tema, fk_recheio, fk_massa, fk_cobertura);
	
    INSERT INTO pedido(dt_pedido, vl_pedido, status, valor_sinal, fk_forma_entrega, fk_cliente, fk_forma_pagamento) 
								VALUES 
								(dt_pedido, vl_pedido, status, valor_sinal, fk_forma_entrega, fk_cliente, fk_forma_pagamento);
    
	INSERT INTO produto_pedido(observacoes, qt_produto, fk_produto,fk_personalizacao, fk_pedido) 
								VALUES 
								(observacoes,qt_produto, fk_produto, (SELECT id_personalizacao 
																				FROM personalizacao
																				ORDER BY id_personalizacao
                                                                                DESC LIMIT 1), (SELECT id_pedido
																										FROM 
                                                                                                        pedido 
                                                                                                        ORDER BY id_pedido
																										DESC LIMIT 1));
	
                                
END
$

delimiter $
	CALL pc_insercao_pedido(NULL,1,2,3,'Sem açúcar',56,2,CURRENT_DATE(),50.00,'P',25.00,1,1,1);
$