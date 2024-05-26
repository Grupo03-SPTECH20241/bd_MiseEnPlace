DELIMITER $
	CREATE PROCEDURE pc_atualiza_pedido(
    IN 
        tema VARCHAR(45),-- Tabela personalização 
		fk_recheio INT, 
        fk_massa INT,
        fk_cobertura INT,
        observacoes VARCHAR(45), -- tabela produto_pedido
        qt_produto INT,
        fk_produto INT,
        fk_personalizacao INT,
        fk_pedido INT,
        dt_pedido DATE, -- Tabela pedido
        vl_pedido DECIMAL(6,2),
        status CHAR(1),
        valor_sinal DECIMAL(6,2),
        fk_forma_entrega INT,
        fk_cliente INT,
        fk_forma_pagamento INT
    ) BEGIN 
        UPDATE personalizacao AS per
					 SET per.tema = tema, 
					 per.fk_recheio = fk_recheio, 
					 per.fk_massa = fk_massa, 
					 per.fk_cobertura = 
					 per.fk_cobertura 
					 WHERE per.id_personalizacao = fk_personalizacao;
        UPDATE pedido AS p
					 SET p.dt_pedido = dt_pedido, 
                     p.vl_pedido = vl_pedido, 
                     p.status = status, 
                     p.valor_sinal = valor_sinal, 
                     p.fk_forma_entrega = fk_forma_entrega, 
                     p.fk_cliente = fk_cliente, 
                     p.fk_forma_pagamento = fk_forma_pagamento 
                     WHERE p.id_pedido = fk_pedido;
        UPDATE produto_pedido AS pp
					SET pp.observacoes = observacoes, 
                    pp.qt_produto = qt_produto, 
                    pp.fk_produto = fk_produto 
                    WHERE pp.fk_pedido = fk_pedido;
    END
$
DELIMITER $
	USE mise_en_place;
$
DELIMITER $
    CALL pc_atualiza_pedido('Festa',1,2,3,'com Muito doce de leite',56,1,1,1,CURRENT_DATE(),50.00,'a',25.00,1,1,1);
$

DELIMITER $
	DROP PROCEDURE pc_atualiza_pedido;
$

