USE bd_mise_en_place;
-- tema
SELECT * FROM tipo_produto; -- 1 a 5
-- fk_recheio
SELECT * FROM recheio; -- 1 a 3
-- fk_massa;
SELECT * FROM massa; -- 1 a 3
-- fk_cobertura;
SELECT * FROM cobertura; -- 1 a 3
-- observacoes;
-- qt_produto;
-- fk_produto;
SELECT * FROM produto; -- 1 a 4
-- dt_pedido;
-- vl_pedido;
-- status;
-- valor_sinal;
-- fk_forma_entrega;
SELECT * FROM forma_entrega; -- 1 a 2
-- fk_cliente;
SELECT * FROM cliente; -- 1 a 2
-- fk_forma_pagamento;
SELECT * FROM forma_pagamento; -- 1 a 2

CALL pc_atualiza_pedido('Festa',1,2,3,'com Muito doce de leite',56,1,1,1,CURRENT_DATE(),50.00,'a',25.00,1,1,1);



DELIMITER //

CREATE PROCEDURE gerar_dados_teste()
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
    DECLARE vl_pedido DECIMAL(6,2);
    DECLARE status CHAR(1);
    DECLARE valor_sinal DECIMAL(6,2);
    DECLARE fk_forma_entrega INT;
    DECLARE fk_cliente INT;
    DECLARE fk_forma_pagamento INT;

    WHILE i < 500 DO
        SET tema = CONCAT('Tema ', FLOOR(1 + RAND() * 10)); -- Temas variados
        SET fk_recheio = FLOOR(1 + RAND() * 3); -- 1 a 3
        SET fk_massa = FLOOR(1 + RAND() * 3); -- 1 a 3
        SET fk_cobertura = FLOOR(1 + RAND() * 3); -- 1 a 3
        SET observacoes = CONCAT('Observação ', FLOOR(1 + RAND() * 100)); -- Observações variadas
        SET qt_produto = FLOOR(1 + RAND() * 10); -- Quantidade de produtos entre 1 e 10
        SET fk_produto = FLOOR(1 + RAND() * 4); -- 1 a 4
        SET dt_pedido = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 160) DAY); -- Datas variadas nos últimos 160 dias
        SET vl_pedido = ROUND(RAND() * 100 + 50, 2); -- Valor do pedido entre 50 e 150
        SET status = 'a'; -- Status default
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

call gerar_dados_teste();
