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

DELIMITER $
	DROP PROCEDURE pc_insercao_pedido;
$

DELIMITER $
	SELECT * FROM pedido JOIN produto_pedido ON pedido.id_pedido = produto_pedido.fk_pedido;
    SELECT * FROM forma_pagamento;
    SELECT * FROM cliente;
    SELECT * FROM pedido;
    
$

delimiter $
DROP PROCEDURE pc_insercao_pedido;
$

use bd_mise_en_place;
delimiter $
	
$
