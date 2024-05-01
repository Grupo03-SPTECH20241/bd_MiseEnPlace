USE mydb;-- Tabela `mydb`.`recheio`
INSERT INTO `mydb`.`recheio` (`id_recheio`, `nome`, `preco`) 
VALUES 
    (1, 'Chocolate', '5.99'),
    (2, 'Baunilha', '4.50'),
    (3, 'Morango', '6.75');

-- Tabela `mydb`.`massa`
INSERT INTO `mydb`.`massa` (`id_massa`, `nome`) 
VALUES 
    (1, 'Chocolate'),
    (2, 'Baunilha'),
    (3, 'Red Velvet');

-- Tabela `mydb`.`cobertura`
INSERT INTO `mydb`.`cobertura` (`id_cobertura`, `nome`) 
VALUES 
    (1, 'Chocolate'),
    (2, 'Creme de Leite'),
    (3, 'Ganache');

-- Tabela `mydb`.`unidade_medida`
INSERT INTO `mydb`.`unidade_medida` (`id_unidade_medida`, `unidade_medida`) 
VALUES 
    (1, 'Unidade'),
    (2, 'Gramas'),
    (3, 'Litros');

-- Tabela `mydb`.`tipo_produto`
INSERT INTO `mydb`.`tipo_produto` (`id_tipo_produto`, `tipo`) 
VALUES 
    (1, 'Bolo'),
    (2, 'Doces'),
    (3, 'Salgados');

-- Tabela `mydb`.`forma_entrega`
INSERT INTO `mydb`.`forma_entrega` (`id_forma_entrega`, `Forma de entrega`) 
VALUES 
    (1, 'Retirada'),
    (2, 'Entrega');

-- Tabela `mydb`.`cliente`
INSERT INTO `mydb`.`cliente` (`id_cliente`, `nome`, `numero`) 
VALUES 
    (1, 'João', '12345678901'),
    (2, 'Maria', '98765432109');

-- Tabela `mydb`.`forma_pagamento`
INSERT INTO `mydb`.`forma_pagamento` (`idForma_pagamento`, `nome`) 
VALUES 
    (1, 'Cartão de Crédito'),
    (2, 'Dinheiro');

-- Tabela `mydb`.`pedido`
INSERT INTO `mydb`.`pedido` (`idPedido`, `dt_pedido`, `vl_pedido`, `status`, `valor_sinal`, `fk_forma_entrega`, `fk_cliente`, `fk_forma_pagamento`) 
VALUES 
    (1, '2024-04-30', '50.00', 'P', '20.00', 1, 1, 1),
    (2, '2024-04-29', '100.00', 'A', '30.00', 2, 2, 2);
   
-- Tabela `mydb`.`metas`
INSERT INTO `mydb`.`metas` (`idMeta`, `descricao`, `dt_termino`, `quantidade`, `dt_inicio`) 
VALUES 
    (1, 'Meta de Vendas', '2024-12-31', 1000, '2024-01-01');

-- Tabela `mydb`.`usuario`
INSERT INTO `mydb`.`usuario` (`idUsuario`, `email`, `senha`, `logado`) 
VALUES 
    (1, 'joao@example.com', 'senha123', 1),
    (2, 'maria@example.com', 'senha456', 0);

-- Tabela `mydb`.`personalizacao`
INSERT INTO `mydb`.`personalizacao` (`id_personalizacao`, `tema`, `fk_recheio`, `fk_massa`, `fk_cobertura`) 
VALUES 
    (1, 'Aniversário', 1, 2, 3),
    (2, 'Casamento', 2, 1, 2);

-- Tabela `mydb`.`produto_pedido`
INSERT INTO `mydb`.`produto_pedido` (`observacoes`, `qt_produto`, `id_produto_pedido`, `fk_produto`, `fk_personalizacao`, `fk_pedido`) 
VALUES 
    ('Sem açúcar', 1, 1, 1, 1, 1),
    ('Com recheio duplo', 2, 2, 2, 2, 2);

-- Tabela `mydb`.`endereco`
INSERT INTO `mydb`.`endereco` (`id_endereco`, `logradouro`, `complemento`, `cep`, `numero`) 
VALUES 
    (1, 'Rua A', 'Apto 101', '12345-678', '123'),
    (2, 'Rua B', 'Casa', '98765-432', '456');

-- Tabela `mydb`.`festa`
INSERT INTO `mydb`.`festa` (`idfesta`, `fk_endereco`, `pedido_idPedido`) 
VALUES 
    (1, 1, 1),
    (2, 2, 2);
-- Inserindo valores na tabela produto
INSERT INTO `mydb`.`produto` (`idProduto`, `nome`, `preco`, `descricao`, `foto`, `qtd_disponivel`, `fk_recheio`, `fk_massa`, `fk_cobertura`, `fk_unidade_medida`, `fk_tipo_produto`) 
VALUES 
    (1, 'Bolo de Chocolate', 30.00, 'Delicioso bolo de chocolate', 'bolo_chocolate.jpg', 10, 1, 1, 1, 1, 1),
    (2, 'Bolo de Baunilha', 25.00, 'Bolo de baunilha simples e delicioso', 'bolo_baunilha.jpg', 15, 2, 2, 1, 1, 1),
    (3, 'Brigadeiro', 2.50, 'Doce de brigadeiro tradicional', 'brigadeiro.jpg', 100, 1, 1, 1, 1, 2),
    (4, 'Coxinha', 3.00, 'Coxinha de frango', 'coxinha.jpg', 50, 1, 1, 1, 1, 3);

