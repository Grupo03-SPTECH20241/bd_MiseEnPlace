DELIMITER $
CREATE PROCEDURE pc_insercao_pedido_festa(
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
    fk_forma_pagamento INT,
    logradouro VARCHAR(45), -- Tabela endereco
    complemento VARCHAR(45),
    cep CHAR(9),
    numero INT,
    fk_endereco INT
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
    CASE WHEN  ISNULL(fk_endereco)
                            THEN
                            INSERT INTO endereco(logradouro, complemento, cep, numero) 
                                VALUES 
                                (logradouro, complemento, cep, numero);
    
                            INSERT INTO festa(fk_endereco, fk_pedido) 
                                VALUES 
                                ((SELECT id_endereco 
                                    FROM endereco 
                                    ORDER BY id_endereco 
                                    DESC LIMIT 1), (SELECT id_pedido 
                                                    FROM pedido 
                                                    ORDER BY id_pedido 
                                                    DESC LIMIT 1));
                            ELSE INSERT INTO festa(fk_endereco, fk_pedido)
                                VALUES 
                                (fk_endereco, (SELECT id_pedido 
                                                FROM pedido 
                                                ORDER BY id_pedido 
                                                DESC LIMIT 1));
							END CASE;
                            end
$


DELIMITER $
    CALL pc_insercao_pedido_festa('Festa',1,2,3,'Sem açúcar',56,1,CURRENT_DATE(),50.00,'a',25.00,1,1,1,'Rua das Floureeeeees','Casa', '12345-678', 123, NULL);
$

DELIMITER $
	SELECT * FROM endereco;
$

delimiter $
	SELECT * FROM festa;
$

DELIMITER $
	DROP PROCEDURE pc_insercao_pedido_festa;
$

SELECT * FROM produto_pedido AS pp
			JOIN pedido AS p ON pp.fk_pedido = p.id_pedido
            JOIN festa AS f ON p.id_pedido = f.fk_pedido;
USE mise_en_plass;