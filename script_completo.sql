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
    descricao VARCHAR(455),
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
    numero CHAR(11)
);

-- tabela pedido
CREATE TABLE pedido(
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATE,
    dt_entrega DATE,
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
    ('Morango', 6.75),
    ('N/A', 0);

-- Tabela `mydb`.`massa`
INSERT INTO massa (nome) 
VALUES 
    ('Chocolate'),
    ('Baunilha'),
    ('Red Velvet'),
    ('N/A');

-- Tabela `mydb`.`cobertura`
INSERT INTO cobertura (nome) 
VALUES 
    ('Chocolate'),
    ('Creme de Leite'),
    ('Ganache'),
    ('N/A');

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
    ('Salgados'),
    ('pirulito'),
    ('torta');

-- Tabela `mydb`.`forma_entrega`
INSERT INTO forma_entrega (forma_entrega) 
VALUES 
    ('Retirada'),
    ('Entrega'),
    ('Serviço em festa');

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
INSERT INTO pedido (dt_pedido,dt_entrega, vl_pedido, status, valor_sinal, fk_forma_entrega, fk_cliente, fk_forma_pagamento) 
VALUES 
    (NOW(),'2024-09-12', '50.00', 'N', '20.00', 1, 1, 1),
    ('2024-05-12','2024-09-12', '100.00', 'N', '30.00', 2, 2, 2);
   
-- Tabela `mydb`.`metas`
INSERT INTO metas (valor, dt_termino,  dt_inicio) 
VALUES 
    ( 50000, '2024-12-31',  '2024-01-01');

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
    ('Bolo de Chocolate', 30.00, 'Delicioso bolo de chocolate', 'img/produtos/bolo_chocolate.jpg', 10, 1, 1, 1, 1, 1),
    ( 'Bolo de Baunilha', 25.00, 'Bolo de baunilha simples e delicioso', 'img/produtos/bolo-baunilha.jpg', 15, 2, 2, 1, 1, 1),
    ('Brigadeiro', 2.50, 'Doce de brigadeiro tradicional', 'img/produtos/brigadeiro.jpg', 100, 1, 1, 1, 1, 2),
    ('Coxinha', 3.00, 'Coxinha de frango', 'img/produtos/coxinha.jpg', 50, 1, 1, 1, 1, 3);
INSERT INTO produto (nome, preco, descricao, foto, qtd_disponivel, fk_recheio, fk_massa, fk_cobertura, fk_unidade_medida, fk_tipo_produto) 
VALUES 
    -- Produtos do tipo 'Bolo'
    ('Bolo de Morango', 35.00, 'Delicioso bolo com recheio de morango', 'img/produtos/bolo_morango.jpg', 12, 3, 1, 2, 1, 1),
    ('Bolo de Nozes', 40.00, 'Bolo com cobertura de creme de leite e recheio de nozes', 'img/produtos/bolo_nozes.jpg', 8, 2, 3, 1, 1, 1),
    ('Bolo de Cenoura', 32.00, 'Bolo de cenoura com cobertura de ganache', 'img/produtos/bolo_cenoura.jpg', 10, 1, 2, 3, 1, 1),
    ('Bolo de Coco', 38.00, 'Bolo de coco com recheio cremoso', 'img/produtos/bolo_coco.jpg', 7, 2, 1, 2, 1, 1),
    ('Bolo de Limão', 30.00, 'Bolo de limão com cobertura açucarada', 'img/produtos/bolo_limao.jpg', 6, 3, 3, 1, 1, 1),

    -- Produtos do tipo 'Doces'
    ('Brigadeiro Gourmet', 3.50, 'Brigadeiro feito com chocolate belga', 'img/produtos/brigadeiro_gourmet.jpg', 100, 1, 1, 1, 1, 2),
    ('Beijinho', 3.00, 'Doce de coco tradicional', 'img/produtos/beijinho.jpg', 90, 2, 1, 2, 1, 2),
    ('Cajuzinho', 3.00, 'Doce feito com amendoim', 'img/produtos/cajuzinho.jpg', 85, 3, 1, 1, 1, 2),
    ('Trufa de Maracujá', 4.00, 'Trufa recheada de maracujá', 'img/produtos/trufa_maracuja.jpg', 70, 1, 1, 3, 1, 2),
    ('Doce de Leite', 2.50, 'Doce de leite caseiro', 'img/produtos/doce_de_leite.jpg', 120, 3, 1, 2, 1, 2),

    -- Produtos do tipo 'Salgados'
    ('Bolinho de Queijo', 3.00, 'Bolinho recheado de queijo', 'img/produtos/bolinho_queijo.jpg', 40, 2, 1, 2, 1, 3),
    ('Esfirra de Carne', 4.00, 'Esfirra aberta de carne', 'img/produtos/esfirra_carne.jpg', 35, 3, 1, 1, 1, 3),
    ('Kibe', 3.50, 'Kibe frito com recheio de carne', 'img/produtos/kibe.jpg', 60, 1, 1, 3, 1, 3),
    ('Enroladinho de Salsicha', 2.50, 'Massa recheada com salsicha', 'img/produtos/enroladinho_salsicha.jpg', 75, 2, 1, 2, 1, 3),

    -- Produtos do tipo 'Torta'
    ('Torta de Limão', 25.00, 'Torta com recheio de limão', 'img/produtos/torta_limao.jpg', 15, 3, 1, 2, 1, 5),
    ('Torta de Chocolate', 27.50, 'Torta recheada de chocolate', 'img/produtos/torta_chocolate.jpg', 10, 1, 1, 3, 1, 5),
    ('Torta de Morango', 30.00, 'Torta com morangos frescos', 'img/produtos/torta_morango.jpg', 12, 3, 1, 1, 1, 5),
    ('Torta de Nozes', 28.00, 'Torta de nozes com cobertura de creme', 'img/produtos/torta_nozes.jpg', 8, 2, 1, 2, 1, 5),
    ('Torta de Maçã', 26.50, 'Torta caseira de maçã', 'img/produtos/torta_maca.jpg', 7, 3, 1, 3, 1, 5),
	-- Pirulitos
	('Pirulito de Chocolate', 5.00, 'Pirulito feito com chocolate ao leite', 'img/produtos/pirulito_chocolate.jpg', 50, 1, 1, 1, 1, 4);

-- Tabela produto_pedido
INSERT INTO produto_pedido(observacoes, qt_produto, fk_produto,fk_personalizacao, fk_pedido) 
VALUES 
    ('Sem açúcar',1, 1, 1, 1),
    ('Com recheio duplo', 2, 2, 2, 2);
    
DELIMITER //
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
    dt_entrega DATE,
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
	
    INSERT INTO pedido(dt_pedido,dt_entrega, vl_pedido, status, valor_sinal, fk_forma_entrega, fk_cliente, fk_forma_pagamento) 
								VALUES 
								(dt_pedido,dt_entrega, vl_pedido, status, valor_sinal, fk_forma_entrega, fk_cliente, fk_forma_pagamento);
    
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
	
                                
END //

DELIMITER ;
CALL pc_insercao_pedido(NULL,1,2,3,'Sem açúcar',56,2,CURRENT_DATE(),'2024-09-23',50.00,'N',25.00,1,1,1);




DELIMITER //

CREATE PROCEDURE gerar_dados_teste(
	IN
    quantidade INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE tema VARCHAR(45);
    DECLARE fk_recheio INT;
    DECLARE fk_massa INT;
    DECLARE fk_cobertura INT;
    DECLARE observacoes VARCHAR(45);
    DECLARE qt_produto INT;
    DECLARE fk_produto INT;
    DECLARE dt_pedido DATE;
    DECLARE dt_entrega DATE;
    DECLARE vl_pedido DECIMAL(6,2);
    DECLARE status CHAR(1);
    DECLARE valor_sinal DECIMAL(6,2);
    DECLARE fk_forma_entrega INT;
    DECLARE fk_cliente INT;
    DECLARE fk_forma_pagamento INT;
    
    WHILE i < quantidade DO
        SET tema = CONCAT('Tema ', FLOOR(1 + RAND() * 10)); -- Temas variadosA
        SET fk_recheio = FLOOR(1 + RAND() * 3); -- 1 a 3
        SET fk_massa = FLOOR(1 + RAND() * 3); -- 1 a 3
        SET fk_cobertura = FLOOR(1 + RAND() * 3); -- 1 a 3
        SET observacoes = CONCAT('Observação ', FLOOR(1 + RAND() * 100)); -- Observações variadas
        SET qt_produto = FLOOR(1 + RAND() * 10); -- Quantidade de produtos entre 1 e 10
        SET fk_produto = FLOOR(1 + RAND() * 4); -- 1 a 4
        SET dt_pedido = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 160) DAY); -- Datas variadas nos últimos 160 dias
        SET	dt_entrega = DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND() * 30) DAY);
        SET vl_pedido = ROUND(RAND() * 100 + 50, 2); -- Valor do pedido entre 50 e 150
		SET status = CASE 
			WHEN i <= (quantidade/2) 
			THEN 'N' 
			ELSE 'E' 
		END;
        SET valor_sinal = ROUND(RAND() * 50, 2); -- Valor do sinal entre 0 e 50
        SET fk_forma_entrega = FLOOR(1 + RAND() * 2); -- 1 a 2
        SET fk_cliente = FLOOR(1 + RAND() * 2); -- 1 a 2
        SET fk_forma_pagamento = FLOOR(1 + RAND() * 2); -- 1 a 2

        CALL pc_insercao_pedido(
            tema,
            fk_recheio,
            fk_massa,
            fk_cobertura,
            observacoes,
            qt_produto,
            fk_produto,
            dt_pedido,
            dt_entrega,
            vl_pedido,
            status,
            valor_sinal,
            fk_forma_entrega,
            fk_cliente,
            fk_forma_pagamento
        );

        SET i = i + 1;
    END WHILE;

END //

DELIMITER ;

call gerar_dados_teste(10);

CREATE OR REPLACE VIEW  vw_quantidade_vendidos_mes
AS
SELECT 
    MONTH(p.dt_pedido) 'mes',
    SUM(pp.qt_produto) 'Quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
GROUP BY 
    MONTH(p.dt_pedido);


-- view mais vendidos por dia 
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_dia
AS
SELECT 
    DAY(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'Quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
GROUP BY 
    DAY(p.dt_pedido);

desc vw_quantidade_vendidos_dia; 
-- view mais vendidos por semana
CREATE OR REPLACE VIEW  vw_quantidade_vendidos_semana
AS
SELECT 
    DATE(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'quantidade Vendida'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
WHERE 
	p.dt_pedido >= CURDATE() - INTERVAL 7 DAY
GROUP BY 
    DATE(p.dt_pedido)
ORDER BY
	DATE(p.dt_pedido);


-- view mais vendidos por tipo de produto
CREATE OR REPLACE VIEW vw_tipo_produto
AS
SELECT
	tp.id_tipo_produto AS id,
    tp.tipo AS Tipo_Produto,
    SUM(pp.qt_produto) AS Quantidade_Vendida
FROM 
    produto_pedido pp
JOIN 
    produto p ON pp.fk_produto = p.id_produto
JOIN 
    tipo_produto tp ON p.fk_tipo_produto = tp.id_tipo_produto
GROUP BY 
    tp.id_tipo_produto
ORDER BY 
    SUM(pp.qt_produto) DESC;

-- views quantidade para grafico de valor vendido por quantidade vendida(Por mês)
CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido 
AS
SELECT
	ROW_NUMBER() OVER (ORDER BY MONTH(p.dt_pedido)) as id_quantidade,
	pr.nome 'nome',
    MONTH(p.dt_pedido) 'mes',
    SUM(pp.qt_produto) 'quantidade vendida',
    SUM(pp.qt_produto * pr.preco) 'valor vendido'
FROM 
    pedido p
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
JOIN 
    produto pr ON pp.fk_produto = pr.id_produto    
AND p.status = 'E'
GROUP BY 
    MONTH(p.dt_pedido),pr.nome
ORDER BY 
     MONTH(p.dt_pedido);
     

-- views quantidade para grafico de valor vendido por quantidade vendida(Por semana)
CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido_semana
AS
SELECT 
	pr.nome 'nome',
    DATE(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'quantidade vendida',
    SUM(pp.qt_produto * pr.preco) 'Valor Vendido'
FROM
    pedido p 
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
JOIN
    produto pr ON pp.fk_produto = pr.id_produto
WHERE 
    p.dt_pedido >= CURDATE() - INTERVAL 7 DAY
GROUP BY
    DATE(p.dt_pedido),pr.nome
ORDER BY
    DATE(p.dt_pedido);


-- view para quantidade vendida por valor vendido por dia
CREATE OR REPLACE VIEW vw_quantidade_vendida_valor_vendido_dia
AS
SELECT 
	pr.nome 'nome',
    DATE(p.dt_pedido) 'dia',
    SUM(pp.qt_produto) 'quantidade vendida',
    SUM(pp.qt_produto * pr.preco) 'Valor Vendido'
FROM
    pedido p 
JOIN 
    produto_pedido pp ON p.id_pedido = pp.fk_pedido
JOIN
    produto pr ON pp.fk_produto = pr.id_produto
WHERE
    p.dt_pedido >= CURDATE() - INTERVAL 1 DAY
GROUP BY 
	p.dt_pedido, pr.nome;
    
    

