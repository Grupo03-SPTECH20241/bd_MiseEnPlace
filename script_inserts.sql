USE mise_en_place;
-- Tabela `mydb`.`recheio`
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
INSERT INTO metas (descricao, dt_termino,  dt_inicio) 
VALUES 
    ( 'Meta de Vendas', '2024-12-31',  '2024-01-01');

-- Tabela `mydb`.`usuario`
INSERT INTO usuario (nome,login, senha,logado) 
VALUES 
    ('João','joao@example.com', 'senha123', 1),
    ('Maria','maria@example.com', 'senha456', 0);
    DESC usuario;

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