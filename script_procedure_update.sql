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
        UPDATE personalizacao 
					 SET tema = tema, 
					 fk_recheio = fk_recheio, 
					 fk_massa = fk_massa, 
					 fk_cobertura = 
					 fk_cobertura 
					 WHERE id_personalizacao = fk_personalizacao;
        UPDATE pedido 
					 SET dt_pedido = dt_pedido, 
                     vl_pedido = vl_pedido, 
                     status = status, 
                     valor_sinal = valor_sinal, 
                     fk_forma_entrega = fk_forma_entrega, 
                     fk_cliente = fk_cliente, 
                     fk_forma_pagamento = fk_forma_pagamento 
                     WHERE id_pedido = fk_pedido;
        UPDATE produto_pedido 
					SET observacoes = observacoes, 
                    qt_produto = qt_produto, 
                    fk_produto = fk_produto 
                    WHERE fk_pedido = fk_pedido;
    END
$

DELIMITER $
    CALL pc_atualiza_pedido('Festa',1,2,3,'com Muito doce de leite',56,1,1,1,CURRENT_DATE(),50.00,'a',25.00,1,1,1);
$

select * from pedido WHERE id_pedido = 1;